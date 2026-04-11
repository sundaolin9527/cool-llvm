; ModuleID = 'main_module'
source_filename = "main_module"

%struct.__cxxabiv1.__class_type_info = type { ptr, ptr }
%struct.__cxxabiv1.__si_class_type_info = type { ptr, ptr, ptr }
%class.Int = type { %class.Object.0, i32, [4 x i8] }
%class.Object.0 = type { ptr }
%class.Bool = type { %class.Object.0, i1, [7 x i8] }
%class.String = type { %class.Object.0, ptr, i32, [4 x i8], i32, [4 x i8] }
%class.IO.1 = type { %class.Object.0 }
%class.Graph = type { %class.Object.0, ptr, ptr }
%class.Vertice = type { %class.IO.1, i32, [4 x i8], ptr }
%class.Edge = type { %class.IO.1, i32, [4 x i8], i32, [4 x i8], i32, [4 x i8] }
%class.EList = type { %class.IO.1, ptr }
%class.ECons = type { %class.EList, ptr }
%class.VList = type { %class.IO.1, ptr }
%class.VCons = type { %class.VList, ptr }
%class.Parse = type { %class.IO.1, ptr, ptr }
%class.Main = type { %class.Parse }
%class.BoolOp = type { %class.Object.0 }

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
@_ZTS5Graph = linkonce_odr constant [7 x i8] c"5Graph\00", align 1
@_ZTI5Graph = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS5Graph, ptr @_ZTI6Object }, align 8
@_ZTV5Graph = linkonce_odr constant [8 x ptr] [ptr null, ptr @_ZTI5Graph, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @Graph.add_vertice, ptr @Graph.print_E, ptr @Graph.print_V], align 8
@_ZTS7Vertice = linkonce_odr constant [9 x i8] c"7Vertice\00", align 1
@_ZTI7Vertice = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS7Vertice, ptr @_ZTI2IO }, align 8
@_ZTV7Vertice = linkonce_odr constant [14 x ptr] [ptr null, ptr @_ZTI7Vertice, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Vertice.outgoing, ptr @Vertice.number, ptr @Vertice.init, ptr @Vertice.add_out, ptr @Vertice.print], align 8
@_ZTS4Edge = linkonce_odr constant [6 x i8] c"4Edge\00", align 1
@_ZTI4Edge = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Edge, ptr @_ZTI2IO }, align 8
@_ZTV4Edge = linkonce_odr constant [11 x ptr] [ptr null, ptr @_ZTI4Edge, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Edge.init, ptr @Edge.print], align 8
@_ZTS5EList = linkonce_odr constant [7 x i8] c"5EList\00", align 1
@_ZTI5EList = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS5EList, ptr @_ZTI2IO }, align 8
@_ZTV5EList = linkonce_odr constant [15 x ptr] [ptr null, ptr @_ZTI5EList, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @EList.isNil, ptr @EList.head, ptr @EList.tail, ptr @EList.cons, ptr @EList.append, ptr @EList.print], align 8
@_ZTS5ECons = linkonce_odr constant [7 x i8] c"5ECons\00", align 1
@_ZTI5ECons = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS5ECons, ptr @_ZTI5EList }, align 8
@_ZTV5ECons = linkonce_odr constant [16 x ptr] [ptr null, ptr @_ZTI5ECons, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @ECons.isNil, ptr @ECons.head, ptr @ECons.tail, ptr @EList.cons, ptr @EList.append, ptr @ECons.print, ptr @ECons.init], align 8
@_ZTS5VList = linkonce_odr constant [7 x i8] c"5VList\00", align 1
@_ZTI5VList = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS5VList, ptr @_ZTI2IO }, align 8
@_ZTV5VList = linkonce_odr constant [14 x ptr] [ptr null, ptr @_ZTI5VList, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @VList.isNil, ptr @VList.head, ptr @VList.tail, ptr @VList.cons, ptr @VList.print], align 8
@_ZTS5VCons = linkonce_odr constant [7 x i8] c"5VCons\00", align 1
@_ZTI5VCons = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS5VCons, ptr @_ZTI5VList }, align 8
@_ZTV5VCons = linkonce_odr constant [15 x ptr] [ptr null, ptr @_ZTI5VCons, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @VCons.isNil, ptr @VCons.head, ptr @VCons.tail, ptr @VList.cons, ptr @VCons.print, ptr @VCons.init], align 8
@_ZTS5Parse = linkonce_odr constant [7 x i8] c"5Parse\00", align 1
@_ZTI5Parse = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS5Parse, ptr @_ZTI2IO }, align 8
@_ZTV5Parse = linkonce_odr constant [14 x ptr] [ptr null, ptr @_ZTI5Parse, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Parse.read_input, ptr @Parse.parse_line, ptr @Parse.c2i, ptr @Parse.a2i, ptr @Parse.a2i_aux], align 8
@_ZTS4Main = linkonce_odr constant [6 x i8] c"4Main\00", align 1
@_ZTI4Main = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Main, ptr @_ZTI5Parse }, align 8
@_ZTV4Main = linkonce_odr constant [15 x ptr] [ptr null, ptr @_ZTI4Main, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Parse.read_input, ptr @Parse.parse_line, ptr @Parse.c2i, ptr @Parse.a2i, ptr @Parse.a2i_aux, ptr @Main.main], align 8
@_ZTS6BoolOp = linkonce_odr constant [8 x i8] c"6BoolOp\00", align 1
@_ZTI6BoolOp = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS6BoolOp, ptr @_ZTI6Object }, align 8
@_ZTV6BoolOp = linkonce_odr constant [7 x ptr] [ptr null, ptr @_ZTI6BoolOp, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @BoolOp.and, ptr @BoolOp.or], align 8
@.str.13825931121855826003 = private constant [3 x i8] c" (\00"
@.str.4706206694200543916 = private constant [2 x i8] c",\00"
@.str.12868445110721718657 = private constant [2 x i8] c")\00"
@.str.18400681194753865968 = private constant [2 x i8] c"\0A\00"
@.str.7372855250431704371 = private constant [2 x i8] c"-\00"
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

define ptr @Graph.add_vertice(ptr %this, ptr %v) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %v1 = load ptr, ptr %v.addr, align 8
  %dispatch.isnull = icmp eq ptr %v1, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %v1, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 9
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %v1)
  %dispatch.isnull4 = icmp eq ptr %dispatch.result, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %dispatch.result, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 13
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %self = load ptr, ptr %this.addr, align 8
  %edges.addr = getelementptr i8, ptr %self, i32 16
  %edges = load ptr, ptr %edges.addr, align 8
  %dispatch.result8 = call ptr %method.ptr7(ptr %dispatch.result, ptr %edges)
  %self9 = load ptr, ptr %this.addr, align 8
  %edges.addr10 = getelementptr i8, ptr %self9, i32 16
  store ptr %dispatch.result8, ptr %edges.addr10, align 8
  %self11 = load ptr, ptr %this.addr, align 8
  %vertices.addr = getelementptr i8, ptr %self11, i32 8
  %vertices = load ptr, ptr %vertices.addr, align 8
  %dispatch.isnull14 = icmp eq ptr %vertices, null
  br i1 %dispatch.isnull14, label %dispatch.abort13, label %dispatch.ok12

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok12:                                    ; preds = %dispatch.ok2
  %vtable.ptr15 = load ptr, ptr %vertices, align 8
  %method.ptr.addr16 = getelementptr ptr, ptr %vtable.ptr15, i64 12
  %method.ptr17 = load ptr, ptr %method.ptr.addr16, align 8
  %v18 = load ptr, ptr %v.addr, align 8
  %dispatch.result19 = call ptr %method.ptr17(ptr %vertices, ptr %v18)
  %self20 = load ptr, ptr %this.addr, align 8
  %vertices.addr21 = getelementptr i8, ptr %self20, i32 8
  store ptr %dispatch.result19, ptr %vertices.addr21, align 8
  ret ptr %dispatch.result19

dispatch.abort13:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable
}

define ptr @Graph.print_E(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %edges.addr = getelementptr i8, ptr %self, i32 16
  %edges = load ptr, ptr %edges.addr, align 8
  %dispatch.isnull = icmp eq ptr %edges, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %edges, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 14
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %edges)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @Graph.print_V(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %vertices.addr = getelementptr i8, ptr %self, i32 8
  %vertices = load ptr, ptr %vertices.addr, align 8
  %dispatch.isnull = icmp eq ptr %vertices, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %vertices, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 13
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %vertices)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @Vertice.outgoing(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %out.addr = getelementptr i8, ptr %self, i32 16
  %out = load ptr, ptr %out.addr, align 8
  ret ptr %out
}

define i32 @Vertice.number(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %num.addr = getelementptr i8, ptr %self, i32 8
  %num = load i32, ptr %num.addr, align 4
  ret i32 %num
}

define ptr @Vertice.init(ptr %this, i32 %n) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %n.addr = alloca i32, align 4
  store i32 %n, ptr %n.addr, align 4
  %n1 = load i32, ptr %n.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %num.addr = getelementptr i8, ptr %self, i32 8
  store i32 %n1, ptr %num.addr, align 4
  %self2 = load ptr, ptr %this.addr, align 8
  ret ptr %self2
}

define ptr @Vertice.add_out(ptr %this, ptr %s) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %s.addr = alloca ptr, align 8
  store ptr %s, ptr %s.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %out.addr = getelementptr i8, ptr %self, i32 16
  %out = load ptr, ptr %out.addr, align 8
  %dispatch.isnull = icmp eq ptr %out, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %out, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 12
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %s1 = load ptr, ptr %s.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %out, ptr %s1)
  %self2 = load ptr, ptr %this.addr, align 8
  %out.addr3 = getelementptr i8, ptr %self2, i32 16
  store ptr %dispatch.result, ptr %out.addr3, align 8
  %self4 = load ptr, ptr %this.addr, align 8
  ret ptr %self4

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @Vertice.print(ptr %this) {
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
  %num.addr = getelementptr i8, ptr %self1, i32 8
  %num = load i32, ptr %num.addr, align 4
  %dispatch.result = call ptr %method.ptr(ptr %self, i32 %num)
  %self2 = load ptr, ptr %this.addr, align 8
  %out.addr = getelementptr i8, ptr %self2, i32 16
  %out = load ptr, ptr %out.addr, align 8
  %dispatch.isnull5 = icmp eq ptr %out, null
  br i1 %dispatch.isnull5, label %dispatch.abort4, label %dispatch.ok3

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok3:                                     ; preds = %dispatch.ok
  %vtable.ptr6 = load ptr, ptr %out, align 8
  %method.ptr.addr7 = getelementptr ptr, ptr %vtable.ptr6, i64 14
  %method.ptr8 = load ptr, ptr %method.ptr.addr7, align 8
  %dispatch.result9 = call ptr %method.ptr8(ptr %out)
  ret ptr %dispatch.result9

dispatch.abort4:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable
}

define ptr @Edge.init(ptr %this, i32 %f, i32 %t, i32 %w) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %f.addr = alloca i32, align 4
  store i32 %f, ptr %f.addr, align 4
  %t.addr = alloca i32, align 4
  store i32 %t, ptr %t.addr, align 4
  %w.addr = alloca i32, align 4
  store i32 %w, ptr %w.addr, align 4
  %f1 = load i32, ptr %f.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %from.addr = getelementptr i8, ptr %self, i32 8
  store i32 %f1, ptr %from.addr, align 4
  %t2 = load i32, ptr %t.addr, align 4
  %self3 = load ptr, ptr %this.addr, align 8
  %to.addr = getelementptr i8, ptr %self3, i32 16
  store i32 %t2, ptr %to.addr, align 4
  %w4 = load i32, ptr %w.addr, align 4
  %self5 = load ptr, ptr %this.addr, align 8
  %weight.addr = getelementptr i8, ptr %self5, i32 24
  store i32 %w4, ptr %weight.addr, align 4
  %self6 = load ptr, ptr %this.addr, align 8
  ret ptr %self6
}

define ptr @Edge.print(ptr %this) {
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
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.13825931121855826003)
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
  %self8 = load ptr, ptr %this.addr, align 8
  %from.addr = getelementptr i8, ptr %self8, i32 8
  %from = load i32, ptr %from.addr, align 4
  %dispatch.result9 = call ptr %method.ptr7(ptr %self1, i32 %from)
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
  %dispatch.result17 = call ptr %method.ptr16(ptr %self10, ptr @.str.4706206694200543916)
  %self18 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull21 = icmp eq ptr %self18, null
  br i1 %dispatch.isnull21, label %dispatch.abort20, label %dispatch.ok19

dispatch.abort12:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable

dispatch.ok19:                                    ; preds = %dispatch.ok11
  %vtable.ptr22 = load ptr, ptr %self18, align 8
  %method.ptr.addr23 = getelementptr ptr, ptr %vtable.ptr22, i64 6
  %method.ptr24 = load ptr, ptr %method.ptr.addr23, align 8
  %self25 = load ptr, ptr %this.addr, align 8
  %to.addr = getelementptr i8, ptr %self25, i32 16
  %to = load i32, ptr %to.addr, align 4
  %dispatch.result26 = call ptr %method.ptr24(ptr %self18, i32 %to)
  %self27 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull30 = icmp eq ptr %self27, null
  br i1 %dispatch.isnull30, label %dispatch.abort29, label %dispatch.ok28

dispatch.abort20:                                 ; preds = %dispatch.ok11
  call void @abort()
  unreachable

dispatch.ok28:                                    ; preds = %dispatch.ok19
  %vtable.ptr31 = load ptr, ptr %self27, align 8
  %method.ptr.addr32 = getelementptr ptr, ptr %vtable.ptr31, i64 5
  %method.ptr33 = load ptr, ptr %method.ptr.addr32, align 8
  %dispatch.result34 = call ptr %method.ptr33(ptr %self27, ptr @.str.12868445110721718657)
  %self35 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull38 = icmp eq ptr %self35, null
  br i1 %dispatch.isnull38, label %dispatch.abort37, label %dispatch.ok36

dispatch.abort29:                                 ; preds = %dispatch.ok19
  call void @abort()
  unreachable

dispatch.ok36:                                    ; preds = %dispatch.ok28
  %vtable.ptr39 = load ptr, ptr %self35, align 8
  %method.ptr.addr40 = getelementptr ptr, ptr %vtable.ptr39, i64 6
  %method.ptr41 = load ptr, ptr %method.ptr.addr40, align 8
  %self42 = load ptr, ptr %this.addr, align 8
  %weight.addr = getelementptr i8, ptr %self42, i32 24
  %weight = load i32, ptr %weight.addr, align 4
  %dispatch.result43 = call ptr %method.ptr41(ptr %self35, i32 %weight)
  ret ptr %dispatch.result43

dispatch.abort37:                                 ; preds = %dispatch.ok28
  call void @abort()
  unreachable
}

define i1 @EList.isNil(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  ret i1 true
}

define ptr @EList.head(ptr %this) {
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

define ptr @EList.tail(ptr %this) {
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

define ptr @EList.cons(ptr %this, ptr %e) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %e.addr = alloca ptr, align 8
  store ptr %e, ptr %e.addr, align 8
  %ECons.newtmp = call ptr @ECons.new()
  %dispatch.isnull = icmp eq ptr %ECons.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %ECons.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 15
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %e1 = load ptr, ptr %e.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %ECons.newtmp, ptr %e1, ptr %self)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @EList.append(ptr %this, ptr %l) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %l.addr = alloca ptr, align 8
  store ptr %l, ptr %l.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 9
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call i1 %method.ptr(ptr %self)
  br i1 %dispatch.result, label %then, label %else

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

then:                                             ; preds = %dispatch.ok
  %l1 = load ptr, ptr %l.addr, align 8
  br label %ifcont

else:                                             ; preds = %dispatch.ok
  %self2 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull5 = icmp eq ptr %self2, null
  br i1 %dispatch.isnull5, label %dispatch.abort4, label %dispatch.ok3

dispatch.ok3:                                     ; preds = %else
  %vtable.ptr6 = load ptr, ptr %self2, align 8
  %method.ptr.addr7 = getelementptr ptr, ptr %vtable.ptr6, i64 11
  %method.ptr8 = load ptr, ptr %method.ptr.addr7, align 8
  %dispatch.result9 = call ptr %method.ptr8(ptr %self2)
  %dispatch.isnull12 = icmp eq ptr %dispatch.result9, null
  br i1 %dispatch.isnull12, label %dispatch.abort11, label %dispatch.ok10

dispatch.abort4:                                  ; preds = %else
  call void @abort()
  unreachable

dispatch.ok10:                                    ; preds = %dispatch.ok3
  %vtable.ptr13 = load ptr, ptr %dispatch.result9, align 8
  %method.ptr.addr14 = getelementptr ptr, ptr %vtable.ptr13, i64 13
  %method.ptr15 = load ptr, ptr %method.ptr.addr14, align 8
  %l16 = load ptr, ptr %l.addr, align 8
  %dispatch.result17 = call ptr %method.ptr15(ptr %dispatch.result9, ptr %l16)
  %dispatch.isnull20 = icmp eq ptr %dispatch.result17, null
  br i1 %dispatch.isnull20, label %dispatch.abort19, label %dispatch.ok18

dispatch.abort11:                                 ; preds = %dispatch.ok3
  call void @abort()
  unreachable

dispatch.ok18:                                    ; preds = %dispatch.ok10
  %vtable.ptr21 = load ptr, ptr %dispatch.result17, align 8
  %method.ptr.addr22 = getelementptr ptr, ptr %vtable.ptr21, i64 12
  %method.ptr23 = load ptr, ptr %method.ptr.addr22, align 8
  %self24 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull27 = icmp eq ptr %self24, null
  br i1 %dispatch.isnull27, label %dispatch.abort26, label %dispatch.ok25

dispatch.abort19:                                 ; preds = %dispatch.ok10
  call void @abort()
  unreachable

dispatch.ok25:                                    ; preds = %dispatch.ok18
  %vtable.ptr28 = load ptr, ptr %self24, align 8
  %method.ptr.addr29 = getelementptr ptr, ptr %vtable.ptr28, i64 10
  %method.ptr30 = load ptr, ptr %method.ptr.addr29, align 8
  %dispatch.result31 = call ptr %method.ptr30(ptr %self24)
  %dispatch.result32 = call ptr %method.ptr23(ptr %dispatch.result17, ptr %dispatch.result31)
  br label %ifcont

dispatch.abort26:                                 ; preds = %dispatch.ok18
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok25, %then
  %cond_result = phi ptr [ %l1, %then ], [ %dispatch.result32, %dispatch.ok25 ]
  ret ptr %cond_result
}

define ptr @EList.print(ptr %this) {
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

define i1 @ECons.isNil(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  ret i1 false
}

define ptr @ECons.head(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %car.addr = getelementptr i8, ptr %self, i32 8
  %car = load ptr, ptr %car.addr, align 8
  ret ptr %car
}

define ptr @ECons.tail(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %cdr.addr = getelementptr i8, ptr %self, i32 16
  %cdr = load ptr, ptr %cdr.addr, align 8
  ret ptr %cdr
}

define ptr @ECons.init(ptr %this, ptr %e, ptr %rest) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %e.addr = alloca ptr, align 8
  store ptr %e, ptr %e.addr, align 8
  %rest.addr = alloca ptr, align 8
  store ptr %rest, ptr %rest.addr, align 8
  %e1 = load ptr, ptr %e.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %car.addr = getelementptr i8, ptr %self, i32 8
  store ptr %e1, ptr %car.addr, align 8
  %rest2 = load ptr, ptr %rest.addr, align 8
  %self3 = load ptr, ptr %this.addr, align 8
  %cdr.addr = getelementptr i8, ptr %self3, i32 16
  store ptr %rest2, ptr %cdr.addr, align 8
  %self4 = load ptr, ptr %this.addr, align 8
  ret ptr %self4
}

define ptr @ECons.print(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %car.addr = getelementptr i8, ptr %self, i32 8
  %car = load ptr, ptr %car.addr, align 8
  %dispatch.isnull = icmp eq ptr %car, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %car, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 10
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %car)
  %self1 = load ptr, ptr %this.addr, align 8
  %cdr.addr = getelementptr i8, ptr %self1, i32 16
  %cdr = load ptr, ptr %cdr.addr, align 8
  %dispatch.isnull4 = icmp eq ptr %cdr, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %cdr, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 14
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %dispatch.result8 = call ptr %method.ptr7(ptr %cdr)
  ret ptr %dispatch.result8

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable
}

define i1 @VList.isNil(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  ret i1 true
}

define ptr @VList.head(ptr %this) {
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

define ptr @VList.tail(ptr %this) {
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

define ptr @VList.cons(ptr %this, ptr %v) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %VCons.newtmp = call ptr @VCons.new()
  %dispatch.isnull = icmp eq ptr %VCons.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %VCons.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 14
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %v1 = load ptr, ptr %v.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %VCons.newtmp, ptr %v1, ptr %self)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @VList.print(ptr %this) {
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

define i1 @VCons.isNil(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  ret i1 false
}

define ptr @VCons.head(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %car.addr = getelementptr i8, ptr %self, i32 8
  %car = load ptr, ptr %car.addr, align 8
  ret ptr %car
}

define ptr @VCons.tail(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %cdr.addr = getelementptr i8, ptr %self, i32 16
  %cdr = load ptr, ptr %cdr.addr, align 8
  ret ptr %cdr
}

define ptr @VCons.init(ptr %this, ptr %v, ptr %rest) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %rest.addr = alloca ptr, align 8
  store ptr %rest, ptr %rest.addr, align 8
  %v1 = load ptr, ptr %v.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %car.addr = getelementptr i8, ptr %self, i32 8
  store ptr %v1, ptr %car.addr, align 8
  %rest2 = load ptr, ptr %rest.addr, align 8
  %self3 = load ptr, ptr %this.addr, align 8
  %cdr.addr = getelementptr i8, ptr %self3, i32 16
  store ptr %rest2, ptr %cdr.addr, align 8
  %self4 = load ptr, ptr %this.addr, align 8
  ret ptr %self4
}

define ptr @VCons.print(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %car.addr = getelementptr i8, ptr %self, i32 8
  %car = load ptr, ptr %car.addr, align 8
  %dispatch.isnull = icmp eq ptr %car, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %car, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 13
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %car)
  %self1 = load ptr, ptr %this.addr, align 8
  %cdr.addr = getelementptr i8, ptr %self1, i32 16
  %cdr = load ptr, ptr %cdr.addr, align 8
  %dispatch.isnull4 = icmp eq ptr %cdr, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %cdr, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 13
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %dispatch.result8 = call ptr %method.ptr7(ptr %cdr)
  ret ptr %dispatch.result8

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable
}

define ptr @Parse.read_input(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %g = alloca ptr, align 8
  %Graph.newtmp = call ptr @Graph.new()
  store ptr %Graph.newtmp, ptr %g, align 8
  %line = alloca ptr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 7
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self)
  store ptr %dispatch.result, ptr %line, align 8
  br label %loop.cond

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

loop.cond:                                        ; preds = %dispatch.ok31, %dispatch.ok
  %self1 = load ptr, ptr %this.addr, align 8
  %boolop.addr = getelementptr i8, ptr %self1, i32 8
  %boolop = load ptr, ptr %boolop.addr, align 8
  %dispatch.isnull4 = icmp eq ptr %boolop, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

loop.body:                                        ; preds = %dispatch.ok2
  %g13 = load ptr, ptr %g, align 8
  %dispatch.isnull16 = icmp eq ptr %g13, null
  br i1 %dispatch.isnull16, label %dispatch.abort15, label %dispatch.ok14

loop.after:                                       ; preds = %dispatch.ok2
  %g38 = load ptr, ptr %g, align 8
  ret ptr %g38

dispatch.ok2:                                     ; preds = %loop.cond
  %vtable.ptr5 = load ptr, ptr %boolop, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 5
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %line8 = load ptr, ptr %line, align 8
  %eqtmp = call i1 @String_equals(ptr %line8, ptr @.str.18400681194753865968)
  %comptmp = xor i1 %eqtmp, true
  %line9 = load ptr, ptr %line, align 8
  %eqtmp10 = call i1 @String_equals(ptr %line9, ptr @.str.const.6142509188972423790)
  %comptmp11 = xor i1 %eqtmp10, true
  %dispatch.result12 = call i1 %method.ptr7(ptr %boolop, i1 %comptmp, i1 %comptmp11)
  br i1 %dispatch.result12, label %loop.body, label %loop.after

dispatch.abort3:                                  ; preds = %loop.cond
  call void @abort()
  unreachable

dispatch.ok14:                                    ; preds = %loop.body
  %vtable.ptr17 = load ptr, ptr %g13, align 8
  %method.ptr.addr18 = getelementptr ptr, ptr %vtable.ptr17, i64 5
  %method.ptr19 = load ptr, ptr %method.ptr.addr18, align 8
  %self20 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull23 = icmp eq ptr %self20, null
  br i1 %dispatch.isnull23, label %dispatch.abort22, label %dispatch.ok21

dispatch.abort15:                                 ; preds = %loop.body
  call void @abort()
  unreachable

dispatch.ok21:                                    ; preds = %dispatch.ok14
  %vtable.ptr24 = load ptr, ptr %self20, align 8
  %method.ptr.addr25 = getelementptr ptr, ptr %vtable.ptr24, i64 10
  %method.ptr26 = load ptr, ptr %method.ptr.addr25, align 8
  %line27 = load ptr, ptr %line, align 8
  %dispatch.result28 = call ptr %method.ptr26(ptr %self20, ptr %line27)
  %dispatch.result29 = call ptr %method.ptr19(ptr %g13, ptr %dispatch.result28)
  %self30 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull33 = icmp eq ptr %self30, null
  br i1 %dispatch.isnull33, label %dispatch.abort32, label %dispatch.ok31

dispatch.abort22:                                 ; preds = %dispatch.ok14
  call void @abort()
  unreachable

dispatch.ok31:                                    ; preds = %dispatch.ok21
  %vtable.ptr34 = load ptr, ptr %self30, align 8
  %method.ptr.addr35 = getelementptr ptr, ptr %vtable.ptr34, i64 7
  %method.ptr36 = load ptr, ptr %method.ptr.addr35, align 8
  %dispatch.result37 = call ptr %method.ptr36(ptr %self30)
  store ptr %dispatch.result37, ptr %line, align 8
  br label %loop.cond

dispatch.abort32:                                 ; preds = %dispatch.ok21
  call void @abort()
  unreachable
}

define ptr @Parse.parse_line(ptr %this, ptr %s) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %s.addr = alloca ptr, align 8
  store ptr %s, ptr %s.addr, align 8
  %v = alloca ptr, align 8
  %Vertice.newtmp = call ptr @Vertice.new()
  %dispatch.isnull = icmp eq ptr %Vertice.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %Vertice.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 11
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull3 = icmp eq ptr %self, null
  br i1 %dispatch.isnull3, label %dispatch.abort2, label %dispatch.ok1

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok1:                                     ; preds = %dispatch.ok
  %vtable.ptr4 = load ptr, ptr %self, align 8
  %method.ptr.addr5 = getelementptr ptr, ptr %vtable.ptr4, i64 12
  %method.ptr6 = load ptr, ptr %method.ptr.addr5, align 8
  %s7 = load ptr, ptr %s.addr, align 8
  %dispatch.result = call i32 %method.ptr6(ptr %self, ptr %s7)
  %dispatch.result8 = call ptr %method.ptr(ptr %Vertice.newtmp, i32 %dispatch.result)
  store ptr %dispatch.result8, ptr %v, align 8
  br label %loop.cond

dispatch.abort2:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

loop.cond:                                        ; preds = %dispatch.ok50, %dispatch.ok1
  %self9 = load ptr, ptr %this.addr, align 8
  %rest.addr = getelementptr i8, ptr %self9, i32 16
  %rest = load ptr, ptr %rest.addr, align 8
  %dispatch.isnull12 = icmp eq ptr %rest, null
  br i1 %dispatch.isnull12, label %dispatch.abort11, label %dispatch.ok10

loop.body:                                        ; preds = %dispatch.ok10
  %succ = alloca i32, align 4
  %self14 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull17 = icmp eq ptr %self14, null
  br i1 %dispatch.isnull17, label %dispatch.abort16, label %dispatch.ok15

loop.after:                                       ; preds = %dispatch.ok10
  %v61 = load ptr, ptr %v, align 8
  ret ptr %v61

dispatch.ok10:                                    ; preds = %loop.cond
  %dispatch.result13 = call i32 @String_length(ptr %rest)
  %eqtmp = icmp eq i32 %dispatch.result13, 0
  %comptmp = xor i1 %eqtmp, true
  br i1 %comptmp, label %loop.body, label %loop.after

dispatch.abort11:                                 ; preds = %loop.cond
  call void @abort()
  unreachable

dispatch.ok15:                                    ; preds = %loop.body
  %vtable.ptr18 = load ptr, ptr %self14, align 8
  %method.ptr.addr19 = getelementptr ptr, ptr %vtable.ptr18, i64 12
  %method.ptr20 = load ptr, ptr %method.ptr.addr19, align 8
  %self21 = load ptr, ptr %this.addr, align 8
  %rest.addr22 = getelementptr i8, ptr %self21, i32 16
  %rest23 = load ptr, ptr %rest.addr22, align 8
  %dispatch.result24 = call i32 %method.ptr20(ptr %self14, ptr %rest23)
  store i32 %dispatch.result24, ptr %succ, align 4
  %weight = alloca i32, align 4
  %self25 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull28 = icmp eq ptr %self25, null
  br i1 %dispatch.isnull28, label %dispatch.abort27, label %dispatch.ok26

dispatch.abort16:                                 ; preds = %loop.body
  call void @abort()
  unreachable

dispatch.ok26:                                    ; preds = %dispatch.ok15
  %vtable.ptr29 = load ptr, ptr %self25, align 8
  %method.ptr.addr30 = getelementptr ptr, ptr %vtable.ptr29, i64 12
  %method.ptr31 = load ptr, ptr %method.ptr.addr30, align 8
  %self32 = load ptr, ptr %this.addr, align 8
  %rest.addr33 = getelementptr i8, ptr %self32, i32 16
  %rest34 = load ptr, ptr %rest.addr33, align 8
  %dispatch.result35 = call i32 %method.ptr31(ptr %self25, ptr %rest34)
  store i32 %dispatch.result35, ptr %weight, align 4
  %v36 = load ptr, ptr %v, align 8
  %dispatch.isnull39 = icmp eq ptr %v36, null
  br i1 %dispatch.isnull39, label %dispatch.abort38, label %dispatch.ok37

dispatch.abort27:                                 ; preds = %dispatch.ok15
  call void @abort()
  unreachable

dispatch.ok37:                                    ; preds = %dispatch.ok26
  %vtable.ptr40 = load ptr, ptr %v36, align 8
  %method.ptr.addr41 = getelementptr ptr, ptr %vtable.ptr40, i64 12
  %method.ptr42 = load ptr, ptr %method.ptr.addr41, align 8
  %Edge.newtmp = call ptr @Edge.new()
  %dispatch.isnull45 = icmp eq ptr %Edge.newtmp, null
  br i1 %dispatch.isnull45, label %dispatch.abort44, label %dispatch.ok43

dispatch.abort38:                                 ; preds = %dispatch.ok26
  call void @abort()
  unreachable

dispatch.ok43:                                    ; preds = %dispatch.ok37
  %vtable.ptr46 = load ptr, ptr %Edge.newtmp, align 8
  %method.ptr.addr47 = getelementptr ptr, ptr %vtable.ptr46, i64 9
  %method.ptr48 = load ptr, ptr %method.ptr.addr47, align 8
  %v49 = load ptr, ptr %v, align 8
  %dispatch.isnull52 = icmp eq ptr %v49, null
  br i1 %dispatch.isnull52, label %dispatch.abort51, label %dispatch.ok50

dispatch.abort44:                                 ; preds = %dispatch.ok37
  call void @abort()
  unreachable

dispatch.ok50:                                    ; preds = %dispatch.ok43
  %vtable.ptr53 = load ptr, ptr %v49, align 8
  %method.ptr.addr54 = getelementptr ptr, ptr %vtable.ptr53, i64 10
  %method.ptr55 = load ptr, ptr %method.ptr.addr54, align 8
  %dispatch.result56 = call i32 %method.ptr55(ptr %v49)
  %succ57 = load i32, ptr %succ, align 4
  %weight58 = load i32, ptr %weight, align 4
  %dispatch.result59 = call ptr %method.ptr48(ptr %Edge.newtmp, i32 %dispatch.result56, i32 %succ57, i32 %weight58)
  %dispatch.result60 = call ptr %method.ptr42(ptr %v36, ptr %dispatch.result59)
  br label %loop.cond

dispatch.abort51:                                 ; preds = %dispatch.ok43
  call void @abort()
  unreachable
}

define i32 @Parse.c2i(ptr %this, ptr %char) {
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

define i32 @Parse.a2i(ptr %this, ptr %s) {
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
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 13
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
  %eqtmp29 = call i1 @String_equals(ptr %dispatch.result28, ptr @.str.17934988915447438835)
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
  %method.ptr.addr36 = getelementptr ptr, ptr %vtable.ptr35, i64 12
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
  %method.ptr.addr56 = getelementptr ptr, ptr %vtable.ptr55, i64 13
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

define i32 @Parse.a2i_aux(ptr %this, ptr %s) {
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

loop.cond:                                        ; preds = %ifcont71, %dispatch.ok
  %i2 = load i32, ptr %i, align 4
  %j3 = load i32, ptr %j, align 4
  %cmptmp = icmp slt i32 %i2, %j3
  br i1 %cmptmp, label %loop.body, label %loop.after

loop.body:                                        ; preds = %loop.cond
  %c = alloca ptr, align 8
  %s4 = load ptr, ptr %s.addr, align 8
  %dispatch.isnull7 = icmp eq ptr %s4, null
  br i1 %dispatch.isnull7, label %dispatch.abort6, label %dispatch.ok5

loop.after:                                       ; preds = %loop.cond
  %int74 = load i32, ptr %int, align 4
  ret i32 %int74

dispatch.ok5:                                     ; preds = %loop.body
  %i8 = load i32, ptr %i, align 4
  %dispatch.result9 = call ptr @String_substr(ptr %s4, i32 %i8, i32 1)
  store ptr %dispatch.result9, ptr %c, align 8
  %c10 = load ptr, ptr %c, align 8
  %eqtmp = call i1 @String_equals(ptr %c10, ptr @.str.17934988915447438835)
  br i1 %eqtmp, label %then, label %else

dispatch.abort6:                                  ; preds = %loop.body
  call void @abort()
  unreachable

then:                                             ; preds = %dispatch.ok5
  %s11 = load ptr, ptr %s.addr, align 8
  %dispatch.isnull14 = icmp eq ptr %s11, null
  br i1 %dispatch.isnull14, label %dispatch.abort13, label %dispatch.ok12

dispatch.ok12:                                    ; preds = %then
  %i15 = load i32, ptr %i, align 4
  %addtmp = add i32 %i15, 1
  %s16 = load ptr, ptr %s.addr, align 8
  %dispatch.isnull19 = icmp eq ptr %s16, null
  br i1 %dispatch.isnull19, label %dispatch.abort18, label %dispatch.ok17

dispatch.abort13:                                 ; preds = %then
  call void @abort()
  unreachable

dispatch.ok17:                                    ; preds = %dispatch.ok12
  %dispatch.result20 = call i32 @String_length(ptr %s16)
  %i21 = load i32, ptr %i, align 4
  %subtmp = sub i32 %dispatch.result20, %i21
  %subtmp22 = sub i32 %subtmp, 1
  %dispatch.result23 = call ptr @String_substr(ptr %s11, i32 %addtmp, i32 %subtmp22)
  %self = load ptr, ptr %this.addr, align 8
  %rest.addr = getelementptr i8, ptr %self, i32 16
  store ptr %dispatch.result23, ptr %rest.addr, align 8
  %j24 = load i32, ptr %j, align 4
  store i32 %j24, ptr %i, align 4
  br label %ifcont71

dispatch.abort18:                                 ; preds = %dispatch.ok12
  call void @abort()
  unreachable

else:                                             ; preds = %dispatch.ok5
  %c25 = load ptr, ptr %c, align 8
  %eqtmp26 = call i1 @String_equals(ptr %c25, ptr @.str.4706206694200543916)
  br i1 %eqtmp26, label %then27, label %else46

then27:                                           ; preds = %else
  %s28 = load ptr, ptr %s.addr, align 8
  %dispatch.isnull31 = icmp eq ptr %s28, null
  br i1 %dispatch.isnull31, label %dispatch.abort30, label %dispatch.ok29

dispatch.ok29:                                    ; preds = %then27
  %i32 = load i32, ptr %i, align 4
  %addtmp33 = add i32 %i32, 1
  %s34 = load ptr, ptr %s.addr, align 8
  %dispatch.isnull37 = icmp eq ptr %s34, null
  br i1 %dispatch.isnull37, label %dispatch.abort36, label %dispatch.ok35

dispatch.abort30:                                 ; preds = %then27
  call void @abort()
  unreachable

dispatch.ok35:                                    ; preds = %dispatch.ok29
  %dispatch.result38 = call i32 @String_length(ptr %s34)
  %i39 = load i32, ptr %i, align 4
  %subtmp40 = sub i32 %dispatch.result38, %i39
  %subtmp41 = sub i32 %subtmp40, 1
  %dispatch.result42 = call ptr @String_substr(ptr %s28, i32 %addtmp33, i32 %subtmp41)
  %self43 = load ptr, ptr %this.addr, align 8
  %rest.addr44 = getelementptr i8, ptr %self43, i32 16
  store ptr %dispatch.result42, ptr %rest.addr44, align 8
  %j45 = load i32, ptr %j, align 4
  store i32 %j45, ptr %i, align 4
  br label %ifcont69

dispatch.abort36:                                 ; preds = %dispatch.ok29
  call void @abort()
  unreachable

else46:                                           ; preds = %else
  %int47 = load i32, ptr %int, align 4
  %multmp = mul i32 %int47, 10
  %self48 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull51 = icmp eq ptr %self48, null
  br i1 %dispatch.isnull51, label %dispatch.abort50, label %dispatch.ok49

dispatch.ok49:                                    ; preds = %else46
  %vtable.ptr = load ptr, ptr %self48, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 11
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %s52 = load ptr, ptr %s.addr, align 8
  %dispatch.isnull55 = icmp eq ptr %s52, null
  br i1 %dispatch.isnull55, label %dispatch.abort54, label %dispatch.ok53

dispatch.abort50:                                 ; preds = %else46
  call void @abort()
  unreachable

dispatch.ok53:                                    ; preds = %dispatch.ok49
  %i56 = load i32, ptr %i, align 4
  %dispatch.result57 = call ptr @String_substr(ptr %s52, i32 %i56, i32 1)
  %dispatch.result58 = call i32 %method.ptr(ptr %self48, ptr %dispatch.result57)
  %addtmp59 = add i32 %multmp, %dispatch.result58
  store i32 %addtmp59, ptr %int, align 4
  %i60 = load i32, ptr %i, align 4
  %addtmp61 = add i32 %i60, 1
  store i32 %addtmp61, ptr %i, align 4
  %i62 = load i32, ptr %i, align 4
  %j63 = load i32, ptr %j, align 4
  %eqtmp64 = icmp eq i32 %i62, %j63
  br i1 %eqtmp64, label %then65, label %else68

dispatch.abort54:                                 ; preds = %dispatch.ok49
  call void @abort()
  unreachable

then65:                                           ; preds = %dispatch.ok53
  %self66 = load ptr, ptr %this.addr, align 8
  %rest.addr67 = getelementptr i8, ptr %self66, i32 16
  store ptr @.str.const.6142509188972423790, ptr %rest.addr67, align 8
  br label %ifcont

else68:                                           ; preds = %dispatch.ok53
  br label %ifcont

ifcont:                                           ; preds = %else68, %then65
  %cond_result = phi ptr [ @.str.const.6142509188972423790, %then65 ], [ @.str.const.6142509188972423790, %else68 ]
  br label %ifcont69

ifcont69:                                         ; preds = %ifcont, %dispatch.ok35
  %cond_result70 = phi ptr [ %cond_then_cast, %dispatch.ok35 ], [ %cond_result, %ifcont ]
  %cond_then_cast = inttoptr i32 %j45 to ptr
  br label %ifcont71

ifcont71:                                         ; preds = %ifcont69, %dispatch.ok17
  %cond_result72 = phi ptr [ %cond_then_cast73, %dispatch.ok17 ], [ %cond_result70, %ifcont69 ]
  %cond_then_cast73 = inttoptr i32 %j24 to ptr
  br label %loop.cond
}

define ptr @Main.main(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %g = alloca ptr, align 8
  %Graph.newtmp = call ptr @Graph.new()
  store ptr %Graph.newtmp, ptr %g, align 8
  %g1 = load ptr, ptr %g, align 8
  %dispatch.isnull = icmp eq ptr %g1, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %g1, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %Vertice.newtmp = call ptr @Vertice.new()
  %dispatch.isnull4 = icmp eq ptr %Vertice.newtmp, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %Vertice.newtmp, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 11
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %dispatch.result = call ptr %method.ptr7(ptr %Vertice.newtmp, i32 1)
  %dispatch.isnull10 = icmp eq ptr %dispatch.result, null
  br i1 %dispatch.isnull10, label %dispatch.abort9, label %dispatch.ok8

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok8:                                     ; preds = %dispatch.ok2
  %vtable.ptr11 = load ptr, ptr %dispatch.result, align 8
  %method.ptr.addr12 = getelementptr ptr, ptr %vtable.ptr11, i64 12
  %method.ptr13 = load ptr, ptr %method.ptr.addr12, align 8
  %Edge.newtmp = call ptr @Edge.new()
  %dispatch.isnull16 = icmp eq ptr %Edge.newtmp, null
  br i1 %dispatch.isnull16, label %dispatch.abort15, label %dispatch.ok14

dispatch.abort9:                                  ; preds = %dispatch.ok2
  call void @abort()
  unreachable

dispatch.ok14:                                    ; preds = %dispatch.ok8
  %vtable.ptr17 = load ptr, ptr %Edge.newtmp, align 8
  %method.ptr.addr18 = getelementptr ptr, ptr %vtable.ptr17, i64 9
  %method.ptr19 = load ptr, ptr %method.ptr.addr18, align 8
  %dispatch.result20 = call ptr %method.ptr19(ptr %Edge.newtmp, i32 1, i32 2, i32 100)
  %dispatch.result21 = call ptr %method.ptr13(ptr %dispatch.result, ptr %dispatch.result20)
  %dispatch.result22 = call ptr %method.ptr(ptr %g1, ptr %dispatch.result21)
  %g23 = load ptr, ptr %g, align 8
  %dispatch.isnull26 = icmp eq ptr %g23, null
  br i1 %dispatch.isnull26, label %dispatch.abort25, label %dispatch.ok24

dispatch.abort15:                                 ; preds = %dispatch.ok8
  call void @abort()
  unreachable

dispatch.ok24:                                    ; preds = %dispatch.ok14
  %vtable.ptr27 = load ptr, ptr %g23, align 8
  %method.ptr.addr28 = getelementptr ptr, ptr %vtable.ptr27, i64 5
  %method.ptr29 = load ptr, ptr %method.ptr.addr28, align 8
  %Vertice.newtmp30 = call ptr @Vertice.new()
  %dispatch.isnull33 = icmp eq ptr %Vertice.newtmp30, null
  br i1 %dispatch.isnull33, label %dispatch.abort32, label %dispatch.ok31

dispatch.abort25:                                 ; preds = %dispatch.ok14
  call void @abort()
  unreachable

dispatch.ok31:                                    ; preds = %dispatch.ok24
  %vtable.ptr34 = load ptr, ptr %Vertice.newtmp30, align 8
  %method.ptr.addr35 = getelementptr ptr, ptr %vtable.ptr34, i64 11
  %method.ptr36 = load ptr, ptr %method.ptr.addr35, align 8
  %dispatch.result37 = call ptr %method.ptr36(ptr %Vertice.newtmp30, i32 2)
  %dispatch.isnull40 = icmp eq ptr %dispatch.result37, null
  br i1 %dispatch.isnull40, label %dispatch.abort39, label %dispatch.ok38

dispatch.abort32:                                 ; preds = %dispatch.ok24
  call void @abort()
  unreachable

dispatch.ok38:                                    ; preds = %dispatch.ok31
  %vtable.ptr41 = load ptr, ptr %dispatch.result37, align 8
  %method.ptr.addr42 = getelementptr ptr, ptr %vtable.ptr41, i64 12
  %method.ptr43 = load ptr, ptr %method.ptr.addr42, align 8
  %Edge.newtmp44 = call ptr @Edge.new()
  %dispatch.isnull47 = icmp eq ptr %Edge.newtmp44, null
  br i1 %dispatch.isnull47, label %dispatch.abort46, label %dispatch.ok45

dispatch.abort39:                                 ; preds = %dispatch.ok31
  call void @abort()
  unreachable

dispatch.ok45:                                    ; preds = %dispatch.ok38
  %vtable.ptr48 = load ptr, ptr %Edge.newtmp44, align 8
  %method.ptr.addr49 = getelementptr ptr, ptr %vtable.ptr48, i64 9
  %method.ptr50 = load ptr, ptr %method.ptr.addr49, align 8
  %dispatch.result51 = call ptr %method.ptr50(ptr %Edge.newtmp44, i32 2, i32 3, i32 200)
  %dispatch.result52 = call ptr %method.ptr43(ptr %dispatch.result37, ptr %dispatch.result51)
  %dispatch.isnull55 = icmp eq ptr %dispatch.result52, null
  br i1 %dispatch.isnull55, label %dispatch.abort54, label %dispatch.ok53

dispatch.abort46:                                 ; preds = %dispatch.ok38
  call void @abort()
  unreachable

dispatch.ok53:                                    ; preds = %dispatch.ok45
  %vtable.ptr56 = load ptr, ptr %dispatch.result52, align 8
  %method.ptr.addr57 = getelementptr ptr, ptr %vtable.ptr56, i64 12
  %method.ptr58 = load ptr, ptr %method.ptr.addr57, align 8
  %Edge.newtmp59 = call ptr @Edge.new()
  %dispatch.isnull62 = icmp eq ptr %Edge.newtmp59, null
  br i1 %dispatch.isnull62, label %dispatch.abort61, label %dispatch.ok60

dispatch.abort54:                                 ; preds = %dispatch.ok45
  call void @abort()
  unreachable

dispatch.ok60:                                    ; preds = %dispatch.ok53
  %vtable.ptr63 = load ptr, ptr %Edge.newtmp59, align 8
  %method.ptr.addr64 = getelementptr ptr, ptr %vtable.ptr63, i64 9
  %method.ptr65 = load ptr, ptr %method.ptr.addr64, align 8
  %dispatch.result66 = call ptr %method.ptr65(ptr %Edge.newtmp59, i32 2, i32 1, i32 150)
  %dispatch.result67 = call ptr %method.ptr58(ptr %dispatch.result52, ptr %dispatch.result66)
  %dispatch.result68 = call ptr %method.ptr29(ptr %g23, ptr %dispatch.result67)
  %g69 = load ptr, ptr %g, align 8
  %dispatch.isnull72 = icmp eq ptr %g69, null
  br i1 %dispatch.isnull72, label %dispatch.abort71, label %dispatch.ok70

dispatch.abort61:                                 ; preds = %dispatch.ok53
  call void @abort()
  unreachable

dispatch.ok70:                                    ; preds = %dispatch.ok60
  %vtable.ptr73 = load ptr, ptr %g69, align 8
  %method.ptr.addr74 = getelementptr ptr, ptr %vtable.ptr73, i64 5
  %method.ptr75 = load ptr, ptr %method.ptr.addr74, align 8
  %Vertice.newtmp76 = call ptr @Vertice.new()
  %dispatch.isnull79 = icmp eq ptr %Vertice.newtmp76, null
  br i1 %dispatch.isnull79, label %dispatch.abort78, label %dispatch.ok77

dispatch.abort71:                                 ; preds = %dispatch.ok60
  call void @abort()
  unreachable

dispatch.ok77:                                    ; preds = %dispatch.ok70
  %vtable.ptr80 = load ptr, ptr %Vertice.newtmp76, align 8
  %method.ptr.addr81 = getelementptr ptr, ptr %vtable.ptr80, i64 11
  %method.ptr82 = load ptr, ptr %method.ptr.addr81, align 8
  %dispatch.result83 = call ptr %method.ptr82(ptr %Vertice.newtmp76, i32 3)
  %dispatch.isnull86 = icmp eq ptr %dispatch.result83, null
  br i1 %dispatch.isnull86, label %dispatch.abort85, label %dispatch.ok84

dispatch.abort78:                                 ; preds = %dispatch.ok70
  call void @abort()
  unreachable

dispatch.ok84:                                    ; preds = %dispatch.ok77
  %vtable.ptr87 = load ptr, ptr %dispatch.result83, align 8
  %method.ptr.addr88 = getelementptr ptr, ptr %vtable.ptr87, i64 12
  %method.ptr89 = load ptr, ptr %method.ptr.addr88, align 8
  %Edge.newtmp90 = call ptr @Edge.new()
  %dispatch.isnull93 = icmp eq ptr %Edge.newtmp90, null
  br i1 %dispatch.isnull93, label %dispatch.abort92, label %dispatch.ok91

dispatch.abort85:                                 ; preds = %dispatch.ok77
  call void @abort()
  unreachable

dispatch.ok91:                                    ; preds = %dispatch.ok84
  %vtable.ptr94 = load ptr, ptr %Edge.newtmp90, align 8
  %method.ptr.addr95 = getelementptr ptr, ptr %vtable.ptr94, i64 9
  %method.ptr96 = load ptr, ptr %method.ptr.addr95, align 8
  %dispatch.result97 = call ptr %method.ptr96(ptr %Edge.newtmp90, i32 3, i32 2, i32 10)
  %dispatch.result98 = call ptr %method.ptr89(ptr %dispatch.result83, ptr %dispatch.result97)
  %dispatch.result99 = call ptr %method.ptr75(ptr %g69, ptr %dispatch.result98)
  %g100 = load ptr, ptr %g, align 8
  %dispatch.isnull103 = icmp eq ptr %g100, null
  br i1 %dispatch.isnull103, label %dispatch.abort102, label %dispatch.ok101

dispatch.abort92:                                 ; preds = %dispatch.ok84
  call void @abort()
  unreachable

dispatch.ok101:                                   ; preds = %dispatch.ok91
  %vtable.ptr104 = load ptr, ptr %g100, align 8
  %method.ptr.addr105 = getelementptr ptr, ptr %vtable.ptr104, i64 5
  %method.ptr106 = load ptr, ptr %method.ptr.addr105, align 8
  %Vertice.newtmp107 = call ptr @Vertice.new()
  %dispatch.isnull110 = icmp eq ptr %Vertice.newtmp107, null
  br i1 %dispatch.isnull110, label %dispatch.abort109, label %dispatch.ok108

dispatch.abort102:                                ; preds = %dispatch.ok91
  call void @abort()
  unreachable

dispatch.ok108:                                   ; preds = %dispatch.ok101
  %vtable.ptr111 = load ptr, ptr %Vertice.newtmp107, align 8
  %method.ptr.addr112 = getelementptr ptr, ptr %vtable.ptr111, i64 11
  %method.ptr113 = load ptr, ptr %method.ptr.addr112, align 8
  %dispatch.result114 = call ptr %method.ptr113(ptr %Vertice.newtmp107, i32 4)
  %dispatch.isnull117 = icmp eq ptr %dispatch.result114, null
  br i1 %dispatch.isnull117, label %dispatch.abort116, label %dispatch.ok115

dispatch.abort109:                                ; preds = %dispatch.ok101
  call void @abort()
  unreachable

dispatch.ok115:                                   ; preds = %dispatch.ok108
  %vtable.ptr118 = load ptr, ptr %dispatch.result114, align 8
  %method.ptr.addr119 = getelementptr ptr, ptr %vtable.ptr118, i64 12
  %method.ptr120 = load ptr, ptr %method.ptr.addr119, align 8
  %Edge.newtmp121 = call ptr @Edge.new()
  %dispatch.isnull124 = icmp eq ptr %Edge.newtmp121, null
  br i1 %dispatch.isnull124, label %dispatch.abort123, label %dispatch.ok122

dispatch.abort116:                                ; preds = %dispatch.ok108
  call void @abort()
  unreachable

dispatch.ok122:                                   ; preds = %dispatch.ok115
  %vtable.ptr125 = load ptr, ptr %Edge.newtmp121, align 8
  %method.ptr.addr126 = getelementptr ptr, ptr %vtable.ptr125, i64 9
  %method.ptr127 = load ptr, ptr %method.ptr.addr126, align 8
  %dispatch.result128 = call ptr %method.ptr127(ptr %Edge.newtmp121, i32 4, i32 3, i32 55)
  %dispatch.result129 = call ptr %method.ptr120(ptr %dispatch.result114, ptr %dispatch.result128)
  %dispatch.isnull132 = icmp eq ptr %dispatch.result129, null
  br i1 %dispatch.isnull132, label %dispatch.abort131, label %dispatch.ok130

dispatch.abort123:                                ; preds = %dispatch.ok115
  call void @abort()
  unreachable

dispatch.ok130:                                   ; preds = %dispatch.ok122
  %vtable.ptr133 = load ptr, ptr %dispatch.result129, align 8
  %method.ptr.addr134 = getelementptr ptr, ptr %vtable.ptr133, i64 12
  %method.ptr135 = load ptr, ptr %method.ptr.addr134, align 8
  %Edge.newtmp136 = call ptr @Edge.new()
  %dispatch.isnull139 = icmp eq ptr %Edge.newtmp136, null
  br i1 %dispatch.isnull139, label %dispatch.abort138, label %dispatch.ok137

dispatch.abort131:                                ; preds = %dispatch.ok122
  call void @abort()
  unreachable

dispatch.ok137:                                   ; preds = %dispatch.ok130
  %vtable.ptr140 = load ptr, ptr %Edge.newtmp136, align 8
  %method.ptr.addr141 = getelementptr ptr, ptr %vtable.ptr140, i64 9
  %method.ptr142 = load ptr, ptr %method.ptr.addr141, align 8
  %dispatch.result143 = call ptr %method.ptr142(ptr %Edge.newtmp136, i32 4, i32 5, i32 100)
  %dispatch.result144 = call ptr %method.ptr135(ptr %dispatch.result129, ptr %dispatch.result143)
  %dispatch.result145 = call ptr %method.ptr106(ptr %g100, ptr %dispatch.result144)
  %g146 = load ptr, ptr %g, align 8
  %dispatch.isnull149 = icmp eq ptr %g146, null
  br i1 %dispatch.isnull149, label %dispatch.abort148, label %dispatch.ok147

dispatch.abort138:                                ; preds = %dispatch.ok130
  call void @abort()
  unreachable

dispatch.ok147:                                   ; preds = %dispatch.ok137
  %vtable.ptr150 = load ptr, ptr %g146, align 8
  %method.ptr.addr151 = getelementptr ptr, ptr %vtable.ptr150, i64 5
  %method.ptr152 = load ptr, ptr %method.ptr.addr151, align 8
  %Vertice.newtmp153 = call ptr @Vertice.new()
  %dispatch.isnull156 = icmp eq ptr %Vertice.newtmp153, null
  br i1 %dispatch.isnull156, label %dispatch.abort155, label %dispatch.ok154

dispatch.abort148:                                ; preds = %dispatch.ok137
  call void @abort()
  unreachable

dispatch.ok154:                                   ; preds = %dispatch.ok147
  %vtable.ptr157 = load ptr, ptr %Vertice.newtmp153, align 8
  %method.ptr.addr158 = getelementptr ptr, ptr %vtable.ptr157, i64 11
  %method.ptr159 = load ptr, ptr %method.ptr.addr158, align 8
  %dispatch.result160 = call ptr %method.ptr159(ptr %Vertice.newtmp153, i32 5)
  %dispatch.isnull163 = icmp eq ptr %dispatch.result160, null
  br i1 %dispatch.isnull163, label %dispatch.abort162, label %dispatch.ok161

dispatch.abort155:                                ; preds = %dispatch.ok147
  call void @abort()
  unreachable

dispatch.ok161:                                   ; preds = %dispatch.ok154
  %vtable.ptr164 = load ptr, ptr %dispatch.result160, align 8
  %method.ptr.addr165 = getelementptr ptr, ptr %vtable.ptr164, i64 12
  %method.ptr166 = load ptr, ptr %method.ptr.addr165, align 8
  %Edge.newtmp167 = call ptr @Edge.new()
  %dispatch.isnull170 = icmp eq ptr %Edge.newtmp167, null
  br i1 %dispatch.isnull170, label %dispatch.abort169, label %dispatch.ok168

dispatch.abort162:                                ; preds = %dispatch.ok154
  call void @abort()
  unreachable

dispatch.ok168:                                   ; preds = %dispatch.ok161
  %vtable.ptr171 = load ptr, ptr %Edge.newtmp167, align 8
  %method.ptr.addr172 = getelementptr ptr, ptr %vtable.ptr171, i64 9
  %method.ptr173 = load ptr, ptr %method.ptr.addr172, align 8
  %dispatch.result174 = call ptr %method.ptr173(ptr %Edge.newtmp167, i32 5, i32 1, i32 1)
  %dispatch.result175 = call ptr %method.ptr166(ptr %dispatch.result160, ptr %dispatch.result174)
  %dispatch.isnull178 = icmp eq ptr %dispatch.result175, null
  br i1 %dispatch.isnull178, label %dispatch.abort177, label %dispatch.ok176

dispatch.abort169:                                ; preds = %dispatch.ok161
  call void @abort()
  unreachable

dispatch.ok176:                                   ; preds = %dispatch.ok168
  %vtable.ptr179 = load ptr, ptr %dispatch.result175, align 8
  %method.ptr.addr180 = getelementptr ptr, ptr %vtable.ptr179, i64 12
  %method.ptr181 = load ptr, ptr %method.ptr.addr180, align 8
  %Edge.newtmp182 = call ptr @Edge.new()
  %dispatch.isnull185 = icmp eq ptr %Edge.newtmp182, null
  br i1 %dispatch.isnull185, label %dispatch.abort184, label %dispatch.ok183

dispatch.abort177:                                ; preds = %dispatch.ok168
  call void @abort()
  unreachable

dispatch.ok183:                                   ; preds = %dispatch.ok176
  %vtable.ptr186 = load ptr, ptr %Edge.newtmp182, align 8
  %method.ptr.addr187 = getelementptr ptr, ptr %vtable.ptr186, i64 9
  %method.ptr188 = load ptr, ptr %method.ptr.addr187, align 8
  %dispatch.result189 = call ptr %method.ptr188(ptr %Edge.newtmp182, i32 5, i32 2, i32 2)
  %dispatch.result190 = call ptr %method.ptr181(ptr %dispatch.result175, ptr %dispatch.result189)
  %dispatch.isnull193 = icmp eq ptr %dispatch.result190, null
  br i1 %dispatch.isnull193, label %dispatch.abort192, label %dispatch.ok191

dispatch.abort184:                                ; preds = %dispatch.ok176
  call void @abort()
  unreachable

dispatch.ok191:                                   ; preds = %dispatch.ok183
  %vtable.ptr194 = load ptr, ptr %dispatch.result190, align 8
  %method.ptr.addr195 = getelementptr ptr, ptr %vtable.ptr194, i64 12
  %method.ptr196 = load ptr, ptr %method.ptr.addr195, align 8
  %Edge.newtmp197 = call ptr @Edge.new()
  %dispatch.isnull200 = icmp eq ptr %Edge.newtmp197, null
  br i1 %dispatch.isnull200, label %dispatch.abort199, label %dispatch.ok198

dispatch.abort192:                                ; preds = %dispatch.ok183
  call void @abort()
  unreachable

dispatch.ok198:                                   ; preds = %dispatch.ok191
  %vtable.ptr201 = load ptr, ptr %Edge.newtmp197, align 8
  %method.ptr.addr202 = getelementptr ptr, ptr %vtable.ptr201, i64 9
  %method.ptr203 = load ptr, ptr %method.ptr.addr202, align 8
  %dispatch.result204 = call ptr %method.ptr203(ptr %Edge.newtmp197, i32 5, i32 3, i32 3)
  %dispatch.result205 = call ptr %method.ptr196(ptr %dispatch.result190, ptr %dispatch.result204)
  %dispatch.isnull208 = icmp eq ptr %dispatch.result205, null
  br i1 %dispatch.isnull208, label %dispatch.abort207, label %dispatch.ok206

dispatch.abort199:                                ; preds = %dispatch.ok191
  call void @abort()
  unreachable

dispatch.ok206:                                   ; preds = %dispatch.ok198
  %vtable.ptr209 = load ptr, ptr %dispatch.result205, align 8
  %method.ptr.addr210 = getelementptr ptr, ptr %vtable.ptr209, i64 12
  %method.ptr211 = load ptr, ptr %method.ptr.addr210, align 8
  %Edge.newtmp212 = call ptr @Edge.new()
  %dispatch.isnull215 = icmp eq ptr %Edge.newtmp212, null
  br i1 %dispatch.isnull215, label %dispatch.abort214, label %dispatch.ok213

dispatch.abort207:                                ; preds = %dispatch.ok198
  call void @abort()
  unreachable

dispatch.ok213:                                   ; preds = %dispatch.ok206
  %vtable.ptr216 = load ptr, ptr %Edge.newtmp212, align 8
  %method.ptr.addr217 = getelementptr ptr, ptr %vtable.ptr216, i64 9
  %method.ptr218 = load ptr, ptr %method.ptr.addr217, align 8
  %dispatch.result219 = call ptr %method.ptr218(ptr %Edge.newtmp212, i32 5, i32 4, i32 4)
  %dispatch.result220 = call ptr %method.ptr211(ptr %dispatch.result205, ptr %dispatch.result219)
  %dispatch.isnull223 = icmp eq ptr %dispatch.result220, null
  br i1 %dispatch.isnull223, label %dispatch.abort222, label %dispatch.ok221

dispatch.abort214:                                ; preds = %dispatch.ok206
  call void @abort()
  unreachable

dispatch.ok221:                                   ; preds = %dispatch.ok213
  %vtable.ptr224 = load ptr, ptr %dispatch.result220, align 8
  %method.ptr.addr225 = getelementptr ptr, ptr %vtable.ptr224, i64 12
  %method.ptr226 = load ptr, ptr %method.ptr.addr225, align 8
  %Edge.newtmp227 = call ptr @Edge.new()
  %dispatch.isnull230 = icmp eq ptr %Edge.newtmp227, null
  br i1 %dispatch.isnull230, label %dispatch.abort229, label %dispatch.ok228

dispatch.abort222:                                ; preds = %dispatch.ok213
  call void @abort()
  unreachable

dispatch.ok228:                                   ; preds = %dispatch.ok221
  %vtable.ptr231 = load ptr, ptr %Edge.newtmp227, align 8
  %method.ptr.addr232 = getelementptr ptr, ptr %vtable.ptr231, i64 9
  %method.ptr233 = load ptr, ptr %method.ptr.addr232, align 8
  %dispatch.result234 = call ptr %method.ptr233(ptr %Edge.newtmp227, i32 5, i32 5, i32 5)
  %dispatch.result235 = call ptr %method.ptr226(ptr %dispatch.result220, ptr %dispatch.result234)
  %dispatch.result236 = call ptr %method.ptr152(ptr %g146, ptr %dispatch.result235)
  %g237 = load ptr, ptr %g, align 8
  %dispatch.isnull240 = icmp eq ptr %g237, null
  br i1 %dispatch.isnull240, label %dispatch.abort239, label %dispatch.ok238

dispatch.abort229:                                ; preds = %dispatch.ok221
  call void @abort()
  unreachable

dispatch.ok238:                                   ; preds = %dispatch.ok228
  %vtable.ptr241 = load ptr, ptr %g237, align 8
  %method.ptr.addr242 = getelementptr ptr, ptr %vtable.ptr241, i64 7
  %method.ptr243 = load ptr, ptr %method.ptr.addr242, align 8
  %dispatch.result244 = call ptr %method.ptr243(ptr %g237)
  %g245 = load ptr, ptr %g, align 8
  %dispatch.isnull248 = icmp eq ptr %g245, null
  br i1 %dispatch.isnull248, label %dispatch.abort247, label %dispatch.ok246

dispatch.abort239:                                ; preds = %dispatch.ok228
  call void @abort()
  unreachable

dispatch.ok246:                                   ; preds = %dispatch.ok238
  %vtable.ptr249 = load ptr, ptr %g245, align 8
  %method.ptr.addr250 = getelementptr ptr, ptr %vtable.ptr249, i64 6
  %method.ptr251 = load ptr, ptr %method.ptr.addr250, align 8
  %dispatch.result252 = call ptr %method.ptr251(ptr %g245)
  ret ptr %dispatch.result252

dispatch.abort247:                                ; preds = %dispatch.ok238
  call void @abort()
  unreachable
}

define i1 @BoolOp.and(ptr %this, i1 %b1, i1 %b2) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %b1.addr = alloca i1, align 1
  store i1 %b1, ptr %b1.addr, align 1
  %b2.addr = alloca i1, align 1
  store i1 %b2, ptr %b2.addr, align 1
  %b11 = load i1, ptr %b1.addr, align 1
  br i1 %b11, label %then, label %else

then:                                             ; preds = %entry
  %b22 = load i1, ptr %b2.addr, align 1
  br label %ifcont

else:                                             ; preds = %entry
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %cond_result = phi i1 [ %b22, %then ], [ false, %else ]
  ret i1 %cond_result
}

define i1 @BoolOp.or(ptr %this, i1 %b1, i1 %b2) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %b1.addr = alloca i1, align 1
  store i1 %b1, ptr %b1.addr, align 1
  %b2.addr = alloca i1, align 1
  store i1 %b2, ptr %b2.addr, align 1
  %b11 = load i1, ptr %b1.addr, align 1
  br i1 %b11, label %then, label %else

then:                                             ; preds = %entry
  br label %ifcont

else:                                             ; preds = %entry
  %b22 = load i1, ptr %b2.addr, align 1
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %cond_result = phi i1 [ true, %then ], [ %b22, %else ]
  ret i1 %cond_result
}

define void @_ZN5GraphC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Graph, ptr %this, i32 0, i32 0
  call void @_ZN6ObjectC2Ev(ptr %parent.subobject)
  store ptr @_ZTV5Graph, ptr %this, align 8
  %vertices.addr.byte = getelementptr i8, ptr %this, i64 8
  %VList.newtmp = call ptr @VList.new()
  store ptr %VList.newtmp, ptr %vertices.addr.byte, align 8
  %edges.addr.byte = getelementptr i8, ptr %this, i64 16
  %EList.newtmp = call ptr @EList.new()
  store ptr %EList.newtmp, ptr %edges.addr.byte, align 8
  ret void
}

define ptr @VList.new() {
entry:
  %0 = call ptr @malloc(i64 16)
  call void @_ZN5VListC2Ev(ptr %0)
  ret ptr %0
}

define ptr @EList.new() {
entry:
  %0 = call ptr @malloc(i64 16)
  call void @_ZN5EListC2Ev(ptr %0)
  ret ptr %0
}

define ptr @Graph.new() {
entry:
  %0 = call ptr @malloc(i64 24)
  call void @_ZN5GraphC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN7VerticeC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Vertice, ptr %this, i32 0, i32 0
  call void @_ZN2IOC2Ev(ptr %parent.subobject)
  store ptr @_ZTV7Vertice, ptr %this, align 8
  %num.addr.byte = getelementptr i8, ptr %this, i64 8
  store i32 0, ptr %num.addr.byte, align 4
  %out.addr.byte = getelementptr i8, ptr %this, i64 16
  %EList.newtmp = call ptr @EList.new()
  store ptr %EList.newtmp, ptr %out.addr.byte, align 8
  ret void
}

define ptr @Vertice.new() {
entry:
  %0 = call ptr @malloc(i64 24)
  call void @_ZN7VerticeC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN4EdgeC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Edge, ptr %this, i32 0, i32 0
  call void @_ZN2IOC2Ev(ptr %parent.subobject)
  store ptr @_ZTV4Edge, ptr %this, align 8
  %from.addr.byte = getelementptr i8, ptr %this, i64 8
  store i32 0, ptr %from.addr.byte, align 4
  %to.addr.byte = getelementptr i8, ptr %this, i64 16
  store i32 0, ptr %to.addr.byte, align 4
  %weight.addr.byte = getelementptr i8, ptr %this, i64 24
  store i32 0, ptr %weight.addr.byte, align 4
  ret void
}

define ptr @Edge.new() {
entry:
  %0 = call ptr @malloc(i64 32)
  call void @_ZN4EdgeC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN5EListC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.EList, ptr %this, i32 0, i32 0
  call void @_ZN2IOC2Ev(ptr %parent.subobject)
  store ptr @_ZTV5EList, ptr %this, align 8
  %car.addr.byte = getelementptr i8, ptr %this, i64 8
  store ptr null, ptr %car.addr.byte, align 8
  ret void
}

define void @_ZN5EConsC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.ECons, ptr %this, i32 0, i32 0
  call void @_ZN5EListC2Ev(ptr %parent.subobject)
  store ptr @_ZTV5ECons, ptr %this, align 8
  %cdr.addr.byte = getelementptr i8, ptr %this, i64 16
  store ptr null, ptr %cdr.addr.byte, align 8
  ret void
}

define ptr @ECons.new() {
entry:
  %0 = call ptr @malloc(i64 24)
  call void @_ZN5EConsC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN5VListC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.VList, ptr %this, i32 0, i32 0
  call void @_ZN2IOC2Ev(ptr %parent.subobject)
  store ptr @_ZTV5VList, ptr %this, align 8
  %car.addr.byte = getelementptr i8, ptr %this, i64 8
  store ptr null, ptr %car.addr.byte, align 8
  ret void
}

define void @_ZN5VConsC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.VCons, ptr %this, i32 0, i32 0
  call void @_ZN5VListC2Ev(ptr %parent.subobject)
  store ptr @_ZTV5VCons, ptr %this, align 8
  %cdr.addr.byte = getelementptr i8, ptr %this, i64 16
  store ptr null, ptr %cdr.addr.byte, align 8
  ret void
}

define ptr @VCons.new() {
entry:
  %0 = call ptr @malloc(i64 24)
  call void @_ZN5VConsC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN5ParseC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Parse, ptr %this, i32 0, i32 0
  call void @_ZN2IOC2Ev(ptr %parent.subobject)
  store ptr @_ZTV5Parse, ptr %this, align 8
  %boolop.addr.byte = getelementptr i8, ptr %this, i64 8
  %BoolOp.newtmp = call ptr @BoolOp.new()
  store ptr %BoolOp.newtmp, ptr %boolop.addr.byte, align 8
  %rest.addr.byte = getelementptr i8, ptr %this, i64 16
  store ptr @.str.const.6142509188972423790, ptr %rest.addr.byte, align 8
  ret void
}

define ptr @BoolOp.new() {
entry:
  %0 = call ptr @malloc(i64 8)
  call void @_ZN6BoolOpC2Ev(ptr %0)
  ret ptr %0
}

define ptr @Parse.new() {
entry:
  %0 = call ptr @malloc(i64 24)
  call void @_ZN5ParseC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN4MainC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Main, ptr %this, i32 0, i32 0
  call void @_ZN5ParseC2Ev(ptr %parent.subobject)
  store ptr @_ZTV4Main, ptr %this, align 8
  ret void
}

define ptr @Main.new() {
entry:
  %0 = call ptr @malloc(i64 24)
  call void @_ZN4MainC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN6BoolOpC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.BoolOp, ptr %this, i32 0, i32 0
  call void @_ZN6ObjectC2Ev(ptr %parent.subobject)
  store ptr @_ZTV6BoolOp, ptr %this, align 8
  ret void
}

define i32 @main() {
entry:
  %main.obj = call ptr @Main.new()
  %0 = call ptr @Main.main(ptr %main.obj)
  ret i32 0
}

attributes #0 = { noreturn }
