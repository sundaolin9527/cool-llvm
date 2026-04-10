#include <llvm/ADT/DenseSet.h>
#include <llvm/Config/llvm-config.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Metadata.h>
#include <llvm/IR/Module.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/PassPlugin.h>

#include <algorithm>

namespace {

// 方案：
// 1. 真正的 MachineFunctionPass 发生在指令选择之后，而当前仓库的测试链路停在 opt/LLVM IR；
// 2. 因此这里实现一个“后端前置探测器”：用 IR 级活跃 SSA 数量近似寄存器压力；
// 3. 一旦某个函数的峰值活跃整数值超过阈值，就把告警写入命名元数据，便于文本测试稳定校验。
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

    static bool isTrackableValue(const llvm::Value& value) {
        return value.getType()->isIntegerTy() && !llvm::isa<llvm::Constant>(value);
    }

    static unsigned int estimatePeakLiveValues(const llvm::Function& function) {
        unsigned int peak = 0;
        for (const llvm::BasicBlock& block : function) {
            llvm::DenseSet<const llvm::Value*> liveValues;
            for (auto iterator = block.rbegin(); iterator != block.rend(); ++iterator) {
                const llvm::Instruction& instruction = *iterator;
                if (isTrackableValue(instruction)) {
                    liveValues.erase(&instruction);
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
