; llvm 类定义
%String = type {
  i8*  ; 简化为一个指针，不考虑实际存储和长度等问题
}

%IO = type {
  void (%IO*, %String*)*
}

%Main = type {
  %String*,
  void (%Main*)*
}

@.hello = private unnamed_addr constant [13 x i8] c"Hello, LLVM!\00"


declare i32 @puts(i8*)
declare i8* @malloc(i64)
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1)

; T* copy(T* orig)
define i8* @copy(i8* %orig, i64 %size) {
entry:
    ; 1. 在堆上分配内存
    %raw_ptr = call i8* @malloc(i64 %size)

    ; 2. memcpy 原内存到新内存
    call void @llvm.memcpy.p0i8.p0i8.i64(
        i8* %raw_ptr,
        i8* %orig,
        i64 %size,
        i32 8,    ; 对齐
        i1 false  ; 非volatile
    )

    ret i8* %raw_ptr
}


; IO.out_string
define void @IO_out_string(%IO* %this, %String* %s) {
entry:
  %addr_gep = getelementptr %String, %String* %s, i32 0, i32 0
  %addr = load i8*, i8** %addr_gep
  call i32 @puts(i8* %addr)
  ret void
}


; Main.main
; alloca分配的地方在栈(llvm的栈似乎不会相互覆盖)中，实际应该有一个对象堆分配的过程，有相应的init方法
; 拷贝string成员变量到新的变量中(这里拷贝到堆中，拷贝的是string地址)，创建IO类打印这个新的string变量

define void @Main_main(%Main* %this) {
entry:
  ; this->str
  %str_gep = getelementptr %Main, %Main* %this, i32 0, i32 0
  %str = load %String*, %String** %str_gep
  
  ; 简单处理，先直接设置size
  %str_size_ptr = alloca i64
  store i64 8, i64* %str_size_ptr
  %str_size = load i64, i64* %str_size_ptr

  %str_i8 = bitcast %String* %str to i8*
  %new_str_i8 = call i8* @copy(i8* %str_i8, i64 %str_size)
  %new_str = bitcast i8* %new_str_i8 to %String*

  ; 构造 IO 对象 
  %io = alloca %IO
  %io_method_gep = getelementptr %IO, %IO* %io, i32 0, i32 0
  store void (%IO*, %String*)* @IO_out_string,
        void (%IO*, %String*)** %io_method_gep

  ; 调用 io.out_string(new_str)
  %method = load void (%IO*, %String*)*,
                 void (%IO*, %String*)** %io_method_gep
  call void %method(%IO* %io, %String* %new_str)

  ret void
}


; 程序入口 @main

define i32 @main() {
entry:
  ; 构造 String
  %str = alloca %String
  %addr_gep = getelementptr %String, %String* %str, i32 0, i32 0
  %addr = getelementptr [14 x i8], [14 x i8]* @.hello, i32 0, i32 0
  store i8* %addr, i8** %addr_gep

  ; 构造 Main
  %mainobj = alloca %Main
  %main_str_gep = getelementptr %Main, %Main* %mainobj, i32 0, i32 0
  store %String* %str, %String** %main_str_gep

  %main_method_gep = getelementptr %Main, %Main* %mainobj, i32 0, i32 1
  store void (%Main*)* @Main_main,
        void (%Main*)** %main_method_gep

  ; 调用 Main.main()
  %main_method = load void (%Main*)*,
                      void (%Main*)** %main_method_gep
  call void %main_method(%Main* %mainobj)

  ret i32 0
}