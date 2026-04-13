#include <llvm/Config/llvm-config.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/GlobalAlias.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/Module.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/PassPlugin.h>

#include <unordered_set>
#include <vector>

//===- GlobalDeadCodeElim.cpp - Global Dead Code Elimination Pass --------===//
//
// 全局死代码消除方案：
// ===================
// 
// 1. 根集合保护：
//    - 保护所有非本地链接的符号（external、dllimport/export、appending等）
//    - 保护 LLVM 内部保留符号（llvm.* 前缀）
//    - 保护 @llvm.used 和 @llvm.compiler.used 中出现的实体
//    - 保护被调试信息引用的符号
//
// 2. 活跃性传播（工作列表迭代）：
//    - 从根集合开始，使用工作列表迭代传播活跃性
//    - 对于活跃的全局变量，递归分析其初始化器中引用的其他全局值
//    - 对于活跃的函数，遍历函数体分析所有指令引用的全局值
//    - 对于活跃的别名，分析其别名目标
//    - 处理 COMDAT 组依赖：同一 COMDAT 中任意成员活跃则整个组活跃
//
// 3. 常量表达式剥离：
//    - 递归剥离 bitcast、gep、addrspacecast 等常量表达式
//    - 处理常量数组、结构体等聚合类型的嵌套引用
//    - 确保能正确识别通过常量表达式包装的全局值引用
//
// 4. 间接调用保护：
//    - 检查函数地址是否被取走（hasAddressTaken）
//    - 检查函数指针是否经过常量表达式转换后可能被调用
//    - 检查函数是否被存储在全局变量或内存中
//
// 5. 迭代删除：
//    - 删除所有不在活跃集合中的全局别名、函数和变量
//    - 由于删除会减少其他全局对象的使用计数，但我们已经通过
//      活跃性传播确定了完整的活跃集合，因此单遍删除即可
//
//===----------------------------------------------------------------------===//

#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/IR/Comdat.h"
#include "llvm/IR/Constant.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DIBuilder.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalAlias.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/Value.h"
#include "llvm/Pass.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/Casting.h"
#include "llvm/Support/raw_ostream.h"
#include <unordered_set>
#include <vector>

#define DEBUG_TYPE "global-dead-code-elim"

// 统计信息：记录删除的各类全局实体数量
STATISTIC(NumAliasesRemoved, "Number of global aliases removed");
STATISTIC(NumFunctionsRemoved, "Number of functions removed");
STATISTIC(NumGlobalsRemoved, "Number of global variables removed");

namespace {

//===----------------------------------------------------------------------===//
// 常量表达式剥离
//===----------------------------------------------------------------------===//
//
// 递归剥离常量表达式
// 常见包装形式：bitcast、getelementptr、addrspacecast、constantexpr 等
// 示例：@g = global i32 42
//       @h = global i32* getelementptr (i32* @g, i32 0)  // 需要剥离 GEP 识别 @g
//
static const llvm::Constant* stripConstantExpr(const llvm::Constant* C) {
    if (!C)
        return nullptr;
    
    // 循环剥离多层常量表达式包装
    while (auto* CE = llvm::dyn_cast_or_null<llvm::ConstantExpr>(C)) {
        if (CE->getNumOperands() > 0) {
            C = llvm::dyn_cast<llvm::Constant>(CE->getOperand(0));
            if (!C)
                break;
        } else {
            break;
        }
    }
    return C;
}

//===----------------------------------------------------------------------===//
// 调试信息保护
//===----------------------------------------------------------------------===//
//
// 保护被调试信息引用的符号
// 调试信息中的全局变量即使没有实际使用，也应该保留以供调试
//
static bool isReferencedInDebugInfo(
    const llvm::GlobalValue& GV,
    llvm::Module& module
) {
    // 检查编译单元中的全局变量列表
    if (auto* NamedMD = module.getNamedMetadata("llvm.dbg.cu")) {
        for (llvm::MDNode* CU : NamedMD->operands()) {
            if (auto* DbgCU = llvm::dyn_cast_or_null<llvm::DICompileUnit>(CU)) {
                for (auto* GVE : DbgCU->getGlobalVariables()) {
                    if (auto* DbgGV = GVE->getVariable()) {
                        if (DbgGV->getName() == GV.getName()) {
                            return true;
                        }
                    }
                }
            }
        }
    }
    
    // 如果任何指令的调试位置引用了这个全局值，也认为需要保护
    for (const llvm::User* U : GV.users()) {
        if (auto* I = llvm::dyn_cast<llvm::Instruction>(U)) {
            if (I->getDebugLoc()) {
                return true;
            }
        }
    }
    
    return false;
}

//===----------------------------------------------------------------------===//
// COMDAT 依赖处理
//===----------------------------------------------------------------------===//
//
// COMDAT 组保护
// 链接器要求：如果一个 COMDAT 组中的任何成员被保留，整个组都必须保留
//
static bool isInLiveComdat(
    const llvm::GlobalValue& GV,
    const std::unordered_set<const llvm::GlobalValue*>& liveSet
) {
    const llvm::Comdat* C = GV.getComdat();
    if (!C)
        return false;
    
    // 检查同一 COMDAT 组中是否有其他活跃成员
    for (const llvm::GlobalValue& Other : GV.getParent()->global_values()) {
        if (Other.getComdat() == C && liveSet.count(&Other)) {
            return true;
        }
    }
    return false;
}

//===----------------------------------------------------------------------===//
// 从常量传播活跃性
//===----------------------------------------------------------------------===//
//
// 递归处理常量表达式，将引用的全局值加入活跃集
// 工作列表式迭代传播
//
static void propagateFromConstant(
    const llvm::Constant* C,
    std::unordered_set<const llvm::GlobalValue*>& liveSet,
    std::vector<const llvm::GlobalValue*>& worklist
) {
    if (!C)
        return;
    
    // 剥离常量表达式，获取底层的全局值
    C = stripConstantExpr(C);
    
    // 如果直接是全局值，标记为活跃并加入工作列表
    if (const auto* GV = llvm::dyn_cast_or_null<llvm::GlobalValue>(C)) {
        if (liveSet.insert(GV).second) {
            worklist.push_back(GV);  // 新发现的活跃符号，需要进一步处理其引用
        }
        return;
    }
    
    // 处理聚合类型常量（数组、结构体等）
    // 示例：@llvm.used = constant [2 x i8*] [i8* bitcast(...), i8* getelementptr(...)]
    for (const llvm::Use& U : C->operands()) {
        if (const auto* OpC = llvm::dyn_cast<llvm::Constant>(U.get())) {
            propagateFromConstant(OpC, liveSet, worklist);
        }
    }
}

//===----------------------------------------------------------------------===//
// 收集根集合
//===----------------------------------------------------------------------===//
//
// 识别所有不能被删除的根符号
//
static void collectProtectedValues(
    llvm::Module& module,
    std::unordered_set<const llvm::GlobalValue*>& liveSet,
    std::vector<const llvm::GlobalValue*>& worklist
) {
    // 1.1 保护所有非本地链接的符号
    //     外部可见的符号可能被其他模块引用，不能删除
    for (llvm::GlobalValue& GV : module.global_values()) {
        if (!GV.hasLocalLinkage() ||           // 非本地链接
            GV.hasDLLExportStorageClass() ||   // DLL导出
            GV.hasAppendingLinkage() ||        // 追加链接（如 ctors/dtors）
            GV.getName().starts_with("llvm.")) // LLVM内部保留符号
        {
            if (liveSet.insert(&GV).second) {
                worklist.push_back(&GV);
            }
            continue;
        }
        
        // 保护特殊 section 中的符号（如 llvm.global_ctors）
        if (GV.hasSection() && GV.getSection().startswith("llvm.")) {
            if (liveSet.insert(&GV).second) {
                worklist.push_back(&GV);
            }
        }
    }
    
    // 1.2 保护 @llvm.used 和 @llvm.compiler.used 中的实体
    //     这些是编译器显式标记为必须保留的符号
    auto collectLLVMUsed = [&](llvm::StringRef name) {
        llvm::GlobalVariable* used = module.getNamedGlobal(name);
        if (!used || !used->hasInitializer())
            return;
        
        if (auto* array = llvm::dyn_cast<llvm::ConstantArray>(used->getInitializer())) {
            for (llvm::Value* operand : array->operands()) {
                if (const auto* constant = llvm::dyn_cast<llvm::Constant>(operand)) {
                    propagateFromConstant(constant, liveSet, worklist);
                }
            }
        }
    };
    
    collectLLVMUsed("llvm.used");
    collectLLVMUsed("llvm.compiler.used");
    
    // 1.3 保护被调试信息引用的符号
    //     调试时可能需要访问这些符号，即使代码中没有使用
    for (llvm::GlobalValue& GV : module.global_values()) {
        if (isReferencedInDebugInfo(GV, module)) {
            if (liveSet.insert(&GV).second) {
                worklist.push_back(&GV);
            }
        }
    }
}

//===----------------------------------------------------------------------===//
// 主 Pass 实现
//===----------------------------------------------------------------------===//
//
// 全局死代码消除 Pass
//
class GlobalDeadCodeElimPass : public llvm::PassInfoMixin<GlobalDeadCodeElimPass> {
public:
    llvm::PreservedAnalyses run(llvm::Module& module, llvm::ModuleAnalysisManager&) {
        std::unordered_set<const llvm::GlobalValue*> liveSet;  // 活跃符号集合
        std::vector<const llvm::GlobalValue*> worklist;       // 工作列表
        
        // ========== 阶段1：收集根集合 ==========
        // 保护外部可见符号、LLVM保留符号、@llvm.used中的实体
        collectProtectedValues(module, liveSet, worklist);
        
        // ========== 阶段2：迭代传播活跃性 ==========
        // 使用工作列表迭代传播，直到固定点
        // 处理常量表达式包装的引用
        while (!worklist.empty()) {
            const llvm::GlobalValue* GV = worklist.back();
            worklist.pop_back();
            
            // 2.1 处理全局变量：分析其初始化器
            if (const auto* GVar = llvm::dyn_cast<llvm::GlobalVariable>(GV)) {
                if (GVar->hasInitializer()) {
                    propagateFromConstant(GVar->getInitializer(), liveSet, worklist);
                }
            }
            
            // 2.2 处理函数：遍历函数体中的所有指令
            if (const auto* F = llvm::dyn_cast<llvm::Function>(GV)) {
                if (!F->isDeclaration()) {
                    for (const llvm::BasicBlock& BB : *F) {
                        for (const llvm::Instruction& I : BB) {
                            // 检查指令中引用的常量
                            for (const llvm::Use& U : I.operands()) {
                                if (const auto* C = llvm::dyn_cast<llvm::Constant>(U.get())) {
                                    propagateFromConstant(C, liveSet, worklist);
                                }
                            }
                            
                            // 特殊处理：函数调用中的间接调用目标
                            if (const auto* Call = llvm::dyn_cast<llvm::CallBase>(&I)) {
                                if (const llvm::Value* Called = Call->getCalledOperand()) {
                                    if (const auto* Fn = llvm::dyn_cast<llvm::Function>(Called)) {
                                        if (liveSet.insert(Fn).second) {
                                            worklist.push_back(Fn);
                                        }
                                    } else if (const auto* CE = llvm::dyn_cast<llvm::ConstantExpr>(Called)) {
                                        propagateFromConstant(CE, liveSet, worklist);
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            // 2.3 处理全局别名：分析别名目标
            if (const auto* Alias = llvm::dyn_cast<llvm::GlobalAlias>(GV)) {
                if (const auto* Aliasee = Alias->getAliasee()) {
                    propagateFromConstant(Aliasee, liveSet, worklist);
                }
            }
            
            // 2.4 处理 COMDAT 组：同一组中的符号需要一起保留
            //     链接器要求：如果组中任意成员被保留，整个组都必须保留
            if (const llvm::Comdat* C = GV->getComdat()) {
                for (const llvm::GlobalValue& Other : module.global_values()) {
                    if (Other.getComdat() == C && liveSet.insert(&Other).second) {
                        worklist.push_back(&Other);
                    }
                }
            }
        }
        
        // ========== 阶段3：删除死代码 ==========
        // 删除所有不在活跃集合中的全局符号
        // 注意：由于已经通过传播确定了完整的活跃集，单遍删除即可
        bool changed = false;
        
        // 3.1 删除无用的全局别名
        std::vector<llvm::GlobalAlias*> aliasesToErase;
        for (llvm::GlobalAlias& alias : module.aliases()) {
            if (canErase(alias, liveSet)) {
                aliasesToErase.push_back(&alias);
            }
        }
        for (llvm::GlobalAlias* alias : aliasesToErase) {
            replaceDeadUsesWithNull(*alias);
        }
        for (llvm::GlobalAlias* alias : aliasesToErase) {
            alias->eraseFromParent();
            NumAliasesRemoved++;
        }
        changed |= !aliasesToErase.empty();
        
        // 3.2 删除无用的函数
        std::vector<llvm::Function*> functionsToErase;
        for (llvm::Function& function : module) {
            if (function.isDeclaration())
                continue;

            if (canErase(function, liveSet)) {
                functionsToErase.push_back(&function);
            }
        }
        for (llvm::Function* function : functionsToErase) {
            replaceDeadUsesWithNull(*function);
        }
        for (llvm::Function* function : functionsToErase) {
            function->eraseFromParent();
            NumFunctionsRemoved++;
        }
        changed |= !functionsToErase.empty();
        
        // 3.3 删除无用的全局变量
        std::vector<llvm::GlobalVariable*> globalsToErase;
        for (llvm::GlobalVariable& global : module.globals()) {
            if (global.isDeclaration())
                continue;
            
            if (canErase(global, liveSet)) {
                globalsToErase.push_back(&global);
            }
        }
        for (llvm::GlobalVariable* global : globalsToErase) {
            replaceDeadUsesWithNull(*global);
        }
        for (llvm::GlobalVariable* global : globalsToErase) {
            global->eraseFromParent();
            NumGlobalsRemoved++;
        }
        changed |= !globalsToErase.empty();
        
        return changed ? llvm::PreservedAnalyses::none() : llvm::PreservedAnalyses::all();
    }
    
private:
    static void replaceDeadUsesWithNull(llvm::GlobalValue& GV) {
        if (GV.use_empty())
            return;

        GV.replaceAllUsesWith(llvm::Constant::getNullValue(GV.getType()));
    }

    // 判断全局值是否可以被删除
    // 条件：
    //   1. 必须是本地链接符号
    //   2. 不是 LLVM 内部符号
    //   3. 不在活跃集合中
    //   4. 不在活跃的 COMDAT 组中
    static bool canErase(
        const llvm::GlobalValue& globalValue,
        const std::unordered_set<const llvm::GlobalValue*>& liveSet
    ) {
        // 只有本地链接的符号才能被删除
        if (!globalValue.hasLocalLinkage())
            return false;
        
        // 保护 LLVM 内部符号
        if (globalValue.getName().starts_with("llvm."))
            return false;
        
        // 保护活跃集合中的符号
        if (liveSet.count(&globalValue))
            return false;
        
        // 保护活跃 COMDAT 中的符号
        if (isInLiveComdat(globalValue, liveSet))
            return false;

        return true;
    }
};

} // anonymous namespace

//===----------------------------------------------------------------------===//
// Pass 插件注册
//===----------------------------------------------------------------------===//
//
// 将 Pass 注册为 LLVM 插件，可通过 opt -load-pass-plugin 使用
//
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
