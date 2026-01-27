#include "symbol-table.h"
#include <algorithm>


// ==================== ScopeFrame 实现 ====================
void SymbolTableManager::ScopeFrame::addVariable(const std::string& name, const VariableInfo& info) {
    varList.emplace_front(name, info);
}

VariableInfo* SymbolTableManager::ScopeFrame::findVariable(const std::string& name) {
    for (auto& entry : varList) {
        if (entry.name == name) {
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
bool SymbolTableManager::addLocalVar(const std::string& name, llvm::Type* type, 
                             llvm::Value* value) {
    if (auto* scope = currentScope()) {
        scope->addVariable(name, VariableInfo::createLocal(type, value, getCurrentClassName()));
        return true;
    }
    return false;
}

bool SymbolTableManager::addParam(const std::string& name, llvm::Type* type,
                          llvm::Value* value) {
    if (auto* scope = currentScope()) {
        scope->addVariable(name, VariableInfo::createParam(type, value, getCurrentClassName()));
        return true;
    }
    return false;
}

bool SymbolTableManager::addStaticLocalVar(const std::string& funcName, 
                                   const std::string& varName,
                                   llvm::Type* type, llvm::Value* value) {
    staticLocalVars[funcName][varName] = VariableInfo::createStaticMember(type, value, getCurrentClassName());
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

void SymbolTableManager::addGlobalVar(const std::string& name, llvm::Type* type,
                              llvm::Value* value) {
    globalVars[name] = VariableInfo::createGlobal(type, value);
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
        current = cls->parent;
    }
    
    // 反转，使基类在前
    std::reverse(chain.begin(), chain.end());
    return chain;
}

// 变量查找
VariableInfo* SymbolTableManager::findVariable(const std::string& className, 
                                       const std::string& varName) {
    // 1. 查找局部变量和参数
    for (auto it = scopeStack.rbegin(); it != scopeStack.rend(); ++it) {
        if (auto* var = it->findVariable(varName)) {
            return var;
        }
    }
    
    // 2. 查找成员变量
    ClassLayout* classLayout = nullptr;
    if ((classLayout = findClass(className)) != nullptr) {
        // 查找变量
        auto attrIt = classLayout->ownAttributes.find(varName);
        if (attrIt == classLayout->ownAttributes.end()) {
            std::cout << "Variable '" + varName + "' not found in class " + className << std::endl;
        }

        VariableInfo& varInfo = attrIt->second;
        if (!varInfo.value) {
            std::cout << "Variable '" + varName + "' has no address initialized" << std::endl;
        }

        return &varInfo;
    }
    else
    {
        std::cout << "Class not found: " + className << std::endl;
    }

    
    // 3. 查找全局变量
    if (auto* global = findGlobalVar(varName)) {
        return global;
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

// 调试
void SymbolTableManager::dump() const {
    std::cout << "=== Symbol Table Dump ===\n";
    
    std::cout << "\n1. Global Variables (" << globalVars.size() << "):\n";
    for (const auto& [name, var] : globalVars) {
        std::cout << "  " << name << " [GLOBAL]\n";
    }
    
    std::cout << "\n2. Classes (" << classRegistry.size() << "):\n";
    for (const auto& [name, cls] : classRegistry) {
        std::cout << "  " << name << " (parent: " << cls.parent << ")\n";
    }
    
    std::cout << "\n3. Current Scope Depth: " << scopeStack.size() << "\n";
}