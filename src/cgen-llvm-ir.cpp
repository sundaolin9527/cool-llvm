#include "cgen-llvm-ir.h"
#include <llvm/IR/Verifier.h>
#include <llvm/Support/raw_ostream.h>
#include <iostream>
#include <algorithm>
#include "cgen-context.h"

namespace {

std::string normalize_cool_type(SymbolTableManager& symbolTable, const std::string& typeName);

llvm::Type* map_cool_type(CodeGenerator& generator, const std::string& typeName) {
    SymbolTableManager& symbolTable = generator.getSymbolTable();
    llvm::LLVMContext& ctx = generator.getContext().getLLVMContext();
    std::string normalized = normalize_cool_type(symbolTable, typeName);

    if (normalized == "Int") {
        return llvm::Type::getInt32Ty(ctx);
    }
    if (normalized == "Bool") {
        return llvm::Type::getInt1Ty(ctx);
    }
    if (normalized == "String") {
        return llvm::Type::getInt8PtrTy(ctx);
    }

    std::string structName = "class." + normalized;
    if (llvm::StructType* structType = llvm::StructType::getTypeByName(ctx, structName)) {
        return llvm::PointerType::get(structType, 0);
    }

    return llvm::Type::getInt8PtrTy(ctx)->getPointerTo();
}

std::string normalize_cool_type(SymbolTableManager& symbolTable, const std::string& typeName) {
    if (typeName.empty() || typeName == "SELF_TYPE") {
        return symbolTable.getCurrentClassName();
    }
    return typeName;
}

bool is_primitive_cool_type(const std::string& typeName) {
    return typeName == "String" || typeName == "Int" || typeName == "Bool";
}

std::string builtin_return_type(const std::string& receiverType, const std::string& methodName) {
    if (receiverType == "String") {
        if (methodName == "length") return "Int";
        if (methodName == "concat" || methodName == "substr") return "String";
        if (methodName == "equals") return "Bool";
    }
    if (receiverType == "Int") {
        if (methodName == "plus" || methodName == "minus" || methodName == "times" ||
            methodName == "divide" || methodName == "negate") {
            return "Int";
        }
        if (methodName == "equals") return "Bool";
    }
    if (receiverType == "Bool") {
        if (methodName == "not" || methodName == "equals") return "Bool";
    }
    if (receiverType == "Object") {
        if (methodName == "copy") return "SELF_TYPE";
        if (methodName == "abort") return "Object";
        if (methodName == "type_name") return "String";
    }
    if (receiverType == "IO") {
        if (methodName == "out_string" || methodName == "out_int") return "SELF_TYPE";
        if (methodName == "in_string") return "String";
        if (methodName == "in_int") return "Int";
    }
    return "";
}

llvm::Function* find_builtin_method_in_hierarchy(CodeGenerator& generator,
                                                 SymbolTableManager& symbolTable,
                                                 const std::string& className,
                                                 const std::string& methodName) {
    std::string current = className;
    while (!current.empty()) {
        if (llvm::Function* func = symbolTable.findMethod(current, methodName)) {
            return func;
        }
        ClassLayout* layout = symbolTable.findClass(current);
        if (!layout) {
            break;
        }
        current = layout->parentName;
    }
    return nullptr;
}

std::string infer_dispatch_return_type(CodeGenerator& generator,
                                       const std::string& receiverType,
                                       const std::string& methodName) {
    SymbolTableManager& symbolTable = generator.getSymbolTable();
    std::string normalizedReceiver = normalize_cool_type(symbolTable, receiverType);
    if (normalizedReceiver.empty()) {
        return "";
    }

    if (std::string builtinType = builtin_return_type(normalizedReceiver, methodName); !builtinType.empty()) {
        if (builtinType == "SELF_TYPE") {
            return normalizedReceiver;
        }
        return builtinType;
    }

    ClassLayout* layout = symbolTable.findClass(normalizedReceiver);
    while (layout) {
        for (const auto& methodInfo : layout->methods) {
            if (methodInfo.name != methodName || methodInfo.method == nullptr) {
                continue;
            }

            std::string returnType = methodInfo.method->return_type->get_string();
            if (returnType == "SELF_TYPE") {
                return normalizedReceiver;
            }
            return returnType;
        }

        if (std::string builtinType = builtin_return_type(layout->name, methodName); !builtinType.empty()) {
            if (builtinType == "SELF_TYPE") {
                return normalizedReceiver;
            }
            return builtinType;
        }

        if (layout->parentName.empty()) {
            break;
        }
        layout = symbolTable.findClass(layout->parentName);
    }

    return "";
}

std::string infer_expression_type(Expression expression, CodeGenerator& generator) {
    if (expression == nullptr) {
        return "";
    }

    SymbolTableManager& symbolTable = generator.getSymbolTable();

    if (expression->get_type() != nullptr) {
        std::string typed = expression->get_type()->get_string();
        if (!typed.empty()) {
            return normalize_cool_type(symbolTable, typed);
        }
    }

    if (dynamic_cast<int_const_class*>(expression) ||
        dynamic_cast<plus_class*>(expression) ||
        dynamic_cast<sub_class*>(expression) ||
        dynamic_cast<mul_class*>(expression) ||
        dynamic_cast<divide_class*>(expression) ||
        dynamic_cast<neg_class*>(expression)) {
        return "Int";
    }

    if (dynamic_cast<bool_const_class*>(expression) ||
        dynamic_cast<lt_class*>(expression) ||
        dynamic_cast<leq_class*>(expression) ||
        dynamic_cast<eq_class*>(expression) ||
        dynamic_cast<comp_class*>(expression) ||
        dynamic_cast<isvoid_class*>(expression)) {
        return "Bool";
    }

    if (dynamic_cast<string_const_class*>(expression)) {
        return "String";
    }

    if (auto* objectExpr = dynamic_cast<object_class*>(expression)) {
        std::string name = objectExpr->name->get_string();
        if (name == "self") {
            return symbolTable.getCurrentClassName();
        }
        if (VariableInfo* varInfo = symbolTable.findVariable(name)) {
            return normalize_cool_type(symbolTable, varInfo->typeName);
        }
        return "";
    }

    if (auto* newExpr = dynamic_cast<new__class*>(expression)) {
        return normalize_cool_type(symbolTable, newExpr->type_name->get_string());
    }

    if (auto* assignExpr = dynamic_cast<assign_class*>(expression)) {
        if (VariableInfo* varInfo = symbolTable.findVariable(assignExpr->name->get_string())) {
            return normalize_cool_type(symbolTable, varInfo->typeName);
        }
        return infer_expression_type(assignExpr->expr, generator);
    }

    if (auto* blockExpr = dynamic_cast<block_class*>(expression)) {
        Expressions body = blockExpr->body;
        if (body == nullptr) {
            return "";
        }
        std::string lastType;
        for (int i = body->first(); body->more(i); i = body->next(i)) {
            lastType = infer_expression_type(body->nth(i), generator);
        }
        return lastType;
    }

    if (auto* letExpr = dynamic_cast<let_class*>(expression)) {
        return infer_expression_type(letExpr->body, generator);
    }

    if (auto* dispatchExpr = dynamic_cast<dispatch_class*>(expression)) {
        std::string receiverType = infer_expression_type(dispatchExpr->expr, generator);
        return infer_dispatch_return_type(generator, receiverType, dispatchExpr->name->get_string());
    }

    if (auto* staticDispatchExpr = dynamic_cast<static_dispatch_class*>(expression)) {
        return infer_dispatch_return_type(
            generator,
            staticDispatchExpr->type_name->get_string(),
            staticDispatchExpr->name->get_string()
        );
    }

    if (auto* condExpr = dynamic_cast<cond_class*>(expression)) {
        std::string thenType = infer_expression_type(condExpr->then_exp, generator);
        std::string elseType = infer_expression_type(condExpr->else_exp, generator);
        if (thenType == elseType) {
            return thenType;
        }
        if (thenType.empty()) return elseType;
        if (elseType.empty()) return thenType;
        return "Object";
    }

    if (auto* caseExpr = dynamic_cast<typcase_class*>(expression)) {
        std::string bestType;
        Cases cases = caseExpr->cases;
        if (cases == nullptr) {
            return "";
        }
        for (int i = cases->first(); cases->more(i); i = cases->next(i)) {
            auto* branchExpr = dynamic_cast<branch_class*>(cases->nth(i));
            if (!branchExpr) {
                continue;
            }
            std::string branchType = infer_expression_type(branchExpr->expr, generator);
            if (bestType.empty()) {
                bestType = branchType;
            } else if (bestType != branchType) {
                return "Object";
            }
        }
        return bestType;
    }

    return "";
}

llvm::Value* load_current_self(CodeGenerator& generator) {
    VariableInfo* selfInfo = generator.getSymbolTable().findVariable("this");
    if (!selfInfo || !selfInfo->value) {
        return nullptr;
    }

    llvm::Type* thisType = map_cool_type(generator, selfInfo->typeName);
    return generator.getIRBuilder().CreateLoad(thisType, selfInfo->value, "self");
}

llvm::Value* get_member_address(CodeGenerator& generator, const VariableInfo& varInfo) {
    llvm::Value* selfValue = load_current_self(generator);
    if (!selfValue) {
        return nullptr;
    }

    llvm::IRBuilder<>& builder = generator.getIRBuilder();
    llvm::LLVMContext& ctx = generator.getContext().getLLVMContext();
    llvm::Value* bytePtr = builder.CreateBitCast(selfValue, llvm::Type::getInt8PtrTy(ctx), "member.base");
    llvm::Value* fieldBytePtr = builder.CreateGEP(
        llvm::Type::getInt8Ty(ctx),
        bytePtr,
        llvm::ConstantInt::get(llvm::Type::getInt32Ty(ctx), static_cast<uint32_t>(varInfo.offset)),
        varInfo.varName + ".addr"
    );

    llvm::Type* fieldType = map_cool_type(generator, varInfo.typeName);
    return builder.CreateBitCast(fieldBytePtr, llvm::PointerType::get(fieldType, 0), varInfo.varName + ".ptr");
}

llvm::Value* coerce_value_to_type(CodeGenerator& generator,
                                  llvm::Value* value,
                                  llvm::Type* targetType,
                                  const std::string& name) {
    if (value == nullptr || targetType == nullptr) {
        return value;
    }

    llvm::Type* sourceType = value->getType();
    if (sourceType == targetType) {
        return value;
    }

    llvm::IRBuilder<>& builder = generator.getIRBuilder();
    llvm::LLVMContext& ctx = generator.getContext().getLLVMContext();

    if (sourceType->isPointerTy() && targetType->isPointerTy()) {
        return builder.CreatePointerCast(value, targetType, name);
    }

    if (sourceType->isIntegerTy() && targetType->isIntegerTy()) {
        return builder.CreateIntCast(value, targetType, true, name);
    }

    if (sourceType->isIntegerTy() && targetType->isFloatingPointTy()) {
        return builder.CreateSIToFP(value, targetType, name);
    }

    if (sourceType->isFloatingPointTy() && targetType->isIntegerTy()) {
        return builder.CreateFPToSI(value, targetType, name);
    }

    if (sourceType->isFloatingPointTy() && targetType->isFloatingPointTy()) {
        return builder.CreateFPCast(value, targetType, name);
    }

    if (sourceType->isPointerTy() && targetType->isIntegerTy()) {
        return builder.CreatePtrToInt(value, targetType, name);
    }

    if (sourceType->isIntegerTy() && targetType->isPointerTy()) {
        return builder.CreateIntToPtr(value, targetType, name);
    }

    if (targetType->isPointerTy()) {
        return llvm::ConstantPointerNull::get(static_cast<llvm::PointerType*>(targetType));
    }

    if (targetType->isIntegerTy()) {
        return llvm::ConstantInt::get(targetType, 0);
    }

    if (targetType->isFloatingPointTy()) {
        return llvm::ConstantFP::get(targetType, 0.0);
    }

    return value;
}

}

llvm::Type* CodeGenerator::mapCoolTypeToLLVM(const std::string& typeName) {
    // 占位符类型直接返回，不缓存
    if (typeName == "_PLACEHOLDER_") {
        return llvm::PointerType::get(llvm::Type::getInt8Ty(_context.getLLVMContext()), 0);
    }
    
    // 1. 首先从符号表缓存中查找
    llvm::Type* cachedType = getSymbolTable().getLLVMTypeForCoolType(typeName);
    if (cachedType) {
        return cachedType;
    }
    
    llvm::Type* resultType = nullptr;
    llvm::LLVMContext& ctx = _context.getLLVMContext();
    
    // 2. 处理基本类型和特殊类型
    if (typeName == "Int") {
        resultType = llvm::Type::getInt32Ty(ctx);
    } 
    else if (typeName == "Bool") {
        resultType = llvm::Type::getInt1Ty(ctx);
    } 
    else if (typeName == "String") {
        resultType = llvm::Type::getInt8PtrTy(ctx);
    } 
    else if (typeName == "SELF_TYPE") {
        std::string currentClassName = getSymbolTable().getCurrentClassName();
        if (!currentClassName.empty()) {
            llvm::StructType* namedType = llvm::StructType::getTypeByName(ctx, "class." + currentClassName);
            if (namedType) {
                resultType = namedType->getPointerTo();
            }
        }
        if (!resultType) {
            llvm::StructType* currentClassType = getSymbolTable().getCurrentClassType();
            if (currentClassType) {
                resultType = currentClassType->getPointerTo();
            }
        }
        if (!resultType) {
            resultType = llvm::PointerType::get(llvm::Type::getInt8Ty(ctx), 0);
        }
    } 
    else if (typeName == "Object" || typeName == "IO") {
        resultType = llvm::Type::getInt8PtrTy(ctx)->getPointerTo();
    }
    else {
        // 3. 尝试查找已定义的结构体类型（类类型）
        std::string structName = "class." + typeName;
        llvm::StructType* structType = llvm::StructType::getTypeByName(ctx, structName);
        if (structType) {
            resultType = llvm::PointerType::get(structType, 0);
        } else {
            // 4. 默认返回 i8**
            resultType = llvm::Type::getInt8PtrTy(ctx)->getPointerTo();
        }
    }
    
    // 5. 将结果注册到符号表缓存
    if (typeName != "SELF_TYPE") {
        getSymbolTable().registerCoolType(typeName, resultType);
    }
    
    return resultType;
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

RuntimeAPI& CodeGenerator::getRuntimeAPI() {
    if (!runtimeAPI) {
        runtimeAPI = std::make_unique<RuntimeAPI>(_context.getLLVMContext(), getModule());
    }
    return *runtimeAPI.get();
}

// ========== 构建方法映射表 ==========
void CodeGenerator::buildMethodMaps() {
    #ifdef DEBUG
    std::cout << "Building method maps..." << std::endl;
    #endif
    
    RuntimeAPI& runtime = getRuntimeAPI();
    
    // 为每个运行时类构建方法映射
    buildObjectMethodMap(_methodMaps["Object"]);
    buildIntMethodMap(_methodMaps["Int"]);
    buildBoolMethodMap(_methodMaps["Bool"]);
    buildStringMethodMap(_methodMaps["String"]);
    buildIOMethodMap(_methodMaps["IO"]);
}

void CodeGenerator::buildObjectMethodMap(ClassMethodMaps& maps) {
    RuntimeAPI& runtime = getRuntimeAPI();
    
    // 虚方法映射
    maps.virtualMethods = {
        {"copy", runtime.getObjectCopy()},
        {"abort", runtime.getObjectAbort()},
        {"type_name", runtime.getObjectTypeName()},
        {"toString", runtime.getObjectTypeName()},  // alias
        {"clone", runtime.getObjectCopy()}           // alias
    };
    
    // 静态方法映射 (Object 可能没有静态方法)
    maps.staticMethods = {};
    
    // 重写方法映射 (基类没有重写)
    maps.overrideMethods = {};
}

void CodeGenerator::buildIntMethodMap(ClassMethodMaps& maps) {
    RuntimeAPI& runtime = getRuntimeAPI();
    
    // 虚方法映射
    maps.virtualMethods = {
        {"plus", runtime.getIntPlus()},
        {"minus", runtime.getIntMinus()},
        {"times", runtime.getIntTimes()},
        {"divide", runtime.getIntDivide()},
        {"negate", runtime.getIntNegate()},
        {"equals", runtime.getIntEquals()},
        {"less", runtime.getIntLess()},
        {"toDouble", nullptr},  // 需要自定义实现
        {"toLong", nullptr}      // 需要自定义实现
    };
    
    // 静态方法映射
    maps.staticMethods = {
        {"parseInt", nullptr}  // 静态工厂方法
    };
    
    // 重写方法映射 (从Object继承的方法)
    maps.overrideMethods = {
        {"toString", nullptr},   // 需要自定义实现
        {"hashCode", nullptr},   // 可以返回自身
        {"equals", runtime.getIntEquals()},
        {"clone", runtime.getObjectCopy()}
    };
}

void CodeGenerator::buildBoolMethodMap(ClassMethodMaps& maps) {
    RuntimeAPI& runtime = getRuntimeAPI();
    
    maps.virtualMethods = {
        {"not", runtime.getBoolNot()},
        {"equals", runtime.getBoolEquals()},
        {"logicalAnd", nullptr},
        {"logicalOr", nullptr},
        {"logicalNot", runtime.getBoolNot()}
    };
    
    maps.staticMethods = {};
    
    maps.overrideMethods = {
        {"toString", nullptr},
        {"hashCode", nullptr},
        {"equals", runtime.getBoolEquals()}
    };
}

void CodeGenerator::buildStringMethodMap(ClassMethodMaps& maps) {
    RuntimeAPI& runtime = getRuntimeAPI();
    
    maps.virtualMethods = {
        {"length", runtime.getStringLength()},
        {"concat", runtime.getStringConcat()},
        {"substr", runtime.getStringSubstr()},
        {"substring", runtime.getStringSubstr()},
        {"equals", runtime.getStringEquals()},
        {"less", runtime.getStringLess()},
        {"charAt", nullptr},
        {"indexOf", nullptr},
        {"toUpperCase", nullptr},
        {"toLowerCase", nullptr},
        {"trim", nullptr},
        {"isEmpty", nullptr}
    };
    
    maps.staticMethods = {
        {"valueOf", nullptr}  // 静态工厂方法
    };
    
    maps.overrideMethods = {
        {"toString", nullptr},  // 返回自身
        {"hashCode", nullptr},  // 需要计算哈希
        {"equals", runtime.getStringEquals()},
        {"clone", runtime.getObjectCopy()}
    };
}

void CodeGenerator::buildIOMethodMap(ClassMethodMaps& maps) {
    RuntimeAPI& runtime = getRuntimeAPI();
    
    maps.virtualMethods = {
        {"out_string", runtime.getIOOutString()},
        {"out_int", runtime.getIOOutInt()},
        {"in_string", runtime.getIOInString()},
        {"in_int", runtime.getIOInInt()}
    };
    
    maps.staticMethods = {};
    maps.overrideMethods = {};  // IO 可能不重写 Object 的方法
}

// ========== 注册类方法 ==========
void CodeGenerator::registerClassMethods(ClassLayout& layout) {
    #ifdef DEBUG
    std::cout << "Registering methods for class: " << layout.name << std::endl;
    #endif
    
    // 获取该类的映射表
    auto mapIt = _methodMaps.find(layout.name);
    if (mapIt == _methodMaps.end()) {
        #ifdef DEBUG
        std::cerr << "Warning: No method map found for class: " << layout.name << std::endl;
        #endif
        return;
    }
    
    const ClassMethodMaps& maps = mapIt->second;
    
    // 为每个方法分配函数指针
    for (auto& method : layout.methods) {
        llvm::Function* func = nullptr;
        
        // 根据方法类型从不同映射表中查找
        switch (method.type) {
            case METHOD_VIRTUAL: {
                auto it = maps.virtualMethods.find(method.name);
                if (it != maps.virtualMethods.end()) {
                    func = it->second;
                }
                break;
            }
            case METHOD_STATIC: {
                auto it = maps.staticMethods.find(method.name);
                if (it != maps.staticMethods.end()) {
                    func = it->second;
                }
                break;
            }
            case METHOD_OVERRIDE: {
                auto it = maps.overrideMethods.find(method.name);
                if (it != maps.overrideMethods.end()) {
                    func = it->second;
                }
                break;
            }
        }
        
        // 如果在当前类没找到，尝试在父类中查找
        if (!func && !layout.parentName.empty()) {
            func = getMethod(layout.parentName, method.name, method.type);
        }
        
        method.func = func;
        
        #ifdef DEBUG
        if (func) {
            std::cout << "  Method '" << method.name << "' registered" << std::endl;
        } else {
            std::cout << "  Method '" << method.name << "' pending implementation" << std::endl;
        }
        #endif
    }
}

llvm::Function* CodeGenerator::getMethod(const std::string& className, 
                                         const std::string& methodName,
                                         MethodType type) {
    auto classIt = _methodMaps.find(className);
    if (classIt == _methodMaps.end()) return nullptr;
    
    const ClassMethodMaps& maps = classIt->second;
    
    switch (type) {
        case METHOD_VIRTUAL: {
            auto it = maps.virtualMethods.find(methodName);
            return it != maps.virtualMethods.end() ? it->second : nullptr;
        }
        case METHOD_STATIC: {
            auto it = maps.staticMethods.find(methodName);
            return it != maps.staticMethods.end() ? it->second : nullptr;
        }
        case METHOD_OVERRIDE: {
            auto it = maps.overrideMethods.find(methodName);
            return it != maps.overrideMethods.end() ? it->second : nullptr;
        }
    }
    return nullptr;
}

void CodeGenerator::runtime_init() {
    #ifdef DEBUG
    std::cout << "Initializing runtime classes..." << std::endl;
    #endif
    
    // 1. 初始化基础类布局（只有这些是内置的）
    initObjectClass();  // Object 只有 vptr
    initIntClass();     // 继承 Object
    initBoolClass();    // 继承 Object
    initStringClass();  // 继承 Object
    initIOClass();      // 继承 Object
    
    // 2. 构建方法映射表
    buildMethodMaps();
    
    // 3. 创建LLVM类型
    for (const auto& className : {"Object", "Int", "Bool", "String", "IO"}) {
        ClassLayout* layout = _symbolTable.findClass(className);
        if (layout && !layout->type) {
            build_memory_layout(*layout);
        }
    }
    
    // 4. 注册方法（使用映射表）
    for (const auto& className : {"Object", "Int", "Bool", "String", "IO"}) {
        ClassLayout* layout = _symbolTable.findClass(className);
        if (layout) {
            registerClassMethods(*layout);
        }
    }
    
    // 5. 构建虚表
    for (const auto& className : {"Object", "Int", "Bool", "String", "IO"}) {
        ClassLayout* layout = _symbolTable.findClass(className);
        if (layout && layout->type) {
            build_vtable(*layout);
        }
    }
    
    // 6. 生成构造函数
    for (const auto& className : {"Object", "Int", "Bool", "String", "IO"}) {
        ClassLayout* layout = _symbolTable.findClass(className);
        if (layout && layout->vtable) {
            generate_constructor(*layout);
        }
    }
    
    // 7. 生成new函数
    for (const auto& className : {"Object", "Int", "Bool", "String", "IO"}) {
        ClassLayout* layout = _symbolTable.findClass(className);
        if (layout && layout->constructor) {
            layout->newFunc = create_new_function(className, *layout);
        }
    }
    
    // 8. 初始化字符串常量
    initStringConstants();
    
    #ifdef DEBUG
    std::cout << "Runtime initialization completed." << std::endl;
    #endif
}

// ========== 添加方法类型 ==========
void CodeGenerator::initObjectClass() {
    ClassLayout layout;
    
    layout.name = "Object";
    layout.parentName = "";  // Object 是根类
    layout.type = nullptr;
    layout.vtable = nullptr;
    layout.constructor = nullptr;
    layout.newFunc = nullptr;
    layout.classTag = 0;
    layout.objectSize = 8;  // 只有 vptr，8字节
    
    // Object 只有 vptr，没有其他属性！
    layout.ownAttributes = {};  // 清空，不添加 classTag 等
    
    // Object 的方法
    layout.methods = {
        {"copy", METHOD_VIRTUAL, nullptr,  nullptr, 0},
        {"abort", METHOD_VIRTUAL, nullptr,  nullptr, 1},
        {"type_name", METHOD_VIRTUAL, nullptr,  nullptr, 2}
    };
    
    _symbolTable.registerClass(layout);
}

void CodeGenerator::initIntClass() {
    ClassLayout layout;
    
    layout.name = "Int";
    layout.parentName = "Object";  // Int 继承 Object
    layout.type = nullptr;
    layout.vtable = nullptr;
    layout.constructor = nullptr;
    layout.newFunc = nullptr;
    layout.classTag = 1;
    layout.objectSize = 16;  // Object(8) + value(4) + padding(4)
    
    // Int 自己的属性
    layout.ownAttributes = {
        {"value", VariableInfo::createMember(nullptr, "Int", "value", "Int", 0)}
    };
    
    // Int 的方法（包含继承的和自己的）
    layout.methods = {
        // 继承自 Object 的方法
        {"copy", METHOD_VIRTUAL, nullptr,  nullptr, 0},
        {"abort", METHOD_VIRTUAL, nullptr,  nullptr, 1},
        {"type_name", METHOD_VIRTUAL, nullptr,  nullptr, 2},
        
        // Int 自己的方法
        {"plus", METHOD_VIRTUAL, nullptr,  nullptr, 3},
        {"minus", METHOD_VIRTUAL, nullptr,  nullptr, 4},
        {"times", METHOD_VIRTUAL, nullptr,  nullptr, 5},
        {"divide", METHOD_VIRTUAL, nullptr,  nullptr, 6},
        {"negate", METHOD_VIRTUAL, nullptr,  nullptr, 7},
        {"equals", METHOD_VIRTUAL, nullptr,  nullptr, 8}
    };
    
    _symbolTable.registerClass(layout);
}

void CodeGenerator::initBoolClass() {
    ClassLayout layout;
    
    layout.name = "Bool";
    layout.parentName = "Object";
    layout.type = nullptr;
    layout.vtable = nullptr;
    layout.constructor = nullptr;
    layout.newFunc = nullptr;
    layout.classTag = 2;  // Bool 的类标签
    layout.objectSize = 24;  // Object(16) + value(1) + padding(7)
    
    // Bool 类的属性：一个布尔值
    layout.ownAttributes = {
        {"value", VariableInfo::createMember(nullptr, "Bool", "value", "Bool", 0)}
    };
    
    // Bool 类的方法
    // 虚表索引：0-3 被 Object 占用，4+ 是 Bool 自己的方法
    layout.methods = {
        // 继承自 Object 的方法（重写）
        {"toString", METHOD_OVERRIDE, nullptr, nullptr, 0},
        {"hashCode", METHOD_OVERRIDE, nullptr, nullptr, 1},
        {"equals", METHOD_OVERRIDE, nullptr, nullptr, 2},
        {"clone", METHOD_OVERRIDE, nullptr, nullptr, 3},
        
        // Bool 自己的虚方法
        {"not", METHOD_VIRTUAL, nullptr, nullptr, 4},
        {"and", METHOD_VIRTUAL, nullptr, nullptr, 5},
        {"or", METHOD_VIRTUAL, nullptr, nullptr, 6},
        {"xor", METHOD_VIRTUAL, nullptr, nullptr, 7},
        {"logicalAnd", METHOD_VIRTUAL, nullptr, nullptr, 8},
        {"logicalOr", METHOD_VIRTUAL, nullptr, nullptr, 9},
        {"logicalNot", METHOD_VIRTUAL, nullptr, nullptr, 10}
    };
    
    _symbolTable.registerClass(layout);
    
    #ifdef DEBUG
    std::cout << "Bool class initialized" << std::endl;
    #endif
}

// ==================== String 类初始化 ====================
void CodeGenerator::initStringClass() {
    ClassLayout layout;
    
    layout.name = "String";
    layout.parentName = "Object";
    layout.type = nullptr;
    layout.vtable = nullptr;
    layout.constructor = nullptr;
    layout.newFunc = nullptr;
    layout.classTag = 3;  // String 的类标签
    layout.objectSize = 32;  // Object(16) + data(8) + length(4) + hash(4)
    
    // String 类的属性
    layout.ownAttributes = {
        {"data", VariableInfo::createMember(
            nullptr,
            "String", 
            "data",
            "String",
            0
        )},
        {"length", VariableInfo::createMember(
            nullptr,
            "String", 
            "length",
            "Int",
            1
        )},
        {"hash", VariableInfo::createMember(
            nullptr,
            "String", 
            "hash",
            "Int",
            2
        )}
    };
    
    // String 类的方法
    layout.methods = {
        // 继承自 Object 的方法（重写）
        {"toString", METHOD_OVERRIDE, nullptr, nullptr, 0},
        {"hashCode", METHOD_OVERRIDE, nullptr, nullptr, 1},
        {"equals", METHOD_OVERRIDE, nullptr, nullptr, 2},
        {"clone", METHOD_OVERRIDE, nullptr, nullptr, 3},
        
        // String 自己的虚方法
        {"length", METHOD_VIRTUAL, nullptr, nullptr, 4},
        {"concat", METHOD_VIRTUAL, nullptr, nullptr, 5},
        {"substr", METHOD_VIRTUAL, nullptr, nullptr, 6},
        {"charAt", METHOD_VIRTUAL, nullptr, nullptr, 7},
        {"indexOf", METHOD_VIRTUAL, nullptr, nullptr, 8},
        {"lastIndexOf", METHOD_VIRTUAL, nullptr, nullptr, 9},
        {"toUpperCase", METHOD_VIRTUAL, nullptr, nullptr, 10},
        {"toLowerCase", METHOD_VIRTUAL, nullptr, nullptr, 11},
        {"trim", METHOD_VIRTUAL, nullptr, nullptr, 12},
        {"isEmpty", METHOD_VIRTUAL, nullptr, nullptr, 13},
        {"compareTo", METHOD_VIRTUAL, nullptr, nullptr, 14},
        {"startsWith", METHOD_VIRTUAL, nullptr, nullptr, 15},
        {"endsWith", METHOD_VIRTUAL, nullptr, nullptr, 16},
        
        // 静态方法
        {"valueOf", METHOD_STATIC, nullptr, nullptr, -1},
        {"format", METHOD_STATIC, nullptr, nullptr, -1}
    };
    
    _symbolTable.registerClass(layout);
    
    #ifdef DEBUG
    std::cout << "String class initialized" << std::endl;
    #endif
}

// ==================== IO 类初始化 ====================
void CodeGenerator::initIOClass() {
    ClassLayout layout;
    
    layout.name = "IO";
    layout.parentName = "Object";
    layout.type = nullptr;
    layout.vtable = nullptr;
    layout.constructor = nullptr;
    layout.newFunc = nullptr;
    layout.classTag = 4;  // IO 的类标签
    layout.objectSize = 16;  // 只有 Object 部分，没有自己的属性
    
    // IO 类没有自己的属性
    layout.ownAttributes = {};
    
    // IO 类的方法
    layout.methods = {
        // 继承自 Object 的方法（可能不重写）
        {"toString", METHOD_VIRTUAL, nullptr, nullptr, 0},
        {"hashCode", METHOD_VIRTUAL, nullptr, nullptr, 1},
        {"equals", METHOD_VIRTUAL, nullptr, nullptr, 2},
        {"clone", METHOD_VIRTUAL, nullptr, nullptr, 3},
        
        // IO 自己的虚方法
        {"out_string", METHOD_VIRTUAL, nullptr, nullptr, 4},
        {"out_int", METHOD_VIRTUAL, nullptr, nullptr, 5},
        {"in_string", METHOD_VIRTUAL, nullptr, nullptr, 6},
        {"in_int", METHOD_VIRTUAL, nullptr, nullptr, 7},
        {"out_char", METHOD_VIRTUAL, nullptr, nullptr, 8},
        {"in_char", METHOD_VIRTUAL, nullptr, nullptr, 9},
        {"flush", METHOD_VIRTUAL, nullptr, nullptr, 10}
    };
    
    _symbolTable.registerClass(layout);
}

void CodeGenerator::initStringConstants() {
    #ifdef DEBUG
    std::cout << "Initializing string constants..." << std::endl;
    #endif
    
    // 预定义的字符串常量
    const std::vector<std::string> predefinedStrings = {
        "",                           // 空字符串
        "true",                       // true 的字符串表示
        "false",                      // false 的字符串表示
        "null",                       // null 的字符串表示
        "Object",                     // 类名
        "Int",                        
        "Bool",
        "String",
        "IO",
        "Out of memory",              // 错误信息
        "Division by zero",            // 错误信息
        "Array index out of bounds",   // 错误信息
        "Null pointer exception",      // 错误信息
        "Class cast error"             // 错误信息
    };
    
    // 获取 String 类的布局，用于创建 String 对象
    ClassLayout* stringLayout = _symbolTable.findClass("String");
    if (!stringLayout) {
        #ifdef DEBUG
        std::cerr << "Error: String class not found when initializing constants" << std::endl;
        #endif
        return;
    }
    
    // 为每个预定义字符串创建常量
    for (const auto& str : predefinedStrings) {
        // 创建字符串常量
        llvm::Constant* strConstant = llvm::ConstantDataArray::getString(
            _context.getLLVMContext(),
            str,
            true  // 添加 null 终止符
        );
        
        // 生成全局变量名
        std::hash<std::string> hasher;
        std::string globalName = ".str.const." + std::to_string(hasher(str));
        
        // 创建全局变量存储字符串数据
        llvm::GlobalVariable* globalStr = new llvm::GlobalVariable(
            getModule(),
            strConstant->getType(),
            true,  // constant
            llvm::GlobalValue::PrivateLinkage,
            strConstant,
            globalName
        );
        
        // 获取指向字符串数据的 i8* 指针
        llvm::Constant* zero = llvm::ConstantInt::get(
            llvm::Type::getInt32Ty(_context.getLLVMContext()), 
            0
        );
        llvm::Constant* indices[] = {zero, zero};
        llvm::Constant* strDataPtr = llvm::ConstantExpr::getInBoundsGetElementPtr(
            globalStr->getValueType(),
            globalStr,
            indices
        );
        
        _symbolTable.registerString(str, strDataPtr);
        
        #ifdef DEBUG
        std::cout << "  Registered string constant: \"" << str << "\"" << std::endl;
        #endif
    }
    
    // 创建常用的数字字符串常量（0-9）
    for (int i = 0; i <= 9; i++) {
        std::string numStr = std::to_string(i);
        llvm::Constant* numConstant = llvm::ConstantDataArray::getString(
            _context.getLLVMContext(),
            numStr,
            true
        );
        
        std::string globalName = ".str.num." + numStr;
        
        llvm::GlobalVariable* globalNum = new llvm::GlobalVariable(
            getModule(),
            numConstant->getType(),
            true,
            llvm::GlobalValue::PrivateLinkage,
            numConstant,
            globalName
        );
        
        llvm::Constant* zero = llvm::ConstantInt::get(
            llvm::Type::getInt32Ty(_context.getLLVMContext()), 
            0
        );
        llvm::Constant* indices[] = {zero, zero};
        llvm::Constant* numDataPtr = llvm::ConstantExpr::getInBoundsGetElementPtr(
            globalNum->getValueType(),
            globalNum,
            indices
        );
        
        _symbolTable.registerString(numStr, numDataPtr);
    }
    
    #ifdef DEBUG
    std::cout << "String constants initialization completed." << std::endl;
    #endif
}

// ==================== 主生成函数 ====================
void CodeGenerator::emit_llvm_ir(Program program) {
    #ifdef DEBUG
    std::cout << "Starting LLVM IR generation..." << std::endl;
    #endif
    
    runtime_init();
    emit_program(program);
    dumpIR();
    if (!verifyModule()) {
        std::cerr << "Warning: Module verification failed!" << std::endl;
    }
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
    std::string new_name = className + ".new";
    
    // 1. 查找已有的声明
    llvm::Function* new_func = getModule().getFunction(new_name);
    
    if (!new_func) {
        // 如果没有声明，创建新的函数
        llvm::FunctionType* func_type = llvm::FunctionType::get(
            classLayout.type->getPointerTo(),
            false
        );
        
        new_func = llvm::Function::Create(
            func_type,
            llvm::Function::ExternalLinkage,
            new_name,
            &getModule()
        );
    } else if (!new_func->empty()) {
        // 已经有定义
        return new_func;
    }
    
    // 2. 在声明的基础上创建定义
    llvm::BasicBlock* saved_block = getIRBuilder().GetInsertBlock();
    
    llvm::BasicBlock* entry_bb = llvm::BasicBlock::Create(
        _context.getLLVMContext(), 
        "entry", 
        new_func
    );
    getIRBuilder().SetInsertPoint(entry_bb);
    
    // 分配内存
    llvm::Value* size_val = llvm::ConstantInt::get(
        llvm::Type::getInt64Ty(_context.getLLVMContext()), 
        classLayout.objectSize
    );
    
    // 获取malloc函数
    llvm::FunctionCallee malloc_func = getModule().getOrInsertFunction(
        "malloc",
        llvm::FunctionType::get(
            llvm::Type::getInt8PtrTy(_context.getLLVMContext()), 
            {llvm::Type::getInt64Ty(_context.getLLVMContext())}, 
            false
        )
    );
    
    llvm::Value* mem = getIRBuilder().CreateCall(malloc_func, {size_val});
    llvm::Value* obj = getIRBuilder().CreateBitCast(
        mem, 
        classLayout.type->getPointerTo()
    );
    
    // 调用构造函数
    if (classLayout.constructor) {
        getIRBuilder().CreateCall(classLayout.constructor, {obj});
    }
    
    getIRBuilder().CreateRet(obj);
    
    // 恢复插入点
    if (saved_block) {
        getIRBuilder().SetInsertPoint(saved_block);
    }
    
    return new_func;  // 添加返回值
}

llvm::Value *CodeGenerator::emit_new__class(new__class *new_class)
{
    #ifdef DEBUG
    std::cout << "emit_new__class" << std::endl;
    #endif
    if (new_class == nullptr) return nullptr;
    
    std::string class_name_str = new_class->type_name->get_string();
    llvm::IRBuilder<> &builder = getIRBuilder();

    // 1. 查找类信息
    ClassLayout* cls = getSymbolTable().findClass(class_name_str);
    if (cls == nullptr) {
        #ifdef DEBUG
        std::cerr << "Error: Class " << class_name_str << " not found" << std::endl;
        #endif
        return nullptr;
    }
    
    // 2. 如果 newFunc 还不存在，创建前向声明
    if (!cls->newFunc) {
        std::string new_name = class_name_str + ".new";
        
        // 获取类的 LLVM 类型
        llvm::StructType *class_type = llvm::StructType::getTypeByName(
            _context.getLLVMContext(), "class." + class_name_str
        );
        if (!class_type) {
            // 如果类型还不存在，创建不透明结构体作为前向声明
            class_type = llvm::StructType::create(
                _context.getLLVMContext(), 
                "class." + class_name_str
            );
        }
        
        // 创建函数类型：返回类指针，无参数
        llvm::FunctionType *func_type = llvm::FunctionType::get(
            class_type->getPointerTo(), 
            false
        );
        
        // 创建函数声明（没有函数体）
        cls->newFunc = llvm::Function::Create(
            func_type,
            llvm::Function::ExternalLinkage,
            new_name,
            &getModule()
        );
        
        #ifdef DEBUG
        std::cout << "Created forward declaration for: " << new_name << std::endl;
        #endif
    }
    
    // 3. 调用 new 函数
    llvm::Value* result = builder.CreateCall(cls->newFunc, {});

    #ifdef DEBUG
    std::cout << "Called " << class_name_str << ".new, return type: ";
    result->getType()->print(llvm::errs());
    std::cout << std::endl;
    #endif

    return result;
}


/**
 * 内存布局（与C++ Itanium ABI兼容的单继承模型）：
 * 
 * 所有类都继承自 Object 根类，Object 只包含虚表指针（vptr）。
 * 
 * Object 类布局（根类）：
 *   offset 0-7:   vptr (指向虚函数表的指针，8字节)
 * 
 * 派生类布局（如 Int、A 等）：
 *   offset 0-?:   父类子对象（包含父类的所有字段）
 *   offset ?-?:   当前类新增的属性（按声明顺序）
 * 
 * 示例：
 *   %class.Object = type { ptr }                    // 只有 vptr
 *   %class.Int = type { %class.Object, i32 }        // Object部分 + value
 *   %class.A = type { %class.Object, i32 }          // Object部分 + var
 *   %class.B = type { %class.A, i32 }               // A部分 + var1
 * 
 * 虚表结构（符合Itanium C++ ABI）：
 *   vtable[0]: offset_to_top（单继承中始终为0）
 *   vtable[1]: typeinfo指针（RTTI）
 *   vtable[2+]: 虚函数指针，按继承顺序排列
 */
llvm::Value *CodeGenerator::emit_class__class(class__class* _class)
{
    #ifdef DEBUG
    std::cout << "emit_class__class" << std::endl;
    #endif
    if (_class == nullptr) return nullptr;
    
    std::string className = _class->name->get_string();
    #ifdef DEBUG
    std::cout << "className: " << className << std::endl;
    std::cout << "classParentName: " << _class->parent->get_string() << std::endl;
    #endif
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
    
    //=== 阶段3：生成方法函数原型（只生成声明）=========================
    generate_method_prototypes(classLayout);
    
    //=== 阶段4：构建虚表（现在可以获取函数指针）=======================
    build_vtable(classLayout);
    
    //=== 阶段5：分配class tag ========================================
    classLayout.classTag = allocate_class_tag();
    
    //=== 阶段6：生成构造函数 ==========================================
    generate_constructor(classLayout);
    
    //=== 阶段7：生成new函数 ==========================================
    classLayout.newFunc = create_new_function(className, classLayout);
    
    // 注册类到符号表
    symbol_table.registerClass(classLayout);
    
    //=== 阶段8：生成方法函数体（生成完整的函数实现）===================
    generate_method_bodies(classLayout);
    
    return classLayout.newFunc;
}

/**
 * 第一阶段：生成方法函数原型（只生成声明，不生成函数体）
 * 这样虚表构建时可以获取函数指针
 */
void CodeGenerator::generate_method_prototypes(ClassLayout& classLayout)
{
    #ifdef DEBUG
    std::cout << "generate_method_prototypes for: " << classLayout.name << std::endl;
    #endif
    
    getSymbolTable().enterClass(classLayout.name);
    
    for (auto& methodInfo : classLayout.methods) {
        if (methodInfo.method) {
            #ifdef DEBUG
            std::cout << "  Processing method: " << methodInfo.name << std::endl;
            #endif
            // 检查是否已经有函数（可能是内置方法）
            if (methodInfo.func != nullptr) {
                #ifdef DEBUG
                std::cout << "    Already has function, skipping" << std::endl;
                #endif
                continue;
            }
            
            // 检查是否是内置方法（已经在映射表中）
            llvm::Function* builtin_func = getMethod(classLayout.name, methodInfo.name, METHOD_VIRTUAL);
            if (builtin_func) {
                #ifdef DEBUG
                std::cout << "    Built-in method found" << std::endl;
                #endif
                methodInfo.func = builtin_func;
                continue;
            }
            
            // 创建函数原型
            std::string returnTypeName = methodInfo.method->return_type->get_string();
            #ifdef DEBUG
            std::cout << "    Return type: " << returnTypeName << std::endl;
            #endif
            llvm::Type* returnType = mapCoolTypeToLLVM(returnTypeName);
            if (!returnType) {
                #ifdef DEBUG
                std::cerr << "    Error: Failed to map return type: " << returnTypeName << std::endl;
                #endif
                continue;
            }
            
            // 使用占位符
            #ifdef DEBUG
            std::cout << "    Calling emit_formals with placeholder..." << std::endl;
            #endif
            FormalParams params = emit_formals(methodInfo.method->formals, true);
            std::vector<std::string>& paramNames = params.first;
            std::vector<std::string>& paramTypeNames = params.second;
            #ifdef DEBUG
            std::cout << "    Parameter count: " << paramNames.size() << std::endl;
            
            for (size_t i = 0; i < paramNames.size(); i++) {
                std::cout << "      param[" << i << "]: " << paramNames[i] 
                          << " : " << paramTypeNames[i] << std::endl;
            }
            #endif
            std::vector<llvm::Type*> paramTypes;
            for (const auto& typeName : paramTypeNames) {
                #ifdef DEBUG
                std::cout << "    Mapping type: " << typeName << std::endl;
                #endif
                llvm::Type* paramType = mapCoolTypeToLLVM(typeName);
                if (!paramType) {
                    #ifdef DEBUG
                    std::cerr << "    Error: Failed to map parameter type: " << typeName << std::endl;
                    #endif
                    continue;
                }
                paramTypes.push_back(paramType);
            }
            #ifdef DEBUG
            std::cout << "    Creating function type..." << std::endl;
            #endif
            llvm::FunctionType* funcType = llvm::FunctionType::get(returnType, paramTypes, false);
            std::string funcName = classLayout.name + "." + methodInfo.name;
            #ifdef DEBUG
            std::cout << "    Creating function: " << funcName << std::endl;
            #endif
            llvm::Function* func = llvm::Function::Create(
                funcType,
                llvm::Function::ExternalLinkage,
                funcName,
                getModule()
            );
            
            // 设置参数名称
            size_t i = 0;
            for (auto& arg : func->args()) {
                if (i < paramNames.size()) {
                    arg.setName(paramNames[i++]);
                }
            }
            
            methodInfo.func = func;
            #ifdef DEBUG
            std::cout << "  Created prototype for: " << methodInfo.name << std::endl;
            #endif
        }
    }
    
    getSymbolTable().exitClass();
}

/**
 * 第二阶段：生成方法函数体
 * 此时类已注册，所有依赖都已就绪
 */
void CodeGenerator::generate_method_bodies(ClassLayout& classLayout)
{
    #ifdef DEBUG
    std::cout << "generate_method_bodies for: " << classLayout.name << std::endl;
    #endif
    
    getSymbolTable().enterClass(classLayout.name);
    
    for (auto& methodInfo : classLayout.methods) {
        if (methodInfo.method && methodInfo.func) {
            // 跳过已经实现的函数（如内置方法）
            if (!methodInfo.func->empty()) {
                continue;
            }
            
            // 跳过内置方法（通过检查函数体是否为空）
            llvm::Function* builtin_func = getMethod(classLayout.name, methodInfo.name, METHOD_VIRTUAL);
            if (builtin_func == methodInfo.func) {
                continue;
            }
            
            // 生成完整的函数体
            method_class* method = methodInfo.method;
            llvm::Function* func = methodInfo.func;
            
            // 创建函数体入口
            llvm::BasicBlock* entryBlock = llvm::BasicBlock::Create(
                _context.getLLVMContext(),
                "entry",
                func
            );
            getIRBuilder().SetInsertPoint(entryBlock);
            
            // 进入方法作用域
            getSymbolTable().enterScope();
            getSymbolTable().enterMethod(methodInfo.name);
            
            // 设置参数
            size_t i = 0;
            std::vector<std::string> paramNames = emit_formals(method->formals).first;
            llvm::AllocaInst* thisAlloca = nullptr;
            for (auto& arg : func->args()) {
                // 创建alloca指令分配空间
                llvm::AllocaInst* alloca = getIRBuilder().CreateAlloca(
                    arg.getType(),
                    nullptr,
                    arg.getName() + ".addr"
                );
                // 存储参数值到分配的空间
                getIRBuilder().CreateStore(&arg, alloca);
                
                std::string paramType = classLayout.name;
                if (i > 0 && method->formals) {
                    int idx = i - 1;
                    for (int j = method->formals->first(); method->formals->more(j); j = method->formals->next(j)) {
                        if (idx == 0) {
                            formal_class* formal = dynamic_cast<formal_class*>(method->formals->nth(j));
                            if (formal) {
                                paramType = formal->type_decl->get_string();
                            }
                            break;
                        }
                        idx--;
                    }
                }
                
                getSymbolTable().currentScope()->addVariable(
                        paramNames[i], 
                        VariableInfo::createParam(alloca, classLayout.name, paramNames[i], paramType)
                );
                if (i == 0) {
                    thisAlloca = alloca;
                }
                i++;
            }
            if (thisAlloca != nullptr) {
                getSymbolTable().currentScope()->addVariable(
                    "self",
                    VariableInfo::createParam(thisAlloca, classLayout.name, "self", classLayout.name)
                );
            }
            
            // 生成方法体
            llvm::Value* result = nullptr;
            if (method->expr != nullptr) {
                result = emit_expression(method->expr);
            }
            
            // 创建返回指令
            llvm::Type* returnType = func->getReturnType();
            if (returnType->isVoidTy()) {
                getIRBuilder().CreateRetVoid();
            } else {
                if (result == nullptr) {
                    // 默认返回值
                    result = llvm::Constant::getNullValue(returnType);
                }
                if (result->getType() != returnType) {
                    result = getIRBuilder().CreateBitCast(result, returnType, "result");
                }
                getIRBuilder().CreateRet(result);
            }
            
            // 退出方法作用域
            getSymbolTable().exitMethod();
            getSymbolTable().exitScope();
            
            #ifdef DEBUG
            std::cout << "  Generated body for: " << methodInfo.name << std::endl;
            #endif
        }
    }
    
    getSymbolTable().exitClass();
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
    int offset = 0;
    for (int i = _class->features->first(); _class->features->more(i); i = _class->features->next(i)) {
        Feature_class *feature = _class->features->nth(i);
        
        if (attr_class *attr = dynamic_cast<attr_class*>(feature)) {
            // 收集当前类自己的属性
            std::string attrName = attr->name->get_string();
            std::string typeName = attr->type_decl->get_string();
            classLayout.ownAttributes.emplace(attrName, VariableInfo::createMember(nullptr, classLayout.name, attrName, typeName, offset));
            offset++;
        }
        else if (method_class *method = dynamic_cast<method_class*>(feature)) {
            // 收集当前类自己的方法
            std::string methodName = method->name->get_string();
            ClassLayout::ClassMethodInfo methodInfo;
            methodInfo.name = methodName;
            methodInfo.method = method;
            methodInfo.func = nullptr;
            methodInfo.vtableIndex = -1;  // 稍后设置
            classLayout.methods.push_back(methodInfo);
        }
    }

    return classLayout;
}

/**
 * 构建类的内存布局（结构体类型定义）- 与C++兼容
 */
void CodeGenerator::build_memory_layout(ClassLayout& classLayout)
{
    #ifdef DEBUG
    std::cout << "build_memory_layout: " << classLayout.name << std::endl;
    #endif
    
    std::vector<llvm::Type*> structFields;
    SymbolTableManager& symbol_table = getSymbolTable();
    
    // 判断类是否有虚函数
    bool hasVirtualFunctions = !classLayout.methods.empty();
    
    // 处理继承链
    if (!classLayout.parentName.empty()) {
        // 有父类：将父类类型作为第一个字段
        ClassLayout* parentLayout = symbol_table.findClass(classLayout.parentName);
        if (parentLayout && parentLayout->type) {
            structFields.push_back(parentLayout->type);
        }
    } else {
        // 根类
        if (hasVirtualFunctions) {
            llvm::Type* vptrType = llvm::PointerType::get(
                llvm::Type::getInt8Ty(_context.getLLVMContext()), 0);
            structFields.push_back(vptrType);
        }
    }
    
    // 添加当前类自己的属性（数据成员）
    for (const auto& attr : classLayout.ownAttributes) {
        const VariableInfo& info = attr.second;
        structFields.push_back(mapCoolTypeToLLVM(info.typeName));
    }
    
    // 创建结构体类型
    std::string typeName = "class." + classLayout.name;
    classLayout.type = llvm::StructType::create(_context.getLLVMContext(), 
                                                structFields, 
                                                typeName);
    
    // 计算类大小和字段偏移量
    const llvm::DataLayout& DL = getModule().getDataLayout();
    classLayout.objectSize = DL.getTypeAllocSize(classLayout.type);
    
    // 计算每个字段的偏移量并更新VariableInfo
    const llvm::StructLayout* layout = DL.getStructLayout(classLayout.type);
    unsigned fieldIndex = 0;
    
    // 处理继承链的偏移
    if (!classLayout.parentName.empty()) {
        // 有父类：跳过父类子对象
        fieldIndex++;
    } else if (hasVirtualFunctions) {
        // 根类且有虚函数：跳过vptr
        fieldIndex++;
    }
    
    // 更新当前类数据成员的偏移
    for (auto& attr : classLayout.ownAttributes) {
        VariableInfo& info = attr.second;
        info.offset = layout->getElementOffset(fieldIndex++);
        info.className = classLayout.name;
        
        #ifdef DEBUG
        std::cout << "  field " << attr.first 
                  << " offset = " << info.offset << std::endl;
        #endif
    }
}

/**
 * 获取字段在类中的偏移
 * 注意：这个偏移是相对于对象起始位置的字节偏移
 */
size_t CodeGenerator::getFieldOffset(ClassLayout* classLayout, const std::string& fieldName)
{
    #ifdef DEBUG
    std::cout << "getFieldOffset: " << classLayout->name << "::" << fieldName << std::endl;
    #endif
    
    // 先在当前类中查找
    auto it = classLayout->ownAttributes.find(fieldName);
    if (it != classLayout->ownAttributes.end()) {
        return it->second.offset;
    }
    
    // 如果在当前类没找到，递归在父类中查找
    if (!classLayout->parentName.empty()) {
        SymbolTableManager& symbol_table = getSymbolTable();
        ClassLayout* parentLayout = symbol_table.findClass(classLayout->parentName);
        if (parentLayout) {
            // 获取父类中的偏移
            size_t parentOffset = getFieldOffset(parentLayout, fieldName);
            if (parentOffset != 0 || fieldName == findFirstField(parentLayout)) {
                // 需要加上父类子对象在当前对象中的偏移
                // 父类子对象总是在索引0
                const llvm::DataLayout& DL = getModule().getDataLayout();
                const llvm::StructLayout* layout = DL.getStructLayout(classLayout->type);
                size_t baseOffset = layout->getElementOffset(0); // 父类子对象偏移
                return baseOffset + parentOffset;
            }
        }
    }
    
    return 0;
}

/**
 * 查找类的第一个字段（用于判断字段是否存在）
 */
std::string CodeGenerator::findFirstField(ClassLayout* classLayout)
{
    if (!classLayout->ownAttributes.empty()) {
        return classLayout->ownAttributes.begin()->first;
    }
    if (!classLayout->parentName.empty()) {
        SymbolTableManager& symbol_table = getSymbolTable();
        ClassLayout* parentLayout = symbol_table.findClass(classLayout->parentName);
        if (parentLayout) {
            return findFirstField(parentLayout);
        }
    }
    return "";
}

/**
 * 创建类型信息结构
 */
llvm::Constant* CodeGenerator::createTypeInfo(ClassLayout& classLayout)
{
    llvm::LLVMContext& ctx = _context.getLLVMContext();
    llvm::Module* module = &getModule();
    std::string& className = classLayout.name;

    #ifdef DEBUG
    std::cout << "\n=== createTypeInfo called ===" << std::endl;
    std::cout << "  className: " << className << std::endl;
    #endif
    
    // C++名字修饰：_ZTI + 类名长度 + 类名
    std::string typeinfoName = "_ZTI" + std::to_string(className.length()) + className;
    
    #ifdef DEBUG
    std::cout << "  typeinfoName: " << typeinfoName << std::endl;
    #endif
    
    // 检查是否已存在
    llvm::GlobalVariable* existing = module->getGlobalVariable(typeinfoName);
    if (existing) {
        #ifdef DEBUG
        std::cout << "  TypeInfo already exists, returning existing" << std::endl;
        #endif
        return llvm::ConstantExpr::getBitCast(
            existing,
            llvm::Type::getInt8PtrTy(ctx)
        );
    }
    
    #ifdef DEBUG
    std::cout << "  Creating new TypeInfo..." << std::endl;
    #endif
    
    // 创建类型名称字符串（使用C++修饰格式：长度+类名）
    std::string mangledClassName = std::to_string(className.length()) + className;
    
    #ifdef DEBUG
    std::cout << "  mangledClassName: " << mangledClassName << std::endl;
    #endif
    
    llvm::Constant* classNameStr = llvm::ConstantDataArray::getString(ctx, mangledClassName, true);
    
    std::string typeNameVarName = "_ZTS" + mangledClassName;
    llvm::GlobalVariable* typeNameVar = new llvm::GlobalVariable(
        *module,
        classNameStr->getType(),
        true,  // constant
        llvm::GlobalValue::LinkOnceODRLinkage,
        classNameStr,
        typeNameVarName
    );
    typeNameVar->setAlignment(llvm::Align(1));
    
    #ifdef DEBUG
    std::cout << "  Created type name variable: " << typeNameVarName << std::endl;
    #endif
    
    // C++ ABI 中预定义的 vtable 符号名
    const std::string CLASS_TYPE_INFO_VTABLE = "_ZTVN10__cxxabiv117__class_type_infoE";
    const std::string SI_CLASS_TYPE_INFO_VTABLE = "_ZTVN10__cxxabiv120__si_class_type_infoE";
    
    #ifdef DEBUG
    std::cout << "  Looking up vtable symbols..." << std::endl;
    #endif
    
    // 获取或声明 __class_type_info 的 vtable
    llvm::Type* vtableElemType = llvm::Type::getInt8PtrTy(ctx);
    llvm::ArrayType* vtableArrayType = llvm::ArrayType::get(vtableElemType, 0);
    
    llvm::GlobalVariable* classTypeInfoVtable = module->getGlobalVariable(CLASS_TYPE_INFO_VTABLE);
    if (!classTypeInfoVtable) {
        #ifdef DEBUG
        std::cout << "    Creating external declaration for " << CLASS_TYPE_INFO_VTABLE << std::endl;
        #endif
        classTypeInfoVtable = new llvm::GlobalVariable(
            *module,
            vtableArrayType,
            false,
            llvm::GlobalValue::ExternalLinkage,
            nullptr,
            CLASS_TYPE_INFO_VTABLE
        );
    }
    
    // 获取或声明 __si_class_type_info 的 vtable
    llvm::GlobalVariable* siClassTypeInfoVtable = module->getGlobalVariable(SI_CLASS_TYPE_INFO_VTABLE);
    if (!siClassTypeInfoVtable) {
        #ifdef DEBUG
        std::cout << "    Creating external declaration for " << SI_CLASS_TYPE_INFO_VTABLE << std::endl;
        #endif
        siClassTypeInfoVtable = new llvm::GlobalVariable(
            *module,
            vtableArrayType,
            false,
            llvm::GlobalValue::ExternalLinkage,
            nullptr,
            SI_CLASS_TYPE_INFO_VTABLE
        );
    }
    
    // 判断是否有基类
    bool hasParent = !classLayout.parentName.empty();
    #ifdef DEBUG
    std::cout << "  Class info:" << std::endl;
    std::cout << "    parentName: '" << classLayout.parentName << "'" << std::endl;
    std::cout << "    hasParent: " << (hasParent ? "true" : "false") << std::endl;
    #endif
    
    llvm::Constant* typeinfoPtr = nullptr;
    
    // 获取或创建结构体类型
    llvm::StructType* classTypeInfoType = nullptr;
    llvm::StructType* siClassTypeInfoType = nullptr;
    
    if (!hasParent) {
        classTypeInfoType = llvm::StructType::getTypeByName(ctx, "struct.__cxxabiv1.__class_type_info");
        if (!classTypeInfoType) {
            classTypeInfoType = llvm::StructType::create(
                ctx,
                {
                    llvm::Type::getInt8PtrTy(ctx),  // vptr
                    llvm::Type::getInt8PtrTy(ctx)   // name
                },
                "struct.__cxxabiv1.__class_type_info"
            );
        }
    } else {
        siClassTypeInfoType = llvm::StructType::getTypeByName(ctx, "struct.__cxxabiv1.__si_class_type_info");
        if (!siClassTypeInfoType) {
            siClassTypeInfoType = llvm::StructType::create(
                ctx,
                {
                    llvm::Type::getInt8PtrTy(ctx),  // vptr
                    llvm::Type::getInt8PtrTy(ctx),  // name
                    llvm::Type::getInt8PtrTy(ctx)   // base_type
                },
                "struct.__cxxabiv1.__si_class_type_info"
            );
        }
    }
    
    if (!hasParent) {
        #ifdef DEBUG
        std::cout << "  Creating __class_type_info (no base class)" << std::endl;
        #endif
        
        // 方法1：使用更简单的方式创建 vptr
        // 直接获取 vtable 的地址，然后加上 2 个指针的偏移
        llvm::Constant* vtableAddr = classTypeInfoVtable;
        
        // 创建 GEP: vtable + 2
        // 使用 i8* 进行指针算术更安全
        llvm::Constant* offset = llvm::ConstantInt::get(llvm::Type::getInt64Ty(ctx), 2);
        llvm::Constant* vptr = llvm::ConstantExpr::getGetElementPtr(
            llvm::Type::getInt8PtrTy(ctx),  // 使用 ptr 类型
            vtableAddr,
            offset,
            true
        );
        
        #ifdef DEBUG
        std::cout << "    vptr created" << std::endl;
        #endif
        
        // 创建 typeinfo 实例
        std::vector<llvm::Constant*> typeinfoVals;
        typeinfoVals.push_back(vptr);
        typeinfoVals.push_back(llvm::ConstantExpr::getBitCast(typeNameVar, llvm::Type::getInt8PtrTy(ctx)));
        
        llvm::Constant* typeinfoInit = llvm::ConstantStruct::get(classTypeInfoType, typeinfoVals);
        
        llvm::GlobalVariable* typeinfo = new llvm::GlobalVariable(
            *module,
            classTypeInfoType,
            true,
            llvm::GlobalValue::LinkOnceODRLinkage,
            typeinfoInit,
            typeinfoName
        );
        typeinfo->setAlignment(llvm::Align(8));
        
        typeinfoPtr = llvm::ConstantExpr::getBitCast(
            typeinfo,
            llvm::Type::getInt8PtrTy(ctx)
        );
        
        #ifdef DEBUG
        std::cout << "    Created __class_type_info for " << className << std::endl;
        #endif
        
    } else {
        #ifdef DEBUG
        std::cout << "  Creating __si_class_type_info (with base class: " << classLayout.parentName << ")" << std::endl;
        #endif
        
        // 获取基类的 RTTI 指针
        std::string baseTypeinfoName = "_ZTI" + std::to_string(classLayout.parentName.length()) + classLayout.parentName;
        
        #ifdef DEBUG
        std::cout << "    baseTypeinfoName: " << baseTypeinfoName << std::endl;
        #endif
        
        llvm::GlobalVariable* baseTypeinfo = module->getGlobalVariable(baseTypeinfoName);
        
        if (!baseTypeinfo) {
            #ifdef DEBUG
            std::cout << "    Base typeinfo not found, recursively creating for: " << classLayout.parentName << std::endl;
            #endif
            SymbolTableManager& symbol_table = getSymbolTable();
            ClassLayout* parentLayout = symbol_table.findClass(classLayout.parentName);
            if (parentLayout) {
                createTypeInfo(*parentLayout);
                baseTypeinfo = module->getGlobalVariable(baseTypeinfoName);
            }
            
            #ifdef DEBUG
            if (baseTypeinfo) {
                std::cout << "    Base typeinfo created successfully" << std::endl;
            } else {
                std::cout << "    ERROR: Failed to create base typeinfo for: " << classLayout.parentName << std::endl;
            }
            #endif
        }
        
        if (!baseTypeinfo) {
            #ifdef DEBUG
            std::cout << "    ERROR: baseTypeinfo is null, using null pointer" << std::endl;
            #endif
            return llvm::Constant::getNullValue(llvm::Type::getInt8PtrTy(ctx));
        }
        
        llvm::Constant* baseTypeinfoPtr = llvm::ConstantExpr::getBitCast(
            baseTypeinfo,
            llvm::Type::getInt8PtrTy(ctx)
        );
        
        // 创建 vptr
        llvm::Constant* vtableAddr = siClassTypeInfoVtable;
        llvm::Constant* offset = llvm::ConstantInt::get(llvm::Type::getInt64Ty(ctx), 2);
        llvm::Constant* vptr = llvm::ConstantExpr::getGetElementPtr(
            llvm::Type::getInt8PtrTy(ctx),
            vtableAddr,
            offset,
            true
        );
        
        #ifdef DEBUG
        std::cout << "    vptr created" << std::endl;
        #endif
        
        // 创建 typeinfo 实例
        std::vector<llvm::Constant*> typeinfoVals;
        typeinfoVals.push_back(vptr);
        typeinfoVals.push_back(llvm::ConstantExpr::getBitCast(typeNameVar, llvm::Type::getInt8PtrTy(ctx)));
        typeinfoVals.push_back(baseTypeinfoPtr);
        
        llvm::Constant* typeinfoInit = llvm::ConstantStruct::get(siClassTypeInfoType, typeinfoVals);
        
        llvm::GlobalVariable* typeinfo = new llvm::GlobalVariable(
            *module,
            siClassTypeInfoType,
            true,
            llvm::GlobalValue::LinkOnceODRLinkage,
            typeinfoInit,
            typeinfoName
        );
        typeinfo->setAlignment(llvm::Align(8));
        
        typeinfoPtr = llvm::ConstantExpr::getBitCast(
            typeinfo,
            llvm::Type::getInt8PtrTy(ctx)
        );
        
        #ifdef DEBUG
        std::cout << "    Created __si_class_type_info for " << className << std::endl;
        #endif
    }
    
    #ifdef DEBUG
    std::cout << "=== createTypeInfo finished for: " << className << " ===\n" << std::endl;
    #endif
    
    return typeinfoPtr;
}

/**
 * 构建虚表和虚表索引 - 与C++兼容
 * 符合Itanium C++ ABI单继承模型：
 * - vtable[0]: offset_to_top (始终为0)
 * - vtable[1]: typeinfo指针
 * - vtable[2+]: 虚函数指针，按继承顺序排列
 */
void CodeGenerator::build_vtable(ClassLayout& classLayout)
{
    #ifdef DEBUG
    std::cout << "\n=== build_vtable: " << classLayout.name << " ===" << std::endl;
    #endif
    
    //=== 步骤1：收集所有虚函数（包括继承的）====================
    std::vector<ClassLayout::ClassMethodInfo> allVirtualMethods;
    SymbolTableManager& symbol_table = getSymbolTable();
    
    // 1.1 先收集基类的所有虚函数（保持基类中的顺序）
    if (!classLayout.parentName.empty()) {
        #ifdef DEBUG
        std::cout << "  Parent class: " << classLayout.parentName << std::endl;
        #endif
        
        ClassLayout* parentLayout = symbol_table.findClass(classLayout.parentName);
        if (parentLayout) {
            // 确保父类的虚表已经构建
            if (!parentLayout->vtable) {
                #ifdef DEBUG
                std::cout << "  Building parent vtable first..." << std::endl;
                #endif
                build_vtable(*parentLayout);
            }
            
            // 从父类复制所有虚方法，保持原有顺序
            #ifdef DEBUG
            std::cout << "  Inheriting " << parentLayout->methods.size() << " methods from parent" << std::endl;
            #endif
            
            for (const auto& parentMethod : parentLayout->methods) {
                allVirtualMethods.push_back(parentMethod);
                
                #ifdef DEBUG
                std::cout << "    Inherited: " << parentMethod.name << std::endl;
                #endif
            }
        } else {
            #ifdef DEBUG
            std::cout << "  ERROR: Parent class not found: " << classLayout.parentName << std::endl;
            #endif
        }
    }
    
    // 1.2 处理当前类的方法（按声明顺序）
    #ifdef DEBUG
    std::cout << "  Processing " << classLayout.methods.size() << " methods for current class" << std::endl;
    #endif
    
    for (auto& methodInfo : classLayout.methods) {
        bool found = false;
        
        // 检查是否覆盖基类方法
        for (size_t i = 0; i < allVirtualMethods.size(); i++) {
            if (allVirtualMethods[i].name == methodInfo.name) {
                #ifdef DEBUG
                std::cout << "    Overriding: " << methodInfo.name << " at index " << i << std::endl;
                #endif
                allVirtualMethods[i].func = methodInfo.func;
                allVirtualMethods[i].method = methodInfo.method;
                found = true;
                break;
            }
        }
        
        // 如果是新方法，添加到末尾
        if (!found) {
            #ifdef DEBUG
            std::cout << "    New method: " << methodInfo.name << std::endl;
            #endif
            allVirtualMethods.push_back(methodInfo);
        }
    }
    
    // 1.3 为每个方法设置vtableIndex
    for (size_t i = 0; i < allVirtualMethods.size(); ++i) {
        allVirtualMethods[i].vtableIndex = i + 2;
    }
    
    // 更新classLayout的methods
    classLayout.methods = allVirtualMethods;
    
    #ifdef DEBUG
    std::cout << "  Total virtual methods: " << allVirtualMethods.size() << std::endl;
    #endif
    
    //=== 步骤2：构建虚表条目 ====================================
    std::vector<llvm::Constant*> vtableEntries;
    
    // 2.1 offset_to_top
    llvm::Constant* offsetToTop = llvm::ConstantInt::get(
        llvm::Type::getInt64Ty(_context.getLLVMContext()), 0);
    vtableEntries.push_back(llvm::ConstantExpr::getIntToPtr(
        offsetToTop, llvm::Type::getInt8PtrTy(_context.getLLVMContext())));
    
    // 2.2 typeinfo指针（RTTI）
    #ifdef DEBUG
    std::cout << "  Creating typeinfo for: " << classLayout.name << std::endl;
    #endif
    llvm::Constant* typeinfoPtr = createTypeInfo(classLayout);
    vtableEntries.push_back(typeinfoPtr);
    
    // 2.3 添加所有虚函数指针
    for (const auto& methodInfo : classLayout.methods) {
        llvm::Constant* funcPtr = nullptr;
        
        if (methodInfo.func) {
            funcPtr = llvm::ConstantExpr::getBitCast(
                methodInfo.func,
                llvm::Type::getInt8PtrTy(_context.getLLVMContext())
            );
            #ifdef DEBUG
            std::cout << "  Adding method: " << methodInfo.name << " (func exists)" << std::endl;
            #endif
        } else {
            // 如果函数指针为空，尝试通过名字查找
            std::string funcName = classLayout.name + "." + methodInfo.name;
            llvm::Function* foundFunc = getModule().getFunction(funcName);
            if (foundFunc) {
                funcPtr = llvm::ConstantExpr::getBitCast(
                    foundFunc,
                    llvm::Type::getInt8PtrTy(_context.getLLVMContext())
                );
                const_cast<ClassLayout::ClassMethodInfo&>(methodInfo).func = foundFunc;
                #ifdef DEBUG
                std::cout << "  Adding method: " << methodInfo.name << " (found by name)" << std::endl;
                #endif
            } else {
                funcPtr = llvm::Constant::getNullValue(
                    llvm::Type::getInt8PtrTy(_context.getLLVMContext()));
                #ifdef DEBUG
                std::cout << "  WARNING: Method " << methodInfo.name << " not found, using null" << std::endl;
                #endif
            }
        }
        
        vtableEntries.push_back(funcPtr);
    }
    
    //=== 步骤3：创建虚表全局变量 ================================
    llvm::ArrayType* vtableType = llvm::ArrayType::get(
        llvm::Type::getInt8PtrTy(_context.getLLVMContext()),
        vtableEntries.size()
    );
    
    llvm::Constant* vtableInit = llvm::ConstantArray::get(vtableType, vtableEntries);
    
    std::string vtableName = "_ZTV" + std::to_string(classLayout.name.length()) + classLayout.name;
    
    #ifdef DEBUG
    std::cout << "  Creating vtable: " << vtableName << std::endl;
    std::cout << "  Vtable entries: " << vtableEntries.size() << " (2 ABI + " << classLayout.methods.size() << " methods)" << std::endl;
    #endif
    
    classLayout.vtable = new llvm::GlobalVariable(
        getModule(),
        vtableType,
        true,
        llvm::GlobalValue::LinkOnceODRLinkage,
        vtableInit,
        vtableName
    );
    
    classLayout.vtable->setAlignment(llvm::Align(8));
    
    #ifdef DEBUG
    std::cout << "=== build_vtable done for " << classLayout.name << " ===\n" << std::endl;
    #endif
}

/**
 * 生成访问成员的代码
 */
llvm::Value* CodeGenerator::generateMemberAccess(
    llvm::Value* objectPtr, 
    const std::string& className,
    const std::string& memberName)
{
    #ifdef DEBUG
    std::cout << "generateMemberAccess: " << className << std::endl;
    #endif
    SymbolTableManager& symbol_table = getSymbolTable();
    ClassLayout* classLayout = symbol_table.findClass(className);
    if (!classLayout) {
        return nullptr;
    }
    
    // 查找成员信息
    auto it = classLayout->ownAttributes.find(memberName);
    if (it == classLayout->ownAttributes.end()) {
        // 可能在父类中
        if (!classLayout->parentName.empty()) {
            return generateMemberAccess(objectPtr, classLayout->parentName, memberName);
        }
        return nullptr;
    }
    
    VariableInfo& memberInfo = it->second;
    llvm::LLVMContext& ctx = _context.getLLVMContext();
    
    // 计算成员指针：对象指针 + 偏移量
    if (memberInfo.offset == 0) {
        return objectPtr;
    }
    
    // 将对象指针转换为 i8*
    llvm::Value* bytePtr = _builder->CreateBitCast(
        objectPtr, 
        llvm::Type::getInt8PtrTy(ctx)
    );
    
    // 使用 GEP 计算偏移
    llvm::Value* offsetPtr = _builder->CreateGEP(
        llvm::Type::getInt8Ty(ctx),  // 元素类型是 i8
        bytePtr,
        llvm::ConstantInt::get(llvm::Type::getInt32Ty(ctx), memberInfo.offset)
    );
    
    // 转换为成员类型的指针
    llvm::Type* memberType = mapCoolTypeToLLVM(memberInfo.typeName);
    return _builder->CreateBitCast(
        offsetPtr,
        llvm::PointerType::get(memberType, 0)
    );
}

/**
 * 生成虚函数调用
 */
llvm::Value* CodeGenerator::generateVirtualCall(
    llvm::Value* objectPtr,
    const std::string& className,
    const std::string& methodName)
{
    #ifdef DEBUG
    std::cout << "generateVirtualCall: " << className << std::endl;
    #endif
    SymbolTableManager& symbol_table = getSymbolTable();
    ClassLayout* classLayout = symbol_table.findClass(className);
    if (!classLayout) {
        return nullptr;
    }
    
    // 查找方法信息
    ClassLayout::ClassMethodInfo* methodInfo = nullptr;
    for (auto& m : classLayout->methods) {
        if (m.name == methodName) {
            methodInfo = &m;
            break;
        }
    }
    
    if (!methodInfo || methodInfo->vtableIndex < 0) {
        return nullptr;
    }
    
    llvm::LLVMContext& ctx = _context.getLLVMContext();
    
    // 1. 获取vptr（对象的前8个字节）
    // 将对象指针转换为 i8** (指向vptr的指针)
    llvm::Type* i8Ty = llvm::Type::getInt8Ty(ctx);
    llvm::Type* i8PtrTy = llvm::PointerType::get(i8Ty, 0);
    llvm::Type* vptrPtrTy = llvm::PointerType::get(i8PtrTy, 0);
    
    llvm::Value* vptrPtr = _builder->CreateBitCast(
        objectPtr,
        vptrPtrTy
    );
    
    // 2. 加载虚表指针 (vtable) - 这是 i8*
    llvm::Value* vtable = _builder->CreateLoad(
        i8PtrTy,
        vptrPtr,
        "vtable"
    );
    
    // 3. 计算虚函数指针在虚表中的位置
    // 将vtable转换为i64进行整数运算
    llvm::Value* vtableAsInt = _builder->CreatePtrToInt(
        vtable,
        llvm::Type::getInt64Ty(ctx)
    );
    
    // 计算偏移：vtableIndex * 8 (每个指针8字节)
    llvm::Value* offset = llvm::ConstantInt::get(
        llvm::Type::getInt64Ty(ctx),
        methodInfo->vtableIndex * 8
    );
    
    llvm::Value* methodPtrAddressAsInt = _builder->CreateAdd(vtableAsInt, offset);
    
    // 转换为指针
    llvm::Value* methodPtrPtr = _builder->CreateIntToPtr(
        methodPtrAddressAsInt,
        llvm::PointerType::get(i8PtrTy, 0)
    );
    
    // 4. 加载函数指针
    llvm::Value* methodPtr = _builder->CreateLoad(
        i8PtrTy,
        methodPtrPtr,
        "method_ptr"
    );
    
    // 5. 获取函数类型
    if (!methodInfo->func) {
        return nullptr;
    }
    llvm::FunctionType* funcType = methodInfo->func->getFunctionType();
    
    // 6. 转换为正确的函数指针类型
    llvm::Value* typedMethodPtr = _builder->CreateBitCast(
        methodPtr,
        llvm::PointerType::get(funcType, 0)
    );
    
    // 7. 准备参数
    std::vector<llvm::Value*> args;
    args.push_back(objectPtr);
    
    // 8. 调用虚函数
    return _builder->CreateCall(funcType, typedMethodPtr, args, "virtual_call");
}

/**
 * 生成类的构造函数 - 与C++兼容版本
 */
void CodeGenerator::generate_constructor(ClassLayout& classLayout)
{
    SymbolTableManager& symbol_table = getSymbolTable();
    
    llvm::FunctionType* ctorType = llvm::FunctionType::get(
        llvm::Type::getVoidTy(_context.getLLVMContext()),
        {llvm::PointerType::get(classLayout.type, 0)},  // this指针
        false
    );
    
    classLayout.constructor = llvm::Function::Create(
        ctorType,
        llvm::Function::ExternalLinkage,
        "_ZN" + std::to_string(classLayout.name.length()) + classLayout.name + "C2Ev",  // C++名字修饰
        getModule()
    );
    
    llvm::BasicBlock* entryBB = llvm::BasicBlock::Create(_context.getLLVMContext(), "entry", classLayout.constructor);
    getIRBuilder().SetInsertPoint(entryBB);
    
    llvm::Value* thisPtr = classLayout.constructor->arg_begin();
    thisPtr->setName("this");
    
    // 判断类是否有虚函数
    bool hasVirtualFunctions = !classLayout.methods.empty();
    
    // 处理继承链：先调用父类构造函数
    if (!classLayout.parentName.empty()) {
        ClassLayout* parentLayout = symbol_table.findClass(classLayout.parentName);
        if (parentLayout && parentLayout->constructor) {
            // 获取父类子对象的指针
            llvm::Value* parentSubobject = getIRBuilder().CreateStructGEP(
                classLayout.type,
                thisPtr,
                0,  // 父类子对象总是在索引0
                "parent.subobject"
            );
            
            // 调用父类构造函数
            getIRBuilder().CreateCall(parentLayout->constructor, {parentSubobject});
        }
    }
    
    // 单继承模型下，每一层构造完成后都需要把对象头部的 vptr
    // 更新为当前类的虚表，而不仅仅是根类。
    if (hasVirtualFunctions) {
        llvm::Type* i8PtrTy = llvm::Type::getInt8PtrTy(_context.getLLVMContext());
        llvm::Value* vptrPtr = getIRBuilder().CreateBitCast(
            thisPtr,
            i8PtrTy->getPointerTo(),
            "vptr.ptr"
        );
        
        llvm::Value* vtablePtr = getIRBuilder().CreateBitCast(
            classLayout.vtable,
            i8PtrTy,
            "vtable.ptr"
        );
        
        getIRBuilder().CreateStore(vtablePtr, vptrPtr);
    }
    
    // 初始化当前类的属性
    unsigned fieldIndex = getFieldStartIndex(classLayout);
    unsigned i = 0;
    
    for (auto& attr : classLayout.ownAttributes) {
        if (attr.first == "self") continue;
        
        VariableInfo& varInfo = attr.second;
        llvm::Type* fieldType = mapCoolTypeToLLVM(varInfo.typeName);
        
        // 获取字段地址
        llvm::Value* fieldAddr = getIRBuilder().CreateStructGEP(
            classLayout.type,
            thisPtr,
            fieldIndex + i,
            // attr.first + ".addr"
            "this.addr"
        );
        
        // 初始化为默认值
        if (fieldType->isIntegerTy(32)) {
            getIRBuilder().CreateStore(
                llvm::ConstantInt::get(llvm::Type::getInt32Ty(_context.getLLVMContext()), 0),
                fieldAddr
            );
        } else if (fieldType->isIntegerTy(1)) {
            getIRBuilder().CreateStore(
                llvm::ConstantInt::getFalse(_context.getLLVMContext()),
                fieldAddr
            );
        } else if (fieldType->isPointerTy()) {
            getIRBuilder().CreateStore(
                llvm::Constant::getNullValue(fieldType),
                fieldAddr
            );
        }
        
        // 更新变量信息中的值（地址）
        varInfo.updateValue(fieldAddr);
        i++;
    }
    
    // 设置self成员变量（指向对象本身）
    classLayout.ownAttributes["self"] = VariableInfo::createMember(
        thisPtr, 
        classLayout.name, 
        "this",
        classLayout.name,
        0
    );
    
    getIRBuilder().CreateRetVoid();
}

/**
 * 获取当前类数据成员在结构体中的起始索引
 */
unsigned CodeGenerator::getFieldStartIndex(ClassLayout& classLayout)
{
    unsigned index = 0;
    
    // 如果有父类，父类子对象占一个字段
    if (!classLayout.parentName.empty()) {
        index++;  // 父类子对象
    } 
    // 如果是根类且有虚函数，vptr占一个字段
    else if (!classLayout.methods.empty()) {
        index++;  // vptr
    }
    
    return index;
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
    std::cout << method->name->get_string() << std::endl;

    std::string className = getSymbolTable().getCurrentClassName();
    llvm::Function* exist_func = getSymbolTable().findMethod(className, method->name->get_string());
    if (exist_func != nullptr) {
        return exist_func;
    }

    // 检查是否是内置方法（已经在映射表中）
    llvm::Function* builtin_func = getMethod(className, method->name->get_string(), METHOD_VIRTUAL);
    if (builtin_func) {
        return builtin_func;
    }
    getSymbolTable().enterScope();
    // 确定返回类型
    std::string returnTypeName = method->return_type->get_string();
    llvm::Type* returnType = nullptr;
    
    ClassLayout* classLayout = getSymbolTable().findClass(className);

    returnType = mapCoolTypeToLLVM(returnTypeName);

    // 构建参数列表
    FormalParams params = emit_formals(method->formals);
    std::vector<std::string>& paramNames = params.first;
    std::vector<std::string>& paramTypeNames = params.second;
    std::vector<llvm::Type*> paramTypes;
    paramTypes.reserve(paramTypeNames.size());

    for (const auto& typeName : paramTypeNames) {
        paramTypes.push_back(mapCoolTypeToLLVM(typeName));
    }
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
            curr_scope->addVariable(paramNames[i], VariableInfo::createParam(alloca, className, paramNames[i], paramTypeNames[i]));
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

FormalParams CodeGenerator::emit_formals(Formals formals, bool usePlaceholderThis)
{
    #ifdef DEBUG
    std::cout << "emit_formals" << std::endl;
    #endif
    
    std::vector<std::string> paramNames;
    std::vector<std::string> paramTypeNames;

    if (usePlaceholderThis) {
        paramNames.push_back("this");
        paramTypeNames.push_back("_PLACEHOLDER_");
        #ifdef DEBUG
        std::cout << "  Using placeholder for this" << std::endl;
        #endif
    } else {
        paramNames.push_back("this");
        std::string currentClass = getSymbolTable().getCurrentClassName();
        paramTypeNames.push_back(currentClass);
        #ifdef DEBUG
        std::cout << "  Using real type for this: " << currentClass << std::endl;
        #endif
    }
    
    if (formals == nullptr) {
        #ifdef DEBUG
        std::cout << "  No formals" << std::endl;
        #endif
        return {paramNames, paramTypeNames};
    }
    #ifdef DEBUG
    std::cout << "  Processing formals..." << std::endl;
    #endif
    for (int i = formals->first(); formals->more(i); i = formals->next(i)) {
        #ifdef DEBUG
        std::cout << "    Formal index: " << i << std::endl;
        #endif
        formal_class* formal = dynamic_cast<formal_class*>(formals->nth(i));
        if (!formal) {
            #ifdef DEBUG
            std::cout << "    Failed to cast to formal_class" << std::endl;
            #endif
            continue;
        }
        
        std::string paramName = formal->name->get_string();
        std::string paramTypeName = formal->type_decl->get_string();
        paramNames.push_back(paramName);
        paramTypeNames.push_back(paramTypeName);
    }
    #ifdef DEBUG
    std::cout << "  Total params: " << paramNames.size() << std::endl;
    #endif
    return {paramNames, paramTypeNames};
}

llvm::Value *CodeGenerator::emit_assign_class(assign_class* expression)
{
    #ifdef DEBUG
    std::cout << "emit_assign_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr;

    llvm::Value* rhs = emit_expression(expression->expr);
    if (!rhs) {
        #ifdef DEBUG
        std::cerr << "Error: Failed to evaluate RHS of assignment" << std::endl;
        #endif
        return nullptr;
    }

    VariableInfo* varInfo = findVariable(expression->name->get_string());
    if (!varInfo) 
    {
        #ifdef DEBUG
        std::cerr << "Error: VariableInfo is null" << std::endl;
        #endif
        return nullptr;
    }
    
    llvm::Value* ptr = nullptr;
    
    switch (varInfo->storage)
    {
        case StorageClass::MEMBER:
        {
            ptr = get_member_address(*this, *varInfo);
            break;
        }
        default:
        {
            if (!varInfo->value) {
                #ifdef DEBUG
                std::cerr << "Error: Variable value is null" << std::endl;
                #endif
                return nullptr;
            }
            ptr = varInfo->value;
            break;
        }
    }
    
    // 类型检查
    llvm::Type* expectedType = mapCoolTypeToLLVM(varInfo->typeName);
    llvm::Type* actualType = rhs->getType();
    if (expectedType != actualType) {
        #ifdef DEBUG
        std::cerr << "Warning: Type mismatch in assignment. Expected: " 
                  << varInfo->typeName << std::endl;
        #endif
    }
    
    getIRBuilder().CreateStore(rhs, ptr);
    return rhs;
}

llvm::Value *CodeGenerator::emit_static_dispatch_class(static_dispatch_class* expression)
{
    #ifdef DEBUG
    std::cout << "emit_static_dispatch_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr;
    
    // 1. 生成对象表达式
    llvm::Value* object = emit_expression(expression->expr);
    if (object == nullptr) return nullptr;
    
    // 2. 获取声明类型名称和方法名称
    std::string type_name_str = expression->type_name->get_string();
    std::string method_name = expression->name->get_string();
    
    // 3. 生成所有实际参数
    Expressions body = expression->actual;
    std::vector<llvm::Value*> args;
    if (body != nullptr) {
        for (int i = body->first(); body->more(i); i = body->next(i)) {
            llvm::Value* arg = emit_expression(body->nth(i));
            if (arg == nullptr) return nullptr;
            args.push_back(arg);
        }
    }
    
    // 4. 获取方法函数
    llvm::Function* method_func = getSymbolTable().findMethod(type_name_str, method_name);
    if (method_func == nullptr) {
        method_func = find_builtin_method_in_hierarchy(*this, getSymbolTable(), type_name_str, method_name);
    }
    if (method_func == nullptr) {
        #ifdef DEBUG
        std::cerr << "Error: function not found " << type_name_str << "." << method_name << std::endl;
        #endif
        return nullptr;
    }
    
    // 5. 准备调用参数（包括 this 指针）
    std::vector<llvm::Value*> call_args;
    call_args.push_back(object);
    call_args.insert(call_args.end(), args.begin(), args.end());
    
    // 6. 验证参数数量
    if (call_args.size() != method_func->arg_size()) {
        #ifdef DEBUG
        std::cerr << "Error: argument count mismatch for "
                  << type_name_str << "." << method_name << std::endl;
        #endif
        return nullptr;
    }
    
    // 7. 创建调用指令
    llvm::Value* result = getIRBuilder().CreateCall(method_func, call_args);
    
    return result;
}

// 函数调用
llvm::Value *CodeGenerator::emit_dispatch_class(dispatch_class* expression)
{
    #ifdef DEBUG
    std::cout << "emit_dispatch_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr; 

    llvm::IRBuilder<> &builder = getIRBuilder();
    
    // 1. 获取对象指针
    llvm::Value *obj_ptr = emit_expression(expression->expr);
    if (obj_ptr == nullptr) return nullptr;
    
    // 2. 获取方法名对应的符号
    std::string method_name = expression->name->get_string();
    
    // 3. 从表达式静态类型推断接收者类，而不是从 LLVM 的 opaque ptr 反推
    std::string class_name = normalize_cool_type(getSymbolTable(), infer_expression_type(expression->expr, *this));
    #ifdef DEBUG
    std::cout << "Resolved Cool class name: " << class_name << std::endl;
    #endif

    // 基本类型直接调用运行时内建函数，不能走对象虚表。
    if (is_primitive_cool_type(class_name)) {
        llvm::Function* builtinFunc = find_builtin_method_in_hierarchy(*this, getSymbolTable(), class_name, method_name);
        if (builtinFunc == nullptr) {
            return nullptr;
        }

        std::vector<llvm::Value*> args;
        args.push_back(obj_ptr);
        if (expression->actual != nullptr) {
            for (int i = expression->actual->first(); expression->actual->more(i); i = expression->actual->next(i)) {
                llvm::Value* arg = emit_expression(expression->actual->nth(i));
                if (arg == nullptr) return nullptr;
                args.push_back(arg);
            }
        }

        return builder.CreateCall(builtinFunc, args, "dispatch.result");
    }

    // 4. 获取虚表指针
    llvm::Type *vtable_ptr_type = llvm::PointerType::get(_context.getLLVMContext(), 0);
    llvm::Value *vtable_ptr = builder.CreateLoad(
        vtable_ptr_type,
        obj_ptr,
        "vtable.ptr"
    );

    // 5. 在类层次结构中查找方法信息（包括父类）
    int method_index = -1;
    std::string defining_class;
    
    std::vector<ClassLayout*> inheritance_chain = getSymbolTable().getInheritanceChain(class_name);
    
    for (auto* cls : inheritance_chain) {
        for (const auto& method_info : cls->methods) {
            if (method_info.name == method_name) {
                method_index = method_info.vtableIndex;
                defining_class = cls->name;
                break;
            }
        }
        if (method_index >= 0) break;
    }
    
    if (method_index < 0) {
        #ifdef DEBUG
        std::cerr << "Error: Method " << method_name << " not found in class hierarchy of " 
                  << class_name << std::endl;
        #endif
        return nullptr;
    }
    
    // 6. 从虚表中加载方法指针
    int vtable_offset = method_index;
    
    // CreateConstGEP1_64需要类型参数
    llvm::Type *vtable_entry_type = llvm::PointerType::get(_context.getLLVMContext(), 0);
    llvm::Value *method_ptr_addr = builder.CreateConstGEP1_64(
        vtable_entry_type,  // 元素类型
        vtable_ptr, 
        vtable_offset, 
        "method.ptr.addr"
    );
    
    llvm::Value *method_ptr = builder.CreateLoad(
        vtable_entry_type,
        method_ptr_addr,
        "method.ptr"
    );
    
    // 7. 准备方法调用的参数
    std::vector<llvm::Value*> args;
    args.push_back(obj_ptr);  // this指针
    if (expression->actual != nullptr) {
        for (int i = expression->actual->first(); expression->actual->more(i); i = expression->actual->next(i)) {
            llvm::Value* arg = emit_expression(expression->actual->nth(i));
            if (arg == nullptr) return nullptr;
            args.push_back(arg);
        }
    }
    
    // 8. 获取方法对应的LLVM函数（用于类型信息）
    llvm::Function* method_func = nullptr;
    ClassLayout* def_class = getSymbolTable().findClass(defining_class);
    if (def_class) {
        for (const auto& method_info : def_class->methods) {
            if (method_info.name == method_name) {
                method_func = method_info.func;
                break;
            }
        }
    }
    
    if (method_func == nullptr) {
        #ifdef DEBUG
        std::cerr << "Error: Cannot find LLVM function for method " 
                  << method_name << std::endl;
        #endif
        return nullptr;
    }
    
    // 9. 创建调用
    llvm::Value *result = builder.CreateCall(
        method_func->getFunctionType(),
        method_ptr,
        args,
        "dispatch.result"
    );
    
    return result;
}

llvm::Value *CodeGenerator::emit_cond_class(cond_class* expression)
{
    #ifdef DEBUG
    std::cout << "emit_cond_class" << std::endl;
    #endif
    if (expression == nullptr) return nullptr;

    llvm::Function* current_function = getIRBuilder().GetInsertBlock()->getParent();
    llvm::Value* pred_value = emit_expression(expression->pred);
    if (pred_value == nullptr) {
        return nullptr;
    }

    if (!pred_value->getType()->isIntegerTy(1)) {
        if (pred_value->getType()->isIntegerTy()) {
            pred_value = getIRBuilder().CreateICmpNE(
                pred_value,
                llvm::ConstantInt::get(pred_value->getType(), 0),
                "bool_cmp"
            );
        } else if (pred_value->getType()->isPointerTy()) {
            pred_value = getIRBuilder().CreateICmpNE(
                pred_value,
                llvm::ConstantPointerNull::get(static_cast<llvm::PointerType*>(pred_value->getType())),
                "ptr_cmp"
            );
        } else {
            pred_value = getIRBuilder().CreateICmpNE(
                getIRBuilder().CreatePtrToInt(pred_value, llvm::Type::getInt64Ty(_context.getLLVMContext())),
                llvm::ConstantInt::get(llvm::Type::getInt64Ty(_context.getLLVMContext()), 0),
                "generic_cmp"
            );
        }
    }

    llvm::BasicBlock* then_block = llvm::BasicBlock::Create(_context.getLLVMContext(), "then", current_function);
    llvm::BasicBlock* else_block = llvm::BasicBlock::Create(_context.getLLVMContext(), "else");
    llvm::BasicBlock* merge_block = llvm::BasicBlock::Create(_context.getLLVMContext(), "ifcont");
    getIRBuilder().CreateCondBr(pred_value, then_block, else_block);

    getIRBuilder().SetInsertPoint(then_block);
    llvm::Value* then_value = emit_expression(expression->then_exp);
    llvm::BasicBlock* then_end_block = getIRBuilder().GetInsertBlock();
    bool then_terminated = then_end_block->getTerminator() != nullptr;
    if (!then_terminated) {
        getIRBuilder().CreateBr(merge_block);
    }

    else_block->insertInto(current_function);
    getIRBuilder().SetInsertPoint(else_block);
    llvm::Value* else_value = emit_expression(expression->else_exp);
    llvm::BasicBlock* else_end_block = getIRBuilder().GetInsertBlock();
    bool else_terminated = else_end_block->getTerminator() != nullptr;
    if (!else_terminated) {
        getIRBuilder().CreateBr(merge_block);
    }

    merge_block->insertInto(current_function);
    getIRBuilder().SetInsertPoint(merge_block);

    if (then_terminated && else_terminated) {
        return nullptr;
    }
    if (then_terminated) {
        return else_value;
    }
    if (else_terminated) {
        return then_value;
    }
    if (then_value == nullptr || else_value == nullptr) {
        return nullptr;
    }

    std::string resultCoolType = infer_expression_type(expression, *this);
    llvm::Type* mergeType = nullptr;
    if (!resultCoolType.empty()) {
        mergeType = map_cool_type(*this, resultCoolType);
    }
    if (mergeType == nullptr) {
        if (then_value->getType() == else_value->getType()) {
            mergeType = then_value->getType();
        } else if (then_value->getType()->isPointerTy() && else_value->getType()->isPointerTy()) {
            mergeType = llvm::Type::getInt8PtrTy(_context.getLLVMContext())->getPointerTo();
        } else {
            mergeType = then_value->getType();
        }
    }

    then_value = coerce_value_to_type(*this, then_value, mergeType, "cond_then_cast");
    else_value = coerce_value_to_type(*this, else_value, mergeType, "cond_else_cast");

    if (then_value->getType() != mergeType || else_value->getType() != mergeType) {
        return nullptr;
    }

    llvm::PHINode* phi_node = getIRBuilder().CreatePHI(mergeType, 2, "cond_result");
    phi_node->addIncoming(then_value, then_end_block);
    phi_node->addIncoming(else_value, else_end_block);
    return phi_node;
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

    llvm::IRBuilder<>& builder = getIRBuilder();
    llvm::Function* currentFunction = builder.GetInsertBlock()->getParent();
    llvm::Value* exprValue = emit_expression(expression->expr);
    if (exprValue == nullptr) {
        return nullptr;
    }

    Cases cases = expression->cases;
    if (cases == nullptr) {
        return nullptr;
    }

    struct CaseInfo {
        branch_class* branch;
        int depth;
    };

    std::vector<CaseInfo> branchInfos;
    for (int i = cases->first(); cases->more(i); i = cases->next(i)) {
        auto* branch = dynamic_cast<branch_class*>(cases->nth(i));
        if (!branch) {
            continue;
        }
        int depth = static_cast<int>(getSymbolTable().getInheritanceChain(branch->type_decl->get_string()).size());
        branchInfos.push_back({branch, depth});
    }

    std::sort(branchInfos.begin(), branchInfos.end(), [](const CaseInfo& lhs, const CaseInfo& rhs) {
        return lhs.depth > rhs.depth;
    });

    llvm::Type* i8PtrTy = llvm::Type::getInt8PtrTy(_context.getLLVMContext());
    llvm::Value* vptrPtr = builder.CreateBitCast(exprValue, i8PtrTy->getPointerTo(), "case.vptr.ptr");
    llvm::Value* objectVptr = builder.CreateLoad(i8PtrTy, vptrPtr, "case.vptr");

    llvm::BasicBlock* mergeBlock = llvm::BasicBlock::Create(_context.getLLVMContext(), "case.end");
    std::vector<std::pair<llvm::BasicBlock*, llvm::Value*>> incoming;

    llvm::BasicBlock* currentTestBlock = builder.GetInsertBlock();
    for (size_t index = 0; index < branchInfos.size(); ++index) {
        branch_class* branch = branchInfos[index].branch;
        std::string branchType = branch->type_decl->get_string();

        llvm::BasicBlock* matchBlock = llvm::BasicBlock::Create(_context.getLLVMContext(), "case.match", currentFunction);
        llvm::BasicBlock* nextBlock = (index + 1 < branchInfos.size())
            ? llvm::BasicBlock::Create(_context.getLLVMContext(), "case.next")
            : nullptr;

        builder.SetInsertPoint(currentTestBlock);

        llvm::Value* branchMatch = nullptr;
        for (const auto& [className, classLayout] : getSymbolTable().classRegistry) {
            auto chain = getSymbolTable().getInheritanceChain(className);
            bool compatible = std::any_of(chain.begin(), chain.end(), [&](ClassLayout* cls) {
                return cls && cls->name == branchType;
            });

            if (!compatible || classLayout.vtable == nullptr) {
                continue;
            }

            llvm::Value* candidateVptr = builder.CreateBitCast(classLayout.vtable, i8PtrTy, className + ".vptr");
            llvm::Value* exactMatch = builder.CreateICmpEQ(objectVptr, candidateVptr, className + ".match");
            branchMatch = branchMatch ? builder.CreateOr(branchMatch, exactMatch, "case.or") : exactMatch;
        }

        if (branchMatch == nullptr) {
            branchMatch = llvm::ConstantInt::getFalse(_context.getLLVMContext());
        }

        if (nextBlock != nullptr) {
            builder.CreateCondBr(branchMatch, matchBlock, nextBlock);
        } else {
            llvm::BasicBlock* abortBlock = llvm::BasicBlock::Create(_context.getLLVMContext(), "case.abort", currentFunction);
            builder.CreateCondBr(branchMatch, matchBlock, abortBlock);
            builder.SetInsertPoint(abortBlock);
            if (llvm::Function* abortFunc = getModule().getFunction("abort")) {
                builder.CreateCall(abortFunc, {});
            }
            builder.CreateUnreachable();
        }

        builder.SetInsertPoint(matchBlock);
        getSymbolTable().enterScope();
        llvm::AllocaInst* branchSlot = builder.CreateAlloca(exprValue->getType(), nullptr, std::string(branch->name->get_string()) + ".addr");
        builder.CreateStore(exprValue, branchSlot);
        getSymbolTable().currentScope()->addVariable(
            branch->name->get_string(),
            VariableInfo::createParam(branchSlot, getSymbolTable().getCurrentClassName(), branch->name->get_string(), branchType)
        );
        llvm::Value* branchResult = emit_expression(branch->expr);
        getSymbolTable().exitScope();

        if (builder.GetInsertBlock()->getTerminator() == nullptr) {
            builder.CreateBr(mergeBlock);
        }
        incoming.push_back({builder.GetInsertBlock(), branchResult});

        if (nextBlock != nullptr) {
            nextBlock->insertInto(currentFunction);
            currentTestBlock = nextBlock;
        }
    }

    mergeBlock->insertInto(currentFunction);
    builder.SetInsertPoint(mergeBlock);

    std::string resultCoolType = infer_expression_type(expression, *this);
    llvm::Type* phiType = nullptr;
    if (!resultCoolType.empty()) {
        phiType = map_cool_type(*this, resultCoolType);
    }
    if (phiType == nullptr) {
        for (const auto& [block, value] : incoming) {
            if (value != nullptr) {
                phiType = value->getType();
                break;
            }
        }
    }

    if (phiType == nullptr) {
        return llvm::Constant::getNullValue(llvm::Type::getInt8PtrTy(_context.getLLVMContext()));
    }

    llvm::PHINode* phi = builder.CreatePHI(phiType, static_cast<unsigned>(incoming.size()), "case.result");
    for (const auto& [block, value] : incoming) {
        llvm::Value* incomingValue = value;
        if (incomingValue == nullptr) {
            incomingValue = phiType->isPointerTy()
                ? static_cast<llvm::Value*>(llvm::ConstantPointerNull::get(static_cast<llvm::PointerType*>(phiType)))
                : static_cast<llvm::Value*>(llvm::Constant::getNullValue(phiType));
        } else {
            incomingValue = coerce_value_to_type(*this, incomingValue, phiType, "case_cast");
        }
        phi->addIncoming(incomingValue, block);
    }

    return phi;
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
        VariableInfo::createParam(alloca, getSymbolTable().getCurrentClassName(), varName, expression->type_decl->get_string()));

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
    std::string leftType = infer_expression_type(expression->e1, *this);
    std::string rightType = infer_expression_type(expression->e2, *this);

    #ifdef DEBUG
    std::cerr << "[DEBUG] Equality comparison types:" << std::endl;
    if (left_val) {
        std::cerr << "  Left:  ";
        left_val->getType()->print(llvm::errs());
        std::cerr << " (value: ";
        left_val->print(llvm::errs());
        std::cerr << ")" << std::endl;
    }
    if (right_val) {
        std::cerr << "  Right: ";
        right_val->getType()->print(llvm::errs());
        std::cerr << " (value: ";
        right_val->print(llvm::errs());
        std::cerr << ")" << std::endl;
    }
    #endif

    if (leftType == "String" && rightType == "String") {
        llvm::Function* stringEquals = find_builtin_method_in_hierarchy(*this, getSymbolTable(), "String", "equals");
        if (stringEquals != nullptr) {
            return getIRBuilder().CreateCall(stringEquals, {left_val, right_val}, "eqtmp");
        }
    }

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
    std::cout << "emit_string_const_class " << expression->token->get_string() << std::endl;
    #endif
    
    if (expression == nullptr) return nullptr;
    
    std::string str = expression->token->get_string();
    
    // 检查字符串池中是否已存在
    llvm::Value* exist_str = getSymbolTable().getStringValue(str);
    if (exist_str != nullptr) {
        return exist_str;
    }
    // 创建字符串常量
    llvm::Constant* str_const = llvm::ConstantDataArray::getString(
        _context.getLLVMContext(),
        str,
        true
    );
    
    // 生成基于哈希的全局变量名
    std::hash<std::string> hasher;
    std::string global_name = ".str." + std::to_string(hasher(str));
    
    // 创建全局变量
    llvm::GlobalVariable* global_str = new llvm::GlobalVariable(
        getModule(),
        str_const->getType(),
        true,
        llvm::GlobalVariable::PrivateLinkage,
        str_const,
        global_name
    );
    
    // 获取 i8* 指针
    llvm::Type* i8_type = llvm::Type::getInt8Ty(_context.getLLVMContext());
    llvm::Type* i32_type = llvm::Type::getInt32Ty(_context.getLLVMContext());
    llvm::Value* zero = llvm::ConstantInt::get(i32_type, 0);
    llvm::Value* indices[] = { zero, zero };
    
    llvm::Value* str_ptr = getIRBuilder().CreateInBoundsGEP(
        global_str->getValueType(),
        global_str,
        indices,
        "str_ptr"
    );
    
    // 缓存到池中
    getSymbolTable().registerString(str, str_ptr);
    
    return str_ptr;
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

VariableInfo* CodeGenerator::findVariable(const std::string& varName)
{
    return _symbolTable.findVariable(varName);
}

// 标识符处理
llvm::Value* CodeGenerator::emit_object_class(object_class* expression) {
    #ifdef DEBUG
    std::cout << "emit_object_class" << std::endl;
    #endif

    if (expression == nullptr) return nullptr;
    // std::cout << expression->name->get_string() << std::endl;

    VariableInfo* varInfo = findVariable(expression->name->get_string());
    if (!varInfo || !varInfo->value) {
        if (varInfo && varInfo->storage == StorageClass::MEMBER) {
            llvm::Value* fieldAddr = get_member_address(*this, *varInfo);
            if (fieldAddr != nullptr) {
                return getIRBuilder().CreateLoad(
                    mapCoolTypeToLLVM(varInfo->typeName),
                    fieldAddr,
                    expression->name->get_string()
                );
            }
        }
        #ifdef DEBUG
        std::cout << "VariableInfo not found" << std::endl;
        #endif
        return nullptr;
    }

    if (varInfo->storage == StorageClass::MEMBER) {
        llvm::Value* fieldAddr = get_member_address(*this, *varInfo);
        if (fieldAddr == nullptr) {
            return nullptr;
        }
        return getIRBuilder().CreateLoad(mapCoolTypeToLLVM(varInfo->typeName), fieldAddr, expression->name->get_string());
    }

    return getIRBuilder().CreateLoad(mapCoolTypeToLLVM(varInfo->typeName), varInfo->value, expression->name->get_string());
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
    else if (auto* expr = dynamic_cast<typcase_class*>(e)) {
        return emit_typcase_class(expr);
    }
    else if (auto* expr = dynamic_cast<typcase_class*>(e)) {
        return emit_typcase_class(expr);
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

llvm::Function* CodeGenerator::createMainFunction()
{
    // 创建入口函数
    llvm::FunctionType* main_type = llvm::FunctionType::get(
        llvm::Type::getInt32Ty(getContext().getLLVMContext()), false
    );
    llvm::Function* main_func = llvm::Function::Create(
        main_type, llvm::Function::ExternalLinkage, "main", &getModule()
    );
    
    // 创建基本块
    llvm::BasicBlock* bb = llvm::BasicBlock::Create(getContext().getLLVMContext(), "entry", main_func);
    getIRBuilder().SetInsertPoint(bb);
    
    // Main.main 是实例方法，需要先构造 Main 对象再调用。
    llvm::Function* main_method = getModule().getFunction("Main.main");
    ClassLayout* main_layout = getSymbolTable().findClass("Main");
    if (main_method != nullptr && main_layout != nullptr && main_layout->newFunc != nullptr) {
        llvm::Value* main_obj = getIRBuilder().CreateCall(main_layout->newFunc, {}, "main.obj");
        getIRBuilder().CreateCall(main_method, {main_obj});
    } else {
        #ifdef DEBUG
        std::cerr << "Error: Main bootstrap is incomplete" << std::endl;
        #endif
    }
    
    // 返回 0
    getIRBuilder().CreateRet(llvm::ConstantInt::get(getContext().getLLVMContext(), llvm::APInt(32, 0)));
    
    return main_func;
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
    
    return nullptr;
}

llvm::Value* CodeGenerator::emit_program(Program program) 
{
    #ifdef DEBUG
    std::cout << "emit_program" << std::endl;
    #endif

    emit_program_class((program_class*)program);
    // 然后创建入口main函数（调用 Main.main）
    return createMainFunction(); 
}
