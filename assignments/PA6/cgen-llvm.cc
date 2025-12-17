#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Verifier.h>
#include <llvm/Support/raw_ostream.h>

using namespace llvm;
#include "cgen.h"
llvm::Value* emit_class__class(class__class* _class);
llvm::Value* emit_class_(Class_ class_);
llvm::Value* emit_method_class(method_class* method);
llvm::Value* emit_attr_class(attr_class* attr);
llvm::Value* emit_feature(Feature feature);
llvm::Value* emit_formal(Formal formal);
llvm::Value* emit_assign_class(assign_class* expr);
llvm::Value* emit_static_dispatch_class(static_dispatch_class* expr);
llvm::Value* emit_dispatch_class(dispatch_class* expr);
llvm::Value* emit_cond_class(cond_class* expr);
llvm::Value* emit_loop_class(loop_class* expr);
llvm::Value* emit_typcase_class(typcase_class* expr);
llvm::Value* emit_block_class(block_class* expr);
llvm::Value* emit_let_class(let_class* expr);
llvm::Value* emit_plus_class(plus_class* expr);
llvm::Value* emit_sub_class(sub_class* expr);
llvm::Value* emit_mul_class(mul_class* expr);
llvm::Value* emit_divide_class(divide_class* expr);
llvm::Value* emit_neg_class(neg_class* expr);
llvm::Value* emit_lt_class(lt_class* expr);
llvm::Value* emit_eq_class(eq_class* expr);
llvm::Value* emit_leq_class(leq_class* expr);
llvm::Value* emit_comp_class(comp_class* expr);
llvm::Value* emit_int_const_class(int_const_class* expr);
llvm::Value* emit_bool_const_class(bool_const_class* expr);
llvm::Value* emit_string_const_class(string_const_class* expr);
llvm::Value* emit_new__class(new__class* expr);
llvm::Value* emit_isvoid_class(isvoid_class* expr);
llvm::Value* emit_no_expr_class(no_expr_class* expr);
llvm::Value* emit_object_class(object_class* expr);
llvm::Value* emit_expression(Expression e);
llvm::Value* emit_branch_class(branch_class* branch);
llvm::Value* emit_case(Case _case);
llvm::Value* emit_program_class(program_class* program);
llvm::Value* emit_program(Program program);

LLVMContext context; // 贯穿整个流程
Module module("MainModule", context); // 一个编译单元
IRBuilder<> builder(context);

void emit_llvm_ir(Program program) {
    emit_program(program);
    // LLVM 代码生成逻辑
    std::cout << "Hello, World!" << std::endl;

    
    
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

llvm::Value *emit_class__class(class__class* _class)
{
    if (_class == nullptr) return nullptr;

}

llvm::Value *emit_class_(Class_ class_)
{
     return emit_class__class((class__class*)class_);
}


llvm::Value *emit_method_class(method_class* method)
{
    if (method == nullptr) return nullptr;

}

llvm::Value *emit_attr_class(attr_class* attr)
{
    if (attr == nullptr) return nullptr;
}

llvm::Value *emit_feature(Feature feature)
{
    if (feature == nullptr) return nullptr;
    if (auto* method = dynamic_cast<method_class*>(feature)) {
        return emit_method_class(method);
    } else if (auto* attr = dynamic_cast<attr_class*>(feature)) {
        return emit_attr_class(attr);
    }
    return nullptr;
}

llvm::Value *emit_formal(Formal formal)
{
    if (formal == nullptr) return nullptr; 
}

llvm::Value *emit_assign_class(assign_class* expression)
{
    if (expression == nullptr) return nullptr;
}

llvm::Value *emit_static_dispatch_class(static_dispatch_class* expression)
{
    if (expression == nullptr) return nullptr;
}

llvm::Value *emit_dispatch_class(dispatch_class* expression)
{
    if (expression == nullptr) return nullptr; 
}

llvm::Value *emit_cond_class(cond_class* expression)
{
    if (expression == nullptr) return nullptr;

    llvm::Function* current_function = builder.GetInsertBlock()->getParent();
    llvm::Value* pred_value = emit_expression(expression->pred);

     // 确保条件值是布尔类型
    if (!pred_value->getType()->isIntegerTy(1)) {
        if (pred_value->getType()->isIntegerTy()) {
            // 整数类型：比较是否不等于0
            llvm::Value* zero = llvm::ConstantInt::get(pred_value->getType(), 0);
            pred_value = builder.CreateICmpNE(pred_value, zero, "bool_cmp");
        } else if (pred_value->getType()->isPointerTy()) {
            // 指针类型：比较是否不等于nullptr
            llvm::Value* null_ptr = llvm::ConstantPointerNull::get(
                static_cast<llvm::PointerType*>(pred_value->getType())
            );
            pred_value = builder.CreateICmpNE(pred_value, null_ptr, "ptr_cmp");
        } else if (pred_value->getType()->isFloatingPointTy()) {
            // 浮点类型：比较是否不等于0.0
            llvm::Value* zero_float = llvm::ConstantFP::get(pred_value->getType(), 0.0);
            pred_value = builder.CreateFCmpONE(pred_value, zero_float, "float_cmp");
        } else {
            // 其他类型：尝试转换为i1
            pred_value = builder.CreateICmpNE(
                builder.CreatePtrToInt(pred_value, llvm::Type::getInt64Ty(context)),
                llvm::ConstantInt::get(llvm::Type::getInt64Ty(context), 0),
                "generic_cmp"
            );
        }
    }
    
    // 2. 创建基本块
    llvm::BasicBlock* then_block = llvm::BasicBlock::Create(context, "then", current_function);
    llvm::BasicBlock* else_block = llvm::BasicBlock::Create(context, "else");
    llvm::BasicBlock* merge_block = llvm::BasicBlock::Create(context, "ifcont");
    
    // 3. 创建条件分支
    builder.CreateCondBr(pred_value, then_block, else_block);
    
    // 4. 生成 then 分支
    builder.SetInsertPoint(then_block);
    llvm::Value* then_value = emit_expression(expression->then_exp);
    
    // 检查 then 分支是否已经终止（例如包含 return 语句）
    bool then_terminated = builder.GetInsertBlock()->getTerminator() != nullptr;
    if (!then_terminated) {
        builder.CreateBr(merge_block);
    }
    
    // 保存 then 分支的结束基本块
    llvm::BasicBlock* then_end_block = builder.GetInsertBlock();
    
    // 5. 生成 else 分支
    else_block->insertInto(current_function);
    builder.SetInsertPoint(else_block);
    llvm::Value* else_value = emit_expression(expression->else_exp);
    
    // 检查 else 分支是否已经终止
    bool else_terminated = builder.GetInsertBlock()->getTerminator() != nullptr;
    if (!else_terminated) {
        builder.CreateBr(merge_block);
    }
    
    // 保存 else 分支的结束基本块
    llvm::BasicBlock* else_end_block = builder.GetInsertBlock();
    
    // 6. 添加 merge 块到函数
    merge_block->insertInto(current_function);
    builder.SetInsertPoint(merge_block);
    
    // 7. 处理返回值（创建 phi 节点）
    if (!then_terminated && !else_terminated) {
        // 确保两个分支的返回类型一致
        if (then_value == nullptr || else_value == nullptr) {
            // 某个分支没有返回值（可能是 void 类型）
            return nullptr;
        }
        
        // 检查类型是否匹配
        if (then_value->getType() != else_value->getType()) {
            // 尝试进行类型转换
            // 先检查是否可以转换为共同的类型
            
            // 如果一个是整数，另一个也是整数
            if (then_value->getType()->isIntegerTy() && else_value->getType()->isIntegerTy()) {
                // 找到较大的整数类型
                unsigned then_bits = then_value->getType()->getIntegerBitWidth();
                unsigned else_bits = else_value->getType()->getIntegerBitWidth();
                
                if (then_bits < else_bits) {
                    // 扩展 then_value
                    then_value = builder.CreateSExt(then_value, else_value->getType(), "sext_then");
                } else if (then_bits > else_bits) {
                    // 扩展 else_value
                    else_value = builder.CreateSExt(else_value, then_value->getType(), "sext_else");
                }
            }
        }
        
        // 创建 phi 节点合并两个分支的值
        llvm::PHINode* phi_node = builder.CreatePHI(
            then_value->getType(), 
            2, 
            "cond_result"
        );
        
        phi_node->addIncoming(then_value, then_end_block);
        phi_node->addIncoming(else_value, else_end_block);
        
        return phi_node;
    } else if (then_terminated && !else_terminated) {
        // then 分支已经终止，不需要 phi 节点
        return else_value;
    } else if (!then_terminated && else_terminated) {
        // else 分支已经终止，不需要 phi 节点
        return then_value;
    } else {
        // 两个分支都已经终止（例如都有 return 语句）
        return nullptr;
    }
}

llvm::Value *emit_loop_class(loop_class* expression)
{
    if (expression == nullptr) return nullptr;

    Function *TheFunction = builder.GetInsertBlock()->getParent();
    BasicBlock *LoopBB = BasicBlock::Create(context, "loop", TheFunction);
    builder.CreateBr(LoopBB);
    builder.SetInsertPoint(LoopBB);

    // 先计算条件表达式
    Value *predVal = emit_expression(expression->pred);
    if (!predVal) {
        return nullptr;
    }

    BasicBlock *AfterBB = BasicBlock::Create(context, "afterloop", TheFunction);
    BasicBlock *BodyBB = BasicBlock::Create(context, "bodyloop", TheFunction);
    builder.CreateCondBr(predVal, LoopBB, AfterBB);

    // 函数体执行
    builder.SetInsertPoint(BodyBB);
    if (!emit_expression(expression->body)) {
        return nullptr;
    }
    
    builder.SetInsertPoint(AfterBB);
    // 根据语义返回void(是否需要有个专门的东西表示void)
    return nullptr;
}

llvm::Value *emit_typcase_class(typcase_class* expression)
{
    if (expression == nullptr) return nullptr;
}

llvm::Value *emit_block_class(block_class* expression)
{
    if (expression == nullptr) return nullptr;
    
    Expressions body = expression->body;
    if (body == nullptr) return nullptr;
    
    llvm::Value* result = nullptr;
    // 为每个表达式生成代码
    for (int i = body->first(); body->more(i); i = body->next(i)) {
        result = emit_expression(body->nth(i));
    }
    
    // 如果所有表达式都是 void，返回默认值
    if (!result) {
        // 返回 Object 的默认值（空指针）
        return llvm::Constant::getNullValue(
            llvm::Type::getInt8PtrTy(context));
    }
    
    return result;
}

llvm::Value *emit_let_class(let_class* expression)
{
    if (expression == nullptr) return nullptr;
}

llvm::Value* emit_plus_class(plus_class* expression) {
    if (expression == nullptr) return nullptr;
    llvm::Value* left_val = emit_expression(expression->e1);
    llvm::Value* right_val = emit_expression(expression->e2);
    return builder.CreateAdd(left_val, right_val, "addtmp");
}

llvm::Value* emit_sub_class(sub_class* expression) {
    if (expression == nullptr) return nullptr;
    llvm::Value* left_val = emit_expression(expression->e1);
    llvm::Value* right_val = emit_expression(expression->e2);
    
    return builder.CreateSub(left_val, right_val, "subtmp");
}

llvm::Value* emit_mul_class(mul_class* expression) {
    if (expression == nullptr) return nullptr;
    llvm::Value* left_val = emit_expression(expression->e1);
    llvm::Value* right_val = emit_expression(expression->e2);
    
    return builder.CreateMul(left_val, right_val, "multmp");
}

llvm::Value* emit_divide_class(divide_class* expression) {
    if (expression == nullptr) return nullptr;
    llvm::Value* left_val = emit_expression(expression->e1);
    llvm::Value* right_val = emit_expression(expression->e2);
    
    return builder.CreateSDiv(left_val, right_val, "divtmp");
}

llvm::Value* emit_neg_class(neg_class* expression) {
    if (expression == nullptr) return nullptr;
    llvm::Value* val = emit_expression(expression->e1);
    
    llvm::Value* zero = llvm::ConstantInt::get(builder.getInt32Ty(), 0);
    return builder.CreateSub(zero, val, "negtmp");
}

llvm::Value* emit_lt_class(lt_class* expression) {
    if (expression == nullptr) return nullptr;
    llvm::Value* left_val = emit_expression(expression->e1);
    llvm::Value* right_val = emit_expression(expression->e2);
    
    return builder.CreateICmpSLT(left_val, right_val, "cmptmp");
}

llvm::Value* emit_eq_class(eq_class* expression) {
    if (expression == nullptr) return nullptr;
    llvm::Value* left_val = emit_expression(expression->e1);
    llvm::Value* right_val = emit_expression(expression->e2);
    
    return builder.CreateICmpEQ(left_val, right_val, "eqtmp");
}

llvm::Value* emit_leq_class(leq_class* expression) {
    if (expression == nullptr) return nullptr;
    llvm::Value* left_val = emit_expression(expression->e1);
    llvm::Value* right_val = emit_expression(expression->e2);
    
    return builder.CreateICmpSLE(left_val, right_val, "leqtmp");
}

llvm::Value* emit_comp_class(comp_class* expression) {
    if (expression == nullptr) return nullptr;

    llvm::Value* val = emit_expression(expression->e1);
    return builder.CreateNot(val, "comptmp");
}

llvm::Value* emit_int_const_class(int_const_class* expression) {
    if (expression == nullptr || expression->token == nullptr) {
        return nullptr;
    }

    int value = std::stoi(expression->token->get_string());
    return llvm::ConstantInt::get(builder.getInt32Ty(), value);
}

llvm::Value* emit_bool_const_class(bool_const_class* expression) 
{
    if (expression == nullptr) return nullptr;
    return llvm::ConstantInt::get(builder.getInt1Ty(), expression->val ? 1 : 0);
}

llvm::Value* emit_string_const_class(string_const_class* expression) {
    if (expression == nullptr) return nullptr;
}

llvm::Value* emit_new__class(new__class* expression) {
    if (expression == nullptr) return nullptr;

}

llvm::Value* emit_isvoid_class(isvoid_class* expression) {
    if (expression == nullptr) return nullptr;

    llvm::Value* val = emit_expression(expression->e1);
    
    llvm::Value* null_val = llvm::Constant::getNullValue(val->getType());
    return builder.CreateICmpEQ(val, null_val, "isvoidtmp");
}

llvm::Value* emit_no_expr_class(no_expr_class* expression) {
    if (expression == nullptr) return nullptr;
    return llvm::Constant::getNullValue(builder.getVoidTy());
}

llvm::Value* emit_object_class(object_class* expression) {
    if (expression == nullptr) return nullptr;

}

llvm::Value* emit_expression(Expression e) {
    if (e == nullptr) return nullptr;
    
    if (auto* expr = dynamic_cast<plus_class*>(e)) {
        return emit_plus_class(expr);
    }
    else if (auto* expr = dynamic_cast<sub_class*>(e)) {
        return emit_sub_class(expr);
    }
    else if (auto* expr = dynamic_cast<mul_class*>(e)) {
        return emit_mul_class(expr);
    }
    else if (auto* expr = dynamic_cast<divide_class*>(e)) {
        return emit_divide_class(expr);
    }
    else if (auto* expr = dynamic_cast<neg_class*>(e)) {
        return emit_neg_class(expr);
    }
    else if (auto* expr = dynamic_cast<lt_class*>(e)) {
        return emit_lt_class(expr);
    }
    else if (auto* expr = dynamic_cast<eq_class*>(e)) {
        return emit_eq_class(expr);
    }
    else if (auto* expr = dynamic_cast<leq_class*>(e)) {
        return emit_leq_class(expr);
    }
    else if (auto* expr = dynamic_cast<comp_class*>(e)) {
        return emit_comp_class(expr);
    }
    else if (auto* expr = dynamic_cast<int_const_class*>(e)) {
        return emit_int_const_class(expr);
    }
    else if (auto* expr = dynamic_cast<bool_const_class*>(e)) {
        return emit_bool_const_class(expr);
    }
    else if (auto* expr = dynamic_cast<string_const_class*>(e)) {
        return emit_string_const_class(expr);
    }
    else if (auto* expr = dynamic_cast<new__class*>(e)) {
        return emit_new__class(expr);
    }
    else if (auto* expr = dynamic_cast<isvoid_class*>(e)) {
        return emit_isvoid_class(expr);
    }
    else if (auto* expr = dynamic_cast<no_expr_class*>(e)) {
        return emit_no_expr_class(expr);
    }
    else if (auto* expr = dynamic_cast<object_class*>(e)) {
        return emit_object_class(expr);
    }
    else if (auto* expr = dynamic_cast<let_class*>(e)) {
        return emit_let_class(expr);
    }else if (auto* expr = dynamic_cast<loop_class*>(e)) {
        return emit_loop_class(expr);
    }
    else if (auto* expr = dynamic_cast<dispatch_class*>(e)) {
        return emit_dispatch_class(expr);
    }
    else if (auto* expr = dynamic_cast<static_dispatch_class*>(e)) {
        return emit_static_dispatch_class(expr);
    }
    std::cerr << "Error: Unknown expression type" << std::endl;
    return nullptr;
}

llvm::Value *emit_branch_class(branch_class *branch)
{
     if (branch == nullptr) return nullptr;

}

llvm::Value *emit_case(Case _case)
{
    return emit_branch_class((branch_class*)_case);
}

llvm::Value *emit_program_class(program_class *program)
{
    if (program == nullptr) return nullptr;

    Classes classes = program->classes;
    for(int i = classes->first(); classes->more(i); i = classes->next(i))
    {
        emit_class_(classes->nth(i));
    }
    // 返回值应该获取Main类中的main函数??
    return nullptr;
}

llvm::Value* emit_program(Program program) 
{
    return emit_program_class((program_class*)program);
}
