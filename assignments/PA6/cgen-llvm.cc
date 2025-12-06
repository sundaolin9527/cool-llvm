#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Verifier.h>
#include <llvm/Support/raw_ostream.h>

using namespace llvm;
#include "cgen.h"

void emit_llvm_ir(Program program) {
    // LLVM 代码生成逻辑
    std::cout << "Hello, World!" << std::endl;
    // 1. 创建上下文和模块
    LLVMContext context;
    Module module("simple_module", context);
    
    // 2. 创建 IR 构建器
    IRBuilder<> builder(context);
    
    // 3. 创建一个简单的函数：int main() { return 42; }
    
    // 创建函数类型：返回 int，无参数
    FunctionType *funcType = FunctionType::get(
        builder.getInt32Ty(),  // 返回类型：32位整数
        false                  // 是否可变参数
    );
    
    // 创建函数
    Function *mainFunc = Function::Create(
        funcType,
        Function::ExternalLinkage,  // 链接类型
        "main",                     // 函数名
        &module
    );
    
    // 4. 创建基本块（函数体）
    BasicBlock *entry = BasicBlock::Create(context, "entry", mainFunc);
    builder.SetInsertPoint(entry);
    
    // 5. 生成返回值 42
    Value *retVal = builder.getInt32(42);
    builder.CreateRet(retVal);
    
    // 6. 验证生成的 IR
    if (verifyModule(module, &errs())) {
        errs() << "IR 验证失败!\n";
    }
    
    // 7. 打印生成的 LLVM IR
    module.print(outs(), nullptr);
}