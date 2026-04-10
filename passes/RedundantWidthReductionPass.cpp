#include <llvm/Config/llvm-config.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/PassPlugin.h>

#include <vector>

namespace {

// 方案：
// 1. 针对最稳定的“扩宽计算 -> 截断回原位宽”模式做缩宽；
// 2. 只有在两个操作数都来自同一窄位宽的 zext/sext，并且结果马上被 trunc 回去时才改写；
// 3. 这样虽然比完整活跃位域分析保守，但很容易验证正确性，也便于用最小样例驱动。
class RedundantWidthReductionPass : public llvm::PassInfoMixin<RedundantWidthReductionPass> {
public:
    llvm::PreservedAnalyses run(llvm::Function& function, llvm::FunctionAnalysisManager&) {
        std::vector<llvm::TruncInst*> worklist;
        for (llvm::BasicBlock& block : function) {
            for (llvm::Instruction& instruction : block) {
                if (auto* trunc = llvm::dyn_cast<llvm::TruncInst>(&instruction)) {
                    worklist.push_back(trunc);
                }
            }
        }

        bool changed = false;
        for (llvm::TruncInst* trunc : worklist) {
            changed = tryReduce(*trunc) || changed;
        }

        return changed ? llvm::PreservedAnalyses::none() : llvm::PreservedAnalyses::all();
    }

private:
    static bool isSupportedOpcode(unsigned int opcode) {
        switch (opcode) {
        case llvm::Instruction::Add:
        case llvm::Instruction::Sub:
        case llvm::Instruction::Mul:
        case llvm::Instruction::And:
        case llvm::Instruction::Or:
        case llvm::Instruction::Xor:
            return true;
        default:
            return false;
        }
    }

    static bool tryReduce(llvm::TruncInst& trunc) {
        auto* wideOp = llvm::dyn_cast<llvm::BinaryOperator>(trunc.getOperand(0));
        if (wideOp == nullptr || !wideOp->hasOneUse() || !isSupportedOpcode(wideOp->getOpcode())) {
            return false;
        }

        auto* leftCast = llvm::dyn_cast<llvm::CastInst>(wideOp->getOperand(0));
        auto* rightCast = llvm::dyn_cast<llvm::CastInst>(wideOp->getOperand(1));
        if (leftCast == nullptr || rightCast == nullptr) {
            return false;
        }

        if (!leftCast->isIntegerCast() || !rightCast->isIntegerCast()) {
            return false;
        }
        if (leftCast->getOpcode() != rightCast->getOpcode()) {
            return false;
        }

        llvm::Type* narrowType = trunc.getType();
        if (leftCast->getSrcTy() != narrowType || rightCast->getSrcTy() != narrowType) {
            return false;
        }
        if (leftCast->getDestTy() != wideOp->getType() || rightCast->getDestTy() != wideOp->getType()) {
            return false;
        }

        llvm::IRBuilder<> builder(wideOp);
        llvm::Value* reduced = builder.CreateBinOp(
            wideOp->getOpcode(),
            leftCast->getOperand(0),
            rightCast->getOperand(0),
            wideOp->getName() + ".narrow");

        if (auto* reducedOp = llvm::dyn_cast<llvm::BinaryOperator>(reduced)) {
            reducedOp->copyIRFlags(wideOp);
        }

        trunc.replaceAllUsesWith(reduced);
        trunc.eraseFromParent();

        if (wideOp->use_empty()) {
            wideOp->eraseFromParent();
        }
        if (leftCast->use_empty()) {
            leftCast->eraseFromParent();
        }
        if (rightCast != leftCast && rightCast->use_empty()) {
            rightCast->eraseFromParent();
        }
        return true;
    }
};

}  // namespace

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return {
        LLVM_PLUGIN_API_VERSION,
        "RedundantWidthReductionPass",
        LLVM_VERSION_STRING,
        [](llvm::PassBuilder& passBuilder) {
            passBuilder.registerPipelineParsingCallback(
                [](llvm::StringRef name,
                   llvm::FunctionPassManager& functionPassManager,
                   llvm::ArrayRef<llvm::PassBuilder::PipelineElement>) {
                    if (name != "redundant-width-reduction") {
                        return false;
                    }

                    functionPassManager.addPass(RedundantWidthReductionPass());
                    return true;
                });
        }
    };
}
