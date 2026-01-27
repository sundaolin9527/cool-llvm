#ifndef CODEGEN_CONTEXT_H
#define CODEGEN_CONTEXT_H


#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/IRBuilder.h>
#include <string>
#include <stack>
#include <memory>

// LLVM 命名空间
using namespace llvm;

// ==================== 前向声明 ====================
class CompilerContext;

// ==================== 循环上下文结构 ====================
struct LoopContext {
    llvm::BasicBlock* startBlock;
    llvm::BasicBlock* endBlock;
    llvm::BasicBlock* continueBlock;
};

// ==================== 编译器上下文管理器（单例） ====================
class CompilerContext {
private:
    CompilerContext();
    
    // LLVM 全局对象
    std::unique_ptr<LLVMContext> llvmContext_;
    // 循环上下文栈
    std::stack<LoopContext> loopStack;

public:
    // 禁止拷贝
    CompilerContext(const CompilerContext&) = delete;
    CompilerContext& operator=(const CompilerContext&) = delete;
    
    // 获取单例实例
    static CompilerContext& getInstance();
    
    // ====== LLVM 上下文访问器 ======
    LLVMContext& getLLVMContext();
    
    // ====== 循环上下文操作 ======
    void enterLoop(llvm::BasicBlock* start, 
                  llvm::BasicBlock* end, 
                  llvm::BasicBlock* continueBlock = nullptr);
    void exitLoop();
    llvm::BasicBlock* getLoopStartBlock() const;
    llvm::BasicBlock* getLoopEndBlock() const;
    llvm::BasicBlock* getLoopContinueBlock() const;
    bool inLoop() const;
    int getLoopDepth() const;
};

#endif