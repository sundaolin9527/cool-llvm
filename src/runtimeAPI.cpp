#include "runtimeAPI.h"
#include <llvm/IR/Function.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/DerivedTypes.h>

using namespace llvm;

RuntimeAPI::RuntimeAPI(LLVMContext& ctx, Module& mod)
    : context(ctx), _module(mod) {
    declareAllFunctions();    
}

void RuntimeAPI::declareAllFunctions() {
    declareStandardLibraryFunctions();
    declareCoolBuiltinFunctions();
}

void RuntimeAPI::declareStandardLibraryFunctions() {
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

void RuntimeAPI::declareCoolBuiltinFunctions() {
    llvm::LLVMContext& ctx = _module.getContext();
    
    // ========== 基本类型 ==========
    llvm::Type* i32Ty = llvm::Type::getInt32Ty(ctx);
    llvm::Type* i1Ty = llvm::Type::getInt1Ty(ctx);
    llvm::Type* i8PtrTy = llvm::Type::getInt8PtrTy(ctx);
    
    // ========== 类类型（只有 Object、IO、以及用户定义的类）==========
    llvm::StructType* objectTy = llvm::StructType::getTypeByName(ctx, "class.Object");
    if (!objectTy) {
        objectTy = llvm::StructType::create(ctx, "class.Object");
    }
    llvm::PointerType* objectPtrTy = llvm::PointerType::get(objectTy, 0);
    
    llvm::StructType* ioTy = llvm::StructType::getTypeByName(ctx, "class.IO");
    if (!ioTy) {
        ioTy = llvm::StructType::create(ctx, "class.IO");
    }
    llvm::PointerType* ioPtrTy = llvm::PointerType::get(ioTy, 0);
    
    // String 在 Cool 中是基本类型，用 i8* 表示
    llvm::Type* stringTy = i8PtrTy;
    
    // ========== Object 类方法 ==========
    // Object_copy() : Object
    llvm::FunctionType* objectCopyTy = llvm::FunctionType::get(objectPtrTy, {objectPtrTy}, false);
    coolFuncs.object_copy = llvm::Function::Create(objectCopyTy, llvm::Function::ExternalLinkage, "Object_copy", &_module);
    
    // Object_abort() : Object
    llvm::FunctionType* objectAbortTy = llvm::FunctionType::get(objectPtrTy, {objectPtrTy}, false);
    coolFuncs.object_abort = llvm::Function::Create(objectAbortTy, llvm::Function::ExternalLinkage, "Object_abort", &_module);
    coolFuncs.object_abort->addFnAttr(llvm::Attribute::NoReturn);
    
    // Object_type_name() : String
    llvm::FunctionType* objectTypeNameTy = llvm::FunctionType::get(stringTy, {objectPtrTy}, false);
    coolFuncs.object_type_name = llvm::Function::Create(objectTypeNameTy, llvm::Function::ExternalLinkage, "Object_type_name", &_module);
    
    // ========== IO 类方法 ==========
    // IO_out_string(String) : IO
    llvm::FunctionType* ioOutStringTy = llvm::FunctionType::get(ioPtrTy, {ioPtrTy, stringTy}, false);
    coolFuncs.io_out_string = llvm::Function::Create(ioOutStringTy, llvm::Function::ExternalLinkage, "IO_out_string", &_module);
    
    // IO_out_int(Int) : IO
    llvm::FunctionType* ioOutIntTy = llvm::FunctionType::get(ioPtrTy, {ioPtrTy, i32Ty}, false);
    coolFuncs.io_out_int = llvm::Function::Create(ioOutIntTy, llvm::Function::ExternalLinkage, "IO_out_int", &_module);
    
    // IO_in_string() : String
    llvm::FunctionType* ioInStringTy = llvm::FunctionType::get(stringTy, {ioPtrTy}, false);
    coolFuncs.io_in_string = llvm::Function::Create(ioInStringTy, llvm::Function::ExternalLinkage, "IO_in_string", &_module);
    
    // IO_in_int() : Int
    llvm::FunctionType* ioInIntTy = llvm::FunctionType::get(i32Ty, {ioPtrTy}, false);
    coolFuncs.io_in_int = llvm::Function::Create(ioInIntTy, llvm::Function::ExternalLinkage, "IO_in_int", &_module);
    
    // ========== String 基本类型方法 ==========
    // String_length() : Int
    llvm::FunctionType* stringLengthTy = llvm::FunctionType::get(i32Ty, {stringTy}, false);
    coolFuncs.string_length = llvm::Function::Create(stringLengthTy, llvm::Function::ExternalLinkage, "String_length", &_module);
    
    // String_concat(String) : String
    llvm::FunctionType* stringConcatTy = llvm::FunctionType::get(stringTy, {stringTy, stringTy}, false);
    coolFuncs.string_concat = llvm::Function::Create(stringConcatTy, llvm::Function::ExternalLinkage, "String_concat", &_module);
    
    // String_substr(Int, Int) : String
    llvm::FunctionType* stringSubstrTy = llvm::FunctionType::get(stringTy, {stringTy, i32Ty, i32Ty}, false);
    coolFuncs.string_substr = llvm::Function::Create(stringSubstrTy, llvm::Function::ExternalLinkage, "String_substr", &_module);
    
    // String_equals(String) : Bool
    llvm::FunctionType* stringEqualsTy = llvm::FunctionType::get(i1Ty, {stringTy, stringTy}, false);
    coolFuncs.string_equals = llvm::Function::Create(stringEqualsTy, llvm::Function::ExternalLinkage, "String_equals", &_module);
    
    // ========== Int 基本类型方法 ==========
    // Int_plus(Int) : Int
    llvm::FunctionType* intPlusTy = llvm::FunctionType::get(i32Ty, {i32Ty, i32Ty}, false);
    coolFuncs.int_plus = llvm::Function::Create(intPlusTy, llvm::Function::ExternalLinkage, "Int_plus", &_module);
    
    // Int_minus(Int) : Int
    llvm::FunctionType* intMinusTy = llvm::FunctionType::get(i32Ty, {i32Ty, i32Ty}, false);
    coolFuncs.int_minus = llvm::Function::Create(intMinusTy, llvm::Function::ExternalLinkage, "Int_minus", &_module);
    
    // Int_times(Int) : Int
    llvm::FunctionType* intTimesTy = llvm::FunctionType::get(i32Ty, {i32Ty, i32Ty}, false);
    coolFuncs.int_times = llvm::Function::Create(intTimesTy, llvm::Function::ExternalLinkage, "Int_times", &_module);
    
    // Int_divide(Int) : Int
    llvm::FunctionType* intDivideTy = llvm::FunctionType::get(i32Ty, {i32Ty, i32Ty}, false);
    coolFuncs.int_divide = llvm::Function::Create(intDivideTy, llvm::Function::ExternalLinkage, "Int_divide", &_module);
    
    // Int_negate() : Int
    llvm::FunctionType* intNegateTy = llvm::FunctionType::get(i32Ty, {i32Ty}, false);
    coolFuncs.int_negate = llvm::Function::Create(intNegateTy, llvm::Function::ExternalLinkage, "Int_negate", &_module);
    
    // Int_equals(Int) : Bool
    llvm::FunctionType* intEqualsTy = llvm::FunctionType::get(i1Ty, {i32Ty, i32Ty}, false);
    coolFuncs.int_equals = llvm::Function::Create(intEqualsTy, llvm::Function::ExternalLinkage, "Int_equals", &_module);
    
    // ========== Bool 基本类型方法 ==========
    // Bool_not() : Bool
    llvm::FunctionType* boolNotTy = llvm::FunctionType::get(i1Ty, {i1Ty}, false);
    coolFuncs.bool_not = llvm::Function::Create(boolNotTy, llvm::Function::ExternalLinkage, "Bool_not", &_module);
    
    // Bool_equals(Bool) : Bool
    llvm::FunctionType* boolEqualsTy = llvm::FunctionType::get(i1Ty, {i1Ty, i1Ty}, false);
    coolFuncs.bool_equals = llvm::Function::Create(boolEqualsTy, llvm::Function::ExternalLinkage, "Bool_equals", &_module);
    
    // ========== 类型操作函数 ==========
    // isvoid(expr) : Bool
    llvm::FunctionType* isvoidTy = llvm::FunctionType::get(i1Ty, {objectPtrTy}, false);
    coolFuncs.isvoid = llvm::Function::Create(isvoidTy, llvm::Function::ExternalLinkage, "isvoid", &_module);
    
    // new(typename) : Object
    llvm::FunctionType* newTy = llvm::FunctionType::get(objectPtrTy, {i32Ty}, false);
    coolFuncs.new_ = llvm::Function::Create(newTy, llvm::Function::ExternalLinkage, "new", &_module);
    
    // 对象初始化
    llvm::FunctionType* objectInitTy = llvm::FunctionType::get(llvm::Type::getVoidTy(ctx), {objectPtrTy}, false);
    coolFuncs.object_init = llvm::Function::Create(objectInitTy, llvm::Function::ExternalLinkage, "Object_init", &_module);
}

// 类型
Type* RuntimeAPI::getCoolIntType() {
    return StructType::getTypeByName(context, "Int");
}

Type* RuntimeAPI::getCoolBoolType() {
    return StructType::getTypeByName(context, "Bool");
}

Type* RuntimeAPI::getCoolStringType() {
    return StructType::getTypeByName(context, "String");
}

Type* RuntimeAPI::getCoolObjectType() {
    return StructType::getTypeByName(context, "Object");
}
