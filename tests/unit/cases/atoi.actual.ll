; ModuleID = 'main_module'
source_filename = "main_module"

%struct.__cxxabiv1.__class_type_info = type { ptr, ptr }
%struct.__cxxabiv1.__si_class_type_info = type { ptr, ptr, ptr }
%class.Int = type { %class.Object.0, i32, [4 x i8] }
%class.Object.0 = type { ptr }
%class.Bool = type { %class.Object.0, i1, [7 x i8] }
%class.String = type { %class.Object.0, ptr, i32, [4 x i8], i32, [4 x i8] }
%class.IO.1 = type { %class.Object.0 }
%class.A2I = type { %class.Object.0 }
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
@_ZTS3A2I = linkonce_odr constant [5 x i8] c"3A2I\00", align 1
@_ZTI3A2I = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS3A2I, ptr @_ZTI6Object }, align 8
@_ZTV3A2I = linkonce_odr constant [11 x ptr] [ptr null, ptr @_ZTI3A2I, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @A2I.c2i, ptr @A2I.i2c, ptr @A2I.a2i, ptr @A2I.a2i_aux, ptr @A2I.i2a, ptr @A2I.i2a_aux], align 8
@_ZTS4Main = linkonce_odr constant [6 x i8] c"4Main\00", align 1
@_ZTI4Main = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Main, ptr @_ZTI2IO }, align 8
@_ZTV4Main = linkonce_odr constant [10 x ptr] [ptr null, ptr @_ZTI4Main, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Main.main], align 8
@.str.7372855250431704371 = private constant [2 x i8] c"-\00"
@.str.1370730858159036685 = private constant [2 x i8] c"+\00"
@.str.12271353895611140273 = private constant [3 x i8] c"42\00"
@.str.18400681194753865968 = private constant [2 x i8] c"\0A\00"
@.str.14536993150049646506 = private constant [3 x i8] c"+0\00"

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

define i32 @A2I.c2i(ptr %this, ptr %char) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %char.addr = alloca ptr, align 8
  store ptr %char, ptr %char.addr, align 8
  %char1 = load ptr, ptr %char.addr, align 8
  %eqtmp = call i1 @String_equals(ptr %char1, ptr @.str.num.0)
  br i1 %eqtmp, label %then, label %else

then:                                             ; preds = %entry
  br label %ifcont53

else:                                             ; preds = %entry
  %char2 = load ptr, ptr %char.addr, align 8
  %eqtmp3 = call i1 @String_equals(ptr %char2, ptr @.str.num.1)
  br i1 %eqtmp3, label %then4, label %else5

then4:                                            ; preds = %else
  br label %ifcont51

else5:                                            ; preds = %else
  %char6 = load ptr, ptr %char.addr, align 8
  %eqtmp7 = call i1 @String_equals(ptr %char6, ptr @.str.num.2)
  br i1 %eqtmp7, label %then8, label %else9

then8:                                            ; preds = %else5
  br label %ifcont49

else9:                                            ; preds = %else5
  %char10 = load ptr, ptr %char.addr, align 8
  %eqtmp11 = call i1 @String_equals(ptr %char10, ptr @.str.num.3)
  br i1 %eqtmp11, label %then12, label %else13

then12:                                           ; preds = %else9
  br label %ifcont47

else13:                                           ; preds = %else9
  %char14 = load ptr, ptr %char.addr, align 8
  %eqtmp15 = call i1 @String_equals(ptr %char14, ptr @.str.num.4)
  br i1 %eqtmp15, label %then16, label %else17

then16:                                           ; preds = %else13
  br label %ifcont45

else17:                                           ; preds = %else13
  %char18 = load ptr, ptr %char.addr, align 8
  %eqtmp19 = call i1 @String_equals(ptr %char18, ptr @.str.num.5)
  br i1 %eqtmp19, label %then20, label %else21

then20:                                           ; preds = %else17
  br label %ifcont43

else21:                                           ; preds = %else17
  %char22 = load ptr, ptr %char.addr, align 8
  %eqtmp23 = call i1 @String_equals(ptr %char22, ptr @.str.num.6)
  br i1 %eqtmp23, label %then24, label %else25

then24:                                           ; preds = %else21
  br label %ifcont41

else25:                                           ; preds = %else21
  %char26 = load ptr, ptr %char.addr, align 8
  %eqtmp27 = call i1 @String_equals(ptr %char26, ptr @.str.num.7)
  br i1 %eqtmp27, label %then28, label %else29

then28:                                           ; preds = %else25
  br label %ifcont39

else29:                                           ; preds = %else25
  %char30 = load ptr, ptr %char.addr, align 8
  %eqtmp31 = call i1 @String_equals(ptr %char30, ptr @.str.num.8)
  br i1 %eqtmp31, label %then32, label %else33

then32:                                           ; preds = %else29
  br label %ifcont38

else33:                                           ; preds = %else29
  %char34 = load ptr, ptr %char.addr, align 8
  %eqtmp35 = call i1 @String_equals(ptr %char34, ptr @.str.num.9)
  br i1 %eqtmp35, label %then36, label %else37

then36:                                           ; preds = %else33
  br label %ifcont

else37:                                           ; preds = %else33
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %else37
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 3
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %0 = call ptr %method.ptr(ptr %self)
  unreachable

dispatch.abort:                                   ; preds = %else37
  call void @abort()
  unreachable

ifcont:                                           ; preds = %then36
  br label %ifcont38

ifcont38:                                         ; preds = %ifcont, %then32
  %cond_result = phi i32 [ 8, %then32 ], [ 9, %ifcont ]
  br label %ifcont39

ifcont39:                                         ; preds = %ifcont38, %then28
  %cond_result40 = phi i32 [ 7, %then28 ], [ %cond_result, %ifcont38 ]
  br label %ifcont41

ifcont41:                                         ; preds = %ifcont39, %then24
  %cond_result42 = phi i32 [ 6, %then24 ], [ %cond_result40, %ifcont39 ]
  br label %ifcont43

ifcont43:                                         ; preds = %ifcont41, %then20
  %cond_result44 = phi i32 [ 5, %then20 ], [ %cond_result42, %ifcont41 ]
  br label %ifcont45

ifcont45:                                         ; preds = %ifcont43, %then16
  %cond_result46 = phi i32 [ 4, %then16 ], [ %cond_result44, %ifcont43 ]
  br label %ifcont47

ifcont47:                                         ; preds = %ifcont45, %then12
  %cond_result48 = phi i32 [ 3, %then12 ], [ %cond_result46, %ifcont45 ]
  br label %ifcont49

ifcont49:                                         ; preds = %ifcont47, %then8
  %cond_result50 = phi i32 [ 2, %then8 ], [ %cond_result48, %ifcont47 ]
  br label %ifcont51

ifcont51:                                         ; preds = %ifcont49, %then4
  %cond_result52 = phi i32 [ 1, %then4 ], [ %cond_result50, %ifcont49 ]
  br label %ifcont53

ifcont53:                                         ; preds = %ifcont51, %then
  %cond_result54 = phi i32 [ 0, %then ], [ %cond_result52, %ifcont51 ]
  ret i32 %cond_result54
}

define ptr @A2I.i2c(ptr %this, i32 %i) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %i.addr = alloca i32, align 4
  store i32 %i, ptr %i.addr, align 4
  %i1 = load i32, ptr %i.addr, align 4
  %eqtmp = icmp eq i32 %i1, 0
  br i1 %eqtmp, label %then, label %else

then:                                             ; preds = %entry
  br label %ifcont53

else:                                             ; preds = %entry
  %i2 = load i32, ptr %i.addr, align 4
  %eqtmp3 = icmp eq i32 %i2, 1
  br i1 %eqtmp3, label %then4, label %else5

then4:                                            ; preds = %else
  br label %ifcont51

else5:                                            ; preds = %else
  %i6 = load i32, ptr %i.addr, align 4
  %eqtmp7 = icmp eq i32 %i6, 2
  br i1 %eqtmp7, label %then8, label %else9

then8:                                            ; preds = %else5
  br label %ifcont49

else9:                                            ; preds = %else5
  %i10 = load i32, ptr %i.addr, align 4
  %eqtmp11 = icmp eq i32 %i10, 3
  br i1 %eqtmp11, label %then12, label %else13

then12:                                           ; preds = %else9
  br label %ifcont47

else13:                                           ; preds = %else9
  %i14 = load i32, ptr %i.addr, align 4
  %eqtmp15 = icmp eq i32 %i14, 4
  br i1 %eqtmp15, label %then16, label %else17

then16:                                           ; preds = %else13
  br label %ifcont45

else17:                                           ; preds = %else13
  %i18 = load i32, ptr %i.addr, align 4
  %eqtmp19 = icmp eq i32 %i18, 5
  br i1 %eqtmp19, label %then20, label %else21

then20:                                           ; preds = %else17
  br label %ifcont43

else21:                                           ; preds = %else17
  %i22 = load i32, ptr %i.addr, align 4
  %eqtmp23 = icmp eq i32 %i22, 6
  br i1 %eqtmp23, label %then24, label %else25

then24:                                           ; preds = %else21
  br label %ifcont41

else25:                                           ; preds = %else21
  %i26 = load i32, ptr %i.addr, align 4
  %eqtmp27 = icmp eq i32 %i26, 7
  br i1 %eqtmp27, label %then28, label %else29

then28:                                           ; preds = %else25
  br label %ifcont39

else29:                                           ; preds = %else25
  %i30 = load i32, ptr %i.addr, align 4
  %eqtmp31 = icmp eq i32 %i30, 8
  br i1 %eqtmp31, label %then32, label %else33

then32:                                           ; preds = %else29
  br label %ifcont38

else33:                                           ; preds = %else29
  %i34 = load i32, ptr %i.addr, align 4
  %eqtmp35 = icmp eq i32 %i34, 9
  br i1 %eqtmp35, label %then36, label %else37

then36:                                           ; preds = %else33
  br label %ifcont

else37:                                           ; preds = %else33
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %else37
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 3
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %0 = call ptr %method.ptr(ptr %self)
  unreachable

dispatch.abort:                                   ; preds = %else37
  call void @abort()
  unreachable

ifcont:                                           ; preds = %then36
  br label %ifcont38

ifcont38:                                         ; preds = %ifcont, %then32
  %cond_result = phi ptr [ @.str.num.8, %then32 ], [ @.str.num.9, %ifcont ]
  br label %ifcont39

ifcont39:                                         ; preds = %ifcont38, %then28
  %cond_result40 = phi ptr [ @.str.num.7, %then28 ], [ %cond_result, %ifcont38 ]
  br label %ifcont41

ifcont41:                                         ; preds = %ifcont39, %then24
  %cond_result42 = phi ptr [ @.str.num.6, %then24 ], [ %cond_result40, %ifcont39 ]
  br label %ifcont43

ifcont43:                                         ; preds = %ifcont41, %then20
  %cond_result44 = phi ptr [ @.str.num.5, %then20 ], [ %cond_result42, %ifcont41 ]
  br label %ifcont45

ifcont45:                                         ; preds = %ifcont43, %then16
  %cond_result46 = phi ptr [ @.str.num.4, %then16 ], [ %cond_result44, %ifcont43 ]
  br label %ifcont47

ifcont47:                                         ; preds = %ifcont45, %then12
  %cond_result48 = phi ptr [ @.str.num.3, %then12 ], [ %cond_result46, %ifcont45 ]
  br label %ifcont49

ifcont49:                                         ; preds = %ifcont47, %then8
  %cond_result50 = phi ptr [ @.str.num.2, %then8 ], [ %cond_result48, %ifcont47 ]
  br label %ifcont51

ifcont51:                                         ; preds = %ifcont49, %then4
  %cond_result52 = phi ptr [ @.str.num.1, %then4 ], [ %cond_result50, %ifcont49 ]
  br label %ifcont53

ifcont53:                                         ; preds = %ifcont51, %then
  %cond_result54 = phi ptr [ @.str.num.0, %then ], [ %cond_result52, %ifcont51 ]
  ret ptr %cond_result54
}

define i32 @A2I.a2i(ptr %this, ptr %s) {
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
  br label %ifcont62

else:                                             ; preds = %dispatch.ok
  %s2 = load ptr, ptr %s.addr, align 8
  %dispatch.isnull5 = icmp eq ptr %s2, null
  br i1 %dispatch.isnull5, label %dispatch.abort4, label %dispatch.ok3

dispatch.ok3:                                     ; preds = %else
  %dispatch.result6 = call ptr @String_substr(ptr %s2, i32 0, i32 1)
  %eqtmp7 = call i1 @String_equals(ptr %dispatch.result6, ptr @.str.7372855250431704371)
  br i1 %eqtmp7, label %then8, label %else23

dispatch.abort4:                                  ; preds = %else
  call void @abort()
  unreachable

then8:                                            ; preds = %dispatch.ok3
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull11 = icmp eq ptr %self, null
  br i1 %dispatch.isnull11, label %dispatch.abort10, label %dispatch.ok9

dispatch.ok9:                                     ; preds = %then8
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 8
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %s12 = load ptr, ptr %s.addr, align 8
  %dispatch.isnull15 = icmp eq ptr %s12, null
  br i1 %dispatch.isnull15, label %dispatch.abort14, label %dispatch.ok13

dispatch.abort10:                                 ; preds = %then8
  call void @abort()
  unreachable

dispatch.ok13:                                    ; preds = %dispatch.ok9
  %s16 = load ptr, ptr %s.addr, align 8
  %dispatch.isnull19 = icmp eq ptr %s16, null
  br i1 %dispatch.isnull19, label %dispatch.abort18, label %dispatch.ok17

dispatch.abort14:                                 ; preds = %dispatch.ok9
  call void @abort()
  unreachable

dispatch.ok17:                                    ; preds = %dispatch.ok13
  %dispatch.result20 = call i32 @String_length(ptr %s16)
  %subtmp = sub i32 %dispatch.result20, 1
  %dispatch.result21 = call ptr @String_substr(ptr %s12, i32 1, i32 %subtmp)
  %dispatch.result22 = call i32 %method.ptr(ptr %self, ptr %dispatch.result21)
  %negtmp = sub i32 0, %dispatch.result22
  br label %ifcont60

dispatch.abort18:                                 ; preds = %dispatch.ok13
  call void @abort()
  unreachable

else23:                                           ; preds = %dispatch.ok3
  %s24 = load ptr, ptr %s.addr, align 8
  %dispatch.isnull27 = icmp eq ptr %s24, null
  br i1 %dispatch.isnull27, label %dispatch.abort26, label %dispatch.ok25

dispatch.ok25:                                    ; preds = %else23
  %dispatch.result28 = call ptr @String_substr(ptr %s24, i32 0, i32 1)
  %eqtmp29 = call i1 @String_equals(ptr %dispatch.result28, ptr @.str.1370730858159036685)
  br i1 %eqtmp29, label %then30, label %else50

dispatch.abort26:                                 ; preds = %else23
  call void @abort()
  unreachable

then30:                                           ; preds = %dispatch.ok25
  %self31 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull34 = icmp eq ptr %self31, null
  br i1 %dispatch.isnull34, label %dispatch.abort33, label %dispatch.ok32

dispatch.ok32:                                    ; preds = %then30
  %vtable.ptr35 = load ptr, ptr %self31, align 8
  %method.ptr.addr36 = getelementptr ptr, ptr %vtable.ptr35, i64 8
  %method.ptr37 = load ptr, ptr %method.ptr.addr36, align 8
  %s38 = load ptr, ptr %s.addr, align 8
  %dispatch.isnull41 = icmp eq ptr %s38, null
  br i1 %dispatch.isnull41, label %dispatch.abort40, label %dispatch.ok39

dispatch.abort33:                                 ; preds = %then30
  call void @abort()
  unreachable

dispatch.ok39:                                    ; preds = %dispatch.ok32
  %s42 = load ptr, ptr %s.addr, align 8
  %dispatch.isnull45 = icmp eq ptr %s42, null
  br i1 %dispatch.isnull45, label %dispatch.abort44, label %dispatch.ok43

dispatch.abort40:                                 ; preds = %dispatch.ok32
  call void @abort()
  unreachable

dispatch.ok43:                                    ; preds = %dispatch.ok39
  %dispatch.result46 = call i32 @String_length(ptr %s42)
  %subtmp47 = sub i32 %dispatch.result46, 1
  %dispatch.result48 = call ptr @String_substr(ptr %s38, i32 1, i32 %subtmp47)
  %dispatch.result49 = call i32 %method.ptr37(ptr %self31, ptr %dispatch.result48)
  br label %ifcont

dispatch.abort44:                                 ; preds = %dispatch.ok39
  call void @abort()
  unreachable

else50:                                           ; preds = %dispatch.ok25
  %self51 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull54 = icmp eq ptr %self51, null
  br i1 %dispatch.isnull54, label %dispatch.abort53, label %dispatch.ok52

dispatch.ok52:                                    ; preds = %else50
  %vtable.ptr55 = load ptr, ptr %self51, align 8
  %method.ptr.addr56 = getelementptr ptr, ptr %vtable.ptr55, i64 8
  %method.ptr57 = load ptr, ptr %method.ptr.addr56, align 8
  %s58 = load ptr, ptr %s.addr, align 8
  %dispatch.result59 = call i32 %method.ptr57(ptr %self51, ptr %s58)
  br label %ifcont

dispatch.abort53:                                 ; preds = %else50
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok52, %dispatch.ok43
  %cond_result = phi i32 [ %dispatch.result49, %dispatch.ok43 ], [ %dispatch.result59, %dispatch.ok52 ]
  br label %ifcont60

ifcont60:                                         ; preds = %ifcont, %dispatch.ok17
  %cond_result61 = phi i32 [ %negtmp, %dispatch.ok17 ], [ %cond_result, %ifcont ]
  br label %ifcont62

ifcont62:                                         ; preds = %ifcont60, %then
  %cond_result63 = phi i32 [ 0, %then ], [ %cond_result61, %ifcont60 ]
  ret i32 %cond_result63
}

define i32 @A2I.a2i_aux(ptr %this, ptr %s) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %s.addr = alloca ptr, align 8
  store ptr %s, ptr %s.addr, align 8
  %int = alloca i32, align 4
  store i32 0, ptr %int, align 4
  %j = alloca i32, align 4
  %s1 = load ptr, ptr %s.addr, align 8
  %dispatch.isnull = icmp eq ptr %s1, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %dispatch.result = call i32 @String_length(ptr %s1)
  store i32 %dispatch.result, ptr %j, align 4
  %i = alloca i32, align 4
  store i32 0, ptr %i, align 4
  br label %loop.cond

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

loop.cond:                                        ; preds = %dispatch.ok9, %dispatch.ok
  %i2 = load i32, ptr %i, align 4
  %j3 = load i32, ptr %j, align 4
  %cmptmp = icmp slt i32 %i2, %j3
  br i1 %cmptmp, label %loop.body, label %loop.after

loop.body:                                        ; preds = %loop.cond
  %int4 = load i32, ptr %int, align 4
  %multmp = mul i32 %int4, 10
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull7 = icmp eq ptr %self, null
  br i1 %dispatch.isnull7, label %dispatch.abort6, label %dispatch.ok5

loop.after:                                       ; preds = %loop.cond
  %int17 = load i32, ptr %int, align 4
  ret i32 %int17

dispatch.ok5:                                     ; preds = %loop.body
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %s8 = load ptr, ptr %s.addr, align 8
  %dispatch.isnull11 = icmp eq ptr %s8, null
  br i1 %dispatch.isnull11, label %dispatch.abort10, label %dispatch.ok9

dispatch.abort6:                                  ; preds = %loop.body
  call void @abort()
  unreachable

dispatch.ok9:                                     ; preds = %dispatch.ok5
  %i12 = load i32, ptr %i, align 4
  %dispatch.result13 = call ptr @String_substr(ptr %s8, i32 %i12, i32 1)
  %dispatch.result14 = call i32 %method.ptr(ptr %self, ptr %dispatch.result13)
  %addtmp = add i32 %multmp, %dispatch.result14
  store i32 %addtmp, ptr %int, align 4
  %i15 = load i32, ptr %i, align 4
  %addtmp16 = add i32 %i15, 1
  store i32 %addtmp16, ptr %i, align 4
  br label %loop.cond

dispatch.abort10:                                 ; preds = %dispatch.ok5
  call void @abort()
  unreachable
}

define ptr @A2I.i2a(ptr %this, i32 %i) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %i.addr = alloca i32, align 4
  store i32 %i, ptr %i.addr, align 4
  %i1 = load i32, ptr %i.addr, align 4
  %eqtmp = icmp eq i32 %i1, 0
  br i1 %eqtmp, label %then, label %else

then:                                             ; preds = %entry
  br label %ifcont16

else:                                             ; preds = %entry
  %i2 = load i32, ptr %i.addr, align 4
  %cmptmp = icmp slt i32 0, %i2
  br i1 %cmptmp, label %then3, label %else5

then3:                                            ; preds = %else
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %then3
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 10
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %i4 = load i32, ptr %i.addr, align 4
  %dispatch.result = call ptr %method.ptr(ptr %self, i32 %i4)
  br label %ifcont

dispatch.abort:                                   ; preds = %then3
  call void @abort()
  unreachable

else5:                                            ; preds = %else
  %self6 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull9 = icmp eq ptr %self6, null
  br i1 %dispatch.isnull9, label %dispatch.abort8, label %dispatch.ok7

dispatch.ok7:                                     ; preds = %else5
  %vtable.ptr10 = load ptr, ptr %self6, align 8
  %method.ptr.addr11 = getelementptr ptr, ptr %vtable.ptr10, i64 10
  %method.ptr12 = load ptr, ptr %method.ptr.addr11, align 8
  %i13 = load i32, ptr %i.addr, align 4
  %multmp = mul i32 %i13, -1
  %dispatch.result14 = call ptr %method.ptr12(ptr %self6, i32 %multmp)
  %dispatch.result15 = call ptr @String_concat(ptr @.str.7372855250431704371, ptr %dispatch.result14)
  br label %ifcont

dispatch.abort8:                                  ; preds = %else5
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok7, %dispatch.ok
  %cond_result = phi ptr [ %dispatch.result, %dispatch.ok ], [ %dispatch.result15, %dispatch.ok7 ]
  br label %ifcont16

ifcont16:                                         ; preds = %ifcont, %then
  %cond_result17 = phi ptr [ @.str.num.0, %then ], [ %cond_result, %ifcont ]
  ret ptr %cond_result17
}

define ptr @A2I.i2a_aux(ptr %this, i32 %i) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %i.addr = alloca i32, align 4
  store i32 %i, ptr %i.addr, align 4
  %i1 = load i32, ptr %i.addr, align 4
  %eqtmp = icmp eq i32 %i1, 0
  br i1 %eqtmp, label %then, label %else

then:                                             ; preds = %entry
  br label %ifcont

else:                                             ; preds = %entry
  %next = alloca i32, align 4
  %i2 = load i32, ptr %i.addr, align 4
  %divtmp = sdiv i32 %i2, 10
  store i32 %divtmp, ptr %next, align 4
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %else
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 10
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %next3 = load i32, ptr %next, align 4
  %dispatch.result = call ptr %method.ptr(ptr %self, i32 %next3)
  %dispatch.isnull6 = icmp eq ptr %dispatch.result, null
  br i1 %dispatch.isnull6, label %dispatch.abort5, label %dispatch.ok4

dispatch.abort:                                   ; preds = %else
  call void @abort()
  unreachable

dispatch.ok4:                                     ; preds = %dispatch.ok
  %self7 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull10 = icmp eq ptr %self7, null
  br i1 %dispatch.isnull10, label %dispatch.abort9, label %dispatch.ok8

dispatch.abort5:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok8:                                     ; preds = %dispatch.ok4
  %vtable.ptr11 = load ptr, ptr %self7, align 8
  %method.ptr.addr12 = getelementptr ptr, ptr %vtable.ptr11, i64 6
  %method.ptr13 = load ptr, ptr %method.ptr.addr12, align 8
  %i14 = load i32, ptr %i.addr, align 4
  %next15 = load i32, ptr %next, align 4
  %multmp = mul i32 %next15, 10
  %subtmp = sub i32 %i14, %multmp
  %dispatch.result16 = call ptr %method.ptr13(ptr %self7, i32 %subtmp)
  %dispatch.result17 = call ptr @String_concat(ptr %dispatch.result, ptr %dispatch.result16)
  br label %ifcont

dispatch.abort9:                                  ; preds = %dispatch.ok4
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok8, %then
  %cond_result = phi ptr [ @.str.const.6142509188972423790, %then ], [ %dispatch.result17, %dispatch.ok8 ]
  ret ptr %cond_result
}

define ptr @Main.main(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %z = alloca ptr, align 8
  %A2I.newtmp = call ptr @A2I.new()
  store ptr %A2I.newtmp, ptr %z, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 6
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %z1 = load ptr, ptr %z, align 8
  %dispatch.isnull4 = icmp eq ptr %z1, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %z1, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 7
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %dispatch.result = call i32 %method.ptr7(ptr %z1, ptr @.str.12271353895611140273)
  %dispatch.result8 = call ptr %method.ptr(ptr %self, i32 %dispatch.result)
  %self9 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull12 = icmp eq ptr %self9, null
  br i1 %dispatch.isnull12, label %dispatch.abort11, label %dispatch.ok10

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok10:                                    ; preds = %dispatch.ok2
  %vtable.ptr13 = load ptr, ptr %self9, align 8
  %method.ptr.addr14 = getelementptr ptr, ptr %vtable.ptr13, i64 5
  %method.ptr15 = load ptr, ptr %method.ptr.addr14, align 8
  %dispatch.result16 = call ptr %method.ptr15(ptr %self9, ptr @.str.18400681194753865968)
  %self17 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull20 = icmp eq ptr %self17, null
  br i1 %dispatch.isnull20, label %dispatch.abort19, label %dispatch.ok18

dispatch.abort11:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable

dispatch.ok18:                                    ; preds = %dispatch.ok10
  %vtable.ptr21 = load ptr, ptr %self17, align 8
  %method.ptr.addr22 = getelementptr ptr, ptr %vtable.ptr21, i64 5
  %method.ptr23 = load ptr, ptr %method.ptr.addr22, align 8
  %z24 = load ptr, ptr %z, align 8
  %dispatch.isnull27 = icmp eq ptr %z24, null
  br i1 %dispatch.isnull27, label %dispatch.abort26, label %dispatch.ok25

dispatch.abort19:                                 ; preds = %dispatch.ok10
  call void @abort()
  unreachable

dispatch.ok25:                                    ; preds = %dispatch.ok18
  %vtable.ptr28 = load ptr, ptr %z24, align 8
  %method.ptr.addr29 = getelementptr ptr, ptr %vtable.ptr28, i64 9
  %method.ptr30 = load ptr, ptr %method.ptr.addr29, align 8
  %dispatch.result31 = call ptr %method.ptr30(ptr %z24, i32 -7)
  %dispatch.result32 = call ptr %method.ptr23(ptr %self17, ptr %dispatch.result31)
  %self33 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull36 = icmp eq ptr %self33, null
  br i1 %dispatch.isnull36, label %dispatch.abort35, label %dispatch.ok34

dispatch.abort26:                                 ; preds = %dispatch.ok18
  call void @abort()
  unreachable

dispatch.ok34:                                    ; preds = %dispatch.ok25
  %vtable.ptr37 = load ptr, ptr %self33, align 8
  %method.ptr.addr38 = getelementptr ptr, ptr %vtable.ptr37, i64 5
  %method.ptr39 = load ptr, ptr %method.ptr.addr38, align 8
  %dispatch.result40 = call ptr %method.ptr39(ptr %self33, ptr @.str.18400681194753865968)
  %self41 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull44 = icmp eq ptr %self41, null
  br i1 %dispatch.isnull44, label %dispatch.abort43, label %dispatch.ok42

dispatch.abort35:                                 ; preds = %dispatch.ok25
  call void @abort()
  unreachable

dispatch.ok42:                                    ; preds = %dispatch.ok34
  %vtable.ptr45 = load ptr, ptr %self41, align 8
  %method.ptr.addr46 = getelementptr ptr, ptr %vtable.ptr45, i64 5
  %method.ptr47 = load ptr, ptr %method.ptr.addr46, align 8
  %z48 = load ptr, ptr %z, align 8
  %dispatch.isnull51 = icmp eq ptr %z48, null
  br i1 %dispatch.isnull51, label %dispatch.abort50, label %dispatch.ok49

dispatch.abort43:                                 ; preds = %dispatch.ok34
  call void @abort()
  unreachable

dispatch.ok49:                                    ; preds = %dispatch.ok42
  %vtable.ptr52 = load ptr, ptr %z48, align 8
  %method.ptr.addr53 = getelementptr ptr, ptr %vtable.ptr52, i64 9
  %method.ptr54 = load ptr, ptr %method.ptr.addr53, align 8
  %z55 = load ptr, ptr %z, align 8
  %dispatch.isnull58 = icmp eq ptr %z55, null
  br i1 %dispatch.isnull58, label %dispatch.abort57, label %dispatch.ok56

dispatch.abort50:                                 ; preds = %dispatch.ok42
  call void @abort()
  unreachable

dispatch.ok56:                                    ; preds = %dispatch.ok49
  %vtable.ptr59 = load ptr, ptr %z55, align 8
  %method.ptr.addr60 = getelementptr ptr, ptr %vtable.ptr59, i64 7
  %method.ptr61 = load ptr, ptr %method.ptr.addr60, align 8
  %dispatch.result62 = call i32 %method.ptr61(ptr %z55, ptr @.str.14536993150049646506)
  %dispatch.result63 = call ptr %method.ptr54(ptr %z48, i32 %dispatch.result62)
  %dispatch.result64 = call ptr %method.ptr47(ptr %self41, ptr %dispatch.result63)
  %self65 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull68 = icmp eq ptr %self65, null
  br i1 %dispatch.isnull68, label %dispatch.abort67, label %dispatch.ok66

dispatch.abort57:                                 ; preds = %dispatch.ok49
  call void @abort()
  unreachable

dispatch.ok66:                                    ; preds = %dispatch.ok56
  %vtable.ptr69 = load ptr, ptr %self65, align 8
  %method.ptr.addr70 = getelementptr ptr, ptr %vtable.ptr69, i64 5
  %method.ptr71 = load ptr, ptr %method.ptr.addr70, align 8
  %dispatch.result72 = call ptr %method.ptr71(ptr %self65, ptr @.str.18400681194753865968)
  ret ptr %dispatch.result72

dispatch.abort67:                                 ; preds = %dispatch.ok56
  call void @abort()
  unreachable
}

define void @_ZN3A2IC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.A2I, ptr %this, i32 0, i32 0
  call void @_ZN6ObjectC2Ev(ptr %parent.subobject)
  store ptr @_ZTV3A2I, ptr %this, align 8
  ret void
}

define ptr @A2I.new() {
entry:
  %0 = call ptr @malloc(i64 8)
  call void @_ZN3A2IC2Ev(ptr %0)
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
