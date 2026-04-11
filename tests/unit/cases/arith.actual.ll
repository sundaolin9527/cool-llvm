; ModuleID = 'main_module'
source_filename = "main_module"

%struct.__cxxabiv1.__class_type_info = type { ptr, ptr }
%struct.__cxxabiv1.__si_class_type_info = type { ptr, ptr, ptr }
%class.Int = type { %class.Object.0, i32, [4 x i8] }
%class.Object.0 = type { ptr }
%class.Bool = type { %class.Object.0, i1, [7 x i8] }
%class.String = type { %class.Object.0, ptr, i32, [4 x i8], i32, [4 x i8] }
%class.IO.1 = type { %class.Object.0 }
%class.A = type { %class.Object.0, i32, [4 x i8] }
%class.B = type { %class.A }
%class.C = type { %class.B }
%class.D = type { %class.B }
%class.E = type { %class.D }
%class.A2I = type { %class.Object.0 }
%class.Main = type { %class.IO.1, ptr, ptr, ptr, i1, [7 x i8] }

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
@_ZTV1A = linkonce_odr constant [12 x ptr] [ptr null, ptr @_ZTI1A, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @A.value, ptr @A.set_var, ptr @A.method1, ptr @A.method2, ptr @A.method3, ptr @A.method4, ptr @A.method5], align 8
@_ZTS1B = linkonce_odr constant [3 x i8] c"1B\00", align 1
@_ZTI1B = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS1B, ptr @_ZTI1A }, align 8
@_ZTV1B = linkonce_odr constant [12 x ptr] [ptr null, ptr @_ZTI1B, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @A.value, ptr @A.set_var, ptr @A.method1, ptr @A.method2, ptr @A.method3, ptr @A.method4, ptr @B.method5], align 8
@_ZTS1C = linkonce_odr constant [3 x i8] c"1C\00", align 1
@_ZTI1C = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS1C, ptr @_ZTI1B }, align 8
@_ZTV1C = linkonce_odr constant [13 x ptr] [ptr null, ptr @_ZTI1C, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @A.value, ptr @A.set_var, ptr @A.method1, ptr @A.method2, ptr @A.method3, ptr @A.method4, ptr @C.method5, ptr @C.method6], align 8
@_ZTS1D = linkonce_odr constant [3 x i8] c"1D\00", align 1
@_ZTI1D = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS1D, ptr @_ZTI1B }, align 8
@_ZTV1D = linkonce_odr constant [13 x ptr] [ptr null, ptr @_ZTI1D, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @A.value, ptr @A.set_var, ptr @A.method1, ptr @A.method2, ptr @A.method3, ptr @A.method4, ptr @B.method5, ptr @D.method7], align 8
@_ZTS1E = linkonce_odr constant [3 x i8] c"1E\00", align 1
@_ZTI1E = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS1E, ptr @_ZTI1D }, align 8
@_ZTV1E = linkonce_odr constant [14 x ptr] [ptr null, ptr @_ZTI1E, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @A.value, ptr @A.set_var, ptr @A.method1, ptr @A.method2, ptr @A.method3, ptr @A.method4, ptr @B.method5, ptr @D.method7, ptr @E.method6], align 8
@_ZTS3A2I = linkonce_odr constant [5 x i8] c"3A2I\00", align 1
@_ZTI3A2I = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS3A2I, ptr @_ZTI6Object }, align 8
@_ZTV3A2I = linkonce_odr constant [11 x ptr] [ptr null, ptr @_ZTI3A2I, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @A2I.c2i, ptr @A2I.i2c, ptr @A2I.a2i, ptr @A2I.a2i_aux, ptr @A2I.i2a, ptr @A2I.i2a_aux], align 8
@_ZTS4Main = linkonce_odr constant [6 x i8] c"4Main\00", align 1
@_ZTI4Main = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Main, ptr @_ZTI2IO }, align 8
@_ZTV4Main = linkonce_odr constant [16 x ptr] [ptr null, ptr @_ZTI4Main, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Main.menu, ptr @Main.prompt, ptr @Main.get_int, ptr @Main.is_even, ptr @Main.class_type, ptr @Main.print, ptr @Main.main], align 8
@.str.7372855250431704371 = private constant [2 x i8] c"-\00"
@.str.1370730858159036685 = private constant [2 x i8] c"+\00"
@.str.3580668678476895706 = private constant [22 x i8] c"\0A\09To add a number to \00"
@.str.13072783004903173325 = private constant [13 x i8] c"...enter a:\0A\00"
@.str.12953368026592705621 = private constant [12 x i8] c"\09To negate \00"
@.str.13393739814652480779 = private constant [13 x i8] c"...enter b:\0A\00"
@.str.9181702322095793384 = private constant [33 x i8] c"\09To find the difference between \00"
@.str.546962996930682290 = private constant [31 x i8] c"and another number...enter c:\0A\00"
@.str.15354544076566430546 = private constant [27 x i8] c"\09To find the factorial of \00"
@.str.14275263385995759521 = private constant [13 x i8] c"...enter d:\0A\00"
@.str.4847457655152530261 = private constant [12 x i8] c"\09To square \00"
@.str.6411555385307590735 = private constant [13 x i8] c"...enter e:\0A\00"
@.str.8100598489855396609 = private constant [10 x i8] c"\09To cube \00"
@.str.1928667565603908976 = private constant [13 x i8] c"...enter f:\0A\00"
@.str.7971971607389456643 = private constant [17 x i8] c"\09To find out if \00"
@.str.11463403669895732331 = private constant [31 x i8] c"is a multiple of 3...enter g:\0A\00"
@.str.26500464635641514 = private constant [12 x i8] c"\09To divide \00"
@.str.2912084189190072994 = private constant [17 x i8] c"by 8...enter h:\0A\00"
@.str.6572467137234190814 = private constant [33 x i8] c"\09To get a new number...enter j:\0A\00"
@.str.16722611938421386343 = private constant [22 x i8] c"\09To quit...enter q:\0A\0A\00"
@.str.18400681194753865968 = private constant [2 x i8] c"\0A\00"
@.str.6802180075859276267 = private constant [27 x i8] c"Please enter a number...  \00"
@.str.5166663087941811047 = private constant [21 x i8] c"Class type is now E\0A\00"
@.str.7438465994829122286 = private constant [21 x i8] c"Class type is now C\0A\00"
@.str.1788474358655561854 = private constant [21 x i8] c"Class type is now D\0A\00"
@.str.730409298105642144 = private constant [21 x i8] c"Class type is now B\0A\00"
@.str.7841572136186253764 = private constant [21 x i8] c"Class type is now A\0A\00"
@.str.15976673952330978103 = private constant [8 x i8] c"Oooops\0A\00"
@.str.17934988915447438835 = private constant [2 x i8] c" \00"
@.str.1187902871956776895 = private constant [8 x i8] c"number \00"
@.str.16181136536928197364 = private constant [10 x i8] c"is even!\0A\00"
@.str.13068143366059226993 = private constant [9 x i8] c"is odd!\0A\00"
@.str.4993892634952068459 = private constant [2 x i8] c"a\00"
@.str.10838281452030117757 = private constant [2 x i8] c"b\00"
@.str.10959529184379665549 = private constant [2 x i8] c"c\00"
@.str.14494284460613645429 = private constant [2 x i8] c"d\00"
@.str.2540012008095083820 = private constant [2 x i8] c"e\00"
@.str.8968846175329310707 = private constant [2 x i8] c"f\00"
@.str.11967580440506868130 = private constant [2 x i8] c"g\00"
@.str.14397651933741679677 = private constant [20 x i8] c"is divisible by 3.\0A\00"
@.str.311485499312808629 = private constant [24 x i8] c"is not divisible by 3.\0A\00"
@.str.11539147918811572172 = private constant [2 x i8] c"h\00"
@.str.15037267644295846719 = private constant [13 x i8] c"is equal to \00"
@.str.15336703179750707214 = private constant [29 x i8] c"times 8 with a remainder of \00"
@.str.10485857595211860659 = private constant [2 x i8] c"j\00"
@.str.747352984659061831 = private constant [2 x i8] c"q\00"

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

define i32 @A.value(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %var.addr = getelementptr i8, ptr %self, i32 8
  %var = load i32, ptr %var.addr, align 4
  ret i32 %var
}

define ptr @A.set_var(ptr %this, i32 %num) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %num.addr = alloca i32, align 4
  store i32 %num, ptr %num.addr, align 4
  %num1 = load i32, ptr %num.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %var.addr = getelementptr i8, ptr %self, i32 8
  store i32 %num1, ptr %var.addr, align 4
  %self2 = load ptr, ptr %this.addr, align 8
  ret ptr %self2
}

define ptr @A.method1(ptr %this, i32 %num) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %num.addr = alloca i32, align 4
  store i32 %num, ptr %num.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  ret ptr %self
}

define ptr @A.method2(ptr %this, i32 %num1, i32 %num2) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %num1.addr = alloca i32, align 4
  store i32 %num1, ptr %num1.addr, align 4
  %num2.addr = alloca i32, align 4
  store i32 %num2, ptr %num2.addr, align 4
  %x = alloca i32, align 4
  store i32 0, ptr %x, align 4
  %num11 = load i32, ptr %num1.addr, align 4
  %num22 = load i32, ptr %num2.addr, align 4
  %addtmp = add i32 %num11, %num22
  store i32 %addtmp, ptr %x, align 4
  %B.newtmp = call ptr @B.new()
  %dispatch.isnull = icmp eq ptr %B.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %B.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 6
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x3 = load i32, ptr %x, align 4
  %dispatch.result = call ptr %method.ptr(ptr %B.newtmp, i32 %x3)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @A.method3(ptr %this, i32 %num) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %num.addr = alloca i32, align 4
  store i32 %num, ptr %num.addr, align 4
  %x = alloca i32, align 4
  store i32 0, ptr %x, align 4
  %num1 = load i32, ptr %num.addr, align 4
  %negtmp = sub i32 0, %num1
  store i32 %negtmp, ptr %x, align 4
  %C.newtmp = call ptr @C.new()
  %dispatch.isnull = icmp eq ptr %C.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %C.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 6
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x2 = load i32, ptr %x, align 4
  %dispatch.result = call ptr %method.ptr(ptr %C.newtmp, i32 %x2)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @A.method4(ptr %this, i32 %num1, i32 %num2) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %num1.addr = alloca i32, align 4
  store i32 %num1, ptr %num1.addr, align 4
  %num2.addr = alloca i32, align 4
  store i32 %num2, ptr %num2.addr, align 4
  %num21 = load i32, ptr %num2.addr, align 4
  %num12 = load i32, ptr %num1.addr, align 4
  %cmptmp = icmp slt i32 %num21, %num12
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  %x = alloca i32, align 4
  store i32 0, ptr %x, align 4
  %num13 = load i32, ptr %num1.addr, align 4
  %num24 = load i32, ptr %num2.addr, align 4
  %subtmp = sub i32 %num13, %num24
  store i32 %subtmp, ptr %x, align 4
  %D.newtmp = call ptr @D.new()
  %dispatch.isnull = icmp eq ptr %D.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %then
  %vtable.ptr = load ptr, ptr %D.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 6
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x5 = load i32, ptr %x, align 4
  %dispatch.result = call ptr %method.ptr(ptr %D.newtmp, i32 %x5)
  br label %ifcont

dispatch.abort:                                   ; preds = %then
  call void @abort()
  unreachable

else:                                             ; preds = %entry
  %x6 = alloca i32, align 4
  store i32 0, ptr %x6, align 4
  %num27 = load i32, ptr %num2.addr, align 4
  %num18 = load i32, ptr %num1.addr, align 4
  %subtmp9 = sub i32 %num27, %num18
  store i32 %subtmp9, ptr %x6, align 4
  %D.newtmp10 = call ptr @D.new()
  %dispatch.isnull13 = icmp eq ptr %D.newtmp10, null
  br i1 %dispatch.isnull13, label %dispatch.abort12, label %dispatch.ok11

dispatch.ok11:                                    ; preds = %else
  %vtable.ptr14 = load ptr, ptr %D.newtmp10, align 8
  %method.ptr.addr15 = getelementptr ptr, ptr %vtable.ptr14, i64 6
  %method.ptr16 = load ptr, ptr %method.ptr.addr15, align 8
  %x17 = load i32, ptr %x6, align 4
  %dispatch.result18 = call ptr %method.ptr16(ptr %D.newtmp10, i32 %x17)
  br label %ifcont

dispatch.abort12:                                 ; preds = %else
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok11, %dispatch.ok
  %cond_result = phi ptr [ %dispatch.result, %dispatch.ok ], [ %dispatch.result18, %dispatch.ok11 ]
  ret ptr %cond_result
}

define ptr @A.method5(ptr %this, i32 %num) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %num.addr = alloca i32, align 4
  store i32 %num, ptr %num.addr, align 4
  %x = alloca i32, align 4
  store i32 1, ptr %x, align 4
  %y = alloca i32, align 4
  store i32 1, ptr %y, align 4
  br label %loop.cond

loop.cond:                                        ; preds = %loop.body, %entry
  %y1 = load i32, ptr %y, align 4
  %num2 = load i32, ptr %num.addr, align 4
  %leqtmp = icmp sle i32 %y1, %num2
  br i1 %leqtmp, label %loop.body, label %loop.after

loop.body:                                        ; preds = %loop.cond
  %x3 = load i32, ptr %x, align 4
  %y4 = load i32, ptr %y, align 4
  %multmp = mul i32 %x3, %y4
  store i32 %multmp, ptr %x, align 4
  %y5 = load i32, ptr %y, align 4
  %addtmp = add i32 %y5, 1
  store i32 %addtmp, ptr %y, align 4
  br label %loop.cond

loop.after:                                       ; preds = %loop.cond
  %E.newtmp = call ptr @E.new()
  %dispatch.isnull = icmp eq ptr %E.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %loop.after
  %vtable.ptr = load ptr, ptr %E.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 6
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x6 = load i32, ptr %x, align 4
  %dispatch.result = call ptr %method.ptr(ptr %E.newtmp, i32 %x6)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %loop.after
  call void @abort()
  unreachable
}

define ptr @B.method5(ptr %this, i32 %num) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %num.addr = alloca i32, align 4
  store i32 %num, ptr %num.addr, align 4
  %x = alloca i32, align 4
  store i32 0, ptr %x, align 4
  %num1 = load i32, ptr %num.addr, align 4
  %num2 = load i32, ptr %num.addr, align 4
  %multmp = mul i32 %num1, %num2
  store i32 %multmp, ptr %x, align 4
  %E.newtmp = call ptr @E.new()
  %dispatch.isnull = icmp eq ptr %E.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %E.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 6
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x3 = load i32, ptr %x, align 4
  %dispatch.result = call ptr %method.ptr(ptr %E.newtmp, i32 %x3)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @C.method6(ptr %this, i32 %num) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %num.addr = alloca i32, align 4
  store i32 %num, ptr %num.addr, align 4
  %x = alloca i32, align 4
  store i32 0, ptr %x, align 4
  %num1 = load i32, ptr %num.addr, align 4
  %negtmp = sub i32 0, %num1
  store i32 %negtmp, ptr %x, align 4
  %A.newtmp = call ptr @A.new()
  %dispatch.isnull = icmp eq ptr %A.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %A.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 6
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x2 = load i32, ptr %x, align 4
  %dispatch.result = call ptr %method.ptr(ptr %A.newtmp, i32 %x2)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @C.method5(ptr %this, i32 %num) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %num.addr = alloca i32, align 4
  store i32 %num, ptr %num.addr, align 4
  %x = alloca i32, align 4
  store i32 0, ptr %x, align 4
  %num1 = load i32, ptr %num.addr, align 4
  %num2 = load i32, ptr %num.addr, align 4
  %multmp = mul i32 %num1, %num2
  %num3 = load i32, ptr %num.addr, align 4
  %multmp4 = mul i32 %multmp, %num3
  store i32 %multmp4, ptr %x, align 4
  %E.newtmp = call ptr @E.new()
  %dispatch.isnull = icmp eq ptr %E.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %E.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 6
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x5 = load i32, ptr %x, align 4
  %dispatch.result = call ptr %method.ptr(ptr %E.newtmp, i32 %x5)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define i1 @D.method7(ptr %this, i32 %num) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %num.addr = alloca i32, align 4
  store i32 %num, ptr %num.addr, align 4
  %x = alloca i32, align 4
  %num1 = load i32, ptr %num.addr, align 4
  store i32 %num1, ptr %x, align 4
  %x2 = load i32, ptr %x, align 4
  %cmptmp = icmp slt i32 %x2, 0
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %then
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 12
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x3 = load i32, ptr %x, align 4
  %negtmp = sub i32 0, %x3
  %dispatch.result = call i1 %method.ptr(ptr %self, i32 %negtmp)
  br label %ifcont28

dispatch.abort:                                   ; preds = %then
  call void @abort()
  unreachable

else:                                             ; preds = %entry
  %x4 = load i32, ptr %x, align 4
  %eqtmp = icmp eq i32 0, %x4
  br i1 %eqtmp, label %then5, label %else6

then5:                                            ; preds = %else
  br label %ifcont26

else6:                                            ; preds = %else
  %x7 = load i32, ptr %x, align 4
  %eqtmp8 = icmp eq i32 1, %x7
  br i1 %eqtmp8, label %then9, label %else10

then9:                                            ; preds = %else6
  br label %ifcont24

else10:                                           ; preds = %else6
  %x11 = load i32, ptr %x, align 4
  %eqtmp12 = icmp eq i32 2, %x11
  br i1 %eqtmp12, label %then13, label %else14

then13:                                           ; preds = %else10
  br label %ifcont

else14:                                           ; preds = %else10
  %self15 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull18 = icmp eq ptr %self15, null
  br i1 %dispatch.isnull18, label %dispatch.abort17, label %dispatch.ok16

dispatch.ok16:                                    ; preds = %else14
  %vtable.ptr19 = load ptr, ptr %self15, align 8
  %method.ptr.addr20 = getelementptr ptr, ptr %vtable.ptr19, i64 12
  %method.ptr21 = load ptr, ptr %method.ptr.addr20, align 8
  %x22 = load i32, ptr %x, align 4
  %subtmp = sub i32 %x22, 3
  %dispatch.result23 = call i1 %method.ptr21(ptr %self15, i32 %subtmp)
  br label %ifcont

dispatch.abort17:                                 ; preds = %else14
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok16, %then13
  %cond_result = phi i1 [ false, %then13 ], [ %dispatch.result23, %dispatch.ok16 ]
  br label %ifcont24

ifcont24:                                         ; preds = %ifcont, %then9
  %cond_result25 = phi i1 [ false, %then9 ], [ %cond_result, %ifcont ]
  br label %ifcont26

ifcont26:                                         ; preds = %ifcont24, %then5
  %cond_result27 = phi i1 [ true, %then5 ], [ %cond_result25, %ifcont24 ]
  br label %ifcont28

ifcont28:                                         ; preds = %ifcont26, %dispatch.ok
  %cond_result29 = phi i1 [ %dispatch.result, %dispatch.ok ], [ %cond_result27, %ifcont26 ]
  ret i1 %cond_result29
}

define ptr @E.method6(ptr %this, i32 %num) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %num.addr = alloca i32, align 4
  store i32 %num, ptr %num.addr, align 4
  %x = alloca i32, align 4
  store i32 0, ptr %x, align 4
  %num1 = load i32, ptr %num.addr, align 4
  %divtmp = sdiv i32 %num1, 8
  store i32 %divtmp, ptr %x, align 4
  %A.newtmp = call ptr @A.new()
  %dispatch.isnull = icmp eq ptr %A.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %A.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 6
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x2 = load i32, ptr %x, align 4
  %dispatch.result = call ptr %method.ptr(ptr %A.newtmp, i32 %x2)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
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

define ptr @Main.menu(ptr %this) {
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
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.3580668678476895706)
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
  %self8 = load ptr, ptr %this.addr, align 8
  %avar.addr = getelementptr i8, ptr %self8, i32 16
  %avar = load ptr, ptr %avar.addr, align 8
  %dispatch.result9 = call ptr %method.ptr7(ptr %self1, ptr %avar)
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
  %dispatch.result17 = call ptr %method.ptr16(ptr %self10, ptr @.str.13072783004903173325)
  %self18 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull21 = icmp eq ptr %self18, null
  br i1 %dispatch.isnull21, label %dispatch.abort20, label %dispatch.ok19

dispatch.abort12:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable

dispatch.ok19:                                    ; preds = %dispatch.ok11
  %vtable.ptr22 = load ptr, ptr %self18, align 8
  %method.ptr.addr23 = getelementptr ptr, ptr %vtable.ptr22, i64 5
  %method.ptr24 = load ptr, ptr %method.ptr.addr23, align 8
  %dispatch.result25 = call ptr %method.ptr24(ptr %self18, ptr @.str.12953368026592705621)
  %self26 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull29 = icmp eq ptr %self26, null
  br i1 %dispatch.isnull29, label %dispatch.abort28, label %dispatch.ok27

dispatch.abort20:                                 ; preds = %dispatch.ok11
  call void @abort()
  unreachable

dispatch.ok27:                                    ; preds = %dispatch.ok19
  %vtable.ptr30 = load ptr, ptr %self26, align 8
  %method.ptr.addr31 = getelementptr ptr, ptr %vtable.ptr30, i64 14
  %method.ptr32 = load ptr, ptr %method.ptr.addr31, align 8
  %self33 = load ptr, ptr %this.addr, align 8
  %avar.addr34 = getelementptr i8, ptr %self33, i32 16
  %avar35 = load ptr, ptr %avar.addr34, align 8
  %dispatch.result36 = call ptr %method.ptr32(ptr %self26, ptr %avar35)
  %self37 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull40 = icmp eq ptr %self37, null
  br i1 %dispatch.isnull40, label %dispatch.abort39, label %dispatch.ok38

dispatch.abort28:                                 ; preds = %dispatch.ok19
  call void @abort()
  unreachable

dispatch.ok38:                                    ; preds = %dispatch.ok27
  %vtable.ptr41 = load ptr, ptr %self37, align 8
  %method.ptr.addr42 = getelementptr ptr, ptr %vtable.ptr41, i64 5
  %method.ptr43 = load ptr, ptr %method.ptr.addr42, align 8
  %dispatch.result44 = call ptr %method.ptr43(ptr %self37, ptr @.str.13393739814652480779)
  %self45 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull48 = icmp eq ptr %self45, null
  br i1 %dispatch.isnull48, label %dispatch.abort47, label %dispatch.ok46

dispatch.abort39:                                 ; preds = %dispatch.ok27
  call void @abort()
  unreachable

dispatch.ok46:                                    ; preds = %dispatch.ok38
  %vtable.ptr49 = load ptr, ptr %self45, align 8
  %method.ptr.addr50 = getelementptr ptr, ptr %vtable.ptr49, i64 5
  %method.ptr51 = load ptr, ptr %method.ptr.addr50, align 8
  %dispatch.result52 = call ptr %method.ptr51(ptr %self45, ptr @.str.9181702322095793384)
  %self53 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull56 = icmp eq ptr %self53, null
  br i1 %dispatch.isnull56, label %dispatch.abort55, label %dispatch.ok54

dispatch.abort47:                                 ; preds = %dispatch.ok38
  call void @abort()
  unreachable

dispatch.ok54:                                    ; preds = %dispatch.ok46
  %vtable.ptr57 = load ptr, ptr %self53, align 8
  %method.ptr.addr58 = getelementptr ptr, ptr %vtable.ptr57, i64 14
  %method.ptr59 = load ptr, ptr %method.ptr.addr58, align 8
  %self60 = load ptr, ptr %this.addr, align 8
  %avar.addr61 = getelementptr i8, ptr %self60, i32 16
  %avar62 = load ptr, ptr %avar.addr61, align 8
  %dispatch.result63 = call ptr %method.ptr59(ptr %self53, ptr %avar62)
  %self64 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull67 = icmp eq ptr %self64, null
  br i1 %dispatch.isnull67, label %dispatch.abort66, label %dispatch.ok65

dispatch.abort55:                                 ; preds = %dispatch.ok46
  call void @abort()
  unreachable

dispatch.ok65:                                    ; preds = %dispatch.ok54
  %vtable.ptr68 = load ptr, ptr %self64, align 8
  %method.ptr.addr69 = getelementptr ptr, ptr %vtable.ptr68, i64 5
  %method.ptr70 = load ptr, ptr %method.ptr.addr69, align 8
  %dispatch.result71 = call ptr %method.ptr70(ptr %self64, ptr @.str.546962996930682290)
  %self72 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull75 = icmp eq ptr %self72, null
  br i1 %dispatch.isnull75, label %dispatch.abort74, label %dispatch.ok73

dispatch.abort66:                                 ; preds = %dispatch.ok54
  call void @abort()
  unreachable

dispatch.ok73:                                    ; preds = %dispatch.ok65
  %vtable.ptr76 = load ptr, ptr %self72, align 8
  %method.ptr.addr77 = getelementptr ptr, ptr %vtable.ptr76, i64 5
  %method.ptr78 = load ptr, ptr %method.ptr.addr77, align 8
  %dispatch.result79 = call ptr %method.ptr78(ptr %self72, ptr @.str.15354544076566430546)
  %self80 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull83 = icmp eq ptr %self80, null
  br i1 %dispatch.isnull83, label %dispatch.abort82, label %dispatch.ok81

dispatch.abort74:                                 ; preds = %dispatch.ok65
  call void @abort()
  unreachable

dispatch.ok81:                                    ; preds = %dispatch.ok73
  %vtable.ptr84 = load ptr, ptr %self80, align 8
  %method.ptr.addr85 = getelementptr ptr, ptr %vtable.ptr84, i64 14
  %method.ptr86 = load ptr, ptr %method.ptr.addr85, align 8
  %self87 = load ptr, ptr %this.addr, align 8
  %avar.addr88 = getelementptr i8, ptr %self87, i32 16
  %avar89 = load ptr, ptr %avar.addr88, align 8
  %dispatch.result90 = call ptr %method.ptr86(ptr %self80, ptr %avar89)
  %self91 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull94 = icmp eq ptr %self91, null
  br i1 %dispatch.isnull94, label %dispatch.abort93, label %dispatch.ok92

dispatch.abort82:                                 ; preds = %dispatch.ok73
  call void @abort()
  unreachable

dispatch.ok92:                                    ; preds = %dispatch.ok81
  %vtable.ptr95 = load ptr, ptr %self91, align 8
  %method.ptr.addr96 = getelementptr ptr, ptr %vtable.ptr95, i64 5
  %method.ptr97 = load ptr, ptr %method.ptr.addr96, align 8
  %dispatch.result98 = call ptr %method.ptr97(ptr %self91, ptr @.str.14275263385995759521)
  %self99 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull102 = icmp eq ptr %self99, null
  br i1 %dispatch.isnull102, label %dispatch.abort101, label %dispatch.ok100

dispatch.abort93:                                 ; preds = %dispatch.ok81
  call void @abort()
  unreachable

dispatch.ok100:                                   ; preds = %dispatch.ok92
  %vtable.ptr103 = load ptr, ptr %self99, align 8
  %method.ptr.addr104 = getelementptr ptr, ptr %vtable.ptr103, i64 5
  %method.ptr105 = load ptr, ptr %method.ptr.addr104, align 8
  %dispatch.result106 = call ptr %method.ptr105(ptr %self99, ptr @.str.4847457655152530261)
  %self107 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull110 = icmp eq ptr %self107, null
  br i1 %dispatch.isnull110, label %dispatch.abort109, label %dispatch.ok108

dispatch.abort101:                                ; preds = %dispatch.ok92
  call void @abort()
  unreachable

dispatch.ok108:                                   ; preds = %dispatch.ok100
  %vtable.ptr111 = load ptr, ptr %self107, align 8
  %method.ptr.addr112 = getelementptr ptr, ptr %vtable.ptr111, i64 14
  %method.ptr113 = load ptr, ptr %method.ptr.addr112, align 8
  %self114 = load ptr, ptr %this.addr, align 8
  %avar.addr115 = getelementptr i8, ptr %self114, i32 16
  %avar116 = load ptr, ptr %avar.addr115, align 8
  %dispatch.result117 = call ptr %method.ptr113(ptr %self107, ptr %avar116)
  %self118 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull121 = icmp eq ptr %self118, null
  br i1 %dispatch.isnull121, label %dispatch.abort120, label %dispatch.ok119

dispatch.abort109:                                ; preds = %dispatch.ok100
  call void @abort()
  unreachable

dispatch.ok119:                                   ; preds = %dispatch.ok108
  %vtable.ptr122 = load ptr, ptr %self118, align 8
  %method.ptr.addr123 = getelementptr ptr, ptr %vtable.ptr122, i64 5
  %method.ptr124 = load ptr, ptr %method.ptr.addr123, align 8
  %dispatch.result125 = call ptr %method.ptr124(ptr %self118, ptr @.str.6411555385307590735)
  %self126 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull129 = icmp eq ptr %self126, null
  br i1 %dispatch.isnull129, label %dispatch.abort128, label %dispatch.ok127

dispatch.abort120:                                ; preds = %dispatch.ok108
  call void @abort()
  unreachable

dispatch.ok127:                                   ; preds = %dispatch.ok119
  %vtable.ptr130 = load ptr, ptr %self126, align 8
  %method.ptr.addr131 = getelementptr ptr, ptr %vtable.ptr130, i64 5
  %method.ptr132 = load ptr, ptr %method.ptr.addr131, align 8
  %dispatch.result133 = call ptr %method.ptr132(ptr %self126, ptr @.str.8100598489855396609)
  %self134 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull137 = icmp eq ptr %self134, null
  br i1 %dispatch.isnull137, label %dispatch.abort136, label %dispatch.ok135

dispatch.abort128:                                ; preds = %dispatch.ok119
  call void @abort()
  unreachable

dispatch.ok135:                                   ; preds = %dispatch.ok127
  %vtable.ptr138 = load ptr, ptr %self134, align 8
  %method.ptr.addr139 = getelementptr ptr, ptr %vtable.ptr138, i64 14
  %method.ptr140 = load ptr, ptr %method.ptr.addr139, align 8
  %self141 = load ptr, ptr %this.addr, align 8
  %avar.addr142 = getelementptr i8, ptr %self141, i32 16
  %avar143 = load ptr, ptr %avar.addr142, align 8
  %dispatch.result144 = call ptr %method.ptr140(ptr %self134, ptr %avar143)
  %self145 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull148 = icmp eq ptr %self145, null
  br i1 %dispatch.isnull148, label %dispatch.abort147, label %dispatch.ok146

dispatch.abort136:                                ; preds = %dispatch.ok127
  call void @abort()
  unreachable

dispatch.ok146:                                   ; preds = %dispatch.ok135
  %vtable.ptr149 = load ptr, ptr %self145, align 8
  %method.ptr.addr150 = getelementptr ptr, ptr %vtable.ptr149, i64 5
  %method.ptr151 = load ptr, ptr %method.ptr.addr150, align 8
  %dispatch.result152 = call ptr %method.ptr151(ptr %self145, ptr @.str.1928667565603908976)
  %self153 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull156 = icmp eq ptr %self153, null
  br i1 %dispatch.isnull156, label %dispatch.abort155, label %dispatch.ok154

dispatch.abort147:                                ; preds = %dispatch.ok135
  call void @abort()
  unreachable

dispatch.ok154:                                   ; preds = %dispatch.ok146
  %vtable.ptr157 = load ptr, ptr %self153, align 8
  %method.ptr.addr158 = getelementptr ptr, ptr %vtable.ptr157, i64 5
  %method.ptr159 = load ptr, ptr %method.ptr.addr158, align 8
  %dispatch.result160 = call ptr %method.ptr159(ptr %self153, ptr @.str.7971971607389456643)
  %self161 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull164 = icmp eq ptr %self161, null
  br i1 %dispatch.isnull164, label %dispatch.abort163, label %dispatch.ok162

dispatch.abort155:                                ; preds = %dispatch.ok146
  call void @abort()
  unreachable

dispatch.ok162:                                   ; preds = %dispatch.ok154
  %vtable.ptr165 = load ptr, ptr %self161, align 8
  %method.ptr.addr166 = getelementptr ptr, ptr %vtable.ptr165, i64 14
  %method.ptr167 = load ptr, ptr %method.ptr.addr166, align 8
  %self168 = load ptr, ptr %this.addr, align 8
  %avar.addr169 = getelementptr i8, ptr %self168, i32 16
  %avar170 = load ptr, ptr %avar.addr169, align 8
  %dispatch.result171 = call ptr %method.ptr167(ptr %self161, ptr %avar170)
  %self172 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull175 = icmp eq ptr %self172, null
  br i1 %dispatch.isnull175, label %dispatch.abort174, label %dispatch.ok173

dispatch.abort163:                                ; preds = %dispatch.ok154
  call void @abort()
  unreachable

dispatch.ok173:                                   ; preds = %dispatch.ok162
  %vtable.ptr176 = load ptr, ptr %self172, align 8
  %method.ptr.addr177 = getelementptr ptr, ptr %vtable.ptr176, i64 5
  %method.ptr178 = load ptr, ptr %method.ptr.addr177, align 8
  %dispatch.result179 = call ptr %method.ptr178(ptr %self172, ptr @.str.11463403669895732331)
  %self180 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull183 = icmp eq ptr %self180, null
  br i1 %dispatch.isnull183, label %dispatch.abort182, label %dispatch.ok181

dispatch.abort174:                                ; preds = %dispatch.ok162
  call void @abort()
  unreachable

dispatch.ok181:                                   ; preds = %dispatch.ok173
  %vtable.ptr184 = load ptr, ptr %self180, align 8
  %method.ptr.addr185 = getelementptr ptr, ptr %vtable.ptr184, i64 5
  %method.ptr186 = load ptr, ptr %method.ptr.addr185, align 8
  %dispatch.result187 = call ptr %method.ptr186(ptr %self180, ptr @.str.26500464635641514)
  %self188 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull191 = icmp eq ptr %self188, null
  br i1 %dispatch.isnull191, label %dispatch.abort190, label %dispatch.ok189

dispatch.abort182:                                ; preds = %dispatch.ok173
  call void @abort()
  unreachable

dispatch.ok189:                                   ; preds = %dispatch.ok181
  %vtable.ptr192 = load ptr, ptr %self188, align 8
  %method.ptr.addr193 = getelementptr ptr, ptr %vtable.ptr192, i64 14
  %method.ptr194 = load ptr, ptr %method.ptr.addr193, align 8
  %self195 = load ptr, ptr %this.addr, align 8
  %avar.addr196 = getelementptr i8, ptr %self195, i32 16
  %avar197 = load ptr, ptr %avar.addr196, align 8
  %dispatch.result198 = call ptr %method.ptr194(ptr %self188, ptr %avar197)
  %self199 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull202 = icmp eq ptr %self199, null
  br i1 %dispatch.isnull202, label %dispatch.abort201, label %dispatch.ok200

dispatch.abort190:                                ; preds = %dispatch.ok181
  call void @abort()
  unreachable

dispatch.ok200:                                   ; preds = %dispatch.ok189
  %vtable.ptr203 = load ptr, ptr %self199, align 8
  %method.ptr.addr204 = getelementptr ptr, ptr %vtable.ptr203, i64 5
  %method.ptr205 = load ptr, ptr %method.ptr.addr204, align 8
  %dispatch.result206 = call ptr %method.ptr205(ptr %self199, ptr @.str.2912084189190072994)
  %self207 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull210 = icmp eq ptr %self207, null
  br i1 %dispatch.isnull210, label %dispatch.abort209, label %dispatch.ok208

dispatch.abort201:                                ; preds = %dispatch.ok189
  call void @abort()
  unreachable

dispatch.ok208:                                   ; preds = %dispatch.ok200
  %vtable.ptr211 = load ptr, ptr %self207, align 8
  %method.ptr.addr212 = getelementptr ptr, ptr %vtable.ptr211, i64 5
  %method.ptr213 = load ptr, ptr %method.ptr.addr212, align 8
  %dispatch.result214 = call ptr %method.ptr213(ptr %self207, ptr @.str.6572467137234190814)
  %self215 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull218 = icmp eq ptr %self215, null
  br i1 %dispatch.isnull218, label %dispatch.abort217, label %dispatch.ok216

dispatch.abort209:                                ; preds = %dispatch.ok200
  call void @abort()
  unreachable

dispatch.ok216:                                   ; preds = %dispatch.ok208
  %vtable.ptr219 = load ptr, ptr %self215, align 8
  %method.ptr.addr220 = getelementptr ptr, ptr %vtable.ptr219, i64 5
  %method.ptr221 = load ptr, ptr %method.ptr.addr220, align 8
  %dispatch.result222 = call ptr %method.ptr221(ptr %self215, ptr @.str.16722611938421386343)
  %self223 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull226 = icmp eq ptr %self223, null
  br i1 %dispatch.isnull226, label %dispatch.abort225, label %dispatch.ok224

dispatch.abort217:                                ; preds = %dispatch.ok208
  call void @abort()
  unreachable

dispatch.ok224:                                   ; preds = %dispatch.ok216
  %vtable.ptr227 = load ptr, ptr %self223, align 8
  %method.ptr.addr228 = getelementptr ptr, ptr %vtable.ptr227, i64 7
  %method.ptr229 = load ptr, ptr %method.ptr.addr228, align 8
  %dispatch.result230 = call ptr %method.ptr229(ptr %self223)
  ret ptr %dispatch.result230

dispatch.abort225:                                ; preds = %dispatch.ok216
  call void @abort()
  unreachable
}

define ptr @Main.prompt(ptr %this) {
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
  %dispatch.result8 = call ptr %method.ptr7(ptr %self1, ptr @.str.6802180075859276267)
  %self9 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull12 = icmp eq ptr %self9, null
  br i1 %dispatch.isnull12, label %dispatch.abort11, label %dispatch.ok10

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok10:                                    ; preds = %dispatch.ok2
  %vtable.ptr13 = load ptr, ptr %self9, align 8
  %method.ptr.addr14 = getelementptr ptr, ptr %vtable.ptr13, i64 7
  %method.ptr15 = load ptr, ptr %method.ptr.addr14, align 8
  %dispatch.result16 = call ptr %method.ptr15(ptr %self9)
  ret ptr %dispatch.result16

dispatch.abort11:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable
}

define i32 @Main.get_int(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %z = alloca ptr, align 8
  %A2I.newtmp = call ptr @A2I.new()
  store ptr %A2I.newtmp, ptr %z, align 8
  %s = alloca ptr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 10
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self)
  store ptr %dispatch.result, ptr %s, align 8
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
  %s8 = load ptr, ptr %s, align 8
  %dispatch.result9 = call i32 %method.ptr7(ptr %z1, ptr %s8)
  ret i32 %dispatch.result9

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable
}

define i1 @Main.is_even(ptr %this, i32 %num) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %num.addr = alloca i32, align 4
  store i32 %num, ptr %num.addr, align 4
  %x = alloca i32, align 4
  %num1 = load i32, ptr %num.addr, align 4
  store i32 %num1, ptr %x, align 4
  %x2 = load i32, ptr %x, align 4
  %cmptmp = icmp slt i32 %x2, 0
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %then
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 12
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x3 = load i32, ptr %x, align 4
  %negtmp = sub i32 0, %x3
  %dispatch.result = call i1 %method.ptr(ptr %self, i32 %negtmp)
  br label %ifcont22

dispatch.abort:                                   ; preds = %then
  call void @abort()
  unreachable

else:                                             ; preds = %entry
  %x4 = load i32, ptr %x, align 4
  %eqtmp = icmp eq i32 0, %x4
  br i1 %eqtmp, label %then5, label %else6

then5:                                            ; preds = %else
  br label %ifcont20

else6:                                            ; preds = %else
  %x7 = load i32, ptr %x, align 4
  %eqtmp8 = icmp eq i32 1, %x7
  br i1 %eqtmp8, label %then9, label %else10

then9:                                            ; preds = %else6
  br label %ifcont

else10:                                           ; preds = %else6
  %self11 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull14 = icmp eq ptr %self11, null
  br i1 %dispatch.isnull14, label %dispatch.abort13, label %dispatch.ok12

dispatch.ok12:                                    ; preds = %else10
  %vtable.ptr15 = load ptr, ptr %self11, align 8
  %method.ptr.addr16 = getelementptr ptr, ptr %vtable.ptr15, i64 12
  %method.ptr17 = load ptr, ptr %method.ptr.addr16, align 8
  %x18 = load i32, ptr %x, align 4
  %subtmp = sub i32 %x18, 2
  %dispatch.result19 = call i1 %method.ptr17(ptr %self11, i32 %subtmp)
  br label %ifcont

dispatch.abort13:                                 ; preds = %else10
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok12, %then9
  %cond_result = phi i1 [ false, %then9 ], [ %dispatch.result19, %dispatch.ok12 ]
  br label %ifcont20

ifcont20:                                         ; preds = %ifcont, %then5
  %cond_result21 = phi i1 [ true, %then5 ], [ %cond_result, %ifcont ]
  br label %ifcont22

ifcont22:                                         ; preds = %ifcont20, %dispatch.ok
  %cond_result23 = phi i1 [ %dispatch.result, %dispatch.ok ], [ %cond_result21, %ifcont20 ]
  ret i1 %cond_result23
}

define ptr @Main.class_type(ptr %this, ptr %var) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %var.addr = alloca ptr, align 8
  store ptr %var, ptr %var.addr, align 8
  %var1 = load ptr, ptr %var.addr, align 8
  %case.isnull = icmp eq ptr %var1, null
  br i1 %case.isnull, label %case.abort, label %case.ok

case.ok:                                          ; preds = %entry
  %case.vptr = load ptr, ptr %var1, align 8
  %E.match = icmp eq ptr %case.vptr, @_ZTV1E
  br i1 %E.match, label %case.match, label %case.next

case.abort:                                       ; preds = %entry
  call void @abort()
  unreachable

case.match:                                       ; preds = %case.ok
  %e.addr = alloca ptr, align 8
  store ptr %var1, ptr %e.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %case.match
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.5166663087941811047)
  br label %case.end

dispatch.abort:                                   ; preds = %case.match
  call void @abort()
  unreachable

case.next:                                        ; preds = %case.ok
  %C.match = icmp eq ptr %case.vptr, @_ZTV1C
  br i1 %C.match, label %case.match2, label %case.next11

case.match2:                                      ; preds = %case.next
  %c.addr = alloca ptr, align 8
  store ptr %var1, ptr %c.addr, align 8
  %self3 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull6 = icmp eq ptr %self3, null
  br i1 %dispatch.isnull6, label %dispatch.abort5, label %dispatch.ok4

dispatch.ok4:                                     ; preds = %case.match2
  %vtable.ptr7 = load ptr, ptr %self3, align 8
  %method.ptr.addr8 = getelementptr ptr, ptr %vtable.ptr7, i64 5
  %method.ptr9 = load ptr, ptr %method.ptr.addr8, align 8
  %dispatch.result10 = call ptr %method.ptr9(ptr %self3, ptr @.str.7438465994829122286)
  br label %case.end

dispatch.abort5:                                  ; preds = %case.match2
  call void @abort()
  unreachable

case.next11:                                      ; preds = %case.next
  %D.match = icmp eq ptr %case.vptr, @_ZTV1D
  %E.match13 = icmp eq ptr %case.vptr, @_ZTV1E
  %case.or = or i1 %D.match, %E.match13
  br i1 %case.or, label %case.match12, label %case.next22

case.match12:                                     ; preds = %case.next11
  %d.addr = alloca ptr, align 8
  store ptr %var1, ptr %d.addr, align 8
  %self14 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull17 = icmp eq ptr %self14, null
  br i1 %dispatch.isnull17, label %dispatch.abort16, label %dispatch.ok15

dispatch.ok15:                                    ; preds = %case.match12
  %vtable.ptr18 = load ptr, ptr %self14, align 8
  %method.ptr.addr19 = getelementptr ptr, ptr %vtable.ptr18, i64 5
  %method.ptr20 = load ptr, ptr %method.ptr.addr19, align 8
  %dispatch.result21 = call ptr %method.ptr20(ptr %self14, ptr @.str.1788474358655561854)
  br label %case.end

dispatch.abort16:                                 ; preds = %case.match12
  call void @abort()
  unreachable

case.next22:                                      ; preds = %case.next11
  %B.match = icmp eq ptr %case.vptr, @_ZTV1B
  %C.match24 = icmp eq ptr %case.vptr, @_ZTV1C
  %case.or25 = or i1 %B.match, %C.match24
  %D.match26 = icmp eq ptr %case.vptr, @_ZTV1D
  %case.or27 = or i1 %case.or25, %D.match26
  %E.match28 = icmp eq ptr %case.vptr, @_ZTV1E
  %case.or29 = or i1 %case.or27, %E.match28
  br i1 %case.or29, label %case.match23, label %case.next38

case.match23:                                     ; preds = %case.next22
  %b.addr = alloca ptr, align 8
  store ptr %var1, ptr %b.addr, align 8
  %self30 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull33 = icmp eq ptr %self30, null
  br i1 %dispatch.isnull33, label %dispatch.abort32, label %dispatch.ok31

dispatch.ok31:                                    ; preds = %case.match23
  %vtable.ptr34 = load ptr, ptr %self30, align 8
  %method.ptr.addr35 = getelementptr ptr, ptr %vtable.ptr34, i64 5
  %method.ptr36 = load ptr, ptr %method.ptr.addr35, align 8
  %dispatch.result37 = call ptr %method.ptr36(ptr %self30, ptr @.str.730409298105642144)
  br label %case.end

dispatch.abort32:                                 ; preds = %case.match23
  call void @abort()
  unreachable

case.next38:                                      ; preds = %case.next22
  %A.match = icmp eq ptr %case.vptr, @_ZTV1A
  %B.match40 = icmp eq ptr %case.vptr, @_ZTV1B
  %case.or41 = or i1 %A.match, %B.match40
  %C.match42 = icmp eq ptr %case.vptr, @_ZTV1C
  %case.or43 = or i1 %case.or41, %C.match42
  %D.match44 = icmp eq ptr %case.vptr, @_ZTV1D
  %case.or45 = or i1 %case.or43, %D.match44
  %E.match46 = icmp eq ptr %case.vptr, @_ZTV1E
  %case.or47 = or i1 %case.or45, %E.match46
  br i1 %case.or47, label %case.match39, label %case.next56

case.match39:                                     ; preds = %case.next38
  %a.addr = alloca ptr, align 8
  store ptr %var1, ptr %a.addr, align 8
  %self48 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull51 = icmp eq ptr %self48, null
  br i1 %dispatch.isnull51, label %dispatch.abort50, label %dispatch.ok49

dispatch.ok49:                                    ; preds = %case.match39
  %vtable.ptr52 = load ptr, ptr %self48, align 8
  %method.ptr.addr53 = getelementptr ptr, ptr %vtable.ptr52, i64 5
  %method.ptr54 = load ptr, ptr %method.ptr.addr53, align 8
  %dispatch.result55 = call ptr %method.ptr54(ptr %self48, ptr @.str.7841572136186253764)
  br label %case.end

dispatch.abort50:                                 ; preds = %case.match39
  call void @abort()
  unreachable

case.next56:                                      ; preds = %case.next38
  %A.match58 = icmp eq ptr %case.vptr, @_ZTV1A
  %A2I.match = icmp eq ptr %case.vptr, @_ZTV3A2I
  %case.or59 = or i1 %A.match58, %A2I.match
  %B.match60 = icmp eq ptr %case.vptr, @_ZTV1B
  %case.or61 = or i1 %case.or59, %B.match60
  %Bool.match = icmp eq ptr %case.vptr, @_ZTV4Bool
  %case.or62 = or i1 %case.or61, %Bool.match
  %C.match63 = icmp eq ptr %case.vptr, @_ZTV1C
  %case.or64 = or i1 %case.or62, %C.match63
  %D.match65 = icmp eq ptr %case.vptr, @_ZTV1D
  %case.or66 = or i1 %case.or64, %D.match65
  %E.match67 = icmp eq ptr %case.vptr, @_ZTV1E
  %case.or68 = or i1 %case.or66, %E.match67
  %IO.match = icmp eq ptr %case.vptr, @_ZTV2IO
  %case.or69 = or i1 %case.or68, %IO.match
  %Int.match = icmp eq ptr %case.vptr, @_ZTV3Int
  %case.or70 = or i1 %case.or69, %Int.match
  %Main.match = icmp eq ptr %case.vptr, @_ZTV4Main
  %case.or71 = or i1 %case.or70, %Main.match
  %Object.match = icmp eq ptr %case.vptr, @_ZTV6Object
  %case.or72 = or i1 %case.or71, %Object.match
  %String.match = icmp eq ptr %case.vptr, @_ZTV6String
  %case.or73 = or i1 %case.or72, %String.match
  br i1 %case.or73, label %case.match57, label %case.abort74

case.match57:                                     ; preds = %case.next56
  %o.addr = alloca ptr, align 8
  store ptr %var1, ptr %o.addr, align 8
  %self75 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull78 = icmp eq ptr %self75, null
  br i1 %dispatch.isnull78, label %dispatch.abort77, label %dispatch.ok76

case.abort74:                                     ; preds = %case.next56
  call void @abort()
  unreachable

dispatch.ok76:                                    ; preds = %case.match57
  %vtable.ptr79 = load ptr, ptr %self75, align 8
  %method.ptr.addr80 = getelementptr ptr, ptr %vtable.ptr79, i64 5
  %method.ptr81 = load ptr, ptr %method.ptr.addr80, align 8
  %dispatch.result82 = call ptr %method.ptr81(ptr %self75, ptr @.str.15976673952330978103)
  br label %case.end

dispatch.abort77:                                 ; preds = %case.match57
  call void @abort()
  unreachable

case.end:                                         ; preds = %dispatch.ok76, %dispatch.ok49, %dispatch.ok31, %dispatch.ok15, %dispatch.ok4, %dispatch.ok
  %case.result = phi ptr [ %dispatch.result, %dispatch.ok ], [ %dispatch.result10, %dispatch.ok4 ], [ %dispatch.result21, %dispatch.ok15 ], [ %dispatch.result37, %dispatch.ok31 ], [ %dispatch.result55, %dispatch.ok49 ], [ %dispatch.result82, %dispatch.ok76 ]
  ret ptr %case.result
}

define ptr @Main.print(ptr %this, ptr %var) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %var.addr = alloca ptr, align 8
  store ptr %var, ptr %var.addr, align 8
  %z = alloca ptr, align 8
  %A2I.newtmp = call ptr @A2I.new()
  store ptr %A2I.newtmp, ptr %z, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %z1 = load ptr, ptr %z, align 8
  %dispatch.isnull4 = icmp eq ptr %z1, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %z1, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 9
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %var8 = load ptr, ptr %var.addr, align 8
  %dispatch.isnull11 = icmp eq ptr %var8, null
  br i1 %dispatch.isnull11, label %dispatch.abort10, label %dispatch.ok9

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok9:                                     ; preds = %dispatch.ok2
  %vtable.ptr12 = load ptr, ptr %var8, align 8
  %method.ptr.addr13 = getelementptr ptr, ptr %vtable.ptr12, i64 5
  %method.ptr14 = load ptr, ptr %method.ptr.addr13, align 8
  %dispatch.result = call i32 %method.ptr14(ptr %var8)
  %dispatch.result15 = call ptr %method.ptr7(ptr %z1, i32 %dispatch.result)
  %dispatch.result16 = call ptr %method.ptr(ptr %self, ptr %dispatch.result15)
  %self17 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull20 = icmp eq ptr %self17, null
  br i1 %dispatch.isnull20, label %dispatch.abort19, label %dispatch.ok18

dispatch.abort10:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable

dispatch.ok18:                                    ; preds = %dispatch.ok9
  %vtable.ptr21 = load ptr, ptr %self17, align 8
  %method.ptr.addr22 = getelementptr ptr, ptr %vtable.ptr21, i64 5
  %method.ptr23 = load ptr, ptr %method.ptr.addr22, align 8
  %dispatch.result24 = call ptr %method.ptr23(ptr %self17, ptr @.str.17934988915447438835)
  ret ptr %dispatch.result24

dispatch.abort19:                                 ; preds = %dispatch.ok9
  call void @abort()
  unreachable
}

define ptr @Main.main(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %A.newtmp = call ptr @A.new()
  %self = load ptr, ptr %this.addr, align 8
  %avar.addr = getelementptr i8, ptr %self, i32 16
  store ptr %A.newtmp, ptr %avar.addr, align 8
  br label %loop.cond

loop.cond:                                        ; preds = %ifcont564, %entry
  %self1 = load ptr, ptr %this.addr, align 8
  %flag.addr = getelementptr i8, ptr %self1, i32 32
  %flag = load i1, ptr %flag.addr, align 1
  br i1 %flag, label %loop.body, label %loop.after

loop.body:                                        ; preds = %loop.cond
  %self2 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self2, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

loop.after:                                       ; preds = %loop.cond
  ret ptr null

dispatch.ok:                                      ; preds = %loop.body
  %vtable.ptr = load ptr, ptr %self2, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self2, ptr @.str.1187902871956776895)
  %self3 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull6 = icmp eq ptr %self3, null
  br i1 %dispatch.isnull6, label %dispatch.abort5, label %dispatch.ok4

dispatch.abort:                                   ; preds = %loop.body
  call void @abort()
  unreachable

dispatch.ok4:                                     ; preds = %dispatch.ok
  %vtable.ptr7 = load ptr, ptr %self3, align 8
  %method.ptr.addr8 = getelementptr ptr, ptr %vtable.ptr7, i64 14
  %method.ptr9 = load ptr, ptr %method.ptr.addr8, align 8
  %self10 = load ptr, ptr %this.addr, align 8
  %avar.addr11 = getelementptr i8, ptr %self10, i32 16
  %avar = load ptr, ptr %avar.addr11, align 8
  %dispatch.result12 = call ptr %method.ptr9(ptr %self3, ptr %avar)
  %self13 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull16 = icmp eq ptr %self13, null
  br i1 %dispatch.isnull16, label %dispatch.abort15, label %dispatch.ok14

dispatch.abort5:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok14:                                    ; preds = %dispatch.ok4
  %vtable.ptr17 = load ptr, ptr %self13, align 8
  %method.ptr.addr18 = getelementptr ptr, ptr %vtable.ptr17, i64 12
  %method.ptr19 = load ptr, ptr %method.ptr.addr18, align 8
  %self20 = load ptr, ptr %this.addr, align 8
  %avar.addr21 = getelementptr i8, ptr %self20, i32 16
  %avar22 = load ptr, ptr %avar.addr21, align 8
  %dispatch.isnull25 = icmp eq ptr %avar22, null
  br i1 %dispatch.isnull25, label %dispatch.abort24, label %dispatch.ok23

dispatch.abort15:                                 ; preds = %dispatch.ok4
  call void @abort()
  unreachable

dispatch.ok23:                                    ; preds = %dispatch.ok14
  %vtable.ptr26 = load ptr, ptr %avar22, align 8
  %method.ptr.addr27 = getelementptr ptr, ptr %vtable.ptr26, i64 5
  %method.ptr28 = load ptr, ptr %method.ptr.addr27, align 8
  %dispatch.result29 = call i32 %method.ptr28(ptr %avar22)
  %dispatch.result30 = call i1 %method.ptr19(ptr %self13, i32 %dispatch.result29)
  br i1 %dispatch.result30, label %then, label %else

dispatch.abort24:                                 ; preds = %dispatch.ok14
  call void @abort()
  unreachable

then:                                             ; preds = %dispatch.ok23
  %self31 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull34 = icmp eq ptr %self31, null
  br i1 %dispatch.isnull34, label %dispatch.abort33, label %dispatch.ok32

dispatch.ok32:                                    ; preds = %then
  %vtable.ptr35 = load ptr, ptr %self31, align 8
  %method.ptr.addr36 = getelementptr ptr, ptr %vtable.ptr35, i64 5
  %method.ptr37 = load ptr, ptr %method.ptr.addr36, align 8
  %dispatch.result38 = call ptr %method.ptr37(ptr %self31, ptr @.str.16181136536928197364)
  br label %ifcont

dispatch.abort33:                                 ; preds = %then
  call void @abort()
  unreachable

else:                                             ; preds = %dispatch.ok23
  %self39 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull42 = icmp eq ptr %self39, null
  br i1 %dispatch.isnull42, label %dispatch.abort41, label %dispatch.ok40

dispatch.ok40:                                    ; preds = %else
  %vtable.ptr43 = load ptr, ptr %self39, align 8
  %method.ptr.addr44 = getelementptr ptr, ptr %vtable.ptr43, i64 5
  %method.ptr45 = load ptr, ptr %method.ptr.addr44, align 8
  %dispatch.result46 = call ptr %method.ptr45(ptr %self39, ptr @.str.13068143366059226993)
  br label %ifcont

dispatch.abort41:                                 ; preds = %else
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok40, %dispatch.ok32
  %cond_result = phi ptr [ %dispatch.result38, %dispatch.ok32 ], [ %dispatch.result46, %dispatch.ok40 ]
  %self47 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull50 = icmp eq ptr %self47, null
  br i1 %dispatch.isnull50, label %dispatch.abort49, label %dispatch.ok48

dispatch.ok48:                                    ; preds = %ifcont
  %vtable.ptr51 = load ptr, ptr %self47, align 8
  %method.ptr.addr52 = getelementptr ptr, ptr %vtable.ptr51, i64 13
  %method.ptr53 = load ptr, ptr %method.ptr.addr52, align 8
  %self54 = load ptr, ptr %this.addr, align 8
  %avar.addr55 = getelementptr i8, ptr %self54, i32 16
  %avar56 = load ptr, ptr %avar.addr55, align 8
  %dispatch.result57 = call ptr %method.ptr53(ptr %self47, ptr %avar56)
  %self58 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull61 = icmp eq ptr %self58, null
  br i1 %dispatch.isnull61, label %dispatch.abort60, label %dispatch.ok59

dispatch.abort49:                                 ; preds = %ifcont
  call void @abort()
  unreachable

dispatch.ok59:                                    ; preds = %dispatch.ok48
  %vtable.ptr62 = load ptr, ptr %self58, align 8
  %method.ptr.addr63 = getelementptr ptr, ptr %vtable.ptr62, i64 9
  %method.ptr64 = load ptr, ptr %method.ptr.addr63, align 8
  %dispatch.result65 = call ptr %method.ptr64(ptr %self58)
  %self66 = load ptr, ptr %this.addr, align 8
  %char.addr = getelementptr i8, ptr %self66, i32 8
  store ptr %dispatch.result65, ptr %char.addr, align 8
  %self67 = load ptr, ptr %this.addr, align 8
  %char.addr68 = getelementptr i8, ptr %self67, i32 8
  %char = load ptr, ptr %char.addr68, align 8
  %eqtmp = call i1 @String_equals(ptr %char, ptr @.str.4993892634952068459)
  br i1 %eqtmp, label %then69, label %else115

dispatch.abort60:                                 ; preds = %dispatch.ok48
  call void @abort()
  unreachable

then69:                                           ; preds = %dispatch.ok59
  %A.newtmp70 = call ptr @A.new()
  %dispatch.isnull73 = icmp eq ptr %A.newtmp70, null
  br i1 %dispatch.isnull73, label %dispatch.abort72, label %dispatch.ok71

dispatch.ok71:                                    ; preds = %then69
  %vtable.ptr74 = load ptr, ptr %A.newtmp70, align 8
  %method.ptr.addr75 = getelementptr ptr, ptr %vtable.ptr74, i64 6
  %method.ptr76 = load ptr, ptr %method.ptr.addr75, align 8
  %self77 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull80 = icmp eq ptr %self77, null
  br i1 %dispatch.isnull80, label %dispatch.abort79, label %dispatch.ok78

dispatch.abort72:                                 ; preds = %then69
  call void @abort()
  unreachable

dispatch.ok78:                                    ; preds = %dispatch.ok71
  %vtable.ptr81 = load ptr, ptr %self77, align 8
  %method.ptr.addr82 = getelementptr ptr, ptr %vtable.ptr81, i64 11
  %method.ptr83 = load ptr, ptr %method.ptr.addr82, align 8
  %dispatch.result84 = call i32 %method.ptr83(ptr %self77)
  %dispatch.result85 = call ptr %method.ptr76(ptr %A.newtmp70, i32 %dispatch.result84)
  %self86 = load ptr, ptr %this.addr, align 8
  %a_var.addr = getelementptr i8, ptr %self86, i32 24
  store ptr %dispatch.result85, ptr %a_var.addr, align 8
  %B.newtmp = call ptr @B.new()
  %dispatch.isnull89 = icmp eq ptr %B.newtmp, null
  br i1 %dispatch.isnull89, label %dispatch.abort88, label %dispatch.ok87

dispatch.abort79:                                 ; preds = %dispatch.ok71
  call void @abort()
  unreachable

dispatch.ok87:                                    ; preds = %dispatch.ok78
  %vtable.ptr90 = load ptr, ptr %B.newtmp, align 8
  %method.ptr.addr91 = getelementptr ptr, ptr %vtable.ptr90, i64 8
  %method.ptr92 = load ptr, ptr %method.ptr.addr91, align 8
  %self93 = load ptr, ptr %this.addr, align 8
  %avar.addr94 = getelementptr i8, ptr %self93, i32 16
  %avar95 = load ptr, ptr %avar.addr94, align 8
  %dispatch.isnull98 = icmp eq ptr %avar95, null
  br i1 %dispatch.isnull98, label %dispatch.abort97, label %dispatch.ok96

dispatch.abort88:                                 ; preds = %dispatch.ok78
  call void @abort()
  unreachable

dispatch.ok96:                                    ; preds = %dispatch.ok87
  %vtable.ptr99 = load ptr, ptr %avar95, align 8
  %method.ptr.addr100 = getelementptr ptr, ptr %vtable.ptr99, i64 5
  %method.ptr101 = load ptr, ptr %method.ptr.addr100, align 8
  %dispatch.result102 = call i32 %method.ptr101(ptr %avar95)
  %self103 = load ptr, ptr %this.addr, align 8
  %a_var.addr104 = getelementptr i8, ptr %self103, i32 24
  %a_var = load ptr, ptr %a_var.addr104, align 8
  %dispatch.isnull107 = icmp eq ptr %a_var, null
  br i1 %dispatch.isnull107, label %dispatch.abort106, label %dispatch.ok105

dispatch.abort97:                                 ; preds = %dispatch.ok87
  call void @abort()
  unreachable

dispatch.ok105:                                   ; preds = %dispatch.ok96
  %vtable.ptr108 = load ptr, ptr %a_var, align 8
  %method.ptr.addr109 = getelementptr ptr, ptr %vtable.ptr108, i64 5
  %method.ptr110 = load ptr, ptr %method.ptr.addr109, align 8
  %dispatch.result111 = call i32 %method.ptr110(ptr %a_var)
  %dispatch.result112 = call ptr %method.ptr92(ptr %B.newtmp, i32 %dispatch.result102, i32 %dispatch.result111)
  %self113 = load ptr, ptr %this.addr, align 8
  %avar.addr114 = getelementptr i8, ptr %self113, i32 16
  store ptr %dispatch.result112, ptr %avar.addr114, align 8
  br label %ifcont564

dispatch.abort106:                                ; preds = %dispatch.ok96
  call void @abort()
  unreachable

else115:                                          ; preds = %dispatch.ok59
  %self116 = load ptr, ptr %this.addr, align 8
  %char.addr117 = getelementptr i8, ptr %self116, i32 8
  %char118 = load ptr, ptr %char.addr117, align 8
  %eqtmp119 = call i1 @String_equals(ptr %char118, ptr @.str.10838281452030117757)
  br i1 %eqtmp119, label %then120, label %else197

then120:                                          ; preds = %else115
  %self121 = load ptr, ptr %this.addr, align 8
  %avar.addr122 = getelementptr i8, ptr %self121, i32 16
  %avar123 = load ptr, ptr %avar.addr122, align 8
  %case.isnull = icmp eq ptr %avar123, null
  br i1 %case.isnull, label %case.abort, label %case.ok

case.ok:                                          ; preds = %then120
  %case.vptr = load ptr, ptr %avar123, align 8
  %C.match = icmp eq ptr %case.vptr, @_ZTV1C
  br i1 %C.match, label %case.match, label %case.next

case.abort:                                       ; preds = %then120
  call void @abort()
  unreachable

case.match:                                       ; preds = %case.ok
  %c.addr = alloca ptr, align 8
  store ptr %avar123, ptr %c.addr, align 8
  %c = load ptr, ptr %c.addr, align 8
  %dispatch.isnull126 = icmp eq ptr %c, null
  br i1 %dispatch.isnull126, label %dispatch.abort125, label %dispatch.ok124

dispatch.ok124:                                   ; preds = %case.match
  %vtable.ptr127 = load ptr, ptr %c, align 8
  %method.ptr.addr128 = getelementptr ptr, ptr %vtable.ptr127, i64 12
  %method.ptr129 = load ptr, ptr %method.ptr.addr128, align 8
  %c130 = load ptr, ptr %c.addr, align 8
  %dispatch.isnull133 = icmp eq ptr %c130, null
  br i1 %dispatch.isnull133, label %dispatch.abort132, label %dispatch.ok131

dispatch.abort125:                                ; preds = %case.match
  call void @abort()
  unreachable

dispatch.ok131:                                   ; preds = %dispatch.ok124
  %vtable.ptr134 = load ptr, ptr %c130, align 8
  %method.ptr.addr135 = getelementptr ptr, ptr %vtable.ptr134, i64 5
  %method.ptr136 = load ptr, ptr %method.ptr.addr135, align 8
  %dispatch.result137 = call i32 %method.ptr136(ptr %c130)
  %dispatch.result138 = call ptr %method.ptr129(ptr %c, i32 %dispatch.result137)
  %self139 = load ptr, ptr %this.addr, align 8
  %avar.addr140 = getelementptr i8, ptr %self139, i32 16
  store ptr %dispatch.result138, ptr %avar.addr140, align 8
  br label %case.end

dispatch.abort132:                                ; preds = %dispatch.ok124
  call void @abort()
  unreachable

case.next:                                        ; preds = %case.ok
  %A.match = icmp eq ptr %case.vptr, @_ZTV1A
  %B.match = icmp eq ptr %case.vptr, @_ZTV1B
  %case.or = or i1 %A.match, %B.match
  %C.match142 = icmp eq ptr %case.vptr, @_ZTV1C
  %case.or143 = or i1 %case.or, %C.match142
  %D.match = icmp eq ptr %case.vptr, @_ZTV1D
  %case.or144 = or i1 %case.or143, %D.match
  %E.match = icmp eq ptr %case.vptr, @_ZTV1E
  %case.or145 = or i1 %case.or144, %E.match
  br i1 %case.or145, label %case.match141, label %case.next163

case.match141:                                    ; preds = %case.next
  %a.addr = alloca ptr, align 8
  store ptr %avar123, ptr %a.addr, align 8
  %a = load ptr, ptr %a.addr, align 8
  %dispatch.isnull148 = icmp eq ptr %a, null
  br i1 %dispatch.isnull148, label %dispatch.abort147, label %dispatch.ok146

dispatch.ok146:                                   ; preds = %case.match141
  %vtable.ptr149 = load ptr, ptr %a, align 8
  %method.ptr.addr150 = getelementptr ptr, ptr %vtable.ptr149, i64 9
  %method.ptr151 = load ptr, ptr %method.ptr.addr150, align 8
  %a152 = load ptr, ptr %a.addr, align 8
  %dispatch.isnull155 = icmp eq ptr %a152, null
  br i1 %dispatch.isnull155, label %dispatch.abort154, label %dispatch.ok153

dispatch.abort147:                                ; preds = %case.match141
  call void @abort()
  unreachable

dispatch.ok153:                                   ; preds = %dispatch.ok146
  %vtable.ptr156 = load ptr, ptr %a152, align 8
  %method.ptr.addr157 = getelementptr ptr, ptr %vtable.ptr156, i64 5
  %method.ptr158 = load ptr, ptr %method.ptr.addr157, align 8
  %dispatch.result159 = call i32 %method.ptr158(ptr %a152)
  %dispatch.result160 = call ptr %method.ptr151(ptr %a, i32 %dispatch.result159)
  %self161 = load ptr, ptr %this.addr, align 8
  %avar.addr162 = getelementptr i8, ptr %self161, i32 16
  store ptr %dispatch.result160, ptr %avar.addr162, align 8
  br label %case.end

dispatch.abort154:                                ; preds = %dispatch.ok146
  call void @abort()
  unreachable

case.next163:                                     ; preds = %case.next
  %A.match165 = icmp eq ptr %case.vptr, @_ZTV1A
  %A2I.match = icmp eq ptr %case.vptr, @_ZTV3A2I
  %case.or166 = or i1 %A.match165, %A2I.match
  %B.match167 = icmp eq ptr %case.vptr, @_ZTV1B
  %case.or168 = or i1 %case.or166, %B.match167
  %Bool.match = icmp eq ptr %case.vptr, @_ZTV4Bool
  %case.or169 = or i1 %case.or168, %Bool.match
  %C.match170 = icmp eq ptr %case.vptr, @_ZTV1C
  %case.or171 = or i1 %case.or169, %C.match170
  %D.match172 = icmp eq ptr %case.vptr, @_ZTV1D
  %case.or173 = or i1 %case.or171, %D.match172
  %E.match174 = icmp eq ptr %case.vptr, @_ZTV1E
  %case.or175 = or i1 %case.or173, %E.match174
  %IO.match = icmp eq ptr %case.vptr, @_ZTV2IO
  %case.or176 = or i1 %case.or175, %IO.match
  %Int.match = icmp eq ptr %case.vptr, @_ZTV3Int
  %case.or177 = or i1 %case.or176, %Int.match
  %Main.match = icmp eq ptr %case.vptr, @_ZTV4Main
  %case.or178 = or i1 %case.or177, %Main.match
  %Object.match = icmp eq ptr %case.vptr, @_ZTV6Object
  %case.or179 = or i1 %case.or178, %Object.match
  %String.match = icmp eq ptr %case.vptr, @_ZTV6String
  %case.or180 = or i1 %case.or179, %String.match
  br i1 %case.or180, label %case.match164, label %case.abort181

case.match164:                                    ; preds = %case.next163
  %o.addr = alloca ptr, align 8
  store ptr %avar123, ptr %o.addr, align 8
  %self182 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull185 = icmp eq ptr %self182, null
  br i1 %dispatch.isnull185, label %dispatch.abort184, label %dispatch.ok183

case.abort181:                                    ; preds = %case.next163
  call void @abort()
  unreachable

dispatch.ok183:                                   ; preds = %case.match164
  %vtable.ptr186 = load ptr, ptr %self182, align 8
  %method.ptr.addr187 = getelementptr ptr, ptr %vtable.ptr186, i64 5
  %method.ptr188 = load ptr, ptr %method.ptr.addr187, align 8
  %dispatch.result189 = call ptr %method.ptr188(ptr %self182, ptr @.str.15976673952330978103)
  %self190 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull193 = icmp eq ptr %self190, null
  br i1 %dispatch.isnull193, label %dispatch.abort192, label %dispatch.ok191

dispatch.abort184:                                ; preds = %case.match164
  call void @abort()
  unreachable

dispatch.ok191:                                   ; preds = %dispatch.ok183
  %vtable.ptr194 = load ptr, ptr %self190, align 8
  %method.ptr.addr195 = getelementptr ptr, ptr %vtable.ptr194, i64 3
  %method.ptr196 = load ptr, ptr %method.ptr.addr195, align 8
  %0 = call ptr %method.ptr196(ptr %self190)
  unreachable

dispatch.abort192:                                ; preds = %dispatch.ok183
  call void @abort()
  unreachable

case.end:                                         ; preds = %dispatch.ok153, %dispatch.ok131
  %case.result = phi ptr [ %dispatch.result138, %dispatch.ok131 ], [ %dispatch.result160, %dispatch.ok153 ]
  br label %ifcont562

else197:                                          ; preds = %else115
  %self198 = load ptr, ptr %this.addr, align 8
  %char.addr199 = getelementptr i8, ptr %self198, i32 8
  %char200 = load ptr, ptr %char.addr199, align 8
  %eqtmp201 = call i1 @String_equals(ptr %char200, ptr @.str.10959529184379665549)
  br i1 %eqtmp201, label %then202, label %else250

then202:                                          ; preds = %else197
  %A.newtmp203 = call ptr @A.new()
  %dispatch.isnull206 = icmp eq ptr %A.newtmp203, null
  br i1 %dispatch.isnull206, label %dispatch.abort205, label %dispatch.ok204

dispatch.ok204:                                   ; preds = %then202
  %vtable.ptr207 = load ptr, ptr %A.newtmp203, align 8
  %method.ptr.addr208 = getelementptr ptr, ptr %vtable.ptr207, i64 6
  %method.ptr209 = load ptr, ptr %method.ptr.addr208, align 8
  %self210 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull213 = icmp eq ptr %self210, null
  br i1 %dispatch.isnull213, label %dispatch.abort212, label %dispatch.ok211

dispatch.abort205:                                ; preds = %then202
  call void @abort()
  unreachable

dispatch.ok211:                                   ; preds = %dispatch.ok204
  %vtable.ptr214 = load ptr, ptr %self210, align 8
  %method.ptr.addr215 = getelementptr ptr, ptr %vtable.ptr214, i64 11
  %method.ptr216 = load ptr, ptr %method.ptr.addr215, align 8
  %dispatch.result217 = call i32 %method.ptr216(ptr %self210)
  %dispatch.result218 = call ptr %method.ptr209(ptr %A.newtmp203, i32 %dispatch.result217)
  %self219 = load ptr, ptr %this.addr, align 8
  %a_var.addr220 = getelementptr i8, ptr %self219, i32 24
  store ptr %dispatch.result218, ptr %a_var.addr220, align 8
  %D.newtmp = call ptr @D.new()
  %dispatch.isnull223 = icmp eq ptr %D.newtmp, null
  br i1 %dispatch.isnull223, label %dispatch.abort222, label %dispatch.ok221

dispatch.abort212:                                ; preds = %dispatch.ok204
  call void @abort()
  unreachable

dispatch.ok221:                                   ; preds = %dispatch.ok211
  %vtable.ptr224 = load ptr, ptr %D.newtmp, align 8
  %method.ptr.addr225 = getelementptr ptr, ptr %vtable.ptr224, i64 10
  %method.ptr226 = load ptr, ptr %method.ptr.addr225, align 8
  %self227 = load ptr, ptr %this.addr, align 8
  %avar.addr228 = getelementptr i8, ptr %self227, i32 16
  %avar229 = load ptr, ptr %avar.addr228, align 8
  %dispatch.isnull232 = icmp eq ptr %avar229, null
  br i1 %dispatch.isnull232, label %dispatch.abort231, label %dispatch.ok230

dispatch.abort222:                                ; preds = %dispatch.ok211
  call void @abort()
  unreachable

dispatch.ok230:                                   ; preds = %dispatch.ok221
  %vtable.ptr233 = load ptr, ptr %avar229, align 8
  %method.ptr.addr234 = getelementptr ptr, ptr %vtable.ptr233, i64 5
  %method.ptr235 = load ptr, ptr %method.ptr.addr234, align 8
  %dispatch.result236 = call i32 %method.ptr235(ptr %avar229)
  %self237 = load ptr, ptr %this.addr, align 8
  %a_var.addr238 = getelementptr i8, ptr %self237, i32 24
  %a_var239 = load ptr, ptr %a_var.addr238, align 8
  %dispatch.isnull242 = icmp eq ptr %a_var239, null
  br i1 %dispatch.isnull242, label %dispatch.abort241, label %dispatch.ok240

dispatch.abort231:                                ; preds = %dispatch.ok221
  call void @abort()
  unreachable

dispatch.ok240:                                   ; preds = %dispatch.ok230
  %vtable.ptr243 = load ptr, ptr %a_var239, align 8
  %method.ptr.addr244 = getelementptr ptr, ptr %vtable.ptr243, i64 5
  %method.ptr245 = load ptr, ptr %method.ptr.addr244, align 8
  %dispatch.result246 = call i32 %method.ptr245(ptr %a_var239)
  %dispatch.result247 = call ptr %method.ptr226(ptr %D.newtmp, i32 %dispatch.result236, i32 %dispatch.result246)
  %self248 = load ptr, ptr %this.addr, align 8
  %avar.addr249 = getelementptr i8, ptr %self248, i32 16
  store ptr %dispatch.result247, ptr %avar.addr249, align 8
  br label %ifcont560

dispatch.abort241:                                ; preds = %dispatch.ok230
  call void @abort()
  unreachable

else250:                                          ; preds = %else197
  %self251 = load ptr, ptr %this.addr, align 8
  %char.addr252 = getelementptr i8, ptr %self251, i32 8
  %char253 = load ptr, ptr %char.addr252, align 8
  %eqtmp254 = call i1 @String_equals(ptr %char253, ptr @.str.14494284460613645429)
  br i1 %eqtmp254, label %then255, label %else268

then255:                                          ; preds = %else250
  %C.newtmp = call ptr @C.new()
  %static.dispatch.isnull = icmp eq ptr %C.newtmp, null
  br i1 %static.dispatch.isnull, label %static.dispatch.abort, label %static.dispatch.ok

static.dispatch.ok:                               ; preds = %then255
  %self256 = load ptr, ptr %this.addr, align 8
  %avar.addr257 = getelementptr i8, ptr %self256, i32 16
  %avar258 = load ptr, ptr %avar.addr257, align 8
  %dispatch.isnull261 = icmp eq ptr %avar258, null
  br i1 %dispatch.isnull261, label %dispatch.abort260, label %dispatch.ok259

static.dispatch.abort:                            ; preds = %then255
  call void @abort()
  unreachable

dispatch.ok259:                                   ; preds = %static.dispatch.ok
  %vtable.ptr262 = load ptr, ptr %avar258, align 8
  %method.ptr.addr263 = getelementptr ptr, ptr %vtable.ptr262, i64 5
  %method.ptr264 = load ptr, ptr %method.ptr.addr263, align 8
  %dispatch.result265 = call i32 %method.ptr264(ptr %avar258)
  %1 = call ptr @A.method5(ptr %C.newtmp, i32 %dispatch.result265)
  %self266 = load ptr, ptr %this.addr, align 8
  %avar.addr267 = getelementptr i8, ptr %self266, i32 16
  store ptr %1, ptr %avar.addr267, align 8
  br label %ifcont558

dispatch.abort260:                                ; preds = %static.dispatch.ok
  call void @abort()
  unreachable

else268:                                          ; preds = %else250
  %self269 = load ptr, ptr %this.addr, align 8
  %char.addr270 = getelementptr i8, ptr %self269, i32 8
  %char271 = load ptr, ptr %char.addr270, align 8
  %eqtmp272 = call i1 @String_equals(ptr %char271, ptr @.str.2540012008095083820)
  br i1 %eqtmp272, label %then273, label %else290

then273:                                          ; preds = %else268
  %C.newtmp274 = call ptr @C.new()
  %static.dispatch.isnull277 = icmp eq ptr %C.newtmp274, null
  br i1 %static.dispatch.isnull277, label %static.dispatch.abort276, label %static.dispatch.ok275

static.dispatch.ok275:                            ; preds = %then273
  %self278 = load ptr, ptr %this.addr, align 8
  %avar.addr279 = getelementptr i8, ptr %self278, i32 16
  %avar280 = load ptr, ptr %avar.addr279, align 8
  %dispatch.isnull283 = icmp eq ptr %avar280, null
  br i1 %dispatch.isnull283, label %dispatch.abort282, label %dispatch.ok281

static.dispatch.abort276:                         ; preds = %then273
  call void @abort()
  unreachable

dispatch.ok281:                                   ; preds = %static.dispatch.ok275
  %vtable.ptr284 = load ptr, ptr %avar280, align 8
  %method.ptr.addr285 = getelementptr ptr, ptr %vtable.ptr284, i64 5
  %method.ptr286 = load ptr, ptr %method.ptr.addr285, align 8
  %dispatch.result287 = call i32 %method.ptr286(ptr %avar280)
  %2 = call ptr @B.method5(ptr %C.newtmp274, i32 %dispatch.result287)
  %self288 = load ptr, ptr %this.addr, align 8
  %avar.addr289 = getelementptr i8, ptr %self288, i32 16
  store ptr %2, ptr %avar.addr289, align 8
  br label %ifcont556

dispatch.abort282:                                ; preds = %static.dispatch.ok275
  call void @abort()
  unreachable

else290:                                          ; preds = %else268
  %self291 = load ptr, ptr %this.addr, align 8
  %char.addr292 = getelementptr i8, ptr %self291, i32 8
  %char293 = load ptr, ptr %char.addr292, align 8
  %eqtmp294 = call i1 @String_equals(ptr %char293, ptr @.str.8968846175329310707)
  br i1 %eqtmp294, label %then295, label %else312

then295:                                          ; preds = %else290
  %C.newtmp296 = call ptr @C.new()
  %static.dispatch.isnull299 = icmp eq ptr %C.newtmp296, null
  br i1 %static.dispatch.isnull299, label %static.dispatch.abort298, label %static.dispatch.ok297

static.dispatch.ok297:                            ; preds = %then295
  %self300 = load ptr, ptr %this.addr, align 8
  %avar.addr301 = getelementptr i8, ptr %self300, i32 16
  %avar302 = load ptr, ptr %avar.addr301, align 8
  %dispatch.isnull305 = icmp eq ptr %avar302, null
  br i1 %dispatch.isnull305, label %dispatch.abort304, label %dispatch.ok303

static.dispatch.abort298:                         ; preds = %then295
  call void @abort()
  unreachable

dispatch.ok303:                                   ; preds = %static.dispatch.ok297
  %vtable.ptr306 = load ptr, ptr %avar302, align 8
  %method.ptr.addr307 = getelementptr ptr, ptr %vtable.ptr306, i64 5
  %method.ptr308 = load ptr, ptr %method.ptr.addr307, align 8
  %dispatch.result309 = call i32 %method.ptr308(ptr %avar302)
  %3 = call ptr @C.method5(ptr %C.newtmp296, i32 %dispatch.result309)
  %self310 = load ptr, ptr %this.addr, align 8
  %avar.addr311 = getelementptr i8, ptr %self310, i32 16
  store ptr %3, ptr %avar.addr311, align 8
  br label %ifcont554

dispatch.abort304:                                ; preds = %static.dispatch.ok297
  call void @abort()
  unreachable

else312:                                          ; preds = %else290
  %self313 = load ptr, ptr %this.addr, align 8
  %char.addr314 = getelementptr i8, ptr %self313, i32 8
  %char315 = load ptr, ptr %char.addr314, align 8
  %eqtmp316 = call i1 @String_equals(ptr %char315, ptr @.str.11967580440506868130)
  br i1 %eqtmp316, label %then317, label %else394

then317:                                          ; preds = %else312
  %D.newtmp318 = call ptr @D.new()
  %dispatch.isnull321 = icmp eq ptr %D.newtmp318, null
  br i1 %dispatch.isnull321, label %dispatch.abort320, label %dispatch.ok319

dispatch.ok319:                                   ; preds = %then317
  %vtable.ptr322 = load ptr, ptr %D.newtmp318, align 8
  %method.ptr.addr323 = getelementptr ptr, ptr %vtable.ptr322, i64 12
  %method.ptr324 = load ptr, ptr %method.ptr.addr323, align 8
  %self325 = load ptr, ptr %this.addr, align 8
  %avar.addr326 = getelementptr i8, ptr %self325, i32 16
  %avar327 = load ptr, ptr %avar.addr326, align 8
  %dispatch.isnull330 = icmp eq ptr %avar327, null
  br i1 %dispatch.isnull330, label %dispatch.abort329, label %dispatch.ok328

dispatch.abort320:                                ; preds = %then317
  call void @abort()
  unreachable

dispatch.ok328:                                   ; preds = %dispatch.ok319
  %vtable.ptr331 = load ptr, ptr %avar327, align 8
  %method.ptr.addr332 = getelementptr ptr, ptr %vtable.ptr331, i64 5
  %method.ptr333 = load ptr, ptr %method.ptr.addr332, align 8
  %dispatch.result334 = call i32 %method.ptr333(ptr %avar327)
  %dispatch.result335 = call i1 %method.ptr324(ptr %D.newtmp318, i32 %dispatch.result334)
  br i1 %dispatch.result335, label %then336, label %else364

dispatch.abort329:                                ; preds = %dispatch.ok319
  call void @abort()
  unreachable

then336:                                          ; preds = %dispatch.ok328
  %self337 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull340 = icmp eq ptr %self337, null
  br i1 %dispatch.isnull340, label %dispatch.abort339, label %dispatch.ok338

dispatch.ok338:                                   ; preds = %then336
  %vtable.ptr341 = load ptr, ptr %self337, align 8
  %method.ptr.addr342 = getelementptr ptr, ptr %vtable.ptr341, i64 5
  %method.ptr343 = load ptr, ptr %method.ptr.addr342, align 8
  %dispatch.result344 = call ptr %method.ptr343(ptr %self337, ptr @.str.1187902871956776895)
  %self345 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull348 = icmp eq ptr %self345, null
  br i1 %dispatch.isnull348, label %dispatch.abort347, label %dispatch.ok346

dispatch.abort339:                                ; preds = %then336
  call void @abort()
  unreachable

dispatch.ok346:                                   ; preds = %dispatch.ok338
  %vtable.ptr349 = load ptr, ptr %self345, align 8
  %method.ptr.addr350 = getelementptr ptr, ptr %vtable.ptr349, i64 14
  %method.ptr351 = load ptr, ptr %method.ptr.addr350, align 8
  %self352 = load ptr, ptr %this.addr, align 8
  %avar.addr353 = getelementptr i8, ptr %self352, i32 16
  %avar354 = load ptr, ptr %avar.addr353, align 8
  %dispatch.result355 = call ptr %method.ptr351(ptr %self345, ptr %avar354)
  %self356 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull359 = icmp eq ptr %self356, null
  br i1 %dispatch.isnull359, label %dispatch.abort358, label %dispatch.ok357

dispatch.abort347:                                ; preds = %dispatch.ok338
  call void @abort()
  unreachable

dispatch.ok357:                                   ; preds = %dispatch.ok346
  %vtable.ptr360 = load ptr, ptr %self356, align 8
  %method.ptr.addr361 = getelementptr ptr, ptr %vtable.ptr360, i64 5
  %method.ptr362 = load ptr, ptr %method.ptr.addr361, align 8
  %dispatch.result363 = call ptr %method.ptr362(ptr %self356, ptr @.str.14397651933741679677)
  br label %ifcont392

dispatch.abort358:                                ; preds = %dispatch.ok346
  call void @abort()
  unreachable

else364:                                          ; preds = %dispatch.ok328
  %self365 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull368 = icmp eq ptr %self365, null
  br i1 %dispatch.isnull368, label %dispatch.abort367, label %dispatch.ok366

dispatch.ok366:                                   ; preds = %else364
  %vtable.ptr369 = load ptr, ptr %self365, align 8
  %method.ptr.addr370 = getelementptr ptr, ptr %vtable.ptr369, i64 5
  %method.ptr371 = load ptr, ptr %method.ptr.addr370, align 8
  %dispatch.result372 = call ptr %method.ptr371(ptr %self365, ptr @.str.1187902871956776895)
  %self373 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull376 = icmp eq ptr %self373, null
  br i1 %dispatch.isnull376, label %dispatch.abort375, label %dispatch.ok374

dispatch.abort367:                                ; preds = %else364
  call void @abort()
  unreachable

dispatch.ok374:                                   ; preds = %dispatch.ok366
  %vtable.ptr377 = load ptr, ptr %self373, align 8
  %method.ptr.addr378 = getelementptr ptr, ptr %vtable.ptr377, i64 14
  %method.ptr379 = load ptr, ptr %method.ptr.addr378, align 8
  %self380 = load ptr, ptr %this.addr, align 8
  %avar.addr381 = getelementptr i8, ptr %self380, i32 16
  %avar382 = load ptr, ptr %avar.addr381, align 8
  %dispatch.result383 = call ptr %method.ptr379(ptr %self373, ptr %avar382)
  %self384 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull387 = icmp eq ptr %self384, null
  br i1 %dispatch.isnull387, label %dispatch.abort386, label %dispatch.ok385

dispatch.abort375:                                ; preds = %dispatch.ok366
  call void @abort()
  unreachable

dispatch.ok385:                                   ; preds = %dispatch.ok374
  %vtable.ptr388 = load ptr, ptr %self384, align 8
  %method.ptr.addr389 = getelementptr ptr, ptr %vtable.ptr388, i64 5
  %method.ptr390 = load ptr, ptr %method.ptr.addr389, align 8
  %dispatch.result391 = call ptr %method.ptr390(ptr %self384, ptr @.str.311485499312808629)
  br label %ifcont392

dispatch.abort386:                                ; preds = %dispatch.ok374
  call void @abort()
  unreachable

ifcont392:                                        ; preds = %dispatch.ok385, %dispatch.ok357
  %cond_result393 = phi ptr [ %dispatch.result363, %dispatch.ok357 ], [ %dispatch.result391, %dispatch.ok385 ]
  br label %ifcont552

else394:                                          ; preds = %else312
  %self395 = load ptr, ptr %this.addr, align 8
  %char.addr396 = getelementptr i8, ptr %self395, i32 8
  %char397 = load ptr, ptr %char.addr396, align 8
  %eqtmp398 = call i1 @String_equals(ptr %char397, ptr @.str.11539147918811572172)
  br i1 %eqtmp398, label %then399, label %else508

then399:                                          ; preds = %else394
  %x = alloca ptr, align 8
  store ptr null, ptr %x, align 8
  %E.newtmp = call ptr @E.new()
  %dispatch.isnull402 = icmp eq ptr %E.newtmp, null
  br i1 %dispatch.isnull402, label %dispatch.abort401, label %dispatch.ok400

dispatch.ok400:                                   ; preds = %then399
  %vtable.ptr403 = load ptr, ptr %E.newtmp, align 8
  %method.ptr.addr404 = getelementptr ptr, ptr %vtable.ptr403, i64 13
  %method.ptr405 = load ptr, ptr %method.ptr.addr404, align 8
  %self406 = load ptr, ptr %this.addr, align 8
  %avar.addr407 = getelementptr i8, ptr %self406, i32 16
  %avar408 = load ptr, ptr %avar.addr407, align 8
  %dispatch.isnull411 = icmp eq ptr %avar408, null
  br i1 %dispatch.isnull411, label %dispatch.abort410, label %dispatch.ok409

dispatch.abort401:                                ; preds = %then399
  call void @abort()
  unreachable

dispatch.ok409:                                   ; preds = %dispatch.ok400
  %vtable.ptr412 = load ptr, ptr %avar408, align 8
  %method.ptr.addr413 = getelementptr ptr, ptr %vtable.ptr412, i64 5
  %method.ptr414 = load ptr, ptr %method.ptr.addr413, align 8
  %dispatch.result415 = call i32 %method.ptr414(ptr %avar408)
  %dispatch.result416 = call ptr %method.ptr405(ptr %E.newtmp, i32 %dispatch.result415)
  store ptr %dispatch.result416, ptr %x, align 8
  %r = alloca i32, align 4
  %self417 = load ptr, ptr %this.addr, align 8
  %avar.addr418 = getelementptr i8, ptr %self417, i32 16
  %avar419 = load ptr, ptr %avar.addr418, align 8
  %dispatch.isnull422 = icmp eq ptr %avar419, null
  br i1 %dispatch.isnull422, label %dispatch.abort421, label %dispatch.ok420

dispatch.abort410:                                ; preds = %dispatch.ok400
  call void @abort()
  unreachable

dispatch.ok420:                                   ; preds = %dispatch.ok409
  %vtable.ptr423 = load ptr, ptr %avar419, align 8
  %method.ptr.addr424 = getelementptr ptr, ptr %vtable.ptr423, i64 5
  %method.ptr425 = load ptr, ptr %method.ptr.addr424, align 8
  %dispatch.result426 = call i32 %method.ptr425(ptr %avar419)
  %x427 = load ptr, ptr %x, align 8
  %dispatch.isnull430 = icmp eq ptr %x427, null
  br i1 %dispatch.isnull430, label %dispatch.abort429, label %dispatch.ok428

dispatch.abort421:                                ; preds = %dispatch.ok409
  call void @abort()
  unreachable

dispatch.ok428:                                   ; preds = %dispatch.ok420
  %vtable.ptr431 = load ptr, ptr %x427, align 8
  %method.ptr.addr432 = getelementptr ptr, ptr %vtable.ptr431, i64 5
  %method.ptr433 = load ptr, ptr %method.ptr.addr432, align 8
  %dispatch.result434 = call i32 %method.ptr433(ptr %x427)
  %multmp = mul i32 %dispatch.result434, 8
  %subtmp = sub i32 %dispatch.result426, %multmp
  store i32 %subtmp, ptr %r, align 4
  %self435 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull438 = icmp eq ptr %self435, null
  br i1 %dispatch.isnull438, label %dispatch.abort437, label %dispatch.ok436

dispatch.abort429:                                ; preds = %dispatch.ok420
  call void @abort()
  unreachable

dispatch.ok436:                                   ; preds = %dispatch.ok428
  %vtable.ptr439 = load ptr, ptr %self435, align 8
  %method.ptr.addr440 = getelementptr ptr, ptr %vtable.ptr439, i64 5
  %method.ptr441 = load ptr, ptr %method.ptr.addr440, align 8
  %dispatch.result442 = call ptr %method.ptr441(ptr %self435, ptr @.str.1187902871956776895)
  %self443 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull446 = icmp eq ptr %self443, null
  br i1 %dispatch.isnull446, label %dispatch.abort445, label %dispatch.ok444

dispatch.abort437:                                ; preds = %dispatch.ok428
  call void @abort()
  unreachable

dispatch.ok444:                                   ; preds = %dispatch.ok436
  %vtable.ptr447 = load ptr, ptr %self443, align 8
  %method.ptr.addr448 = getelementptr ptr, ptr %vtable.ptr447, i64 14
  %method.ptr449 = load ptr, ptr %method.ptr.addr448, align 8
  %self450 = load ptr, ptr %this.addr, align 8
  %avar.addr451 = getelementptr i8, ptr %self450, i32 16
  %avar452 = load ptr, ptr %avar.addr451, align 8
  %dispatch.result453 = call ptr %method.ptr449(ptr %self443, ptr %avar452)
  %self454 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull457 = icmp eq ptr %self454, null
  br i1 %dispatch.isnull457, label %dispatch.abort456, label %dispatch.ok455

dispatch.abort445:                                ; preds = %dispatch.ok436
  call void @abort()
  unreachable

dispatch.ok455:                                   ; preds = %dispatch.ok444
  %vtable.ptr458 = load ptr, ptr %self454, align 8
  %method.ptr.addr459 = getelementptr ptr, ptr %vtable.ptr458, i64 5
  %method.ptr460 = load ptr, ptr %method.ptr.addr459, align 8
  %dispatch.result461 = call ptr %method.ptr460(ptr %self454, ptr @.str.15037267644295846719)
  %self462 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull465 = icmp eq ptr %self462, null
  br i1 %dispatch.isnull465, label %dispatch.abort464, label %dispatch.ok463

dispatch.abort456:                                ; preds = %dispatch.ok444
  call void @abort()
  unreachable

dispatch.ok463:                                   ; preds = %dispatch.ok455
  %vtable.ptr466 = load ptr, ptr %self462, align 8
  %method.ptr.addr467 = getelementptr ptr, ptr %vtable.ptr466, i64 14
  %method.ptr468 = load ptr, ptr %method.ptr.addr467, align 8
  %x469 = load ptr, ptr %x, align 8
  %dispatch.result470 = call ptr %method.ptr468(ptr %self462, ptr %x469)
  %self471 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull474 = icmp eq ptr %self471, null
  br i1 %dispatch.isnull474, label %dispatch.abort473, label %dispatch.ok472

dispatch.abort464:                                ; preds = %dispatch.ok455
  call void @abort()
  unreachable

dispatch.ok472:                                   ; preds = %dispatch.ok463
  %vtable.ptr475 = load ptr, ptr %self471, align 8
  %method.ptr.addr476 = getelementptr ptr, ptr %vtable.ptr475, i64 5
  %method.ptr477 = load ptr, ptr %method.ptr.addr476, align 8
  %dispatch.result478 = call ptr %method.ptr477(ptr %self471, ptr @.str.15336703179750707214)
  %a479 = alloca ptr, align 8
  %A2I.newtmp = call ptr @A2I.new()
  store ptr %A2I.newtmp, ptr %a479, align 8
  %self480 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull483 = icmp eq ptr %self480, null
  br i1 %dispatch.isnull483, label %dispatch.abort482, label %dispatch.ok481

dispatch.abort473:                                ; preds = %dispatch.ok463
  call void @abort()
  unreachable

dispatch.ok481:                                   ; preds = %dispatch.ok472
  %vtable.ptr484 = load ptr, ptr %self480, align 8
  %method.ptr.addr485 = getelementptr ptr, ptr %vtable.ptr484, i64 5
  %method.ptr486 = load ptr, ptr %method.ptr.addr485, align 8
  %a487 = load ptr, ptr %a479, align 8
  %dispatch.isnull490 = icmp eq ptr %a487, null
  br i1 %dispatch.isnull490, label %dispatch.abort489, label %dispatch.ok488

dispatch.abort482:                                ; preds = %dispatch.ok472
  call void @abort()
  unreachable

dispatch.ok488:                                   ; preds = %dispatch.ok481
  %vtable.ptr491 = load ptr, ptr %a487, align 8
  %method.ptr.addr492 = getelementptr ptr, ptr %vtable.ptr491, i64 9
  %method.ptr493 = load ptr, ptr %method.ptr.addr492, align 8
  %r494 = load i32, ptr %r, align 4
  %dispatch.result495 = call ptr %method.ptr493(ptr %a487, i32 %r494)
  %dispatch.result496 = call ptr %method.ptr486(ptr %self480, ptr %dispatch.result495)
  %self497 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull500 = icmp eq ptr %self497, null
  br i1 %dispatch.isnull500, label %dispatch.abort499, label %dispatch.ok498

dispatch.abort489:                                ; preds = %dispatch.ok481
  call void @abort()
  unreachable

dispatch.ok498:                                   ; preds = %dispatch.ok488
  %vtable.ptr501 = load ptr, ptr %self497, align 8
  %method.ptr.addr502 = getelementptr ptr, ptr %vtable.ptr501, i64 5
  %method.ptr503 = load ptr, ptr %method.ptr.addr502, align 8
  %dispatch.result504 = call ptr %method.ptr503(ptr %self497, ptr @.str.18400681194753865968)
  %x505 = load ptr, ptr %x, align 8
  %self506 = load ptr, ptr %this.addr, align 8
  %avar.addr507 = getelementptr i8, ptr %self506, i32 16
  store ptr %x505, ptr %avar.addr507, align 8
  br label %ifcont550

dispatch.abort499:                                ; preds = %dispatch.ok488
  call void @abort()
  unreachable

else508:                                          ; preds = %else394
  %self509 = load ptr, ptr %this.addr, align 8
  %char.addr510 = getelementptr i8, ptr %self509, i32 8
  %char511 = load ptr, ptr %char.addr510, align 8
  %eqtmp512 = call i1 @String_equals(ptr %char511, ptr @.str.10485857595211860659)
  br i1 %eqtmp512, label %then513, label %else517

then513:                                          ; preds = %else508
  %A.newtmp514 = call ptr @A.new()
  %self515 = load ptr, ptr %this.addr, align 8
  %avar.addr516 = getelementptr i8, ptr %self515, i32 16
  store ptr %A.newtmp514, ptr %avar.addr516, align 8
  br label %ifcont548

else517:                                          ; preds = %else508
  %self518 = load ptr, ptr %this.addr, align 8
  %char.addr519 = getelementptr i8, ptr %self518, i32 8
  %char520 = load ptr, ptr %char.addr519, align 8
  %eqtmp521 = call i1 @String_equals(ptr %char520, ptr @.str.747352984659061831)
  br i1 %eqtmp521, label %then522, label %else525

then522:                                          ; preds = %else517
  %self523 = load ptr, ptr %this.addr, align 8
  %flag.addr524 = getelementptr i8, ptr %self523, i32 32
  store i1 false, ptr %flag.addr524, align 1
  br label %ifcont546

else525:                                          ; preds = %else517
  %A.newtmp526 = call ptr @A.new()
  %dispatch.isnull529 = icmp eq ptr %A.newtmp526, null
  br i1 %dispatch.isnull529, label %dispatch.abort528, label %dispatch.ok527

dispatch.ok527:                                   ; preds = %else525
  %vtable.ptr530 = load ptr, ptr %A.newtmp526, align 8
  %method.ptr.addr531 = getelementptr ptr, ptr %vtable.ptr530, i64 7
  %method.ptr532 = load ptr, ptr %method.ptr.addr531, align 8
  %self533 = load ptr, ptr %this.addr, align 8
  %avar.addr534 = getelementptr i8, ptr %self533, i32 16
  %avar535 = load ptr, ptr %avar.addr534, align 8
  %dispatch.isnull538 = icmp eq ptr %avar535, null
  br i1 %dispatch.isnull538, label %dispatch.abort537, label %dispatch.ok536

dispatch.abort528:                                ; preds = %else525
  call void @abort()
  unreachable

dispatch.ok536:                                   ; preds = %dispatch.ok527
  %vtable.ptr539 = load ptr, ptr %avar535, align 8
  %method.ptr.addr540 = getelementptr ptr, ptr %vtable.ptr539, i64 5
  %method.ptr541 = load ptr, ptr %method.ptr.addr540, align 8
  %dispatch.result542 = call i32 %method.ptr541(ptr %avar535)
  %dispatch.result543 = call ptr %method.ptr532(ptr %A.newtmp526, i32 %dispatch.result542)
  %self544 = load ptr, ptr %this.addr, align 8
  %avar.addr545 = getelementptr i8, ptr %self544, i32 16
  store ptr %dispatch.result543, ptr %avar.addr545, align 8
  br label %ifcont546

dispatch.abort537:                                ; preds = %dispatch.ok527
  call void @abort()
  unreachable

ifcont546:                                        ; preds = %dispatch.ok536, %then522
  %cond_result547 = phi ptr [ null, %then522 ], [ %dispatch.result543, %dispatch.ok536 ]
  br label %ifcont548

ifcont548:                                        ; preds = %ifcont546, %then513
  %cond_result549 = phi ptr [ %A.newtmp514, %then513 ], [ %cond_result547, %ifcont546 ]
  br label %ifcont550

ifcont550:                                        ; preds = %ifcont548, %dispatch.ok498
  %cond_result551 = phi ptr [ %x505, %dispatch.ok498 ], [ %cond_result549, %ifcont548 ]
  br label %ifcont552

ifcont552:                                        ; preds = %ifcont550, %ifcont392
  %cond_result553 = phi ptr [ %cond_result393, %ifcont392 ], [ %cond_result551, %ifcont550 ]
  br label %ifcont554

ifcont554:                                        ; preds = %ifcont552, %dispatch.ok303
  %cond_result555 = phi ptr [ %3, %dispatch.ok303 ], [ %cond_result553, %ifcont552 ]
  br label %ifcont556

ifcont556:                                        ; preds = %ifcont554, %dispatch.ok281
  %cond_result557 = phi ptr [ %2, %dispatch.ok281 ], [ %cond_result555, %ifcont554 ]
  br label %ifcont558

ifcont558:                                        ; preds = %ifcont556, %dispatch.ok259
  %cond_result559 = phi ptr [ %1, %dispatch.ok259 ], [ %cond_result557, %ifcont556 ]
  br label %ifcont560

ifcont560:                                        ; preds = %ifcont558, %dispatch.ok240
  %cond_result561 = phi ptr [ %dispatch.result247, %dispatch.ok240 ], [ %cond_result559, %ifcont558 ]
  br label %ifcont562

ifcont562:                                        ; preds = %ifcont560, %case.end
  %cond_result563 = phi ptr [ %case.result, %case.end ], [ %cond_result561, %ifcont560 ]
  br label %ifcont564

ifcont564:                                        ; preds = %ifcont562, %dispatch.ok105
  %cond_result565 = phi ptr [ %dispatch.result112, %dispatch.ok105 ], [ %cond_result563, %ifcont562 ]
  br label %loop.cond
}

define void @_ZN1AC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.A, ptr %this, i32 0, i32 0
  call void @_ZN6ObjectC2Ev(ptr %parent.subobject)
  store ptr @_ZTV1A, ptr %this, align 8
  %var.addr.byte = getelementptr i8, ptr %this, i64 8
  store i32 0, ptr %var.addr.byte, align 4
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
  call void @_ZN1BC2Ev(ptr %parent.subobject)
  store ptr @_ZTV1C, ptr %this, align 8
  ret void
}

define ptr @C.new() {
entry:
  %0 = call ptr @malloc(i64 16)
  call void @_ZN1CC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN1DC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.D, ptr %this, i32 0, i32 0
  call void @_ZN1BC2Ev(ptr %parent.subobject)
  store ptr @_ZTV1D, ptr %this, align 8
  ret void
}

define ptr @D.new() {
entry:
  %0 = call ptr @malloc(i64 16)
  call void @_ZN1DC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN1EC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.E, ptr %this, i32 0, i32 0
  call void @_ZN1DC2Ev(ptr %parent.subobject)
  store ptr @_ZTV1E, ptr %this, align 8
  ret void
}

define ptr @E.new() {
entry:
  %0 = call ptr @malloc(i64 16)
  call void @_ZN1EC2Ev(ptr %0)
  ret ptr %0
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
  %char.addr.byte = getelementptr i8, ptr %this, i64 8
  store ptr @.str.const.6142509188972423790, ptr %char.addr.byte, align 8
  %avar.addr.byte = getelementptr i8, ptr %this, i64 16
  store ptr null, ptr %avar.addr.byte, align 8
  %a_var.addr.byte = getelementptr i8, ptr %this, i64 24
  store ptr null, ptr %a_var.addr.byte, align 8
  %flag.addr.byte = getelementptr i8, ptr %this, i64 32
  store i1 true, ptr %flag.addr.byte, align 1
  ret void
}

define ptr @Main.new() {
entry:
  %0 = call ptr @malloc(i64 40)
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
