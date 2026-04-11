; ModuleID = 'main_module'
source_filename = "main_module"

%struct.__cxxabiv1.__class_type_info = type { ptr, ptr }
%struct.__cxxabiv1.__si_class_type_info = type { ptr, ptr, ptr }
%class.Int = type { %class.Object.0, i32, [4 x i8] }
%class.Object.0 = type { ptr }
%class.Bool = type { %class.Object.0, i1, [7 x i8] }
%class.String = type { %class.Object.0, ptr, i32, [4 x i8], i32, [4 x i8] }
%class.IO.1 = type { %class.Object.0 }
%class.List = type { %class.Object.0 }
%class.Cons = type { %class.List, i32, [4 x i8], ptr }
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
@_ZTI4List = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4List, ptr @_ZTI6Object }, align 8
@_ZTV4List = linkonce_odr constant [9 x ptr] [ptr null, ptr @_ZTI4List, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @List.isNil, ptr @List.head, ptr @List.tail, ptr @List.cons], align 8
@_ZTS4Cons = linkonce_odr constant [6 x i8] c"4Cons\00", align 1
@_ZTI4Cons = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Cons, ptr @_ZTI4List }, align 8
@_ZTV4Cons = linkonce_odr constant [10 x ptr] [ptr null, ptr @_ZTI4Cons, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @Cons.isNil, ptr @Cons.head, ptr @Cons.tail, ptr @List.cons, ptr @Cons.init], align 8
@_ZTS4Main = linkonce_odr constant [6 x i8] c"4Main\00", align 1
@_ZTI4Main = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Main, ptr @_ZTI2IO }, align 8
@_ZTV4Main = linkonce_odr constant [11 x ptr] [ptr null, ptr @_ZTI4Main, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Main.print_list, ptr @Main.main], align 8
@.str.18400681194753865968 = private constant [2 x i8] c"\0A\00"
@.str.17934988915447438835 = private constant [2 x i8] c" \00"

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
  ret i1 true
}

define i32 @List.head(ptr %this) {
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

define ptr @List.tail(ptr %this) {
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

define ptr @List.cons(ptr %this, i32 %i) {
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
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 9
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %i1 = load i32, ptr %i.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %Cons.newtmp, i32 %i1, ptr %self)
  ret ptr %dispatch.result

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

define i32 @Cons.head(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %car.addr = getelementptr i8, ptr %self, i32 8
  %car = load i32, ptr %car.addr, align 4
  ret i32 %car
}

define ptr @Cons.tail(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %cdr.addr = getelementptr i8, ptr %self, i32 16
  %cdr = load ptr, ptr %cdr.addr, align 8
  ret ptr %cdr
}

define ptr @Cons.init(ptr %this, i32 %i, ptr %rest) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %i.addr = alloca i32, align 4
  store i32 %i, ptr %i.addr, align 4
  %rest.addr = alloca ptr, align 8
  store ptr %rest, ptr %rest.addr, align 8
  %i1 = load i32, ptr %i.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %car.addr = getelementptr i8, ptr %self, i32 8
  store i32 %i1, ptr %car.addr, align 4
  %rest2 = load ptr, ptr %rest.addr, align 8
  %self3 = load ptr, ptr %this.addr, align 8
  %cdr.addr = getelementptr i8, ptr %self3, i32 16
  store ptr %rest2, ptr %cdr.addr, align 8
  %self4 = load ptr, ptr %this.addr, align 8
  ret ptr %self4
}

define ptr @Main.print_list(ptr %this, ptr %l) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %l.addr = alloca ptr, align 8
  store ptr %l, ptr %l.addr, align 8
  %l1 = load ptr, ptr %l.addr, align 8
  %dispatch.isnull = icmp eq ptr %l1, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %l1, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call i1 %method.ptr(ptr %l1)
  br i1 %dispatch.result, label %then, label %else

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

then:                                             ; preds = %dispatch.ok
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull4 = icmp eq ptr %self, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.ok2:                                     ; preds = %then
  %vtable.ptr5 = load ptr, ptr %self, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 5
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %dispatch.result8 = call ptr %method.ptr7(ptr %self, ptr @.str.18400681194753865968)
  br label %ifcont

dispatch.abort3:                                  ; preds = %then
  call void @abort()
  unreachable

else:                                             ; preds = %dispatch.ok
  %self9 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull12 = icmp eq ptr %self9, null
  br i1 %dispatch.isnull12, label %dispatch.abort11, label %dispatch.ok10

dispatch.ok10:                                    ; preds = %else
  %vtable.ptr13 = load ptr, ptr %self9, align 8
  %method.ptr.addr14 = getelementptr ptr, ptr %vtable.ptr13, i64 6
  %method.ptr15 = load ptr, ptr %method.ptr.addr14, align 8
  %l16 = load ptr, ptr %l.addr, align 8
  %dispatch.isnull19 = icmp eq ptr %l16, null
  br i1 %dispatch.isnull19, label %dispatch.abort18, label %dispatch.ok17

dispatch.abort11:                                 ; preds = %else
  call void @abort()
  unreachable

dispatch.ok17:                                    ; preds = %dispatch.ok10
  %vtable.ptr20 = load ptr, ptr %l16, align 8
  %method.ptr.addr21 = getelementptr ptr, ptr %vtable.ptr20, i64 6
  %method.ptr22 = load ptr, ptr %method.ptr.addr21, align 8
  %dispatch.result23 = call i32 %method.ptr22(ptr %l16)
  %dispatch.result24 = call ptr %method.ptr15(ptr %self9, i32 %dispatch.result23)
  %self25 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull28 = icmp eq ptr %self25, null
  br i1 %dispatch.isnull28, label %dispatch.abort27, label %dispatch.ok26

dispatch.abort18:                                 ; preds = %dispatch.ok10
  call void @abort()
  unreachable

dispatch.ok26:                                    ; preds = %dispatch.ok17
  %vtable.ptr29 = load ptr, ptr %self25, align 8
  %method.ptr.addr30 = getelementptr ptr, ptr %vtable.ptr29, i64 5
  %method.ptr31 = load ptr, ptr %method.ptr.addr30, align 8
  %dispatch.result32 = call ptr %method.ptr31(ptr %self25, ptr @.str.17934988915447438835)
  %self33 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull36 = icmp eq ptr %self33, null
  br i1 %dispatch.isnull36, label %dispatch.abort35, label %dispatch.ok34

dispatch.abort27:                                 ; preds = %dispatch.ok17
  call void @abort()
  unreachable

dispatch.ok34:                                    ; preds = %dispatch.ok26
  %vtable.ptr37 = load ptr, ptr %self33, align 8
  %method.ptr.addr38 = getelementptr ptr, ptr %vtable.ptr37, i64 9
  %method.ptr39 = load ptr, ptr %method.ptr.addr38, align 8
  %l40 = load ptr, ptr %l.addr, align 8
  %dispatch.isnull43 = icmp eq ptr %l40, null
  br i1 %dispatch.isnull43, label %dispatch.abort42, label %dispatch.ok41

dispatch.abort35:                                 ; preds = %dispatch.ok26
  call void @abort()
  unreachable

dispatch.ok41:                                    ; preds = %dispatch.ok34
  %vtable.ptr44 = load ptr, ptr %l40, align 8
  %method.ptr.addr45 = getelementptr ptr, ptr %vtable.ptr44, i64 7
  %method.ptr46 = load ptr, ptr %method.ptr.addr45, align 8
  %dispatch.result47 = call ptr %method.ptr46(ptr %l40)
  %dispatch.result48 = call ptr %method.ptr39(ptr %self33, ptr %dispatch.result47)
  br label %ifcont

dispatch.abort42:                                 ; preds = %dispatch.ok34
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok41, %dispatch.ok2
  %cond_result = phi ptr [ %dispatch.result8, %dispatch.ok2 ], [ %dispatch.result48, %dispatch.ok41 ]
  ret ptr %cond_result
}

define ptr @Main.main(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %List.newtmp = call ptr @List.new()
  %dispatch.isnull = icmp eq ptr %List.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %List.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 8
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %List.newtmp, i32 1)
  %dispatch.isnull3 = icmp eq ptr %dispatch.result, null
  br i1 %dispatch.isnull3, label %dispatch.abort2, label %dispatch.ok1

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok1:                                     ; preds = %dispatch.ok
  %vtable.ptr4 = load ptr, ptr %dispatch.result, align 8
  %method.ptr.addr5 = getelementptr ptr, ptr %vtable.ptr4, i64 8
  %method.ptr6 = load ptr, ptr %method.ptr.addr5, align 8
  %dispatch.result7 = call ptr %method.ptr6(ptr %dispatch.result, i32 2)
  %dispatch.isnull10 = icmp eq ptr %dispatch.result7, null
  br i1 %dispatch.isnull10, label %dispatch.abort9, label %dispatch.ok8

dispatch.abort2:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok8:                                     ; preds = %dispatch.ok1
  %vtable.ptr11 = load ptr, ptr %dispatch.result7, align 8
  %method.ptr.addr12 = getelementptr ptr, ptr %vtable.ptr11, i64 8
  %method.ptr13 = load ptr, ptr %method.ptr.addr12, align 8
  %dispatch.result14 = call ptr %method.ptr13(ptr %dispatch.result7, i32 3)
  %dispatch.isnull17 = icmp eq ptr %dispatch.result14, null
  br i1 %dispatch.isnull17, label %dispatch.abort16, label %dispatch.ok15

dispatch.abort9:                                  ; preds = %dispatch.ok1
  call void @abort()
  unreachable

dispatch.ok15:                                    ; preds = %dispatch.ok8
  %vtable.ptr18 = load ptr, ptr %dispatch.result14, align 8
  %method.ptr.addr19 = getelementptr ptr, ptr %vtable.ptr18, i64 8
  %method.ptr20 = load ptr, ptr %method.ptr.addr19, align 8
  %dispatch.result21 = call ptr %method.ptr20(ptr %dispatch.result14, i32 4)
  %dispatch.isnull24 = icmp eq ptr %dispatch.result21, null
  br i1 %dispatch.isnull24, label %dispatch.abort23, label %dispatch.ok22

dispatch.abort16:                                 ; preds = %dispatch.ok8
  call void @abort()
  unreachable

dispatch.ok22:                                    ; preds = %dispatch.ok15
  %vtable.ptr25 = load ptr, ptr %dispatch.result21, align 8
  %method.ptr.addr26 = getelementptr ptr, ptr %vtable.ptr25, i64 8
  %method.ptr27 = load ptr, ptr %method.ptr.addr26, align 8
  %dispatch.result28 = call ptr %method.ptr27(ptr %dispatch.result21, i32 5)
  %self = load ptr, ptr %this.addr, align 8
  %mylist.addr = getelementptr i8, ptr %self, i32 8
  store ptr %dispatch.result28, ptr %mylist.addr, align 8
  br label %loop.cond

dispatch.abort23:                                 ; preds = %dispatch.ok15
  call void @abort()
  unreachable

loop.cond:                                        ; preds = %dispatch.ok52, %dispatch.ok22
  %self29 = load ptr, ptr %this.addr, align 8
  %mylist.addr30 = getelementptr i8, ptr %self29, i32 8
  %mylist = load ptr, ptr %mylist.addr30, align 8
  %dispatch.isnull33 = icmp eq ptr %mylist, null
  br i1 %dispatch.isnull33, label %dispatch.abort32, label %dispatch.ok31

loop.body:                                        ; preds = %dispatch.ok31
  %self38 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull41 = icmp eq ptr %self38, null
  br i1 %dispatch.isnull41, label %dispatch.abort40, label %dispatch.ok39

loop.after:                                       ; preds = %dispatch.ok31
  ret ptr null

dispatch.ok31:                                    ; preds = %loop.cond
  %vtable.ptr34 = load ptr, ptr %mylist, align 8
  %method.ptr.addr35 = getelementptr ptr, ptr %vtable.ptr34, i64 5
  %method.ptr36 = load ptr, ptr %method.ptr.addr35, align 8
  %dispatch.result37 = call i1 %method.ptr36(ptr %mylist)
  %comptmp = xor i1 %dispatch.result37, true
  br i1 %comptmp, label %loop.body, label %loop.after

dispatch.abort32:                                 ; preds = %loop.cond
  call void @abort()
  unreachable

dispatch.ok39:                                    ; preds = %loop.body
  %vtable.ptr42 = load ptr, ptr %self38, align 8
  %method.ptr.addr43 = getelementptr ptr, ptr %vtable.ptr42, i64 9
  %method.ptr44 = load ptr, ptr %method.ptr.addr43, align 8
  %self45 = load ptr, ptr %this.addr, align 8
  %mylist.addr46 = getelementptr i8, ptr %self45, i32 8
  %mylist47 = load ptr, ptr %mylist.addr46, align 8
  %dispatch.result48 = call ptr %method.ptr44(ptr %self38, ptr %mylist47)
  %self49 = load ptr, ptr %this.addr, align 8
  %mylist.addr50 = getelementptr i8, ptr %self49, i32 8
  %mylist51 = load ptr, ptr %mylist.addr50, align 8
  %dispatch.isnull54 = icmp eq ptr %mylist51, null
  br i1 %dispatch.isnull54, label %dispatch.abort53, label %dispatch.ok52

dispatch.abort40:                                 ; preds = %loop.body
  call void @abort()
  unreachable

dispatch.ok52:                                    ; preds = %dispatch.ok39
  %vtable.ptr55 = load ptr, ptr %mylist51, align 8
  %method.ptr.addr56 = getelementptr ptr, ptr %vtable.ptr55, i64 7
  %method.ptr57 = load ptr, ptr %method.ptr.addr56, align 8
  %dispatch.result58 = call ptr %method.ptr57(ptr %mylist51)
  %self59 = load ptr, ptr %this.addr, align 8
  %mylist.addr60 = getelementptr i8, ptr %self59, i32 8
  store ptr %dispatch.result58, ptr %mylist.addr60, align 8
  br label %loop.cond

dispatch.abort53:                                 ; preds = %dispatch.ok39
  call void @abort()
  unreachable
}

define void @_ZN4ListC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.List, ptr %this, i32 0, i32 0
  call void @_ZN6ObjectC2Ev(ptr %parent.subobject)
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
  %car.addr.byte = getelementptr i8, ptr %this, i64 8
  store i32 0, ptr %car.addr.byte, align 4
  %cdr.addr.byte = getelementptr i8, ptr %this, i64 16
  store ptr null, ptr %cdr.addr.byte, align 8
  ret void
}

define ptr @Cons.new() {
entry:
  %0 = call ptr @malloc(i64 24)
  call void @_ZN4ConsC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN4MainC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Main, ptr %this, i32 0, i32 0
  call void @_ZN2IOC2Ev(ptr %parent.subobject)
  store ptr @_ZTV4Main, ptr %this, align 8
  %mylist.addr.byte = getelementptr i8, ptr %this, i64 8
  store ptr null, ptr %mylist.addr.byte, align 8
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
