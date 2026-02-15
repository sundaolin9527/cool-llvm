#ifndef CODEGEN_H
#define CODEGEN_H

#include <vector>
#include <string>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Verifier.h>
#include <llvm/Support/raw_ostream.h>
#include <map>
#include "cgen.h"
#include "runtime.h"
#include "cgen-context.h"
#include "symbol-table.h"

// LLVM 命名空间
using namespace llvm;

// 形式参数类型定义
using FormalParams = std::pair<std::vector<std::string>, std::vector<Type*>>;

// ==================== 代码生成器类 ====================
class CodeGenerator {
private:
    CompilerContext& _context;
    SymbolTableManager _symbolTable;
    std::unique_ptr<IRBuilder<>> _builder;
    std::unique_ptr<Module> _llvmModule;
    std::unique_ptr<RuntimeAPI> runtimeAPI;

public:
    // ==================== 构造函数 ====================
    CodeGenerator();
    
    // ==================== 主生成函数 ====================
    void emit_llvm_ir(Program program);
    
    // ==================== 工具函数 ====================
    void dumpIR();
    bool verifyModule();
    
    // ==================== 访问器 ====================
    CompilerContext& getContext();
    SymbolTableManager& getSymbolTable();
    IRBuilder<>& getIRBuilder();
    Module& getModule();
    RuntimeAPI& getRuntimeAPI();

private:
    llvm::Type* mapCoolTypeToLLVM(const std::string& typeName);
    VariableInfo* findVariable(const std::string& className, const std::string& varName);
    ClassLayout collect_class_info(class__class* _class);
    void build_memory_layout(ClassLayout& classLayout);
    void build_vtable(ClassLayout& classLayout);
    void generate_constructor(ClassLayout& classLayout);
    void generate_methods(ClassLayout& classLayout);
    uint32_t allocate_class_tag();
    void default_initialize_object(llvm::Value* objPtr, ClassLayout& classLayout);
    llvm::Function* create_new_function(const std::string& className, ClassLayout& classLayout);
    
    llvm::Value* emit_class__class(class__class* _class);
    llvm::Value* emit_class_(Class_ class_);
    llvm::Value* emit_method_class(method_class* method);
    llvm::Value* emit_attr_class(attr_class* attr);
    llvm::Value* emit_feature(Feature feature);
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
    llvm::Value* emit_isvoid_class(isvoid_class* expr);
    llvm::Value* emit_no_expr_class(no_expr_class* expr);
    llvm::Value* emit_object_class(object_class* expr);
    llvm::Value* emit_expression(Expression e);
    llvm::Value* emit_new__class(new__class *new_class);
    llvm::Value* emit_branch_class(branch_class* branch);
    llvm::Value* emit_case(Case _case);
    llvm::Value* emit_program_class(program_class* program);
    llvm::Value* emit_program(Program program);
    FormalParams emit_formals(Formals formals, llvm::Type* classType);
};

#endif // CODEGEN_H