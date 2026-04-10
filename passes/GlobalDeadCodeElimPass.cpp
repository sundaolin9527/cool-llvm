#include <llvm/Config/llvm-config.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/GlobalAlias.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/Module.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/PassPlugin.h>

#include <unordered_set>
#include <vector>

namespace {

// 方案：
// 1. 先把外部可见符号、LLVM 保留符号和 @llvm.used 中出现的实体当作根集合保护起来；
// 2. 再做一个迭代删除：只要某个本地符号已经没有任何使用点，就直接删除；
// 3. 由于删除会级联减少其他全局对象的 use 数，这种简单迭代就能稳定清掉最小测试里的整片死代码。
class GlobalDeadCodeElimPass : public llvm::PassInfoMixin<GlobalDeadCodeElimPass> {
public:
    llvm::PreservedAnalyses run(llvm::Module& module, llvm::ModuleAnalysisManager&) {
        std::unordered_set<const llvm::GlobalValue*> protectedValues;
        collectProtectedValues(module, protectedValues);

        bool changed = false;
        bool localChange = false;
        do {
            localChange = eraseUnusedAliases(module, protectedValues);
            localChange = eraseUnusedFunctions(module, protectedValues) || localChange;
            localChange = eraseUnusedGlobals(module, protectedValues) || localChange;
            changed = changed || localChange;
        } while (localChange);

        return changed ? llvm::PreservedAnalyses::none() : llvm::PreservedAnalyses::all();
    }

private:
    static void collectProtectedValues(
        llvm::Module& module,
        std::unordered_set<const llvm::GlobalValue*>& protectedValues
    ) {
        for (llvm::GlobalValue& globalValue : module.global_values()) {
            if (!globalValue.hasLocalLinkage() || globalValue.getName().starts_with("llvm.")) {
                protectedValues.insert(&globalValue);
            }
        }

        collectLLVMUsed(module, "llvm.used", protectedValues);
        collectLLVMUsed(module, "llvm.compiler.used", protectedValues);
    }

    static void collectLLVMUsed(
        llvm::Module& module,
        llvm::StringRef name,
        std::unordered_set<const llvm::GlobalValue*>& protectedValues
    ) {
        llvm::GlobalVariable* used = module.getNamedGlobal(name);
        if (used == nullptr || !used->hasInitializer()) {
            return;
        }

        auto* array = llvm::dyn_cast<llvm::ConstantArray>(used->getInitializer());
        if (array == nullptr) {
            return;
        }

        for (llvm::Value* operand : array->operands()) {
            const llvm::Value* current = operand;
            while (auto* expr = llvm::dyn_cast<llvm::ConstantExpr>(current)) {
                current = expr->getOperand(0);
            }

            if (const auto* globalValue = llvm::dyn_cast<llvm::GlobalValue>(current)) {
                protectedValues.insert(globalValue);
            }
        }
    }

    static bool canErase(const llvm::GlobalValue& globalValue, const std::unordered_set<const llvm::GlobalValue*>& protectedValues) {
        return globalValue.hasLocalLinkage() &&
               !globalValue.getName().starts_with("llvm.") &&
               protectedValues.count(&globalValue) == 0 &&
               globalValue.use_empty();
    }

    static bool eraseUnusedAliases(
        llvm::Module& module,
        const std::unordered_set<const llvm::GlobalValue*>& protectedValues
    ) {
        std::vector<llvm::GlobalAlias*> toErase;
        for (llvm::GlobalAlias& alias : module.aliases()) {
            if (canErase(alias, protectedValues)) {
                toErase.push_back(&alias);
            }
        }

        for (llvm::GlobalAlias* alias : toErase) {
            alias->eraseFromParent();
        }
        return !toErase.empty();
    }

    static bool eraseUnusedFunctions(
        llvm::Module& module,
        const std::unordered_set<const llvm::GlobalValue*>& protectedValues
    ) {
        std::vector<llvm::Function*> toErase;
        for (llvm::Function& function : module) {
            if (function.isDeclaration()) {
                continue;
            }
            if (canErase(function, protectedValues)) {
                toErase.push_back(&function);
            }
        }

        for (llvm::Function* function : toErase) {
            function->eraseFromParent();
        }
        return !toErase.empty();
    }

    static bool eraseUnusedGlobals(
        llvm::Module& module,
        const std::unordered_set<const llvm::GlobalValue*>& protectedValues
    ) {
        std::vector<llvm::GlobalVariable*> toErase;
        for (llvm::GlobalVariable& global : module.globals()) {
            if (global.isDeclaration()) {
                continue;
            }
            if (canErase(global, protectedValues)) {
                toErase.push_back(&global);
            }
        }

        for (llvm::GlobalVariable* global : toErase) {
            global->eraseFromParent();
        }
        return !toErase.empty();
    }
};

}  // namespace

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return {
        LLVM_PLUGIN_API_VERSION,
        "GlobalDeadCodeElimPass",
        LLVM_VERSION_STRING,
        [](llvm::PassBuilder& passBuilder) {
            passBuilder.registerPipelineParsingCallback(
                [](llvm::StringRef name,
                   llvm::ModulePassManager& modulePassManager,
                   llvm::ArrayRef<llvm::PassBuilder::PipelineElement>) {
                    if (name != "global-dead-code-elim") {
                        return false;
                    }

                    modulePassManager.addPass(GlobalDeadCodeElimPass());
                    return true;
                });
        }
    };
}
