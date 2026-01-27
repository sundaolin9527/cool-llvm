#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Verifier.h>
#include <llvm/Support/raw_ostream.h>
#include <map>
#include "cgen.h"

// 一些 llvm 提供的 runtime 函数
struct RuntimeFuncs {
    static Function* mallocFunc;
    static Function* memcpyFunc;
    static Function* putsFunc;
    static Function* getsFunc;

    static void declare() {
        if (mallocFunc && memcpyFunc && putsFunc && getsFunc) return;

        PointerType* i8PtrTy = PointerType::get(Type::getInt8Ty(context), 0);

        // malloc(i64) -> i8*
        FunctionType* mallocTy = FunctionType::get(i8PtrTy, {Type::getInt64Ty(context)}, false);
        mallocFunc = Function::Create(mallocTy, Function::ExternalLinkage, "malloc", &module);

        // llvm.memcpy.p0i8.p0i8.i64
        FunctionType* memcpyTy = FunctionType::get(
            Type::getVoidTy(context),
            {i8PtrTy, i8PtrTy, Type::getInt64Ty(context),
             Type::getInt32Ty(context), Type::getInt1Ty(context)},
            false
        );
        memcpyFunc = Function::Create(memcpyTy, Function::ExternalLinkage, "llvm.memcpy.p0i8.p0i8.i64", &module);

        // puts
        FunctionType* putsTy = FunctionType::get(Type::getInt32Ty(context), {i8PtrTy}, false);
        putsFunc = Function::Create(putsTy, Function::ExternalLinkage, "puts", &module);

        // gets
        FunctionType* getsTy = FunctionType::get(i8PtrTy, {i8PtrTy}, false);
        getsFunc = Function::Create(getsTy, Function::ExternalLinkage, "gets", &module);
    }
};
Function* RuntimeFuncs::mallocFunc = nullptr;
Function* RuntimeFuncs::memcpyFunc = nullptr;
Function* RuntimeFuncs::putsFunc   = nullptr;
Function* RuntimeFuncs::getsFunc   = nullptr;

// Object的copy函数
Function* create_object_copy(Module &module, LLVMContext &context, StructType* objectTy) {
    PointerType* objPtrTy = PointerType::get(objectTy, 0);

    FunctionType* copyTy = FunctionType::get(objPtrTy, {objPtrTy}, false);
    Function* copyFunc = Function::Create(copyTy, Function::ExternalLinkage, "Object.copy", &module);

    BasicBlock* entry = BasicBlock::Create(context, "entry", copyFunc);
    IRBuilder<> builder(entry);

    // 参数
    Value* orig = &*copyFunc->args().begin();

    // 分配内存
    Value* size = ConstantInt::get(Type::getInt64Ty(context), module.getDataLayout().getTypeAllocSize(objectTy));
    Value* newObj = builder.CreateCall(RuntimeFuncs::mallocFunc, size);

    // memcpy
    Value* origI8 = builder.CreateBitCast(orig, PointerType::get(Type::getInt8Ty(context), 0));
    Value* newI8  = builder.CreateBitCast(newObj, PointerType::get(Type::getInt8Ty(context), 0));

    builder.CreateCall(RuntimeFuncs::memcpyFunc,
        {newI8, origI8, size,
         ConstantInt::get(Type::getInt32Ty(context), 8),
         ConstantInt::get(Type::getInt1Ty(context), 0)});

    builder.CreateRet(newObj);

    return copyFunc;
}

// 暂不考虑GC tag
StructType* emit_object_type()
{
    std::vector<Type*> fields;
    fields.push_back(Type::getInt32Ty(context));    // class tag
    fields.push_back(Type::getInt32Ty(context));    // object size
    fields.push_back(Type::getInt8PtrTy(context));  // dispatch pointer
    // fields.push_back(llvm::PointerType::get(llvm::Type::getInt8Ty(context), 0));
    // Todo: 函数绑定到dispatch table似乎在这里不能直接绑定，需要在初始化类的时候初始化指针(或者定义原型类)？
    // Todo: abort、typename函数以及函数绑定到dispatch table的生成、成员的初始化定义
    StructType *objectTy = StructType::create(context, fields, "Object");
    return objectTy;
}

Function* create_io_out_string(StructType* ioTy) {
    PointerType* ioPtrTy  = PointerType::get(ioTy, 0);
    PointerType* strPtrTy = PointerType::get(Type::getInt8Ty(context), 0);

    FunctionType* outTy = FunctionType::get(Type::getVoidTy(context), {ioPtrTy, strPtrTy}, false);
    Function* outFunc = Function::Create(outTy, Function::ExternalLinkage, "IO.out_string", &module);

    BasicBlock* entry = BasicBlock::Create(context, "entry", outFunc);
    IRBuilder<> builder(entry);

    Value* io  = &*outFunc->arg_begin();
    Value* str = &*std::next(outFunc->arg_begin());

    builder.CreateCall(RuntimeFuncs::putsFunc, str);
    builder.CreateRetVoid();
    return outFunc;
}

Function* create_io_in_string(StructType* ioTy) {
    PointerType* ioPtrTy  = PointerType::get(ioTy, 0);
    PointerType* strPtrTy = PointerType::get(Type::getInt8Ty(context), 0);

    FunctionType* inTy = FunctionType::get(strPtrTy, {ioPtrTy}, false);
    Function* inFunc = Function::Create(inTy, Function::ExternalLinkage, "IO.in_string", &module);

    BasicBlock* entry = BasicBlock::Create(context, "entry", inFunc);
    IRBuilder<> builder(entry);

    Value* io = &*inFunc->args().begin();

    Value* buf = builder.CreateCall(RuntimeFuncs::mallocFunc, ConstantInt::get(Type::getInt64Ty(context), 256));
    Value* str = builder.CreateCall(RuntimeFuncs::getsFunc, buf);

    builder.CreateRet(str);
    return inFunc;
}

StructType* emit_io_type() {
    std::vector<Type*> fields;
    fields.push_back(Type::getInt32Ty(context));                     // class tag
    fields.push_back(Type::getInt32Ty(context));                     // object size
    fields.push_back(PointerType::get(Type::getInt8Ty(context), 0)); // dispatch pointer
    // Todo: out_int、in_int函数生成，dispatch table的生成、成员的初始化定义
    StructType* ioTy = StructType::create(context, fields, "IO");
    return ioTy;
}

// Todo: String(成员变量是变长的)、Bool和Int类型的生成


// 返回值可以设置为void？
void emit_base_classes()
{
    emit_object_type();
    emit_io_type();
}