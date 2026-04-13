; ModuleID = 'main_module'
source_filename = "main_module"

%struct.__cxxabiv1.__class_type_info = type { ptr, ptr }
%struct.__cxxabiv1.__si_class_type_info = type { ptr, ptr, ptr }
%class.Int = type { %class.Object.0, i32, [4 x i8] }
%class.Object.0 = type { ptr }
%class.Bool = type { %class.Object.0, i1, [7 x i8] }
%class.String = type { %class.Object.0, ptr, i32, [4 x i8], i32, [4 x i8] }
%class.IO.1 = type { %class.Object.0 }
%class.IntList = type { %class.IO.1 }
%class.IntCons = type { %class.IntList, i32, [4 x i8], ptr }
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
@_ZTS7IntList = linkonce_odr constant [9 x i8] c"7IntList\00", align 1
@_ZTI7IntList = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS7IntList, ptr @_ZTI2IO }, align 8
@_ZTV7IntList = linkonce_odr constant [19 x ptr] [ptr null, ptr @_ZTI7IntList, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @IntList.isNil, ptr @IntList.head, ptr @IntList.tail, ptr @IntList.cons, ptr @IntList.append, ptr @IntList.filter_lt, ptr @IntList.filter_eq, ptr @IntList.filter_gt, ptr @IntList.qsort, ptr @IntList.print_inline], align 8
@_ZTS7IntCons = linkonce_odr constant [9 x i8] c"7IntCons\00", align 1
@_ZTI7IntCons = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS7IntCons, ptr @_ZTI7IntList }, align 8
@_ZTV7IntCons = linkonce_odr constant [20 x ptr] [ptr null, ptr @_ZTI7IntCons, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @IntCons.isNil, ptr @IntCons.head, ptr @IntCons.tail, ptr @IntList.cons, ptr @IntCons.append, ptr @IntCons.filter_lt, ptr @IntCons.filter_eq, ptr @IntCons.filter_gt, ptr @IntCons.qsort, ptr @IntCons.print_inline, ptr @IntCons.init], align 8
@_ZTS4Main = linkonce_odr constant [6 x i8] c"4Main\00", align 1
@_ZTI4Main = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Main, ptr @_ZTI2IO }, align 8
@_ZTV4Main = linkonce_odr constant [10 x ptr] [ptr null, ptr @_ZTI4Main, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Main.main], align 8
@.str.18400681194753865968 = private constant [2 x i8] c"\0A\00"
@.str.17934988915447438835 = private constant [2 x i8] c" \00"
@.str.11222914844256521876 = private constant [9 x i8] c"before: \00"
@.str.2148714939854022959 = private constant [8 x i8] c"after: \00"

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

define i1 @IntList.isNil(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  ret i1 true
}

define i32 @IntList.head(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 3
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %0 = call ptr %method.ptr(ptr %self)
  unreachable

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @IntList.tail(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 3
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %0 = call ptr %method.ptr(ptr %self)
  unreachable

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @IntList.cons(ptr %this, i32 %value) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %value.addr = alloca i32, align 4
  store i32 %value, ptr %value.addr, align 4
  %IntCons.newtmp = call ptr @IntCons.new()
  %dispatch.isnull = icmp eq ptr %IntCons.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %IntCons.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 19
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %value1 = load i32, ptr %value.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %IntCons.newtmp, i32 %value1, ptr %self)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @IntList.append(ptr %this, ptr %other) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %other.addr = alloca ptr, align 8
  store ptr %other, ptr %other.addr, align 8
  %other1 = load ptr, ptr %other.addr, align 8
  ret ptr %other1
}

define ptr @IntList.filter_lt(ptr %this, i32 %pivot) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %pivot.addr = alloca i32, align 4
  store i32 %pivot, ptr %pivot.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  ret ptr %self
}

define ptr @IntList.filter_eq(ptr %this, i32 %pivot) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %pivot.addr = alloca i32, align 4
  store i32 %pivot, ptr %pivot.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  ret ptr %self
}

define ptr @IntList.filter_gt(ptr %this, i32 %pivot) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %pivot.addr = alloca i32, align 4
  store i32 %pivot, ptr %pivot.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  ret ptr %self
}

define ptr @IntList.qsort(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  ret ptr %self
}

define ptr @IntList.print_inline(ptr %this) {
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
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.18400681194753865968)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define i1 @IntCons.isNil(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  ret i1 false
}

define ptr @IntCons.init(ptr %this, i32 %hd, ptr %tl) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %hd.addr = alloca i32, align 4
  store i32 %hd, ptr %hd.addr, align 4
  %tl.addr = alloca ptr, align 8
  store ptr %tl, ptr %tl.addr, align 8
  %hd1 = load i32, ptr %hd.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %xcar.addr = getelementptr i8, ptr %self, i32 8
  store i32 %hd1, ptr %xcar.addr, align 4
  %tl2 = load ptr, ptr %tl.addr, align 8
  %self3 = load ptr, ptr %this.addr, align 8
  %xcdr.addr = getelementptr i8, ptr %self3, i32 16
  store ptr %tl2, ptr %xcdr.addr, align 8
  %self4 = load ptr, ptr %this.addr, align 8
  ret ptr %self4
}

define i32 @IntCons.head(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %xcar.addr = getelementptr i8, ptr %self, i32 8
  %xcar = load i32, ptr %xcar.addr, align 4
  ret i32 %xcar
}

define ptr @IntCons.tail(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %xcdr.addr = getelementptr i8, ptr %self, i32 16
  %xcdr = load ptr, ptr %xcdr.addr, align 8
  ret ptr %xcdr
}

define ptr @IntCons.append(ptr %this, ptr %other) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %other.addr = alloca ptr, align 8
  store ptr %other, ptr %other.addr, align 8
  %IntCons.newtmp = call ptr @IntCons.new()
  %dispatch.isnull = icmp eq ptr %IntCons.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %IntCons.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 19
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %xcar.addr = getelementptr i8, ptr %self, i32 8
  %xcar = load i32, ptr %xcar.addr, align 4
  %self1 = load ptr, ptr %this.addr, align 8
  %xcdr.addr = getelementptr i8, ptr %self1, i32 16
  %xcdr = load ptr, ptr %xcdr.addr, align 8
  %dispatch.isnull4 = icmp eq ptr %xcdr, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %xcdr, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 13
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %other8 = load ptr, ptr %other.addr, align 8
  %dispatch.result = call ptr %method.ptr7(ptr %xcdr, ptr %other8)
  %dispatch.result9 = call ptr %method.ptr(ptr %IntCons.newtmp, i32 %xcar, ptr %dispatch.result)
  ret ptr %dispatch.result9

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable
}

define ptr @IntCons.filter_lt(ptr %this, i32 %pivot) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %pivot.addr = alloca i32, align 4
  store i32 %pivot, ptr %pivot.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %xcar.addr = getelementptr i8, ptr %self, i32 8
  %xcar = load i32, ptr %xcar.addr, align 4
  %pivot1 = load i32, ptr %pivot.addr, align 4
  %cmptmp = icmp slt i32 %xcar, %pivot1
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  %IntCons.newtmp = call ptr @IntCons.new()
  %dispatch.isnull = icmp eq ptr %IntCons.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %then
  %vtable.ptr = load ptr, ptr %IntCons.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 19
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %self2 = load ptr, ptr %this.addr, align 8
  %xcar.addr3 = getelementptr i8, ptr %self2, i32 8
  %xcar4 = load i32, ptr %xcar.addr3, align 4
  %self5 = load ptr, ptr %this.addr, align 8
  %xcdr.addr = getelementptr i8, ptr %self5, i32 16
  %xcdr = load ptr, ptr %xcdr.addr, align 8
  %dispatch.isnull8 = icmp eq ptr %xcdr, null
  br i1 %dispatch.isnull8, label %dispatch.abort7, label %dispatch.ok6

dispatch.abort:                                   ; preds = %then
  call void @abort()
  unreachable

dispatch.ok6:                                     ; preds = %dispatch.ok
  %vtable.ptr9 = load ptr, ptr %xcdr, align 8
  %method.ptr.addr10 = getelementptr ptr, ptr %vtable.ptr9, i64 14
  %method.ptr11 = load ptr, ptr %method.ptr.addr10, align 8
  %pivot12 = load i32, ptr %pivot.addr, align 4
  %dispatch.result = call ptr %method.ptr11(ptr %xcdr, i32 %pivot12)
  %dispatch.result13 = call ptr %method.ptr(ptr %IntCons.newtmp, i32 %xcar4, ptr %dispatch.result)
  br label %ifcont

dispatch.abort7:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

else:                                             ; preds = %entry
  %self14 = load ptr, ptr %this.addr, align 8
  %xcdr.addr15 = getelementptr i8, ptr %self14, i32 16
  %xcdr16 = load ptr, ptr %xcdr.addr15, align 8
  %dispatch.isnull19 = icmp eq ptr %xcdr16, null
  br i1 %dispatch.isnull19, label %dispatch.abort18, label %dispatch.ok17

dispatch.ok17:                                    ; preds = %else
  %vtable.ptr20 = load ptr, ptr %xcdr16, align 8
  %method.ptr.addr21 = getelementptr ptr, ptr %vtable.ptr20, i64 14
  %method.ptr22 = load ptr, ptr %method.ptr.addr21, align 8
  %pivot23 = load i32, ptr %pivot.addr, align 4
  %dispatch.result24 = call ptr %method.ptr22(ptr %xcdr16, i32 %pivot23)
  br label %ifcont

dispatch.abort18:                                 ; preds = %else
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok17, %dispatch.ok6
  %cond_result = phi ptr [ %dispatch.result13, %dispatch.ok6 ], [ %dispatch.result24, %dispatch.ok17 ]
  ret ptr %cond_result
}

define ptr @IntCons.filter_eq(ptr %this, i32 %pivot) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %pivot.addr = alloca i32, align 4
  store i32 %pivot, ptr %pivot.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %xcar.addr = getelementptr i8, ptr %self, i32 8
  %xcar = load i32, ptr %xcar.addr, align 4
  %pivot1 = load i32, ptr %pivot.addr, align 4
  %eqtmp = icmp eq i32 %xcar, %pivot1
  br i1 %eqtmp, label %then, label %else

then:                                             ; preds = %entry
  %IntCons.newtmp = call ptr @IntCons.new()
  %dispatch.isnull = icmp eq ptr %IntCons.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %then
  %vtable.ptr = load ptr, ptr %IntCons.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 19
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %self2 = load ptr, ptr %this.addr, align 8
  %xcar.addr3 = getelementptr i8, ptr %self2, i32 8
  %xcar4 = load i32, ptr %xcar.addr3, align 4
  %self5 = load ptr, ptr %this.addr, align 8
  %xcdr.addr = getelementptr i8, ptr %self5, i32 16
  %xcdr = load ptr, ptr %xcdr.addr, align 8
  %dispatch.isnull8 = icmp eq ptr %xcdr, null
  br i1 %dispatch.isnull8, label %dispatch.abort7, label %dispatch.ok6

dispatch.abort:                                   ; preds = %then
  call void @abort()
  unreachable

dispatch.ok6:                                     ; preds = %dispatch.ok
  %vtable.ptr9 = load ptr, ptr %xcdr, align 8
  %method.ptr.addr10 = getelementptr ptr, ptr %vtable.ptr9, i64 15
  %method.ptr11 = load ptr, ptr %method.ptr.addr10, align 8
  %pivot12 = load i32, ptr %pivot.addr, align 4
  %dispatch.result = call ptr %method.ptr11(ptr %xcdr, i32 %pivot12)
  %dispatch.result13 = call ptr %method.ptr(ptr %IntCons.newtmp, i32 %xcar4, ptr %dispatch.result)
  br label %ifcont

dispatch.abort7:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

else:                                             ; preds = %entry
  %self14 = load ptr, ptr %this.addr, align 8
  %xcdr.addr15 = getelementptr i8, ptr %self14, i32 16
  %xcdr16 = load ptr, ptr %xcdr.addr15, align 8
  %dispatch.isnull19 = icmp eq ptr %xcdr16, null
  br i1 %dispatch.isnull19, label %dispatch.abort18, label %dispatch.ok17

dispatch.ok17:                                    ; preds = %else
  %vtable.ptr20 = load ptr, ptr %xcdr16, align 8
  %method.ptr.addr21 = getelementptr ptr, ptr %vtable.ptr20, i64 15
  %method.ptr22 = load ptr, ptr %method.ptr.addr21, align 8
  %pivot23 = load i32, ptr %pivot.addr, align 4
  %dispatch.result24 = call ptr %method.ptr22(ptr %xcdr16, i32 %pivot23)
  br label %ifcont

dispatch.abort18:                                 ; preds = %else
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok17, %dispatch.ok6
  %cond_result = phi ptr [ %dispatch.result13, %dispatch.ok6 ], [ %dispatch.result24, %dispatch.ok17 ]
  ret ptr %cond_result
}

define ptr @IntCons.filter_gt(ptr %this, i32 %pivot) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %pivot.addr = alloca i32, align 4
  store i32 %pivot, ptr %pivot.addr, align 4
  %pivot1 = load i32, ptr %pivot.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %xcar.addr = getelementptr i8, ptr %self, i32 8
  %xcar = load i32, ptr %xcar.addr, align 4
  %cmptmp = icmp slt i32 %pivot1, %xcar
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  %IntCons.newtmp = call ptr @IntCons.new()
  %dispatch.isnull = icmp eq ptr %IntCons.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %then
  %vtable.ptr = load ptr, ptr %IntCons.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 19
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %self2 = load ptr, ptr %this.addr, align 8
  %xcar.addr3 = getelementptr i8, ptr %self2, i32 8
  %xcar4 = load i32, ptr %xcar.addr3, align 4
  %self5 = load ptr, ptr %this.addr, align 8
  %xcdr.addr = getelementptr i8, ptr %self5, i32 16
  %xcdr = load ptr, ptr %xcdr.addr, align 8
  %dispatch.isnull8 = icmp eq ptr %xcdr, null
  br i1 %dispatch.isnull8, label %dispatch.abort7, label %dispatch.ok6

dispatch.abort:                                   ; preds = %then
  call void @abort()
  unreachable

dispatch.ok6:                                     ; preds = %dispatch.ok
  %vtable.ptr9 = load ptr, ptr %xcdr, align 8
  %method.ptr.addr10 = getelementptr ptr, ptr %vtable.ptr9, i64 16
  %method.ptr11 = load ptr, ptr %method.ptr.addr10, align 8
  %pivot12 = load i32, ptr %pivot.addr, align 4
  %dispatch.result = call ptr %method.ptr11(ptr %xcdr, i32 %pivot12)
  %dispatch.result13 = call ptr %method.ptr(ptr %IntCons.newtmp, i32 %xcar4, ptr %dispatch.result)
  br label %ifcont

dispatch.abort7:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

else:                                             ; preds = %entry
  %self14 = load ptr, ptr %this.addr, align 8
  %xcdr.addr15 = getelementptr i8, ptr %self14, i32 16
  %xcdr16 = load ptr, ptr %xcdr.addr15, align 8
  %dispatch.isnull19 = icmp eq ptr %xcdr16, null
  br i1 %dispatch.isnull19, label %dispatch.abort18, label %dispatch.ok17

dispatch.ok17:                                    ; preds = %else
  %vtable.ptr20 = load ptr, ptr %xcdr16, align 8
  %method.ptr.addr21 = getelementptr ptr, ptr %vtable.ptr20, i64 16
  %method.ptr22 = load ptr, ptr %method.ptr.addr21, align 8
  %pivot23 = load i32, ptr %pivot.addr, align 4
  %dispatch.result24 = call ptr %method.ptr22(ptr %xcdr16, i32 %pivot23)
  br label %ifcont

dispatch.abort18:                                 ; preds = %else
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok17, %dispatch.ok6
  %cond_result = phi ptr [ %dispatch.result13, %dispatch.ok6 ], [ %dispatch.result24, %dispatch.ok17 ]
  ret ptr %cond_result
}

define ptr @IntCons.qsort(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %pivot = alloca i32, align 4
  %self = load ptr, ptr %this.addr, align 8
  %xcar.addr = getelementptr i8, ptr %self, i32 8
  %xcar = load i32, ptr %xcar.addr, align 4
  store i32 %xcar, ptr %pivot, align 4
  %rest = alloca ptr, align 8
  %self1 = load ptr, ptr %this.addr, align 8
  %xcdr.addr = getelementptr i8, ptr %self1, i32 16
  %xcdr = load ptr, ptr %xcdr.addr, align 8
  store ptr %xcdr, ptr %rest, align 8
  %smaller = alloca ptr, align 8
  %rest2 = load ptr, ptr %rest, align 8
  %dispatch.isnull = icmp eq ptr %rest2, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %rest2, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 14
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %pivot3 = load i32, ptr %pivot, align 4
  %dispatch.result = call ptr %method.ptr(ptr %rest2, i32 %pivot3)
  %dispatch.isnull6 = icmp eq ptr %dispatch.result, null
  br i1 %dispatch.isnull6, label %dispatch.abort5, label %dispatch.ok4

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok4:                                     ; preds = %dispatch.ok
  %vtable.ptr7 = load ptr, ptr %dispatch.result, align 8
  %method.ptr.addr8 = getelementptr ptr, ptr %vtable.ptr7, i64 17
  %method.ptr9 = load ptr, ptr %method.ptr.addr8, align 8
  %dispatch.result10 = call ptr %method.ptr9(ptr %dispatch.result)
  store ptr %dispatch.result10, ptr %smaller, align 8
  %equal = alloca ptr, align 8
  %rest11 = load ptr, ptr %rest, align 8
  %dispatch.isnull14 = icmp eq ptr %rest11, null
  br i1 %dispatch.isnull14, label %dispatch.abort13, label %dispatch.ok12

dispatch.abort5:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok12:                                    ; preds = %dispatch.ok4
  %vtable.ptr15 = load ptr, ptr %rest11, align 8
  %method.ptr.addr16 = getelementptr ptr, ptr %vtable.ptr15, i64 15
  %method.ptr17 = load ptr, ptr %method.ptr.addr16, align 8
  %pivot18 = load i32, ptr %pivot, align 4
  %dispatch.result19 = call ptr %method.ptr17(ptr %rest11, i32 %pivot18)
  store ptr %dispatch.result19, ptr %equal, align 8
  %larger = alloca ptr, align 8
  %rest20 = load ptr, ptr %rest, align 8
  %dispatch.isnull23 = icmp eq ptr %rest20, null
  br i1 %dispatch.isnull23, label %dispatch.abort22, label %dispatch.ok21

dispatch.abort13:                                 ; preds = %dispatch.ok4
  call void @abort()
  unreachable

dispatch.ok21:                                    ; preds = %dispatch.ok12
  %vtable.ptr24 = load ptr, ptr %rest20, align 8
  %method.ptr.addr25 = getelementptr ptr, ptr %vtable.ptr24, i64 16
  %method.ptr26 = load ptr, ptr %method.ptr.addr25, align 8
  %pivot27 = load i32, ptr %pivot, align 4
  %dispatch.result28 = call ptr %method.ptr26(ptr %rest20, i32 %pivot27)
  %dispatch.isnull31 = icmp eq ptr %dispatch.result28, null
  br i1 %dispatch.isnull31, label %dispatch.abort30, label %dispatch.ok29

dispatch.abort22:                                 ; preds = %dispatch.ok12
  call void @abort()
  unreachable

dispatch.ok29:                                    ; preds = %dispatch.ok21
  %vtable.ptr32 = load ptr, ptr %dispatch.result28, align 8
  %method.ptr.addr33 = getelementptr ptr, ptr %vtable.ptr32, i64 17
  %method.ptr34 = load ptr, ptr %method.ptr.addr33, align 8
  %dispatch.result35 = call ptr %method.ptr34(ptr %dispatch.result28)
  store ptr %dispatch.result35, ptr %larger, align 8
  %smaller36 = load ptr, ptr %smaller, align 8
  %dispatch.isnull39 = icmp eq ptr %smaller36, null
  br i1 %dispatch.isnull39, label %dispatch.abort38, label %dispatch.ok37

dispatch.abort30:                                 ; preds = %dispatch.ok21
  call void @abort()
  unreachable

dispatch.ok37:                                    ; preds = %dispatch.ok29
  %vtable.ptr40 = load ptr, ptr %smaller36, align 8
  %method.ptr.addr41 = getelementptr ptr, ptr %vtable.ptr40, i64 13
  %method.ptr42 = load ptr, ptr %method.ptr.addr41, align 8
  %IntCons.newtmp = call ptr @IntCons.new()
  %dispatch.isnull45 = icmp eq ptr %IntCons.newtmp, null
  br i1 %dispatch.isnull45, label %dispatch.abort44, label %dispatch.ok43

dispatch.abort38:                                 ; preds = %dispatch.ok29
  call void @abort()
  unreachable

dispatch.ok43:                                    ; preds = %dispatch.ok37
  %vtable.ptr46 = load ptr, ptr %IntCons.newtmp, align 8
  %method.ptr.addr47 = getelementptr ptr, ptr %vtable.ptr46, i64 19
  %method.ptr48 = load ptr, ptr %method.ptr.addr47, align 8
  %pivot49 = load i32, ptr %pivot, align 4
  %equal50 = load ptr, ptr %equal, align 8
  %dispatch.result51 = call ptr %method.ptr48(ptr %IntCons.newtmp, i32 %pivot49, ptr %equal50)
  %dispatch.result52 = call ptr %method.ptr42(ptr %smaller36, ptr %dispatch.result51)
  %dispatch.isnull55 = icmp eq ptr %dispatch.result52, null
  br i1 %dispatch.isnull55, label %dispatch.abort54, label %dispatch.ok53

dispatch.abort44:                                 ; preds = %dispatch.ok37
  call void @abort()
  unreachable

dispatch.ok53:                                    ; preds = %dispatch.ok43
  %vtable.ptr56 = load ptr, ptr %dispatch.result52, align 8
  %method.ptr.addr57 = getelementptr ptr, ptr %vtable.ptr56, i64 13
  %method.ptr58 = load ptr, ptr %method.ptr.addr57, align 8
  %larger59 = load ptr, ptr %larger, align 8
  %dispatch.result60 = call ptr %method.ptr58(ptr %dispatch.result52, ptr %larger59)
  ret ptr %dispatch.result60

dispatch.abort54:                                 ; preds = %dispatch.ok43
  call void @abort()
  unreachable
}

define ptr @IntCons.print_inline(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 6
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %self1 = load ptr, ptr %this.addr, align 8
  %xcar.addr = getelementptr i8, ptr %self1, i32 8
  %xcar = load i32, ptr %xcar.addr, align 4
  %dispatch.result = call ptr %method.ptr(ptr %self, i32 %xcar)
  %self2 = load ptr, ptr %this.addr, align 8
  %xcdr.addr = getelementptr i8, ptr %self2, i32 16
  %xcdr = load ptr, ptr %xcdr.addr, align 8
  %dispatch.isnull5 = icmp eq ptr %xcdr, null
  br i1 %dispatch.isnull5, label %dispatch.abort4, label %dispatch.ok3

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok3:                                     ; preds = %dispatch.ok
  %vtable.ptr6 = load ptr, ptr %xcdr, align 8
  %method.ptr.addr7 = getelementptr ptr, ptr %vtable.ptr6, i64 9
  %method.ptr8 = load ptr, ptr %method.ptr.addr7, align 8
  %dispatch.result9 = call i1 %method.ptr8(ptr %xcdr)
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
  %dispatch.result17 = call ptr %method.ptr16(ptr %self10, ptr @.str.18400681194753865968)
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
  %dispatch.result25 = call ptr %method.ptr24(ptr %self18, ptr @.str.17934988915447438835)
  %self26 = load ptr, ptr %this.addr, align 8
  %xcdr.addr27 = getelementptr i8, ptr %self26, i32 16
  %xcdr28 = load ptr, ptr %xcdr.addr27, align 8
  %dispatch.isnull31 = icmp eq ptr %xcdr28, null
  br i1 %dispatch.isnull31, label %dispatch.abort30, label %dispatch.ok29

dispatch.abort20:                                 ; preds = %else
  call void @abort()
  unreachable

dispatch.ok29:                                    ; preds = %dispatch.ok19
  %vtable.ptr32 = load ptr, ptr %xcdr28, align 8
  %method.ptr.addr33 = getelementptr ptr, ptr %vtable.ptr32, i64 18
  %method.ptr34 = load ptr, ptr %method.ptr.addr33, align 8
  %dispatch.result35 = call ptr %method.ptr34(ptr %xcdr28)
  br label %ifcont

dispatch.abort30:                                 ; preds = %dispatch.ok19
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok29, %dispatch.ok11
  %cond_result = phi ptr [ %dispatch.result17, %dispatch.ok11 ], [ %dispatch.result35, %dispatch.ok29 ]
  ret ptr %cond_result
}

define ptr @Main.main(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %empty = alloca ptr, align 8
  %IntList.newtmp = call ptr @IntList.new()
  store ptr %IntList.newtmp, ptr %empty, align 8
  %n6 = alloca ptr, align 8
  %IntCons.newtmp = call ptr @IntCons.new()
  %dispatch.isnull = icmp eq ptr %IntCons.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %IntCons.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 19
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %empty1 = load ptr, ptr %empty, align 8
  %dispatch.result = call ptr %method.ptr(ptr %IntCons.newtmp, i32 6, ptr %empty1)
  store ptr %dispatch.result, ptr %n6, align 8
  %n4 = alloca ptr, align 8
  %IntCons.newtmp2 = call ptr @IntCons.new()
  %dispatch.isnull5 = icmp eq ptr %IntCons.newtmp2, null
  br i1 %dispatch.isnull5, label %dispatch.abort4, label %dispatch.ok3

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok3:                                     ; preds = %dispatch.ok
  %vtable.ptr6 = load ptr, ptr %IntCons.newtmp2, align 8
  %method.ptr.addr7 = getelementptr ptr, ptr %vtable.ptr6, i64 19
  %method.ptr8 = load ptr, ptr %method.ptr.addr7, align 8
  %n69 = load ptr, ptr %n6, align 8
  %dispatch.result10 = call ptr %method.ptr8(ptr %IntCons.newtmp2, i32 4, ptr %n69)
  store ptr %dispatch.result10, ptr %n4, align 8
  %n2 = alloca ptr, align 8
  %IntCons.newtmp11 = call ptr @IntCons.new()
  %dispatch.isnull14 = icmp eq ptr %IntCons.newtmp11, null
  br i1 %dispatch.isnull14, label %dispatch.abort13, label %dispatch.ok12

dispatch.abort4:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok12:                                    ; preds = %dispatch.ok3
  %vtable.ptr15 = load ptr, ptr %IntCons.newtmp11, align 8
  %method.ptr.addr16 = getelementptr ptr, ptr %vtable.ptr15, i64 19
  %method.ptr17 = load ptr, ptr %method.ptr.addr16, align 8
  %n418 = load ptr, ptr %n4, align 8
  %dispatch.result19 = call ptr %method.ptr17(ptr %IntCons.newtmp11, i32 2, ptr %n418)
  store ptr %dispatch.result19, ptr %n2, align 8
  %n3 = alloca ptr, align 8
  %IntCons.newtmp20 = call ptr @IntCons.new()
  %dispatch.isnull23 = icmp eq ptr %IntCons.newtmp20, null
  br i1 %dispatch.isnull23, label %dispatch.abort22, label %dispatch.ok21

dispatch.abort13:                                 ; preds = %dispatch.ok3
  call void @abort()
  unreachable

dispatch.ok21:                                    ; preds = %dispatch.ok12
  %vtable.ptr24 = load ptr, ptr %IntCons.newtmp20, align 8
  %method.ptr.addr25 = getelementptr ptr, ptr %vtable.ptr24, i64 19
  %method.ptr26 = load ptr, ptr %method.ptr.addr25, align 8
  %n227 = load ptr, ptr %n2, align 8
  %dispatch.result28 = call ptr %method.ptr26(ptr %IntCons.newtmp20, i32 3, ptr %n227)
  store ptr %dispatch.result28, ptr %n3, align 8
  %n5 = alloca ptr, align 8
  %IntCons.newtmp29 = call ptr @IntCons.new()
  %dispatch.isnull32 = icmp eq ptr %IntCons.newtmp29, null
  br i1 %dispatch.isnull32, label %dispatch.abort31, label %dispatch.ok30

dispatch.abort22:                                 ; preds = %dispatch.ok12
  call void @abort()
  unreachable

dispatch.ok30:                                    ; preds = %dispatch.ok21
  %vtable.ptr33 = load ptr, ptr %IntCons.newtmp29, align 8
  %method.ptr.addr34 = getelementptr ptr, ptr %vtable.ptr33, i64 19
  %method.ptr35 = load ptr, ptr %method.ptr.addr34, align 8
  %n336 = load ptr, ptr %n3, align 8
  %dispatch.result37 = call ptr %method.ptr35(ptr %IntCons.newtmp29, i32 5, ptr %n336)
  store ptr %dispatch.result37, ptr %n5, align 8
  %n1 = alloca ptr, align 8
  %IntCons.newtmp38 = call ptr @IntCons.new()
  %dispatch.isnull41 = icmp eq ptr %IntCons.newtmp38, null
  br i1 %dispatch.isnull41, label %dispatch.abort40, label %dispatch.ok39

dispatch.abort31:                                 ; preds = %dispatch.ok21
  call void @abort()
  unreachable

dispatch.ok39:                                    ; preds = %dispatch.ok30
  %vtable.ptr42 = load ptr, ptr %IntCons.newtmp38, align 8
  %method.ptr.addr43 = getelementptr ptr, ptr %vtable.ptr42, i64 19
  %method.ptr44 = load ptr, ptr %method.ptr.addr43, align 8
  %n545 = load ptr, ptr %n5, align 8
  %dispatch.result46 = call ptr %method.ptr44(ptr %IntCons.newtmp38, i32 1, ptr %n545)
  store ptr %dispatch.result46, ptr %n1, align 8
  %n9 = alloca ptr, align 8
  %IntCons.newtmp47 = call ptr @IntCons.new()
  %dispatch.isnull50 = icmp eq ptr %IntCons.newtmp47, null
  br i1 %dispatch.isnull50, label %dispatch.abort49, label %dispatch.ok48

dispatch.abort40:                                 ; preds = %dispatch.ok30
  call void @abort()
  unreachable

dispatch.ok48:                                    ; preds = %dispatch.ok39
  %vtable.ptr51 = load ptr, ptr %IntCons.newtmp47, align 8
  %method.ptr.addr52 = getelementptr ptr, ptr %vtable.ptr51, i64 19
  %method.ptr53 = load ptr, ptr %method.ptr.addr52, align 8
  %n154 = load ptr, ptr %n1, align 8
  %dispatch.result55 = call ptr %method.ptr53(ptr %IntCons.newtmp47, i32 9, ptr %n154)
  store ptr %dispatch.result55, ptr %n9, align 8
  %n8 = alloca ptr, align 8
  %IntCons.newtmp56 = call ptr @IntCons.new()
  %dispatch.isnull59 = icmp eq ptr %IntCons.newtmp56, null
  br i1 %dispatch.isnull59, label %dispatch.abort58, label %dispatch.ok57

dispatch.abort49:                                 ; preds = %dispatch.ok39
  call void @abort()
  unreachable

dispatch.ok57:                                    ; preds = %dispatch.ok48
  %vtable.ptr60 = load ptr, ptr %IntCons.newtmp56, align 8
  %method.ptr.addr61 = getelementptr ptr, ptr %vtable.ptr60, i64 19
  %method.ptr62 = load ptr, ptr %method.ptr.addr61, align 8
  %n963 = load ptr, ptr %n9, align 8
  %dispatch.result64 = call ptr %method.ptr62(ptr %IntCons.newtmp56, i32 8, ptr %n963)
  store ptr %dispatch.result64, ptr %n8, align 8
  %n7 = alloca ptr, align 8
  %IntCons.newtmp65 = call ptr @IntCons.new()
  %dispatch.isnull68 = icmp eq ptr %IntCons.newtmp65, null
  br i1 %dispatch.isnull68, label %dispatch.abort67, label %dispatch.ok66

dispatch.abort58:                                 ; preds = %dispatch.ok48
  call void @abort()
  unreachable

dispatch.ok66:                                    ; preds = %dispatch.ok57
  %vtable.ptr69 = load ptr, ptr %IntCons.newtmp65, align 8
  %method.ptr.addr70 = getelementptr ptr, ptr %vtable.ptr69, i64 19
  %method.ptr71 = load ptr, ptr %method.ptr.addr70, align 8
  %n872 = load ptr, ptr %n8, align 8
  %dispatch.result73 = call ptr %method.ptr71(ptr %IntCons.newtmp65, i32 7, ptr %n872)
  store ptr %dispatch.result73, ptr %n7, align 8
  %values = alloca ptr, align 8
  %IntCons.newtmp74 = call ptr @IntCons.new()
  %dispatch.isnull77 = icmp eq ptr %IntCons.newtmp74, null
  br i1 %dispatch.isnull77, label %dispatch.abort76, label %dispatch.ok75

dispatch.abort67:                                 ; preds = %dispatch.ok57
  call void @abort()
  unreachable

dispatch.ok75:                                    ; preds = %dispatch.ok66
  %vtable.ptr78 = load ptr, ptr %IntCons.newtmp74, align 8
  %method.ptr.addr79 = getelementptr ptr, ptr %vtable.ptr78, i64 19
  %method.ptr80 = load ptr, ptr %method.ptr.addr79, align 8
  %n781 = load ptr, ptr %n7, align 8
  %dispatch.result82 = call ptr %method.ptr80(ptr %IntCons.newtmp74, i32 10, ptr %n781)
  store ptr %dispatch.result82, ptr %values, align 8
  %sorted = alloca ptr, align 8
  %values83 = load ptr, ptr %values, align 8
  %dispatch.isnull86 = icmp eq ptr %values83, null
  br i1 %dispatch.isnull86, label %dispatch.abort85, label %dispatch.ok84

dispatch.abort76:                                 ; preds = %dispatch.ok66
  call void @abort()
  unreachable

dispatch.ok84:                                    ; preds = %dispatch.ok75
  %vtable.ptr87 = load ptr, ptr %values83, align 8
  %method.ptr.addr88 = getelementptr ptr, ptr %vtable.ptr87, i64 17
  %method.ptr89 = load ptr, ptr %method.ptr.addr88, align 8
  %dispatch.result90 = call ptr %method.ptr89(ptr %values83)
  store ptr %dispatch.result90, ptr %sorted, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull93 = icmp eq ptr %self, null
  br i1 %dispatch.isnull93, label %dispatch.abort92, label %dispatch.ok91

dispatch.abort85:                                 ; preds = %dispatch.ok75
  call void @abort()
  unreachable

dispatch.ok91:                                    ; preds = %dispatch.ok84
  %vtable.ptr94 = load ptr, ptr %self, align 8
  %method.ptr.addr95 = getelementptr ptr, ptr %vtable.ptr94, i64 5
  %method.ptr96 = load ptr, ptr %method.ptr.addr95, align 8
  %dispatch.result97 = call ptr %method.ptr96(ptr %self, ptr @.str.11222914844256521876)
  %values98 = load ptr, ptr %values, align 8
  %dispatch.isnull101 = icmp eq ptr %values98, null
  br i1 %dispatch.isnull101, label %dispatch.abort100, label %dispatch.ok99

dispatch.abort92:                                 ; preds = %dispatch.ok84
  call void @abort()
  unreachable

dispatch.ok99:                                    ; preds = %dispatch.ok91
  %vtable.ptr102 = load ptr, ptr %values98, align 8
  %method.ptr.addr103 = getelementptr ptr, ptr %vtable.ptr102, i64 18
  %method.ptr104 = load ptr, ptr %method.ptr.addr103, align 8
  %dispatch.result105 = call ptr %method.ptr104(ptr %values98)
  %self106 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull109 = icmp eq ptr %self106, null
  br i1 %dispatch.isnull109, label %dispatch.abort108, label %dispatch.ok107

dispatch.abort100:                                ; preds = %dispatch.ok91
  call void @abort()
  unreachable

dispatch.ok107:                                   ; preds = %dispatch.ok99
  %vtable.ptr110 = load ptr, ptr %self106, align 8
  %method.ptr.addr111 = getelementptr ptr, ptr %vtable.ptr110, i64 5
  %method.ptr112 = load ptr, ptr %method.ptr.addr111, align 8
  %dispatch.result113 = call ptr %method.ptr112(ptr %self106, ptr @.str.2148714939854022959)
  %sorted114 = load ptr, ptr %sorted, align 8
  %dispatch.isnull117 = icmp eq ptr %sorted114, null
  br i1 %dispatch.isnull117, label %dispatch.abort116, label %dispatch.ok115

dispatch.abort108:                                ; preds = %dispatch.ok99
  call void @abort()
  unreachable

dispatch.ok115:                                   ; preds = %dispatch.ok107
  %vtable.ptr118 = load ptr, ptr %sorted114, align 8
  %method.ptr.addr119 = getelementptr ptr, ptr %vtable.ptr118, i64 18
  %method.ptr120 = load ptr, ptr %method.ptr.addr119, align 8
  %dispatch.result121 = call ptr %method.ptr120(ptr %sorted114)
  ret ptr %dispatch.result121

dispatch.abort116:                                ; preds = %dispatch.ok107
  call void @abort()
  unreachable
}

define void @_ZN7IntListC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.IntList, ptr %this, i32 0, i32 0
  call void @_ZN2IOC2Ev(ptr %parent.subobject)
  store ptr @_ZTV7IntList, ptr %this, align 8
  ret void
}

define ptr @IntList.new() {
entry:
  %0 = call ptr @malloc(i64 8)
  call void @_ZN7IntListC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN7IntConsC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.IntCons, ptr %this, i32 0, i32 0
  call void @_ZN7IntListC2Ev(ptr %parent.subobject)
  store ptr @_ZTV7IntCons, ptr %this, align 8
  %xcar.addr.byte = getelementptr i8, ptr %this, i64 8
  store i32 0, ptr %xcar.addr.byte, align 4
  %xcdr.addr.byte = getelementptr i8, ptr %this, i64 16
  store ptr null, ptr %xcdr.addr.byte, align 8
  ret void
}

define ptr @IntCons.new() {
entry:
  %0 = call ptr @malloc(i64 24)
  call void @_ZN7IntConsC2Ev(ptr %0)
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
