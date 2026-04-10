#include <llvm/Analysis/LazyCallGraph.h>
#include <llvm/Config/llvm-config.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/PassPlugin.h>

namespace {

// 方案：
// 1. 以 CGSCC 为遍历单位，保证调用图顺序和递归场景的处理入口是正确的；
// 2. 仅在“所有直接调用点都为同一个常量实参”时，把该形参替换成常量；
// 3. 对地址逃逸、间接调用、无调用点和 poison/undef 常量保持保守，优先保证稳定性；
// 4. 传播时不修改函数签名，只在函数体内做 SSA 替换，避免 CGSCC 更新成本失控。
class InterProceduralConstantPropPass
    : public llvm::PassInfoMixin<InterProceduralConstantPropPass> {
public:
    llvm::PreservedAnalyses run(
        llvm::LazyCallGraph::SCC& scc,
        llvm::CGSCCAnalysisManager&,
        llvm::LazyCallGraph&,
        llvm::CGSCCUpdateResult&
    ) {
        bool changed = false;
        for (llvm::LazyCallGraph::Node& node : scc) {
            llvm::Function& function = node.getFunction();
            if (function.isDeclaration() || function.isVarArg()) {
                continue;
            }
            changed = propagateConstants(function) || changed;
        }

        return changed ? llvm::PreservedAnalyses::none() : llvm::PreservedAnalyses::all();
    }

private:
    static bool isEligibleFunction(const llvm::Function& function) {
        return !function.isDeclaration() &&
               !function.isVarArg() &&
               !function.hasAddressTaken();
    }

    static bool propagateConstants(llvm::Function& function) {
        bool changed = false;
        for (llvm::Argument& argument : function.args()) {
            if (argument.use_empty()) {
                continue;
            }

            llvm::Constant* constant = findSingleConstantArgument(function, argument.getArgNo());
            if (constant == nullptr) {
                continue;
            }

            // 只在函数体内替换 SSA use，不触碰调用点参数列表。
            argument.replaceAllUsesWith(constant);
            changed = true;
        }
        return changed;
    }

    static llvm::Constant* findSingleConstantArgument(llvm::Function& function, unsigned int argumentIndex) {
        if (!isEligibleFunction(function)) {
            return nullptr;
        }

        llvm::Constant* sharedConstant = nullptr;
        llvm::SmallVector<llvm::CallBase*, 8> directCalls;

        for (llvm::User* user : function.users()) {
            auto* call = llvm::dyn_cast<llvm::CallBase>(user);
            if (call == nullptr) {
                return nullptr;
            }

            llvm::Value* callee = call->getCalledOperand()->stripPointerCasts();
            if (callee != &function) {
                return nullptr;
            }
            if (call->arg_size() <= argumentIndex) {
                return nullptr;
            }

            auto* constant = llvm::dyn_cast<llvm::Constant>(call->getArgOperand(argumentIndex));
            if (constant == nullptr || llvm::isa<llvm::UndefValue>(constant) || llvm::isa<llvm::PoisonValue>(constant)) {
                return nullptr;
            }

            if (sharedConstant == nullptr) {
                sharedConstant = constant;
            } else if (sharedConstant != constant) {
                return nullptr;
            }

            directCalls.push_back(call);
        }

        return directCalls.empty() ? nullptr : sharedConstant;
    }
};

}  // namespace

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return {
        LLVM_PLUGIN_API_VERSION,
        "InterProceduralConstantPropPass",
        LLVM_VERSION_STRING,
        [](llvm::PassBuilder& passBuilder) {
            passBuilder.registerPipelineParsingCallback(
                [](llvm::StringRef name,
                   llvm::CGSCCPassManager& cgsccPassManager,
                   llvm::ArrayRef<llvm::PassBuilder::PipelineElement>) {
                    if (name != "interprocedural-constant-prop") {
                        return false;
                    }

                    cgsccPassManager.addPass(InterProceduralConstantPropPass());
                    return true;
                });
        }
    };
}
