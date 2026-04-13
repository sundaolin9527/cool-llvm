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
%class.Tree = type { %class.Object.0 }
%class.EmptyTree = type { %class.Tree }
%class.TreeNode = type { %class.Tree, i32, [4 x i8], ptr, ptr }
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
@_ZTV7IntList = linkonce_odr constant [15 x ptr] [ptr null, ptr @_ZTI7IntList, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @IntList.isNil, ptr @IntList.head, ptr @IntList.tail, ptr @IntList.cons, ptr @IntList.append, ptr @IntList.print_inline], align 8
@_ZTS7IntCons = linkonce_odr constant [9 x i8] c"7IntCons\00", align 1
@_ZTI7IntCons = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS7IntCons, ptr @_ZTI7IntList }, align 8
@_ZTV7IntCons = linkonce_odr constant [16 x ptr] [ptr null, ptr @_ZTI7IntCons, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @IntCons.isNil, ptr @IntCons.head, ptr @IntCons.tail, ptr @IntList.cons, ptr @IntCons.append, ptr @IntCons.print_inline, ptr @IntCons.init], align 8
@_ZTS4Tree = linkonce_odr constant [6 x i8] c"4Tree\00", align 1
@_ZTI4Tree = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Tree, ptr @_ZTI6Object }, align 8
@_ZTV4Tree = linkonce_odr constant [8 x ptr] [ptr null, ptr @_ZTI4Tree, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @Tree.inorder, ptr @Tree.preorder, ptr @Tree.postorder], align 8
@_ZTS9EmptyTree = linkonce_odr constant [11 x i8] c"9EmptyTree\00", align 1
@_ZTI9EmptyTree = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS9EmptyTree, ptr @_ZTI4Tree }, align 8
@_ZTV9EmptyTree = linkonce_odr constant [8 x ptr] [ptr null, ptr @_ZTI9EmptyTree, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @EmptyTree.inorder, ptr @EmptyTree.preorder, ptr @EmptyTree.postorder], align 8
@_ZTS8TreeNode = linkonce_odr constant [10 x i8] c"8TreeNode\00", align 1
@_ZTI8TreeNode = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS8TreeNode, ptr @_ZTI4Tree }, align 8
@_ZTV8TreeNode = linkonce_odr constant [9 x ptr] [ptr null, ptr @_ZTI8TreeNode, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @TreeNode.inorder, ptr @TreeNode.preorder, ptr @TreeNode.postorder, ptr @TreeNode.init], align 8
@_ZTS4Main = linkonce_odr constant [6 x i8] c"4Main\00", align 1
@_ZTI4Main = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Main, ptr @_ZTI2IO }, align 8
@_ZTV4Main = linkonce_odr constant [10 x ptr] [ptr null, ptr @_ZTI4Main, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Main.main], align 8
@.str.18400681194753865968 = private constant [2 x i8] c"\0A\00"
@.str.17934988915447438835 = private constant [2 x i8] c" \00"
@.str.13255342425781598555 = private constant [10 x i8] c"inorder: \00"
@.str.663015862694159157 = private constant [11 x i8] c"preorder: \00"
@.str.2075187935525178764 = private constant [12 x i8] c"postorder: \00"

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
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 15
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
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 15
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
  %method.ptr.addr33 = getelementptr ptr, ptr %vtable.ptr32, i64 14
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

define ptr @Tree.inorder(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %IntList.newtmp = call ptr @IntList.new()
  ret ptr %IntList.newtmp
}

define ptr @Tree.preorder(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %IntList.newtmp = call ptr @IntList.new()
  ret ptr %IntList.newtmp
}

define ptr @Tree.postorder(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %IntList.newtmp = call ptr @IntList.new()
  ret ptr %IntList.newtmp
}

define ptr @EmptyTree.inorder(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %IntList.newtmp = call ptr @IntList.new()
  ret ptr %IntList.newtmp
}

define ptr @EmptyTree.preorder(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %IntList.newtmp = call ptr @IntList.new()
  ret ptr %IntList.newtmp
}

define ptr @EmptyTree.postorder(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %IntList.newtmp = call ptr @IntList.new()
  ret ptr %IntList.newtmp
}

define ptr @TreeNode.init(ptr %this, i32 %value, ptr %left, ptr %right) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %value.addr = alloca i32, align 4
  store i32 %value, ptr %value.addr, align 4
  %left.addr = alloca ptr, align 8
  store ptr %left, ptr %left.addr, align 8
  %right.addr = alloca ptr, align 8
  store ptr %right, ptr %right.addr, align 8
  %value1 = load i32, ptr %value.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %value_v.addr = getelementptr i8, ptr %self, i32 8
  store i32 %value1, ptr %value_v.addr, align 4
  %left2 = load ptr, ptr %left.addr, align 8
  %self3 = load ptr, ptr %this.addr, align 8
  %left_v.addr = getelementptr i8, ptr %self3, i32 16
  store ptr %left2, ptr %left_v.addr, align 8
  %right4 = load ptr, ptr %right.addr, align 8
  %self5 = load ptr, ptr %this.addr, align 8
  %right_v.addr = getelementptr i8, ptr %self5, i32 24
  store ptr %right4, ptr %right_v.addr, align 8
  %self6 = load ptr, ptr %this.addr, align 8
  ret ptr %self6
}

define ptr @TreeNode.inorder(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %left_v.addr = getelementptr i8, ptr %self, i32 16
  %left_v = load ptr, ptr %left_v.addr, align 8
  %dispatch.isnull = icmp eq ptr %left_v, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %left_v, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %left_v)
  %dispatch.isnull3 = icmp eq ptr %dispatch.result, null
  br i1 %dispatch.isnull3, label %dispatch.abort2, label %dispatch.ok1

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok1:                                     ; preds = %dispatch.ok
  %vtable.ptr4 = load ptr, ptr %dispatch.result, align 8
  %method.ptr.addr5 = getelementptr ptr, ptr %vtable.ptr4, i64 13
  %method.ptr6 = load ptr, ptr %method.ptr.addr5, align 8
  %IntCons.newtmp = call ptr @IntCons.new()
  %dispatch.isnull9 = icmp eq ptr %IntCons.newtmp, null
  br i1 %dispatch.isnull9, label %dispatch.abort8, label %dispatch.ok7

dispatch.abort2:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok7:                                     ; preds = %dispatch.ok1
  %vtable.ptr10 = load ptr, ptr %IntCons.newtmp, align 8
  %method.ptr.addr11 = getelementptr ptr, ptr %vtable.ptr10, i64 15
  %method.ptr12 = load ptr, ptr %method.ptr.addr11, align 8
  %self13 = load ptr, ptr %this.addr, align 8
  %value_v.addr = getelementptr i8, ptr %self13, i32 8
  %value_v = load i32, ptr %value_v.addr, align 4
  %IntList.newtmp = call ptr @IntList.new()
  %dispatch.result14 = call ptr %method.ptr12(ptr %IntCons.newtmp, i32 %value_v, ptr %IntList.newtmp)
  %dispatch.isnull17 = icmp eq ptr %dispatch.result14, null
  br i1 %dispatch.isnull17, label %dispatch.abort16, label %dispatch.ok15

dispatch.abort8:                                  ; preds = %dispatch.ok1
  call void @abort()
  unreachable

dispatch.ok15:                                    ; preds = %dispatch.ok7
  %vtable.ptr18 = load ptr, ptr %dispatch.result14, align 8
  %method.ptr.addr19 = getelementptr ptr, ptr %vtable.ptr18, i64 13
  %method.ptr20 = load ptr, ptr %method.ptr.addr19, align 8
  %self21 = load ptr, ptr %this.addr, align 8
  %right_v.addr = getelementptr i8, ptr %self21, i32 24
  %right_v = load ptr, ptr %right_v.addr, align 8
  %dispatch.isnull24 = icmp eq ptr %right_v, null
  br i1 %dispatch.isnull24, label %dispatch.abort23, label %dispatch.ok22

dispatch.abort16:                                 ; preds = %dispatch.ok7
  call void @abort()
  unreachable

dispatch.ok22:                                    ; preds = %dispatch.ok15
  %vtable.ptr25 = load ptr, ptr %right_v, align 8
  %method.ptr.addr26 = getelementptr ptr, ptr %vtable.ptr25, i64 5
  %method.ptr27 = load ptr, ptr %method.ptr.addr26, align 8
  %dispatch.result28 = call ptr %method.ptr27(ptr %right_v)
  %dispatch.result29 = call ptr %method.ptr20(ptr %dispatch.result14, ptr %dispatch.result28)
  %dispatch.result30 = call ptr %method.ptr6(ptr %dispatch.result, ptr %dispatch.result29)
  ret ptr %dispatch.result30

dispatch.abort23:                                 ; preds = %dispatch.ok15
  call void @abort()
  unreachable
}

define ptr @TreeNode.preorder(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %IntCons.newtmp = call ptr @IntCons.new()
  %dispatch.isnull = icmp eq ptr %IntCons.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %IntCons.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 15
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %value_v.addr = getelementptr i8, ptr %self, i32 8
  %value_v = load i32, ptr %value_v.addr, align 4
  %IntList.newtmp = call ptr @IntList.new()
  %dispatch.result = call ptr %method.ptr(ptr %IntCons.newtmp, i32 %value_v, ptr %IntList.newtmp)
  %dispatch.isnull3 = icmp eq ptr %dispatch.result, null
  br i1 %dispatch.isnull3, label %dispatch.abort2, label %dispatch.ok1

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok1:                                     ; preds = %dispatch.ok
  %vtable.ptr4 = load ptr, ptr %dispatch.result, align 8
  %method.ptr.addr5 = getelementptr ptr, ptr %vtable.ptr4, i64 13
  %method.ptr6 = load ptr, ptr %method.ptr.addr5, align 8
  %self7 = load ptr, ptr %this.addr, align 8
  %left_v.addr = getelementptr i8, ptr %self7, i32 16
  %left_v = load ptr, ptr %left_v.addr, align 8
  %dispatch.isnull10 = icmp eq ptr %left_v, null
  br i1 %dispatch.isnull10, label %dispatch.abort9, label %dispatch.ok8

dispatch.abort2:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok8:                                     ; preds = %dispatch.ok1
  %vtable.ptr11 = load ptr, ptr %left_v, align 8
  %method.ptr.addr12 = getelementptr ptr, ptr %vtable.ptr11, i64 6
  %method.ptr13 = load ptr, ptr %method.ptr.addr12, align 8
  %dispatch.result14 = call ptr %method.ptr13(ptr %left_v)
  %dispatch.isnull17 = icmp eq ptr %dispatch.result14, null
  br i1 %dispatch.isnull17, label %dispatch.abort16, label %dispatch.ok15

dispatch.abort9:                                  ; preds = %dispatch.ok1
  call void @abort()
  unreachable

dispatch.ok15:                                    ; preds = %dispatch.ok8
  %vtable.ptr18 = load ptr, ptr %dispatch.result14, align 8
  %method.ptr.addr19 = getelementptr ptr, ptr %vtable.ptr18, i64 13
  %method.ptr20 = load ptr, ptr %method.ptr.addr19, align 8
  %self21 = load ptr, ptr %this.addr, align 8
  %right_v.addr = getelementptr i8, ptr %self21, i32 24
  %right_v = load ptr, ptr %right_v.addr, align 8
  %dispatch.isnull24 = icmp eq ptr %right_v, null
  br i1 %dispatch.isnull24, label %dispatch.abort23, label %dispatch.ok22

dispatch.abort16:                                 ; preds = %dispatch.ok8
  call void @abort()
  unreachable

dispatch.ok22:                                    ; preds = %dispatch.ok15
  %vtable.ptr25 = load ptr, ptr %right_v, align 8
  %method.ptr.addr26 = getelementptr ptr, ptr %vtable.ptr25, i64 6
  %method.ptr27 = load ptr, ptr %method.ptr.addr26, align 8
  %dispatch.result28 = call ptr %method.ptr27(ptr %right_v)
  %dispatch.result29 = call ptr %method.ptr20(ptr %dispatch.result14, ptr %dispatch.result28)
  %dispatch.result30 = call ptr %method.ptr6(ptr %dispatch.result, ptr %dispatch.result29)
  ret ptr %dispatch.result30

dispatch.abort23:                                 ; preds = %dispatch.ok15
  call void @abort()
  unreachable
}

define ptr @TreeNode.postorder(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %left_v.addr = getelementptr i8, ptr %self, i32 16
  %left_v = load ptr, ptr %left_v.addr, align 8
  %dispatch.isnull = icmp eq ptr %left_v, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %left_v, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 7
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %left_v)
  %dispatch.isnull3 = icmp eq ptr %dispatch.result, null
  br i1 %dispatch.isnull3, label %dispatch.abort2, label %dispatch.ok1

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok1:                                     ; preds = %dispatch.ok
  %vtable.ptr4 = load ptr, ptr %dispatch.result, align 8
  %method.ptr.addr5 = getelementptr ptr, ptr %vtable.ptr4, i64 13
  %method.ptr6 = load ptr, ptr %method.ptr.addr5, align 8
  %self7 = load ptr, ptr %this.addr, align 8
  %right_v.addr = getelementptr i8, ptr %self7, i32 24
  %right_v = load ptr, ptr %right_v.addr, align 8
  %dispatch.isnull10 = icmp eq ptr %right_v, null
  br i1 %dispatch.isnull10, label %dispatch.abort9, label %dispatch.ok8

dispatch.abort2:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok8:                                     ; preds = %dispatch.ok1
  %vtable.ptr11 = load ptr, ptr %right_v, align 8
  %method.ptr.addr12 = getelementptr ptr, ptr %vtable.ptr11, i64 7
  %method.ptr13 = load ptr, ptr %method.ptr.addr12, align 8
  %dispatch.result14 = call ptr %method.ptr13(ptr %right_v)
  %dispatch.isnull17 = icmp eq ptr %dispatch.result14, null
  br i1 %dispatch.isnull17, label %dispatch.abort16, label %dispatch.ok15

dispatch.abort9:                                  ; preds = %dispatch.ok1
  call void @abort()
  unreachable

dispatch.ok15:                                    ; preds = %dispatch.ok8
  %vtable.ptr18 = load ptr, ptr %dispatch.result14, align 8
  %method.ptr.addr19 = getelementptr ptr, ptr %vtable.ptr18, i64 13
  %method.ptr20 = load ptr, ptr %method.ptr.addr19, align 8
  %IntCons.newtmp = call ptr @IntCons.new()
  %dispatch.isnull23 = icmp eq ptr %IntCons.newtmp, null
  br i1 %dispatch.isnull23, label %dispatch.abort22, label %dispatch.ok21

dispatch.abort16:                                 ; preds = %dispatch.ok8
  call void @abort()
  unreachable

dispatch.ok21:                                    ; preds = %dispatch.ok15
  %vtable.ptr24 = load ptr, ptr %IntCons.newtmp, align 8
  %method.ptr.addr25 = getelementptr ptr, ptr %vtable.ptr24, i64 15
  %method.ptr26 = load ptr, ptr %method.ptr.addr25, align 8
  %self27 = load ptr, ptr %this.addr, align 8
  %value_v.addr = getelementptr i8, ptr %self27, i32 8
  %value_v = load i32, ptr %value_v.addr, align 4
  %IntList.newtmp = call ptr @IntList.new()
  %dispatch.result28 = call ptr %method.ptr26(ptr %IntCons.newtmp, i32 %value_v, ptr %IntList.newtmp)
  %dispatch.result29 = call ptr %method.ptr20(ptr %dispatch.result14, ptr %dispatch.result28)
  %dispatch.result30 = call ptr %method.ptr6(ptr %dispatch.result, ptr %dispatch.result29)
  ret ptr %dispatch.result30

dispatch.abort22:                                 ; preds = %dispatch.ok15
  call void @abort()
  unreachable
}

define ptr @Main.main(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %root = alloca ptr, align 8
  %TreeNode.newtmp = call ptr @TreeNode.new()
  %dispatch.isnull = icmp eq ptr %TreeNode.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %TreeNode.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 8
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %TreeNode.newtmp1 = call ptr @TreeNode.new()
  %dispatch.isnull4 = icmp eq ptr %TreeNode.newtmp1, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %TreeNode.newtmp1, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 8
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %TreeNode.newtmp8 = call ptr @TreeNode.new()
  %dispatch.isnull11 = icmp eq ptr %TreeNode.newtmp8, null
  br i1 %dispatch.isnull11, label %dispatch.abort10, label %dispatch.ok9

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok9:                                     ; preds = %dispatch.ok2
  %vtable.ptr12 = load ptr, ptr %TreeNode.newtmp8, align 8
  %method.ptr.addr13 = getelementptr ptr, ptr %vtable.ptr12, i64 8
  %method.ptr14 = load ptr, ptr %method.ptr.addr13, align 8
  %EmptyTree.newtmp = call ptr @EmptyTree.new()
  %EmptyTree.newtmp15 = call ptr @EmptyTree.new()
  %dispatch.result = call ptr %method.ptr14(ptr %TreeNode.newtmp8, i32 1, ptr %EmptyTree.newtmp, ptr %EmptyTree.newtmp15)
  %TreeNode.newtmp16 = call ptr @TreeNode.new()
  %dispatch.isnull19 = icmp eq ptr %TreeNode.newtmp16, null
  br i1 %dispatch.isnull19, label %dispatch.abort18, label %dispatch.ok17

dispatch.abort10:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable

dispatch.ok17:                                    ; preds = %dispatch.ok9
  %vtable.ptr20 = load ptr, ptr %TreeNode.newtmp16, align 8
  %method.ptr.addr21 = getelementptr ptr, ptr %vtable.ptr20, i64 8
  %method.ptr22 = load ptr, ptr %method.ptr.addr21, align 8
  %EmptyTree.newtmp23 = call ptr @EmptyTree.new()
  %EmptyTree.newtmp24 = call ptr @EmptyTree.new()
  %dispatch.result25 = call ptr %method.ptr22(ptr %TreeNode.newtmp16, i32 3, ptr %EmptyTree.newtmp23, ptr %EmptyTree.newtmp24)
  %dispatch.result26 = call ptr %method.ptr7(ptr %TreeNode.newtmp1, i32 2, ptr %dispatch.result, ptr %dispatch.result25)
  %TreeNode.newtmp27 = call ptr @TreeNode.new()
  %dispatch.isnull30 = icmp eq ptr %TreeNode.newtmp27, null
  br i1 %dispatch.isnull30, label %dispatch.abort29, label %dispatch.ok28

dispatch.abort18:                                 ; preds = %dispatch.ok9
  call void @abort()
  unreachable

dispatch.ok28:                                    ; preds = %dispatch.ok17
  %vtable.ptr31 = load ptr, ptr %TreeNode.newtmp27, align 8
  %method.ptr.addr32 = getelementptr ptr, ptr %vtable.ptr31, i64 8
  %method.ptr33 = load ptr, ptr %method.ptr.addr32, align 8
  %TreeNode.newtmp34 = call ptr @TreeNode.new()
  %dispatch.isnull37 = icmp eq ptr %TreeNode.newtmp34, null
  br i1 %dispatch.isnull37, label %dispatch.abort36, label %dispatch.ok35

dispatch.abort29:                                 ; preds = %dispatch.ok17
  call void @abort()
  unreachable

dispatch.ok35:                                    ; preds = %dispatch.ok28
  %vtable.ptr38 = load ptr, ptr %TreeNode.newtmp34, align 8
  %method.ptr.addr39 = getelementptr ptr, ptr %vtable.ptr38, i64 8
  %method.ptr40 = load ptr, ptr %method.ptr.addr39, align 8
  %EmptyTree.newtmp41 = call ptr @EmptyTree.new()
  %EmptyTree.newtmp42 = call ptr @EmptyTree.new()
  %dispatch.result43 = call ptr %method.ptr40(ptr %TreeNode.newtmp34, i32 5, ptr %EmptyTree.newtmp41, ptr %EmptyTree.newtmp42)
  %TreeNode.newtmp44 = call ptr @TreeNode.new()
  %dispatch.isnull47 = icmp eq ptr %TreeNode.newtmp44, null
  br i1 %dispatch.isnull47, label %dispatch.abort46, label %dispatch.ok45

dispatch.abort36:                                 ; preds = %dispatch.ok28
  call void @abort()
  unreachable

dispatch.ok45:                                    ; preds = %dispatch.ok35
  %vtable.ptr48 = load ptr, ptr %TreeNode.newtmp44, align 8
  %method.ptr.addr49 = getelementptr ptr, ptr %vtable.ptr48, i64 8
  %method.ptr50 = load ptr, ptr %method.ptr.addr49, align 8
  %EmptyTree.newtmp51 = call ptr @EmptyTree.new()
  %EmptyTree.newtmp52 = call ptr @EmptyTree.new()
  %dispatch.result53 = call ptr %method.ptr50(ptr %TreeNode.newtmp44, i32 7, ptr %EmptyTree.newtmp51, ptr %EmptyTree.newtmp52)
  %dispatch.result54 = call ptr %method.ptr33(ptr %TreeNode.newtmp27, i32 6, ptr %dispatch.result43, ptr %dispatch.result53)
  %dispatch.result55 = call ptr %method.ptr(ptr %TreeNode.newtmp, i32 4, ptr %dispatch.result26, ptr %dispatch.result54)
  store ptr %dispatch.result55, ptr %root, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull58 = icmp eq ptr %self, null
  br i1 %dispatch.isnull58, label %dispatch.abort57, label %dispatch.ok56

dispatch.abort46:                                 ; preds = %dispatch.ok35
  call void @abort()
  unreachable

dispatch.ok56:                                    ; preds = %dispatch.ok45
  %vtable.ptr59 = load ptr, ptr %self, align 8
  %method.ptr.addr60 = getelementptr ptr, ptr %vtable.ptr59, i64 5
  %method.ptr61 = load ptr, ptr %method.ptr.addr60, align 8
  %dispatch.result62 = call ptr %method.ptr61(ptr %self, ptr @.str.13255342425781598555)
  %root63 = load ptr, ptr %root, align 8
  %dispatch.isnull66 = icmp eq ptr %root63, null
  br i1 %dispatch.isnull66, label %dispatch.abort65, label %dispatch.ok64

dispatch.abort57:                                 ; preds = %dispatch.ok45
  call void @abort()
  unreachable

dispatch.ok64:                                    ; preds = %dispatch.ok56
  %vtable.ptr67 = load ptr, ptr %root63, align 8
  %method.ptr.addr68 = getelementptr ptr, ptr %vtable.ptr67, i64 5
  %method.ptr69 = load ptr, ptr %method.ptr.addr68, align 8
  %dispatch.result70 = call ptr %method.ptr69(ptr %root63)
  %dispatch.isnull73 = icmp eq ptr %dispatch.result70, null
  br i1 %dispatch.isnull73, label %dispatch.abort72, label %dispatch.ok71

dispatch.abort65:                                 ; preds = %dispatch.ok56
  call void @abort()
  unreachable

dispatch.ok71:                                    ; preds = %dispatch.ok64
  %vtable.ptr74 = load ptr, ptr %dispatch.result70, align 8
  %method.ptr.addr75 = getelementptr ptr, ptr %vtable.ptr74, i64 14
  %method.ptr76 = load ptr, ptr %method.ptr.addr75, align 8
  %dispatch.result77 = call ptr %method.ptr76(ptr %dispatch.result70)
  %self78 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull81 = icmp eq ptr %self78, null
  br i1 %dispatch.isnull81, label %dispatch.abort80, label %dispatch.ok79

dispatch.abort72:                                 ; preds = %dispatch.ok64
  call void @abort()
  unreachable

dispatch.ok79:                                    ; preds = %dispatch.ok71
  %vtable.ptr82 = load ptr, ptr %self78, align 8
  %method.ptr.addr83 = getelementptr ptr, ptr %vtable.ptr82, i64 5
  %method.ptr84 = load ptr, ptr %method.ptr.addr83, align 8
  %dispatch.result85 = call ptr %method.ptr84(ptr %self78, ptr @.str.663015862694159157)
  %root86 = load ptr, ptr %root, align 8
  %dispatch.isnull89 = icmp eq ptr %root86, null
  br i1 %dispatch.isnull89, label %dispatch.abort88, label %dispatch.ok87

dispatch.abort80:                                 ; preds = %dispatch.ok71
  call void @abort()
  unreachable

dispatch.ok87:                                    ; preds = %dispatch.ok79
  %vtable.ptr90 = load ptr, ptr %root86, align 8
  %method.ptr.addr91 = getelementptr ptr, ptr %vtable.ptr90, i64 6
  %method.ptr92 = load ptr, ptr %method.ptr.addr91, align 8
  %dispatch.result93 = call ptr %method.ptr92(ptr %root86)
  %dispatch.isnull96 = icmp eq ptr %dispatch.result93, null
  br i1 %dispatch.isnull96, label %dispatch.abort95, label %dispatch.ok94

dispatch.abort88:                                 ; preds = %dispatch.ok79
  call void @abort()
  unreachable

dispatch.ok94:                                    ; preds = %dispatch.ok87
  %vtable.ptr97 = load ptr, ptr %dispatch.result93, align 8
  %method.ptr.addr98 = getelementptr ptr, ptr %vtable.ptr97, i64 14
  %method.ptr99 = load ptr, ptr %method.ptr.addr98, align 8
  %dispatch.result100 = call ptr %method.ptr99(ptr %dispatch.result93)
  %self101 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull104 = icmp eq ptr %self101, null
  br i1 %dispatch.isnull104, label %dispatch.abort103, label %dispatch.ok102

dispatch.abort95:                                 ; preds = %dispatch.ok87
  call void @abort()
  unreachable

dispatch.ok102:                                   ; preds = %dispatch.ok94
  %vtable.ptr105 = load ptr, ptr %self101, align 8
  %method.ptr.addr106 = getelementptr ptr, ptr %vtable.ptr105, i64 5
  %method.ptr107 = load ptr, ptr %method.ptr.addr106, align 8
  %dispatch.result108 = call ptr %method.ptr107(ptr %self101, ptr @.str.2075187935525178764)
  %root109 = load ptr, ptr %root, align 8
  %dispatch.isnull112 = icmp eq ptr %root109, null
  br i1 %dispatch.isnull112, label %dispatch.abort111, label %dispatch.ok110

dispatch.abort103:                                ; preds = %dispatch.ok94
  call void @abort()
  unreachable

dispatch.ok110:                                   ; preds = %dispatch.ok102
  %vtable.ptr113 = load ptr, ptr %root109, align 8
  %method.ptr.addr114 = getelementptr ptr, ptr %vtable.ptr113, i64 7
  %method.ptr115 = load ptr, ptr %method.ptr.addr114, align 8
  %dispatch.result116 = call ptr %method.ptr115(ptr %root109)
  %dispatch.isnull119 = icmp eq ptr %dispatch.result116, null
  br i1 %dispatch.isnull119, label %dispatch.abort118, label %dispatch.ok117

dispatch.abort111:                                ; preds = %dispatch.ok102
  call void @abort()
  unreachable

dispatch.ok117:                                   ; preds = %dispatch.ok110
  %vtable.ptr120 = load ptr, ptr %dispatch.result116, align 8
  %method.ptr.addr121 = getelementptr ptr, ptr %vtable.ptr120, i64 14
  %method.ptr122 = load ptr, ptr %method.ptr.addr121, align 8
  %dispatch.result123 = call ptr %method.ptr122(ptr %dispatch.result116)
  ret ptr %dispatch.result123

dispatch.abort118:                                ; preds = %dispatch.ok110
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

define void @_ZN4TreeC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Tree, ptr %this, i32 0, i32 0
  call void @_ZN6ObjectC2Ev(ptr %parent.subobject)
  store ptr @_ZTV4Tree, ptr %this, align 8
  ret void
}

define ptr @Tree.new() {
entry:
  %0 = call ptr @malloc(i64 8)
  call void @_ZN4TreeC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN9EmptyTreeC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.EmptyTree, ptr %this, i32 0, i32 0
  call void @_ZN4TreeC2Ev(ptr %parent.subobject)
  store ptr @_ZTV9EmptyTree, ptr %this, align 8
  ret void
}

define ptr @EmptyTree.new() {
entry:
  %0 = call ptr @malloc(i64 8)
  call void @_ZN9EmptyTreeC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN8TreeNodeC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.TreeNode, ptr %this, i32 0, i32 0
  call void @_ZN4TreeC2Ev(ptr %parent.subobject)
  store ptr @_ZTV8TreeNode, ptr %this, align 8
  %value_v.addr.byte = getelementptr i8, ptr %this, i64 8
  store i32 0, ptr %value_v.addr.byte, align 4
  %left_v.addr.byte = getelementptr i8, ptr %this, i64 16
  store ptr null, ptr %left_v.addr.byte, align 8
  %right_v.addr.byte = getelementptr i8, ptr %this, i64 24
  store ptr null, ptr %right_v.addr.byte, align 8
  ret void
}

define ptr @TreeNode.new() {
entry:
  %0 = call ptr @malloc(i64 32)
  call void @_ZN8TreeNodeC2Ev(ptr %0)
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
