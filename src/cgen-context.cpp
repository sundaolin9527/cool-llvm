#include "cgen-context.h"
#include <iostream>
#include <cassert>

CompilerContext& CompilerContext::getInstance() {
    static CompilerContext instance;
    return instance;
}

// 私有构造函数实现
CompilerContext::CompilerContext() : 
    llvmContext_(std::make_unique<llvm::LLVMContext>()){}

// ====== LLVM 上下文访问器 ======
llvm::LLVMContext& CompilerContext::getLLVMContext() {
    return *llvmContext_.get();
}

// ====== 循环上下文操作 ======
void CompilerContext::enterLoop(llvm::BasicBlock* start, 
                               llvm::BasicBlock* end, 
                               llvm::BasicBlock* continueBlock) {
    LoopContext loopCtx;
    loopCtx.startBlock = start;
    loopCtx.endBlock = end;
    loopCtx.continueBlock = continueBlock;
    loopStack.push(loopCtx);
}

void CompilerContext::exitLoop() {
    if (!loopStack.empty()) {
        loopStack.pop();
    }
}

llvm::BasicBlock* CompilerContext::getLoopStartBlock() const {
    if (!loopStack.empty()) {
        return loopStack.top().startBlock;
    }
    return nullptr;
}

llvm::BasicBlock* CompilerContext::getLoopEndBlock() const {
    if (!loopStack.empty()) {
        return loopStack.top().endBlock;
    }
    return nullptr;
}

llvm::BasicBlock* CompilerContext::getLoopContinueBlock() const {
    if (!loopStack.empty()) {
        return loopStack.top().continueBlock;
    }
    return nullptr;
}

bool CompilerContext::inLoop() const {
    return !loopStack.empty();
}

int CompilerContext::getLoopDepth() const {
    return static_cast<int>(loopStack.size());
}