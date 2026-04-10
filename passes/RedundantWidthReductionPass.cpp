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
// 3. 把“是否可缩宽”的判断拆成独立匹配步骤，便于后续扩展到 PHI、icmp 等更复杂指令；
// 4. 这样虽然比完整活跃位域分析保守，但能在稳定性和可维护性之间保持平衡。
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

    static llvm::CastInst* matchReducibleCast(llvm::Value* value, llvm::Type* narrowType, llvm::Type* wideType) {
        auto* cast = llvm::dyn_cast<llvm::CastInst>(value);
        if (cast == nullptr || !cast->isIntegerCast()) {
            return nullptr;
        }

        if (cast->getSrcTy() != narrowType || cast->getDestTy() != wideType) {
            return nullptr;
        }
        return cast;
    }

    static bool tryReduce(llvm::TruncInst& trunc) {
        auto* wideOp = llvm::dyn_cast<llvm::BinaryOperator>(trunc.getOperand(0));
        if (wideOp == nullptr || !wideOp->hasOneUse() || !isSupportedOpcode(wideOp->getOpcode())) {
            return false;
        }

        llvm::Type* narrowType = trunc.getType();
        auto* leftCast = matchReducibleCast(wideOp->getOperand(0), narrowType, wideOp->getType());
        auto* rightCast = matchReducibleCast(wideOp->getOperand(1), narrowType, wideOp->getType());
        if (leftCast == nullptr || rightCast == nullptr) {
            return false;
        }
        if (leftCast->getOpcode() != rightCast->getOpcode()) {
            return false;
        }

        llvm::IRBuilder<> builder(wideOp);
        llvm::Value* reduced = builder.CreateBinOp(
            wideOp->getOpcode(),
            leftCast->getOperand(0),
            rightCast->getOperand(0),
            wideOp->getName() + ".narrow");

        if (auto* reducedOp = llvm::dyn_cast<llvm::BinaryOperator>(reduced)) {
            // IR flag 例如 `nsw/nuw/exact` 会影响后续优化，缩宽后应尽量继承。
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
