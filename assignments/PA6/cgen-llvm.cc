#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Verifier.h>
#include <llvm/Support/raw_ostream.h>
#include <map>

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
    std::vector<std::pair<std::string, llvm::Type*>> ownAttributes; // 当前类自己的属性
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
    std::vector<std::pair<std::string, llvm::Type*>> allAttributes; // 所有属性（包含继承的）
    std::map<std::string, ClassMethodInfo> allMethods; // 所有方法（包含继承的）
};

// 全局类注册表
std::map<std::string, ClassLayout> classRegistry;
// 当前类的类名, 代码结构后续优化
std::string currClassName = "";
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
            
            classLayout.ownAttributes.push_back({attrName, type});
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
        structFields.push_back(attr.second);
    }
    
    // 创建结构体类型
    classLayout.type = llvm::StructType::create(context, structFields, className);
    
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
    
    //=== 阶段5：生成方法函数 ==========================================
    currClassName = className;
    classRegistry[className] = classLayout; // 先加，在emit_method_class需要用
    for (auto& methodInfo : classLayout.methods) {
        llvm::Value *value = emit_method_class(methodInfo.method);
        methodInfo.func = llvm::dyn_cast<llvm::Function>(value);
    }
    classRegistry.erase(className); // 再减，防止加错

    //=== 阶段6：构建虚表 ==============================================
    std::vector<llvm::Constant*> vtableEntries;

    // 第一个条目：对象大小
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
    
    //=== 阶段7：分配class tag ========================================
    static uint32_t nextClassTag = 1;
    classLayout.classTag = nextClassTag++;
    
    //=== 阶段8：生成构造函数 ==========================================
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
    for (unsigned i = 0; i < classLayout.ownAttributes.size(); i++) {
        llvm::Type* fieldType = classLayout.ownAttributes[i].second;
        llvm::Value* fieldAddr = builder.CreateStructGEP(classLayout.type, thisPtr, startIndex + i);
        
        if (fieldType->isIntegerTy(32)) {
            builder.CreateStore(llvm::ConstantInt::get(llvm::Type::getInt32Ty(context), 0), fieldAddr);
        } else if (fieldType->isIntegerTy(1)) {
            builder.CreateStore(llvm::ConstantInt::getFalse(context), fieldAddr);
        } else if (fieldType->isPointerTy()) {
            builder.CreateStore(llvm::Constant::getNullValue(fieldType), fieldAddr);
        }
    }
    
    builder.CreateRetVoid();
    
    //=== 阶段9：生成new函数 ==========================================
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

    classRegistry[className] = classLayout;
    return classLayout.newFunc;
}

llvm::Value *emit_class_(Class_ class_)
{
     return emit_class__class((class__class*)class_);
}

llvm::Value *emit_method_class(method_class* method)
{
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
    std::vector<llvm::Type*> paramTypes;
    paramTypes.push_back(classLayout.type->getPointerTo());  // this指针
    
    for (int j = method->formals->first(); method->formals->more(j); j = method->formals->next(j)) {
        formal_class *formal = dynamic_cast<formal_class*>(method->formals->nth(j));
        if (formal) {
            std::string formalTypeName = formal->type_decl->get_string();
            llvm::Type* paramType = mapCoolTypeToLLVM(formalTypeName);
            
            if (formalTypeName != "Int" && formalTypeName != "Bool" && formalTypeName != "String") {
                if (!paramType->isPointerTy()) {
                    paramType = paramType->getPointerTo();
                }
            }
            paramTypes.push_back(paramType);
        }
    }
    
    llvm::FunctionType* funcType = llvm::FunctionType::get(returnType, paramTypes, false);
    
    std::string funcName = className + "." + method->name->get_string();
    // ========== 创建函数原型 ===========
    llvm::Function* func = llvm::Function::Create(
        funcType,
        llvm::Function::ExternalLinkage,
        funcName,
        module
    );
    
    // ========== 创建函数体入口 ==========
    //第一个形参是this
    auto argIt = func->arg_begin();
    if (argIt != func->arg_end()) {
        argIt->setName("this");
        ++argIt;  // 移动到第一个形式参数
    }
    // 遍历所有形式参数
    for (int j = method->formals->first(); method->formals->more(j); j = method->formals->next(j)) {
        // 获取形式参数
        formal_class *formal = dynamic_cast<formal_class*>(method->formals->nth(j));
        if (formal && argIt != func->arg_end()) {
            // 设置参数名称
            argIt->setName(formal->name->get_string());
            ++argIt;
        }
    }

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
    // llvm::Value* result = emit_expression(method->expr);
    
    // // 5.3 创建返回指令
    // if (returnType->isVoidTy()) {
    //     builder.CreateRetVoid();
    // } else {
    //     // 确保结果类型匹配返回类型
    //     if (result->getType() != returnType) {
    //         // 可能需要类型转换
    //         result = builder.CreateBitCast(result, returnType, "result");
    //     }
    //     builder.CreateRet(result);
    // }
    return func;
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
