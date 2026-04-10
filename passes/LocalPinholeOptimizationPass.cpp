#include <llvm/ADT/APInt.h>
#include <llvm/Config/llvm-config.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/PassPlugin.h>

#include <vector>

namespace {

// 方案：
// 1. 先做一个最小但稳定的模式库：专门识别 (X << C) >> C；
// 2. 当左右移位量一致且都是逻辑移位时，把它化成一次按位与；
// 3. 这种局部替换天然适合 BasicBlock 粒度，并且非常容易通过文本回归测试验证。
class LocalPinholeOptimizationPass : public llvm::PassInfoMixin<LocalPinholeOptimizationPass> {
public:
    llvm::PreservedAnalyses run(llvm::Function& function, llvm::FunctionAnalysisManager&) {
        std::vector<llvm::Instruction*> worklist;
        for (llvm::BasicBlock& block : function) {
            for (llvm::Instruction& instruction : block) {
                worklist.push_back(&instruction);
            }
        }

        bool changed = false;
        for (llvm::Instruction* instruction : worklist) {
            if (instruction->getParent() == nullptr) {
                continue;
            }
            changed = tryFold(*instruction) || changed;
        }

        return changed ? llvm::PreservedAnalyses::none() : llvm::PreservedAnalyses::all();
    }

private:
    static bool tryFold(llvm::Instruction& instruction) {
        auto* shiftRight = llvm::dyn_cast<llvm::BinaryOperator>(&instruction);
        if (shiftRight == nullptr || shiftRight->getOpcode() != llvm::Instruction::LShr) {
            return false;
        }

        auto* shiftLeft = llvm::dyn_cast<llvm::BinaryOperator>(shiftRight->getOperand(0));
        auto* leftAmount = llvm::dyn_cast<llvm::ConstantInt>(shiftLeft == nullptr ? nullptr : shiftLeft->getOperand(1));
        auto* rightAmount = llvm::dyn_cast<llvm::ConstantInt>(shiftRight->getOperand(1));
        if (shiftLeft == nullptr || shiftLeft->getOpcode() != llvm::Instruction::Shl ||
            leftAmount == nullptr || rightAmount == nullptr) {
            return false;
        }

        if (leftAmount->getValue() != rightAmount->getValue()) {
            return false;
        }

        auto* integerType = llvm::dyn_cast<llvm::IntegerType>(shiftRight->getType());
        if (integerType == nullptr) {
            return false;
        }

        const unsigned int bitWidth = integerType->getBitWidth();
        const uint64_t shiftAmount = rightAmount->getZExtValue();
        if (shiftAmount >= bitWidth) {
            return false;
        }

        const llvm::APInt mask = llvm::APInt::getLowBitsSet(bitWidth, bitWidth - shiftAmount);
        llvm::IRBuilder<> builder(shiftRight);
        llvm::Value* replacement = builder.CreateAnd(
            shiftLeft->getOperand(0),
            llvm::ConstantInt::get(integerType, mask),
            "pinhole.mask");

        shiftRight->replaceAllUsesWith(replacement);
        shiftRight->eraseFromParent();
        if (shiftLeft->use_empty()) {
            shiftLeft->eraseFromParent();
        }
        return true;
    }
};

}  // namespace

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return {
        LLVM_PLUGIN_API_VERSION,
        "LocalPinholeOptimizationPass",
        LLVM_VERSION_STRING,
        [](llvm::PassBuilder& passBuilder) {
            passBuilder.registerPipelineParsingCallback(
                [](llvm::StringRef name,
                   llvm::FunctionPassManager& functionPassManager,
                   llvm::ArrayRef<llvm::PassBuilder::PipelineElement>) {
                    if (name != "local-pinhole-optimization") {
                        return false;
                    }

                    functionPassManager.addPass(LocalPinholeOptimizationPass());
                    return true;
                });
        }
    };
}
