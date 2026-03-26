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
using FormalParams = std::pair<std::vector<std::string>, std::vector<std::string>>;

// ==================== 代码生成器类 ====================
class CodeGenerator {
private:
    CompilerContext& _context;
    SymbolTableManager _symbolTable;
    std::unique_ptr<IRBuilder<>> _builder;
    std::unique_ptr<Module> _llvmModule;
    std::unique_ptr<RuntimeAPI> runtimeAPI;

    // ========== 方法映射表 ==========
    using MethodMap = std::unordered_map<std::string, llvm::Function*>;
    struct ClassMethodMaps {
        MethodMap virtualMethods;    // 虚方法映射
        MethodMap staticMethods;     // 静态方法映射
        MethodMap overrideMethods;   // 重写方法映射
    };
    std::unordered_map<std::string, ClassMethodMaps> _methodMaps;
    
private:
    // ========== 类构建函数 ==========
    llvm::Type* mapCoolTypeToLLVM(const std::string& typeName);
    VariableInfo* findVariable(const std::string& className, const std::string& varName);
    ClassLayout collect_class_info(class__class* _class);
    void build_memory_layout(ClassLayout& classLayout);
    size_t getFieldOffset(ClassLayout* classLayout, const std::string& fieldName);
    llvm::Constant* createTypeInfo(const std::string& className, uint32_t classTag);
    void build_vtable(ClassLayout& classLayout);
    std::string findFirstField(ClassLayout* classLayout);
    llvm::Value* generateMemberAccess(llvm::Value* objectPtr, const std::string& className, const std::string& memberName);
    llvm::Value* generateVirtualCall(llvm::Value* objectPtr, const std::string& className, const std::string& methodName);
    void generate_constructor(ClassLayout& classLayout);
    unsigned getFieldStartIndex(ClassLayout& classLayout);
    void generate_methods(ClassLayout& classLayout);
    uint32_t allocate_class_tag();
    void default_initialize_object(llvm::Value* objPtr, ClassLayout& classLayout);
    llvm::Function* create_new_function(const std::string& className, ClassLayout& classLayout);
    std::string get_class_name_from_type(llvm::Type *type);
    void generate_method_prototypes(ClassLayout& classLayout);
    void generate_method_bodies(ClassLayout& classLayout);
    // ========== 运行时初始化 ==========
    void runtime_init();
    void initObjectClass();
    void initIntClass();
    void initBoolClass();
    void initStringClass();
    void initIOClass();
    void initStringConstants();
    
    // ========== 方法注册系统 ==========
    void buildMethodMaps();           // 构建所有方法映射表
    void registerClassMethods(ClassLayout& layout);  // 为类注册方法
    
    // 各个类的方法映射构建函数
    void buildObjectMethodMap(ClassMethodMaps& maps);
    void buildIntMethodMap(ClassMethodMaps& maps);
    void buildBoolMethodMap(ClassMethodMaps& maps);
    void buildStringMethodMap(ClassMethodMaps& maps);
    void buildIOMethodMap(ClassMethodMaps& maps);
    
    // 获取方法
    llvm::Function* getMethod(const std::string& className, 
                              const std::string& methodName,
                              MethodType type = METHOD_VIRTUAL);

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
    FormalParams emit_formals(Formals formals, bool usePlaceholderThis = false);

    // ========== 访问器 ==========
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

};

#endif // CODEGEN_H