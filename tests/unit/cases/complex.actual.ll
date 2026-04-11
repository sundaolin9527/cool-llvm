; ModuleID = 'main_module'
source_filename = "main_module"

%struct.__cxxabiv1.__class_type_info = type { ptr, ptr }
%struct.__cxxabiv1.__si_class_type_info = type { ptr, ptr, ptr }
%class.Int = type { %class.Object.0, i32, [4 x i8] }
%class.Object.0 = type { ptr }
%class.Bool = type { %class.Object.0, i1, [7 x i8] }
%class.String = type { %class.Object.0, ptr, i32, [4 x i8], i32, [4 x i8] }
%class.IO.1 = type { %class.Object.0 }
%class.Main = type { %class.IO.1 }
%class.Complex = type { %class.IO.1, i32, [4 x i8], i32, [4 x i8] }

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
@_ZTV4Main = linkonce_odr constant [10 x ptr] [ptr null, ptr @_ZTI4Main, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Main.main], align 8
@_ZTS7Complex = linkonce_odr constant [9 x i8] c"7Complex\00", align 1
@_ZTI7Complex = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS7Complex, ptr @_ZTI2IO }, align 8
@_ZTV7Complex = linkonce_odr constant [14 x ptr] [ptr null, ptr @_ZTI7Complex, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Complex.init, ptr @Complex.print, ptr @Complex.reflect_0, ptr @Complex.reflect_X, ptr @Complex.reflect_Y], align 8
@.str.18088364639186711304 = private constant [4 x i8] c"=)\0A\00"
@.str.15701132810540416685 = private constant [4 x i8] c"=(\0A\00"
@.str.1370730858159036685 = private constant [2 x i8] c"+\00"
@.str.14777839075779364226 = private constant [2 x i8] c"I\00"

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

define ptr @Main.main(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %c = alloca ptr, align 8
  %Complex.newtmp = call ptr @Complex.new()
  %dispatch.isnull = icmp eq ptr %Complex.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %Complex.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 9
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %Complex.newtmp, i32 1, i32 1)
  store ptr %dispatch.result, ptr %c, align 8
  %c1 = load ptr, ptr %c, align 8
  %dispatch.isnull4 = icmp eq ptr %c1, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %c1, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 12
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %dispatch.result8 = call ptr %method.ptr7(ptr %c1)
  %dispatch.isnull11 = icmp eq ptr %dispatch.result8, null
  br i1 %dispatch.isnull11, label %dispatch.abort10, label %dispatch.ok9

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok9:                                     ; preds = %dispatch.ok2
  %vtable.ptr12 = load ptr, ptr %dispatch.result8, align 8
  %method.ptr.addr13 = getelementptr ptr, ptr %vtable.ptr12, i64 13
  %method.ptr14 = load ptr, ptr %method.ptr.addr13, align 8
  %dispatch.result15 = call ptr %method.ptr14(ptr %dispatch.result8)
  %c16 = load ptr, ptr %c, align 8
  %dispatch.isnull19 = icmp eq ptr %c16, null
  br i1 %dispatch.isnull19, label %dispatch.abort18, label %dispatch.ok17

dispatch.abort10:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable

dispatch.ok17:                                    ; preds = %dispatch.ok9
  %vtable.ptr20 = load ptr, ptr %c16, align 8
  %method.ptr.addr21 = getelementptr ptr, ptr %vtable.ptr20, i64 11
  %method.ptr22 = load ptr, ptr %method.ptr.addr21, align 8
  %dispatch.result23 = call ptr %method.ptr22(ptr %c16)
  %eqtmp = icmp eq ptr %dispatch.result15, %dispatch.result23
  br i1 %eqtmp, label %then, label %else

dispatch.abort18:                                 ; preds = %dispatch.ok9
  call void @abort()
  unreachable

then:                                             ; preds = %dispatch.ok17
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull26 = icmp eq ptr %self, null
  br i1 %dispatch.isnull26, label %dispatch.abort25, label %dispatch.ok24

dispatch.ok24:                                    ; preds = %then
  %vtable.ptr27 = load ptr, ptr %self, align 8
  %method.ptr.addr28 = getelementptr ptr, ptr %vtable.ptr27, i64 5
  %method.ptr29 = load ptr, ptr %method.ptr.addr28, align 8
  %dispatch.result30 = call ptr %method.ptr29(ptr %self, ptr @.str.18088364639186711304)
  br label %ifcont

dispatch.abort25:                                 ; preds = %then
  call void @abort()
  unreachable

else:                                             ; preds = %dispatch.ok17
  %self31 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull34 = icmp eq ptr %self31, null
  br i1 %dispatch.isnull34, label %dispatch.abort33, label %dispatch.ok32

dispatch.ok32:                                    ; preds = %else
  %vtable.ptr35 = load ptr, ptr %self31, align 8
  %method.ptr.addr36 = getelementptr ptr, ptr %vtable.ptr35, i64 5
  %method.ptr37 = load ptr, ptr %method.ptr.addr36, align 8
  %dispatch.result38 = call ptr %method.ptr37(ptr %self31, ptr @.str.15701132810540416685)
  br label %ifcont

dispatch.abort33:                                 ; preds = %else
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok32, %dispatch.ok24
  %cond_result = phi ptr [ %dispatch.result30, %dispatch.ok24 ], [ %dispatch.result38, %dispatch.ok32 ]
  ret ptr %cond_result
}

define ptr @Complex.init(ptr %this, i32 %a, i32 %b) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %a.addr = alloca i32, align 4
  store i32 %a, ptr %a.addr, align 4
  %b.addr = alloca i32, align 4
  store i32 %b, ptr %b.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %x.addr = getelementptr i8, ptr %self, i32 8
  %x = load i32, ptr %x.addr, align 4
  %a1 = load i32, ptr %a.addr, align 4
  %eqtmp = icmp eq i32 %x, %a1
  %self2 = load ptr, ptr %this.addr, align 8
  %y.addr = getelementptr i8, ptr %self2, i32 16
  %y = load i32, ptr %y.addr, align 4
  %b3 = load i32, ptr %b.addr, align 4
  %eqtmp4 = icmp eq i32 %y, %b3
  %self5 = load ptr, ptr %this.addr, align 8
  ret ptr %self5
}

define ptr @Complex.print(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %y.addr = getelementptr i8, ptr %self, i32 16
  %y = load i32, ptr %y.addr, align 4
  %eqtmp = icmp eq i32 %y, 0
  br i1 %eqtmp, label %then, label %else

then:                                             ; preds = %entry
  %self1 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self1, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %then
  %vtable.ptr = load ptr, ptr %self1, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 6
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %self2 = load ptr, ptr %this.addr, align 8
  %x.addr = getelementptr i8, ptr %self2, i32 8
  %x = load i32, ptr %x.addr, align 4
  %dispatch.result = call ptr %method.ptr(ptr %self1, i32 %x)
  br label %ifcont

dispatch.abort:                                   ; preds = %then
  call void @abort()
  unreachable

else:                                             ; preds = %entry
  %self3 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull6 = icmp eq ptr %self3, null
  br i1 %dispatch.isnull6, label %dispatch.abort5, label %dispatch.ok4

dispatch.ok4:                                     ; preds = %else
  %vtable.ptr7 = load ptr, ptr %self3, align 8
  %method.ptr.addr8 = getelementptr ptr, ptr %vtable.ptr7, i64 6
  %method.ptr9 = load ptr, ptr %method.ptr.addr8, align 8
  %self10 = load ptr, ptr %this.addr, align 8
  %x.addr11 = getelementptr i8, ptr %self10, i32 8
  %x12 = load i32, ptr %x.addr11, align 4
  %dispatch.result13 = call ptr %method.ptr9(ptr %self3, i32 %x12)
  %dispatch.isnull16 = icmp eq ptr %dispatch.result13, null
  br i1 %dispatch.isnull16, label %dispatch.abort15, label %dispatch.ok14

dispatch.abort5:                                  ; preds = %else
  call void @abort()
  unreachable

dispatch.ok14:                                    ; preds = %dispatch.ok4
  %vtable.ptr17 = load ptr, ptr %dispatch.result13, align 8
  %method.ptr.addr18 = getelementptr ptr, ptr %vtable.ptr17, i64 5
  %method.ptr19 = load ptr, ptr %method.ptr.addr18, align 8
  %dispatch.result20 = call ptr %method.ptr19(ptr %dispatch.result13, ptr @.str.1370730858159036685)
  %dispatch.isnull23 = icmp eq ptr %dispatch.result20, null
  br i1 %dispatch.isnull23, label %dispatch.abort22, label %dispatch.ok21

dispatch.abort15:                                 ; preds = %dispatch.ok4
  call void @abort()
  unreachable

dispatch.ok21:                                    ; preds = %dispatch.ok14
  %vtable.ptr24 = load ptr, ptr %dispatch.result20, align 8
  %method.ptr.addr25 = getelementptr ptr, ptr %vtable.ptr24, i64 6
  %method.ptr26 = load ptr, ptr %method.ptr.addr25, align 8
  %self27 = load ptr, ptr %this.addr, align 8
  %y.addr28 = getelementptr i8, ptr %self27, i32 16
  %y29 = load i32, ptr %y.addr28, align 4
  %dispatch.result30 = call ptr %method.ptr26(ptr %dispatch.result20, i32 %y29)
  %dispatch.isnull33 = icmp eq ptr %dispatch.result30, null
  br i1 %dispatch.isnull33, label %dispatch.abort32, label %dispatch.ok31

dispatch.abort22:                                 ; preds = %dispatch.ok14
  call void @abort()
  unreachable

dispatch.ok31:                                    ; preds = %dispatch.ok21
  %vtable.ptr34 = load ptr, ptr %dispatch.result30, align 8
  %method.ptr.addr35 = getelementptr ptr, ptr %vtable.ptr34, i64 5
  %method.ptr36 = load ptr, ptr %method.ptr.addr35, align 8
  %dispatch.result37 = call ptr %method.ptr36(ptr %dispatch.result30, ptr @.str.14777839075779364226)
  br label %ifcont

dispatch.abort32:                                 ; preds = %dispatch.ok21
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok31, %dispatch.ok
  %cond_result = phi ptr [ %dispatch.result, %dispatch.ok ], [ %dispatch.result37, %dispatch.ok31 ]
  ret ptr %cond_result
}

define ptr @Complex.reflect_0(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %x.addr = getelementptr i8, ptr %self, i32 8
  %x = load i32, ptr %x.addr, align 4
  %self1 = load ptr, ptr %this.addr, align 8
  %x.addr2 = getelementptr i8, ptr %self1, i32 8
  %x3 = load i32, ptr %x.addr2, align 4
  %negtmp = sub i32 0, %x3
  %eqtmp = icmp eq i32 %x, %negtmp
  %self4 = load ptr, ptr %this.addr, align 8
  %y.addr = getelementptr i8, ptr %self4, i32 16
  %y = load i32, ptr %y.addr, align 4
  %self5 = load ptr, ptr %this.addr, align 8
  %y.addr6 = getelementptr i8, ptr %self5, i32 16
  %y7 = load i32, ptr %y.addr6, align 4
  %negtmp8 = sub i32 0, %y7
  %eqtmp9 = icmp eq i32 %y, %negtmp8
  %self10 = load ptr, ptr %this.addr, align 8
  ret ptr %self10
}

define ptr @Complex.reflect_X(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %y.addr = getelementptr i8, ptr %self, i32 16
  %y = load i32, ptr %y.addr, align 4
  %self1 = load ptr, ptr %this.addr, align 8
  %y.addr2 = getelementptr i8, ptr %self1, i32 16
  %y3 = load i32, ptr %y.addr2, align 4
  %negtmp = sub i32 0, %y3
  %eqtmp = icmp eq i32 %y, %negtmp
  %self4 = load ptr, ptr %this.addr, align 8
  ret ptr %self4
}

define ptr @Complex.reflect_Y(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %x.addr = getelementptr i8, ptr %self, i32 8
  %x = load i32, ptr %x.addr, align 4
  %self1 = load ptr, ptr %this.addr, align 8
  %x.addr2 = getelementptr i8, ptr %self1, i32 8
  %x3 = load i32, ptr %x.addr2, align 4
  %negtmp = sub i32 0, %x3
  %eqtmp = icmp eq i32 %x, %negtmp
  %self4 = load ptr, ptr %this.addr, align 8
  ret ptr %self4
}

define void @_ZN4MainC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Main, ptr %this, i32 0, i32 0
  call void @_ZN2IOC2Ev(ptr %parent.subobject)
  store ptr @_ZTV4Main, ptr %this, align 8
  ret void
}

define ptr @Main.new() {
entry:
  %0 = call ptr @malloc(i64 8)
  call void @_ZN4MainC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN7ComplexC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Complex, ptr %this, i32 0, i32 0
  call void @_ZN2IOC2Ev(ptr %parent.subobject)
  store ptr @_ZTV7Complex, ptr %this, align 8
  %x.addr.byte = getelementptr i8, ptr %this, i64 8
  store i32 0, ptr %x.addr.byte, align 4
  %y.addr.byte = getelementptr i8, ptr %this, i64 16
  store i32 0, ptr %y.addr.byte, align 4
  ret void
}

define ptr @Complex.new() {
entry:
  %0 = call ptr @malloc(i64 24)
  call void @_ZN7ComplexC2Ev(ptr %0)
  ret ptr %0
}

define i32 @main() {
entry:
  %main.obj = call ptr @Main.new()
  %0 = call ptr @Main.main(ptr %main.obj)
  ret i32 0
}

attributes #0 = { noreturn }
