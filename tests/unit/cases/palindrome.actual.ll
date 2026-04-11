; ModuleID = 'main_module'
source_filename = "main_module"

%struct.__cxxabiv1.__class_type_info = type { ptr, ptr }
%struct.__cxxabiv1.__si_class_type_info = type { ptr, ptr, ptr }
%class.Int = type { %class.Object.0, i32, [4 x i8] }
%class.Object.0 = type { ptr }
%class.Bool = type { %class.Object.0, i1, [7 x i8] }
%class.String = type { %class.Object.0, ptr, i32, [4 x i8], i32, [4 x i8] }
%class.IO.1 = type { %class.Object.0 }
%class.Main = type { %class.IO.1, i32, [4 x i8] }

@_ZTS6Object = linkonce_odr constant [8 x i8] c"6Object\00", align 1
@_ZTVN10__cxxabiv117__class_type_infoE = external global [0 x ptr]
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global [0 x ptr]
@_ZTI6Object = linkonce_odr constant %struct.__cxxabiv1.__class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv117__class_type_infoE, i64 2), ptr @_ZTS6Object }, align 8
@_ZTV6Object = linkonce_odr constant [5 x ptr] [ptr null, ptr @_ZTI6Object, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name], align 8
@_ZTS3Int = linkonce_odr constant [5 x i8] c"3Int\00", align 1
@_ZTI3Int = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS3Int, ptr @_ZTI6Object }, align 8
@_ZTV3Int = linkonce_odr constant [11 x ptr] [ptr null, ptr @_ZTI3Int, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @Int_plus, ptr @Int_minus, ptr @Int_times, ptr @Int_divide, ptr @Int_negate, ptr @Int_equals], align 8
@_ZTS4Bool = linkonce_odr constant [6 x i8] c"4Bool\00", align 1
@_ZTI4Bool = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Bool, ptr @_ZTI6Object }, align 8
@_ZTV4Bool = linkonce_odr constant [7 x ptr] [ptr null, ptr @_ZTI4Bool, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @Bool_equals, ptr @Bool_not], align 8
@_ZTS6String = linkonce_odr constant [8 x i8] c"6String\00", align 1
@_ZTI6String = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS6String, ptr @_ZTI6Object }, align 8
@_ZTV6String = linkonce_odr constant [9 x ptr] [ptr null, ptr @_ZTI6String, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @String_equals, ptr @String_length, ptr @String_concat, ptr @String_substr], align 8
@_ZTS2IO = linkonce_odr constant [4 x i8] c"2IO\00", align 1
@_ZTI2IO = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS2IO, ptr @_ZTI6Object }, align 8
@_ZTV2IO = linkonce_odr constant [9 x ptr] [ptr null, ptr @_ZTI2IO, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int], align 8
@.str.const.6142509188972423790 = private constant [1 x i8] zeroinitializer
@.str.const.1325321672193711394 = private constant [5 x i8] c"true\00"
@.str.const.3658472883277130625 = private constant [6 x i8] c"false\00"
@.str.const.9381151195890144283 = private constant [5 x i8] c"null\00"
@.str.const.12254516831566180933 = private constant [7 x i8] c"Object\00"
@.str.const.14452247746281694890 = private constant [4 x i8] c"Int\00"
@.str.const.17434171918012309744 = private constant [5 x i8] c"Bool\00"
@.str.const.7563291569981072216 = private constant [7 x i8] c"String\00"
@.str.const.266240694510032496 = private constant [3 x i8] c"IO\00"
@.str.const.3489273031569769463 = private constant [14 x i8] c"Out of memory\00"
@.str.const.16748462175569216771 = private constant [17 x i8] c"Division by zero\00"
@.str.const.13399772579239547281 = private constant [26 x i8] c"Array index out of bounds\00"
@.str.const.4438838613204664597 = private constant [23 x i8] c"Null pointer exception\00"
@.str.const.7615230403037060137 = private constant [17 x i8] c"Class cast error\00"
@.str.num.0 = private constant [2 x i8] c"0\00"
@.str.num.1 = private constant [2 x i8] c"1\00"
@.str.num.2 = private constant [2 x i8] c"2\00"
@.str.num.3 = private constant [2 x i8] c"3\00"
@.str.num.4 = private constant [2 x i8] c"4\00"
@.str.num.5 = private constant [2 x i8] c"5\00"
@.str.num.6 = private constant [2 x i8] c"6\00"
@.str.num.7 = private constant [2 x i8] c"7\00"
@.str.num.8 = private constant [2 x i8] c"8\00"
@.str.num.9 = private constant [2 x i8] c"9\00"
@_ZTS4Main = linkonce_odr constant [6 x i8] c"4Main\00", align 1
@_ZTI4Main = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Main, ptr @_ZTI2IO }, align 8
@_ZTV4Main = linkonce_odr constant [11 x ptr] [ptr null, ptr @_ZTI4Main, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Main.pal, ptr @Main.main], align 8
@.str.16846625561374102872 = private constant [16 x i8] c"enter a string\0A\00"
@.str.1774146344427751570 = private constant [5 x i8] c"abba\00"
@.str.11295806571542835866 = private constant [23 x i8] c"that was a palindrome\0A\00"
@.str.9235394277104043263 = private constant [27 x i8] c"that was not a palindrome\0A\00"

declare ptr @malloc(i64)

declare void @free(ptr)

declare ptr @memcpy(ptr, ptr, i64)

declare ptr @memset(ptr, i32, i64)

declare i32 @printf(ptr, ...)

declare i32 @puts(ptr)

declare ptr @gets(ptr)

declare i64 @strlen(ptr)

declare ptr @strcpy(ptr, ptr)

declare ptr @strncpy(ptr, ptr, i64)

declare i32 @strcmp(ptr, ptr)

declare i32 @strncmp(ptr, ptr, i64)

declare i32 @atoi(ptr)

declare void @exit(i32)

declare void @abort()

declare ptr @Object_copy(ptr)

; Function Attrs: noreturn
declare ptr @Object_abort(ptr) #0

declare ptr @Object_type_name(ptr)

declare ptr @IO_out_string(ptr, ptr)

declare ptr @IO_out_int(ptr, i32)

declare ptr @IO_in_string(ptr)

declare i32 @IO_in_int(ptr)

declare i32 @String_length(ptr)

declare ptr @String_concat(ptr, ptr)

declare ptr @String_substr(ptr, i32, i32)

declare i1 @String_equals(ptr, ptr)

declare i32 @Int_plus(i32, i32)

declare i32 @Int_minus(i32, i32)

declare i32 @Int_times(i32, i32)

declare i32 @Int_divide(i32, i32)

declare i32 @Int_negate(i32)

declare i1 @Int_equals(i32, i32)

declare i1 @Bool_not(i1)

declare i1 @Bool_equals(i1, i1)

declare i1 @isvoid(ptr)

declare ptr @new(i32)

declare void @Object_init(ptr)

define void @_ZN6ObjectC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr @_ZTV6Object, ptr %this, align 8
  ret void
}

define void @_ZN3IntC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Int, ptr %this, i32 0, i32 0
  call void @_ZN6ObjectC2Ev(ptr %parent.subobject)
  store ptr @_ZTV3Int, ptr %this, align 8
  %value.addr.byte = getelementptr i8, ptr %this, i64 8
  store i32 0, ptr %value.addr.byte, align 4
  ret void
}

define void @_ZN4BoolC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Bool, ptr %this, i32 0, i32 0
  call void @_ZN6ObjectC2Ev(ptr %parent.subobject)
  store ptr @_ZTV4Bool, ptr %this, align 8
  %value.addr.byte = getelementptr i8, ptr %this, i64 8
  store i1 false, ptr %value.addr.byte, align 1
  ret void
}

define void @_ZN6StringC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.String, ptr %this, i32 0, i32 0
  call void @_ZN6ObjectC2Ev(ptr %parent.subobject)
  store ptr @_ZTV6String, ptr %this, align 8
  %data.addr.byte = getelementptr i8, ptr %this, i64 8
  store ptr null, ptr %data.addr.byte, align 8
  %length.addr.byte = getelementptr i8, ptr %this, i64 16
  store i32 0, ptr %length.addr.byte, align 4
  %hash.addr.byte = getelementptr i8, ptr %this, i64 24
  store i32 0, ptr %hash.addr.byte, align 4
  ret void
}

define void @_ZN2IOC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.IO.1, ptr %this, i32 0, i32 0
  call void @_ZN6ObjectC2Ev(ptr %parent.subobject)
  store ptr @_ZTV2IO, ptr %this, align 8
  ret void
}

define ptr @Object.new() {
entry:
  %0 = call ptr @malloc(i64 8)
  call void @_ZN6ObjectC2Ev(ptr %0)
  ret ptr %0
}

define ptr @Int.new() {
entry:
  %0 = call ptr @malloc(i64 16)
  call void @_ZN3IntC2Ev(ptr %0)
  ret ptr %0
}

define ptr @Bool.new() {
entry:
  %0 = call ptr @malloc(i64 16)
  call void @_ZN4BoolC2Ev(ptr %0)
  ret ptr %0
}

define ptr @String.new() {
entry:
  %0 = call ptr @malloc(i64 32)
  call void @_ZN6StringC2Ev(ptr %0)
  ret ptr %0
}

define ptr @IO.new() {
entry:
  %0 = call ptr @malloc(i64 8)
  call void @_ZN2IOC2Ev(ptr %0)
  ret ptr %0
}

define i1 @Main.pal(ptr %this, ptr %s) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %s.addr = alloca ptr, align 8
  store ptr %s, ptr %s.addr, align 8
  %s1 = load ptr, ptr %s.addr, align 8
  %dispatch.isnull = icmp eq ptr %s1, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %dispatch.result = call i32 @String_length(ptr %s1)
  %eqtmp = icmp eq i32 %dispatch.result, 0
  br i1 %eqtmp, label %then, label %else

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

then:                                             ; preds = %dispatch.ok
  br label %ifcont45

else:                                             ; preds = %dispatch.ok
  %s2 = load ptr, ptr %s.addr, align 8
  %dispatch.isnull5 = icmp eq ptr %s2, null
  br i1 %dispatch.isnull5, label %dispatch.abort4, label %dispatch.ok3

dispatch.ok3:                                     ; preds = %else
  %dispatch.result6 = call i32 @String_length(ptr %s2)
  %eqtmp7 = icmp eq i32 %dispatch.result6, 1
  br i1 %eqtmp7, label %then8, label %else9

dispatch.abort4:                                  ; preds = %else
  call void @abort()
  unreachable

then8:                                            ; preds = %dispatch.ok3
  br label %ifcont43

else9:                                            ; preds = %dispatch.ok3
  %s10 = load ptr, ptr %s.addr, align 8
  %dispatch.isnull13 = icmp eq ptr %s10, null
  br i1 %dispatch.isnull13, label %dispatch.abort12, label %dispatch.ok11

dispatch.ok11:                                    ; preds = %else9
  %dispatch.result14 = call ptr @String_substr(ptr %s10, i32 0, i32 1)
  %s15 = load ptr, ptr %s.addr, align 8
  %dispatch.isnull18 = icmp eq ptr %s15, null
  br i1 %dispatch.isnull18, label %dispatch.abort17, label %dispatch.ok16

dispatch.abort12:                                 ; preds = %else9
  call void @abort()
  unreachable

dispatch.ok16:                                    ; preds = %dispatch.ok11
  %s19 = load ptr, ptr %s.addr, align 8
  %dispatch.isnull22 = icmp eq ptr %s19, null
  br i1 %dispatch.isnull22, label %dispatch.abort21, label %dispatch.ok20

dispatch.abort17:                                 ; preds = %dispatch.ok11
  call void @abort()
  unreachable

dispatch.ok20:                                    ; preds = %dispatch.ok16
  %dispatch.result23 = call i32 @String_length(ptr %s19)
  %subtmp = sub i32 %dispatch.result23, 1
  %dispatch.result24 = call ptr @String_substr(ptr %s15, i32 %subtmp, i32 1)
  %eqtmp25 = call i1 @String_equals(ptr %dispatch.result14, ptr %dispatch.result24)
  br i1 %eqtmp25, label %then26, label %else42

dispatch.abort21:                                 ; preds = %dispatch.ok16
  call void @abort()
  unreachable

then26:                                           ; preds = %dispatch.ok20
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull29 = icmp eq ptr %self, null
  br i1 %dispatch.isnull29, label %dispatch.abort28, label %dispatch.ok27

dispatch.ok27:                                    ; preds = %then26
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 9
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %s30 = load ptr, ptr %s.addr, align 8
  %dispatch.isnull33 = icmp eq ptr %s30, null
  br i1 %dispatch.isnull33, label %dispatch.abort32, label %dispatch.ok31

dispatch.abort28:                                 ; preds = %then26
  call void @abort()
  unreachable

dispatch.ok31:                                    ; preds = %dispatch.ok27
  %s34 = load ptr, ptr %s.addr, align 8
  %dispatch.isnull37 = icmp eq ptr %s34, null
  br i1 %dispatch.isnull37, label %dispatch.abort36, label %dispatch.ok35

dispatch.abort32:                                 ; preds = %dispatch.ok27
  call void @abort()
  unreachable

dispatch.ok35:                                    ; preds = %dispatch.ok31
  %dispatch.result38 = call i32 @String_length(ptr %s34)
  %subtmp39 = sub i32 %dispatch.result38, 2
  %dispatch.result40 = call ptr @String_substr(ptr %s30, i32 1, i32 %subtmp39)
  %dispatch.result41 = call i1 %method.ptr(ptr %self, ptr %dispatch.result40)
  br label %ifcont

dispatch.abort36:                                 ; preds = %dispatch.ok31
  call void @abort()
  unreachable

else42:                                           ; preds = %dispatch.ok20
  br label %ifcont

ifcont:                                           ; preds = %else42, %dispatch.ok35
  %cond_result = phi i1 [ %dispatch.result41, %dispatch.ok35 ], [ false, %else42 ]
  br label %ifcont43

ifcont43:                                         ; preds = %ifcont, %then8
  %cond_result44 = phi i1 [ true, %then8 ], [ %cond_result, %ifcont ]
  br label %ifcont45

ifcont45:                                         ; preds = %ifcont43, %then
  %cond_result46 = phi i1 [ true, %then ], [ %cond_result44, %ifcont43 ]
  ret i1 %cond_result46
}

define ptr @Main.main(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %i.addr = getelementptr i8, ptr %self, i32 8
  store i32 -1, ptr %i.addr, align 4
  %self1 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self1, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self1, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self1, ptr @.str.16846625561374102872)
  %self2 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull5 = icmp eq ptr %self2, null
  br i1 %dispatch.isnull5, label %dispatch.abort4, label %dispatch.ok3

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok3:                                     ; preds = %dispatch.ok
  %vtable.ptr6 = load ptr, ptr %self2, align 8
  %method.ptr.addr7 = getelementptr ptr, ptr %vtable.ptr6, i64 9
  %method.ptr8 = load ptr, ptr %method.ptr.addr7, align 8
  %dispatch.result9 = call i1 %method.ptr8(ptr %self2, ptr @.str.1774146344427751570)
  br i1 %dispatch.result9, label %then, label %else

dispatch.abort4:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

then:                                             ; preds = %dispatch.ok3
  %self10 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull13 = icmp eq ptr %self10, null
  br i1 %dispatch.isnull13, label %dispatch.abort12, label %dispatch.ok11

dispatch.ok11:                                    ; preds = %then
  %vtable.ptr14 = load ptr, ptr %self10, align 8
  %method.ptr.addr15 = getelementptr ptr, ptr %vtable.ptr14, i64 5
  %method.ptr16 = load ptr, ptr %method.ptr.addr15, align 8
  %dispatch.result17 = call ptr %method.ptr16(ptr %self10, ptr @.str.11295806571542835866)
  br label %ifcont

dispatch.abort12:                                 ; preds = %then
  call void @abort()
  unreachable

else:                                             ; preds = %dispatch.ok3
  %self18 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull21 = icmp eq ptr %self18, null
  br i1 %dispatch.isnull21, label %dispatch.abort20, label %dispatch.ok19

dispatch.ok19:                                    ; preds = %else
  %vtable.ptr22 = load ptr, ptr %self18, align 8
  %method.ptr.addr23 = getelementptr ptr, ptr %vtable.ptr22, i64 5
  %method.ptr24 = load ptr, ptr %method.ptr.addr23, align 8
  %dispatch.result25 = call ptr %method.ptr24(ptr %self18, ptr @.str.9235394277104043263)
  br label %ifcont

dispatch.abort20:                                 ; preds = %else
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok19, %dispatch.ok11
  %cond_result = phi ptr [ %dispatch.result17, %dispatch.ok11 ], [ %dispatch.result25, %dispatch.ok19 ]
  ret ptr %cond_result
}

define void @_ZN4MainC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Main, ptr %this, i32 0, i32 0
  call void @_ZN2IOC2Ev(ptr %parent.subobject)
  store ptr @_ZTV4Main, ptr %this, align 8
  %i.addr.byte = getelementptr i8, ptr %this, i64 8
  store i32 0, ptr %i.addr.byte, align 4
  ret void
}

define ptr @Main.new() {
entry:
  %0 = call ptr @malloc(i64 16)
  call void @_ZN4MainC2Ev(ptr %0)
  ret ptr %0
}

define i32 @main() {
entry:
  %main.obj = call ptr @Main.new()
  %0 = call ptr @Main.main(ptr %main.obj)
  ret i32 0
}

attributes #0 = { noreturn }
