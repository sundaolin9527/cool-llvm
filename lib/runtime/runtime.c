#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include "runtime.h"

// ========== 虚函数表声明（这些在IR中已定义，这里只是声明）==========
extern void** _ZTV6Object;   // Object虚表
extern void** _ZTV3Int;      // Int虚表
extern void** _ZTV4Bool;     // Bool虚表
extern void** _ZTV6String;   // String虚表
extern void** _ZTV2IO;       // IO虚表

// ========== 辅助函数 ==========

static CoolString* create_cool_string(const char* src) {
    if (!src) src = "";
    
    CoolString* str = (CoolString*)malloc(sizeof(CoolString));
    if (!str) return NULL;
    
    str->parent.vtable = _ZTV6String;
    str->length = strlen(src);
    str->capacity = str->length + 1;
    str->data = (char*)malloc(str->capacity);
    
    if (str->data) {
        strcpy(str->data, src);
    } else {
        free(str);
        return NULL;
    }
    
    return str;
}

static void free_cool_string(CoolString* str) {
    if (str) {
        if (str->data) free(str->data);
        free(str);
    }
}

static CoolInt* create_cool_int(int32_t value) {
    CoolInt* obj = (CoolInt*)malloc(sizeof(CoolInt));
    if (!obj) return NULL;
    obj->parent.vtable = _ZTV3Int;
    obj->value = value;
    return obj;
}

static CoolBool* create_cool_bool(int8_t value) {
    CoolBool* obj = (CoolBool*)malloc(sizeof(CoolBool));
    if (!obj) return NULL;
    obj->parent.vtable = _ZTV4Bool;
    obj->value = value;
    return obj;
}

// ========== Object 方法 ==========

void* Object_copy(void* this_ptr) {
    if (!this_ptr) return NULL;
    
    // 根据虚表判断类型并做深拷贝
    void** vtable = *(void***)this_ptr;
    
    if (vtable == _ZTV3Int) {
        CoolInt* src = (CoolInt*)this_ptr;
        return create_cool_int(src->value);
    }
    else if (vtable == _ZTV4Bool) {
        CoolBool* src = (CoolBool*)this_ptr;
        return create_cool_bool(src->value);
    }
    else if (vtable == _ZTV6String) {
        CoolString* src = (CoolString*)this_ptr;
        return create_cool_string(src->data ? src->data : "");
    }
    
    // Object或IO对象，简单返回自身（浅拷贝）
    return this_ptr;
}

void* Object_abort(void* this_ptr) {
    fprintf(stderr, "Program aborted\n");
    exit(1);
    return NULL;
}

void* Object_type_name(void* this_ptr) {
    if (!this_ptr) return (void*)"null";
    
    void** vtable = *(void***)this_ptr;
    
    if (vtable == _ZTV3Int) return (void*)"Int";
    if (vtable == _ZTV4Bool) return (void*)"Bool";
    if (vtable == _ZTV6String) return (void*)"String";
    if (vtable == _ZTV2IO) return (void*)"IO";
    
    return (void*)"Object";
}

// ========== IO 方法 ==========

void* IO_out_string(void* this_ptr, void* str_ptr) {
    if (!str_ptr) {
        printf("null");
        return this_ptr;
    }
    
    // 检查是否是String对象
    void** vtable = *(void***)str_ptr;
    if (vtable == _ZTV6String) {
        CoolString* str = (CoolString*)str_ptr;
        if (str->data) {
            printf("%s", str->data);
        }
    } else {
        // 如果是普通C字符串（兼容旧代码）
        printf("%s", (char*)str_ptr);
    }
    
    return this_ptr;
}

void* IO_out_int(void* this_ptr, int n) {
    printf("%d", n);
    return this_ptr;
}

void* IO_in_string(void* this_ptr) {
    char buf[4096];
    
    if (!fgets(buf, sizeof(buf), stdin)) {
        return create_cool_string("");
    }
    
    // 去除换行符
    size_t len = strlen(buf);
    if (len > 0 && buf[len-1] == '\n') {
        buf[len-1] = '\0';
    }
    
    return create_cool_string(buf);
}

int IO_in_int(void* this_ptr) {
    int n;
    while (scanf("%d", &n) != 1) {
        // 清空缓冲区
        int c;
        while ((c = getchar()) != '\n' && c != EOF);
        printf("Invalid input. Please enter an integer: ");
    }
    return n;
}

// ========== String 方法 ==========

int String_length(void* this_ptr) {
    if (!this_ptr) return 0;
    
    void** vtable = *(void***)this_ptr;
    if (vtable != _ZTV6String) return 0;
    
    CoolString* str = (CoolString*)this_ptr;
    return str->length;
}

void* String_concat(void* this_ptr, void* other_ptr) {
    if (!this_ptr || !other_ptr) {
        return create_cool_string("");
    }
    
    CoolString* s1 = (CoolString*)this_ptr;
    CoolString* s2 = (CoolString*)other_ptr;
    
    int new_len = s1->length + s2->length;
    char* new_data = (char*)malloc(new_len + 1);
    if (!new_data) return create_cool_string("");
    
    strcpy(new_data, s1->data ? s1->data : "");
    strcat(new_data, s2->data ? s2->data : "");
    
    CoolString* result = create_cool_string(new_data);
    free(new_data);
    
    return result;
}

void* String_substr(void* this_ptr, int start, int length) {
    if (!this_ptr) return create_cool_string("");
    
    CoolString* str = (CoolString*)this_ptr;
    
    // 边界检查
    if (start < 0) start = 0;
    if (start >= str->length) {
        return create_cool_string("");
    }
    if (length < 0) length = 0;
    if (start + length > str->length) {
        length = str->length - start;
    }
    if (length == 0) {
        return create_cool_string("");
    }
    
    char* substr = (char*)malloc(length + 1);
    if (!substr) return create_cool_string("");
    
    strncpy(substr, str->data + start, length);
    substr[length] = '\0';
    
    CoolString* result = create_cool_string(substr);
    free(substr);
    
    return result;
}

int String_equals(void* this_ptr, void* other_ptr) {
    if (this_ptr == other_ptr) return 1;
    if (!this_ptr || !other_ptr) return 0;
    
    CoolString* s1 = (CoolString*)this_ptr;
    CoolString* s2 = (CoolString*)other_ptr;
    
    if (s1->length != s2->length) return 0;
    
    if (!s1->data && !s2->data) return 1;
    if (!s1->data || !s2->data) return 0;
    
    return strcmp(s1->data, s2->data) == 0;
}

// ========== Int 方法 ==========

int Int_plus(int a, int b) { 
    // 检查溢出
    if ((b > 0 && a > INT32_MAX - b) || (b < 0 && a < INT32_MIN - b)) {
        fprintf(stderr, "Int_plus: overflow\n");
        return 0;
    }
    return a + b; 
}

int Int_minus(int a, int b) { 
    if ((b < 0 && a > INT32_MAX + b) || (b > 0 && a < INT32_MIN + b)) {
        fprintf(stderr, "Int_minus: overflow\n");
        return 0;
    }
    return a - b; 
}

int Int_times(int a, int b) { 
    if (a != 0 && b != 0) {
        if ((a > 0 && b > 0 && a > INT32_MAX / b) ||
            (a > 0 && b < 0 && b < INT32_MIN / a) ||
            (a < 0 && b > 0 && a < INT32_MIN / b) ||
            (a < 0 && b < 0 && -a > INT32_MAX / -b)) {
            fprintf(stderr, "Int_times: overflow\n");
            return 0;
        }
    }
    return a * b; 
}

int Int_divide(int a, int b) { 
    if (b == 0) {
        fprintf(stderr, "Int_divide: division by zero\n");
        return 0;
    }
    return a / b; 
}

int Int_negate(int a) { 
    if (a == INT32_MIN) {
        fprintf(stderr, "Int_negate: overflow\n");
        return INT32_MAX;
    }
    return -a; 
}

int Int_equals(int a, int b) { 
    return a == b; 
}

// ========== Bool 方法 ==========

int Bool_not(int b) { 
    return !b; 
}

int Bool_equals(int a, int b) { 
    return a == b; 
}