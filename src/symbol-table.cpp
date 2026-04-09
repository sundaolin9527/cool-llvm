#include "symbol-table.h"
#include <algorithm>


// ==================== ScopeFrame 实现 ====================
void SymbolTableManager::ScopeFrame::addVariable(const std::string& name, const VariableInfo& info) {
    varList.emplace_front(name, info);
}

VariableInfo* SymbolTableManager::ScopeFrame::findVariable(const std::string& name) {
    #if DEBUG
    std::cout << "SymbolTableManager::ScopeFrame::findVariable: " << name << std::endl;
    #endif
    for (auto& entry : varList) {
        if (entry.name == name) {
            #if DEBUG
            std::cout << "Found ScopeFrame VariableInfo: " << entry.name << std::endl;
            #endif
            return &entry.info;
        }
    }
    return nullptr;
}

bool SymbolTableManager::ScopeFrame::removeVariable(const std::string& name) {
    auto it = std::find_if(varList.begin(), varList.end(),
        [&](const VarEntry& entry) { return entry.name == name; });
    
    if (it != varList.end()) {
        varList.erase(it);
        return true;
    }
    return false;
}

void SymbolTableManager::ScopeFrame::clear() {
    varList.clear();
}

// ==================== SymbolTableManager 实现 ====================
// 作用域栈操作
void SymbolTableManager::enterScope() {
    scopeStack.emplace_back();
}

void SymbolTableManager::exitScope() {
    if (!scopeStack.empty()) {
        scopeStack.pop_back();
    }
}

SymbolTableManager::ScopeFrame* SymbolTableManager::currentScope() {
    return scopeStack.empty() ? nullptr : &scopeStack.back();
}

// 类操作
void SymbolTableManager::registerClass(const ClassLayout& cls) {
    classRegistry[cls.name] = cls;
}

ClassLayout* SymbolTableManager::findClass(const std::string& name) {
    auto it = classRegistry.find(name);
    return it != classRegistry.end() ? &it->second : nullptr;
}

// ====== 类上下文操作 ======
void SymbolTableManager::enterClass(const std::string& className) {
    classStack.push(className);
}

void SymbolTableManager::exitClass() {
    if (!classStack.empty()) {
        classStack.pop();
    }
}

// 查找指定方法
llvm::Function* SymbolTableManager::findMethod(const std::string& className, const std::string& methodName) {
    ClassLayout* classLayout = findClass(className);
    if (classLayout == nullptr) {
        return nullptr;
    }
    
    for (const auto& method_info : classLayout->methods) {
        if (method_info.name == methodName) {
            return method_info.func;
        }
    }
    
    if (!classLayout->parentName.empty()) {
        return findMethod(classLayout->parentName, methodName);
    }
    
    return nullptr;
}

std::string SymbolTableManager::getCurrentClassName() const {
    if (!classStack.empty()) {
        return classStack.top();
    }
    return "";
}

llvm::StructType* SymbolTableManager::getCurrentClassType() const {
    std::string currClassName = getCurrentClassName();

    if (currClassName.empty()) {
        return nullptr;
    }
    auto it = classRegistry.find(currClassName);
    if (it == classRegistry.end()) {
        std::cerr << "Warning: Class '" << currClassName << "' not found in registry" << std::endl;
        return nullptr;
    }
    
    return it->second.type;
}

llvm::Value* SymbolTableManager::getCurrentThisPointer() const {
    std::string currClassName = getCurrentClassName();

    if (currClassName.empty()) {
        return nullptr;
    }
    auto it = classRegistry.find(currClassName);
    if (it == classRegistry.end()) {
        return nullptr;
    }
    if (it->second.constructor)
    {
        return (it->second.constructor)->arg_begin();
    }
    return nullptr;
}

bool SymbolTableManager::inClass() const {
    return !classStack.empty();
}

// ====== 方法上下文操作 ======
void SymbolTableManager::enterMethod(const std::string& methodName) {
    functionStack.push(methodName);
}

void SymbolTableManager::exitMethod() {
    if (!functionStack.empty()) {
        functionStack.pop();
    }
}

std::string SymbolTableManager::getCurrentMethodName() const {
    if (!functionStack.empty()) {
        return functionStack.top();
    }
    return "";
}

// ====== 嵌套深度查询 ======
int SymbolTableManager::getClassDepth() const {
    return static_cast<int>(classStack.size());
}

int SymbolTableManager::getFunctionDepth() const {
    return static_cast<int>(functionStack.size());
}

// 变量添加
bool SymbolTableManager::addLocalVar(const std::string& name, const std::string& typeName, 
                             llvm::Value* value) {
    if (auto* scope = currentScope()) {
        scope->addVariable(name, VariableInfo::createLocal(value, getCurrentClassName(), typeName));
        return true;
    }
    return false;
}

bool SymbolTableManager::addParam(const std::string& name, const std::string& typeName, 
                          llvm::Value* value) {
    if (auto* scope = currentScope()) {
        scope->addVariable(name, VariableInfo::createParam(value, getCurrentClassName(), typeName));
        return true;
    }
    return false;
}

bool SymbolTableManager::addStaticLocalVar(const std::string& funcName, 
                                   const std::string& varName,
                                   const std::string& typeName, llvm::Value* value) {
    staticLocalVars[funcName][varName] = VariableInfo::createStaticMember(value, getCurrentClassName(), typeName);
    return true;
}

// 变量查找
VariableInfo* SymbolTableManager::findStaticLocalVar(const std::string& funcName, 
                                             const std::string& varName) {
    auto funcIt = staticLocalVars.find(funcName);
    if (funcIt != staticLocalVars.end()) {
        auto varIt = funcIt->second.find(varName);
        if (varIt != funcIt->second.end()) {
            return &varIt->second;
        }
    }
    return nullptr;
}

void SymbolTableManager::addGlobalVar(const std::string& name, const std::string& typeName, 
                              llvm::Value* value) {
    globalVars[name] = VariableInfo::createGlobal(value, "", typeName);
}

VariableInfo* SymbolTableManager::findGlobalVar(const std::string& name) {
    auto it = globalVars.find(name);
    return it != globalVars.end() ? &it->second : nullptr;
}

std::vector<ClassLayout*> SymbolTableManager::getInheritanceChain(const std::string& className) {
    std::vector<ClassLayout*> chain;
    std::string current = className;
    
    while (!current.empty()) {
        auto* cls = findClass(current);
        if (!cls) break;
        
        chain.push_back(cls);
        current = cls->parentName;
    }
    
    // 反转，使基类在前
    std::reverse(chain.begin(), chain.end());
    return chain;
}

// 变量查找
VariableInfo* SymbolTableManager::findVariable(const std::string& varName) 
{
    #ifdef DEBUG
    std::cout << "findVariable: " << varName << std::endl;
    #endif
    
    // 1. 查找局部变量和参数
    for (auto it = scopeStack.rbegin(); it != scopeStack.rend(); ++it) {
        if (auto* var = it->findVariable(varName)) {
            #ifdef DEBUG
            std::cout << "findVariable Local: " << varName << std::endl;
            #endif
            return var;
        }
    }

    // 2. 然后在类继承链中查找成员变量
    VariableInfo* var = findMemberVariableInHierarchy(getCurrentClassName(), varName);
    if (var != nullptr)
    {
        return var;
    }

    // 3. 查找全局变量
    if (auto* global = findGlobalVar(varName)) {
        return global;
    }
    return nullptr;
}

VariableInfo* SymbolTableManager::findMemberVariableInHierarchy(const std::string& className, const std::string& varName) 
{
    ClassLayout* classLayout = findClass(className);
    if (!classLayout) {
        return nullptr;
    }
    
    // 在当前类中查找
    auto it = classLayout->ownAttributes.find(varName);
    if (it != classLayout->ownAttributes.end()) {
        #ifdef DEBUG
        std::cout << "  Found in class " << className << " (member variable)" << std::endl;
        #endif
        return &it->second;
    }
    
    // 在父类中查找（递归）
    if (!classLayout->parentName.empty()) {
        #ifdef DEBUG
        std::cout << "  Not found in " << className << ", trying parent: " 
                  << classLayout->parentName << std::endl;
        #endif
        return findMemberVariableInHierarchy(classLayout->parentName, varName);
    }
    
    return nullptr;
}

VariableInfo* SymbolTableManager::findVariableEx(const std::string& className,
                                         const std::string& currentFunc,
                                         const std::string& varName) {
    // 1. 局部变量和参数
    for (auto it = scopeStack.rbegin(); it != scopeStack.rend(); ++it) {
        if (auto* var = it->findVariable(varName)) {
            return var;
        }
    }
    
    // 2. 局部静态变量
    if (!currentFunc.empty()) {
        if (auto* staticLocal = findStaticLocalVar(currentFunc, varName)) {
            return staticLocal;
        }
    }
    
    // 3. 成员变量
    if (!className.empty()) {
        if (auto* cls = findClass(className)) {
            // 普通成员
            auto allMembers = getAllMemberVars(className);
            auto memberIt = allMembers.find(varName);
            if (memberIt != allMembers.end()) {
                return &memberIt->second;
            }
        }
    }
    
    // 4. 全局变量
    if (auto* global = findGlobalVar(varName)) {
        return global;
    }
    
    return nullptr;
}

// 成员变量查找
const std::map<std::string, VariableInfo>& SymbolTableManager::getAllMemberVars(
    const std::string& className) {
    
    // 检查缓存
    auto cacheIt = inheritanceCache.find(className);
    if (cacheIt != inheritanceCache.end()) {
        return cacheIt->second;
    }
    
    // 计算并缓存
    auto chain = getInheritanceChain(className);
    std::map<std::string, VariableInfo> allVars;
    
    for (auto* cls : chain) {
        // 添加普通成员变量
        // for (const auto& [name, var] : cls->memberVars) {
        //     allVars[name] = var;
        // }
    }
    
    inheritanceCache[className] = allVars;
    return inheritanceCache[className];
}

llvm::Value* SymbolTableManager::getStringValue(const std::string& stringName) {
    auto it = string_pool.find(stringName);
    if (it != string_pool.end()) {
        return it->second;
    }
    return nullptr;
}

void SymbolTableManager::registerString(const std::string& stringName, llvm::Value* value) {
    string_pool[stringName] = value;
    return;
}
// 调试
void SymbolTableManager::dump() const {
    std::cout << "=== Symbol Table Dump ===\n";
    
    std::cout << "\n1. Global Variables (" << globalVars.size() << "):\n";
    for (const auto& [name, var] : globalVars) {
        std::cout << "  " << name << " [GLOBAL]\n";
    }
    
    std::cout << "\n2. Classes (" << classRegistry.size() << "):\n";
    for (const auto& [name, cls] : classRegistry) {
        std::cout << "  " << name << " (parent: " << cls.parentName << ")\n";
    }
    
    std::cout << "\n3. Current Scope Depth: " << scopeStack.size() << "\n";
}

// ==================== 类型映射相关方法 ====================
void SymbolTableManager::registerCoolType(const std::string& coolType, llvm::Type* llvmType) {
    if (llvmType == nullptr) {
        return;
    }
    llvmToCool[llvmType] = coolType;
}

llvm::Type* SymbolTableManager::getLLVMTypeForCoolType(const std::string& coolType) const {
    for (const auto& [llvmType, typeName] : llvmToCool) {
        if (typeName == coolType) {
            return llvmType;
        }
    }
    return nullptr;
}

std::string SymbolTableManager::getCoolTypeForLLVMType(llvm::Type* llvmType) const {
    if (llvmType == nullptr) {
        return "";
    }
    
    // 首先直接查找类型本身
    auto it = llvmToCool.find(llvmType);
    if (it != llvmToCool.end()) {
        return it->second;
    }
    
    // 如果是指针类型，查找其指向的类型
    if (auto* ptrType = llvm::dyn_cast<llvm::PointerType>(llvmType);
        ptrType != nullptr && !ptrType->isOpaque()) {
        llvm::Type* pointee = ptrType->getNonOpaquePointerElementType();
        auto pointeeIt = llvmToCool.find(pointee);
        if (pointeeIt != llvmToCool.end()) {
            return pointeeIt->second;
        }
    }
    
    return "";
}

bool SymbolTableManager::hasCoolType(const std::string& coolType) const {
    for (const auto& [llvmType, typeName] : llvmToCool) {
        if (typeName == coolType) {
            return true;
        }
    }
    return false;
}

bool SymbolTableManager::hasLLVMType(llvm::Type* llvmType) const {
    if (llvmType == nullptr) {
        return false;
    }
    
    // 检查类型本身
    if (llvmToCool.find(llvmType) != llvmToCool.end()) {
        return true;
    }
    
    // 如果是指针类型，检查其指向的类型
    if (auto* ptrType = llvm::dyn_cast<llvm::PointerType>(llvmType);
        ptrType != nullptr && !ptrType->isOpaque()) {
        llvm::Type* pointee = ptrType->getNonOpaquePointerElementType();
        if (llvmToCool.find(pointee) != llvmToCool.end()) {
            return true;
        }
    }
    
    return false;
}

std::vector<std::string> SymbolTableManager::getAllCoolTypes() const {
    std::vector<std::string> types;
    types.reserve(llvmToCool.size());
    for (const auto& [llvmType, coolType] : llvmToCool) {
        types.push_back(coolType);
    }
    return types;
}

void SymbolTableManager::removeCoolType(const std::string& coolType) {
    for (auto it = llvmToCool.begin(); it != llvmToCool.end(); ++it) {
        if (it->second == coolType) {
            llvmToCool.erase(it);
            break;
        }
    }
}

void SymbolTableManager::removeLLVMType(llvm::Type* llvmType) {
    llvmToCool.erase(llvmType);
}

void SymbolTableManager::clearTypeMapping() {
    llvmToCool.clear();
}
