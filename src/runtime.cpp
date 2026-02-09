#include "runtime.h"
#include <llvm/IR/Function.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/DerivedTypes.h>

using namespace llvm;

CoolRuntime::CoolRuntime(LLVMContext& ctx, Module& mod)
    : context(ctx), _module(mod) {
}

void CoolRuntime::declareAllFunctions() {
    declareStandardLibraryFunctions();
    declareCoolBuiltinFunctions();
}

void CoolRuntime::declareStandardLibraryFunctions() {
    PointerType* i8PtrTy = Type::getInt8PtrTy(context);
    Type* i32Ty = Type::getInt32Ty(context);
    Type* i64Ty = Type::getInt64Ty(context);
    Type* voidTy = Type::getVoidTy(context);
    
    // malloc(size_t size) -> void*
    FunctionType* mallocTy = FunctionType::get(i8PtrTy, {i64Ty}, false);
    externFuncs.malloc = Function::Create(mallocTy, Function::ExternalLinkage, "malloc", &_module);
    
    // free(void* ptr) -> void
    FunctionType* freeTy = FunctionType::get(voidTy, {i8PtrTy}, false);
    externFuncs.free = Function::Create(freeTy, Function::ExternalLinkage, "free", &_module);
    
    // memcpy(void* dest, const void* src, size_t n) -> void*
    FunctionType* memcpyTy = FunctionType::get(i8PtrTy, {i8PtrTy, i8PtrTy, i64Ty}, false);
    externFuncs.memcpy = Function::Create(memcpyTy, Function::ExternalLinkage, "memcpy", &_module);
    
    // memset(void* s, int c, size_t n) -> void*
    FunctionType* memsetTy = FunctionType::get(i8PtrTy, {i8PtrTy, i32Ty, i64Ty}, false);
    externFuncs.memset = Function::Create(memsetTy, Function::ExternalLinkage, "memset", &_module);
    
    // printf(const char* format, ...) -> int
    FunctionType* printfTy = FunctionType::get(i32Ty, {i8PtrTy}, true);
    externFuncs.printf = Function::Create(printfTy, Function::ExternalLinkage, "printf", &_module);
    
    // puts(const char* s) -> int
    FunctionType* putsTy = FunctionType::get(i32Ty, {i8PtrTy}, false);
    externFuncs.puts = Function::Create(putsTy, Function::ExternalLinkage, "puts", &_module);
    
    // gets(char* s) -> char*
    FunctionType* getsTy = FunctionType::get(i8PtrTy, {i8PtrTy}, false);
    externFuncs.gets = Function::Create(getsTy, Function::ExternalLinkage, "gets", &_module);
    
    // strlen(const char* s) -> size_t
    FunctionType* strlenTy = FunctionType::get(i64Ty, {i8PtrTy}, false);
    externFuncs.strlen = Function::Create(strlenTy, Function::ExternalLinkage, "strlen", &_module);
    
    // strcpy(char* dest, const char* src) -> char*
    FunctionType* strcpyTy = FunctionType::get(i8PtrTy, {i8PtrTy, i8PtrTy}, false);
    externFuncs.strcpy = Function::Create(strcpyTy, Function::ExternalLinkage, "strcpy", &_module);
    
    // strncpy(char* dest, const char* src, size_t n) -> char*
    FunctionType* strncpyTy = FunctionType::get(i8PtrTy, {i8PtrTy, i8PtrTy, i64Ty}, false);
    externFuncs.strncpy = Function::Create(strncpyTy, Function::ExternalLinkage, "strncpy", &_module);
    
    // strcmp(const char* s1, const char* s2) -> int
    FunctionType* strcmpTy = FunctionType::get(i32Ty, {i8PtrTy, i8PtrTy}, false);
    externFuncs.strcmp = Function::Create(strcmpTy, Function::ExternalLinkage, "strcmp", &_module);
    
    // strncmp(const char* s1, const char* s2, size_t n) -> int
    FunctionType* strncmpTy = FunctionType::get(i32Ty, {i8PtrTy, i8PtrTy, i64Ty}, false);
    externFuncs.strncmp = Function::Create(strncmpTy, Function::ExternalLinkage, "strncmp", &_module);
    
    // atoi(const char* str) -> int
    FunctionType* atoiTy = FunctionType::get(i32Ty, {i8PtrTy}, false);
    externFuncs.atoi = Function::Create(atoiTy, Function::ExternalLinkage, "atoi", &_module);
    
    // exit(int status) -> void
    FunctionType* exitTy = FunctionType::get(voidTy, {i32Ty}, false);
    externFuncs.exit = Function::Create(exitTy, Function::ExternalLinkage, "exit", &_module);
    
    // abort() -> void
    FunctionType* abortTy = FunctionType::get(voidTy, false);
    externFuncs.abort = Function::Create(abortTy, Function::ExternalLinkage, "abort", &_module);
}

void CoolRuntime::declareCoolBuiltinFunctions() {
    // 首先获取或创建 COOL 类型
    StructType* objectTy = StructType::getTypeByName(context, "Object");
    if (!objectTy) {
        // 创建占位符类型
        objectTy = StructType::create(context, "Object");
    }
    PointerType* objectPtrTy = PointerType::get(objectTy, 0);
    
    StructType* stringTy = StructType::getTypeByName(context, "String");
    if (!stringTy) {
        stringTy = StructType::create(context, "String");
    }
    PointerType* stringPtrTy = PointerType::get(stringTy, 0);
    
    StructType* intTy = StructType::getTypeByName(context, "Int");
    if (!intTy) {
        intTy = StructType::create(context, "Int");
    }
    PointerType* intPtrTy = PointerType::get(intTy, 0);
    
    StructType* boolTy = StructType::getTypeByName(context, "Bool");
    if (!boolTy) {
        boolTy = StructType::create(context, "Bool");
    }
    PointerType* boolPtrTy = PointerType::get(boolTy, 0);
    
    StructType* ioTy = StructType::getTypeByName(context, "IO");
    if (!ioTy) {
        ioTy = StructType::create(context, "IO");
    }
    PointerType* ioPtrTy = PointerType::get(ioTy, 0);
    
    Type* i32Ty = Type::getInt32Ty(context);
    
    // ========== Object 类方法 ==========
    
    // Object.copy() : Object
    FunctionType* objectCopyTy = FunctionType::get(objectPtrTy, {objectPtrTy}, false);
    coolFuncs.object_copy = Function::Create(objectCopyTy, Function::ExternalLinkage, "Object_copy", &_module);
    
    // Object.abort() : Object
    FunctionType* objectAbortTy = FunctionType::get(objectPtrTy, {objectPtrTy}, false);
    coolFuncs.object_abort = Function::Create(objectAbortTy, Function::ExternalLinkage, "Object_abort", &_module);
    
    // Object.type_name() : String
    FunctionType* objectTypeNameTy = FunctionType::get(stringPtrTy, {objectPtrTy}, false);
    coolFuncs.object_type_name = Function::Create(objectTypeNameTy, Function::ExternalLinkage, "Object_type_name", &_module);
    
    // ========== IO 类方法 ==========
    
    // IO.out_string(String) : IO
    FunctionType* ioOutStringTy = FunctionType::get(ioPtrTy, {ioPtrTy, stringPtrTy}, false);
    coolFuncs.io_out_string = Function::Create(ioOutStringTy, Function::ExternalLinkage, "IO_out_string", &_module);
    
    // IO.out_int(Int) : IO
    FunctionType* ioOutIntTy = FunctionType::get(ioPtrTy, {ioPtrTy, intPtrTy}, false);
    coolFuncs.io_out_int = Function::Create(ioOutIntTy, Function::ExternalLinkage, "IO_out_int", &_module);
    
    // IO.in_string() : String
    FunctionType* ioInStringTy = FunctionType::get(stringPtrTy, {ioPtrTy}, false);
    coolFuncs.io_in_string = Function::Create(ioInStringTy, Function::ExternalLinkage, "IO_in_string", &_module);
    
    // IO.in_int() : Int
    FunctionType* ioInIntTy = FunctionType::get(intPtrTy, {ioPtrTy}, false);
    coolFuncs.io_in_int = Function::Create(ioInIntTy, Function::ExternalLinkage, "IO_in_int", &_module);
    
    // ========== String 类方法 ==========
    
    // String.length() : Int
    FunctionType* stringLengthTy = FunctionType::get(intPtrTy, {stringPtrTy}, false);
    coolFuncs.string_length = Function::Create(stringLengthTy, Function::ExternalLinkage, "String_length", &_module);
    
    // String.concat(String) : String
    FunctionType* stringConcatTy = FunctionType::get(stringPtrTy, {stringPtrTy, stringPtrTy}, false);
    coolFuncs.string_concat = Function::Create(stringConcatTy, Function::ExternalLinkage, "String_concat", &_module);
    
    // String.substr(Int, Int) : String
    FunctionType* stringSubstrTy = FunctionType::get(stringPtrTy, {stringPtrTy, intPtrTy, intPtrTy}, false);
    coolFuncs.string_substr = Function::Create(stringSubstrTy, Function::ExternalLinkage, "String_substr", &_module);
    
    // 字符串比较方法
    FunctionType* stringEqualsTy = FunctionType::get(boolPtrTy, {stringPtrTy, stringPtrTy}, false);
    coolFuncs.string_equals = Function::Create(stringEqualsTy, Function::ExternalLinkage, "String_equals", &_module);
    
    FunctionType* stringLessTy = FunctionType::get(boolPtrTy, {stringPtrTy, stringPtrTy}, false);
    coolFuncs.string_less = Function::Create(stringLessTy, Function::ExternalLinkage, "String_less", &_module);
    
    // ========== Int 类方法 ==========
    
    // Int.plus(Int) : Int
    FunctionType* intPlusTy = FunctionType::get(intPtrTy, {intPtrTy, intPtrTy}, false);
    coolFuncs.int_plus = Function::Create(intPlusTy, Function::ExternalLinkage, "Int_plus", &_module);
    
    // Int.minus(Int) : Int
    FunctionType* intMinusTy = FunctionType::get(intPtrTy, {intPtrTy, intPtrTy}, false);
    coolFuncs.int_minus = Function::Create(intMinusTy, Function::ExternalLinkage, "Int_minus", &_module);
    
    // Int.times(Int) : Int
    FunctionType* intTimesTy = FunctionType::get(intPtrTy, {intPtrTy, intPtrTy}, false);
    coolFuncs.int_times = Function::Create(intTimesTy, Function::ExternalLinkage, "Int_times", &_module);
    
    // Int.divide(Int) : Int
    FunctionType* intDivideTy = FunctionType::get(intPtrTy, {intPtrTy, intPtrTy}, false);
    coolFuncs.int_divide = Function::Create(intDivideTy, Function::ExternalLinkage, "Int_divide", &_module);
    
    // Int.negate() : Int
    FunctionType* intNegateTy = FunctionType::get(intPtrTy, {intPtrTy}, false);
    coolFuncs.int_negate = Function::Create(intNegateTy, Function::ExternalLinkage, "Int_negate", &_module);
    
    // Int比较方法
    FunctionType* intEqualsTy = FunctionType::get(boolPtrTy, {intPtrTy, intPtrTy}, false);
    coolFuncs.int_equals = Function::Create(intEqualsTy, Function::ExternalLinkage, "Int_equals", &_module);
    
    FunctionType* intLessTy = FunctionType::get(boolPtrTy, {intPtrTy, intPtrTy}, false);
    coolFuncs.int_less = Function::Create(intLessTy, Function::ExternalLinkage, "Int_less", &_module);
    
    // ========== Bool 类方法 ==========
    
    // Bool.not() : Bool
    FunctionType* boolNotTy = FunctionType::get(boolPtrTy, {boolPtrTy}, false);
    coolFuncs.bool_not = Function::Create(boolNotTy, Function::ExternalLinkage, "Bool_not", &_module);
    
    // Bool.equals(Bool) : Bool
    FunctionType* boolEqualsTy = FunctionType::get(boolPtrTy, {boolPtrTy, boolPtrTy}, false);
    coolFuncs.bool_equals = Function::Create(boolEqualsTy, Function::ExternalLinkage, "Bool_equals", &_module);
    
    // ========== 类型操作函数 ==========
    
    // isvoid(expr) : Bool
    FunctionType* isvoidTy = FunctionType::get(boolPtrTy, {objectPtrTy}, false);
    coolFuncs.isvoid = Function::Create(isvoidTy, Function::ExternalLinkage, "isvoid", &_module);
    
    // new(typename) : Object
    FunctionType* newTy = FunctionType::get(objectPtrTy, {Type::getInt32Ty(context)}, false);
    coolFuncs.new_ = Function::Create(newTy, Function::ExternalLinkage, "new", &_module);
    
    // ========== 对象生命周期 ==========
    
    // 对象初始化
    FunctionType* objectInitTy = FunctionType::get(Type::getVoidTy(context), {objectPtrTy}, false);
    coolFuncs.object_init = Function::Create(objectInitTy, Function::ExternalLinkage, "Object_init", &_module);
}

// 辅助函数
Value* CoolRuntime::createMallocCall(IRBuilder<>& builder, Value* size) {
    return builder.CreateCall(externFuncs.malloc, {size}, "malloc_result");
}

Value* CoolRuntime::createMemcpyCall(IRBuilder<>& builder, 
                                    Value* dest, Value* src, 
                                    Value* size) {
    return builder.CreateCall(externFuncs.memcpy, {dest, src, size}, "memcpy_result");
}

Type* CoolRuntime::getCoolIntType() {
    return StructType::getTypeByName(context, "Int");
}

Type* CoolRuntime::getCoolBoolType() {
    return StructType::getTypeByName(context, "Bool");
}

Type* CoolRuntime::getCoolStringType() {
    return StructType::getTypeByName(context, "String");
}

Type* CoolRuntime::getCoolObjectType() {
    return StructType::getTypeByName(context, "Object");
}