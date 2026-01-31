#include "cgen-llvm-ir.h"
#include <llvm/IR/Verifier.h>
#include <llvm/Support/raw_ostream.h>
#include <iostream>
#include "cgen-context.h"

llvm::Type* CodeGenerator::mapCoolTypeToLLVM(const std::string& typeName) {
    if (typeName == "Int") {
        return llvm::Type::getInt32Ty(_context.getLLVMContext());
    } else if (typeName == "Bool") {
        return llvm::Type::getInt1Ty(_context.getLLVMContext());
    } else if (typeName == "String") {
        return llvm::Type::getInt8PtrTy(_context.getLLVMContext());  // char*
    } else if (typeName == "SELF_TYPE") {
        // 当前类类型
        llvm::StructType* currentClassType = _symbolTable.getCurrentClassType();
        return (currentClassType == nullptr) ? nullptr: currentClassType->getPointerTo();
    } else if (typeName == "Object") {
        // Object 是所有类的基类
        return llvm::Type::getInt8PtrTy(_context.getLLVMContext())->getPointerTo();
    } else if (typeName == "IO") {
        // IO 类
        return llvm::Type::getInt8PtrTy(_context.getLLVMContext())->getPointerTo();
    }
    
    // 尝试查找已定义的结构体类型
    llvm::StructType* existingType = llvm::StructType::getTypeByName(_context.getLLVMContext(), typeName);
    if (existingType) {
        return llvm::PointerType::get(existingType, 0);
    }
    
    // 默认：作为指向对象的指针（二级指针）
    return llvm::Type::getInt8PtrTy(_context.getLLVMContext())->getPointerTo();
}

// ==================== 构造函数 ====================
CodeGenerator::CodeGenerator() : 
    _context(CompilerContext::getInstance()),
    _llvmModule(std::make_unique<llvm::Module>("main_module", _context.getLLVMContext())) {}

// ==================== 访问器 ====================
CompilerContext& CodeGenerator::getContext() {
    return _context;
}

SymbolTableManager& CodeGenerator::getSymbolTable() {
    return _symbolTable;
}

IRBuilder<>& CodeGenerator::getIRBuilder() {
    if (!_builder) {
        _builder = std::make_unique<llvm::IRBuilder<>>(_context.getLLVMContext());
    }
    return *_builder.get();
}

llvm::Module& CodeGenerator::getModule() {
    if (!_llvmModule) {
        _llvmModule = std::make_unique<llvm::Module>("main_module", _context.getLLVMContext());
    }
    return *_llvmModule.get();
}

// ==================== 主生成函数 ====================
void CodeGenerator::emit_llvm_ir(Program program) {

    emit_program(program);
    // LLVM 代码生成逻辑
    std::cout << "Hello, World!" << std::endl;

    // 3. 创建一个简单的函数：int main() { return 42; }
    // 创建函数类型：返回 int，无参数
    FunctionType *funcType = FunctionType::get(
        getIRBuilder().getInt32Ty(),  // 返回类型：32位整数
        false                  // 是否可变参数
    );
    
    // 创建函数
    Function *mainFunc = Function::Create(
        funcType,
        Function::ExternalLinkage,  // 链接类型
        "main",                     // 函数名
        &getModule()
    );
    
    // 4. 创建基本块（函数体）
    BasicBlock *entry = BasicBlock::Create(_context.getLLVMContext(), "entry", mainFunc);
    getIRBuilder().SetInsertPoint(entry);
    
    // 5. 生成返回值 42
    Value *retVal = getIRBuilder().getInt32(42);
    getIRBuilder().CreateRet(retVal);
    
    // 6. 验证生成的 IR
    if (verifyModule()) {
        errs() << "IR 验证失败!\n";
    }
    
    // 7. 打印生成的 LLVM IR
    getModule().print(outs(), nullptr);
}

// ==================== 工具函数 ====================
void CodeGenerator::dumpIR() {
    getModule().print(llvm::outs(), nullptr);
}

bool CodeGenerator::verifyModule() {
    if (llvm::verifyModule(getModule(), &errs())) {
        errs() << "IR 验证失败!\n";
        return false;
    }
    return true;
}
// =================================================
/**
 * 默认初始化对象（如果没有显式构造函数时使用）
 */
void CodeGenerator::default_initialize_object(llvm::Value* objPtr, ClassLayout& classLayout)
{
    llvm::IRBuilder<>& builder = getIRBuilder();
    
    // 设置class tag
    llvm::Value* tagAddr = builder.CreateStructGEP(classLayout.type, objPtr, 0);
    builder.CreateStore(
        llvm::ConstantInt::get(llvm::Type::getInt32Ty(_context.getLLVMContext()), classLayout.classTag),
        tagAddr
    );
    
    // 设置object size
    llvm::Value* sizeAddr = builder.CreateStructGEP(classLayout.type, objPtr, 1);
    builder.CreateStore(
        llvm::ConstantInt::get(llvm::Type::getInt32Ty(_context.getLLVMContext()), classLayout.objectSize),
        sizeAddr
    );
    
    // 设置dispatch pointer
    llvm::Value* dispatchAddr = builder.CreateStructGEP(classLayout.type, objPtr, 2);
    llvm::Value* vtablePtr = builder.CreateBitCast(
        classLayout.vtable,
        llvm::Type::getInt8PtrTy(_context.getLLVMContext())->getPointerTo()
    );
    builder.CreateStore(vtablePtr, dispatchAddr);
    
    // 如果有父类，需要初始化父类部分
    if (!classLayout.parentName.empty()) {
        ClassLayout* parentLayout = getSymbolTable().findClass(classLayout.parentName);
        if (parentLayout) {
            // 获取父类部分在结构体中的偏移
            llvm::Value* parentPartAddr = builder.CreateStructGEP(classLayout.type, objPtr, 3);
            
            // 默认初始化父类部分（递归调用）
            default_initialize_object(parentPartAddr, *parentLayout);
        }
    }
}

/**
 * 创建类的new函数（用于分配和初始化对象）
 */
llvm::Function* CodeGenerator::create_new_function(const std::string& className, ClassLayout& classLayout)
{
    //=== 生成new函数 ==========================================
    llvm::FunctionType* newFuncType = llvm::FunctionType::get(
        classLayout.type->getPointerTo(),
        {},
        false
    );
    
    llvm::Function* newFunc = llvm::Function::Create(
        newFuncType,
        llvm::Function::ExternalLinkage,
        className + ".new",
        getModule()
    );
    
    llvm::BasicBlock* newEntryBB = llvm::BasicBlock::Create(_context.getLLVMContext(), "entry", newFunc);
    llvm::IRBuilder<>& builder = getIRBuilder();
    builder.SetInsertPoint(newEntryBB);
    
    // 分配内存
    llvm::Value* sizeVal = llvm::ConstantInt::get(llvm::Type::getInt64Ty(_context.getLLVMContext()), classLayout.objectSize);
    
    // 获取或插入malloc函数
    llvm::FunctionCallee mallocFunc = getModule().getOrInsertFunction(
        "malloc",
        llvm::FunctionType::get(llvm::Type::getInt8PtrTy(_context.getLLVMContext()), 
                               {llvm::Type::getInt64Ty(_context.getLLVMContext())}, false)
    );
    
    llvm::Value* mem = builder.CreateCall(mallocFunc, {sizeVal});
    llvm::Value* obj = builder.CreateBitCast(mem, classLayout.type->getPointerTo());
    
    // 调用构造函数
    if (classLayout.constructor) {
        builder.CreateCall(classLayout.constructor, {obj});
    } else {
        // 如果没有显式构造函数，进行默认初始化
        default_initialize_object(obj, classLayout);
    }
    
    builder.CreateRet(obj);
    return newFunc;
}

llvm::Value *CodeGenerator::emit_new__class(new__class *new_class)
{
    #ifdef DEBUG
    std::cout << "emit_new__class" << std::endl;
    #endif
    if (new_class == nullptr) return nullptr;
    
    std::string class_name_str = new_class->type_name->get_string();
    _context.setNewClassName(class_name_str);
    llvm::IRBuilder<> &builder = getIRBuilder();

    std::string new_name = class_name_str + ".new";
    llvm::Function *new_decl = getModule().getFunction(new_name);
    
    if (!new_decl) {
        llvm::StructType *class_type = nullptr;
        
        // 查找已定义的结构体类型
        class_type = llvm::StructType::getTypeByName(_context.getLLVMContext(), class_name_str);
        if (!class_type) {
            // 如果找不到类型，创建不透明结构体（前向声明）
            class_type = llvm::StructType::create(_context.getLLVMContext(), class_name_str);
        }
        
        // 构造函数返回类的指针类型
        llvm::PointerType *return_type = class_type->getPointerTo();
        
        // 创建函数类型：返回类指针，无参数
        llvm::FunctionType *func_type = llvm::FunctionType::get(return_type, false);
        
        // 创建构造函数声明
        new_decl = llvm::Function::Create(
            func_type,
            llvm::Function::ExternalLinkage,
            new_name,
            &getModule()
        );
    }

    // 调用构造函数并返回结果
    return builder.CreateCall(new_decl, {});
}


/**
 * 内存布局：
 * offset 0-3:   Class tag
 * offset 4-7:   Object size (bytes)
 * offset 8-15:  Dispatch pointer (指向函数指针数组)
 * offset 16-...: Attributes (先基类后派生类)
 */
llvm::Value *CodeGenerator::emit_class__class(class__class* _class)
{
    #ifdef DEBUG
    std::cout << "emit_class__class" << std::endl;
    #endif
    if (_class == nullptr) return nullptr;
    
    std::string className = _class->name->get_string();
    std::cout << "className: " << className << std::endl;
    SymbolTableManager& symbol_table = getSymbolTable();
    
    // 检查是否已生成该类
    ClassLayout *cls = symbol_table.findClass(className);
    if (cls != nullptr && !cls->newFunc) {
        return cls->newFunc;
    }
    
    //=== 阶段1：收集类基本信息 ========================================
    ClassLayout classLayout = collect_class_info(_class);
    
    //=== 阶段2：构建内存布局 ==========================================
    build_memory_layout(classLayout);
    
    //=== 阶段3：构建虚表 ==============================================
    build_vtable(classLayout);
    
    //=== 阶段4：分配class tag ========================================
    classLayout.classTag = allocate_class_tag();
    
    //=== 阶段5：生成构造函数 ==========================================
    generate_constructor(classLayout);
    
    //=== 阶段6：生成new函数 ==========================================
    classLayout.newFunc = create_new_function(className, classLayout);
    
    // 注册类到符号表
    symbol_table.registerClass(classLayout);
    
    //=== 阶段7：生成方法函数 ==========================================
    generate_methods(classLayout);
    
    return classLayout.newFunc;
}

/**
 * 分配类的唯一标识符（class tag）
 */
uint32_t CodeGenerator::allocate_class_tag()
{
    static uint32_t nextClassTag = 1;
    return nextClassTag++;
}

/**
 * 收集类的基本信息（属性、方法等）
 */
ClassLayout CodeGenerator::collect_class_info(class__class* _class)
{
    ClassLayout classLayout;
    classLayout.name = _class->name->get_string();
    classLayout.parentName = _class->parent->get_string();
    
    for (int i = _class->features->first(); _class->features->more(i); i = _class->features->next(i)) {
        Feature_class *feature = _class->features->nth(i);
        
        if (attr_class *attr = dynamic_cast<attr_class*>(feature)) {
            // 收集当前类自己的属性
            std::string attrName = attr->name->get_string();
            std::string typeName = attr->type_decl->get_string();
            llvm::Type* type = mapCoolTypeToLLVM(typeName);
            
            if (typeName != "Int" && typeName != "Bool" && typeName != "String") {
                if (!type->isPointerTy()) {
                    type = type->getPointerTo();
                }
            }
            classLayout.ownAttributes.emplace(attrName, VariableInfo::createMember(type, nullptr, classLayout.name));
        }
        else if (method_class *method = dynamic_cast<method_class*>(feature)) {
            // 收集当前类自己的方法
            std::string methodName = method->name->get_string();
            ClassLayout::ClassMethodInfo methodInfo;
            methodInfo.name = methodName;
            methodInfo.method = method;
            methodInfo.func = nullptr;
            methodInfo.vtableIndex = classLayout.methods.size() + 1;
            classLayout.methods.push_back(methodInfo);
        }
    }
    
    return classLayout;
}

/**
 * 构建类的内存布局（结构体类型定义）
 */
void CodeGenerator::build_memory_layout(ClassLayout& classLayout)
{
    std::vector<llvm::Type*> structFields;
    SymbolTableManager& symbol_table = getSymbolTable();

    // 对象头
    structFields.push_back(llvm::Type::getInt32Ty(_context.getLLVMContext()));      // Class tag
    structFields.push_back(llvm::Type::getInt32Ty(_context.getLLVMContext()));      // Object size
    structFields.push_back(llvm::Type::getInt8PtrTy(_context.getLLVMContext())->getPointerTo()); // Dispatch pointer
    
    // 处理父类
    llvm::StructType* parentType = nullptr;
    if (!classLayout.parentName.empty()) {
        ClassLayout* parentLayout = symbol_table.findClass(classLayout.parentName);
        if (parentLayout && parentLayout->type) {
            parentType = parentLayout->type;
            structFields.push_back(parentType);
        }
    }
    
    // 添加当前类自己的属性
    for (const auto& attr : classLayout.ownAttributes) {
        const VariableInfo& info = attr.second;
        structFields.push_back(info.type);
    }
    
    // 创建结构体类型
    classLayout.type = llvm::StructType::create(_context.getLLVMContext(), structFields, classLayout.name);
    
    // 计算类大小
    const llvm::DataLayout DL = getModule().getDataLayout();
    classLayout.objectSize = DL.getTypeAllocSize(classLayout.type);
    return;
}

/**
 * 构建虚表和虚表索引
 */
void CodeGenerator::build_vtable(ClassLayout& classLayout)
{
    SymbolTableManager& symbol_table = getSymbolTable();
    std::string parentName = classLayout.parentName;
    ClassLayout* parentLayout = nullptr;
    
    if (!parentName.empty()) {
        parentLayout = symbol_table.findClass(parentName);
    }
    
    //=== 步骤1：合并方法（处理继承和重写） ========================
    std::map<std::string, ClassLayout::ClassMethodInfo> allMethods;
    std::vector<std::string> allMethodNamesInOrder;
    
    // 继承父类的方法
    if (parentLayout) {
        for (const auto& method : parentLayout->methods) {
            allMethods[method.name] = method;
        }
    }
    
    // 处理当前类的方法（可能重写父类方法）
    for (auto& methodInfo : classLayout.methods) {
        if (allMethods.find(methodInfo.name) != allMethods.end()) {
            // 重写父类方法
            methodInfo.vtableIndex = allMethods[methodInfo.name].vtableIndex;
            allMethods[methodInfo.name] = methodInfo;
        } else {
            // 新方法
            methodInfo.vtableIndex = allMethods.size() + 1;
            allMethods[methodInfo.name] = methodInfo;
            allMethodNamesInOrder.push_back(methodInfo.name);
        }
    }
    
    // 更新classLayout中的方法信息
    classLayout.methods.clear();
    for (const auto& methodName : allMethodNamesInOrder) {
        classLayout.methods.push_back(allMethods[methodName]);
    }
    
    //=== 步骤2：构建虚表条目 =====================================
    std::vector<llvm::Constant*> vtableEntries;
    
    // 第一个条目：对象大小
    llvm::Constant* objectSizeConst = llvm::ConstantInt::get(
        llvm::Type::getInt32Ty(_context.getLLVMContext()), 
        classLayout.objectSize
    );
    vtableEntries.push_back(llvm::ConstantExpr::getIntToPtr(
        objectSizeConst, 
        llvm::Type::getInt8PtrTy(_context.getLLVMContext())
    ));
    
    // 添加方法条目
    for (const auto& methodName : allMethodNamesInOrder) {
        llvm::Constant* funcPtr = nullptr;
        
        // 在当前类的方法中查找
        auto it = std::find_if(classLayout.methods.begin(), classLayout.methods.end(),
                              [&methodName](const ClassLayout::ClassMethodInfo& m) {
                                  return m.name == methodName;
                              });
        
        if (it != classLayout.methods.end() && it->func) {
            // 当前类的方法（已生成或重写）
            funcPtr = llvm::ConstantExpr::getBitCast(
                it->func, 
                llvm::Type::getInt8PtrTy(_context.getLLVMContext())
            );
        } else if (parentLayout) {
            // 在父类中查找
            for (const auto& parentMethod : parentLayout->methods) {
                if (parentMethod.name == methodName && parentMethod.func) {
                    funcPtr = llvm::ConstantExpr::getBitCast(
                        parentMethod.func, 
                        llvm::Type::getInt8PtrTy(_context.getLLVMContext())
                    );
                    break;
                }
            }
        }
        
        // 如果没有找到，创建空指针
        if (!funcPtr) {
            funcPtr = llvm::Constant::getNullValue(llvm::Type::getInt8PtrTy(_context.getLLVMContext()));
        }
        
        vtableEntries.push_back(funcPtr);
    }
    
    //=== 步骤3：创建虚表全局变量 =================================
    llvm::ArrayType* vtableType = llvm::ArrayType::get(
        llvm::Type::getInt8PtrTy(_context.getLLVMContext()),
        vtableEntries.size()
    );
    
    llvm::Constant* vtableInit = llvm::ConstantArray::get(vtableType, vtableEntries);
    
    std::string vtableName = "vtable." + classLayout.name;
    classLayout.vtable = new llvm::GlobalVariable(
        getModule(),
        vtableType,
        true,
        llvm::GlobalValue::PrivateLinkage,
        vtableInit,
        vtableName
    );

    return;
}

/**
 * 生成类的构造函数
 */
void CodeGenerator::generate_constructor(ClassLayout& classLayout)
{
    llvm::FunctionType* ctorType = llvm::FunctionType::get(
        llvm::Type::getVoidTy(_context.getLLVMContext()),
        {classLayout.type->getPointerTo()},
        false
    );
    
    classLayout.constructor = llvm::Function::Create(
        ctorType,
        llvm::Function::ExternalLinkage,
        classLayout.name + ".ctor",
        getModule()
    );
    
    llvm::BasicBlock* entryBB = llvm::BasicBlock::Create(_context.getLLVMContext(), "entry", classLayout.constructor);
    getIRBuilder().SetInsertPoint(entryBB);
    
    llvm::Value* thisPtr = classLayout.constructor->arg_begin();
    
    // 设置class tag
    llvm::Value* tagAddr = getIRBuilder().CreateStructGEP(classLayout.type, thisPtr, 0);
    getIRBuilder().CreateStore(
        llvm::ConstantInt::get(llvm::Type::getInt32Ty(_context.getLLVMContext()), classLayout.classTag),
        tagAddr
    );
    
    // 设置object size
    llvm::Value* sizeAddr = getIRBuilder().CreateStructGEP(classLayout.type, thisPtr, 1);
    getIRBuilder().CreateStore(
        llvm::ConstantInt::get(llvm::Type::getInt32Ty(_context.getLLVMContext()), classLayout.objectSize),
        sizeAddr
    );
    
    // 设置dispatch pointer
    llvm::Value* dispatchAddr = getIRBuilder().CreateStructGEP(classLayout.type, thisPtr, 2);
    llvm::Value* vtablePtr = getIRBuilder().CreateBitCast(
        classLayout.vtable,
        llvm::Type::getInt8PtrTy(_context.getLLVMContext())->getPointerTo()
    );
    getIRBuilder().CreateStore(vtablePtr, dispatchAddr);
    
    // 初始化属性
    unsigned startIndex = 3; // 3个头字段
    unsigned i = 0;
    for (auto& attr : classLayout.ownAttributes) {
        VariableInfo& varInfo = attr.second;
        llvm::Type* fieldType = varInfo.type;
        llvm::Value* fieldAddr = getIRBuilder().CreateStructGEP(classLayout.type, thisPtr, startIndex + i);
        
        if (fieldType->isIntegerTy(32)) {
            getIRBuilder().CreateStore(llvm::ConstantInt::get(llvm::Type::getInt32Ty(_context.getLLVMContext()), 0), fieldAddr);
        } else if (fieldType->isIntegerTy(1)) {
            getIRBuilder().CreateStore(llvm::ConstantInt::getFalse(_context.getLLVMContext()), fieldAddr);
        } else if (fieldType->isPointerTy()) {
            getIRBuilder().CreateStore(llvm::Constant::getNullValue(fieldType), fieldAddr);
        }
        
        varInfo.updateValue(fieldAddr);
        i++;
    }
    // 每一个类都有一个名为self的成员变量
    classLayout.ownAttributes.emplace("self", VariableInfo::createMember(
        classLayout.type, classLayout.constructor, classLayout.name));

    getIRBuilder().CreateRetVoid();
    return;
}

/**
 * 生成类的方法函数
 */
void CodeGenerator::generate_methods(ClassLayout& classLayout)
{
    getSymbolTable().enterClass(classLayout.name);
    
    for (auto& methodInfo : classLayout.methods) {
        if (methodInfo.method) {
            llvm::Value *value = emit_method_class(methodInfo.method);
            methodInfo.func = llvm::dyn_cast<llvm::Function>(value);
        }
    }
    
    getSymbolTable().exitClass();
    return;
}

llvm::Value *CodeGenerator::emit_class_(Class_ class_)
{
    #ifdef DEBUG
    std::cout << "emit_class_" << std::endl;
    #endif
    return emit_class__class((class__class*)class_);
}

llvm::Value *CodeGenerator::emit_method_class(method_class* method)
{
    #ifdef DEBUG
    std::cout << "emit_method_class" << std::endl;
    #endif
    if (method == nullptr) return nullptr;

    getSymbolTable().enterScope();
    // 确定返回类型
    std::string returnTypeName = method->return_type->get_string();
    llvm::Type* returnType = nullptr;
    
    std::string className = getSymbolTable().getCurrentClassName();
    
    ClassLayout* classLayout = getSymbolTable().findClass(className);
    returnType = mapCoolTypeToLLVM(returnTypeName);
    // (todo*) 是否需要加判断
    if (returnTypeName != "Int" && returnTypeName != "Bool" && returnTypeName != "String") {
        if (!returnType->isPointerTy()) {
            returnType = returnType->getPointerTo();
        }
    }

    // 构建参数列表
    FormalParams params = emit_formals(method->formals, classLayout->type);
    std::vector<std::string>& paramNames = params.first;
    std::vector<llvm::Type*>& paramTypes = params.second;
    
    llvm::FunctionType* funcType = llvm::FunctionType::get(returnType, paramTypes, false);
    
    std::string funcName = className + "." + method->name->get_string();
    // ========== 创建函数原型 ===========
    llvm::Function* func = llvm::Function::Create(
        funcType,
        llvm::Function::ExternalLinkage,
        funcName,
        getModule()
    );

    assert(func->arg_size() == paramNames.size() && 
        "Function argument count doesn't match parameter names!");

    // 设置参数名称
    size_t i = 0;
    for (auto& arg : func->args()) {
        arg.setName(paramNames[i++]);
    }
    // ========== 创建函数体入口 ==========
    if (method->expr != nullptr){
        // 创建基本块（函数体入口）
        llvm::BasicBlock* entryBlock = llvm::BasicBlock::Create(
            _context.getLLVMContext(),
            "entry",
            func
        );
        getIRBuilder().SetInsertPoint(entryBlock);
        
        i = 0;
        SymbolTableManager::ScopeFrame* curr_scope = getSymbolTable().currentScope();
        assert(curr_scope != nullptr);
        // 为参数创建alloca指令
        for (auto& arg : func->args()) {
            // 创建alloca指令分配空间
            llvm::AllocaInst* alloca = getIRBuilder().CreateAlloca(
                arg.getType(),
                nullptr,
                arg.getName() + ".addr"
            );
            // 存储参数值到分配的空间
            getIRBuilder().CreateStore(&arg, alloca);
            curr_scope->addVariable(paramNames[i], VariableInfo::createParam(paramTypes[i], alloca, className));
            i++;
        }
        
        // 5.2 生成方法体的表达式/语句
        llvm::BasicBlock* bodyBlock = llvm::BasicBlock::Create(
            _context.getLLVMContext(),
            "body",
            func
        );
        getIRBuilder().CreateBr(bodyBlock);
        getIRBuilder().SetInsertPoint(bodyBlock);
        llvm::Value* result = emit_expression(method->expr);

        // 5.3 创建返回指令
        if (returnType->isVoidTy()) {
            getIRBuilder().CreateRetVoid();
        } else {
            // 确保结果类型匹配返回类型
            if (result->getType() != returnType) {
                // 可能需要类型转换
                result = getIRBuilder().CreateBitCast(result, returnType, "result");
            }
            getIRBuilder().CreateRet(result);
        }
    }

    getSymbolTable().exitScope();
    return func;
}

llvm::Value *CodeGenerator::emit_attr_class(attr_class* attr)
{
    #ifdef DEBUG
    std::cout << "emit_attr_class" << std::endl;
    #endif
    if (attr == nullptr) return nullptr;
}

llvm::Value *CodeGenerator::emit_feature(Feature feature)
{
    #ifdef DEBUG
    std::cout << "emit_feature" << std::endl;
    #endif
    if (feature == nullptr) return nullptr;
    if (auto* method = dynamic_cast<method_class*>(feature)) {
        return emit_method_class(method);
    } else if (auto* attr = dynamic_cast<attr_class*>(feature)) {
        return emit_attr_class(attr);
    }
    return nullptr;
}

FormalParams CodeGenerator::emit_formals(Formals formals, llvm::Type* classType)
{
    #ifdef DEBUG
    std::cout << "emit_formals" << std::endl;
    #endif
    std::vector<std::string> paramNames;
    std::vector<llvm::Type*> paramTypes;

    paramNames.push_back("this");
    paramTypes.push_back(classType->getPointerTo());
    
    if (formals == nullptr) {
        return {paramNames, paramTypes};
    }
    

    for (int i = formals->first(); formals->more(i); i = formals->next(i)) {
        
        formal_class* formal = dynamic_cast<formal_class*>(formals->nth(i));
        if (!formal) continue;
        
        std::string paramName = formal->name->get_string();
        std::string paramTypeName = formal->type_decl->get_string();
        llvm::Type* paramType = mapCoolTypeToLLVM(paramTypeName);
        
        assert(paramType != nullptr && "mapCoolTypeToLLVM returned null");
        
        if (paramTypeName != "Int" && paramTypeName != "Bool" && paramTypeName != "String") {
            if (!paramType->isPointerTy()) {
                paramType = paramType->getPointerTo();
            }
        }

        paramNames.push_back(paramName);
        paramTypes.push_back(paramType);
    }
    
    return {paramNames, paramTypes};
}

llvm::Value *CodeGenerator::emit_assign_class(assign_class* expression)
{
    #ifdef DEBUG
    std::cout << "emit_assign_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr;

    llvm::Value* rhs = emit_expression(expression->expr);
    if (!rhs) {
        std::cerr << "Error: Failed to evaluate RHS of assignment" << std::endl;
        return nullptr;
    }

    VariableInfo* varInfo = findVariable(getSymbolTable().getCurrentClassName(), expression->name->get_string());
    if (!varInfo) 
    {
        std::cerr << "Error: VariableInfo is null" << std::endl;
        return nullptr;
    }
    // llvm::Type* expectedType = varInfo.type;
    // llvm::Type* actualType = rhs->getType();
    // 需要检测类型是否一致(todo*)
    getIRBuilder().CreateStore(rhs, varInfo->value);
    return rhs;
}

llvm::Value *CodeGenerator::emit_static_dispatch_class(static_dispatch_class* expression)
{
    #ifdef DEBUG
    std::cout << "emit_static_dispatch_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr;
}

llvm::Value *CodeGenerator::emit_dispatch_class(dispatch_class* expression)
{
    #ifdef DEBUG
    std::cout << "emit_dispatch_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr; 

    llvm::IRBuilder<> &builder = getIRBuilder();
    // 1. 获取对象指针
    llvm::Value *ptr = emit_expression(expression->expr);
    
    // 2. 准备参数
    std::vector<llvm::Value*> args;
    args.push_back(ptr); // 第一个参数是对象指针（this指针）
    
    Expressions actuals = expression->actual; 
    for (int i = actuals->first(); actuals->more(i); i = actuals->next(i)) {
        llvm::Value *arg_value = emit_expression(actuals->nth(i));
        args.push_back(arg_value);
    }
    
    // 3. 获取函数名
    std::string func_name = _context.getNewClassName() + "." + expression->name->get_string();
    
    // 4. 获取函数
    llvm::Function *func = getModule().getFunction(func_name);
    if (!func) {
        // 构建参数类型列表
        std::vector<llvm::Type*> param_types;
        for (auto &arg : args) {
            param_types.push_back(arg->getType());
        }
        
        // 创建不透明指针作为占位符
        llvm::Type *return_type = llvm::PointerType::get(
            llvm::StructType::create(_context.getLLVMContext(), "placeholder"), 
            0
        );
        
        // 创建函数类型
        llvm::FunctionType *func_type = llvm::FunctionType::get(
            return_type, param_types, false);
        
        // 创建函数声明
        func = llvm::Function::Create(
            func_type,
            llvm::Function::ExternalLinkage,
            func_name,
            &getModule()
        );
    }
    
    // 5. 生成调用指令
    llvm::Value *result = builder.CreateCall(func, args);

    // 6. 返回调用结果
    return ptr;
}

llvm::Value *CodeGenerator::emit_cond_class(cond_class* expression)
{
    #ifdef DEBUG
    std::cout << "emit_cond_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr;

    llvm::Function* current_function = getIRBuilder().GetInsertBlock()->getParent();
    llvm::Value* pred_value = emit_expression(expression->pred);

     // 确保条件值是布尔类型
    if (!pred_value->getType()->isIntegerTy(1)) {
        if (pred_value->getType()->isIntegerTy()) {
            // 整数类型：比较是否不等于0
            llvm::Value* zero = llvm::ConstantInt::get(pred_value->getType(), 0);
            pred_value = getIRBuilder().CreateICmpNE(pred_value, zero, "bool_cmp");
        } else if (pred_value->getType()->isPointerTy()) {
            // 指针类型：比较是否不等于nullptr
            llvm::Value* null_ptr = llvm::ConstantPointerNull::get(
                static_cast<llvm::PointerType*>(pred_value->getType())
            );
            pred_value = getIRBuilder().CreateICmpNE(pred_value, null_ptr, "ptr_cmp");
        } else if (pred_value->getType()->isFloatingPointTy()) {
            // 浮点类型：比较是否不等于0.0
            llvm::Value* zero_float = llvm::ConstantFP::get(pred_value->getType(), 0.0);
            pred_value = getIRBuilder().CreateFCmpONE(pred_value, zero_float, "float_cmp");
        } else {
            // 其他类型：尝试转换为i1
            pred_value = getIRBuilder().CreateICmpNE(
                getIRBuilder().CreatePtrToInt(pred_value, llvm::Type::getInt64Ty(_context.getLLVMContext())),
                llvm::ConstantInt::get(llvm::Type::getInt64Ty(_context.getLLVMContext()), 0),
                "generic_cmp"
            );
        }
    }
    
    // 2. 创建基本块
    llvm::BasicBlock* then_block = llvm::BasicBlock::Create(_context.getLLVMContext(), "then", current_function);
    llvm::BasicBlock* else_block = llvm::BasicBlock::Create(_context.getLLVMContext(), "else");
    llvm::BasicBlock* merge_block = llvm::BasicBlock::Create(_context.getLLVMContext(), "ifcont");
    
    // 3. 创建条件分支
    getIRBuilder().CreateCondBr(pred_value, then_block, else_block);
    
    // 4. 生成 then 分支
    getIRBuilder().SetInsertPoint(then_block);
    llvm::Value* then_value = emit_expression(expression->then_exp);
    
    // 检查 then 分支是否已经终止（例如包含 return 语句）
    bool then_terminated = getIRBuilder().GetInsertBlock()->getTerminator() != nullptr;
    if (!then_terminated) {
        getIRBuilder().CreateBr(merge_block);
    }
    
    // 保存 then 分支的结束基本块
    llvm::BasicBlock* then_end_block = getIRBuilder().GetInsertBlock();
    
    // 5. 生成 else 分支
    else_block->insertInto(current_function);
    getIRBuilder().SetInsertPoint(else_block);
    llvm::Value* else_value = emit_expression(expression->else_exp);
    
    // 检查 else 分支是否已经终止
    bool else_terminated = getIRBuilder().GetInsertBlock()->getTerminator() != nullptr;
    if (!else_terminated) {
        getIRBuilder().CreateBr(merge_block);
    }
    
    // 保存 else 分支的结束基本块
    llvm::BasicBlock* else_end_block = getIRBuilder().GetInsertBlock();
    
    // 6. 添加 merge 块到函数
    merge_block->insertInto(current_function);
    getIRBuilder().SetInsertPoint(merge_block);
    
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
                    then_value = getIRBuilder().CreateSExt(then_value, else_value->getType(), "sext_then");
                } else if (then_bits > else_bits) {
                    // 扩展 else_value
                    else_value = getIRBuilder().CreateSExt(else_value, then_value->getType(), "sext_else");
                }
            }
        }
        
        // 创建 phi 节点合并两个分支的值
        llvm::PHINode* phi_node = getIRBuilder().CreatePHI(
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

llvm::Value *CodeGenerator::emit_loop_class(loop_class* expression)
{
    #ifdef DEBUG
    std::cout << "emit_loop_class" << std::endl;
    #endif
    Function *TheFunction = getIRBuilder().GetInsertBlock()->getParent();
    BasicBlock *CondBB  = BasicBlock::Create(_context.getLLVMContext(), "loop.cond", TheFunction);
    BasicBlock *BodyBB  = BasicBlock::Create(_context.getLLVMContext(), "loop.body", TheFunction);
    BasicBlock *AfterBB = BasicBlock::Create(_context.getLLVMContext(), "loop.after", TheFunction);

    // entry -> cond
    getIRBuilder().CreateBr(CondBB);
    getIRBuilder().SetInsertPoint(CondBB);

    llvm::Value* predVal = emit_expression(expression->pred);
    if (!predVal) return nullptr;

    getIRBuilder().CreateCondBr(predVal, BodyBB, AfterBB);

    // body -> cond
    getIRBuilder().SetInsertPoint(BodyBB);
    emit_expression(expression->body);
    getIRBuilder().CreateBr(CondBB); // 重新回到条件

    // loop exit
    getIRBuilder().SetInsertPoint(AfterBB);

    return llvm::ConstantInt::get(getIRBuilder().getInt32Ty(), 0);
}

llvm::Value *CodeGenerator::emit_typcase_class(typcase_class* expression)
{
    #ifdef DEBUG
    std::cout << "emit_typcase_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr;
}

llvm::Value *CodeGenerator::emit_block_class(block_class* expression)
{
    #ifdef DEBUG
    std::cout << "emit_block_class" << std::endl;
    #endif
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
            llvm::Type::getInt8PtrTy(_context.getLLVMContext()));
    }
    
    return result;
}

llvm::Value *CodeGenerator::emit_let_class(let_class* expression)
{
    #ifdef DEBUG
    std::cout << "emit_let_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr;

    getSymbolTable().enterScope();
    
    const std::string& varName =  std::string(expression->identifier->get_string());
    llvm::Type* decl_type = mapCoolTypeToLLVM(expression->type_decl->get_string());
    llvm::AllocaInst* alloca = getIRBuilder().CreateAlloca(decl_type, nullptr, varName);
    llvm::Value* initVal = emit_expression(expression->init);
    if (initVal != nullptr) {
        getIRBuilder().CreateStore(initVal, alloca);
    }

    (getSymbolTable().currentScope())->addVariable(varName, 
        VariableInfo::createParam(decl_type, alloca, getSymbolTable().getCurrentClassName()));

    llvm::Value* result = emit_expression(expression->body);

    // 退出作用域
    getSymbolTable().exitScope();
    return result;
}

llvm::Value* CodeGenerator::emit_plus_class(plus_class* expression) {
    #ifdef DEBUG
    std::cout << "emit_plus_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr;
    llvm::Value* left_val = emit_expression(expression->e1);
    llvm::Value* right_val = emit_expression(expression->e2);
    return getIRBuilder().CreateAdd(left_val, right_val, "addtmp");
}

llvm::Value* CodeGenerator::emit_sub_class(sub_class* expression) {
    #ifdef DEBUG
    std::cout << "emit_sub_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr;
    llvm::Value* left_val = emit_expression(expression->e1);
    llvm::Value* right_val = emit_expression(expression->e2);
    
    return getIRBuilder().CreateSub(left_val, right_val, "subtmp");
}

llvm::Value* CodeGenerator::emit_mul_class(mul_class* expression) {
    #ifdef DEBUG
    std::cout << "emit_mul_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr;

    llvm::Value* left_val = emit_expression(expression->e1);
    llvm::Value* right_val = emit_expression(expression->e2);
    
    return getIRBuilder().CreateMul(left_val, right_val, "multmp");
}

llvm::Value* CodeGenerator::emit_divide_class(divide_class* expression) {
    #ifdef DEBUG
    std::cout << "emit_divide_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr;

    llvm::Value* left_val = emit_expression(expression->e1);
    llvm::Value* right_val = emit_expression(expression->e2);
    
    return getIRBuilder().CreateSDiv(left_val, right_val, "divtmp");
}

llvm::Value* CodeGenerator::emit_neg_class(neg_class* expression) {
    #ifdef DEBUG
    std::cout << "emit_neg_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr;

    llvm::Value* val = emit_expression(expression->e1);
    
    llvm::Value* zero = llvm::ConstantInt::get(getIRBuilder().getInt32Ty(), 0);
    return getIRBuilder().CreateSub(zero, val, "negtmp");
}

llvm::Value* CodeGenerator::emit_lt_class(lt_class* expression) {
    #ifdef DEBUG
    std::cout << "emit_lt_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr;

    llvm::Value* left_val = emit_expression(expression->e1);
    llvm::Value* right_val = emit_expression(expression->e2);
    
    return getIRBuilder().CreateICmpSLT(left_val, right_val, "cmptmp");
}

llvm::Value* CodeGenerator::emit_eq_class(eq_class* expression) {
    #ifdef DEBUG
    std::cout << "emit_leq_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr;

    llvm::Value* left_val = emit_expression(expression->e1);
    llvm::Value* right_val = emit_expression(expression->e2);
    
    return getIRBuilder().CreateICmpEQ(left_val, right_val, "eqtmp");
}

llvm::Value* CodeGenerator::emit_leq_class(leq_class* expression) {
    #ifdef DEBUG
    std::cout << "emit_leq_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr;

    llvm::Value* left_val = emit_expression(expression->e1);
    llvm::Value* right_val = emit_expression(expression->e2);
    
    return getIRBuilder().CreateICmpSLE(left_val, right_val, "leqtmp");
}

llvm::Value* CodeGenerator::emit_comp_class(comp_class* expression) {
    #ifdef DEBUG
    std::cout << "emit_comp_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr;

    llvm::Value* val = emit_expression(expression->e1);
    return getIRBuilder().CreateNot(val, "comptmp");
}

llvm::Value* CodeGenerator::emit_int_const_class(int_const_class* expression) {
    #ifdef DEBUG
    std::cout << "emit_int_const_class" << std::endl;
    #endif
    if (expression == nullptr || expression->token == nullptr) {
        return nullptr;
    }

    int value = std::stoi(expression->token->get_string());
    return llvm::ConstantInt::get(getIRBuilder().getInt32Ty(), value);
}

llvm::Value* CodeGenerator::emit_bool_const_class(bool_const_class* expression) 
{
    #ifdef DEBUG
    std::cout << "emit_bool_const_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr;

    return llvm::ConstantInt::get(getIRBuilder().getInt1Ty(), expression->val ? 1 : 0);
}

llvm::Value* CodeGenerator::emit_string_const_class(string_const_class* expression) {
    #ifdef DEBUG
    std::cout << "emit_string_const_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr;
}

llvm::Value* CodeGenerator::emit_isvoid_class(isvoid_class* expression) {
    #ifdef DEBUG
    std::cout << "emit_isvoid_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr;

    llvm::Value* val = emit_expression(expression->e1);
    
    llvm::Value* null_val = llvm::Constant::getNullValue(val->getType());
    return getIRBuilder().CreateICmpEQ(val, null_val, "isvoidtmp");
}

llvm::Value* CodeGenerator::emit_no_expr_class(no_expr_class* expression) {
    #ifdef DEBUG
    std::cout << "emit_no_expr_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr;
    // 没有表达式，规定返回 nullptr, 用于在返回的地方判断
    return nullptr;
}

VariableInfo* CodeGenerator::findVariable(const std::string& className, const std::string& varName) 
{
    return _symbolTable.findVariable(className, varName);
}

llvm::Value* CodeGenerator::emit_object_class(object_class* expression) {
    #ifdef DEBUG
    std::cout << "emit_object_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr;

    VariableInfo* varInfo = findVariable(getSymbolTable().getCurrentClassName(), expression->name->get_string());
    if (!varInfo || !varInfo->value) {
        std::cout << "VariableInfo not found" << std::endl;
        return nullptr;
    }

    return getIRBuilder().CreateLoad(varInfo->type,varInfo->value, expression->name->get_string());
}

llvm::Value* CodeGenerator::emit_expression(Expression e) {
    #ifdef DEBUG
    std::cout << "emit_expression" << std::endl;
    #endif
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
    else if (auto* expr = dynamic_cast<cond_class*>(e)) {
        return emit_cond_class(expr);
    }
    else if (auto* expr = dynamic_cast<block_class*>(e)) {
        return emit_block_class(expr);
    }
    else if (auto* expr = dynamic_cast<assign_class*>(e)) {
        return emit_assign_class(expr);
    }
    else if (auto* expr = dynamic_cast<new__class*>(e)) {
        return emit_new__class(expr);
    }
    std::cerr << "Error: Unknown expression type: " << typeid(*e).name() << std::endl;
    return nullptr;
}

llvm::Value *CodeGenerator::emit_branch_class(branch_class *branch)
{
    #ifdef DEBUG
    std::cout << "emit_branch_class" << std::endl;
    #endif
    if (branch == nullptr) return nullptr;

}

llvm::Value *CodeGenerator::emit_case(Case _case)
{
    #ifdef DEBUG
    std::cout << "emit_case" << std::endl;
    #endif
    return emit_branch_class((branch_class*)_case);
}

llvm::Value *CodeGenerator::emit_program_class(program_class *program)
{
    #ifdef DEBUG
    std::cout << "emit_program_class" << std::endl;
    #endif
    if (program == nullptr) return nullptr;
    
    Classes classes = program->classes;
    for(int i = classes->first(); classes->more(i); i = classes->next(i))
    {
        emit_class_(classes->nth(i));
    }
    getModule().print(outs(), nullptr);
    // 返回值应该获取Main类中的main函数??
    return nullptr;
}

llvm::Value* CodeGenerator::emit_program(Program program) 
{
    #ifdef DEBUG
    std::cout << "emit_program" << std::endl;
    #endif

    return emit_program_class((program_class*)program);
}