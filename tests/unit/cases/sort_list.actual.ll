; ModuleID = 'main_module'
source_filename = "main_module"

%struct.__cxxabiv1.__class_type_info = type { ptr, ptr }
%struct.__cxxabiv1.__si_class_type_info = type { ptr, ptr, ptr }
%class.Int = type { %class.Object.0, i32, [4 x i8] }
%class.Object.0 = type { ptr }
%class.Bool = type { %class.Object.0, i1, [7 x i8] }
%class.String = type { %class.Object.0, ptr, i32, [4 x i8], i32, [4 x i8] }
%class.IO.1 = type { %class.Object.0 }
%class.List = type { %class.IO.1 }
%class.Cons = type { %class.List, i32, [4 x i8], ptr }
%class.Nil = type { %class.List }
%class.Main = type { %class.IO.1, ptr }

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
@_ZTS4List = linkonce_odr constant [6 x i8] c"4List\00", align 1
@_ZTI4List = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4List, ptr @_ZTI2IO }, align 8
@_ZTV4List = linkonce_odr constant [18 x ptr] [ptr null, ptr @_ZTI4List, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @List.isNil, ptr @List.cons, ptr @List.car, ptr @List.cdr, ptr @List.rev, ptr @List.sort, ptr @List.insert, ptr @List.rcons, ptr @List.print_list], align 8
@_ZTS4Cons = linkonce_odr constant [6 x i8] c"4Cons\00", align 1
@_ZTI4Cons = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Cons, ptr @_ZTI4List }, align 8
@_ZTV4Cons = linkonce_odr constant [19 x ptr] [ptr null, ptr @_ZTI4Cons, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Cons.isNil, ptr @List.cons, ptr @Cons.car, ptr @Cons.cdr, ptr @Cons.rev, ptr @Cons.sort, ptr @Cons.insert, ptr @Cons.rcons, ptr @Cons.print_list, ptr @Cons.init], align 8
@_ZTS3Nil = linkonce_odr constant [5 x i8] c"3Nil\00", align 1
@_ZTI3Nil = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS3Nil, ptr @_ZTI4List }, align 8
@_ZTV3Nil = linkonce_odr constant [18 x ptr] [ptr null, ptr @_ZTI3Nil, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Nil.isNil, ptr @List.cons, ptr @List.car, ptr @List.cdr, ptr @Nil.rev, ptr @Nil.sort, ptr @Nil.insert, ptr @Nil.rcons, ptr @Nil.print_list], align 8
@_ZTS4Main = linkonce_odr constant [6 x i8] c"4Main\00", align 1
@_ZTI4Main = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Main, ptr @_ZTI2IO }, align 8
@_ZTV4Main = linkonce_odr constant [11 x ptr] [ptr null, ptr @_ZTI4Main, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Main.iota, ptr @Main.main], align 8
@.str.18400681194753865968 = private constant [2 x i8] c"\0A\00"
@.str.13161174033862053205 = private constant [26 x i8] c"How many numbers to sort?\00"

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

define i1 @List.isNil(ptr %this) {
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

define ptr @List.cons(ptr %this, i32 %hd) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %hd.addr = alloca i32, align 4
  store i32 %hd, ptr %hd.addr, align 4
  %new_cell = alloca ptr, align 8
  %Cons.newtmp = call ptr @Cons.new()
  store ptr %Cons.newtmp, ptr %new_cell, align 8
  %new_cell1 = load ptr, ptr %new_cell, align 8
  %dispatch.isnull = icmp eq ptr %new_cell1, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %new_cell1, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 18
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %hd2 = load i32, ptr %hd.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %new_cell1, i32 %hd2, ptr %self)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define i32 @List.car(ptr %this) {
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

define ptr @List.cdr(ptr %this) {
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

define ptr @List.rev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 12
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @List.sort(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 12
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @List.insert(ptr %this, i32 %i) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %i.addr = alloca i32, align 4
  store i32 %i, ptr %i.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 12
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @List.rcons(ptr %this, i32 %i) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %i.addr = alloca i32, align 4
  store i32 %i, ptr %i.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 12
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @List.print_list(ptr %this) {
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

define i1 @Cons.isNil(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  ret i1 false
}

define ptr @Cons.init(ptr %this, i32 %hd, ptr %tl) {
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

define i32 @Cons.car(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %xcar.addr = getelementptr i8, ptr %self, i32 8
  %xcar = load i32, ptr %xcar.addr, align 4
  ret i32 %xcar
}

define ptr @Cons.cdr(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %xcdr.addr = getelementptr i8, ptr %self, i32 16
  %xcdr = load ptr, ptr %xcdr.addr, align 8
  ret ptr %xcdr
}

define ptr @Cons.rev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %xcdr.addr = getelementptr i8, ptr %self, i32 16
  %xcdr = load ptr, ptr %xcdr.addr, align 8
  %dispatch.isnull = icmp eq ptr %xcdr, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %xcdr, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 13
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %xcdr)
  %dispatch.isnull3 = icmp eq ptr %dispatch.result, null
  br i1 %dispatch.isnull3, label %dispatch.abort2, label %dispatch.ok1

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok1:                                     ; preds = %dispatch.ok
  %vtable.ptr4 = load ptr, ptr %dispatch.result, align 8
  %method.ptr.addr5 = getelementptr ptr, ptr %vtable.ptr4, i64 16
  %method.ptr6 = load ptr, ptr %method.ptr.addr5, align 8
  %self7 = load ptr, ptr %this.addr, align 8
  %xcar.addr = getelementptr i8, ptr %self7, i32 8
  %xcar = load i32, ptr %xcar.addr, align 4
  %dispatch.result8 = call ptr %method.ptr6(ptr %dispatch.result, i32 %xcar)
  ret ptr %dispatch.result8

dispatch.abort2:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable
}

define ptr @Cons.sort(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %xcdr.addr = getelementptr i8, ptr %self, i32 16
  %xcdr = load ptr, ptr %xcdr.addr, align 8
  %dispatch.isnull = icmp eq ptr %xcdr, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %xcdr, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 14
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %xcdr)
  %dispatch.isnull3 = icmp eq ptr %dispatch.result, null
  br i1 %dispatch.isnull3, label %dispatch.abort2, label %dispatch.ok1

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok1:                                     ; preds = %dispatch.ok
  %vtable.ptr4 = load ptr, ptr %dispatch.result, align 8
  %method.ptr.addr5 = getelementptr ptr, ptr %vtable.ptr4, i64 15
  %method.ptr6 = load ptr, ptr %method.ptr.addr5, align 8
  %self7 = load ptr, ptr %this.addr, align 8
  %xcar.addr = getelementptr i8, ptr %self7, i32 8
  %xcar = load i32, ptr %xcar.addr, align 4
  %dispatch.result8 = call ptr %method.ptr6(ptr %dispatch.result, i32 %xcar)
  ret ptr %dispatch.result8

dispatch.abort2:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable
}

define ptr @Cons.insert(ptr %this, i32 %i) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %i.addr = alloca i32, align 4
  store i32 %i, ptr %i.addr, align 4
  %i1 = load i32, ptr %i.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %xcar.addr = getelementptr i8, ptr %self, i32 8
  %xcar = load i32, ptr %xcar.addr, align 4
  %cmptmp = icmp slt i32 %i1, %xcar
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  %Cons.newtmp = call ptr @Cons.new()
  %dispatch.isnull = icmp eq ptr %Cons.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %then
  %vtable.ptr = load ptr, ptr %Cons.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 18
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %i2 = load i32, ptr %i.addr, align 4
  %self3 = load ptr, ptr %this.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %Cons.newtmp, i32 %i2, ptr %self3)
  br label %ifcont

dispatch.abort:                                   ; preds = %then
  call void @abort()
  unreachable

else:                                             ; preds = %entry
  %Cons.newtmp4 = call ptr @Cons.new()
  %dispatch.isnull7 = icmp eq ptr %Cons.newtmp4, null
  br i1 %dispatch.isnull7, label %dispatch.abort6, label %dispatch.ok5

dispatch.ok5:                                     ; preds = %else
  %vtable.ptr8 = load ptr, ptr %Cons.newtmp4, align 8
  %method.ptr.addr9 = getelementptr ptr, ptr %vtable.ptr8, i64 18
  %method.ptr10 = load ptr, ptr %method.ptr.addr9, align 8
  %self11 = load ptr, ptr %this.addr, align 8
  %xcar.addr12 = getelementptr i8, ptr %self11, i32 8
  %xcar13 = load i32, ptr %xcar.addr12, align 4
  %self14 = load ptr, ptr %this.addr, align 8
  %xcdr.addr = getelementptr i8, ptr %self14, i32 16
  %xcdr = load ptr, ptr %xcdr.addr, align 8
  %dispatch.isnull17 = icmp eq ptr %xcdr, null
  br i1 %dispatch.isnull17, label %dispatch.abort16, label %dispatch.ok15

dispatch.abort6:                                  ; preds = %else
  call void @abort()
  unreachable

dispatch.ok15:                                    ; preds = %dispatch.ok5
  %vtable.ptr18 = load ptr, ptr %xcdr, align 8
  %method.ptr.addr19 = getelementptr ptr, ptr %vtable.ptr18, i64 15
  %method.ptr20 = load ptr, ptr %method.ptr.addr19, align 8
  %i21 = load i32, ptr %i.addr, align 4
  %dispatch.result22 = call ptr %method.ptr20(ptr %xcdr, i32 %i21)
  %dispatch.result23 = call ptr %method.ptr10(ptr %Cons.newtmp4, i32 %xcar13, ptr %dispatch.result22)
  br label %ifcont

dispatch.abort16:                                 ; preds = %dispatch.ok5
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok15, %dispatch.ok
  %cond_result = phi ptr [ %dispatch.result, %dispatch.ok ], [ %dispatch.result23, %dispatch.ok15 ]
  ret ptr %cond_result
}

define ptr @Cons.rcons(ptr %this, i32 %i) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %i.addr = alloca i32, align 4
  store i32 %i, ptr %i.addr, align 4
  %Cons.newtmp = call ptr @Cons.new()
  %dispatch.isnull = icmp eq ptr %Cons.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %Cons.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 18
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
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 16
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %i8 = load i32, ptr %i.addr, align 4
  %dispatch.result = call ptr %method.ptr7(ptr %xcdr, i32 %i8)
  %dispatch.result9 = call ptr %method.ptr(ptr %Cons.newtmp, i32 %xcar, ptr %dispatch.result)
  ret ptr %dispatch.result9

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable
}

define ptr @Cons.print_list(ptr %this) {
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
  %dispatch.isnull5 = icmp eq ptr %self2, null
  br i1 %dispatch.isnull5, label %dispatch.abort4, label %dispatch.ok3

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok3:                                     ; preds = %dispatch.ok
  %vtable.ptr6 = load ptr, ptr %self2, align 8
  %method.ptr.addr7 = getelementptr ptr, ptr %vtable.ptr6, i64 5
  %method.ptr8 = load ptr, ptr %method.ptr.addr7, align 8
  %dispatch.result9 = call ptr %method.ptr8(ptr %self2, ptr @.str.18400681194753865968)
  %self10 = load ptr, ptr %this.addr, align 8
  %xcdr.addr = getelementptr i8, ptr %self10, i32 16
  %xcdr = load ptr, ptr %xcdr.addr, align 8
  %dispatch.isnull13 = icmp eq ptr %xcdr, null
  br i1 %dispatch.isnull13, label %dispatch.abort12, label %dispatch.ok11

dispatch.abort4:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok11:                                    ; preds = %dispatch.ok3
  %vtable.ptr14 = load ptr, ptr %xcdr, align 8
  %method.ptr.addr15 = getelementptr ptr, ptr %vtable.ptr14, i64 17
  %method.ptr16 = load ptr, ptr %method.ptr.addr15, align 8
  %dispatch.result17 = call ptr %method.ptr16(ptr %xcdr)
  ret ptr %dispatch.result17

dispatch.abort12:                                 ; preds = %dispatch.ok3
  call void @abort()
  unreachable
}

define i1 @Nil.isNil(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  ret i1 true
}

define ptr @Nil.rev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  ret ptr %self
}

define ptr @Nil.sort(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  ret ptr %self
}

define ptr @Nil.insert(ptr %this, i32 %i) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %i.addr = alloca i32, align 4
  store i32 %i, ptr %i.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 16
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %i1 = load i32, ptr %i.addr, align 4
  %dispatch.result = call ptr %method.ptr(ptr %self, i32 %i1)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @Nil.rcons(ptr %this, i32 %i) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %i.addr = alloca i32, align 4
  store i32 %i, ptr %i.addr, align 4
  %Cons.newtmp = call ptr @Cons.new()
  %dispatch.isnull = icmp eq ptr %Cons.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %Cons.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 18
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %i1 = load i32, ptr %i.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %Cons.newtmp, i32 %i1, ptr %self)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @Nil.print_list(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  ret ptr inttoptr (i1 true to ptr)
}

define ptr @Main.iota(ptr %this, i32 %i) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %i.addr = alloca i32, align 4
  store i32 %i, ptr %i.addr, align 4
  %Nil.newtmp = call ptr @Nil.new()
  %self = load ptr, ptr %this.addr, align 8
  %l.addr = getelementptr i8, ptr %self, i32 8
  store ptr %Nil.newtmp, ptr %l.addr, align 8
  %j = alloca i32, align 4
  store i32 0, ptr %j, align 4
  br label %loop.cond

loop.cond:                                        ; preds = %dispatch.ok, %entry
  %j1 = load i32, ptr %j, align 4
  %i2 = load i32, ptr %i.addr, align 4
  %cmptmp = icmp slt i32 %j1, %i2
  br i1 %cmptmp, label %loop.body, label %loop.after

loop.body:                                        ; preds = %loop.cond
  %Cons.newtmp = call ptr @Cons.new()
  %dispatch.isnull = icmp eq ptr %Cons.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

loop.after:                                       ; preds = %loop.cond
  %self9 = load ptr, ptr %this.addr, align 8
  %l.addr10 = getelementptr i8, ptr %self9, i32 8
  %l11 = load ptr, ptr %l.addr10, align 8
  ret ptr %l11

dispatch.ok:                                      ; preds = %loop.body
  %vtable.ptr = load ptr, ptr %Cons.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 18
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %j3 = load i32, ptr %j, align 4
  %self4 = load ptr, ptr %this.addr, align 8
  %l.addr5 = getelementptr i8, ptr %self4, i32 8
  %l = load ptr, ptr %l.addr5, align 8
  %dispatch.result = call ptr %method.ptr(ptr %Cons.newtmp, i32 %j3, ptr %l)
  %self6 = load ptr, ptr %this.addr, align 8
  %l.addr7 = getelementptr i8, ptr %self6, i32 8
  store ptr %dispatch.result, ptr %l.addr7, align 8
  %j8 = load i32, ptr %j, align 4
  %addtmp = add i32 %j8, 1
  store i32 %addtmp, ptr %j, align 4
  br label %loop.cond

dispatch.abort:                                   ; preds = %loop.body
  call void @abort()
  unreachable
}

define ptr @Main.main(ptr %this) {
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
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.13161174033862053205)
  %self1 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull4 = icmp eq ptr %self1, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %self1, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 9
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %dispatch.result8 = call ptr %method.ptr7(ptr %self1, i32 5)
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
  %dispatch.isnull18 = icmp eq ptr %dispatch.result15, null
  br i1 %dispatch.isnull18, label %dispatch.abort17, label %dispatch.ok16

dispatch.abort10:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable

dispatch.ok16:                                    ; preds = %dispatch.ok9
  %vtable.ptr19 = load ptr, ptr %dispatch.result15, align 8
  %method.ptr.addr20 = getelementptr ptr, ptr %vtable.ptr19, i64 14
  %method.ptr21 = load ptr, ptr %method.ptr.addr20, align 8
  %dispatch.result22 = call ptr %method.ptr21(ptr %dispatch.result15)
  %dispatch.isnull25 = icmp eq ptr %dispatch.result22, null
  br i1 %dispatch.isnull25, label %dispatch.abort24, label %dispatch.ok23

dispatch.abort17:                                 ; preds = %dispatch.ok9
  call void @abort()
  unreachable

dispatch.ok23:                                    ; preds = %dispatch.ok16
  %vtable.ptr26 = load ptr, ptr %dispatch.result22, align 8
  %method.ptr.addr27 = getelementptr ptr, ptr %vtable.ptr26, i64 17
  %method.ptr28 = load ptr, ptr %method.ptr.addr27, align 8
  %dispatch.result29 = call ptr %method.ptr28(ptr %dispatch.result22)
  ret ptr %dispatch.result29

dispatch.abort24:                                 ; preds = %dispatch.ok16
  call void @abort()
  unreachable
}

define void @_ZN4ListC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.List, ptr %this, i32 0, i32 0
  call void @_ZN2IOC2Ev(ptr %parent.subobject)
  store ptr @_ZTV4List, ptr %this, align 8
  ret void
}

define ptr @List.new() {
entry:
  %0 = call ptr @malloc(i64 8)
  call void @_ZN4ListC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN4ConsC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Cons, ptr %this, i32 0, i32 0
  call void @_ZN4ListC2Ev(ptr %parent.subobject)
  store ptr @_ZTV4Cons, ptr %this, align 8
  %xcar.addr.byte = getelementptr i8, ptr %this, i64 8
  store i32 0, ptr %xcar.addr.byte, align 4
  %xcdr.addr.byte = getelementptr i8, ptr %this, i64 16
  store ptr null, ptr %xcdr.addr.byte, align 8
  ret void
}

define ptr @Cons.new() {
entry:
  %0 = call ptr @malloc(i64 24)
  call void @_ZN4ConsC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN3NilC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Nil, ptr %this, i32 0, i32 0
  call void @_ZN4ListC2Ev(ptr %parent.subobject)
  store ptr @_ZTV3Nil, ptr %this, align 8
  ret void
}

define ptr @Nil.new() {
entry:
  %0 = call ptr @malloc(i64 8)
  call void @_ZN3NilC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN4MainC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Main, ptr %this, i32 0, i32 0
  call void @_ZN2IOC2Ev(ptr %parent.subobject)
  store ptr @_ZTV4Main, ptr %this, align 8
  %l.addr.byte = getelementptr i8, ptr %this, i64 8
  store ptr null, ptr %l.addr.byte, align 8
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
