#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include "runtime.h"

// ========== 虚函数表声明（这些在IR中已定义，这里只是声明）==========
extern void* _ZTV6Object[];   // Object虚表
extern void* _ZTV3Int[];      // Int虚表
extern void* _ZTV4Bool[];     // Bool虚表
extern void* _ZTV6String[];   // String虚表
extern void* _ZTV2IO[];       // IO虚表

// ========== 辅助函数 ==========

typedef struct CoolStringRegistryNode {
    const void* object_ptr;
    struct CoolStringRegistryNode* next;
} CoolStringRegistryNode;

static CoolStringRegistryNode* g_cool_string_registry = NULL;

static void register_cool_string_object(const void* object_ptr) {
    CoolStringRegistryNode* node = (CoolStringRegistryNode*)malloc(sizeof(CoolStringRegistryNode));
    if (!node) {
        return;
    }
    node->object_ptr = object_ptr;
    node->next = g_cool_string_registry;
    g_cool_string_registry = node;
}

static CoolString* create_cool_string(const char* src) {
    if (!src) src = "";
    
    CoolString* str = (CoolString*)malloc(sizeof(CoolString));
    if (!str) return NULL;
    
    str->parent.vtable = _ZTV6String;
    str->length = strlen(src);
    str->_padding0 = 0;
    str->capacity = str->length + 1;
    str->_padding1 = 0;
    str->data = (char*)malloc(str->capacity);

    if (str->data) {
        strcpy(str->data, src);
        register_cool_string_object(str);
    } else {
        free(str);
        return NULL;
    }
    
    return str;
}

static int is_cool_string_object(const void* ptr) {
    if (!ptr) {
        return 0;
    }
    for (CoolStringRegistryNode* node = g_cool_string_registry; node != NULL; node = node->next) {
        if (node->object_ptr == ptr) {
            return 1;
        }
    }
    return 0;
}

static const char* cool_string_data(const void* ptr) {
    if (!ptr) {
        return "";
    }
    if (is_cool_string_object(ptr)) {
        const CoolString* str = (const CoolString*)ptr;
        return str->data ? str->data : "";
    }
    return (const char*)ptr;
}

static size_t cool_string_length(const void* ptr) {
    if (!ptr) {
        return 0;
    }
    if (is_cool_string_object(ptr)) {
        const CoolString* str = (const CoolString*)ptr;
        return (size_t)str->length;
    }
    return strlen((const char*)ptr);
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
    obj->_padding = 0;
    return obj;
}

static CoolBool* create_cool_bool(int8_t value) {
    CoolBool* obj = (CoolBool*)malloc(sizeof(CoolBool));
    if (!obj) return NULL;
    obj->parent.vtable = _ZTV4Bool;
    obj->value = value;
    memset(obj->_padding, 0, sizeof(obj->_padding));
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
    
    printf("%s", cool_string_data(str_ptr));
    
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
    return (int)cool_string_length(this_ptr);
}

void* String_concat(void* this_ptr, void* other_ptr) {
    if (!this_ptr || !other_ptr) {
        return create_cool_string("");
    }
    
    const char* s1 = cool_string_data(this_ptr);
    const char* s2 = cool_string_data(other_ptr);
    const int new_len = (int)(strlen(s1) + strlen(s2));
    char* new_data = (char*)malloc(new_len + 1);
    if (!new_data) return create_cool_string("");
    
    strcpy(new_data, s1);
    strcat(new_data, s2);
    
    CoolString* result = create_cool_string(new_data);
    free(new_data);
    
    return result;
}

void* String_substr(void* this_ptr, int start, int length) {
    if (!this_ptr) return create_cool_string("");
    
    const char* str = cool_string_data(this_ptr);
    const int source_len = (int)cool_string_length(this_ptr);
    
    // 边界检查
    if (start < 0) start = 0;
    if (start >= source_len) {
        return create_cool_string("");
    }
    if (length < 0) length = 0;
    if (start + length > source_len) {
        length = source_len - start;
    }
    if (length == 0) {
        return create_cool_string("");
    }
    
    char* substr = (char*)malloc(length + 1);
    if (!substr) return create_cool_string("");
    
    strncpy(substr, str + start, length);
    substr[length] = '\0';
    
    CoolString* result = create_cool_string(substr);
    free(substr);
    
    return result;
}

int String_equals(void* this_ptr, void* other_ptr) {
    if (this_ptr == other_ptr) return 1;
    if (!this_ptr || !other_ptr) return 0;

    const size_t lhs_len = cool_string_length(this_ptr);
    const size_t rhs_len = cool_string_length(other_ptr);
    if (lhs_len != rhs_len) return 0;

    return strcmp(cool_string_data(this_ptr), cool_string_data(other_ptr)) == 0;
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
