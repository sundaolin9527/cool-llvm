#include <llvm/ADT/SmallVector.h>
#include <llvm/Analysis/ScalarEvolution.h>
#include <llvm/Config/llvm-config.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/PassPlugin.h>

namespace {

// 方案：
// 1. 借助 ScalarEvolution 读取小常量 Trip Count；
// 2. 根据 Trip Count 选一个保守的展开因子，避免把小测试放大得过头；
// 3. 当前实现先把“智能决策”编码进标准 loop metadata，后续可无缝接到真正的展开器。
class SmartLoopUnrollPass : public llvm::PassInfoMixin<SmartLoopUnrollPass> {
public:
    llvm::PreservedAnalyses run(
        llvm::Loop& loop,
        llvm::LoopAnalysisManager&,
        llvm::LoopStandardAnalysisResults& analysisResults,
        llvm::LPMUpdater&
    ) {
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
