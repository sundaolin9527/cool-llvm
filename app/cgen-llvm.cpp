#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Verifier.h>
#include <llvm/Support/raw_ostream.h>
#include <map>
#include "cgen.h"

using namespace llvm;
using FormalParams = std::pair<std::vector<std::string>, std::vector<llvm::Type*>>;
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
llvm::Value* emit_branch_class(branch_class* branch);
llvm::Value* emit_case(Case _case);
llvm::Value* emit_program_class(program_class* program);
llvm::Value* emit_program(Program program);
FormalParams emit_formals(Formals formals, llvm::Type* classType);
enum VariableScope {
    VS_MEMBER,     // 成员变量
    VS_LOCAL,      // 局部变量
    VS_PARAM,      // 参数
    VS_GLOBAL      // 全局变量
};

struct VariableInfo {
    llvm::Type* type = nullptr;
    VariableScope scope = VS_MEMBER;
    llvm::Value* value = nullptr; //变量值
    
    VariableInfo() = default;
    VariableInfo(llvm::Type* t, VariableScope s, llvm::Value* v)
        : type(t), scope(s), value(v) {}
    
    static VariableInfo create(llvm::Type* t, VariableScope s, llvm::Value* v = nullptr) {
        return VariableInfo(t, s, v);
    }
    static VariableInfo createMember(llvm::Type* t, llvm::Value* address = nullptr) {
        return create(t, VS_MEMBER, address);
    }
    static VariableInfo createLocal(llvm::Type* t, llvm::Value* allocaInst = nullptr) {
        return create(t, VS_LOCAL, allocaInst);
    }
    static VariableInfo createParam(llvm::Type* t, llvm::Value* paramValue = nullptr) {
        return create(t, VS_PARAM, paramValue);
    }
    static VariableInfo createGlobal(llvm::Type* t, llvm::Value* globalVar = nullptr) {
        return create(t, VS_GLOBAL, globalVar);
    }
    void updateValue(llvm::Value* newValue) {
        value = newValue;
    }
};

VariableInfo* findVariable(const std::string& className, const std::string& varName);

struct ClassMethodInfo {
    std::string name;
    method_class* method;
    llvm::Function* func;
    int vtableIndex;
};

struct ClassLayout {
    std::string name;
    std::string parent;
    llvm::StructType* type;
    std::map<std::string, VariableInfo> ownAttributes; // 当前类自己的属性
    std::vector<ClassMethodInfo> methods;
    std::vector<std::string> methodNamesInOrder;
    llvm::GlobalVariable* vtable;
    llvm::Function* constructor;
    llvm::Function* newFunc;
    uint32_t classTag;
    uint32_t objectSize;
};

struct InheritanceInfo {
    std::vector<ClassLayout*> chain; // 从Object到当前类的继承链
    std::map<std::string, VariableInfo> allAttributes; // 所有属性（包含继承的）
    std::map<std::string, ClassMethodInfo> allMethods; // 所有方法（包含继承的）
};

// 全局类注册表
std::map<std::string, ClassLayout> classRegistry;
// 当前类的类名, 代码结构后续优化
std::string currClassName = "";

LLVMContext context; // 贯穿整个流程
Module module("MainModule", context); // 一个编译单元
IRBuilder<> builder(context);

llvm::Type* mapCoolTypeToLLVM(const std::string& typeName) {
    if (typeName == "Int") {
        return llvm::Type::getInt32Ty(context);
    } else if (typeName == "Bool") {
        return llvm::Type::getInt1Ty(context);
    } else if (typeName == "String") {
        return llvm::Type::getInt8PtrTy(context);  // char*
    } else if (typeName == "SELF_TYPE") {
        // SELF_TYPE 是特殊的，表示当前类类型
        // 需要在具体上下文中确定
        return llvm::Type::getInt8PtrTy(context)->getPointerTo();
    } else if (typeName == "Object") {
        // Object 是所有类的基类
        return llvm::Type::getInt8PtrTy(context)->getPointerTo();
    } else if (typeName == "IO") {
        // IO 类
        return llvm::Type::getInt8PtrTy(context)->getPointerTo();
    }
    
    // 尝试查找已定义的结构体类型
    llvm::StructType* existingType = llvm::StructType::getTypeByName(context, typeName);
    if (existingType) {
        return llvm::PointerType::get(existingType, 0);
    }
    
    // 默认：作为指向对象的指针（二级指针）
    return llvm::Type::getInt8PtrTy(context)->getPointerTo();
}

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

/**
 * 内存布局：
 * offset 0-3:   Class tag
 * offset 4-7:   Object size (bytes)
 * offset 8-15:  Dispatch pointer (指向函数指针数组)
 * offset 16-...: Attributes (先基类后派生类)
 */
llvm::Value *emit_class__class(class__class* _class)
{
    if (_class == nullptr) return nullptr;
    
    std::string className = _class->name->get_string();
    std::string parentName = _class->parent->get_string();
    
    // 检查是否已生成该类
    if (classRegistry.find(className) != classRegistry.end()) {
        return classRegistry[className].newFunc;
    }
    
    //=== 阶段1：收集当前类信息 ========================================
    ClassLayout classLayout;
    classLayout.name = className;
    classLayout.parent = parentName;
    for (int i = _class->features->first(); _class->features->more(i); i = _class->features->next(i)) {
        Feature_class *feature = _class->features->nth(i);
        
        if (attr_class *attr = dynamic_cast<attr_class*>(feature)) {
             // 收集当前类自己的属性（不包含继承的）
            std::string attrName = attr->name->get_string();
            std::string typeName = attr->type_decl->get_string();
            llvm::Type* type = mapCoolTypeToLLVM(typeName);
            
            // (todo*)是否需要判断？？
            if (typeName != "Int" && typeName != "Bool" && typeName != "String") {
                if (!type->isPointerTy()) {
                    type = type->getPointerTo();
                }
            }
            classLayout.ownAttributes.emplace(attrName, VariableInfo::createMember(type));
        }
        else if (method_class *method = dynamic_cast<method_class*>(feature)) 
        {
            // 收集当前类自己的方法（不包含继承的）
            std::string methodName = method->name->get_string();
            classLayout.methodNamesInOrder.push_back(methodName);

            ClassMethodInfo methodInfo;
            methodInfo.name = methodName;
            methodInfo.method = method;
            methodInfo.func = nullptr;
            methodInfo.vtableIndex = classLayout.methods.size() + 1;
            classLayout.methods.push_back(methodInfo);
        }
    }
    
    //=== 阶段2：构建继承信息 ==========================================
    InheritanceInfo inheritanceInfo;
    
    // 获取父类的布局（如果存在）
    llvm::StructType* parentType = nullptr;
    ClassLayout* parentLayout = nullptr;
    
    if (!parentName.empty()) {
        auto parentIt = classRegistry.find(parentName);
        if (parentIt != classRegistry.end()) {
            parentLayout = &parentIt->second;
            parentType = parentLayout->type;
        }
    }
    
    //=== 阶段3：创建内存布局====================================
    std::vector<llvm::Type*> structFields;
    
    // 对象头
    structFields.push_back(llvm::Type::getInt32Ty(context));      // Class tag
    structFields.push_back(llvm::Type::getInt32Ty(context));      // Object size
    structFields.push_back(llvm::Type::getInt8PtrTy(context)->getPointerTo()); // Dispatch pointer
    
    // 如果父类存在，包含父类的整个结构体
    if (parentType) {
        // 嵌套父类的整个结构体, 包含父类的类型，而不是展开它的字段
        structFields.push_back(parentType);
    } else {
        // 没有父类
    }
    
    // 添加当前类自己的属性
    for (const auto& attr : classLayout.ownAttributes) {
        const VariableInfo& info = attr.second;    // 变量信息
        structFields.push_back(info.type);
    }
    
    // 创建结构体类型
    classLayout.type = llvm::StructType::create(context, structFields, className);
    
    // 计算类大小
    const llvm::DataLayout DL = module.getDataLayout();
    classLayout.objectSize = DL.getTypeAllocSize(classLayout.type);

    //=== 阶段4：合并方法（处理继承和重写） ============================
    std::map<std::string, ClassMethodInfo> allMethods;
    std::vector<std::string> allMethodNamesInOrder;
    
    // 继承父类的方法
    if (parentLayout) {
        // 复制父类的方法和顺序
        for (const auto& method : parentLayout->methods) {
            allMethods[method.name] = method;
        }
        allMethodNamesInOrder = parentLayout->methodNamesInOrder;
    }
    
    // 处理当前类的方法（可能重写父类方法）
    for (auto& methodInfo : classLayout.methods) {
        if (allMethods.find(methodInfo.name) != allMethods.end()) {
            // 重写父类方法：更新方法信息，但保持虚表索引不变
            methodInfo.vtableIndex = allMethods[methodInfo.name].vtableIndex;
            allMethods[methodInfo.name] = methodInfo;
        } else {
            // 新方法：添加到末尾
            methodInfo.vtableIndex = allMethods.size() + 1;
            allMethods[methodInfo.name] = methodInfo;
            allMethodNamesInOrder.push_back(methodInfo.name);
        }
    }

    currClassName = className;
    //=== 阶段5：构建虚表 ==============================================
    std::vector<llvm::Constant*> vtableEntries;

    // 第一个条目：对象大小(todo*)
    llvm::Constant* objectSizeConst = llvm::ConstantInt::get(
        llvm::Type::getInt32Ty(context), 
        classLayout.objectSize
    );
    vtableEntries.push_back(llvm::ConstantExpr::getIntToPtr(
        objectSizeConst, 
        llvm::Type::getInt8PtrTy(context)
    ));

    // 构建继承链的方法列表
    std::vector<std::string> finalMethodOrder;
    std::map<std::string, ClassMethodInfo> finalMethods;

    // 1. 先收集继承链上所有类的方法，按照从基类到当前类的顺序
    std::vector<ClassLayout*> inheritanceChain;
    std::vector<std::string> chainMethodOrder;

    // 构建继承链（需要先处理好所有父类）
    if (!parentName.empty()) {
        if (parentLayout) {
            // 使用父类的方法顺序作为基础
            chainMethodOrder = parentLayout->methodNamesInOrder;
            
            // 复制父类的所有方法
            for (const auto& method : parentLayout->methods) {
                finalMethods[method.name] = method;
            }
        }
    } else {
        // 对于没有父类的类，从空开始
        chainMethodOrder.clear();
        finalMethods.clear();
    }

    // 2. 处理当前类的方法
    for (auto& methodInfo : classLayout.methods) {
        if (finalMethods.find(methodInfo.name) != finalMethods.end()) {
            // 重写父类方法：替换方法实现，但保持位置不变
            finalMethods[methodInfo.name] = methodInfo;
        } else {
            // 新方法：添加到列表末尾
            finalMethods[methodInfo.name] = methodInfo;
            chainMethodOrder.push_back(methodInfo.name);
        }
    }

    // 3. 最终的方法顺序就是chainMethodOrder
    finalMethodOrder = chainMethodOrder;

    // 4. 为classLayout保存最终的方法信息
    classLayout.methodNamesInOrder = finalMethodOrder;
    // 更新classLayout.methods中的虚表索引
    classLayout.methods.clear();
    for (size_t i = 0; i < finalMethodOrder.size(); i++) {
        const std::string& methodName = finalMethodOrder[i];
        auto it = finalMethods.find(methodName);
        if (it != finalMethods.end()) {
            it->second.vtableIndex = i + 1; // +1 因为第一个条目是对象大小
            classLayout.methods.push_back(it->second);
        }
    }

    // 5. 构建虚表条目
    for (const auto& methodName : finalMethodOrder) {
        auto it = finalMethods.find(methodName);
        if (it != finalMethods.end()) {
            ClassMethodInfo& methodInfo = it->second;
            
            // 如果是当前类的方法，使用当前类的函数
            if (methodInfo.func) {
                vtableEntries.push_back(llvm::ConstantExpr::getBitCast(
                    methodInfo.func, 
                    llvm::Type::getInt8PtrTy(context)
                ));
            } else {
                // 否则，寻找继承的方法
                // 如果methodInfo.func为空，说明这个方法是从父类继承的
                // 我们需要找到父类中对应的函数
                
                bool found = false;
                
                // 首先在当前类的方法中查找（可能已经被重写）
                for (const auto& m : classLayout.methods) {
                    if (m.name == methodName && m.func) {
                        vtableEntries.push_back(llvm::ConstantExpr::getBitCast(
                            m.func, 
                            llvm::Type::getInt8PtrTy(context)
                        ));
                        found = true;
                        break;
                    }
                }
                
                // 如果没有找到，在父类中查找
                if (!found && parentLayout) {
                    for (const auto& parentMethod : parentLayout->methods) {
                        if (parentMethod.name == methodName && parentMethod.func) {
                            vtableEntries.push_back(llvm::ConstantExpr::getBitCast(
                                parentMethod.func, 
                                llvm::Type::getInt8PtrTy(context)
                            ));
                            found = true;
                            break;
                        }
                    }
                }
                
                // 如果还没有找到，需要在整个继承链中查找
                if (!found) {
                    ClassLayout* currentParent = parentLayout;
                    while (currentParent && !found) {
                        for (const auto& parentMethod : currentParent->methods) {
                            if (parentMethod.name == methodName && parentMethod.func) {
                                vtableEntries.push_back(llvm::ConstantExpr::getBitCast(
                                    parentMethod.func, 
                                    llvm::Type::getInt8PtrTy(context)
                                ));
                                found = true;
                                break;
                            }
                        }
                        if (!currentParent->parent.empty()) {
                            auto it = classRegistry.find(currentParent->parent);
                            currentParent = (it != classRegistry.end()) ? &it->second : nullptr;
                        } else {
                            currentParent = nullptr;
                        }
                    }
                }
                
                // 如果还是没有找到，创建一个空指针
                if (!found) {
                    vtableEntries.push_back(llvm::Constant::getNullValue(llvm::Type::getInt8PtrTy(context)));
                }
            }
        }
    }

    // 6. 创建虚表
    llvm::ArrayType* vtableType = llvm::ArrayType::get(
        llvm::Type::getInt8PtrTy(context),
        vtableEntries.size()
    );

    llvm::Constant* vtableInit = llvm::ConstantArray::get(vtableType, vtableEntries);

    std::string vtableName = "vtable." + className;
    classLayout.vtable = new llvm::GlobalVariable(
        module,
        vtableType,
        true,
        llvm::GlobalValue::PrivateLinkage,
        vtableInit,
        vtableName
    );
    
    //=== 阶段6：分配class tag ========================================
    static uint32_t nextClassTag = 1;
    classLayout.classTag = nextClassTag++;
    
    //=== 阶段7：生成构造函数 ==========================================
    llvm::FunctionType* ctorType = llvm::FunctionType::get(
        llvm::Type::getVoidTy(context),
        {classLayout.type->getPointerTo()},
        false
    );
    
    classLayout.constructor = llvm::Function::Create(
        ctorType,
        llvm::Function::ExternalLinkage,
        className + ".ctor",
        module
    );
    
    llvm::BasicBlock* entryBB = llvm::BasicBlock::Create(context, "entry", classLayout.constructor);
    builder.SetInsertPoint(entryBB);
    
    llvm::Value* thisPtr = classLayout.constructor->arg_begin();
    
    // 设置class tag
    llvm::Value* tagAddr = builder.CreateStructGEP(classLayout.type, thisPtr, 0);
    builder.CreateStore(
        llvm::ConstantInt::get(llvm::Type::getInt32Ty(context), classLayout.classTag),
        tagAddr
    );
    
    // 设置object size
    llvm::Value* sizeAddr = builder.CreateStructGEP(classLayout.type, thisPtr, 1);
    builder.CreateStore(
        llvm::ConstantInt::get(llvm::Type::getInt32Ty(context), classLayout.objectSize),
        sizeAddr
    );
    
    // 设置dispatch pointer
    llvm::Value* dispatchAddr = builder.CreateStructGEP(classLayout.type, thisPtr, 2);
    llvm::Value* vtablePtr = builder.CreateBitCast(
        classLayout.vtable,
        llvm::Type::getInt8PtrTy(context)->getPointerTo()
    );
    builder.CreateStore(vtablePtr, dispatchAddr);
    
    // 如果有父类，需要调用父类的构造函数
    if (parentType) {
        // 获取父类部分在结构体中的偏移
        llvm::Value* parentPartAddr = builder.CreateStructGEP(classLayout.type, thisPtr, 3);
        
        // 调用父类的构造函数
        if (parentLayout && parentLayout->constructor) {
            builder.CreateCall(parentLayout->constructor, {parentPartAddr});
        }
    }
    
    // 初始化当前类自己的属性
    unsigned startIndex = 3 + (parentType ? 1 : 0); // 3个头字段 + (父类结构体)
    unsigned i = 0;
    for (auto it = classLayout.ownAttributes.begin();it != classLayout.ownAttributes.end(); ++it, ++i) {
        VariableInfo& varInfo = it->second;
        llvm::Type* fieldType = varInfo.type;
        llvm::Value* fieldAddr = builder.CreateStructGEP(classLayout.type, thisPtr, startIndex + i);
        
        if (fieldType->isIntegerTy(32)) {
            builder.CreateStore(llvm::ConstantInt::get(llvm::Type::getInt32Ty(context), 0), fieldAddr);
        } else if (fieldType->isIntegerTy(1)) {
            builder.CreateStore(llvm::ConstantInt::getFalse(context), fieldAddr);
        } else if (fieldType->isPointerTy()) {
            builder.CreateStore(llvm::Constant::getNullValue(fieldType), fieldAddr);
        }

        varInfo.updateValue(fieldAddr);
    }

    builder.CreateRetVoid();
    
    //=== 阶段8：生成new函数 ==========================================
    llvm::FunctionType* newFuncType = llvm::FunctionType::get(
        classLayout.type->getPointerTo(),
        {},
        false
    );
    
    classLayout.newFunc = llvm::Function::Create(
        newFuncType,
        llvm::Function::ExternalLinkage,
        className + ".new",
        module
    );
    
    llvm::BasicBlock* newEntryBB = llvm::BasicBlock::Create(context, "entry", classLayout.newFunc);
    builder.SetInsertPoint(newEntryBB);
    
    llvm::Value* sizeVal = llvm::ConstantInt::get(llvm::Type::getInt64Ty(context), classLayout.objectSize);
    llvm::FunctionCallee mallocFunc = module.getOrInsertFunction(
        "malloc",
        llvm::FunctionType::get(llvm::Type::getInt8PtrTy(context), 
                               {llvm::Type::getInt64Ty(context)}, false)
    );
    
    llvm::Value* mem = builder.CreateCall(mallocFunc, {sizeVal});
    llvm::Value* obj = builder.CreateBitCast(mem, classLayout.type->getPointerTo());
    
    builder.CreateCall(classLayout.constructor, {obj});
    builder.CreateRet(obj);

    //=== 阶段9：生成方法函数 ==========================================
    classRegistry[className] = classLayout;
    for (auto& methodInfo : classLayout.methods) {
        llvm::Value *value = emit_method_class(methodInfo.method);
        methodInfo.func = llvm::dyn_cast<llvm::Function>(value);
    }

    return classLayout.newFunc;
}

llvm::Value *emit_class_(Class_ class_)
{
     return emit_class__class((class__class*)class_);
}

llvm::Value *emit_method_class(method_class* method)
{
    std::cout << "emit_method_class" << std::endl;
    if (method == nullptr) return nullptr;

    // 确定返回类型
    std::string returnTypeName = method->return_type->get_string();
    llvm::Type* returnType = nullptr;

    std::string className = currClassName;
    auto it = classRegistry.find(className);
    ClassLayout classLayout = it->second;
    if (returnTypeName == "SELF_TYPE") {
        
        if (it != classRegistry.end())
        {
            returnType = classLayout.type->getPointerTo();
        }
    } else {
        returnType = mapCoolTypeToLLVM(returnTypeName);
        // (todo*) 是否需要加判断
        if (returnTypeName != "Int" && returnTypeName != "Bool" && returnTypeName != "String") {
            if (!returnType->isPointerTy()) {
                returnType = returnType->getPointerTo();
            }
        }
    }
    
    // 构建参数列表
    FormalParams params = emit_formals(method->formals, classLayout.type);
    std::vector<std::string>& paramNames = params.first;
    std::vector<llvm::Type*>& paramTypes = params.second;
    
    llvm::FunctionType* funcType = llvm::FunctionType::get(returnType, paramTypes, false);
    
    std::string funcName = className + "." + method->name->get_string();
    // ========== 创建函数原型 ===========
    llvm::Function* func = llvm::Function::Create(
        funcType,
        llvm::Function::ExternalLinkage,
        funcName,
        module
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
            context,
            "entry",
            func
        );
        builder.SetInsertPoint(entryBlock);

        // 为参数创建alloca指令
        for (auto& arg : func->args()) {
            // 创建alloca指令分配空间
            llvm::AllocaInst* alloca = builder.CreateAlloca(
                arg.getType(),
                nullptr,
                arg.getName() + ".addr"
            );
            // 存储参数值到分配的空间
            builder.CreateStore(&arg, alloca);
        }
        
        // 5.2 生成方法体的表达式/语句
        llvm::BasicBlock* bodyBlock = llvm::BasicBlock::Create(
            context,
            "body",
            func
        );
        builder.CreateBr(bodyBlock);
        builder.SetInsertPoint(bodyBlock);
        llvm::Value* result = emit_expression(method->expr);
        
        // 5.3 创建返回指令
        if (returnType->isVoidTy()) {
            builder.CreateRetVoid();
        } else {
            // 确保结果类型匹配返回类型
            if (result->getType() != returnType) {
                // 可能需要类型转换
                result = builder.CreateBitCast(result, returnType, "result");
            }
            builder.CreateRet(result);
        }
    }

    return func;
}

llvm::Value *emit_attr_class(attr_class* attr)
{
    std::cout << "emit_attr_class" << std::endl;
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

FormalParams emit_formals(Formals formals, llvm::Type* classType)
{
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

llvm::Value *emit_assign_class(assign_class* expression)
{
    std::cout << "emit_assign_class" << std::endl;
    if (expression == nullptr) return nullptr;

    llvm::Value* rhs = emit_expression(expression->expr);
    if (!rhs) {
        std::cerr << "Error: Failed to evaluate RHS of assignment" << std::endl;
        return nullptr;
    }
    VariableInfo* varInfo = findVariable(currClassName, expression->name->get_string());
    std::cout << expression->name->get_string() << std::endl;
    
    if (!varInfo) 
    {
        std::cerr << "Error: VariableInfo is null" << std::endl;
        return nullptr;
    }
    // llvm::Type* expectedType = varInfo.type;
    // llvm::Type* actualType = rhs->getType();
    // 需要检测类型是否一致(todo*)
    builder.CreateStore(rhs, varInfo->value);
    return rhs;
}

llvm::Value *emit_static_dispatch_class(static_dispatch_class* expression)
{
    std::cout << "emit_static_dispatch_class" << std::endl;
    if (expression == nullptr) return nullptr;
}

llvm::Value *emit_dispatch_class(dispatch_class* expression)
{
    std::cout << "emit_dispatch_class" << std::endl;
    if (expression == nullptr) return nullptr; 
}

llvm::Value *emit_cond_class(cond_class* expression)
{
    std::cout << "emit_cond_class" << std::endl;
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
    std::cout << "emit_loop_class" << std::endl;
    Function *TheFunction = builder.GetInsertBlock()->getParent();
    BasicBlock *CondBB  = BasicBlock::Create(context, "loop.cond", TheFunction);
    BasicBlock *BodyBB  = BasicBlock::Create(context, "loop.body", TheFunction);
    BasicBlock *AfterBB = BasicBlock::Create(context, "loop.after", TheFunction);

    // entry -> cond
    builder.CreateBr(CondBB);
    builder.SetInsertPoint(CondBB);

    llvm::Value* predVal = emit_expression(expression->pred);
    if (!predVal) return nullptr;

    builder.CreateCondBr(predVal, BodyBB, AfterBB);

    // body -> cond
    builder.SetInsertPoint(BodyBB);
    emit_expression(expression->body);
    builder.CreateBr(CondBB); // 重新回到条件

    // loop exit
    builder.SetInsertPoint(AfterBB);

    return llvm::ConstantInt::get(builder.getInt32Ty(), 0);
}

llvm::Value *emit_typcase_class(typcase_class* expression)
{
    std::cout << "emit_typcase_class" << std::endl;
    if (expression == nullptr) return nullptr;
}

llvm::Value *emit_block_class(block_class* expression)
{
    std::cout << "emit_block_class" << std::endl;
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


static std::unordered_map<Symbol, std::vector<llvm::Value*>> SymbolEnv;

llvm::Value *emit_let_class(let_class* expression)
{
    std::cout << "emit_let_class" << std::endl;
    if (expression == nullptr) return nullptr;
    Symbol id = expression->identifier;

    // Todo： 这里先假定是string，实际应该是具体的类
    llvm::Type* strType = llvm::PointerType::getInt8PtrTy(context);

    llvm::AllocaInst* var = builder.CreateAlloca(strType, nullptr, id->get_string());

    llvm::Value* initVal;
    if (expression->init) {
        initVal = emit_expression(expression->init);
    } else {
        initVal = llvm::ConstantPointerNull::get(
            llvm::cast<llvm::PointerType>(strType));
    }

    builder.CreateStore(initVal, var);

    // 放入符号表（进入作用域）
    SymbolEnv[id].push_back(var);

    // 计算body的时候已经存在新变量的定义了
    llvm::Value* result = emit_expression(expression->body);

    // 退出作用域
    SymbolEnv[id].pop_back();
    if (SymbolEnv[id].empty()) SymbolEnv.erase(id);

    return result;
}

llvm::Value* emit_plus_class(plus_class* expression) {
    std::cout << "emit_plus_class" << std::endl;
    if (expression == nullptr) return nullptr;
    llvm::Value* left_val = emit_expression(expression->e1);
    llvm::Value* right_val = emit_expression(expression->e2);
    return builder.CreateAdd(left_val, right_val, "addtmp");
}

llvm::Value* emit_sub_class(sub_class* expression) {
    std::cout << "emit_sub_class" << std::endl;
    if (expression == nullptr) return nullptr;
    llvm::Value* left_val = emit_expression(expression->e1);
    llvm::Value* right_val = emit_expression(expression->e2);
    
    return builder.CreateSub(left_val, right_val, "subtmp");
}

llvm::Value* emit_mul_class(mul_class* expression) {
    std::cout << "emit_mul_class" << std::endl;
    if (expression == nullptr) return nullptr;
    llvm::Value* left_val = emit_expression(expression->e1);
    llvm::Value* right_val = emit_expression(expression->e2);
    
    return builder.CreateMul(left_val, right_val, "multmp");
}

llvm::Value* emit_divide_class(divide_class* expression) {
    std::cout << "emit_divide_class" << std::endl;
    if (expression == nullptr) return nullptr;
    llvm::Value* left_val = emit_expression(expression->e1);
    llvm::Value* right_val = emit_expression(expression->e2);
    
    return builder.CreateSDiv(left_val, right_val, "divtmp");
}

llvm::Value* emit_neg_class(neg_class* expression) {
    std::cout << "emit_neg_class" << std::endl;
    if (expression == nullptr) return nullptr;
    llvm::Value* val = emit_expression(expression->e1);
    
    llvm::Value* zero = llvm::ConstantInt::get(builder.getInt32Ty(), 0);
    return builder.CreateSub(zero, val, "negtmp");
}

llvm::Value* emit_lt_class(lt_class* expression) {
    std::cout << "emit_lt_class" << std::endl;
    if (expression == nullptr) return nullptr;
    llvm::Value* left_val = emit_expression(expression->e1);
    llvm::Value* right_val = emit_expression(expression->e2);
    
    return builder.CreateICmpSLT(left_val, right_val, "cmptmp");
}

llvm::Value* emit_eq_class(eq_class* expression) {
    std::cout << "emit_leq_class" << std::endl;
    if (expression == nullptr) return nullptr;
    llvm::Value* left_val = emit_expression(expression->e1);
    llvm::Value* right_val = emit_expression(expression->e2);
    
    return builder.CreateICmpEQ(left_val, right_val, "eqtmp");
}

llvm::Value* emit_leq_class(leq_class* expression) {
    std::cout << "emit_leq_class" << std::endl;
    if (expression == nullptr) return nullptr;
    llvm::Value* left_val = emit_expression(expression->e1);
    llvm::Value* right_val = emit_expression(expression->e2);
    
    return builder.CreateICmpSLE(left_val, right_val, "leqtmp");
}

llvm::Value* emit_comp_class(comp_class* expression) {
    std::cout << "emit_comp_class" << std::endl;
    if (expression == nullptr) return nullptr;

    llvm::Value* val = emit_expression(expression->e1);
    return builder.CreateNot(val, "comptmp");
}

llvm::Value* emit_int_const_class(int_const_class* expression) {
    std::cout << "emit_int_const_class" << std::endl;
    if (expression == nullptr || expression->token == nullptr) {
        return nullptr;
    }

    int value = std::stoi(expression->token->get_string());
    return llvm::ConstantInt::get(builder.getInt32Ty(), value);
}

llvm::Value* emit_bool_const_class(bool_const_class* expression) 
{
    std::cout << "emit_bool_const_class" << std::endl;
    if (expression == nullptr) return nullptr;
    return llvm::ConstantInt::get(builder.getInt1Ty(), expression->val ? 1 : 0);
}

llvm::Value* emit_string_const_class(string_const_class* expression) {
    std::cout << "emit_string_const_class" << std::endl;
    if (expression == nullptr) return nullptr;
}

llvm::Value* emit_isvoid_class(isvoid_class* expression) {
    std::cout << "emit_isvoid_class" << std::endl;
    if (expression == nullptr) return nullptr;

    llvm::Value* val = emit_expression(expression->e1);
    
    llvm::Value* null_val = llvm::Constant::getNullValue(val->getType());
    return builder.CreateICmpEQ(val, null_val, "isvoidtmp");
}

llvm::Value* emit_no_expr_class(no_expr_class* expression) {
    std::cout << "emit_no_expr_class" << std::endl;
    if (expression == nullptr) return nullptr;
    return llvm::Constant::getNullValue(builder.getVoidTy());
}

VariableInfo* findVariable(const std::string& className, const std::string& varName) {
    // 查找类
    auto classIt = classRegistry.find(className);
    if (classIt == classRegistry.end()) {
        std::cerr << "Class not found: " + className << std::endl;
        return nullptr;
    }

    ClassLayout& classLayout = classIt->second;

    // 查找变量
    auto attrIt = classLayout.ownAttributes.find(varName);
    if (attrIt == classLayout.ownAttributes.end()) {
        std::cerr << "Variable '" + varName + "' not found in class " + className << std::endl;
        return nullptr;
    }

    VariableInfo& varInfo = attrIt->second;
    if (!varInfo.value) {
        std::cerr << "Variable '" + varName + "' has no address initialized" << std::endl;
        return nullptr;
    }

    return &varInfo;
}

llvm::Value* emit_object_class(object_class* expression) {
    std::cout << "emit_object_class" << std::endl;
    if (expression == nullptr) return nullptr;
    
    VariableInfo* varInfo = findVariable(currClassName, expression->name->get_string());
    if (!varInfo || !varInfo->value) {
        return nullptr;
    }
    return builder.CreateLoad(varInfo->type,varInfo->value, expression->name->get_string());
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
    
    std::cerr << "Error: Unknown expression type: " << typeid(*e).name() << std::endl;
    return nullptr;
}

llvm::Value *emit_branch_class(branch_class *branch)
{
    std::cout << "emit_branch_class" << std::endl;
     if (branch == nullptr) return nullptr;

}

llvm::Value *emit_case(Case _case)
{
    return emit_branch_class((branch_class*)_case);
}

llvm::Value *emit_program_class(program_class *program)
{
    std::cout << "emit_program_class" << std::endl;
    if (program == nullptr) return nullptr;
    
    Classes classes = program->classes;
    for(int i = classes->first(); classes->more(i); i = classes->next(i))
    {
        emit_class_(classes->nth(i));
    }
    // 返回值应该获取Main类中的main函数??
    return nullptr;
}

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

llvm::Value* emit_program(Program program) 
{   // Todo： 这里放到一个main行数更加合理一些，用于完成初始化，调用Main.main等外围代码生成
    RuntimeFuncs::declare();
    emit_base_classes();
    return emit_program_class((program_class*)program);
}
