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
        std::cerr << "Warning: No method map found for class: " << layout.name << std::endl;
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
        {"value", VariableInfo::createMember(nullptr, "Int", "Int")}
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
        {"value", VariableInfo::createMember(
            nullptr,
            "Bool", "Bool"
        )}
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
            "String"
        )},
        {"length", VariableInfo::createMember(
            nullptr,
            "String", 
            "Int"
        )},
        {"hash", VariableInfo::createMember(
            nullptr,
            "String", 
            "Int"
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
        std::cerr << "Error: String class not found when initializing constants" << std::endl;
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
    std::string ctor_name = className + ".ctor";
    llvm::Function* ctor_func = getModule().getFunction(ctor_name);
    if (ctor_func) {
        getIRBuilder().CreateCall(ctor_func, {obj});
    }
    
    getIRBuilder().CreateRet(obj);
    
    // 恢复插入点
    if (saved_block) {
        getIRBuilder().SetInsertPoint(saved_block);
    }
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
    std::cout << "className: " << className << std::endl;
    std::cout << "classParentName: " << _class->parent->get_string() << std::endl;
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
            classLayout.ownAttributes.emplace(attrName, VariableInfo::createMember(nullptr, classLayout.name, typeName));
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
llvm::Constant* CodeGenerator::createTypeInfo(const std::string& className, uint32_t classTag)
{
    llvm::LLVMContext& ctx = _context.getLLVMContext();
    
    // C++名字修饰：_ZTI + 类名长度 + 类名
    std::string typeinfoName = "_ZTI" + std::to_string(className.length()) + className;
    
    // 检查是否已存在
    llvm::GlobalVariable* existing = getModule().getGlobalVariable(typeinfoName);
    if (existing) {
        return llvm::ConstantExpr::getBitCast(
            existing,
            llvm::Type::getInt8PtrTy(ctx)
        );
    }
    
    // 创建类型名称字符串
    llvm::Constant* classNameStr = llvm::ConstantDataArray::getString(ctx, className);
    
    llvm::GlobalVariable* strVar = new llvm::GlobalVariable(
        getModule(),
        classNameStr->getType(),
        true,  // constant
        llvm::GlobalValue::PrivateLinkage,
        classNameStr,
        ".str." + className
    );
    
    // 简化的typeinfo结构 - 只包含类型名称
    llvm::StructType* typeinfoType = llvm::StructType::create(
        ctx,
        {llvm::Type::getInt8PtrTy(ctx)},  // 只包含类型名称指针
        "struct.__cxxabiv1.__class_type_info"
    );
    
    std::vector<llvm::Constant*> typeinfoVals;
    typeinfoVals.push_back(llvm::ConstantExpr::getBitCast(
        strVar, llvm::Type::getInt8PtrTy(ctx)));
    
    llvm::Constant* typeinfoInit = llvm::ConstantStruct::get(typeinfoType, typeinfoVals);
    
    llvm::GlobalVariable* typeinfo = new llvm::GlobalVariable(
        getModule(),
        typeinfoType,
        true,  // constant
        llvm::GlobalValue::LinkOnceODRLinkage,
        typeinfoInit,
        typeinfoName
    );
    
    typeinfo->setAlignment(llvm::Align(8));
    
    return llvm::ConstantExpr::getBitCast(
        typeinfo,
        llvm::Type::getInt8PtrTy(ctx)
    );
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
    std::cout << "build_vtable: " << classLayout.name << std::endl;
    #endif
    
    //=== 步骤1：收集所有虚函数（包括继承的）====================
    std::vector<ClassLayout::ClassMethodInfo> allVirtualMethods;
    SymbolTableManager& symbol_table = getSymbolTable();
    
    // 1.1 先收集基类的所有虚函数（保持基类中的顺序）
    if (!classLayout.parentName.empty()) {
        ClassLayout* parentLayout = symbol_table.findClass(classLayout.parentName);
        if (parentLayout) {
            // 确保父类的虚表已经构建
            if (!parentLayout->vtable) {
                build_vtable(*parentLayout);
            }
            
            // 从父类复制所有虚方法，保持原有顺序
            for (const auto& parentMethod : parentLayout->methods) {
                // 所有方法都是虚方法（在COOL中）
                allVirtualMethods.push_back(parentMethod);
                
                #ifdef DEBUG
                std::cout << "  Inherited method: " << parentMethod.name 
                          << " from " << classLayout.parentName << std::endl;
                #endif
            }
        }
    }
    
    // 1.2 处理当前类的方法（按声明顺序）
    for (auto& methodInfo : classLayout.methods) {
        bool found = false;
        
        // 检查是否覆盖基类方法
        for (size_t i = 0; i < allVirtualMethods.size(); i++) {
            if (allVirtualMethods[i].name == methodInfo.name) {
                // 覆盖基类方法：替换函数指针，但保持位置不变
                #ifdef DEBUG
                std::cout << "  Overriding method: " << methodInfo.name 
                          << " at position " << i << std::endl;
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
            std::cout << "  New method: " << methodInfo.name << std::endl;
            #endif
            allVirtualMethods.push_back(methodInfo);
        }
    }
    
    // 1.3 为每个方法设置vtableIndex（基于它们在列表中的位置）
    for (size_t i = 0; i < allVirtualMethods.size(); ++i) {
        // 虚函数在虚表中的实际索引 = i + 2 (跳过ABI条目)
        allVirtualMethods[i].vtableIndex = i + 2;
    }
    
    // 更新classLayout的methods为完整的虚函数列表
    classLayout.methods = allVirtualMethods;
    
    //=== 步骤2：构建虚表条目 ====================================
    std::vector<llvm::Constant*> vtableEntries;
    
    // 2.1 offset_to_top（单继承始终为0）
    llvm::Constant* offsetToTop = llvm::ConstantInt::get(
        llvm::Type::getInt64Ty(_context.getLLVMContext()), 0);
    vtableEntries.push_back(llvm::ConstantExpr::getIntToPtr(
        offsetToTop, llvm::Type::getInt8PtrTy(_context.getLLVMContext())));
    
    // 2.2 typeinfo指针（RTTI）
    llvm::Constant* typeinfoPtr = createTypeInfo(classLayout.name, classLayout.classTag);
    vtableEntries.push_back(typeinfoPtr);
    
    // 2.3 添加所有虚函数指针（按allVirtualMethods的顺序）
    for (const auto& methodInfo : classLayout.methods) {
        llvm::Constant* funcPtr = nullptr;
        
        if (methodInfo.func) {
            funcPtr = llvm::ConstantExpr::getBitCast(
                methodInfo.func,
                llvm::Type::getInt8PtrTy(_context.getLLVMContext())
            );
        } else {
            // 如果没有实现，暂时用null，实际应该用Object_abort作为默认
            funcPtr = llvm::Constant::getNullValue(
                llvm::Type::getInt8PtrTy(_context.getLLVMContext()));
        }
        
        vtableEntries.push_back(funcPtr);
    }
    
    //=== 步骤3：创建虚表全局变量 ================================
    llvm::ArrayType* vtableType = llvm::ArrayType::get(
        llvm::Type::getInt8PtrTy(_context.getLLVMContext()),
        vtableEntries.size()
    );
    
    llvm::Constant* vtableInit = llvm::ConstantArray::get(vtableType, vtableEntries);
    
    // C++名字修饰：_ZTV + 类名长度 + 类名
    std::string vtableName = "_ZTV" + std::to_string(classLayout.name.length()) + classLayout.name;
    
    classLayout.vtable = new llvm::GlobalVariable(
        getModule(),
        vtableType,
        true,  // constant
        llvm::GlobalValue::LinkOnceODRLinkage,
        vtableInit,
        vtableName
    );
    
    classLayout.vtable->setAlignment(llvm::Align(8));
    
    #ifdef DEBUG
    std::cout << "build_vtable done for " << classLayout.name 
              << ", entries: " << vtableEntries.size() 
              << " (2 ABI + " << classLayout.methods.size() << " methods)" << std::endl;
    std::cout << "Virtual methods for " << classLayout.name << ":" << std::endl;
    for (size_t i = 0; i < classLayout.methods.size(); ++i) {
        const auto& method = classLayout.methods[i];
        std::cout << "  [" << i << "] vtableIndex=" << method.vtableIndex 
                  << " name=" << method.name << std::endl;
    }
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
    
    // 设置vptr（如果是根类且有虚函数）
    if (classLayout.parentName.empty() && hasVirtualFunctions) {
        // vptr在索引0
        llvm::Value* vptrPtr = getIRBuilder().CreateStructGEP(
            classLayout.type,
            thisPtr,
            0,
            "vptr.ptr"
        );
        
        // 获取虚表指针
        llvm::Value* vtablePtr = getIRBuilder().CreateBitCast(
            classLayout.vtable,
            llvm::PointerType::get(llvm::Type::getInt8Ty(_context.getLLVMContext()), 0)
        );
        
        // 存储vptr
        getIRBuilder().CreateStore(vtablePtr, vptrPtr);
    }
    
    // 初始化当前类的属性
    unsigned fieldIndex = getFieldStartIndex(classLayout);
    unsigned i = 0;
    
    for (auto& attr : classLayout.ownAttributes) {
        // 跳过self成员（稍后处理）
        if (attr.first == "self") continue;
        
        VariableInfo& varInfo = attr.second;
        llvm::Type* fieldType = mapCoolTypeToLLVM(varInfo.typeName);
        
        // 获取字段地址
        llvm::Value* fieldAddr = getIRBuilder().CreateStructGEP(
            classLayout.type,
            thisPtr,
            fieldIndex + i,
            attr.first + ".addr"
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
        classLayout.name
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
            curr_scope->addVariable(paramNames[i], VariableInfo::createParam(alloca, className, paramTypeNames[i]));
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

FormalParams CodeGenerator::emit_formals(Formals formals)
{
    #ifdef DEBUG
    std::cout << "emit_formals" << std::endl;
    #endif
    std::vector<std::string> paramNames;
    std::vector<std::string> paramTypeNames;

    paramNames.push_back("this");
    paramTypeNames.push_back(getSymbolTable().getCurrentClassName());
    
    if (formals == nullptr) {
        return {paramNames, paramTypeNames};
    }
    

    for (int i = formals->first(); formals->more(i); i = formals->next(i)) {
        
        formal_class* formal = dynamic_cast<formal_class*>(formals->nth(i));
        if (!formal) continue;
        
        std::string paramName = formal->name->get_string();
        std::string paramTypeName = formal->type_decl->get_string();

        paramNames.push_back(paramName);
        paramTypeNames.push_back(paramTypeName);
    }
    
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
    
    // 2. 获取虚表指针
    // 需要提供类型参数给CreateLoad
    llvm::Type *vtable_ptr_type = llvm::PointerType::get(_context.getLLVMContext(), 0);    
    llvm::Value *vtable_ptr = builder.CreateLoad(
        vtable_ptr_type, 
        obj_ptr, 
        "vtable.ptr"
    );
    
    // 3. 获取方法名对应的符号
    std::string method_name = expression->name->get_string();
    
    // 4. 从对象类型中获取类名
    std::string class_name = get_class_name_from_type(obj_ptr->getType());
    
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
        std::cerr << "Error: Method " << method_name << " not found in class hierarchy of " 
                  << class_name << std::endl;
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
        std::cerr << "Error: Cannot find LLVM function for method " 
                  << method_name << std::endl;
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

// (todo*)
std::string CodeGenerator::get_class_name_from_type(llvm::Type *type)
{
    return getSymbolTable().getCurrentClassName();
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
        // 确保两个分支都有返回值
        if (then_value == nullptr || else_value == nullptr) {
            // 如果其中一个分支没有返回值，检查是否是 void 类型
            if (then_value == nullptr && else_value == nullptr) {
                // 两个分支都是 void，返回 nullptr
                return nullptr;
            } else {
                // 一个分支有返回值，另一个没有，这是类型错误
                llvm::errs() << "Error: Mismatched return types in conditional expression\n";
                return nullptr;
            }
        }
        
        // 获取类型
        llvm::Type* then_type = then_value->getType();
        llvm::Type* else_type = else_value->getType();
        
        // 如果类型已经相同，直接创建 PHI 节点
        if (then_type == else_type) {
            llvm::PHINode* phi_node = getIRBuilder().CreatePHI(then_type, 2, "cond_result");
            phi_node->addIncoming(then_value, then_end_block);
            phi_node->addIncoming(else_value, else_end_block);
            return phi_node;
        }
        
        // 类型不同，需要进行类型转换
        llvm::Value* phi_value = nullptr;
        
        // 情况1：整数类型转换
        if (then_type->isIntegerTy() && else_type->isIntegerTy()) {
            unsigned then_bits = then_type->getIntegerBitWidth();
            unsigned else_bits = else_type->getIntegerBitWidth();
            
            // 选择较大的类型
            if (then_bits >= else_bits) {
                // 扩展 else_value
                else_value = getIRBuilder().CreateIntCast(else_value, then_type, true, "intcast_else");
                phi_value = then_value;
                llvm::Type* phi_type = then_type;
            } else {
                // 扩展 then_value
                then_value = getIRBuilder().CreateIntCast(then_value, else_type, true, "intcast_then");
                phi_value = else_value;
                llvm::Type* phi_type = else_type;
            }
        }
        // 情况2：浮点类型转换
        else if (then_type->isFloatingPointTy() && else_type->isFloatingPointTy()) {
            // 选择精度更高的类型
            if (then_type->isDoubleTy() || else_type->isDoubleTy()) {
                // 转换为 double
                llvm::Type* double_type = llvm::Type::getDoubleTy(_context.getLLVMContext());
                if (!then_type->isDoubleTy()) {
                    then_value = getIRBuilder().CreateFPCast(then_value, double_type, "fpcast_then");
                }
                if (!else_type->isDoubleTy()) {
                    else_value = getIRBuilder().CreateFPCast(else_value, double_type, "fpcast_else");
                }
                phi_value = then_value;
                llvm::Type* phi_type = double_type;
            } else {
                // 都是 float，保持原样
                phi_value = then_value;
                llvm::Type* phi_type = then_type;
            }
        }
        // 情况3：整数转浮点
        else if (then_type->isIntegerTy() && else_type->isFloatingPointTy()) {
            // 整数转换为浮点
            then_value = getIRBuilder().CreateSIToFP(then_value, else_type, "sitofp_then");
            phi_value = else_value;
            llvm::Type* phi_type = else_type;
        }
        // 情况4：浮点转整数
        else if (then_type->isFloatingPointTy() && else_type->isIntegerTy()) {
            // 整数转换为浮点
            else_value = getIRBuilder().CreateSIToFP(else_value, then_type, "sitofp_else");
            phi_value = then_value;
            llvm::Type* phi_type = then_type;
        }
        // 情况5：指针类型
        else if (then_type->isPointerTy() && else_type->isPointerTy()) {
            // 检查指针类型是否兼容
            // 简化处理：转换为 void* 指针
            llvm::Type* void_ptr_type = llvm::PointerType::get(llvm::Type::getInt8Ty(_context.getLLVMContext()), 0);
            then_value = getIRBuilder().CreatePointerCast(then_value, void_ptr_type, "ptrcast_then");
            else_value = getIRBuilder().CreatePointerCast(else_value, void_ptr_type, "ptrcast_else");
            phi_value = then_value;
            llvm::Type* phi_type = void_ptr_type;
        }
        // 其他情况：尝试通用转换
        else {
            // 尝试将两者都转换为 i64
            llvm::Type* i64_type = llvm::Type::getInt64Ty(_context.getLLVMContext());
            
            if (then_type->isIntegerTy()) {
                then_value = getIRBuilder().CreateIntCast(then_value, i64_type, true, "generic_intcast_then");
            } else if (then_type->isFloatingPointTy()) {
                then_value = getIRBuilder().CreateFPToSI(then_value, i64_type, "generic_fptosi_then");
            } else if (then_type->isPointerTy()) {
                then_value = getIRBuilder().CreatePtrToInt(then_value, i64_type, "generic_ptrtoint_then");
            }
            
            if (else_type->isIntegerTy()) {
                else_value = getIRBuilder().CreateIntCast(else_value, i64_type, true, "generic_intcast_else");
            } else if (else_type->isFloatingPointTy()) {
                else_value = getIRBuilder().CreateFPToSI(else_value, i64_type, "generic_fptosi_else");
            } else if (else_type->isPointerTy()) {
                else_value = getIRBuilder().CreatePtrToInt(else_value, i64_type, "generic_ptrtoint_else");
            }
            
            phi_value = then_value;
            llvm::Type* phi_type = i64_type;
        }
        
        // 再次检查类型是否一致
        if (then_value->getType() != else_value->getType()) {
            llvm::errs() << "Error: Failed to unify types in conditional expression\n";
            llvm::errs() << "  then type: ";
            then_value->getType()->print(llvm::errs());
            llvm::errs() << "\n  else type: ";
            else_value->getType()->print(llvm::errs());
            llvm::errs() << "\n";
            return nullptr;
        }
        
        // 创建 PHI 节点
        llvm::PHINode* phi_node = getIRBuilder().CreatePHI(then_value->getType(), 2, "cond_result");
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

   llvm::Value* expr_value = emit_expression(expression->expr);
//    Cases cases = expression->cases;
//    for(int i = cases->first(); cases->more(i); i = cases->next(i))
//    {
//       llvm::Value* case_value = emit_expression(cases->nth(i));
//    }
   //如何实现
   return nullptr;
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
        VariableInfo::createParam(alloca, getSymbolTable().getCurrentClassName(), expression->type_decl->get_string()));

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
    std::cout << "emit_string_const_class" << expression->token->get_string() << std::endl;
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

VariableInfo* CodeGenerator::findVariable(const std::string& className, const std::string& varName) 
{
    return _symbolTable.findVariable(className, varName);
}

// 标识符处理
llvm::Value* CodeGenerator::emit_object_class(object_class* expression) {
    #ifdef DEBUG
    std::cout << "emit_object_class" << std::endl;
    #endif

    if (expression == nullptr) return nullptr;
    // std::cout << expression->name->get_string() << std::endl;

    VariableInfo* varInfo = findVariable(getSymbolTable().getCurrentClassName(), expression->name->get_string());
    if (!varInfo || !varInfo->value) {
        std::cout << "VariableInfo not found" << std::endl;
        return nullptr;
    }
    // std::cout << varInfo->typeName << std::endl;
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
        // getModule().print(outs(), nullptr);
        #ifdef DEBUG
        if (i == 4) {
            getModule().print(outs(), nullptr);
        }
        #endif
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