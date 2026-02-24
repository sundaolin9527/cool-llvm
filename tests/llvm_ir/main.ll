; main.ll - 调用自定义C函数
declare void @my_print(i8*)
declare i32 @my_add(i32, i32)
declare void @say_hello()
declare i32 @printf(i8*, ...)

; 字符串常量
@.str_hello = private unnamed_addr constant [14 x i8] c"Hello World!\0A\00", align 1
@.str_custom = private unnamed_addr constant [20 x i8] c"Calling C functions\00", align 1
@.str_result = private unnamed_addr constant [16 x i8] c"my_add result: \00", align 1
@.str_int_fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() {
entry:
    ; 1. 调用say_hello函数
    call void @say_hello()
    
    ; 2. 调用my_print函数
    call void @my_print(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str_custom, i32 0, i32 0))
    
    ; 3. 调用my_add函数
    %add_result = call i32 @my_add(i32 10, i32 20)
    
    ; 打印结果
    %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str_result, i32 0, i32 0))
    %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_int_fmt, i32 0, i32 0), i32 %add_result)
    
    ; 4. 也可以直接使用原来的printf
    %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str_hello, i32 0, i32 0))
    
    ret i32 0
}