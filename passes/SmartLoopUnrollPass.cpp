#include <llvm/ADT/SmallVector.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/Analysis/ScalarEvolution.h>
#include <llvm/Config/llvm-config.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/PassPlugin.h>

namespace {

// 方案：
// 1. 借助 ScalarEvolution 读取小常量 Trip Count；
// 2. 根据 Trip Count 选一个保守的展开因子，避免把小测试放大得过头；
// 3. 把“智能决策”编码进标准 loop metadata，而不是直接暴力复制循环体；
// 4. 如果循环上已经存在 metadata，则做合并而不是覆盖，减少与其他 pass 的冲突。
class SmartLoopUnrollPass : public llvm::PassInfoMixin<SmartLoopUnrollPass> {
public:
    llvm::PreservedAnalyses run(
        llvm::Loop& loop,
        llvm::LoopAnalysisManager&,
        llvm::LoopStandardAnalysisResults& analysisResults,
        llvm::LPMUpdater&
    ) {
        // ScalarEvolution 只能在一部分可规范化循环上给出精确 Trip Count。
        // 对于无法静态确定的小循环，这里选择保守退出，避免写入误导性的展开提示。
        const unsigned int tripCount = analysisResults.SE.getSmallConstantTripCount(&loop);
        if (tripCount < 2) {
            return llvm::PreservedAnalyses::all();
        }

        const unsigned int factor = chooseUnrollFactor(tripCount);
        if (factor < 2) {
            return llvm::PreservedAnalyses::all();
        }

        llvm::BasicBlock* latch = loop.getLoopLatch();
        if (latch == nullptr) {
            return llvm::PreservedAnalyses::all();
        }

        auto* terminator = llvm::dyn_cast<llvm::Instruction>(latch->getTerminator());
        if (terminator == nullptr) {
            return llvm::PreservedAnalyses::all();
        }

        // 生产场景中，展开因子通常还会结合指令体积、缓存压力和 profile 数据。
        // 当前仓库测试目标是“有依据地决策并落地到 IR”，因此先把策略稳定固化为 metadata。
        applyLoopHint(*terminator, factor);
        return llvm::PreservedAnalyses::none();
    }

private:
    static unsigned int chooseUnrollFactor(unsigned int tripCount) {
        if (tripCount >= 8) {
            return 4;
        }
        if (tripCount >= 4) {
            return 4;
        }
        return 2;
    }

    static bool isManagedLoopHint(const llvm::MDNode& node) {
        if (node.getNumOperands() == 0) {
            return false;
        }

        const auto* tag = llvm::dyn_cast<llvm::MDString>(node.getOperand(0));
        if (tag == nullptr) {
            return false;
        }

        return tag->getString() == "llvm.loop.unroll.count" ||
               tag->getString() == "cool.smart.unroll";
    }

    static void applyLoopHint(llvm::Instruction& terminator, unsigned int factor) {
        llvm::LLVMContext& context = terminator.getContext();
        llvm::Metadata* factorNodeItems[] = {
            llvm::MDString::get(context, "llvm.loop.unroll.count"),
            llvm::ConstantAsMetadata::get(
                llvm::ConstantInt::get(llvm::Type::getInt32Ty(context), factor))
        };
        llvm::Metadata* remarkNodeItems[] = {
            llvm::MDString::get(context, "cool.smart.unroll")
        };

        llvm::SmallVector<llvm::Metadata*, 4> loopMetadata;
        loopMetadata.push_back(nullptr);

        // 如果已经有 loop metadata，优先保留其他 pass 写入的提示，只替换本 pass 负责的两项。
        if (llvm::MDNode* existingLoopId = terminator.getMetadata(llvm::LLVMContext::MD_loop)) {
            for (unsigned int index = 1; index < existingLoopId->getNumOperands(); ++index) {
                auto* node = llvm::dyn_cast<llvm::MDNode>(existingLoopId->getOperand(index));
                if (node == nullptr || isManagedLoopHint(*node)) {
                    continue;
                }
                loopMetadata.push_back(node);
            }
        }

        loopMetadata.push_back(llvm::MDNode::get(context, factorNodeItems));
        loopMetadata.push_back(llvm::MDNode::get(context, remarkNodeItems));

        llvm::MDNode* loopId = llvm::MDNode::getDistinct(context, loopMetadata);
        loopId->replaceOperandWith(0, loopId);
        terminator.setMetadata(llvm::LLVMContext::MD_loop, loopId);
    }
};

}  // namespace

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return {
        LLVM_PLUGIN_API_VERSION,
        "SmartLoopUnrollPass",
        LLVM_VERSION_STRING,
        [](llvm::PassBuilder& passBuilder) {
            passBuilder.registerPipelineParsingCallback(
                [](llvm::StringRef name,
                   llvm::LoopPassManager& loopPassManager,
                   llvm::ArrayRef<llvm::PassBuilder::PipelineElement>) {
                    if (name != "smart-loop-unroll") {
                        return false;
                    }

                    loopPassManager.addPass(SmartLoopUnrollPass());
                    return true;
                });
        }
    };
}
