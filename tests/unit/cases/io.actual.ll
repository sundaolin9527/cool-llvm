; ModuleID = 'main_module'
source_filename = "main_module"

%struct.__cxxabiv1.__class_type_info = type { ptr, ptr }
%struct.__cxxabiv1.__si_class_type_info = type { ptr, ptr, ptr }
%class.Int = type { %class.Object.0, i32, [4 x i8] }
%class.Object.0 = type { ptr }
%class.Bool = type { %class.Object.0, i1, [7 x i8] }
%class.String = type { %class.Object.0, ptr, i32, [4 x i8], i32, [4 x i8] }
%class.IO.1 = type { %class.Object.0 }
%class.A = type { %class.Object.0, ptr }
%class.B = type { %class.A }
%class.C = type { %class.IO.1 }
%class.D = type { %class.C }
%class.Main = type { %class.IO.1 }

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
@_ZTS1A = linkonce_odr constant [3 x i8] c"1A\00", align 1
@_ZTI1A = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS1A, ptr @_ZTI6Object }, align 8
@_ZTV1A = linkonce_odr constant [6 x ptr] [ptr null, ptr @_ZTI1A, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @A.out_a], align 8
@_ZTS1B = linkonce_odr constant [3 x i8] c"1B\00", align 1
@_ZTI1B = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS1B, ptr @_ZTI1A }, align 8
@_ZTV1B = linkonce_odr constant [7 x ptr] [ptr null, ptr @_ZTI1B, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @A.out_a, ptr @B.out_b], align 8
@_ZTS1C = linkonce_odr constant [3 x i8] c"1C\00", align 1
@_ZTI1C = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS1C, ptr @_ZTI2IO }, align 8
@_ZTV1C = linkonce_odr constant [10 x ptr] [ptr null, ptr @_ZTI1C, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @C.out_c], align 8
@_ZTS1D = linkonce_odr constant [3 x i8] c"1D\00", align 1
@_ZTI1D = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS1D, ptr @_ZTI1C }, align 8
@_ZTV1D = linkonce_odr constant [11 x ptr] [ptr null, ptr @_ZTI1D, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @C.out_c, ptr @D.out_d], align 8
@_ZTS4Main = linkonce_odr constant [6 x i8] c"4Main\00", align 1
@_ZTI4Main = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Main, ptr @_ZTI2IO }, align 8
@_ZTV4Main = linkonce_odr constant [10 x ptr] [ptr null, ptr @_ZTI4Main, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Main.main], align 8
@.str.6792986543956661697 = private constant [16 x i8] c"A: Hello world\0A\00"
@.str.13391334441058639802 = private constant [16 x i8] c"B: Hello world\0A\00"
@.str.8125625936084423033 = private constant [16 x i8] c"C: Hello world\0A\00"
@.str.4029530075265223755 = private constant [16 x i8] c"D: Hello world\0A\00"
@.str.661350339987742458 = private constant [7 x i8] c"Done.\0A\00"

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

define ptr @A.out_a(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %io.addr = getelementptr i8, ptr %self, i32 8
  %io = load ptr, ptr %io.addr, align 8
  %dispatch.isnull = icmp eq ptr %io, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %io, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %io, ptr @.str.6792986543956661697)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @B.out_b(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %io.addr = getelementptr i8, ptr %self, i32 8
  %io = load ptr, ptr %io.addr, align 8
  %dispatch.isnull = icmp eq ptr %io, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %io, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %io, ptr @.str.13391334441058639802)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @C.out_c(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.8125625936084423033)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @D.out_d(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.4029530075265223755)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @Main.main(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %A.newtmp = call ptr @A.new()
  %dispatch.isnull = icmp eq ptr %A.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %A.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %A.newtmp)
  %B.newtmp = call ptr @B.new()
  %dispatch.isnull3 = icmp eq ptr %B.newtmp, null
  br i1 %dispatch.isnull3, label %dispatch.abort2, label %dispatch.ok1

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok1:                                     ; preds = %dispatch.ok
  %vtable.ptr4 = load ptr, ptr %B.newtmp, align 8
  %method.ptr.addr5 = getelementptr ptr, ptr %vtable.ptr4, i64 6
  %method.ptr6 = load ptr, ptr %method.ptr.addr5, align 8
  %dispatch.result7 = call ptr %method.ptr6(ptr %B.newtmp)
  %C.newtmp = call ptr @C.new()
  %dispatch.isnull10 = icmp eq ptr %C.newtmp, null
  br i1 %dispatch.isnull10, label %dispatch.abort9, label %dispatch.ok8

dispatch.abort2:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok8:                                     ; preds = %dispatch.ok1
  %vtable.ptr11 = load ptr, ptr %C.newtmp, align 8
  %method.ptr.addr12 = getelementptr ptr, ptr %vtable.ptr11, i64 9
  %method.ptr13 = load ptr, ptr %method.ptr.addr12, align 8
  %dispatch.result14 = call ptr %method.ptr13(ptr %C.newtmp)
  %D.newtmp = call ptr @D.new()
  %dispatch.isnull17 = icmp eq ptr %D.newtmp, null
  br i1 %dispatch.isnull17, label %dispatch.abort16, label %dispatch.ok15

dispatch.abort9:                                  ; preds = %dispatch.ok1
  call void @abort()
  unreachable

dispatch.ok15:                                    ; preds = %dispatch.ok8
  %vtable.ptr18 = load ptr, ptr %D.newtmp, align 8
  %method.ptr.addr19 = getelementptr ptr, ptr %vtable.ptr18, i64 10
  %method.ptr20 = load ptr, ptr %method.ptr.addr19, align 8
  %dispatch.result21 = call ptr %method.ptr20(ptr %D.newtmp)
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull24 = icmp eq ptr %self, null
  br i1 %dispatch.isnull24, label %dispatch.abort23, label %dispatch.ok22

dispatch.abort16:                                 ; preds = %dispatch.ok8
  call void @abort()
  unreachable

dispatch.ok22:                                    ; preds = %dispatch.ok15
  %vtable.ptr25 = load ptr, ptr %self, align 8
  %method.ptr.addr26 = getelementptr ptr, ptr %vtable.ptr25, i64 5
  %method.ptr27 = load ptr, ptr %method.ptr.addr26, align 8
  %dispatch.result28 = call ptr %method.ptr27(ptr %self, ptr @.str.661350339987742458)
  ret ptr %dispatch.result28

dispatch.abort23:                                 ; preds = %dispatch.ok15
  call void @abort()
  unreachable
}

define void @_ZN1AC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.A, ptr %this, i32 0, i32 0
  call void @_ZN6ObjectC2Ev(ptr %parent.subobject)
  store ptr @_ZTV1A, ptr %this, align 8
  %io.addr.byte = getelementptr i8, ptr %this, i64 8
  %IO.newtmp = call ptr @IO.new()
  store ptr %IO.newtmp, ptr %io.addr.byte, align 8
  ret void
}

define ptr @A.new() {
entry:
  %0 = call ptr @malloc(i64 16)
  call void @_ZN1AC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN1BC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.B, ptr %this, i32 0, i32 0
  call void @_ZN1AC2Ev(ptr %parent.subobject)
  store ptr @_ZTV1B, ptr %this, align 8
  ret void
}

define ptr @B.new() {
entry:
  %0 = call ptr @malloc(i64 16)
  call void @_ZN1BC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN1CC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.C, ptr %this, i32 0, i32 0
  call void @_ZN2IOC2Ev(ptr %parent.subobject)
  store ptr @_ZTV1C, ptr %this, align 8
  ret void
}

define ptr @C.new() {
entry:
  %0 = call ptr @malloc(i64 8)
  call void @_ZN1CC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN1DC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.D, ptr %this, i32 0, i32 0
  call void @_ZN1CC2Ev(ptr %parent.subobject)
  store ptr @_ZTV1D, ptr %this, align 8
  ret void
}

define ptr @D.new() {
entry:
  %0 = call ptr @malloc(i64 8)
  call void @_ZN1DC2Ev(ptr %0)
  ret ptr %0
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

define i32 @main() {
entry:
  %main.obj = call ptr @Main.new()
  %0 = call ptr @Main.main(ptr %main.obj)
  ret i32 0
}

attributes #0 = { noreturn }
