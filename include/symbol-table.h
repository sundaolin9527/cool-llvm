#ifndef SYMBOL_TABLE_H
#define SYMBOL_TABLE_H

#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/Value.h>
#include <list>
#include <map>
#include <vector>
#include <string>
#include <iostream>
#include <cassert>
#include <stack>
#include <sstream>

// AST 类型前向声明
struct method_class;

// ==================== 存储类别定义 ====================
enum class StorageClass {
    MEMBER = 1,    // 成员变量（实例相关）
    STATIC_MEMBER, // 静态成员变量（类相关）
    LOCAL,         // 局部变量
    PARAM,         // 形参
    GLOBAL,        // 全局变量
    STATIC_LOCAL   // 局部静态变量
};

// ==================== 变量信息结构 ====================
struct VariableInfo {
    llvm::Type* type = nullptr;
    StorageClass storage;  // 存储类别
    llvm::Value* value = nullptr;    // LLVM值
    std::string className;           // 所属类名（对成员变量和静态成员）
    
    VariableInfo() = default;
    VariableInfo(llvm::Type* t, StorageClass s, llvm::Value* v = nullptr, 
                const std::string& cls = "")
        : type(t), storage(s), value(v), className(cls) {}
    
    static VariableInfo create(llvm::Type* t, StorageClass s, llvm::Value* v = nullptr, std::string className="") {
        return VariableInfo(t, s, v, className);
    }
    static VariableInfo createMember(llvm::Type* t, llvm::Value* address = nullptr, std::string className="") {
        return create(t, StorageClass::MEMBER, address, className);
    }
    static VariableInfo createStaticMember(llvm::Type* t, llvm::Value* v = nullptr, std::string className="") {
        return create(t, StorageClass::STATIC_MEMBER, v, className);
    }
    static VariableInfo createLocal(llvm::Type* t, llvm::Value* allocaInst = nullptr, std::string className="") {
        return create(t, StorageClass::LOCAL, allocaInst, className);
    }
    static VariableInfo createParam(llvm::Type* t, llvm::Value* paramValue = nullptr, std::string className="") {
        return create(t, StorageClass::PARAM, paramValue, className);
    }
    static VariableInfo createGlobal(llvm::Type* t, llvm::Value* globalVar = nullptr, std::string className="") {
        return create(t, StorageClass::GLOBAL, globalVar, className);
    }
    void updateValue(llvm::Value* newValue) {
        value = newValue;
    }

    char* storageClassToString(StorageClass sc) const{
        switch (sc) {
            case StorageClass::MEMBER:        return "MEMBER";
            case StorageClass::STATIC_MEMBER: return "STATIC_MEMBER";
            case StorageClass::LOCAL:         return "LOCAL";
            case StorageClass::PARAM:         return "PARAM";
            case StorageClass::GLOBAL:        return "GLOBAL";
            case StorageClass::STATIC_LOCAL:  return "STATIC_LOCAL";
            default:                          return "UNKNOWN";
        }
    }

    std::string toString() const {
        // 获取类型字符串
        std::string typeStr = "";
        if (type) {
            llvm::raw_string_ostream tso(typeStr);
            type->print(tso);
        }
        
        // 获取值字符串
        std::string valueStr = "";
        if (value) {
            llvm::raw_string_ostream vso(valueStr);
            value->print(vso);
        }
        
        return "VariableInfo{type='" + typeStr + "', storage=" + 
               storageClassToString(storage) + ", value='" + 
               valueStr + "', className='" + className + "'}";
    }
};

// ==================== 类结构 ====================
struct ClassLayout {
    //类方法信息
    struct ClassMethodInfo {
        std::string name;
        method_class* method;
        llvm::Function* func;
        int vtableIndex;
    };
    std::string name;           // 当前类的名字
    std::string parentName="";  // 父类名字
    llvm::StructType* type;     // 当前类的类型
    std::map<std::string, VariableInfo> ownAttributes; // 当前类自己的属性
    std::vector<ClassMethodInfo> methods;  // 当前类自己的方法
    llvm::GlobalVariable* vtable;  // 当前类的虚表
    llvm::Function* constructor;   // 当前类的构造函数
    llvm::Function* newFunc;       // 当前类的new函数
    uint32_t classTag;             // 当前类的tag
    uint32_t objectSize;           // 当前类的大小
};

// ==================== 符号表管理器 ========================
class SymbolTableManager {
private:
    // ==================== 作用域帧条目 ====================
    struct VarEntry {
        std::string name;
        VariableInfo info;
        
        VarEntry() = default;
        VarEntry(const std::string& n, const VariableInfo& i) : name(n), info(i) {}
    };

    // ==================== 作用域帧类声明 ====================
public:
    class ScopeFrame {
    private:
        std::list<VarEntry> varList;
        
    public:
        void addVariable(const std::string& name, const VariableInfo& info);
        VariableInfo* findVariable(const std::string& name);
        bool removeVariable(const std::string& name);
        void clear();
    };

    // 作用域栈（局部变量和参数）
    std::vector<ScopeFrame> scopeStack;
    
    // 全局变量
    std::map<std::string, VariableInfo> globalVars;
    
    // 局部静态变量
    std::map<std::string, std::map<std::string, VariableInfo>> staticLocalVars;
    
    // 类注册表
    std::map<std::string, ClassLayout> classRegistry;
    
    // 继承缓存
    mutable std::map<std::string, std::map<std::string, VariableInfo>> inheritanceCache;
    
    // 类处理上下文栈
    std::stack<std::string> classStack;
    
    // 函数处理上下文栈
    std::stack<std::string> functionStack;
public:
    // 构造函数
    SymbolTableManager() = default;
    
    // 禁止拷贝
    SymbolTableManager(const SymbolTableManager&) = delete;
    SymbolTableManager& operator=(const SymbolTableManager&) = delete;
    
    // 允许移动
    SymbolTableManager(SymbolTableManager&&) = default;
    SymbolTableManager& operator=(SymbolTableManager&&) = default;
    
    // 作用域栈操作
    void enterScope();
    void exitScope();
    ScopeFrame* currentScope();
    
    // ====== 类上下文操作 ======
    void enterClass(const std::string& className);
    void exitClass();
    std::string getCurrentClassName() const;
    llvm::StructType* getCurrentClassType() const;
    bool inClass() const;
    int getClassDepth() const;
    int getFunctionDepth() const;

    // ====== 方法上下文操作 ======
    void enterMethod(const std::string& methodName);
    void exitMethod();
    std::string getCurrentMethodName() const;

    // 变量添加
    bool addLocalVar(const std::string& name, llvm::Type* type, 
                    llvm::Value* value = nullptr);
    bool addParam(const std::string& name, llvm::Type* type,
                 llvm::Value* value = nullptr);
    bool addStaticLocalVar(const std::string& funcName, const std::string& varName,
                          llvm::Type* type, llvm::Value* value = nullptr);
    
    // 变量查找
    VariableInfo* findStaticLocalVar(const std::string& funcName, 
                                    const std::string& varName);
    VariableInfo* findGlobalVar(const std::string& name);
    
    // 类操作
    void addGlobalVar(const std::string& name, llvm::Type* type,
                     llvm::Value* value = nullptr);
    void registerClass(const ClassLayout& cls);
    ClassLayout* findClass(const std::string& name);
    std::vector<ClassLayout*> getInheritanceChain(const std::string& className);
    
    // 变量查找
    VariableInfo* findVariable(const std::string& context, const std::string& name);
    VariableInfo* findVariableEx(const std::string& className,
                                const std::string& currentFunc,
                                const std::string& varName);
    
    // 成员变量查找
    const std::map<std::string, VariableInfo>& getAllMemberVars(
        const std::string& className);
    
    // 调试
    void dump() const;
};

#endif