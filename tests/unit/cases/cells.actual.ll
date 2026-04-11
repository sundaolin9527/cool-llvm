; ModuleID = 'main_module'
source_filename = "main_module"

%struct.__cxxabiv1.__class_type_info = type { ptr, ptr }
%struct.__cxxabiv1.__si_class_type_info = type { ptr, ptr, ptr }
%class.Int = type { %class.Object.0, i32, [4 x i8] }
%class.Object.0 = type { ptr }
%class.Bool = type { %class.Object.0, i1, [7 x i8] }
%class.String = type { %class.Object.0, ptr, i32, [4 x i8], i32, [4 x i8] }
%class.IO.1 = type { %class.Object.0 }
%class.CellularAutomaton = type { %class.IO.1, ptr }
%class.Main = type { %class.Object.0, ptr }

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
@_ZTS17CellularAutomaton = linkonce_odr constant [20 x i8] c"17CellularAutomaton\00", align 1
@_ZTI17CellularAutomaton = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS17CellularAutomaton, ptr @_ZTI2IO }, align 8
@_ZTV17CellularAutomaton = linkonce_odr constant [17 x ptr] [ptr null, ptr @_ZTI17CellularAutomaton, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @CellularAutomaton.init, ptr @CellularAutomaton.print, ptr @CellularAutomaton.num_cells, ptr @CellularAutomaton.cell, ptr @CellularAutomaton.cell_left_neighbor, ptr @CellularAutomaton.cell_right_neighbor, ptr @CellularAutomaton.cell_at_next_evolution, ptr @CellularAutomaton.evolve], align 8
@_ZTS4Main = linkonce_odr constant [6 x i8] c"4Main\00", align 1
@_ZTI4Main = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Main, ptr @_ZTI6Object }, align 8
@_ZTV4Main = linkonce_odr constant [6 x ptr] [ptr null, ptr @_ZTI4Main, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @Main.main], align 8
@.str.18400681194753865968 = private constant [2 x i8] c"\0A\00"
@.str.12043374440167815914 = private constant [2 x i8] c"X\00"
@.str.15099569138734304119 = private constant [2 x i8] c".\00"
@.str.9445756667145501826 = private constant [20 x i8] c"         X         \00"

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

define ptr @CellularAutomaton.init(ptr %this, ptr %map) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %map.addr = alloca ptr, align 8
  store ptr %map, ptr %map.addr, align 8
  %map1 = load ptr, ptr %map.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %population_map.addr = getelementptr i8, ptr %self, i32 8
  store ptr %map1, ptr %population_map.addr, align 8
  %self2 = load ptr, ptr %this.addr, align 8
  ret ptr %self2
}

define ptr @CellularAutomaton.print(ptr %this) {
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
  %self1 = load ptr, ptr %this.addr, align 8
  %population_map.addr = getelementptr i8, ptr %self1, i32 8
  %population_map = load ptr, ptr %population_map.addr, align 8
  %dispatch.isnull4 = icmp eq ptr %population_map, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %dispatch.result = call ptr @String_concat(ptr %population_map, ptr @.str.18400681194753865968)
  %dispatch.result5 = call ptr %method.ptr(ptr %self, ptr %dispatch.result)
  %self6 = load ptr, ptr %this.addr, align 8
  ret ptr %self6

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable
}

define i32 @CellularAutomaton.num_cells(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %population_map.addr = getelementptr i8, ptr %self, i32 8
  %population_map = load ptr, ptr %population_map.addr, align 8
  %dispatch.isnull = icmp eq ptr %population_map, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %dispatch.result = call i32 @String_length(ptr %population_map)
  ret i32 %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @CellularAutomaton.cell(ptr %this, i32 %position) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %position.addr = alloca i32, align 4
  store i32 %position, ptr %position.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %population_map.addr = getelementptr i8, ptr %self, i32 8
  %population_map = load ptr, ptr %population_map.addr, align 8
  %dispatch.isnull = icmp eq ptr %population_map, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %position1 = load i32, ptr %position.addr, align 4
  %dispatch.result = call ptr @String_substr(ptr %population_map, i32 %position1, i32 1)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @CellularAutomaton.cell_left_neighbor(ptr %this, i32 %position) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %position.addr = alloca i32, align 4
  store i32 %position, ptr %position.addr, align 4
  %position1 = load i32, ptr %position.addr, align 4
  %eqtmp = icmp eq i32 %position1, 0
  br i1 %eqtmp, label %then, label %else

then:                                             ; preds = %entry
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %then
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 12
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %self2 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull5 = icmp eq ptr %self2, null
  br i1 %dispatch.isnull5, label %dispatch.abort4, label %dispatch.ok3

dispatch.abort:                                   ; preds = %then
  call void @abort()
  unreachable

dispatch.ok3:                                     ; preds = %dispatch.ok
  %vtable.ptr6 = load ptr, ptr %self2, align 8
  %method.ptr.addr7 = getelementptr ptr, ptr %vtable.ptr6, i64 11
  %method.ptr8 = load ptr, ptr %method.ptr.addr7, align 8
  %dispatch.result = call i32 %method.ptr8(ptr %self2)
  %subtmp = sub i32 %dispatch.result, 1
  %dispatch.result9 = call ptr %method.ptr(ptr %self, i32 %subtmp)
  br label %ifcont

dispatch.abort4:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

else:                                             ; preds = %entry
  %self10 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull13 = icmp eq ptr %self10, null
  br i1 %dispatch.isnull13, label %dispatch.abort12, label %dispatch.ok11

dispatch.ok11:                                    ; preds = %else
  %vtable.ptr14 = load ptr, ptr %self10, align 8
  %method.ptr.addr15 = getelementptr ptr, ptr %vtable.ptr14, i64 12
  %method.ptr16 = load ptr, ptr %method.ptr.addr15, align 8
  %position17 = load i32, ptr %position.addr, align 4
  %subtmp18 = sub i32 %position17, 1
  %dispatch.result19 = call ptr %method.ptr16(ptr %self10, i32 %subtmp18)
  br label %ifcont

dispatch.abort12:                                 ; preds = %else
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok11, %dispatch.ok3
  %cond_result = phi ptr [ %dispatch.result9, %dispatch.ok3 ], [ %dispatch.result19, %dispatch.ok11 ]
  ret ptr %cond_result
}

define ptr @CellularAutomaton.cell_right_neighbor(ptr %this, i32 %position) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %position.addr = alloca i32, align 4
  store i32 %position, ptr %position.addr, align 4
  %position1 = load i32, ptr %position.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 11
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call i32 %method.ptr(ptr %self)
  %subtmp = sub i32 %dispatch.result, 1
  %eqtmp = icmp eq i32 %position1, %subtmp
  br i1 %eqtmp, label %then, label %else

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

then:                                             ; preds = %dispatch.ok
  %self2 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull5 = icmp eq ptr %self2, null
  br i1 %dispatch.isnull5, label %dispatch.abort4, label %dispatch.ok3

dispatch.ok3:                                     ; preds = %then
  %vtable.ptr6 = load ptr, ptr %self2, align 8
  %method.ptr.addr7 = getelementptr ptr, ptr %vtable.ptr6, i64 12
  %method.ptr8 = load ptr, ptr %method.ptr.addr7, align 8
  %dispatch.result9 = call ptr %method.ptr8(ptr %self2, i32 0)
  br label %ifcont

dispatch.abort4:                                  ; preds = %then
  call void @abort()
  unreachable

else:                                             ; preds = %dispatch.ok
  %self10 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull13 = icmp eq ptr %self10, null
  br i1 %dispatch.isnull13, label %dispatch.abort12, label %dispatch.ok11

dispatch.ok11:                                    ; preds = %else
  %vtable.ptr14 = load ptr, ptr %self10, align 8
  %method.ptr.addr15 = getelementptr ptr, ptr %vtable.ptr14, i64 12
  %method.ptr16 = load ptr, ptr %method.ptr.addr15, align 8
  %position17 = load i32, ptr %position.addr, align 4
  %addtmp = add i32 %position17, 1
  %dispatch.result18 = call ptr %method.ptr16(ptr %self10, i32 %addtmp)
  br label %ifcont

dispatch.abort12:                                 ; preds = %else
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok11, %dispatch.ok3
  %cond_result = phi ptr [ %dispatch.result9, %dispatch.ok3 ], [ %dispatch.result18, %dispatch.ok11 ]
  ret ptr %cond_result
}

define ptr @CellularAutomaton.cell_at_next_evolution(ptr %this, i32 %position) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %position.addr = alloca i32, align 4
  store i32 %position, ptr %position.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 12
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %position1 = load i32, ptr %position.addr, align 4
  %dispatch.result = call ptr %method.ptr(ptr %self, i32 %position1)
  %eqtmp = call i1 @String_equals(ptr %dispatch.result, ptr @.str.12043374440167815914)
  br i1 %eqtmp, label %then, label %else

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

then:                                             ; preds = %dispatch.ok
  br label %ifcont

else:                                             ; preds = %dispatch.ok
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %cond_result = phi i32 [ 1, %then ], [ 0, %else ]
  %self2 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull5 = icmp eq ptr %self2, null
  br i1 %dispatch.isnull5, label %dispatch.abort4, label %dispatch.ok3

dispatch.ok3:                                     ; preds = %ifcont
  %vtable.ptr6 = load ptr, ptr %self2, align 8
  %method.ptr.addr7 = getelementptr ptr, ptr %vtable.ptr6, i64 13
  %method.ptr8 = load ptr, ptr %method.ptr.addr7, align 8
  %position9 = load i32, ptr %position.addr, align 4
  %dispatch.result10 = call ptr %method.ptr8(ptr %self2, i32 %position9)
  %eqtmp11 = call i1 @String_equals(ptr %dispatch.result10, ptr @.str.12043374440167815914)
  br i1 %eqtmp11, label %then12, label %else13

dispatch.abort4:                                  ; preds = %ifcont
  call void @abort()
  unreachable

then12:                                           ; preds = %dispatch.ok3
  br label %ifcont14

else13:                                           ; preds = %dispatch.ok3
  br label %ifcont14

ifcont14:                                         ; preds = %else13, %then12
  %cond_result15 = phi i32 [ 1, %then12 ], [ 0, %else13 ]
  %addtmp = add i32 %cond_result, %cond_result15
  %self16 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull19 = icmp eq ptr %self16, null
  br i1 %dispatch.isnull19, label %dispatch.abort18, label %dispatch.ok17

dispatch.ok17:                                    ; preds = %ifcont14
  %vtable.ptr20 = load ptr, ptr %self16, align 8
  %method.ptr.addr21 = getelementptr ptr, ptr %vtable.ptr20, i64 14
  %method.ptr22 = load ptr, ptr %method.ptr.addr21, align 8
  %position23 = load i32, ptr %position.addr, align 4
  %dispatch.result24 = call ptr %method.ptr22(ptr %self16, i32 %position23)
  %eqtmp25 = call i1 @String_equals(ptr %dispatch.result24, ptr @.str.12043374440167815914)
  br i1 %eqtmp25, label %then26, label %else27

dispatch.abort18:                                 ; preds = %ifcont14
  call void @abort()
  unreachable

then26:                                           ; preds = %dispatch.ok17
  br label %ifcont28

else27:                                           ; preds = %dispatch.ok17
  br label %ifcont28

ifcont28:                                         ; preds = %else27, %then26
  %cond_result29 = phi i32 [ 1, %then26 ], [ 0, %else27 ]
  %addtmp30 = add i32 %addtmp, %cond_result29
  %eqtmp31 = icmp eq i32 %addtmp30, 1
  br i1 %eqtmp31, label %then32, label %else33

then32:                                           ; preds = %ifcont28
  br label %ifcont34

else33:                                           ; preds = %ifcont28
  br label %ifcont34

ifcont34:                                         ; preds = %else33, %then32
  %cond_result35 = phi ptr [ @.str.12043374440167815914, %then32 ], [ @.str.15099569138734304119, %else33 ]
  ret ptr %cond_result35
}

define ptr @CellularAutomaton.evolve(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %position = alloca i32, align 4
  store i32 0, ptr %position, align 4
  %num = alloca i32, align 4
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 11
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call i32 %method.ptr(ptr %self)
  store i32 %dispatch.result, ptr %num, align 4
  %temp = alloca ptr, align 8
  store ptr @.str.const.6142509188972423790, ptr %temp, align 8
  br label %loop.cond

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

loop.cond:                                        ; preds = %dispatch.ok8, %dispatch.ok
  %position1 = load i32, ptr %position, align 4
  %num2 = load i32, ptr %num, align 4
  %cmptmp = icmp slt i32 %position1, %num2
  br i1 %cmptmp, label %loop.body, label %loop.after

loop.body:                                        ; preds = %loop.cond
  %temp3 = load ptr, ptr %temp, align 8
  %dispatch.isnull6 = icmp eq ptr %temp3, null
  br i1 %dispatch.isnull6, label %dispatch.abort5, label %dispatch.ok4

loop.after:                                       ; preds = %loop.cond
  %temp18 = load ptr, ptr %temp, align 8
  %self19 = load ptr, ptr %this.addr, align 8
  %population_map.addr = getelementptr i8, ptr %self19, i32 8
  store ptr %temp18, ptr %population_map.addr, align 8
  %self20 = load ptr, ptr %this.addr, align 8
  ret ptr %self20

dispatch.ok4:                                     ; preds = %loop.body
  %self7 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull10 = icmp eq ptr %self7, null
  br i1 %dispatch.isnull10, label %dispatch.abort9, label %dispatch.ok8

dispatch.abort5:                                  ; preds = %loop.body
  call void @abort()
  unreachable

dispatch.ok8:                                     ; preds = %dispatch.ok4
  %vtable.ptr11 = load ptr, ptr %self7, align 8
  %method.ptr.addr12 = getelementptr ptr, ptr %vtable.ptr11, i64 15
  %method.ptr13 = load ptr, ptr %method.ptr.addr12, align 8
  %position14 = load i32, ptr %position, align 4
  %dispatch.result15 = call ptr %method.ptr13(ptr %self7, i32 %position14)
  %dispatch.result16 = call ptr @String_concat(ptr %temp3, ptr %dispatch.result15)
  store ptr %dispatch.result16, ptr %temp, align 8
  %position17 = load i32, ptr %position, align 4
  %addtmp = add i32 %position17, 1
  store i32 %addtmp, ptr %position, align 4
  br label %loop.cond

dispatch.abort9:                                  ; preds = %dispatch.ok4
  call void @abort()
  unreachable
}

define ptr @Main.main(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %CellularAutomaton.newtmp = call ptr @CellularAutomaton.new()
  %dispatch.isnull = icmp eq ptr %CellularAutomaton.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %CellularAutomaton.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 9
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %CellularAutomaton.newtmp, ptr @.str.9445756667145501826)
  %self = load ptr, ptr %this.addr, align 8
  %cells.addr = getelementptr i8, ptr %self, i32 8
  store ptr %dispatch.result, ptr %cells.addr, align 8
  %self1 = load ptr, ptr %this.addr, align 8
  %cells.addr2 = getelementptr i8, ptr %self1, i32 8
  %cells = load ptr, ptr %cells.addr2, align 8
  %dispatch.isnull5 = icmp eq ptr %cells, null
  br i1 %dispatch.isnull5, label %dispatch.abort4, label %dispatch.ok3

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok3:                                     ; preds = %dispatch.ok
  %vtable.ptr6 = load ptr, ptr %cells, align 8
  %method.ptr.addr7 = getelementptr ptr, ptr %vtable.ptr6, i64 10
  %method.ptr8 = load ptr, ptr %method.ptr.addr7, align 8
  %dispatch.result9 = call ptr %method.ptr8(ptr %cells)
  %countdown = alloca i32, align 4
  store i32 20, ptr %countdown, align 4
  br label %loop.cond

dispatch.abort4:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

loop.cond:                                        ; preds = %dispatch.ok24, %dispatch.ok3
  %countdown10 = load i32, ptr %countdown, align 4
  %cmptmp = icmp slt i32 0, %countdown10
  br i1 %cmptmp, label %loop.body, label %loop.after

loop.body:                                        ; preds = %loop.cond
  %self11 = load ptr, ptr %this.addr, align 8
  %cells.addr12 = getelementptr i8, ptr %self11, i32 8
  %cells13 = load ptr, ptr %cells.addr12, align 8
  %dispatch.isnull16 = icmp eq ptr %cells13, null
  br i1 %dispatch.isnull16, label %dispatch.abort15, label %dispatch.ok14

loop.after:                                       ; preds = %loop.cond
  %self32 = load ptr, ptr %this.addr, align 8
  ret ptr %self32

dispatch.ok14:                                    ; preds = %loop.body
  %vtable.ptr17 = load ptr, ptr %cells13, align 8
  %method.ptr.addr18 = getelementptr ptr, ptr %vtable.ptr17, i64 16
  %method.ptr19 = load ptr, ptr %method.ptr.addr18, align 8
  %dispatch.result20 = call ptr %method.ptr19(ptr %cells13)
  %self21 = load ptr, ptr %this.addr, align 8
  %cells.addr22 = getelementptr i8, ptr %self21, i32 8
  %cells23 = load ptr, ptr %cells.addr22, align 8
  %dispatch.isnull26 = icmp eq ptr %cells23, null
  br i1 %dispatch.isnull26, label %dispatch.abort25, label %dispatch.ok24

dispatch.abort15:                                 ; preds = %loop.body
  call void @abort()
  unreachable

dispatch.ok24:                                    ; preds = %dispatch.ok14
  %vtable.ptr27 = load ptr, ptr %cells23, align 8
  %method.ptr.addr28 = getelementptr ptr, ptr %vtable.ptr27, i64 10
  %method.ptr29 = load ptr, ptr %method.ptr.addr28, align 8
  %dispatch.result30 = call ptr %method.ptr29(ptr %cells23)
  %countdown31 = load i32, ptr %countdown, align 4
  %subtmp = sub i32 %countdown31, 1
  store i32 %subtmp, ptr %countdown, align 4
  br label %loop.cond

dispatch.abort25:                                 ; preds = %dispatch.ok14
  call void @abort()
  unreachable
}

define void @_ZN17CellularAutomatonC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.CellularAutomaton, ptr %this, i32 0, i32 0
  call void @_ZN2IOC2Ev(ptr %parent.subobject)
  store ptr @_ZTV17CellularAutomaton, ptr %this, align 8
  %population_map.addr.byte = getelementptr i8, ptr %this, i64 8
  store ptr @.str.const.6142509188972423790, ptr %population_map.addr.byte, align 8
  ret void
}

define ptr @CellularAutomaton.new() {
entry:
  %0 = call ptr @malloc(i64 16)
  call void @_ZN17CellularAutomatonC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN4MainC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Main, ptr %this, i32 0, i32 0
  call void @_ZN6ObjectC2Ev(ptr %parent.subobject)
  store ptr @_ZTV4Main, ptr %this, align 8
  %cells.addr.byte = getelementptr i8, ptr %this, i64 8
  store ptr null, ptr %cells.addr.byte, align 8
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
