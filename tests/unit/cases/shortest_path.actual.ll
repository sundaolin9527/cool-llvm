; ModuleID = 'main_module'
source_filename = "main_module"

%struct.__cxxabiv1.__class_type_info = type { ptr, ptr }
%struct.__cxxabiv1.__si_class_type_info = type { ptr, ptr, ptr }
%class.Int = type { %class.Object.0, i32, [4 x i8] }
%class.Object.0 = type { ptr }
%class.Bool = type { %class.Object.0, i1, [7 x i8] }
%class.String = type { %class.Object.0, ptr, i32, [4 x i8], i32, [4 x i8] }
%class.IO.1 = type { %class.Object.0 }
%class.EdgeList = type { %class.Object.0 }
%class.EdgeCons = type { %class.EdgeList, i32, [4 x i8], i32, [4 x i8], i32, [4 x i8], ptr }
%class.ShortestPath = type { %class.IO.1, i32, [4 x i8], i32, [4 x i8], i32, [4 x i8], i32, [4 x i8], i32, [4 x i8], i32, [4 x i8], i32, [4 x i8], i32, [4 x i8], i32, [4 x i8], i32, [4 x i8], i32, [4 x i8] }
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
@_ZTS8EdgeList = linkonce_odr constant [10 x i8] c"8EdgeList\00", align 1
@_ZTI8EdgeList = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS8EdgeList, ptr @_ZTI6Object }, align 8
@_ZTV8EdgeList = linkonce_odr constant [6 x ptr] [ptr null, ptr @_ZTI8EdgeList, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @EdgeList.relax_all], align 8
@_ZTS8EdgeCons = linkonce_odr constant [10 x i8] c"8EdgeCons\00", align 1
@_ZTI8EdgeCons = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS8EdgeCons, ptr @_ZTI8EdgeList }, align 8
@_ZTV8EdgeCons = linkonce_odr constant [7 x ptr] [ptr null, ptr @_ZTI8EdgeCons, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @EdgeCons.relax_all, ptr @EdgeCons.init], align 8
@_ZTS12ShortestPath = linkonce_odr constant [15 x i8] c"12ShortestPath\00", align 1
@_ZTI12ShortestPath = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS12ShortestPath, ptr @_ZTI2IO }, align 8
@_ZTV12ShortestPath = linkonce_odr constant [19 x ptr] [ptr null, ptr @_ZTI12ShortestPath, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @ShortestPath.init_source, ptr @ShortestPath.build_edges, ptr @ShortestPath.distance_of, ptr @ShortestPath.set_distance, ptr @ShortestPath.print_value, ptr @ShortestPath.print_one, ptr @ShortestPath.print_all_distances, ptr @ShortestPath.relax, ptr @ShortestPath.run_rounds, ptr @ShortestPath.run], align 8
@_ZTS4Main = linkonce_odr constant [6 x i8] c"4Main\00", align 1
@_ZTI4Main = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Main, ptr @_ZTI2IO }, align 8
@_ZTV4Main = linkonce_odr constant [10 x ptr] [ptr null, ptr @_ZTI4Main, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Main.main], align 8
@.str.8067682431658732599 = private constant [4 x i8] c"INF\00"
@.str.16441386196195795854 = private constant [3 x i8] c"d[\00"
@.str.7910161676286232157 = private constant [5 x i8] c"] = \00"
@.str.18400681194753865968 = private constant [2 x i8] c"\0A\00"
@.str.14124547106008738548 = private constant [7 x i8] c"relax \00"
@.str.12644676059775988466 = private constant [5 x i8] c" -> \00"
@.str.3704242786489878993 = private constant [5 x i8] c" (w=\00"
@.str.13531825353272122674 = private constant [8 x i8] c"): old=\00"
@.str.11028047508597618019 = private constant [13 x i8] c", candidate=\00"
@.str.13680097196363203565 = private constant [3 x i8] c", \00"
@.str.9544385186769949644 = private constant [7 x i8] c"update\00"
@.str.10550092050098466617 = private constant [5 x i8] c"keep\00"
@.str.1521657259370731167 = private constant [7 x i8] c"round \00"
@.str.5656352819608236931 = private constant [13 x i8] c"after round \00"
@.str.3946395368134810345 = private constant [32 x i8] c"graph: 10 vertices, source = 1\0A\00"
@.str.14434693932068933153 = private constant [19 x i8] c"initial distances\0A\00"
@.str.13656733524725639206 = private constant [14 x i8] c"final answer\0A\00"
@.str.14987737716956691062 = private constant [19 x i8] c"shortest(1, 10) = \00"

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

define ptr @EdgeList.relax_all(ptr %this, ptr %solver) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %solver.addr = alloca ptr, align 8
  store ptr %solver, ptr %solver.addr, align 8
  ret ptr null
}

define ptr @EdgeCons.init(ptr %this, i32 %from, i32 %to, i32 %weight, ptr %rest) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %from.addr = alloca i32, align 4
  store i32 %from, ptr %from.addr, align 4
  %to.addr = alloca i32, align 4
  store i32 %to, ptr %to.addr, align 4
  %weight.addr = alloca i32, align 4
  store i32 %weight, ptr %weight.addr, align 4
  %rest.addr = alloca ptr, align 8
  store ptr %rest, ptr %rest.addr, align 8
  %from1 = load i32, ptr %from.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %from_v.addr = getelementptr i8, ptr %self, i32 8
  store i32 %from1, ptr %from_v.addr, align 4
  %to2 = load i32, ptr %to.addr, align 4
  %self3 = load ptr, ptr %this.addr, align 8
  %to_v.addr = getelementptr i8, ptr %self3, i32 16
  store i32 %to2, ptr %to_v.addr, align 4
  %weight4 = load i32, ptr %weight.addr, align 4
  %self5 = load ptr, ptr %this.addr, align 8
  %weight_v.addr = getelementptr i8, ptr %self5, i32 24
  store i32 %weight4, ptr %weight_v.addr, align 4
  %rest6 = load ptr, ptr %rest.addr, align 8
  %self7 = load ptr, ptr %this.addr, align 8
  %rest_v.addr = getelementptr i8, ptr %self7, i32 32
  store ptr %rest6, ptr %rest_v.addr, align 8
  %self8 = load ptr, ptr %this.addr, align 8
  ret ptr %self8
}

define ptr @EdgeCons.relax_all(ptr %this, ptr %solver) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %solver.addr = alloca ptr, align 8
  store ptr %solver, ptr %solver.addr, align 8
  %solver1 = load ptr, ptr %solver.addr, align 8
  %dispatch.isnull = icmp eq ptr %solver1, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %solver1, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 16
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %from_v.addr = getelementptr i8, ptr %self, i32 8
  %from_v = load i32, ptr %from_v.addr, align 4
  %self2 = load ptr, ptr %this.addr, align 8
  %to_v.addr = getelementptr i8, ptr %self2, i32 16
  %to_v = load i32, ptr %to_v.addr, align 4
  %self3 = load ptr, ptr %this.addr, align 8
  %weight_v.addr = getelementptr i8, ptr %self3, i32 24
  %weight_v = load i32, ptr %weight_v.addr, align 4
  %dispatch.result = call ptr %method.ptr(ptr %solver1, i32 %from_v, i32 %to_v, i32 %weight_v)
  %self4 = load ptr, ptr %this.addr, align 8
  %rest_v.addr = getelementptr i8, ptr %self4, i32 32
  %rest_v = load ptr, ptr %rest_v.addr, align 8
  %dispatch.isnull7 = icmp eq ptr %rest_v, null
  br i1 %dispatch.isnull7, label %dispatch.abort6, label %dispatch.ok5

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok5:                                     ; preds = %dispatch.ok
  %vtable.ptr8 = load ptr, ptr %rest_v, align 8
  %method.ptr.addr9 = getelementptr ptr, ptr %vtable.ptr8, i64 5
  %method.ptr10 = load ptr, ptr %method.ptr.addr9, align 8
  %solver11 = load ptr, ptr %solver.addr, align 8
  %dispatch.result12 = call ptr %method.ptr10(ptr %rest_v, ptr %solver11)
  ret ptr %dispatch.result12

dispatch.abort6:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable
}

define ptr @ShortestPath.init_source(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %d1.addr = getelementptr i8, ptr %self, i32 16
  store i32 0, ptr %d1.addr, align 4
  %self1 = load ptr, ptr %this.addr, align 8
  %inf.addr = getelementptr i8, ptr %self1, i32 8
  %inf = load i32, ptr %inf.addr, align 4
  %self2 = load ptr, ptr %this.addr, align 8
  %d2.addr = getelementptr i8, ptr %self2, i32 24
  store i32 %inf, ptr %d2.addr, align 4
  %self3 = load ptr, ptr %this.addr, align 8
  %inf.addr4 = getelementptr i8, ptr %self3, i32 8
  %inf5 = load i32, ptr %inf.addr4, align 4
  %self6 = load ptr, ptr %this.addr, align 8
  %d3.addr = getelementptr i8, ptr %self6, i32 32
  store i32 %inf5, ptr %d3.addr, align 4
  %self7 = load ptr, ptr %this.addr, align 8
  %inf.addr8 = getelementptr i8, ptr %self7, i32 8
  %inf9 = load i32, ptr %inf.addr8, align 4
  %self10 = load ptr, ptr %this.addr, align 8
  %d4.addr = getelementptr i8, ptr %self10, i32 40
  store i32 %inf9, ptr %d4.addr, align 4
  %self11 = load ptr, ptr %this.addr, align 8
  %inf.addr12 = getelementptr i8, ptr %self11, i32 8
  %inf13 = load i32, ptr %inf.addr12, align 4
  %self14 = load ptr, ptr %this.addr, align 8
  %d5.addr = getelementptr i8, ptr %self14, i32 48
  store i32 %inf13, ptr %d5.addr, align 4
  %self15 = load ptr, ptr %this.addr, align 8
  %inf.addr16 = getelementptr i8, ptr %self15, i32 8
  %inf17 = load i32, ptr %inf.addr16, align 4
  %self18 = load ptr, ptr %this.addr, align 8
  %d6.addr = getelementptr i8, ptr %self18, i32 56
  store i32 %inf17, ptr %d6.addr, align 4
  %self19 = load ptr, ptr %this.addr, align 8
  %inf.addr20 = getelementptr i8, ptr %self19, i32 8
  %inf21 = load i32, ptr %inf.addr20, align 4
  %self22 = load ptr, ptr %this.addr, align 8
  %d7.addr = getelementptr i8, ptr %self22, i32 64
  store i32 %inf21, ptr %d7.addr, align 4
  %self23 = load ptr, ptr %this.addr, align 8
  %inf.addr24 = getelementptr i8, ptr %self23, i32 8
  %inf25 = load i32, ptr %inf.addr24, align 4
  %self26 = load ptr, ptr %this.addr, align 8
  %d8.addr = getelementptr i8, ptr %self26, i32 72
  store i32 %inf25, ptr %d8.addr, align 4
  %self27 = load ptr, ptr %this.addr, align 8
  %inf.addr28 = getelementptr i8, ptr %self27, i32 8
  %inf29 = load i32, ptr %inf.addr28, align 4
  %self30 = load ptr, ptr %this.addr, align 8
  %d9.addr = getelementptr i8, ptr %self30, i32 80
  store i32 %inf29, ptr %d9.addr, align 4
  %self31 = load ptr, ptr %this.addr, align 8
  %inf.addr32 = getelementptr i8, ptr %self31, i32 8
  %inf33 = load i32, ptr %inf.addr32, align 4
  %self34 = load ptr, ptr %this.addr, align 8
  %d10.addr = getelementptr i8, ptr %self34, i32 88
  store i32 %inf33, ptr %d10.addr, align 4
  %self35 = load ptr, ptr %this.addr, align 8
  ret ptr %self35
}

define ptr @ShortestPath.build_edges(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %EdgeCons.newtmp = call ptr @EdgeCons.new()
  %dispatch.isnull = icmp eq ptr %EdgeCons.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %EdgeCons.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 6
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %EdgeCons.newtmp1 = call ptr @EdgeCons.new()
  %dispatch.isnull4 = icmp eq ptr %EdgeCons.newtmp1, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %EdgeCons.newtmp1, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 6
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %EdgeCons.newtmp8 = call ptr @EdgeCons.new()
  %dispatch.isnull11 = icmp eq ptr %EdgeCons.newtmp8, null
  br i1 %dispatch.isnull11, label %dispatch.abort10, label %dispatch.ok9

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok9:                                     ; preds = %dispatch.ok2
  %vtable.ptr12 = load ptr, ptr %EdgeCons.newtmp8, align 8
  %method.ptr.addr13 = getelementptr ptr, ptr %vtable.ptr12, i64 6
  %method.ptr14 = load ptr, ptr %method.ptr.addr13, align 8
  %EdgeCons.newtmp15 = call ptr @EdgeCons.new()
  %dispatch.isnull18 = icmp eq ptr %EdgeCons.newtmp15, null
  br i1 %dispatch.isnull18, label %dispatch.abort17, label %dispatch.ok16

dispatch.abort10:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable

dispatch.ok16:                                    ; preds = %dispatch.ok9
  %vtable.ptr19 = load ptr, ptr %EdgeCons.newtmp15, align 8
  %method.ptr.addr20 = getelementptr ptr, ptr %vtable.ptr19, i64 6
  %method.ptr21 = load ptr, ptr %method.ptr.addr20, align 8
  %EdgeCons.newtmp22 = call ptr @EdgeCons.new()
  %dispatch.isnull25 = icmp eq ptr %EdgeCons.newtmp22, null
  br i1 %dispatch.isnull25, label %dispatch.abort24, label %dispatch.ok23

dispatch.abort17:                                 ; preds = %dispatch.ok9
  call void @abort()
  unreachable

dispatch.ok23:                                    ; preds = %dispatch.ok16
  %vtable.ptr26 = load ptr, ptr %EdgeCons.newtmp22, align 8
  %method.ptr.addr27 = getelementptr ptr, ptr %vtable.ptr26, i64 6
  %method.ptr28 = load ptr, ptr %method.ptr.addr27, align 8
  %EdgeCons.newtmp29 = call ptr @EdgeCons.new()
  %dispatch.isnull32 = icmp eq ptr %EdgeCons.newtmp29, null
  br i1 %dispatch.isnull32, label %dispatch.abort31, label %dispatch.ok30

dispatch.abort24:                                 ; preds = %dispatch.ok16
  call void @abort()
  unreachable

dispatch.ok30:                                    ; preds = %dispatch.ok23
  %vtable.ptr33 = load ptr, ptr %EdgeCons.newtmp29, align 8
  %method.ptr.addr34 = getelementptr ptr, ptr %vtable.ptr33, i64 6
  %method.ptr35 = load ptr, ptr %method.ptr.addr34, align 8
  %EdgeCons.newtmp36 = call ptr @EdgeCons.new()
  %dispatch.isnull39 = icmp eq ptr %EdgeCons.newtmp36, null
  br i1 %dispatch.isnull39, label %dispatch.abort38, label %dispatch.ok37

dispatch.abort31:                                 ; preds = %dispatch.ok23
  call void @abort()
  unreachable

dispatch.ok37:                                    ; preds = %dispatch.ok30
  %vtable.ptr40 = load ptr, ptr %EdgeCons.newtmp36, align 8
  %method.ptr.addr41 = getelementptr ptr, ptr %vtable.ptr40, i64 6
  %method.ptr42 = load ptr, ptr %method.ptr.addr41, align 8
  %EdgeCons.newtmp43 = call ptr @EdgeCons.new()
  %dispatch.isnull46 = icmp eq ptr %EdgeCons.newtmp43, null
  br i1 %dispatch.isnull46, label %dispatch.abort45, label %dispatch.ok44

dispatch.abort38:                                 ; preds = %dispatch.ok30
  call void @abort()
  unreachable

dispatch.ok44:                                    ; preds = %dispatch.ok37
  %vtable.ptr47 = load ptr, ptr %EdgeCons.newtmp43, align 8
  %method.ptr.addr48 = getelementptr ptr, ptr %vtable.ptr47, i64 6
  %method.ptr49 = load ptr, ptr %method.ptr.addr48, align 8
  %EdgeCons.newtmp50 = call ptr @EdgeCons.new()
  %dispatch.isnull53 = icmp eq ptr %EdgeCons.newtmp50, null
  br i1 %dispatch.isnull53, label %dispatch.abort52, label %dispatch.ok51

dispatch.abort45:                                 ; preds = %dispatch.ok37
  call void @abort()
  unreachable

dispatch.ok51:                                    ; preds = %dispatch.ok44
  %vtable.ptr54 = load ptr, ptr %EdgeCons.newtmp50, align 8
  %method.ptr.addr55 = getelementptr ptr, ptr %vtable.ptr54, i64 6
  %method.ptr56 = load ptr, ptr %method.ptr.addr55, align 8
  %EdgeCons.newtmp57 = call ptr @EdgeCons.new()
  %dispatch.isnull60 = icmp eq ptr %EdgeCons.newtmp57, null
  br i1 %dispatch.isnull60, label %dispatch.abort59, label %dispatch.ok58

dispatch.abort52:                                 ; preds = %dispatch.ok44
  call void @abort()
  unreachable

dispatch.ok58:                                    ; preds = %dispatch.ok51
  %vtable.ptr61 = load ptr, ptr %EdgeCons.newtmp57, align 8
  %method.ptr.addr62 = getelementptr ptr, ptr %vtable.ptr61, i64 6
  %method.ptr63 = load ptr, ptr %method.ptr.addr62, align 8
  %EdgeCons.newtmp64 = call ptr @EdgeCons.new()
  %dispatch.isnull67 = icmp eq ptr %EdgeCons.newtmp64, null
  br i1 %dispatch.isnull67, label %dispatch.abort66, label %dispatch.ok65

dispatch.abort59:                                 ; preds = %dispatch.ok51
  call void @abort()
  unreachable

dispatch.ok65:                                    ; preds = %dispatch.ok58
  %vtable.ptr68 = load ptr, ptr %EdgeCons.newtmp64, align 8
  %method.ptr.addr69 = getelementptr ptr, ptr %vtable.ptr68, i64 6
  %method.ptr70 = load ptr, ptr %method.ptr.addr69, align 8
  %EdgeCons.newtmp71 = call ptr @EdgeCons.new()
  %dispatch.isnull74 = icmp eq ptr %EdgeCons.newtmp71, null
  br i1 %dispatch.isnull74, label %dispatch.abort73, label %dispatch.ok72

dispatch.abort66:                                 ; preds = %dispatch.ok58
  call void @abort()
  unreachable

dispatch.ok72:                                    ; preds = %dispatch.ok65
  %vtable.ptr75 = load ptr, ptr %EdgeCons.newtmp71, align 8
  %method.ptr.addr76 = getelementptr ptr, ptr %vtable.ptr75, i64 6
  %method.ptr77 = load ptr, ptr %method.ptr.addr76, align 8
  %EdgeCons.newtmp78 = call ptr @EdgeCons.new()
  %dispatch.isnull81 = icmp eq ptr %EdgeCons.newtmp78, null
  br i1 %dispatch.isnull81, label %dispatch.abort80, label %dispatch.ok79

dispatch.abort73:                                 ; preds = %dispatch.ok65
  call void @abort()
  unreachable

dispatch.ok79:                                    ; preds = %dispatch.ok72
  %vtable.ptr82 = load ptr, ptr %EdgeCons.newtmp78, align 8
  %method.ptr.addr83 = getelementptr ptr, ptr %vtable.ptr82, i64 6
  %method.ptr84 = load ptr, ptr %method.ptr.addr83, align 8
  %EdgeCons.newtmp85 = call ptr @EdgeCons.new()
  %dispatch.isnull88 = icmp eq ptr %EdgeCons.newtmp85, null
  br i1 %dispatch.isnull88, label %dispatch.abort87, label %dispatch.ok86

dispatch.abort80:                                 ; preds = %dispatch.ok72
  call void @abort()
  unreachable

dispatch.ok86:                                    ; preds = %dispatch.ok79
  %vtable.ptr89 = load ptr, ptr %EdgeCons.newtmp85, align 8
  %method.ptr.addr90 = getelementptr ptr, ptr %vtable.ptr89, i64 6
  %method.ptr91 = load ptr, ptr %method.ptr.addr90, align 8
  %EdgeCons.newtmp92 = call ptr @EdgeCons.new()
  %dispatch.isnull95 = icmp eq ptr %EdgeCons.newtmp92, null
  br i1 %dispatch.isnull95, label %dispatch.abort94, label %dispatch.ok93

dispatch.abort87:                                 ; preds = %dispatch.ok79
  call void @abort()
  unreachable

dispatch.ok93:                                    ; preds = %dispatch.ok86
  %vtable.ptr96 = load ptr, ptr %EdgeCons.newtmp92, align 8
  %method.ptr.addr97 = getelementptr ptr, ptr %vtable.ptr96, i64 6
  %method.ptr98 = load ptr, ptr %method.ptr.addr97, align 8
  %EdgeCons.newtmp99 = call ptr @EdgeCons.new()
  %dispatch.isnull102 = icmp eq ptr %EdgeCons.newtmp99, null
  br i1 %dispatch.isnull102, label %dispatch.abort101, label %dispatch.ok100

dispatch.abort94:                                 ; preds = %dispatch.ok86
  call void @abort()
  unreachable

dispatch.ok100:                                   ; preds = %dispatch.ok93
  %vtable.ptr103 = load ptr, ptr %EdgeCons.newtmp99, align 8
  %method.ptr.addr104 = getelementptr ptr, ptr %vtable.ptr103, i64 6
  %method.ptr105 = load ptr, ptr %method.ptr.addr104, align 8
  %EdgeCons.newtmp106 = call ptr @EdgeCons.new()
  %dispatch.isnull109 = icmp eq ptr %EdgeCons.newtmp106, null
  br i1 %dispatch.isnull109, label %dispatch.abort108, label %dispatch.ok107

dispatch.abort101:                                ; preds = %dispatch.ok93
  call void @abort()
  unreachable

dispatch.ok107:                                   ; preds = %dispatch.ok100
  %vtable.ptr110 = load ptr, ptr %EdgeCons.newtmp106, align 8
  %method.ptr.addr111 = getelementptr ptr, ptr %vtable.ptr110, i64 6
  %method.ptr112 = load ptr, ptr %method.ptr.addr111, align 8
  %EdgeList.newtmp = call ptr @EdgeList.new()
  %dispatch.result = call ptr %method.ptr112(ptr %EdgeCons.newtmp106, i32 9, i32 10, i32 1, ptr %EdgeList.newtmp)
  %dispatch.result113 = call ptr %method.ptr105(ptr %EdgeCons.newtmp99, i32 8, i32 10, i32 3, ptr %dispatch.result)
  %dispatch.result114 = call ptr %method.ptr98(ptr %EdgeCons.newtmp92, i32 5, i32 9, i32 8, ptr %dispatch.result113)
  %dispatch.result115 = call ptr %method.ptr91(ptr %EdgeCons.newtmp85, i32 7, i32 9, i32 5, ptr %dispatch.result114)
  %dispatch.result116 = call ptr %method.ptr84(ptr %EdgeCons.newtmp78, i32 7, i32 8, i32 2, ptr %dispatch.result115)
  %dispatch.result117 = call ptr %method.ptr77(ptr %EdgeCons.newtmp71, i32 6, i32 8, i32 7, ptr %dispatch.result116)
  %dispatch.result118 = call ptr %method.ptr70(ptr %EdgeCons.newtmp64, i32 6, i32 7, i32 1, ptr %dispatch.result117)
  %dispatch.result119 = call ptr %method.ptr63(ptr %EdgeCons.newtmp57, i32 4, i32 7, i32 3, ptr %dispatch.result118)
  %dispatch.result120 = call ptr %method.ptr56(ptr %EdgeCons.newtmp50, i32 5, i32 6, i32 4, ptr %dispatch.result119)
  %dispatch.result121 = call ptr %method.ptr49(ptr %EdgeCons.newtmp43, i32 5, i32 4, i32 1, ptr %dispatch.result120)
  %dispatch.result122 = call ptr %method.ptr42(ptr %EdgeCons.newtmp36, i32 3, i32 6, i32 9, ptr %dispatch.result121)
  %dispatch.result123 = call ptr %method.ptr35(ptr %EdgeCons.newtmp29, i32 3, i32 5, i32 3, ptr %dispatch.result122)
  %dispatch.result124 = call ptr %method.ptr28(ptr %EdgeCons.newtmp22, i32 2, i32 5, i32 12, ptr %dispatch.result123)
  %dispatch.result125 = call ptr %method.ptr21(ptr %EdgeCons.newtmp15, i32 2, i32 4, i32 5, ptr %dispatch.result124)
  %dispatch.result126 = call ptr %method.ptr14(ptr %EdgeCons.newtmp8, i32 2, i32 3, i32 1, ptr %dispatch.result125)
  %dispatch.result127 = call ptr %method.ptr7(ptr %EdgeCons.newtmp1, i32 1, i32 3, i32 2, ptr %dispatch.result126)
  %dispatch.result128 = call ptr %method.ptr(ptr %EdgeCons.newtmp, i32 1, i32 2, i32 4, ptr %dispatch.result127)
  ret ptr %dispatch.result128

dispatch.abort108:                                ; preds = %dispatch.ok100
  call void @abort()
  unreachable
}

define i32 @ShortestPath.distance_of(ptr %this, i32 %node) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %node.addr = alloca i32, align 4
  store i32 %node, ptr %node.addr, align 4
  %node1 = load i32, ptr %node.addr, align 4
  %eqtmp = icmp eq i32 %node1, 1
  br i1 %eqtmp, label %then, label %else

then:                                             ; preds = %entry
  %self = load ptr, ptr %this.addr, align 8
  %d1.addr = getelementptr i8, ptr %self, i32 16
  %d1 = load i32, ptr %d1.addr, align 4
  br label %ifcont57

else:                                             ; preds = %entry
  %node2 = load i32, ptr %node.addr, align 4
  %eqtmp3 = icmp eq i32 %node2, 2
  br i1 %eqtmp3, label %then4, label %else6

then4:                                            ; preds = %else
  %self5 = load ptr, ptr %this.addr, align 8
  %d2.addr = getelementptr i8, ptr %self5, i32 24
  %d2 = load i32, ptr %d2.addr, align 4
  br label %ifcont55

else6:                                            ; preds = %else
  %node7 = load i32, ptr %node.addr, align 4
  %eqtmp8 = icmp eq i32 %node7, 3
  br i1 %eqtmp8, label %then9, label %else11

then9:                                            ; preds = %else6
  %self10 = load ptr, ptr %this.addr, align 8
  %d3.addr = getelementptr i8, ptr %self10, i32 32
  %d3 = load i32, ptr %d3.addr, align 4
  br label %ifcont53

else11:                                           ; preds = %else6
  %node12 = load i32, ptr %node.addr, align 4
  %eqtmp13 = icmp eq i32 %node12, 4
  br i1 %eqtmp13, label %then14, label %else16

then14:                                           ; preds = %else11
  %self15 = load ptr, ptr %this.addr, align 8
  %d4.addr = getelementptr i8, ptr %self15, i32 40
  %d4 = load i32, ptr %d4.addr, align 4
  br label %ifcont51

else16:                                           ; preds = %else11
  %node17 = load i32, ptr %node.addr, align 4
  %eqtmp18 = icmp eq i32 %node17, 5
  br i1 %eqtmp18, label %then19, label %else21

then19:                                           ; preds = %else16
  %self20 = load ptr, ptr %this.addr, align 8
  %d5.addr = getelementptr i8, ptr %self20, i32 48
  %d5 = load i32, ptr %d5.addr, align 4
  br label %ifcont49

else21:                                           ; preds = %else16
  %node22 = load i32, ptr %node.addr, align 4
  %eqtmp23 = icmp eq i32 %node22, 6
  br i1 %eqtmp23, label %then24, label %else26

then24:                                           ; preds = %else21
  %self25 = load ptr, ptr %this.addr, align 8
  %d6.addr = getelementptr i8, ptr %self25, i32 56
  %d6 = load i32, ptr %d6.addr, align 4
  br label %ifcont47

else26:                                           ; preds = %else21
  %node27 = load i32, ptr %node.addr, align 4
  %eqtmp28 = icmp eq i32 %node27, 7
  br i1 %eqtmp28, label %then29, label %else31

then29:                                           ; preds = %else26
  %self30 = load ptr, ptr %this.addr, align 8
  %d7.addr = getelementptr i8, ptr %self30, i32 64
  %d7 = load i32, ptr %d7.addr, align 4
  br label %ifcont45

else31:                                           ; preds = %else26
  %node32 = load i32, ptr %node.addr, align 4
  %eqtmp33 = icmp eq i32 %node32, 8
  br i1 %eqtmp33, label %then34, label %else36

then34:                                           ; preds = %else31
  %self35 = load ptr, ptr %this.addr, align 8
  %d8.addr = getelementptr i8, ptr %self35, i32 72
  %d8 = load i32, ptr %d8.addr, align 4
  br label %ifcont43

else36:                                           ; preds = %else31
  %node37 = load i32, ptr %node.addr, align 4
  %eqtmp38 = icmp eq i32 %node37, 9
  br i1 %eqtmp38, label %then39, label %else41

then39:                                           ; preds = %else36
  %self40 = load ptr, ptr %this.addr, align 8
  %d9.addr = getelementptr i8, ptr %self40, i32 80
  %d9 = load i32, ptr %d9.addr, align 4
  br label %ifcont

else41:                                           ; preds = %else36
  %self42 = load ptr, ptr %this.addr, align 8
  %d10.addr = getelementptr i8, ptr %self42, i32 88
  %d10 = load i32, ptr %d10.addr, align 4
  br label %ifcont

ifcont:                                           ; preds = %else41, %then39
  %cond_result = phi i32 [ %d9, %then39 ], [ %d10, %else41 ]
  br label %ifcont43

ifcont43:                                         ; preds = %ifcont, %then34
  %cond_result44 = phi i32 [ %d8, %then34 ], [ %cond_result, %ifcont ]
  br label %ifcont45

ifcont45:                                         ; preds = %ifcont43, %then29
  %cond_result46 = phi i32 [ %d7, %then29 ], [ %cond_result44, %ifcont43 ]
  br label %ifcont47

ifcont47:                                         ; preds = %ifcont45, %then24
  %cond_result48 = phi i32 [ %d6, %then24 ], [ %cond_result46, %ifcont45 ]
  br label %ifcont49

ifcont49:                                         ; preds = %ifcont47, %then19
  %cond_result50 = phi i32 [ %d5, %then19 ], [ %cond_result48, %ifcont47 ]
  br label %ifcont51

ifcont51:                                         ; preds = %ifcont49, %then14
  %cond_result52 = phi i32 [ %d4, %then14 ], [ %cond_result50, %ifcont49 ]
  br label %ifcont53

ifcont53:                                         ; preds = %ifcont51, %then9
  %cond_result54 = phi i32 [ %d3, %then9 ], [ %cond_result52, %ifcont51 ]
  br label %ifcont55

ifcont55:                                         ; preds = %ifcont53, %then4
  %cond_result56 = phi i32 [ %d2, %then4 ], [ %cond_result54, %ifcont53 ]
  br label %ifcont57

ifcont57:                                         ; preds = %ifcont55, %then
  %cond_result58 = phi i32 [ %d1, %then ], [ %cond_result56, %ifcont55 ]
  ret i32 %cond_result58
}

define ptr @ShortestPath.set_distance(ptr %this, i32 %node, i32 %value) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %node.addr = alloca i32, align 4
  store i32 %node, ptr %node.addr, align 4
  %value.addr = alloca i32, align 4
  store i32 %value, ptr %value.addr, align 4
  %node1 = load i32, ptr %node.addr, align 4
  %eqtmp = icmp eq i32 %node1, 1
  br i1 %eqtmp, label %then, label %else

then:                                             ; preds = %entry
  %value2 = load i32, ptr %value.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %d1.addr = getelementptr i8, ptr %self, i32 16
  store i32 %value2, ptr %d1.addr, align 4
  br label %ifcont67

else:                                             ; preds = %entry
  %node3 = load i32, ptr %node.addr, align 4
  %eqtmp4 = icmp eq i32 %node3, 2
  br i1 %eqtmp4, label %then5, label %else8

then5:                                            ; preds = %else
  %value6 = load i32, ptr %value.addr, align 4
  %self7 = load ptr, ptr %this.addr, align 8
  %d2.addr = getelementptr i8, ptr %self7, i32 24
  store i32 %value6, ptr %d2.addr, align 4
  br label %ifcont65

else8:                                            ; preds = %else
  %node9 = load i32, ptr %node.addr, align 4
  %eqtmp10 = icmp eq i32 %node9, 3
  br i1 %eqtmp10, label %then11, label %else14

then11:                                           ; preds = %else8
  %value12 = load i32, ptr %value.addr, align 4
  %self13 = load ptr, ptr %this.addr, align 8
  %d3.addr = getelementptr i8, ptr %self13, i32 32
  store i32 %value12, ptr %d3.addr, align 4
  br label %ifcont63

else14:                                           ; preds = %else8
  %node15 = load i32, ptr %node.addr, align 4
  %eqtmp16 = icmp eq i32 %node15, 4
  br i1 %eqtmp16, label %then17, label %else20

then17:                                           ; preds = %else14
  %value18 = load i32, ptr %value.addr, align 4
  %self19 = load ptr, ptr %this.addr, align 8
  %d4.addr = getelementptr i8, ptr %self19, i32 40
  store i32 %value18, ptr %d4.addr, align 4
  br label %ifcont61

else20:                                           ; preds = %else14
  %node21 = load i32, ptr %node.addr, align 4
  %eqtmp22 = icmp eq i32 %node21, 5
  br i1 %eqtmp22, label %then23, label %else26

then23:                                           ; preds = %else20
  %value24 = load i32, ptr %value.addr, align 4
  %self25 = load ptr, ptr %this.addr, align 8
  %d5.addr = getelementptr i8, ptr %self25, i32 48
  store i32 %value24, ptr %d5.addr, align 4
  br label %ifcont59

else26:                                           ; preds = %else20
  %node27 = load i32, ptr %node.addr, align 4
  %eqtmp28 = icmp eq i32 %node27, 6
  br i1 %eqtmp28, label %then29, label %else32

then29:                                           ; preds = %else26
  %value30 = load i32, ptr %value.addr, align 4
  %self31 = load ptr, ptr %this.addr, align 8
  %d6.addr = getelementptr i8, ptr %self31, i32 56
  store i32 %value30, ptr %d6.addr, align 4
  br label %ifcont57

else32:                                           ; preds = %else26
  %node33 = load i32, ptr %node.addr, align 4
  %eqtmp34 = icmp eq i32 %node33, 7
  br i1 %eqtmp34, label %then35, label %else38

then35:                                           ; preds = %else32
  %value36 = load i32, ptr %value.addr, align 4
  %self37 = load ptr, ptr %this.addr, align 8
  %d7.addr = getelementptr i8, ptr %self37, i32 64
  store i32 %value36, ptr %d7.addr, align 4
  br label %ifcont55

else38:                                           ; preds = %else32
  %node39 = load i32, ptr %node.addr, align 4
  %eqtmp40 = icmp eq i32 %node39, 8
  br i1 %eqtmp40, label %then41, label %else44

then41:                                           ; preds = %else38
  %value42 = load i32, ptr %value.addr, align 4
  %self43 = load ptr, ptr %this.addr, align 8
  %d8.addr = getelementptr i8, ptr %self43, i32 72
  store i32 %value42, ptr %d8.addr, align 4
  br label %ifcont53

else44:                                           ; preds = %else38
  %node45 = load i32, ptr %node.addr, align 4
  %eqtmp46 = icmp eq i32 %node45, 9
  br i1 %eqtmp46, label %then47, label %else50

then47:                                           ; preds = %else44
  %value48 = load i32, ptr %value.addr, align 4
  %self49 = load ptr, ptr %this.addr, align 8
  %d9.addr = getelementptr i8, ptr %self49, i32 80
  store i32 %value48, ptr %d9.addr, align 4
  br label %ifcont

else50:                                           ; preds = %else44
  %value51 = load i32, ptr %value.addr, align 4
  %self52 = load ptr, ptr %this.addr, align 8
  %d10.addr = getelementptr i8, ptr %self52, i32 88
  store i32 %value51, ptr %d10.addr, align 4
  br label %ifcont

ifcont:                                           ; preds = %else50, %then47
  %cond_result = phi i32 [ %value48, %then47 ], [ %value51, %else50 ]
  br label %ifcont53

ifcont53:                                         ; preds = %ifcont, %then41
  %cond_result54 = phi i32 [ %value42, %then41 ], [ %cond_result, %ifcont ]
  br label %ifcont55

ifcont55:                                         ; preds = %ifcont53, %then35
  %cond_result56 = phi i32 [ %value36, %then35 ], [ %cond_result54, %ifcont53 ]
  br label %ifcont57

ifcont57:                                         ; preds = %ifcont55, %then29
  %cond_result58 = phi i32 [ %value30, %then29 ], [ %cond_result56, %ifcont55 ]
  br label %ifcont59

ifcont59:                                         ; preds = %ifcont57, %then23
  %cond_result60 = phi i32 [ %value24, %then23 ], [ %cond_result58, %ifcont57 ]
  br label %ifcont61

ifcont61:                                         ; preds = %ifcont59, %then17
  %cond_result62 = phi i32 [ %value18, %then17 ], [ %cond_result60, %ifcont59 ]
  br label %ifcont63

ifcont63:                                         ; preds = %ifcont61, %then11
  %cond_result64 = phi i32 [ %value12, %then11 ], [ %cond_result62, %ifcont61 ]
  br label %ifcont65

ifcont65:                                         ; preds = %ifcont63, %then5
  %cond_result66 = phi i32 [ %value6, %then5 ], [ %cond_result64, %ifcont63 ]
  br label %ifcont67

ifcont67:                                         ; preds = %ifcont65, %then
  %cond_result68 = phi i32 [ %value2, %then ], [ %cond_result66, %ifcont65 ]
  %result = inttoptr i32 %cond_result68 to ptr
  ret ptr %result
}

define ptr @ShortestPath.print_value(ptr %this, i32 %value) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %value.addr = alloca i32, align 4
  store i32 %value, ptr %value.addr, align 4
  %value1 = load i32, ptr %value.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %inf.addr = getelementptr i8, ptr %self, i32 8
  %inf = load i32, ptr %inf.addr, align 4
  %eqtmp = icmp eq i32 %value1, %inf
  br i1 %eqtmp, label %then, label %else

then:                                             ; preds = %entry
  %self2 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self2, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %then
  %vtable.ptr = load ptr, ptr %self2, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self2, ptr @.str.8067682431658732599)
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
  %value10 = load i32, ptr %value.addr, align 4
  %dispatch.result11 = call ptr %method.ptr9(ptr %self3, i32 %value10)
  br label %ifcont

dispatch.abort5:                                  ; preds = %else
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok4, %dispatch.ok
  %cond_result = phi ptr [ %dispatch.result, %dispatch.ok ], [ %dispatch.result11, %dispatch.ok4 ]
  ret ptr %cond_result
}

define ptr @ShortestPath.print_one(ptr %this, i32 %node) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %node.addr = alloca i32, align 4
  store i32 %node, ptr %node.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.16441386196195795854)
  %self1 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull4 = icmp eq ptr %self1, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %self1, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 6
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %node8 = load i32, ptr %node.addr, align 4
  %dispatch.result9 = call ptr %method.ptr7(ptr %self1, i32 %node8)
  %self10 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull13 = icmp eq ptr %self10, null
  br i1 %dispatch.isnull13, label %dispatch.abort12, label %dispatch.ok11

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok11:                                    ; preds = %dispatch.ok2
  %vtable.ptr14 = load ptr, ptr %self10, align 8
  %method.ptr.addr15 = getelementptr ptr, ptr %vtable.ptr14, i64 5
  %method.ptr16 = load ptr, ptr %method.ptr.addr15, align 8
  %dispatch.result17 = call ptr %method.ptr16(ptr %self10, ptr @.str.7910161676286232157)
  %self18 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull21 = icmp eq ptr %self18, null
  br i1 %dispatch.isnull21, label %dispatch.abort20, label %dispatch.ok19

dispatch.abort12:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable

dispatch.ok19:                                    ; preds = %dispatch.ok11
  %vtable.ptr22 = load ptr, ptr %self18, align 8
  %method.ptr.addr23 = getelementptr ptr, ptr %vtable.ptr22, i64 13
  %method.ptr24 = load ptr, ptr %method.ptr.addr23, align 8
  %self25 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull28 = icmp eq ptr %self25, null
  br i1 %dispatch.isnull28, label %dispatch.abort27, label %dispatch.ok26

dispatch.abort20:                                 ; preds = %dispatch.ok11
  call void @abort()
  unreachable

dispatch.ok26:                                    ; preds = %dispatch.ok19
  %vtable.ptr29 = load ptr, ptr %self25, align 8
  %method.ptr.addr30 = getelementptr ptr, ptr %vtable.ptr29, i64 11
  %method.ptr31 = load ptr, ptr %method.ptr.addr30, align 8
  %node32 = load i32, ptr %node.addr, align 4
  %dispatch.result33 = call i32 %method.ptr31(ptr %self25, i32 %node32)
  %dispatch.result34 = call ptr %method.ptr24(ptr %self18, i32 %dispatch.result33)
  %self35 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull38 = icmp eq ptr %self35, null
  br i1 %dispatch.isnull38, label %dispatch.abort37, label %dispatch.ok36

dispatch.abort27:                                 ; preds = %dispatch.ok19
  call void @abort()
  unreachable

dispatch.ok36:                                    ; preds = %dispatch.ok26
  %vtable.ptr39 = load ptr, ptr %self35, align 8
  %method.ptr.addr40 = getelementptr ptr, ptr %vtable.ptr39, i64 5
  %method.ptr41 = load ptr, ptr %method.ptr.addr40, align 8
  %dispatch.result42 = call ptr %method.ptr41(ptr %self35, ptr @.str.18400681194753865968)
  ret ptr %dispatch.result42

dispatch.abort37:                                 ; preds = %dispatch.ok26
  call void @abort()
  unreachable
}

define ptr @ShortestPath.print_all_distances(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 14
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self, i32 1)
  %self1 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull4 = icmp eq ptr %self1, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %self1, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 14
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %dispatch.result8 = call ptr %method.ptr7(ptr %self1, i32 2)
  %self9 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull12 = icmp eq ptr %self9, null
  br i1 %dispatch.isnull12, label %dispatch.abort11, label %dispatch.ok10

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok10:                                    ; preds = %dispatch.ok2
  %vtable.ptr13 = load ptr, ptr %self9, align 8
  %method.ptr.addr14 = getelementptr ptr, ptr %vtable.ptr13, i64 14
  %method.ptr15 = load ptr, ptr %method.ptr.addr14, align 8
  %dispatch.result16 = call ptr %method.ptr15(ptr %self9, i32 3)
  %self17 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull20 = icmp eq ptr %self17, null
  br i1 %dispatch.isnull20, label %dispatch.abort19, label %dispatch.ok18

dispatch.abort11:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable

dispatch.ok18:                                    ; preds = %dispatch.ok10
  %vtable.ptr21 = load ptr, ptr %self17, align 8
  %method.ptr.addr22 = getelementptr ptr, ptr %vtable.ptr21, i64 14
  %method.ptr23 = load ptr, ptr %method.ptr.addr22, align 8
  %dispatch.result24 = call ptr %method.ptr23(ptr %self17, i32 4)
  %self25 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull28 = icmp eq ptr %self25, null
  br i1 %dispatch.isnull28, label %dispatch.abort27, label %dispatch.ok26

dispatch.abort19:                                 ; preds = %dispatch.ok10
  call void @abort()
  unreachable

dispatch.ok26:                                    ; preds = %dispatch.ok18
  %vtable.ptr29 = load ptr, ptr %self25, align 8
  %method.ptr.addr30 = getelementptr ptr, ptr %vtable.ptr29, i64 14
  %method.ptr31 = load ptr, ptr %method.ptr.addr30, align 8
  %dispatch.result32 = call ptr %method.ptr31(ptr %self25, i32 5)
  %self33 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull36 = icmp eq ptr %self33, null
  br i1 %dispatch.isnull36, label %dispatch.abort35, label %dispatch.ok34

dispatch.abort27:                                 ; preds = %dispatch.ok18
  call void @abort()
  unreachable

dispatch.ok34:                                    ; preds = %dispatch.ok26
  %vtable.ptr37 = load ptr, ptr %self33, align 8
  %method.ptr.addr38 = getelementptr ptr, ptr %vtable.ptr37, i64 14
  %method.ptr39 = load ptr, ptr %method.ptr.addr38, align 8
  %dispatch.result40 = call ptr %method.ptr39(ptr %self33, i32 6)
  %self41 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull44 = icmp eq ptr %self41, null
  br i1 %dispatch.isnull44, label %dispatch.abort43, label %dispatch.ok42

dispatch.abort35:                                 ; preds = %dispatch.ok26
  call void @abort()
  unreachable

dispatch.ok42:                                    ; preds = %dispatch.ok34
  %vtable.ptr45 = load ptr, ptr %self41, align 8
  %method.ptr.addr46 = getelementptr ptr, ptr %vtable.ptr45, i64 14
  %method.ptr47 = load ptr, ptr %method.ptr.addr46, align 8
  %dispatch.result48 = call ptr %method.ptr47(ptr %self41, i32 7)
  %self49 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull52 = icmp eq ptr %self49, null
  br i1 %dispatch.isnull52, label %dispatch.abort51, label %dispatch.ok50

dispatch.abort43:                                 ; preds = %dispatch.ok34
  call void @abort()
  unreachable

dispatch.ok50:                                    ; preds = %dispatch.ok42
  %vtable.ptr53 = load ptr, ptr %self49, align 8
  %method.ptr.addr54 = getelementptr ptr, ptr %vtable.ptr53, i64 14
  %method.ptr55 = load ptr, ptr %method.ptr.addr54, align 8
  %dispatch.result56 = call ptr %method.ptr55(ptr %self49, i32 8)
  %self57 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull60 = icmp eq ptr %self57, null
  br i1 %dispatch.isnull60, label %dispatch.abort59, label %dispatch.ok58

dispatch.abort51:                                 ; preds = %dispatch.ok42
  call void @abort()
  unreachable

dispatch.ok58:                                    ; preds = %dispatch.ok50
  %vtable.ptr61 = load ptr, ptr %self57, align 8
  %method.ptr.addr62 = getelementptr ptr, ptr %vtable.ptr61, i64 14
  %method.ptr63 = load ptr, ptr %method.ptr.addr62, align 8
  %dispatch.result64 = call ptr %method.ptr63(ptr %self57, i32 9)
  %self65 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull68 = icmp eq ptr %self65, null
  br i1 %dispatch.isnull68, label %dispatch.abort67, label %dispatch.ok66

dispatch.abort59:                                 ; preds = %dispatch.ok50
  call void @abort()
  unreachable

dispatch.ok66:                                    ; preds = %dispatch.ok58
  %vtable.ptr69 = load ptr, ptr %self65, align 8
  %method.ptr.addr70 = getelementptr ptr, ptr %vtable.ptr69, i64 14
  %method.ptr71 = load ptr, ptr %method.ptr.addr70, align 8
  %dispatch.result72 = call ptr %method.ptr71(ptr %self65, i32 10)
  ret ptr %dispatch.result72

dispatch.abort67:                                 ; preds = %dispatch.ok58
  call void @abort()
  unreachable
}

define ptr @ShortestPath.relax(ptr %this, i32 %from, i32 %to, i32 %weight) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %from.addr = alloca i32, align 4
  store i32 %from, ptr %from.addr, align 4
  %to.addr = alloca i32, align 4
  store i32 %to, ptr %to.addr, align 4
  %weight.addr = alloca i32, align 4
  store i32 %weight, ptr %weight.addr, align 4
  %from_dist = alloca i32, align 4
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 11
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %from1 = load i32, ptr %from.addr, align 4
  %dispatch.result = call i32 %method.ptr(ptr %self, i32 %from1)
  store i32 %dispatch.result, ptr %from_dist, align 4
  %to_dist = alloca i32, align 4
  %self2 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull5 = icmp eq ptr %self2, null
  br i1 %dispatch.isnull5, label %dispatch.abort4, label %dispatch.ok3

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok3:                                     ; preds = %dispatch.ok
  %vtable.ptr6 = load ptr, ptr %self2, align 8
  %method.ptr.addr7 = getelementptr ptr, ptr %vtable.ptr6, i64 11
  %method.ptr8 = load ptr, ptr %method.ptr.addr7, align 8
  %to9 = load i32, ptr %to.addr, align 4
  %dispatch.result10 = call i32 %method.ptr8(ptr %self2, i32 %to9)
  store i32 %dispatch.result10, ptr %to_dist, align 4
  %candidate = alloca i32, align 4
  %from_dist11 = load i32, ptr %from_dist, align 4
  %self12 = load ptr, ptr %this.addr, align 8
  %inf.addr = getelementptr i8, ptr %self12, i32 8
  %inf = load i32, ptr %inf.addr, align 4
  %cmptmp = icmp slt i32 %from_dist11, %inf
  br i1 %cmptmp, label %then, label %else

dispatch.abort4:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

then:                                             ; preds = %dispatch.ok3
  %from_dist13 = load i32, ptr %from_dist, align 4
  %weight14 = load i32, ptr %weight.addr, align 4
  %addtmp = add i32 %from_dist13, %weight14
  br label %ifcont

else:                                             ; preds = %dispatch.ok3
  %self15 = load ptr, ptr %this.addr, align 8
  %inf.addr16 = getelementptr i8, ptr %self15, i32 8
  %inf17 = load i32, ptr %inf.addr16, align 4
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %cond_result = phi i32 [ %addtmp, %then ], [ %inf17, %else ]
  store i32 %cond_result, ptr %candidate, align 4
  %self18 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull21 = icmp eq ptr %self18, null
  br i1 %dispatch.isnull21, label %dispatch.abort20, label %dispatch.ok19

dispatch.ok19:                                    ; preds = %ifcont
  %vtable.ptr22 = load ptr, ptr %self18, align 8
  %method.ptr.addr23 = getelementptr ptr, ptr %vtable.ptr22, i64 5
  %method.ptr24 = load ptr, ptr %method.ptr.addr23, align 8
  %dispatch.result25 = call ptr %method.ptr24(ptr %self18, ptr @.str.14124547106008738548)
  %self26 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull29 = icmp eq ptr %self26, null
  br i1 %dispatch.isnull29, label %dispatch.abort28, label %dispatch.ok27

dispatch.abort20:                                 ; preds = %ifcont
  call void @abort()
  unreachable

dispatch.ok27:                                    ; preds = %dispatch.ok19
  %vtable.ptr30 = load ptr, ptr %self26, align 8
  %method.ptr.addr31 = getelementptr ptr, ptr %vtable.ptr30, i64 6
  %method.ptr32 = load ptr, ptr %method.ptr.addr31, align 8
  %from33 = load i32, ptr %from.addr, align 4
  %dispatch.result34 = call ptr %method.ptr32(ptr %self26, i32 %from33)
  %self35 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull38 = icmp eq ptr %self35, null
  br i1 %dispatch.isnull38, label %dispatch.abort37, label %dispatch.ok36

dispatch.abort28:                                 ; preds = %dispatch.ok19
  call void @abort()
  unreachable

dispatch.ok36:                                    ; preds = %dispatch.ok27
  %vtable.ptr39 = load ptr, ptr %self35, align 8
  %method.ptr.addr40 = getelementptr ptr, ptr %vtable.ptr39, i64 5
  %method.ptr41 = load ptr, ptr %method.ptr.addr40, align 8
  %dispatch.result42 = call ptr %method.ptr41(ptr %self35, ptr @.str.12644676059775988466)
  %self43 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull46 = icmp eq ptr %self43, null
  br i1 %dispatch.isnull46, label %dispatch.abort45, label %dispatch.ok44

dispatch.abort37:                                 ; preds = %dispatch.ok27
  call void @abort()
  unreachable

dispatch.ok44:                                    ; preds = %dispatch.ok36
  %vtable.ptr47 = load ptr, ptr %self43, align 8
  %method.ptr.addr48 = getelementptr ptr, ptr %vtable.ptr47, i64 6
  %method.ptr49 = load ptr, ptr %method.ptr.addr48, align 8
  %to50 = load i32, ptr %to.addr, align 4
  %dispatch.result51 = call ptr %method.ptr49(ptr %self43, i32 %to50)
  %self52 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull55 = icmp eq ptr %self52, null
  br i1 %dispatch.isnull55, label %dispatch.abort54, label %dispatch.ok53

dispatch.abort45:                                 ; preds = %dispatch.ok36
  call void @abort()
  unreachable

dispatch.ok53:                                    ; preds = %dispatch.ok44
  %vtable.ptr56 = load ptr, ptr %self52, align 8
  %method.ptr.addr57 = getelementptr ptr, ptr %vtable.ptr56, i64 5
  %method.ptr58 = load ptr, ptr %method.ptr.addr57, align 8
  %dispatch.result59 = call ptr %method.ptr58(ptr %self52, ptr @.str.3704242786489878993)
  %self60 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull63 = icmp eq ptr %self60, null
  br i1 %dispatch.isnull63, label %dispatch.abort62, label %dispatch.ok61

dispatch.abort54:                                 ; preds = %dispatch.ok44
  call void @abort()
  unreachable

dispatch.ok61:                                    ; preds = %dispatch.ok53
  %vtable.ptr64 = load ptr, ptr %self60, align 8
  %method.ptr.addr65 = getelementptr ptr, ptr %vtable.ptr64, i64 6
  %method.ptr66 = load ptr, ptr %method.ptr.addr65, align 8
  %weight67 = load i32, ptr %weight.addr, align 4
  %dispatch.result68 = call ptr %method.ptr66(ptr %self60, i32 %weight67)
  %self69 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull72 = icmp eq ptr %self69, null
  br i1 %dispatch.isnull72, label %dispatch.abort71, label %dispatch.ok70

dispatch.abort62:                                 ; preds = %dispatch.ok53
  call void @abort()
  unreachable

dispatch.ok70:                                    ; preds = %dispatch.ok61
  %vtable.ptr73 = load ptr, ptr %self69, align 8
  %method.ptr.addr74 = getelementptr ptr, ptr %vtable.ptr73, i64 5
  %method.ptr75 = load ptr, ptr %method.ptr.addr74, align 8
  %dispatch.result76 = call ptr %method.ptr75(ptr %self69, ptr @.str.13531825353272122674)
  %self77 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull80 = icmp eq ptr %self77, null
  br i1 %dispatch.isnull80, label %dispatch.abort79, label %dispatch.ok78

dispatch.abort71:                                 ; preds = %dispatch.ok61
  call void @abort()
  unreachable

dispatch.ok78:                                    ; preds = %dispatch.ok70
  %vtable.ptr81 = load ptr, ptr %self77, align 8
  %method.ptr.addr82 = getelementptr ptr, ptr %vtable.ptr81, i64 13
  %method.ptr83 = load ptr, ptr %method.ptr.addr82, align 8
  %to_dist84 = load i32, ptr %to_dist, align 4
  %dispatch.result85 = call ptr %method.ptr83(ptr %self77, i32 %to_dist84)
  %self86 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull89 = icmp eq ptr %self86, null
  br i1 %dispatch.isnull89, label %dispatch.abort88, label %dispatch.ok87

dispatch.abort79:                                 ; preds = %dispatch.ok70
  call void @abort()
  unreachable

dispatch.ok87:                                    ; preds = %dispatch.ok78
  %vtable.ptr90 = load ptr, ptr %self86, align 8
  %method.ptr.addr91 = getelementptr ptr, ptr %vtable.ptr90, i64 5
  %method.ptr92 = load ptr, ptr %method.ptr.addr91, align 8
  %dispatch.result93 = call ptr %method.ptr92(ptr %self86, ptr @.str.11028047508597618019)
  %self94 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull97 = icmp eq ptr %self94, null
  br i1 %dispatch.isnull97, label %dispatch.abort96, label %dispatch.ok95

dispatch.abort88:                                 ; preds = %dispatch.ok78
  call void @abort()
  unreachable

dispatch.ok95:                                    ; preds = %dispatch.ok87
  %vtable.ptr98 = load ptr, ptr %self94, align 8
  %method.ptr.addr99 = getelementptr ptr, ptr %vtable.ptr98, i64 13
  %method.ptr100 = load ptr, ptr %method.ptr.addr99, align 8
  %candidate101 = load i32, ptr %candidate, align 4
  %dispatch.result102 = call ptr %method.ptr100(ptr %self94, i32 %candidate101)
  %self103 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull106 = icmp eq ptr %self103, null
  br i1 %dispatch.isnull106, label %dispatch.abort105, label %dispatch.ok104

dispatch.abort96:                                 ; preds = %dispatch.ok87
  call void @abort()
  unreachable

dispatch.ok104:                                   ; preds = %dispatch.ok95
  %vtable.ptr107 = load ptr, ptr %self103, align 8
  %method.ptr.addr108 = getelementptr ptr, ptr %vtable.ptr107, i64 5
  %method.ptr109 = load ptr, ptr %method.ptr.addr108, align 8
  %dispatch.result110 = call ptr %method.ptr109(ptr %self103, ptr @.str.13680097196363203565)
  %candidate111 = load i32, ptr %candidate, align 4
  %to_dist112 = load i32, ptr %to_dist, align 4
  %cmptmp113 = icmp slt i32 %candidate111, %to_dist112
  br i1 %cmptmp113, label %then114, label %else141

dispatch.abort105:                                ; preds = %dispatch.ok95
  call void @abort()
  unreachable

then114:                                          ; preds = %dispatch.ok104
  %self115 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull118 = icmp eq ptr %self115, null
  br i1 %dispatch.isnull118, label %dispatch.abort117, label %dispatch.ok116

dispatch.ok116:                                   ; preds = %then114
  %vtable.ptr119 = load ptr, ptr %self115, align 8
  %method.ptr.addr120 = getelementptr ptr, ptr %vtable.ptr119, i64 5
  %method.ptr121 = load ptr, ptr %method.ptr.addr120, align 8
  %dispatch.result122 = call ptr %method.ptr121(ptr %self115, ptr @.str.9544385186769949644)
  %self123 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull126 = icmp eq ptr %self123, null
  br i1 %dispatch.isnull126, label %dispatch.abort125, label %dispatch.ok124

dispatch.abort117:                                ; preds = %then114
  call void @abort()
  unreachable

dispatch.ok124:                                   ; preds = %dispatch.ok116
  %vtable.ptr127 = load ptr, ptr %self123, align 8
  %method.ptr.addr128 = getelementptr ptr, ptr %vtable.ptr127, i64 5
  %method.ptr129 = load ptr, ptr %method.ptr.addr128, align 8
  %dispatch.result130 = call ptr %method.ptr129(ptr %self123, ptr @.str.18400681194753865968)
  %self131 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull134 = icmp eq ptr %self131, null
  br i1 %dispatch.isnull134, label %dispatch.abort133, label %dispatch.ok132

dispatch.abort125:                                ; preds = %dispatch.ok116
  call void @abort()
  unreachable

dispatch.ok132:                                   ; preds = %dispatch.ok124
  %vtable.ptr135 = load ptr, ptr %self131, align 8
  %method.ptr.addr136 = getelementptr ptr, ptr %vtable.ptr135, i64 12
  %method.ptr137 = load ptr, ptr %method.ptr.addr136, align 8
  %to138 = load i32, ptr %to.addr, align 4
  %candidate139 = load i32, ptr %candidate, align 4
  %dispatch.result140 = call ptr %method.ptr137(ptr %self131, i32 %to138, i32 %candidate139)
  br label %ifcont158

dispatch.abort133:                                ; preds = %dispatch.ok124
  call void @abort()
  unreachable

else141:                                          ; preds = %dispatch.ok104
  %self142 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull145 = icmp eq ptr %self142, null
  br i1 %dispatch.isnull145, label %dispatch.abort144, label %dispatch.ok143

dispatch.ok143:                                   ; preds = %else141
  %vtable.ptr146 = load ptr, ptr %self142, align 8
  %method.ptr.addr147 = getelementptr ptr, ptr %vtable.ptr146, i64 5
  %method.ptr148 = load ptr, ptr %method.ptr.addr147, align 8
  %dispatch.result149 = call ptr %method.ptr148(ptr %self142, ptr @.str.10550092050098466617)
  %self150 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull153 = icmp eq ptr %self150, null
  br i1 %dispatch.isnull153, label %dispatch.abort152, label %dispatch.ok151

dispatch.abort144:                                ; preds = %else141
  call void @abort()
  unreachable

dispatch.ok151:                                   ; preds = %dispatch.ok143
  %vtable.ptr154 = load ptr, ptr %self150, align 8
  %method.ptr.addr155 = getelementptr ptr, ptr %vtable.ptr154, i64 5
  %method.ptr156 = load ptr, ptr %method.ptr.addr155, align 8
  %dispatch.result157 = call ptr %method.ptr156(ptr %self150, ptr @.str.18400681194753865968)
  br label %ifcont158

dispatch.abort152:                                ; preds = %dispatch.ok143
  call void @abort()
  unreachable

ifcont158:                                        ; preds = %dispatch.ok151, %dispatch.ok132
  %cond_result159 = phi ptr [ %dispatch.result140, %dispatch.ok132 ], [ null, %dispatch.ok151 ]
  ret ptr %cond_result159
}

define ptr @ShortestPath.run_rounds(ptr %this, ptr %edges, i32 %round, i32 %total) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %edges.addr = alloca ptr, align 8
  store ptr %edges, ptr %edges.addr, align 8
  %round.addr = alloca i32, align 4
  store i32 %round, ptr %round.addr, align 4
  %total.addr = alloca i32, align 4
  store i32 %total, ptr %total.addr, align 4
  %total1 = load i32, ptr %total.addr, align 4
  %round2 = load i32, ptr %round.addr, align 4
  %cmptmp = icmp slt i32 %total1, %round2
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  br label %ifcont

else:                                             ; preds = %entry
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %else
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.1521657259370731167)
  %self3 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull6 = icmp eq ptr %self3, null
  br i1 %dispatch.isnull6, label %dispatch.abort5, label %dispatch.ok4

dispatch.abort:                                   ; preds = %else
  call void @abort()
  unreachable

dispatch.ok4:                                     ; preds = %dispatch.ok
  %vtable.ptr7 = load ptr, ptr %self3, align 8
  %method.ptr.addr8 = getelementptr ptr, ptr %vtable.ptr7, i64 6
  %method.ptr9 = load ptr, ptr %method.ptr.addr8, align 8
  %round10 = load i32, ptr %round.addr, align 4
  %dispatch.result11 = call ptr %method.ptr9(ptr %self3, i32 %round10)
  %self12 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull15 = icmp eq ptr %self12, null
  br i1 %dispatch.isnull15, label %dispatch.abort14, label %dispatch.ok13

dispatch.abort5:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok13:                                    ; preds = %dispatch.ok4
  %vtable.ptr16 = load ptr, ptr %self12, align 8
  %method.ptr.addr17 = getelementptr ptr, ptr %vtable.ptr16, i64 5
  %method.ptr18 = load ptr, ptr %method.ptr.addr17, align 8
  %dispatch.result19 = call ptr %method.ptr18(ptr %self12, ptr @.str.18400681194753865968)
  %edges20 = load ptr, ptr %edges.addr, align 8
  %dispatch.isnull23 = icmp eq ptr %edges20, null
  br i1 %dispatch.isnull23, label %dispatch.abort22, label %dispatch.ok21

dispatch.abort14:                                 ; preds = %dispatch.ok4
  call void @abort()
  unreachable

dispatch.ok21:                                    ; preds = %dispatch.ok13
  %vtable.ptr24 = load ptr, ptr %edges20, align 8
  %method.ptr.addr25 = getelementptr ptr, ptr %vtable.ptr24, i64 5
  %method.ptr26 = load ptr, ptr %method.ptr.addr25, align 8
  %self27 = load ptr, ptr %this.addr, align 8
  %dispatch.result28 = call ptr %method.ptr26(ptr %edges20, ptr %self27)
  %self29 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull32 = icmp eq ptr %self29, null
  br i1 %dispatch.isnull32, label %dispatch.abort31, label %dispatch.ok30

dispatch.abort22:                                 ; preds = %dispatch.ok13
  call void @abort()
  unreachable

dispatch.ok30:                                    ; preds = %dispatch.ok21
  %vtable.ptr33 = load ptr, ptr %self29, align 8
  %method.ptr.addr34 = getelementptr ptr, ptr %vtable.ptr33, i64 5
  %method.ptr35 = load ptr, ptr %method.ptr.addr34, align 8
  %dispatch.result36 = call ptr %method.ptr35(ptr %self29, ptr @.str.5656352819608236931)
  %self37 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull40 = icmp eq ptr %self37, null
  br i1 %dispatch.isnull40, label %dispatch.abort39, label %dispatch.ok38

dispatch.abort31:                                 ; preds = %dispatch.ok21
  call void @abort()
  unreachable

dispatch.ok38:                                    ; preds = %dispatch.ok30
  %vtable.ptr41 = load ptr, ptr %self37, align 8
  %method.ptr.addr42 = getelementptr ptr, ptr %vtable.ptr41, i64 6
  %method.ptr43 = load ptr, ptr %method.ptr.addr42, align 8
  %round44 = load i32, ptr %round.addr, align 4
  %dispatch.result45 = call ptr %method.ptr43(ptr %self37, i32 %round44)
  %self46 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull49 = icmp eq ptr %self46, null
  br i1 %dispatch.isnull49, label %dispatch.abort48, label %dispatch.ok47

dispatch.abort39:                                 ; preds = %dispatch.ok30
  call void @abort()
  unreachable

dispatch.ok47:                                    ; preds = %dispatch.ok38
  %vtable.ptr50 = load ptr, ptr %self46, align 8
  %method.ptr.addr51 = getelementptr ptr, ptr %vtable.ptr50, i64 5
  %method.ptr52 = load ptr, ptr %method.ptr.addr51, align 8
  %dispatch.result53 = call ptr %method.ptr52(ptr %self46, ptr @.str.18400681194753865968)
  %self54 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull57 = icmp eq ptr %self54, null
  br i1 %dispatch.isnull57, label %dispatch.abort56, label %dispatch.ok55

dispatch.abort48:                                 ; preds = %dispatch.ok38
  call void @abort()
  unreachable

dispatch.ok55:                                    ; preds = %dispatch.ok47
  %vtable.ptr58 = load ptr, ptr %self54, align 8
  %method.ptr.addr59 = getelementptr ptr, ptr %vtable.ptr58, i64 15
  %method.ptr60 = load ptr, ptr %method.ptr.addr59, align 8
  %dispatch.result61 = call ptr %method.ptr60(ptr %self54)
  %self62 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull65 = icmp eq ptr %self62, null
  br i1 %dispatch.isnull65, label %dispatch.abort64, label %dispatch.ok63

dispatch.abort56:                                 ; preds = %dispatch.ok47
  call void @abort()
  unreachable

dispatch.ok63:                                    ; preds = %dispatch.ok55
  %vtable.ptr66 = load ptr, ptr %self62, align 8
  %method.ptr.addr67 = getelementptr ptr, ptr %vtable.ptr66, i64 17
  %method.ptr68 = load ptr, ptr %method.ptr.addr67, align 8
  %edges69 = load ptr, ptr %edges.addr, align 8
  %round70 = load i32, ptr %round.addr, align 4
  %addtmp = add i32 %round70, 1
  %total71 = load i32, ptr %total.addr, align 4
  %dispatch.result72 = call ptr %method.ptr68(ptr %self62, ptr %edges69, i32 %addtmp, i32 %total71)
  br label %ifcont

dispatch.abort64:                                 ; preds = %dispatch.ok55
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok63, %then
  %cond_result = phi ptr [ null, %then ], [ %dispatch.result72, %dispatch.ok63 ]
  ret ptr %cond_result
}

define ptr @ShortestPath.run(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %edges = alloca ptr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 10
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self)
  store ptr %dispatch.result, ptr %edges, align 8
  %self1 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull4 = icmp eq ptr %self1, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %self1, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 5
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %dispatch.result8 = call ptr %method.ptr7(ptr %self1, ptr @.str.3946395368134810345)
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
  %dispatch.result16 = call ptr %method.ptr15(ptr %self9, ptr @.str.14434693932068933153)
  %self17 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull20 = icmp eq ptr %self17, null
  br i1 %dispatch.isnull20, label %dispatch.abort19, label %dispatch.ok18

dispatch.abort11:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable

dispatch.ok18:                                    ; preds = %dispatch.ok10
  %vtable.ptr21 = load ptr, ptr %self17, align 8
  %method.ptr.addr22 = getelementptr ptr, ptr %vtable.ptr21, i64 15
  %method.ptr23 = load ptr, ptr %method.ptr.addr22, align 8
  %dispatch.result24 = call ptr %method.ptr23(ptr %self17)
  %self25 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull28 = icmp eq ptr %self25, null
  br i1 %dispatch.isnull28, label %dispatch.abort27, label %dispatch.ok26

dispatch.abort19:                                 ; preds = %dispatch.ok10
  call void @abort()
  unreachable

dispatch.ok26:                                    ; preds = %dispatch.ok18
  %vtable.ptr29 = load ptr, ptr %self25, align 8
  %method.ptr.addr30 = getelementptr ptr, ptr %vtable.ptr29, i64 17
  %method.ptr31 = load ptr, ptr %method.ptr.addr30, align 8
  %edges32 = load ptr, ptr %edges, align 8
  %dispatch.result33 = call ptr %method.ptr31(ptr %self25, ptr %edges32, i32 1, i32 9)
  %self34 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull37 = icmp eq ptr %self34, null
  br i1 %dispatch.isnull37, label %dispatch.abort36, label %dispatch.ok35

dispatch.abort27:                                 ; preds = %dispatch.ok18
  call void @abort()
  unreachable

dispatch.ok35:                                    ; preds = %dispatch.ok26
  %vtable.ptr38 = load ptr, ptr %self34, align 8
  %method.ptr.addr39 = getelementptr ptr, ptr %vtable.ptr38, i64 5
  %method.ptr40 = load ptr, ptr %method.ptr.addr39, align 8
  %dispatch.result41 = call ptr %method.ptr40(ptr %self34, ptr @.str.13656733524725639206)
  %self42 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull45 = icmp eq ptr %self42, null
  br i1 %dispatch.isnull45, label %dispatch.abort44, label %dispatch.ok43

dispatch.abort36:                                 ; preds = %dispatch.ok26
  call void @abort()
  unreachable

dispatch.ok43:                                    ; preds = %dispatch.ok35
  %vtable.ptr46 = load ptr, ptr %self42, align 8
  %method.ptr.addr47 = getelementptr ptr, ptr %vtable.ptr46, i64 5
  %method.ptr48 = load ptr, ptr %method.ptr.addr47, align 8
  %dispatch.result49 = call ptr %method.ptr48(ptr %self42, ptr @.str.14987737716956691062)
  %self50 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull53 = icmp eq ptr %self50, null
  br i1 %dispatch.isnull53, label %dispatch.abort52, label %dispatch.ok51

dispatch.abort44:                                 ; preds = %dispatch.ok35
  call void @abort()
  unreachable

dispatch.ok51:                                    ; preds = %dispatch.ok43
  %vtable.ptr54 = load ptr, ptr %self50, align 8
  %method.ptr.addr55 = getelementptr ptr, ptr %vtable.ptr54, i64 13
  %method.ptr56 = load ptr, ptr %method.ptr.addr55, align 8
  %self57 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull60 = icmp eq ptr %self57, null
  br i1 %dispatch.isnull60, label %dispatch.abort59, label %dispatch.ok58

dispatch.abort52:                                 ; preds = %dispatch.ok43
  call void @abort()
  unreachable

dispatch.ok58:                                    ; preds = %dispatch.ok51
  %vtable.ptr61 = load ptr, ptr %self57, align 8
  %method.ptr.addr62 = getelementptr ptr, ptr %vtable.ptr61, i64 11
  %method.ptr63 = load ptr, ptr %method.ptr.addr62, align 8
  %dispatch.result64 = call i32 %method.ptr63(ptr %self57, i32 10)
  %dispatch.result65 = call ptr %method.ptr56(ptr %self50, i32 %dispatch.result64)
  %self66 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull69 = icmp eq ptr %self66, null
  br i1 %dispatch.isnull69, label %dispatch.abort68, label %dispatch.ok67

dispatch.abort59:                                 ; preds = %dispatch.ok51
  call void @abort()
  unreachable

dispatch.ok67:                                    ; preds = %dispatch.ok58
  %vtable.ptr70 = load ptr, ptr %self66, align 8
  %method.ptr.addr71 = getelementptr ptr, ptr %vtable.ptr70, i64 5
  %method.ptr72 = load ptr, ptr %method.ptr.addr71, align 8
  %dispatch.result73 = call ptr %method.ptr72(ptr %self66, ptr @.str.18400681194753865968)
  ret ptr %dispatch.result73

dispatch.abort68:                                 ; preds = %dispatch.ok58
  call void @abort()
  unreachable
}

define ptr @Main.main(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %ShortestPath.newtmp = call ptr @ShortestPath.new()
  %dispatch.isnull = icmp eq ptr %ShortestPath.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %ShortestPath.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 9
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %ShortestPath.newtmp)
  %dispatch.isnull3 = icmp eq ptr %dispatch.result, null
  br i1 %dispatch.isnull3, label %dispatch.abort2, label %dispatch.ok1

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok1:                                     ; preds = %dispatch.ok
  %vtable.ptr4 = load ptr, ptr %dispatch.result, align 8
  %method.ptr.addr5 = getelementptr ptr, ptr %vtable.ptr4, i64 18
  %method.ptr6 = load ptr, ptr %method.ptr.addr5, align 8
  %dispatch.result7 = call ptr %method.ptr6(ptr %dispatch.result)
  ret ptr %dispatch.result7

dispatch.abort2:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable
}

define void @_ZN8EdgeListC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.EdgeList, ptr %this, i32 0, i32 0
  call void @_ZN6ObjectC2Ev(ptr %parent.subobject)
  store ptr @_ZTV8EdgeList, ptr %this, align 8
  ret void
}

define ptr @EdgeList.new() {
entry:
  %0 = call ptr @malloc(i64 8)
  call void @_ZN8EdgeListC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN8EdgeConsC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.EdgeCons, ptr %this, i32 0, i32 0
  call void @_ZN8EdgeListC2Ev(ptr %parent.subobject)
  store ptr @_ZTV8EdgeCons, ptr %this, align 8
  %from_v.addr.byte = getelementptr i8, ptr %this, i64 8
  store i32 0, ptr %from_v.addr.byte, align 4
  %to_v.addr.byte = getelementptr i8, ptr %this, i64 16
  store i32 0, ptr %to_v.addr.byte, align 4
  %weight_v.addr.byte = getelementptr i8, ptr %this, i64 24
  store i32 0, ptr %weight_v.addr.byte, align 4
  %rest_v.addr.byte = getelementptr i8, ptr %this, i64 32
  store ptr null, ptr %rest_v.addr.byte, align 8
  ret void
}

define ptr @EdgeCons.new() {
entry:
  %0 = call ptr @malloc(i64 40)
  call void @_ZN8EdgeConsC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN12ShortestPathC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.ShortestPath, ptr %this, i32 0, i32 0
  call void @_ZN2IOC2Ev(ptr %parent.subobject)
  store ptr @_ZTV12ShortestPath, ptr %this, align 8
  %inf.addr.byte = getelementptr i8, ptr %this, i64 8
  store i32 9999, ptr %inf.addr.byte, align 4
  %d1.addr.byte = getelementptr i8, ptr %this, i64 16
  store i32 9999, ptr %d1.addr.byte, align 4
  %d2.addr.byte = getelementptr i8, ptr %this, i64 24
  store i32 9999, ptr %d2.addr.byte, align 4
  %d3.addr.byte = getelementptr i8, ptr %this, i64 32
  store i32 9999, ptr %d3.addr.byte, align 4
  %d4.addr.byte = getelementptr i8, ptr %this, i64 40
  store i32 9999, ptr %d4.addr.byte, align 4
  %d5.addr.byte = getelementptr i8, ptr %this, i64 48
  store i32 9999, ptr %d5.addr.byte, align 4
  %d6.addr.byte = getelementptr i8, ptr %this, i64 56
  store i32 9999, ptr %d6.addr.byte, align 4
  %d7.addr.byte = getelementptr i8, ptr %this, i64 64
  store i32 9999, ptr %d7.addr.byte, align 4
  %d8.addr.byte = getelementptr i8, ptr %this, i64 72
  store i32 9999, ptr %d8.addr.byte, align 4
  %d9.addr.byte = getelementptr i8, ptr %this, i64 80
  store i32 9999, ptr %d9.addr.byte, align 4
  %d10.addr.byte = getelementptr i8, ptr %this, i64 88
  store i32 9999, ptr %d10.addr.byte, align 4
  ret void
}

define ptr @ShortestPath.new() {
entry:
  %0 = call ptr @malloc(i64 96)
  call void @_ZN12ShortestPathC2Ev(ptr %0)
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
