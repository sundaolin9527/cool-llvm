#include <llvm/ADT/DenseSet.h>
#include <llvm/Config/llvm-config.h>
#include <llvm/IR/CFG.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Metadata.h>
#include <llvm/IR/Module.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/PassPlugin.h>

#include <algorithm>
#include <unordered_map>
#include <unordered_set>

namespace {

// 方案：
// 1. 真正的 MachineFunctionPass 发生在指令选择之后，而当前仓库的测试链路停在 opt/LLVM IR；
// 2. 因此这里实现一个“后端前置探测器”：用 IR 级活跃 SSA 数量近似寄存器压力；
// 3. 这里不再只看单个基本块内部，而是补成跨 CFG 的近似活跃度数据流；
// 4. 一旦某个函数的峰值活跃整数值超过阈值，就把告警写入命名元数据，便于文本测试稳定校验。
class RegSpillDetectorPass : public llvm::PassInfoMixin<RegSpillDetectorPass> {
public:
    llvm::PreservedAnalyses run(llvm::Module& module, llvm::ModuleAnalysisManager&) {
        if (llvm::NamedMDNode* existing = module.getNamedMetadata("cool.reg.spill.detector")) {
            module.eraseNamedMetadata(existing);
        }

        llvm::LLVMContext& context = module.getContext();
        llvm::NamedMDNode* report = nullptr;

        bool changed = false;
        for (llvm::Function& function : module) {
            if (function.isDeclaration()) {
                continue;
            }

            const unsigned int peakLiveValues = estimatePeakLiveValues(function);
            if (peakLiveValues <= kSpillThreshold) {
                continue;
            }

            if (report == nullptr) {
                report = module.getOrInsertNamedMetadata("cool.reg.spill.detector");
            }

            llvm::Metadata* items[] = {
                llvm::MDString::get(context, function.getName()),
                llvm::ConstantAsMetadata::get(
                    llvm::ConstantInt::get(llvm::Type::getInt32Ty(context), peakLiveValues)),
                llvm::ConstantAsMetadata::get(
                    llvm::ConstantInt::get(llvm::Type::getInt32Ty(context), kSpillThreshold))
            };
            report->addOperand(llvm::MDNode::get(context, items));
            changed = true;
        }

        return changed ? llvm::PreservedAnalyses::none() : llvm::PreservedAnalyses::all();
    }

private:
    static constexpr unsigned int kSpillThreshold = 4;
    using ValueSet = std::unordered_set<const llvm::Value*>;

    struct BlockLivenessSummary {
        ValueSet uses;
        ValueSet defs;
    };

    static bool isTrackableValue(const llvm::Value& value) {
        return value.getType()->isIntegerTy() && !llvm::isa<llvm::Constant>(value);
    }

    static void unionInto(ValueSet& destination, const ValueSet& source) {
        destination.insert(source.begin(), source.end());
    }

    static ValueSet subtractSet(const ValueSet& lhs, const ValueSet& rhs) {
        ValueSet result;
        for (const llvm::Value* value : lhs) {
            if (rhs.count(value) == 0) {
                result.insert(value);
            }
        }
        return result;
    }

    static ValueSet collectPhiIncomingUses(const llvm::BasicBlock& predecessor, const llvm::BasicBlock& successor) {
        ValueSet edgeUses;
        for (const llvm::Instruction& instruction : successor) {
            const auto* phi = llvm::dyn_cast<llvm::PHINode>(&instruction);
            if (phi == nullptr) {
                break;
            }

            const llvm::Value* incoming = phi->getIncomingValueForBlock(&predecessor);
            if (incoming != nullptr && isTrackableValue(*incoming)) {
                edgeUses.insert(incoming);
            }
        }
        return edgeUses;
    }

    static BlockLivenessSummary summarizeBlock(const llvm::BasicBlock& block) {
        BlockLivenessSummary summary;
        for (const llvm::Instruction& instruction : block) {
            if (const auto* phi = llvm::dyn_cast<llvm::PHINode>(&instruction)) {
                if (isTrackableValue(*phi)) {
                    summary.defs.insert(phi);
                }
                continue;
            }

            for (const llvm::Use& use : instruction.operands()) {
                const llvm::Value* operand = use.get();
                if (operand == nullptr || !isTrackableValue(*operand) || summary.defs.count(operand) != 0) {
                    continue;
                }
                summary.uses.insert(operand);
            }

            if (isTrackableValue(instruction)) {
                summary.defs.insert(&instruction);
            }
        }
        return summary;
    }

    static unsigned int estimatePeakLiveValues(const llvm::Function& function) {
        std::unordered_map<const llvm::BasicBlock*, BlockLivenessSummary> summaries;
        std::unordered_map<const llvm::BasicBlock*, ValueSet> liveIn;
        std::unordered_map<const llvm::BasicBlock*, ValueSet> liveOut;

        for (const llvm::BasicBlock& block : function) {
            summaries.emplace(&block, summarizeBlock(block));
        }

        bool changed = false;
        do {
            changed = false;
            for (auto blockIterator = function.rbegin(); blockIterator != function.rend(); ++blockIterator) {
                const llvm::BasicBlock& block = *blockIterator;
                ValueSet nextLiveOut;

                for (const llvm::BasicBlock* successor : llvm::successors(&block)) {
                    unionInto(nextLiveOut, liveIn[successor]);
                    unionInto(nextLiveOut, collectPhiIncomingUses(block, *successor));
                }

                ValueSet nextLiveIn = summaries[&block].uses;
                unionInto(nextLiveIn, subtractSet(nextLiveOut, summaries[&block].defs));

                if (nextLiveOut != liveOut[&block] || nextLiveIn != liveIn[&block]) {
                    liveOut[&block] = std::move(nextLiveOut);
                    liveIn[&block] = std::move(nextLiveIn);
                    changed = true;
                }
            }
        } while (changed);

        unsigned int peak = 0;
        for (const llvm::BasicBlock& block : function) {
            ValueSet liveValues = liveOut[&block];
            peak = std::max<unsigned int>(peak, static_cast<unsigned int>(liveValues.size()));

            for (auto iterator = block.rbegin(); iterator != block.rend(); ++iterator) {
                const llvm::Instruction& instruction = *iterator;
                if (isTrackableValue(instruction)) {
                    liveValues.erase(&instruction);
                }

                // PHI 的 use 发生在前驱边上，不属于当前块内部逆向扫描的“本地 use”。
                if (llvm::isa<llvm::PHINode>(instruction)) {
                    peak = std::max<unsigned int>(peak, static_cast<unsigned int>(liveValues.size()));
                    continue;
                }

                for (const llvm::Use& use : instruction.operands()) {
                    const llvm::Value* operand = use.get();
                    if (operand != nullptr && isTrackableValue(*operand)) {
                        liveValues.insert(operand);
                    }
                }

                peak = std::max<unsigned int>(peak, static_cast<unsigned int>(liveValues.size()));
            }
        }
        return peak;
    }
};

}  // namespace

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return {
        LLVM_PLUGIN_API_VERSION,
        "RegSpillDetectorPass",
        LLVM_VERSION_STRING,
        [](llvm::PassBuilder& passBuilder) {
            passBuilder.registerPipelineParsingCallback(
                [](llvm::StringRef name,
                   llvm::ModulePassManager& modulePassManager,
                   llvm::ArrayRef<llvm::PassBuilder::PipelineElement>) {
                    if (name != "reg-spill-detector") {
                        return false;
                    }

                    modulePassManager.addPass(RegSpillDetectorPass());
                    return true;
                });
        }
    };
}
