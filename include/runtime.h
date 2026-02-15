#ifndef COOL_RUNTIME_H
#define COOL_RUNTIME_H

#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/IRBuilder.h>
#include <string>
#include <map>

class RuntimeAPI {
private:
    llvm::LLVMContext& context;
    llvm::Module& _module;
    
    // 仅声明外部函数，不实现
    struct ExternalFunctions {
        llvm::Function* malloc = nullptr;     // 内存分配
        llvm::Function* free = nullptr;       // 内存释放
        llvm::Function* memcpy = nullptr;     // 内存复制
        llvm::Function* memset = nullptr;     // 内存设置
        llvm::Function* printf = nullptr;     // 格式化输出
        llvm::Function* fprintf = nullptr;    // 文件输出
        llvm::Function* sprintf = nullptr;    // 字符串格式化
        llvm::Function* scanf = nullptr;      // 格式化输入
        llvm::Function* exit = nullptr;       // 程序退出
        llvm::Function* puts = nullptr;       // 字符串输出
        llvm::Function* gets = nullptr;       // 字符串输入
        llvm::Function* strlen = nullptr;     // 字符串长度
        llvm::Function* strcpy = nullptr;     // 字符串复制
        llvm::Function* strncpy = nullptr;    // 字符串复制
        llvm::Function* strcat = nullptr;     // 字符串连接
        llvm::Function* strcmp = nullptr;     // 字符串比较
        llvm::Function* strncmp = nullptr;    // 字符串比较
        llvm::Function* atoi = nullptr;       // 字符串转整数
        llvm::Function* itoa = nullptr;       // 整数转字符串
        llvm::Function* abort = nullptr;      // 异常终止
    } externFuncs;
    
    // COOL 内置函数
    struct CoolBuiltinFunctions {
        // Object 类方法
        llvm::Function* object_copy = nullptr;          // Object.copy()
        llvm::Function* object_abort = nullptr;         // Object.abort()
        llvm::Function* object_type_name = nullptr;     // Object.type_name()
        
        // IO 类方法
        llvm::Function* io_out_string = nullptr;        // IO.out_string(String)
        llvm::Function* io_out_int = nullptr;           // IO.out_int(Int)
        llvm::Function* io_in_string = nullptr;         // IO.in_string()
        llvm::Function* io_in_int = nullptr;            // IO.in_int()
        
        // String 类方法
        llvm::Function* string_length = nullptr;        // String.length()
        llvm::Function* string_concat = nullptr;        // String.concat(String)
        llvm::Function* string_substr = nullptr;        // String.substr(Int, Int)
        
        // 字符串比较和转换
        llvm::Function* string_equals = nullptr;        // 字符串相等比较
        llvm::Function* string_less = nullptr;          // 字符串小于比较
        llvm::Function* string_less_equal = nullptr;    // 字符串小于等于比较
        
        // Int 类方法
        llvm::Function* int_plus = nullptr;             // Int.plus(Int)
        llvm::Function* int_minus = nullptr;            // Int.minus(Int)
        llvm::Function* int_times = nullptr;            // Int.times(Int)
        llvm::Function* int_divide = nullptr;           // Int.divide(Int)
        llvm::Function* int_negate = nullptr;           // Int.negate()
        llvm::Function* int_less = nullptr;             // Int.less(Int)
        llvm::Function* int_less_equal = nullptr;       // Int.less_equal(Int)
        llvm::Function* int_equals = nullptr;           // Int.equals(Int)
        
        // Bool 类方法
        llvm::Function* bool_not = nullptr;             // Bool.not()
        llvm::Function* bool_equals = nullptr;          // Bool.equals(Bool)
        
        // 类型检查和转换
        llvm::Function* isvoid = nullptr;               // isvoid 内置函数
        llvm::Function* new_ = nullptr;                 // new 内置函数
        llvm::Function* type_name = nullptr;            // 获取类型名
        
        // 对象生命周期
        llvm::Function* object_init = nullptr;          // 对象初始化
        llvm::Function* object_destroy = nullptr;       // 对象销毁
        
        // 垃圾回收相关
        llvm::Function* gc_alloc = nullptr;             // GC分配
        llvm::Function* gc_collect = nullptr;           // GC回收
        llvm::Function* gc_init = nullptr;              // GC初始化
    } coolFuncs;
    
public:
    RuntimeAPI(llvm::LLVMContext& ctx, llvm::Module& mod);
    
    // 声明所有函数
    void declareAllFunctions();
    
    // ========== 标准库函数获取 ==========
    llvm::Function* getMalloc() { return externFuncs.malloc; }
    llvm::Function* getFree() { return externFuncs.free; }
    llvm::Function* getMemcpy() { return externFuncs.memcpy; }
    llvm::Function* getMemset() { return externFuncs.memset; }
    llvm::Function* getPrintf() { return externFuncs.printf; }
    llvm::Function* getFprintf() { return externFuncs.fprintf; }
    llvm::Function* getSprintf() { return externFuncs.sprintf; }
    llvm::Function* getScanf() { return externFuncs.scanf; }
    llvm::Function* getExit() { return externFuncs.exit; }
    llvm::Function* getPuts() { return externFuncs.puts; }
    llvm::Function* getGets() { return externFuncs.gets; }
    llvm::Function* getStrlen() { return externFuncs.strlen; }
    llvm::Function* getStrcpy() { return externFuncs.strcpy; }
    llvm::Function* getStrncpy() { return externFuncs.strncpy; }
    llvm::Function* getStrcat() { return externFuncs.strcat; }
    llvm::Function* getStrcmp() { return externFuncs.strcmp; }
    llvm::Function* getStrncmp() { return externFuncs.strncmp; }
    llvm::Function* getAtoi() { return externFuncs.atoi; }
    llvm::Function* getItoa() { return externFuncs.itoa; }
    llvm::Function* getAbort() { return externFuncs.abort; }
    
    // ========== COOL 内置函数获取 ==========
    // Object 类
    llvm::Function* getObjectCopy() { return coolFuncs.object_copy; }
    llvm::Function* getObjectAbort() { return coolFuncs.object_abort; }
    llvm::Function* getObjectTypeName() { return coolFuncs.object_type_name; }
    
    // IO 类
    llvm::Function* getIOOutString() { return coolFuncs.io_out_string; }
    llvm::Function* getIOOutInt() { return coolFuncs.io_out_int; }
    llvm::Function* getIOInString() { return coolFuncs.io_in_string; }
    llvm::Function* getIOInInt() { return coolFuncs.io_in_int; }
    
    // String 类
    llvm::Function* getStringLength() { return coolFuncs.string_length; }
    llvm::Function* getStringConcat() { return coolFuncs.string_concat; }
    llvm::Function* getStringSubstr() { return coolFuncs.string_substr; }
    llvm::Function* getStringEquals() { return coolFuncs.string_equals; }
    llvm::Function* getStringLess() { return coolFuncs.string_less; }
    llvm::Function* getStringLessEqual() { return coolFuncs.string_less_equal; }
    
    // Int 类
    llvm::Function* getIntPlus() { return coolFuncs.int_plus; }
    llvm::Function* getIntMinus() { return coolFuncs.int_minus; }
    llvm::Function* getIntTimes() { return coolFuncs.int_times; }
    llvm::Function* getIntDivide() { return coolFuncs.int_divide; }
    llvm::Function* getIntNegate() { return coolFuncs.int_negate; }
    llvm::Function* getIntLess() { return coolFuncs.int_less; }
    llvm::Function* getIntLessEqual() { return coolFuncs.int_less_equal; }
    llvm::Function* getIntEquals() { return coolFuncs.int_equals; }
    
    // Bool 类
    llvm::Function* getBoolNot() { return coolFuncs.bool_not; }
    llvm::Function* getBoolEquals() { return coolFuncs.bool_equals; }
    
    // 类型操作
    llvm::Function* getIsVoid() { return coolFuncs.isvoid; }
    llvm::Function* getNew() { return coolFuncs.new_; }
    llvm::Function* getTypeName() { return coolFuncs.type_name; }
    
    // 对象生命周期
    llvm::Function* getObjectInit() { return coolFuncs.object_init; }
    llvm::Function* getObjectDestroy() { return coolFuncs.object_destroy; }
    
    // 垃圾回收
    llvm::Function* getGCAlloc() { return coolFuncs.gc_alloc; }
    llvm::Function* getGCCollect() { return coolFuncs.gc_collect; }
    llvm::Function* getGCInit() { return coolFuncs.gc_init; }

    // 类型相关
    llvm::Type* getCoolIntType();      // 返回 COOL Int 的 LLVM 类型
    llvm::Type* getCoolBoolType();     // 返回 COOL Bool 的 LLVM 类型
    llvm::Type* getCoolStringType();   // 返回 COOL String 的 LLVM 类型
    llvm::Type* getCoolObjectType();   // 返回 COOL Object 的 LLVM 类型
    
private:
    // 声明标准库函数
    void declareStandardLibraryFunctions();
    
    // 声明 COOL 内置函数
    void declareCoolBuiltinFunctions();
};
#endif // COOL_RUNTIME_H