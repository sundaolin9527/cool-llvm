; ModuleID = 'main_module'
source_filename = "main_module"

%struct.__cxxabiv1.__class_type_info = type { ptr, ptr }
%struct.__cxxabiv1.__si_class_type_info = type { ptr, ptr, ptr }
%class.Int = type { %class.Object.0, i32, [4 x i8] }
%class.Object.0 = type { ptr }
%class.Bool = type { %class.Object.0, i1, [7 x i8] }
%class.String = type { %class.Object.0, ptr, i32, [4 x i8], i32, [4 x i8] }
%class.IO.1 = type { %class.Object.0 }
%class.Book = type { %class.IO.1, ptr, ptr }
%class.Article = type { %class.Book, ptr }
%class.BookList = type { %class.IO.1 }
%class.Cons = type { %class.BookList, ptr, ptr }
%class.Nil = type { %class.BookList }
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
@_ZTS4Book = linkonce_odr constant [6 x i8] c"4Book\00", align 1
@_ZTI4Book = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Book, ptr @_ZTI2IO }, align 8
@_ZTV4Book = linkonce_odr constant [11 x ptr] [ptr null, ptr @_ZTI4Book, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Book.initBook, ptr @Book.print], align 8
@_ZTS7Article = linkonce_odr constant [9 x i8] c"7Article\00", align 1
@_ZTI7Article = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS7Article, ptr @_ZTI4Book }, align 8
@_ZTV7Article = linkonce_odr constant [12 x ptr] [ptr null, ptr @_ZTI7Article, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Book.initBook, ptr @Article.print, ptr @Article.initArticle], align 8
@_ZTS8BookList = linkonce_odr constant [10 x i8] c"8BookList\00", align 1
@_ZTI8BookList = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS8BookList, ptr @_ZTI2IO }, align 8
@_ZTV8BookList = linkonce_odr constant [14 x ptr] [ptr null, ptr @_ZTI8BookList, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @BookList.isNil, ptr @BookList.cons, ptr @BookList.car, ptr @BookList.cdr, ptr @BookList.print_list], align 8
@_ZTS4Cons = linkonce_odr constant [6 x i8] c"4Cons\00", align 1
@_ZTI4Cons = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Cons, ptr @_ZTI8BookList }, align 8
@_ZTV4Cons = linkonce_odr constant [15 x ptr] [ptr null, ptr @_ZTI4Cons, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Cons.isNil, ptr @BookList.cons, ptr @Cons.car, ptr @Cons.cdr, ptr @Cons.print_list, ptr @Cons.init], align 8
@_ZTS3Nil = linkonce_odr constant [5 x i8] c"3Nil\00", align 1
@_ZTI3Nil = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS3Nil, ptr @_ZTI8BookList }, align 8
@_ZTV3Nil = linkonce_odr constant [14 x ptr] [ptr null, ptr @_ZTI3Nil, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Nil.isNil, ptr @BookList.cons, ptr @BookList.car, ptr @BookList.cdr, ptr @Nil.print_list], align 8
@_ZTS4Main = linkonce_odr constant [6 x i8] c"4Main\00", align 1
@_ZTI4Main = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Main, ptr @_ZTI6Object }, align 8
@_ZTV4Main = linkonce_odr constant [6 x ptr] [ptr null, ptr @_ZTI4Main, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @Main.main], align 8
@.str.13206739835792491105 = private constant [13 x i8] c"title:      \00"
@.str.18400681194753865968 = private constant [2 x i8] c"\0A\00"
@.str.16378400835733961306 = private constant [13 x i8] c"author:     \00"
@.str.4987970327253138403 = private constant [14 x i8] c"periodical:  \00"
@.str.10658585667019244636 = private constant [30 x i8] c"- dynamic type was Article -\0A\00"
@.str.3148411761776571486 = private constant [27 x i8] c"- dynamic type was Book -\0A\00"
@.str.12081707418792460354 = private constant [45 x i8] c"Compilers, Principles, Techniques, and Tools\00"
@.str.3194364027650706599 = private constant [23 x i8] c"Aho, Sethi, and Ullman\00"
@.str.4650701482926338006 = private constant [20 x i8] c"The Top 100 CD_ROMs\00"
@.str.5501939007967049755 = private constant [8 x i8] c"Ulanoff\00"
@.str.11783410770516110016 = private constant [12 x i8] c"PC Magazine\00"

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

define ptr @Book.initBook(ptr %this, ptr %title_p, ptr %author_p) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %title_p.addr = alloca ptr, align 8
  store ptr %title_p, ptr %title_p.addr, align 8
  %author_p.addr = alloca ptr, align 8
  store ptr %author_p, ptr %author_p.addr, align 8
  %title_p1 = load ptr, ptr %title_p.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %title.addr = getelementptr i8, ptr %self, i32 8
  store ptr %title_p1, ptr %title.addr, align 8
  %author_p2 = load ptr, ptr %author_p.addr, align 8
  %self3 = load ptr, ptr %this.addr, align 8
  %author.addr = getelementptr i8, ptr %self3, i32 16
  store ptr %author_p2, ptr %author.addr, align 8
  %self4 = load ptr, ptr %this.addr, align 8
  ret ptr %self4
}

define ptr @Book.print(ptr %this) {
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
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.13206739835792491105)
  %dispatch.isnull3 = icmp eq ptr %dispatch.result, null
  br i1 %dispatch.isnull3, label %dispatch.abort2, label %dispatch.ok1

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok1:                                     ; preds = %dispatch.ok
  %vtable.ptr4 = load ptr, ptr %dispatch.result, align 8
  %method.ptr.addr5 = getelementptr ptr, ptr %vtable.ptr4, i64 5
  %method.ptr6 = load ptr, ptr %method.ptr.addr5, align 8
  %self7 = load ptr, ptr %this.addr, align 8
  %title.addr = getelementptr i8, ptr %self7, i32 8
  %title = load ptr, ptr %title.addr, align 8
  %dispatch.result8 = call ptr %method.ptr6(ptr %dispatch.result, ptr %title)
  %dispatch.isnull11 = icmp eq ptr %dispatch.result8, null
  br i1 %dispatch.isnull11, label %dispatch.abort10, label %dispatch.ok9

dispatch.abort2:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok9:                                     ; preds = %dispatch.ok1
  %vtable.ptr12 = load ptr, ptr %dispatch.result8, align 8
  %method.ptr.addr13 = getelementptr ptr, ptr %vtable.ptr12, i64 5
  %method.ptr14 = load ptr, ptr %method.ptr.addr13, align 8
  %dispatch.result15 = call ptr %method.ptr14(ptr %dispatch.result8, ptr @.str.18400681194753865968)
  %self16 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull19 = icmp eq ptr %self16, null
  br i1 %dispatch.isnull19, label %dispatch.abort18, label %dispatch.ok17

dispatch.abort10:                                 ; preds = %dispatch.ok1
  call void @abort()
  unreachable

dispatch.ok17:                                    ; preds = %dispatch.ok9
  %vtable.ptr20 = load ptr, ptr %self16, align 8
  %method.ptr.addr21 = getelementptr ptr, ptr %vtable.ptr20, i64 5
  %method.ptr22 = load ptr, ptr %method.ptr.addr21, align 8
  %dispatch.result23 = call ptr %method.ptr22(ptr %self16, ptr @.str.16378400835733961306)
  %dispatch.isnull26 = icmp eq ptr %dispatch.result23, null
  br i1 %dispatch.isnull26, label %dispatch.abort25, label %dispatch.ok24

dispatch.abort18:                                 ; preds = %dispatch.ok9
  call void @abort()
  unreachable

dispatch.ok24:                                    ; preds = %dispatch.ok17
  %vtable.ptr27 = load ptr, ptr %dispatch.result23, align 8
  %method.ptr.addr28 = getelementptr ptr, ptr %vtable.ptr27, i64 5
  %method.ptr29 = load ptr, ptr %method.ptr.addr28, align 8
  %self30 = load ptr, ptr %this.addr, align 8
  %author.addr = getelementptr i8, ptr %self30, i32 16
  %author = load ptr, ptr %author.addr, align 8
  %dispatch.result31 = call ptr %method.ptr29(ptr %dispatch.result23, ptr %author)
  %dispatch.isnull34 = icmp eq ptr %dispatch.result31, null
  br i1 %dispatch.isnull34, label %dispatch.abort33, label %dispatch.ok32

dispatch.abort25:                                 ; preds = %dispatch.ok17
  call void @abort()
  unreachable

dispatch.ok32:                                    ; preds = %dispatch.ok24
  %vtable.ptr35 = load ptr, ptr %dispatch.result31, align 8
  %method.ptr.addr36 = getelementptr ptr, ptr %vtable.ptr35, i64 5
  %method.ptr37 = load ptr, ptr %method.ptr.addr36, align 8
  %dispatch.result38 = call ptr %method.ptr37(ptr %dispatch.result31, ptr @.str.18400681194753865968)
  %self39 = load ptr, ptr %this.addr, align 8
  ret ptr %self39

dispatch.abort33:                                 ; preds = %dispatch.ok24
  call void @abort()
  unreachable
}

define ptr @Article.initArticle(ptr %this, ptr %title_p, ptr %author_p, ptr %per_title_p) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %title_p.addr = alloca ptr, align 8
  store ptr %title_p, ptr %title_p.addr, align 8
  %author_p.addr = alloca ptr, align 8
  store ptr %author_p, ptr %author_p.addr, align 8
  %per_title_p.addr = alloca ptr, align 8
  store ptr %per_title_p, ptr %per_title_p.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 9
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %title_p1 = load ptr, ptr %title_p.addr, align 8
  %author_p2 = load ptr, ptr %author_p.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr %title_p1, ptr %author_p2)
  %per_title_p3 = load ptr, ptr %per_title_p.addr, align 8
  %self4 = load ptr, ptr %this.addr, align 8
  %per_title.addr = getelementptr i8, ptr %self4, i32 24
  store ptr %per_title_p3, ptr %per_title.addr, align 8
  %self5 = load ptr, ptr %this.addr, align 8
  ret ptr %self5

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @Article.print(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %static.dispatch.isnull = icmp eq ptr %self, null
  br i1 %static.dispatch.isnull, label %static.dispatch.abort, label %static.dispatch.ok

static.dispatch.ok:                               ; preds = %entry
  %0 = call ptr @Book.print(ptr %self)
  %self1 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self1, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

static.dispatch.abort:                            ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok:                                      ; preds = %static.dispatch.ok
  %vtable.ptr = load ptr, ptr %self1, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self1, ptr @.str.4987970327253138403)
  %dispatch.isnull4 = icmp eq ptr %dispatch.result, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %static.dispatch.ok
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %dispatch.result, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 5
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %self8 = load ptr, ptr %this.addr, align 8
  %per_title.addr = getelementptr i8, ptr %self8, i32 24
  %per_title = load ptr, ptr %per_title.addr, align 8
  %dispatch.result9 = call ptr %method.ptr7(ptr %dispatch.result, ptr %per_title)
  %dispatch.isnull12 = icmp eq ptr %dispatch.result9, null
  br i1 %dispatch.isnull12, label %dispatch.abort11, label %dispatch.ok10

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok10:                                    ; preds = %dispatch.ok2
  %vtable.ptr13 = load ptr, ptr %dispatch.result9, align 8
  %method.ptr.addr14 = getelementptr ptr, ptr %vtable.ptr13, i64 5
  %method.ptr15 = load ptr, ptr %method.ptr.addr14, align 8
  %dispatch.result16 = call ptr %method.ptr15(ptr %dispatch.result9, ptr @.str.18400681194753865968)
  %self17 = load ptr, ptr %this.addr, align 8
  ret ptr %self17

dispatch.abort11:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable
}

define i1 @BookList.isNil(ptr %this) {
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

define ptr @BookList.cons(ptr %this, ptr %hd) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %hd.addr = alloca ptr, align 8
  store ptr %hd, ptr %hd.addr, align 8
  %new_cell = alloca ptr, align 8
  %Cons.newtmp = call ptr @Cons.new()
  store ptr %Cons.newtmp, ptr %new_cell, align 8
  %new_cell1 = load ptr, ptr %new_cell, align 8
  %dispatch.isnull = icmp eq ptr %new_cell1, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %new_cell1, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 14
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %hd2 = load ptr, ptr %hd.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %new_cell1, ptr %hd2, ptr %self)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @BookList.car(ptr %this) {
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

define ptr @BookList.cdr(ptr %this) {
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

define ptr @BookList.print_list(ptr %this) {
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

define ptr @Cons.init(ptr %this, ptr %hd, ptr %tl) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %hd.addr = alloca ptr, align 8
  store ptr %hd, ptr %hd.addr, align 8
  %tl.addr = alloca ptr, align 8
  store ptr %tl, ptr %tl.addr, align 8
  %hd1 = load ptr, ptr %hd.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %xcar.addr = getelementptr i8, ptr %self, i32 8
  store ptr %hd1, ptr %xcar.addr, align 8
  %tl2 = load ptr, ptr %tl.addr, align 8
  %self3 = load ptr, ptr %this.addr, align 8
  %xcdr.addr = getelementptr i8, ptr %self3, i32 16
  store ptr %tl2, ptr %xcdr.addr, align 8
  %self4 = load ptr, ptr %this.addr, align 8
  ret ptr %self4
}

define ptr @Cons.car(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %xcar.addr = getelementptr i8, ptr %self, i32 8
  %xcar = load ptr, ptr %xcar.addr, align 8
  ret ptr %xcar
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

define ptr @Cons.print_list(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %xcar.addr = getelementptr i8, ptr %self, i32 8
  %xcar = load ptr, ptr %xcar.addr, align 8
  %dispatch.isnull = icmp eq ptr %xcar, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %xcar, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 10
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %xcar)
  %case.isnull = icmp eq ptr %dispatch.result, null
  br i1 %case.isnull, label %case.abort, label %case.ok

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

case.ok:                                          ; preds = %dispatch.ok
  %case.vptr = load ptr, ptr %dispatch.result, align 8
  %Article.match = icmp eq ptr %case.vptr, @_ZTV7Article
  br i1 %Article.match, label %case.match, label %case.next

case.abort:                                       ; preds = %dispatch.ok
  call void @abort()
  unreachable

case.match:                                       ; preds = %case.ok
  %dummy.addr = alloca ptr, align 8
  store ptr %dispatch.result, ptr %dummy.addr, align 8
  %self1 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull4 = icmp eq ptr %self1, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.ok2:                                     ; preds = %case.match
  %vtable.ptr5 = load ptr, ptr %self1, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 5
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %dispatch.result8 = call ptr %method.ptr7(ptr %self1, ptr @.str.10658585667019244636)
  br label %case.end

dispatch.abort3:                                  ; preds = %case.match
  call void @abort()
  unreachable

case.next:                                        ; preds = %case.ok
  %Article.match10 = icmp eq ptr %case.vptr, @_ZTV7Article
  %Book.match = icmp eq ptr %case.vptr, @_ZTV4Book
  %case.or = or i1 %Article.match10, %Book.match
  br i1 %case.or, label %case.match9, label %case.abort11

case.match9:                                      ; preds = %case.next
  %dummy.addr12 = alloca ptr, align 8
  store ptr %dispatch.result, ptr %dummy.addr12, align 8
  %self13 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull16 = icmp eq ptr %self13, null
  br i1 %dispatch.isnull16, label %dispatch.abort15, label %dispatch.ok14

case.abort11:                                     ; preds = %case.next
  call void @abort()
  unreachable

dispatch.ok14:                                    ; preds = %case.match9
  %vtable.ptr17 = load ptr, ptr %self13, align 8
  %method.ptr.addr18 = getelementptr ptr, ptr %vtable.ptr17, i64 5
  %method.ptr19 = load ptr, ptr %method.ptr.addr18, align 8
  %dispatch.result20 = call ptr %method.ptr19(ptr %self13, ptr @.str.3148411761776571486)
  br label %case.end

dispatch.abort15:                                 ; preds = %case.match9
  call void @abort()
  unreachable

case.end:                                         ; preds = %dispatch.ok14, %dispatch.ok2
  %case.result = phi ptr [ %dispatch.result8, %dispatch.ok2 ], [ %dispatch.result20, %dispatch.ok14 ]
  %self21 = load ptr, ptr %this.addr, align 8
  %xcdr.addr = getelementptr i8, ptr %self21, i32 16
  %xcdr = load ptr, ptr %xcdr.addr, align 8
  %dispatch.isnull24 = icmp eq ptr %xcdr, null
  br i1 %dispatch.isnull24, label %dispatch.abort23, label %dispatch.ok22

dispatch.ok22:                                    ; preds = %case.end
  %vtable.ptr25 = load ptr, ptr %xcdr, align 8
  %method.ptr.addr26 = getelementptr ptr, ptr %vtable.ptr25, i64 13
  %method.ptr27 = load ptr, ptr %method.ptr.addr26, align 8
  %dispatch.result28 = call ptr %method.ptr27(ptr %xcdr)
  ret ptr %dispatch.result28

dispatch.abort23:                                 ; preds = %case.end
  call void @abort()
  unreachable
}

define i1 @Nil.isNil(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  ret i1 true
}

define ptr @Nil.print_list(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  ret ptr inttoptr (i1 true to ptr)
}

define ptr @Main.main(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %a_book = alloca ptr, align 8
  %Book.newtmp = call ptr @Book.new()
  %dispatch.isnull = icmp eq ptr %Book.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %Book.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 9
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %Book.newtmp, ptr @.str.12081707418792460354, ptr @.str.3194364027650706599)
  store ptr %dispatch.result, ptr %a_book, align 8
  %an_article = alloca ptr, align 8
  %Article.newtmp = call ptr @Article.new()
  %dispatch.isnull3 = icmp eq ptr %Article.newtmp, null
  br i1 %dispatch.isnull3, label %dispatch.abort2, label %dispatch.ok1

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok1:                                     ; preds = %dispatch.ok
  %vtable.ptr4 = load ptr, ptr %Article.newtmp, align 8
  %method.ptr.addr5 = getelementptr ptr, ptr %vtable.ptr4, i64 11
  %method.ptr6 = load ptr, ptr %method.ptr.addr5, align 8
  %dispatch.result7 = call ptr %method.ptr6(ptr %Article.newtmp, ptr @.str.4650701482926338006, ptr @.str.5501939007967049755, ptr @.str.11783410770516110016)
  store ptr %dispatch.result7, ptr %an_article, align 8
  %Nil.newtmp = call ptr @Nil.new()
  %dispatch.isnull10 = icmp eq ptr %Nil.newtmp, null
  br i1 %dispatch.isnull10, label %dispatch.abort9, label %dispatch.ok8

dispatch.abort2:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok8:                                     ; preds = %dispatch.ok1
  %vtable.ptr11 = load ptr, ptr %Nil.newtmp, align 8
  %method.ptr.addr12 = getelementptr ptr, ptr %vtable.ptr11, i64 10
  %method.ptr13 = load ptr, ptr %method.ptr.addr12, align 8
  %a_book14 = load ptr, ptr %a_book, align 8
  %dispatch.result15 = call ptr %method.ptr13(ptr %Nil.newtmp, ptr %a_book14)
  %dispatch.isnull18 = icmp eq ptr %dispatch.result15, null
  br i1 %dispatch.isnull18, label %dispatch.abort17, label %dispatch.ok16

dispatch.abort9:                                  ; preds = %dispatch.ok1
  call void @abort()
  unreachable

dispatch.ok16:                                    ; preds = %dispatch.ok8
  %vtable.ptr19 = load ptr, ptr %dispatch.result15, align 8
  %method.ptr.addr20 = getelementptr ptr, ptr %vtable.ptr19, i64 10
  %method.ptr21 = load ptr, ptr %method.ptr.addr20, align 8
  %an_article22 = load ptr, ptr %an_article, align 8
  %dispatch.result23 = call ptr %method.ptr21(ptr %dispatch.result15, ptr %an_article22)
  %self = load ptr, ptr %this.addr, align 8
  %books.addr = getelementptr i8, ptr %self, i32 8
  store ptr %dispatch.result23, ptr %books.addr, align 8
  %self24 = load ptr, ptr %this.addr, align 8
  %books.addr25 = getelementptr i8, ptr %self24, i32 8
  %books = load ptr, ptr %books.addr25, align 8
  %dispatch.isnull28 = icmp eq ptr %books, null
  br i1 %dispatch.isnull28, label %dispatch.abort27, label %dispatch.ok26

dispatch.abort17:                                 ; preds = %dispatch.ok8
  call void @abort()
  unreachable

dispatch.ok26:                                    ; preds = %dispatch.ok16
  %vtable.ptr29 = load ptr, ptr %books, align 8
  %method.ptr.addr30 = getelementptr ptr, ptr %vtable.ptr29, i64 13
  %method.ptr31 = load ptr, ptr %method.ptr.addr30, align 8
  %dispatch.result32 = call ptr %method.ptr31(ptr %books)
  ret ptr %dispatch.result32

dispatch.abort27:                                 ; preds = %dispatch.ok16
  call void @abort()
  unreachable
}

define void @_ZN4BookC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Book, ptr %this, i32 0, i32 0
  call void @_ZN2IOC2Ev(ptr %parent.subobject)
  store ptr @_ZTV4Book, ptr %this, align 8
  %title.addr.byte = getelementptr i8, ptr %this, i64 8
  store ptr @.str.const.6142509188972423790, ptr %title.addr.byte, align 8
  %author.addr.byte = getelementptr i8, ptr %this, i64 16
  store ptr @.str.const.6142509188972423790, ptr %author.addr.byte, align 8
  ret void
}

define ptr @Book.new() {
entry:
  %0 = call ptr @malloc(i64 24)
  call void @_ZN4BookC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN7ArticleC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Article, ptr %this, i32 0, i32 0
  call void @_ZN4BookC2Ev(ptr %parent.subobject)
  store ptr @_ZTV7Article, ptr %this, align 8
  %per_title.addr.byte = getelementptr i8, ptr %this, i64 24
  store ptr @.str.const.6142509188972423790, ptr %per_title.addr.byte, align 8
  ret void
}

define ptr @Article.new() {
entry:
  %0 = call ptr @malloc(i64 32)
  call void @_ZN7ArticleC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN8BookListC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.BookList, ptr %this, i32 0, i32 0
  call void @_ZN2IOC2Ev(ptr %parent.subobject)
  store ptr @_ZTV8BookList, ptr %this, align 8
  ret void
}

define ptr @BookList.new() {
entry:
  %0 = call ptr @malloc(i64 8)
  call void @_ZN8BookListC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN4ConsC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Cons, ptr %this, i32 0, i32 0
  call void @_ZN8BookListC2Ev(ptr %parent.subobject)
  store ptr @_ZTV4Cons, ptr %this, align 8
  %xcar.addr.byte = getelementptr i8, ptr %this, i64 8
  store ptr null, ptr %xcar.addr.byte, align 8
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
  call void @_ZN8BookListC2Ev(ptr %parent.subobject)
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
  call void @_ZN6ObjectC2Ev(ptr %parent.subobject)
  store ptr @_ZTV4Main, ptr %this, align 8
  %books.addr.byte = getelementptr i8, ptr %this, i64 8
  store ptr null, ptr %books.addr.byte, align 8
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
