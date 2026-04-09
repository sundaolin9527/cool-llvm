#ifndef COOL_RUNTIME_H
#define COOL_RUNTIME_H

#include <stdint.h>
#include <stddef.h>

// ========== 动态库导出宏 ==========
#if defined(_WIN32)
    #ifdef COOL_RUNTIME_EXPORT
        #define COOL_EXPORT __declspec(dllexport)
    #else
        #define COOL_EXPORT __declspec(dllimport)
    #endif
#else
    #if __GNUC__ >= 4
        #define COOL_EXPORT __attribute__((visibility("default")))
    #else
        #define COOL_EXPORT
    #endif
#endif

// ========== 对象结构定义（必须与IR中的布局匹配）==========

// 对应 IR: %class.Object.0 = type { ptr }
typedef struct CoolObject {
    void** vtable;
} CoolObject;

// 对应 IR: %class.Int = type { %class.Object.0, i32 }
typedef struct {
    CoolObject parent;
    int32_t value;
    int32_t _padding;
} CoolInt;

// 对应 IR: %class.Bool = type { %class.Object.0, i1 }
typedef struct {
    CoolObject parent;
    int8_t value;
    uint8_t _padding[7];
} CoolBool;

// 对应 IR: %class.String = type { %class.Object.0, ptr, i32, [4 x i8], i32, [4 x i8] }
typedef struct {
    CoolObject parent;
    char* data;
    int32_t length;
    int32_t _padding0;
    int32_t capacity;
    int32_t _padding1;
} CoolString;

// 对应 IR: %class.IO.1 = type { %class.Object.0 }
typedef struct {
    CoolObject parent;
} CoolIO;

#if defined(__cplusplus)
static_assert(sizeof(CoolObject) == 8, "CoolObject layout mismatch");
static_assert(sizeof(CoolInt) == 16, "CoolInt layout mismatch");
static_assert(sizeof(CoolBool) == 16, "CoolBool layout mismatch");
static_assert(sizeof(CoolString) == 32, "CoolString layout mismatch");
static_assert(sizeof(CoolIO) == 8, "CoolIO layout mismatch");
#elif defined(__STDC_VERSION__) && __STDC_VERSION__ >= 201112L
_Static_assert(sizeof(CoolObject) == 8, "CoolObject layout mismatch");
_Static_assert(sizeof(CoolInt) == 16, "CoolInt layout mismatch");
_Static_assert(sizeof(CoolBool) == 16, "CoolBool layout mismatch");
_Static_assert(sizeof(CoolString) == 32, "CoolString layout mismatch");
_Static_assert(sizeof(CoolIO) == 8, "CoolIO layout mismatch");
#endif

// ========== 虚函数表声明（这些在IR中已定义）==========
extern void** _ZTV6Object;
extern void** _ZTV3Int;
extern void** _ZTV4Bool;
extern void** _ZTV6String;
extern void** _ZTV2IO;

// ========== Object 方法 ==========
COOL_EXPORT void* Object_copy(void* this_ptr);
COOL_EXPORT void* Object_abort(void* this_ptr);
COOL_EXPORT void* Object_type_name(void* this_ptr);

// ========== IO 方法 ==========
COOL_EXPORT void* IO_out_string(void* this_ptr, void* str_ptr);
COOL_EXPORT void* IO_out_int(void* this_ptr, int n);
COOL_EXPORT void* IO_in_string(void* this_ptr);
COOL_EXPORT int IO_in_int(void* this_ptr);

// ========== String 方法 ==========
COOL_EXPORT int String_length(void* this_ptr);
COOL_EXPORT void* String_concat(void* this_ptr, void* other_ptr);
COOL_EXPORT void* String_substr(void* this_ptr, int start, int length);
COOL_EXPORT int String_equals(void* this_ptr, void* other_ptr);

// ========== Int 方法 ==========
COOL_EXPORT int Int_plus(int a, int b);
COOL_EXPORT int Int_minus(int a, int b);
COOL_EXPORT int Int_times(int a, int b);
COOL_EXPORT int Int_divide(int a, int b);
COOL_EXPORT int Int_negate(int a);
COOL_EXPORT int Int_equals(int a, int b);

// ========== Bool 方法 ==========
COOL_EXPORT int Bool_not(int b);
COOL_EXPORT int Bool_equals(int a, int b);

#endif // COOL_RUNTIME_H
