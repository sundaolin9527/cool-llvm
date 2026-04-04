; ModuleID = 'main_module'
source_filename = "main_module"

%struct.__cxxabiv1.__class_type_info = type { ptr, ptr }
%struct.__cxxabiv1.__si_class_type_info = type { ptr, ptr, ptr }
%class.Int = type { %class.Object.0, i32 }
%class.Object.0 = type { ptr }
%class.Bool = type { %class.Object.0, i1 }
%class.String = type { %class.Object.0, ptr, i32, i32 }
%class.IO.1 = type { %class.Object.0 }
%class.A = type { %class.Object.0, i32 }
%class.B = type { %class.A, i32 }
%class.C = type { %class.B }
%class.D = type { %class.B }
%class.E = type { %class.D }
%class.A2I = type { %class.Object.0 }
%class.Main = type { %class.IO.1, ptr, ptr, ptr, i1 }

@_ZTS6Object = linkonce_odr constant [8 x i8] c"6Object\00", align 1
@_ZTVN10__cxxabiv117__class_type_infoE = external global [0 x ptr]
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global [0 x ptr]
@_ZTI6Object = linkonce_odr constant %struct.__cxxabiv1.__class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv117__class_type_infoE, i64 2), ptr @_ZTS6Object }, align 8
@_ZTV6Object = linkonce_odr constant [5 x ptr] [ptr null, ptr @_ZTI6Object, ptr @Object.copy, ptr @Object.abort, ptr @Object.type_name], align 8
@_ZTS3Int = linkonce_odr constant [5 x i8] c"3Int\00", align 1
@_ZTI3Int = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS3Int, ptr @_ZTI6Object }, align 8
@_ZTV3Int = linkonce_odr constant [11 x ptr] [ptr null, ptr @_ZTI3Int, ptr @Object.copy, ptr @Object.abort, ptr @Object.type_name, ptr @Int.plus, ptr @Int.minus, ptr @Int.times, ptr @Int.divide, ptr @Int.negate, ptr @Int.equals], align 8
@_ZTS4Bool = linkonce_odr constant [6 x i8] c"4Bool\00", align 1
@_ZTI4Bool = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Bool, ptr @_ZTI6Object }, align 8
@_ZTV4Bool = linkonce_odr constant [7 x ptr] [ptr null, ptr @_ZTI4Bool, ptr @Object.copy, ptr @Object.abort, ptr @Object.type_name, ptr @Bool.equals, ptr @Bool.not], align 8
@_ZTS6String = linkonce_odr constant [8 x i8] c"6String\00", align 1
@_ZTI6String = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS6String, ptr @_ZTI6Object }, align 8
@_ZTV6String = linkonce_odr constant [9 x ptr] [ptr null, ptr @_ZTI6String, ptr @Object.copy, ptr @Object.abort, ptr @Object.type_name, ptr @String.equals, ptr @String.length, ptr @String.concat, ptr @String.substr], align 8
@_ZTS2IO = linkonce_odr constant [4 x i8] c"2IO\00", align 1
@_ZTI2IO = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS2IO, ptr @_ZTI6Object }, align 8
@_ZTV2IO = linkonce_odr constant [9 x ptr] [ptr null, ptr @_ZTI2IO, ptr @Object.copy, ptr @Object.abort, ptr @Object.type_name, ptr @IO.out_string, ptr @IO.out_int, ptr @IO.in_string, ptr @IO.in_int], align 8
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
@_ZTV1A = linkonce_odr constant [12 x ptr] [ptr null, ptr @_ZTI1A, ptr @Object.copy, ptr @Object.abort, ptr @Object.type_name, ptr @A.value, ptr @A.set_var, ptr @A.method1, ptr @A.method2, ptr @A.method3, ptr @A.method4, ptr @A.method5], align 8
@_ZTS1B = linkonce_odr constant [3 x i8] c"1B\00", align 1
@_ZTI1B = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS1B, ptr @_ZTI1A }, align 8
@_ZTV1B = linkonce_odr constant [12 x ptr] [ptr null, ptr @_ZTI1B, ptr @Object.copy, ptr @Object.abort, ptr @Object.type_name, ptr @A.value, ptr @A.set_var, ptr @A.method1, ptr @A.method2, ptr @A.method3, ptr @A.method4, ptr @B.method5], align 8
@_ZTS1C = linkonce_odr constant [3 x i8] c"1C\00", align 1
@_ZTI1C = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS1C, ptr @_ZTI1B }, align 8
@_ZTV1C = linkonce_odr constant [13 x ptr] [ptr null, ptr @_ZTI1C, ptr @Object.copy, ptr @Object.abort, ptr @Object.type_name, ptr @A.value, ptr @A.set_var, ptr @A.method1, ptr @A.method2, ptr @A.method3, ptr @A.method4, ptr @C.method5, ptr @C.method6], align 8
@_ZTS1D = linkonce_odr constant [3 x i8] c"1D\00", align 1
@_ZTI1D = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS1D, ptr @_ZTI1B }, align 8
@_ZTV1D = linkonce_odr constant [13 x ptr] [ptr null, ptr @_ZTI1D, ptr @Object.copy, ptr @Object.abort, ptr @Object.type_name, ptr @A.value, ptr @A.set_var, ptr @A.method1, ptr @A.method2, ptr @A.method3, ptr @A.method4, ptr @B.method5, ptr @D.method7], align 8
@_ZTS1E = linkonce_odr constant [3 x i8] c"1E\00", align 1
@_ZTI1E = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS1E, ptr @_ZTI1D }, align 8
@_ZTV1E = linkonce_odr constant [14 x ptr] [ptr null, ptr @_ZTI1E, ptr @Object.copy, ptr @Object.abort, ptr @Object.type_name, ptr @A.value, ptr @A.set_var, ptr @A.method1, ptr @A.method2, ptr @A.method3, ptr @A.method4, ptr @B.method5, ptr @D.method7, ptr @E.method6], align 8
@_ZTS3A2I = linkonce_odr constant [5 x i8] c"3A2I\00", align 1
@_ZTI3A2I = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS3A2I, ptr @_ZTI6Object }, align 8
@_ZTV3A2I = linkonce_odr constant [11 x ptr] [ptr null, ptr @_ZTI3A2I, ptr @Object.copy, ptr @Object.abort, ptr @Object.type_name, ptr @A2I.c2i, ptr @A2I.i2c, ptr @A2I.a2i, ptr @A2I.a2i_aux, ptr @A2I.i2a, ptr @A2I.i2a_aux], align 8
@_ZTS4Main = linkonce_odr constant [6 x i8] c"4Main\00", align 1
@_ZTI4Main = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Main, ptr @_ZTI2IO }, align 8
@_ZTV4Main = linkonce_odr constant [16 x ptr] [ptr null, ptr @_ZTI4Main, ptr @Object.copy, ptr @Object.abort, ptr @Object.type_name, ptr @IO.out_string, ptr @IO.out_int, ptr @IO.in_string, ptr @IO.in_int, ptr @Main.menu, ptr @Main.prompt, ptr @Main.get_int, ptr @Main.is_even, ptr @Main.class_type, ptr @Main.print, ptr @Main.main], align 8
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

declare ptr @Object.copy(ptr)

; Function Attrs: noreturn
declare ptr @Object.abort(ptr) #0

declare ptr @Object.type_name(ptr)

declare ptr @IO.out_string(ptr, ptr)

declare ptr @IO.out_int(ptr, i32)

declare ptr @IO.in_string(ptr)

declare i32 @IO.in_int(ptr)

declare i32 @String.length(ptr)

declare ptr @String.concat(ptr, ptr)

declare ptr @String.substr(ptr, i32, i32)

declare i1 @String.equals(ptr, ptr)

declare i32 @Int.plus(i32, i32)

declare i32 @Int.minus(i32, i32)

declare i32 @Int.times(i32, i32)

declare i32 @Int.divide(i32, i32)

declare i32 @Int.negate(i32)

declare i1 @Int.equals(i32, i32)

declare i1 @Bool.not(i1)

declare i1 @Bool.equals(i1, i1)

declare i1 @isvoid(ptr)

declare ptr @new(i32)

declare void @Object.init(ptr)

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
  %this.addr1 = getelementptr inbounds %class.Int, ptr %this, i32 0, i32 1
  store i32 0, ptr %this.addr1, align 4
  ret void
}

define void @_ZN4BoolC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Bool, ptr %this, i32 0, i32 0
  call void @_ZN6ObjectC2Ev(ptr %parent.subobject)
  store ptr @_ZTV4Bool, ptr %this, align 8
  %this.addr1 = getelementptr inbounds %class.Bool, ptr %this, i32 0, i32 1
  store i1 false, ptr %this.addr1, align 1
  ret void
}

define void @_ZN6StringC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.String, ptr %this, i32 0, i32 0
  call void @_ZN6ObjectC2Ev(ptr %parent.subobject)
  store ptr @_ZTV6String, ptr %this, align 8
  %this.addr1 = getelementptr inbounds %class.String, ptr %this, i32 0, i32 1
  store ptr null, ptr %this.addr1, align 8
  %this.addr2 = getelementptr inbounds %class.String, ptr %this, i32 0, i32 2
  store i32 0, ptr %this.addr2, align 4
  %this.addr3 = getelementptr inbounds %class.String, ptr %this, i32 0, i32 3
  store i32 0, ptr %this.addr3, align 4
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
  %0 = call ptr @malloc(i64 24)
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
  %0 = call ptr @B.new()
  %dispatch.isnull = icmp eq ptr %0, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %0, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 6
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x3 = load i32, ptr %x, align 4
  %dispatch.result = call ptr %method.ptr(ptr %0, i32 %x3)
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
  %0 = call ptr @C.new()
  %dispatch.isnull = icmp eq ptr %0, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %0, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 6
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x2 = load i32, ptr %x, align 4
  %dispatch.result = call ptr %method.ptr(ptr %0, i32 %x2)
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
  %0 = call ptr @D.new()
  %dispatch.isnull = icmp eq ptr %0, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %then
  %vtable.ptr = load ptr, ptr %0, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 6
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x5 = load i32, ptr %x, align 4
  %dispatch.result = call ptr %method.ptr(ptr %0, i32 %x5)
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
  %1 = call ptr @D.new()
  %dispatch.isnull12 = icmp eq ptr %1, null
  br i1 %dispatch.isnull12, label %dispatch.abort11, label %dispatch.ok10

dispatch.ok10:                                    ; preds = %else
  %vtable.ptr13 = load ptr, ptr %1, align 8
  %method.ptr.addr14 = getelementptr ptr, ptr %vtable.ptr13, i64 6
  %method.ptr15 = load ptr, ptr %method.ptr.addr14, align 8
  %x16 = load i32, ptr %x6, align 4
  %dispatch.result17 = call ptr %method.ptr15(ptr %1, i32 %x16)
  br label %ifcont

dispatch.abort11:                                 ; preds = %else
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok10, %dispatch.ok
  %cond_result = phi ptr [ %dispatch.result, %dispatch.ok ], [ %dispatch.result17, %dispatch.ok10 ]
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
  %0 = call ptr @E.new()
  %dispatch.isnull = icmp eq ptr %0, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %loop.after
  %vtable.ptr = load ptr, ptr %0, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 6
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x6 = load i32, ptr %x, align 4
  %dispatch.result = call ptr %method.ptr(ptr %0, i32 %x6)
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
  %0 = call ptr @E.new()
  %dispatch.isnull = icmp eq ptr %0, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %0, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 6
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x3 = load i32, ptr %x, align 4
  %dispatch.result = call ptr %method.ptr(ptr %0, i32 %x3)
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
  %0 = call ptr @A.new()
  %dispatch.isnull = icmp eq ptr %0, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %0, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 6
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x2 = load i32, ptr %x, align 4
  %dispatch.result = call ptr %method.ptr(ptr %0, i32 %x2)
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
  %0 = call ptr @E.new()
  %dispatch.isnull = icmp eq ptr %0, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %0, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 6
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x5 = load i32, ptr %x, align 4
  %dispatch.result = call ptr %method.ptr(ptr %0, i32 %x5)
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
  %0 = call ptr @A.new()
  %dispatch.isnull = icmp eq ptr %0, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %0, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 6
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x2 = load i32, ptr %x, align 4
  %dispatch.result = call ptr %method.ptr(ptr %0, i32 %x2)
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
  %eqtmp = call i1 @String.equals(ptr %char1, ptr @.str.num.0)
  br i1 %eqtmp, label %then, label %else

then:                                             ; preds = %entry
  br label %ifcont53

else:                                             ; preds = %entry
  %char2 = load ptr, ptr %char.addr, align 8
  %eqtmp3 = call i1 @String.equals(ptr %char2, ptr @.str.num.1)
  br i1 %eqtmp3, label %then4, label %else5

then4:                                            ; preds = %else
  br label %ifcont51

else5:                                            ; preds = %else
  %char6 = load ptr, ptr %char.addr, align 8
  %eqtmp7 = call i1 @String.equals(ptr %char6, ptr @.str.num.2)
  br i1 %eqtmp7, label %then8, label %else9

then8:                                            ; preds = %else5
  br label %ifcont49

else9:                                            ; preds = %else5
  %char10 = load ptr, ptr %char.addr, align 8
  %eqtmp11 = call i1 @String.equals(ptr %char10, ptr @.str.num.3)
  br i1 %eqtmp11, label %then12, label %else13

then12:                                           ; preds = %else9
  br label %ifcont47

else13:                                           ; preds = %else9
  %char14 = load ptr, ptr %char.addr, align 8
  %eqtmp15 = call i1 @String.equals(ptr %char14, ptr @.str.num.4)
  br i1 %eqtmp15, label %then16, label %else17

then16:                                           ; preds = %else13
  br label %ifcont45

else17:                                           ; preds = %else13
  %char18 = load ptr, ptr %char.addr, align 8
  %eqtmp19 = call i1 @String.equals(ptr %char18, ptr @.str.num.5)
  br i1 %eqtmp19, label %then20, label %else21

then20:                                           ; preds = %else17
  br label %ifcont43

else21:                                           ; preds = %else17
  %char22 = load ptr, ptr %char.addr, align 8
  %eqtmp23 = call i1 @String.equals(ptr %char22, ptr @.str.num.6)
  br i1 %eqtmp23, label %then24, label %else25

then24:                                           ; preds = %else21
  br label %ifcont41

else25:                                           ; preds = %else21
  %char26 = load ptr, ptr %char.addr, align 8
  %eqtmp27 = call i1 @String.equals(ptr %char26, ptr @.str.num.7)
  br i1 %eqtmp27, label %then28, label %else29

then28:                                           ; preds = %else25
  br label %ifcont39

else29:                                           ; preds = %else25
  %char30 = load ptr, ptr %char.addr, align 8
  %eqtmp31 = call i1 @String.equals(ptr %char30, ptr @.str.num.8)
  br i1 %eqtmp31, label %then32, label %else33

then32:                                           ; preds = %else29
  br label %ifcont38

else33:                                           ; preds = %else29
  %char34 = load ptr, ptr %char.addr, align 8
  %eqtmp35 = call i1 @String.equals(ptr %char34, ptr @.str.num.9)
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
  %dispatch.result = call i32 @String.length(ptr %s1)
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
  %dispatch.result6 = call ptr @String.substr(ptr %s2, i32 0, i32 1)
  %eqtmp7 = call i1 @String.equals(ptr %dispatch.result6, ptr @.str.7372855250431704371)
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
  %dispatch.result20 = call i32 @String.length(ptr %s16)
  %subtmp = sub i32 %dispatch.result20, 1
  %dispatch.result21 = call ptr @String.substr(ptr %s12, i32 1, i32 %subtmp)
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
  %dispatch.result28 = call ptr @String.substr(ptr %s24, i32 0, i32 1)
  %eqtmp29 = call i1 @String.equals(ptr %dispatch.result28, ptr @.str.1370730858159036685)
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
  %dispatch.result46 = call i32 @String.length(ptr %s42)
  %subtmp47 = sub i32 %dispatch.result46, 1
  %dispatch.result48 = call ptr @String.substr(ptr %s38, i32 1, i32 %subtmp47)
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
  %dispatch.result = call i32 @String.length(ptr %s1)
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
  %dispatch.result13 = call ptr @String.substr(ptr %s8, i32 %i12, i32 1)
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
  %dispatch.result15 = call ptr @String.concat(ptr @.str.7372855250431704371, ptr %dispatch.result14)
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
  %dispatch.result17 = call ptr @String.concat(ptr %dispatch.result, ptr %dispatch.result16)
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
  %0 = call ptr @A2I.new()
  store ptr %0, ptr %z, align 8
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
  %0 = call ptr @A2I.new()
  store ptr %0, ptr %z, align 8
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
  %0 = call ptr @A.new()
  %self = load ptr, ptr %this.addr, align 8
  %avar.addr = getelementptr i8, ptr %self, i32 16
  store ptr %0, ptr %avar.addr, align 8
  br label %loop.cond

loop.cond:                                        ; preds = %ifcont474, %entry
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
  %eqtmp = call i1 @String.equals(ptr %char, ptr @.str.4993892634952068459)
  br i1 %eqtmp, label %then69, label %else114

dispatch.abort60:                                 ; preds = %dispatch.ok48
  call void @abort()
  unreachable

then69:                                           ; preds = %dispatch.ok59
  %1 = call ptr @A.new()
  %dispatch.isnull72 = icmp eq ptr %1, null
  br i1 %dispatch.isnull72, label %dispatch.abort71, label %dispatch.ok70

dispatch.ok70:                                    ; preds = %then69
  %vtable.ptr73 = load ptr, ptr %1, align 8
  %method.ptr.addr74 = getelementptr ptr, ptr %vtable.ptr73, i64 6
  %method.ptr75 = load ptr, ptr %method.ptr.addr74, align 8
  %self76 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull79 = icmp eq ptr %self76, null
  br i1 %dispatch.isnull79, label %dispatch.abort78, label %dispatch.ok77

dispatch.abort71:                                 ; preds = %then69
  call void @abort()
  unreachable

dispatch.ok77:                                    ; preds = %dispatch.ok70
  %vtable.ptr80 = load ptr, ptr %self76, align 8
  %method.ptr.addr81 = getelementptr ptr, ptr %vtable.ptr80, i64 11
  %method.ptr82 = load ptr, ptr %method.ptr.addr81, align 8
  %dispatch.result83 = call i32 %method.ptr82(ptr %self76)
  %dispatch.result84 = call ptr %method.ptr75(ptr %1, i32 %dispatch.result83)
  %self85 = load ptr, ptr %this.addr, align 8
  %a_var.addr = getelementptr i8, ptr %self85, i32 24
  store ptr %dispatch.result84, ptr %a_var.addr, align 8
  %2 = call ptr @B.new()
  %dispatch.isnull88 = icmp eq ptr %2, null
  br i1 %dispatch.isnull88, label %dispatch.abort87, label %dispatch.ok86

dispatch.abort78:                                 ; preds = %dispatch.ok70
  call void @abort()
  unreachable

dispatch.ok86:                                    ; preds = %dispatch.ok77
  %vtable.ptr89 = load ptr, ptr %2, align 8
  %method.ptr.addr90 = getelementptr ptr, ptr %vtable.ptr89, i64 8
  %method.ptr91 = load ptr, ptr %method.ptr.addr90, align 8
  %self92 = load ptr, ptr %this.addr, align 8
  %avar.addr93 = getelementptr i8, ptr %self92, i32 16
  %avar94 = load ptr, ptr %avar.addr93, align 8
  %dispatch.isnull97 = icmp eq ptr %avar94, null
  br i1 %dispatch.isnull97, label %dispatch.abort96, label %dispatch.ok95

dispatch.abort87:                                 ; preds = %dispatch.ok77
  call void @abort()
  unreachable

dispatch.ok95:                                    ; preds = %dispatch.ok86
  %vtable.ptr98 = load ptr, ptr %avar94, align 8
  %method.ptr.addr99 = getelementptr ptr, ptr %vtable.ptr98, i64 5
  %method.ptr100 = load ptr, ptr %method.ptr.addr99, align 8
  %dispatch.result101 = call i32 %method.ptr100(ptr %avar94)
  %self102 = load ptr, ptr %this.addr, align 8
  %a_var.addr103 = getelementptr i8, ptr %self102, i32 24
  %a_var = load ptr, ptr %a_var.addr103, align 8
  %dispatch.isnull106 = icmp eq ptr %a_var, null
  br i1 %dispatch.isnull106, label %dispatch.abort105, label %dispatch.ok104

dispatch.abort96:                                 ; preds = %dispatch.ok86
  call void @abort()
  unreachable

dispatch.ok104:                                   ; preds = %dispatch.ok95
  %vtable.ptr107 = load ptr, ptr %a_var, align 8
  %method.ptr.addr108 = getelementptr ptr, ptr %vtable.ptr107, i64 5
  %method.ptr109 = load ptr, ptr %method.ptr.addr108, align 8
  %dispatch.result110 = call i32 %method.ptr109(ptr %a_var)
  %dispatch.result111 = call ptr %method.ptr91(ptr %2, i32 %dispatch.result101, i32 %dispatch.result110)
  %self112 = load ptr, ptr %this.addr, align 8
  %avar.addr113 = getelementptr i8, ptr %self112, i32 16
  store ptr %dispatch.result111, ptr %avar.addr113, align 8
  br label %ifcont474

dispatch.abort105:                                ; preds = %dispatch.ok95
  call void @abort()
  unreachable

else114:                                          ; preds = %dispatch.ok59
  %self115 = load ptr, ptr %this.addr, align 8
  %char.addr116 = getelementptr i8, ptr %self115, i32 8
  %char117 = load ptr, ptr %char.addr116, align 8
  %eqtmp118 = call i1 @String.equals(ptr %char117, ptr @.str.10838281452030117757)
  br i1 %eqtmp118, label %then119, label %else196

then119:                                          ; preds = %else114
  %self120 = load ptr, ptr %this.addr, align 8
  %avar.addr121 = getelementptr i8, ptr %self120, i32 16
  %avar122 = load ptr, ptr %avar.addr121, align 8
  %case.isnull = icmp eq ptr %avar122, null
  br i1 %case.isnull, label %case.abort, label %case.ok

case.ok:                                          ; preds = %then119
  %case.vptr = load ptr, ptr %avar122, align 8
  %C.match = icmp eq ptr %case.vptr, @_ZTV1C
  br i1 %C.match, label %case.match, label %case.next

case.abort:                                       ; preds = %then119
  call void @abort()
  unreachable

case.match:                                       ; preds = %case.ok
  %c.addr = alloca ptr, align 8
  store ptr %avar122, ptr %c.addr, align 8
  %c = load ptr, ptr %c.addr, align 8
  %dispatch.isnull125 = icmp eq ptr %c, null
  br i1 %dispatch.isnull125, label %dispatch.abort124, label %dispatch.ok123

dispatch.ok123:                                   ; preds = %case.match
  %vtable.ptr126 = load ptr, ptr %c, align 8
  %method.ptr.addr127 = getelementptr ptr, ptr %vtable.ptr126, i64 12
  %method.ptr128 = load ptr, ptr %method.ptr.addr127, align 8
  %c129 = load ptr, ptr %c.addr, align 8
  %dispatch.isnull132 = icmp eq ptr %c129, null
  br i1 %dispatch.isnull132, label %dispatch.abort131, label %dispatch.ok130

dispatch.abort124:                                ; preds = %case.match
  call void @abort()
  unreachable

dispatch.ok130:                                   ; preds = %dispatch.ok123
  %vtable.ptr133 = load ptr, ptr %c129, align 8
  %method.ptr.addr134 = getelementptr ptr, ptr %vtable.ptr133, i64 5
  %method.ptr135 = load ptr, ptr %method.ptr.addr134, align 8
  %dispatch.result136 = call i32 %method.ptr135(ptr %c129)
  %dispatch.result137 = call ptr %method.ptr128(ptr %c, i32 %dispatch.result136)
  %self138 = load ptr, ptr %this.addr, align 8
  %avar.addr139 = getelementptr i8, ptr %self138, i32 16
  store ptr %dispatch.result137, ptr %avar.addr139, align 8
  br label %case.end

dispatch.abort131:                                ; preds = %dispatch.ok123
  call void @abort()
  unreachable

case.next:                                        ; preds = %case.ok
  %A.match = icmp eq ptr %case.vptr, @_ZTV1A
  %B.match = icmp eq ptr %case.vptr, @_ZTV1B
  %case.or = or i1 %A.match, %B.match
  %C.match141 = icmp eq ptr %case.vptr, @_ZTV1C
  %case.or142 = or i1 %case.or, %C.match141
  %D.match = icmp eq ptr %case.vptr, @_ZTV1D
  %case.or143 = or i1 %case.or142, %D.match
  %E.match = icmp eq ptr %case.vptr, @_ZTV1E
  %case.or144 = or i1 %case.or143, %E.match
  br i1 %case.or144, label %case.match140, label %case.next162

case.match140:                                    ; preds = %case.next
  %a.addr = alloca ptr, align 8
  store ptr %avar122, ptr %a.addr, align 8
  %a = load ptr, ptr %a.addr, align 8
  %dispatch.isnull147 = icmp eq ptr %a, null
  br i1 %dispatch.isnull147, label %dispatch.abort146, label %dispatch.ok145

dispatch.ok145:                                   ; preds = %case.match140
  %vtable.ptr148 = load ptr, ptr %a, align 8
  %method.ptr.addr149 = getelementptr ptr, ptr %vtable.ptr148, i64 9
  %method.ptr150 = load ptr, ptr %method.ptr.addr149, align 8
  %a151 = load ptr, ptr %a.addr, align 8
  %dispatch.isnull154 = icmp eq ptr %a151, null
  br i1 %dispatch.isnull154, label %dispatch.abort153, label %dispatch.ok152

dispatch.abort146:                                ; preds = %case.match140
  call void @abort()
  unreachable

dispatch.ok152:                                   ; preds = %dispatch.ok145
  %vtable.ptr155 = load ptr, ptr %a151, align 8
  %method.ptr.addr156 = getelementptr ptr, ptr %vtable.ptr155, i64 5
  %method.ptr157 = load ptr, ptr %method.ptr.addr156, align 8
  %dispatch.result158 = call i32 %method.ptr157(ptr %a151)
  %dispatch.result159 = call ptr %method.ptr150(ptr %a, i32 %dispatch.result158)
  %self160 = load ptr, ptr %this.addr, align 8
  %avar.addr161 = getelementptr i8, ptr %self160, i32 16
  store ptr %dispatch.result159, ptr %avar.addr161, align 8
  br label %case.end

dispatch.abort153:                                ; preds = %dispatch.ok145
  call void @abort()
  unreachable

case.next162:                                     ; preds = %case.next
  %A.match164 = icmp eq ptr %case.vptr, @_ZTV1A
  %A2I.match = icmp eq ptr %case.vptr, @_ZTV3A2I
  %case.or165 = or i1 %A.match164, %A2I.match
  %B.match166 = icmp eq ptr %case.vptr, @_ZTV1B
  %case.or167 = or i1 %case.or165, %B.match166
  %Bool.match = icmp eq ptr %case.vptr, @_ZTV4Bool
  %case.or168 = or i1 %case.or167, %Bool.match
  %C.match169 = icmp eq ptr %case.vptr, @_ZTV1C
  %case.or170 = or i1 %case.or168, %C.match169
  %D.match171 = icmp eq ptr %case.vptr, @_ZTV1D
  %case.or172 = or i1 %case.or170, %D.match171
  %E.match173 = icmp eq ptr %case.vptr, @_ZTV1E
  %case.or174 = or i1 %case.or172, %E.match173
  %IO.match = icmp eq ptr %case.vptr, @_ZTV2IO
  %case.or175 = or i1 %case.or174, %IO.match
  %Int.match = icmp eq ptr %case.vptr, @_ZTV3Int
  %case.or176 = or i1 %case.or175, %Int.match
  %Main.match = icmp eq ptr %case.vptr, @_ZTV4Main
  %case.or177 = or i1 %case.or176, %Main.match
  %Object.match = icmp eq ptr %case.vptr, @_ZTV6Object
  %case.or178 = or i1 %case.or177, %Object.match
  %String.match = icmp eq ptr %case.vptr, @_ZTV6String
  %case.or179 = or i1 %case.or178, %String.match
  br i1 %case.or179, label %case.match163, label %case.abort180

case.match163:                                    ; preds = %case.next162
  %o.addr = alloca ptr, align 8
  store ptr %avar122, ptr %o.addr, align 8
  %self181 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull184 = icmp eq ptr %self181, null
  br i1 %dispatch.isnull184, label %dispatch.abort183, label %dispatch.ok182

case.abort180:                                    ; preds = %case.next162
  call void @abort()
  unreachable

dispatch.ok182:                                   ; preds = %case.match163
  %vtable.ptr185 = load ptr, ptr %self181, align 8
  %method.ptr.addr186 = getelementptr ptr, ptr %vtable.ptr185, i64 5
  %method.ptr187 = load ptr, ptr %method.ptr.addr186, align 8
  %dispatch.result188 = call ptr %method.ptr187(ptr %self181, ptr @.str.15976673952330978103)
  %self189 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull192 = icmp eq ptr %self189, null
  br i1 %dispatch.isnull192, label %dispatch.abort191, label %dispatch.ok190

dispatch.abort183:                                ; preds = %case.match163
  call void @abort()
  unreachable

dispatch.ok190:                                   ; preds = %dispatch.ok182
  %vtable.ptr193 = load ptr, ptr %self189, align 8
  %method.ptr.addr194 = getelementptr ptr, ptr %vtable.ptr193, i64 3
  %method.ptr195 = load ptr, ptr %method.ptr.addr194, align 8
  %3 = call ptr %method.ptr195(ptr %self189)
  unreachable

dispatch.abort191:                                ; preds = %dispatch.ok182
  call void @abort()
  unreachable

case.end:                                         ; preds = %dispatch.ok152, %dispatch.ok130
  %case.result = phi ptr [ %dispatch.result137, %dispatch.ok130 ], [ %dispatch.result159, %dispatch.ok152 ]
  br label %ifcont472

else196:                                          ; preds = %else114
  %self197 = load ptr, ptr %this.addr, align 8
  %char.addr198 = getelementptr i8, ptr %self197, i32 8
  %char199 = load ptr, ptr %char.addr198, align 8
  %eqtmp200 = call i1 @String.equals(ptr %char199, ptr @.str.10959529184379665549)
  br i1 %eqtmp200, label %then201, label %else248

then201:                                          ; preds = %else196
  %4 = call ptr @A.new()
  %dispatch.isnull204 = icmp eq ptr %4, null
  br i1 %dispatch.isnull204, label %dispatch.abort203, label %dispatch.ok202

dispatch.ok202:                                   ; preds = %then201
  %vtable.ptr205 = load ptr, ptr %4, align 8
  %method.ptr.addr206 = getelementptr ptr, ptr %vtable.ptr205, i64 6
  %method.ptr207 = load ptr, ptr %method.ptr.addr206, align 8
  %self208 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull211 = icmp eq ptr %self208, null
  br i1 %dispatch.isnull211, label %dispatch.abort210, label %dispatch.ok209

dispatch.abort203:                                ; preds = %then201
  call void @abort()
  unreachable

dispatch.ok209:                                   ; preds = %dispatch.ok202
  %vtable.ptr212 = load ptr, ptr %self208, align 8
  %method.ptr.addr213 = getelementptr ptr, ptr %vtable.ptr212, i64 11
  %method.ptr214 = load ptr, ptr %method.ptr.addr213, align 8
  %dispatch.result215 = call i32 %method.ptr214(ptr %self208)
  %dispatch.result216 = call ptr %method.ptr207(ptr %4, i32 %dispatch.result215)
  %self217 = load ptr, ptr %this.addr, align 8
  %a_var.addr218 = getelementptr i8, ptr %self217, i32 24
  store ptr %dispatch.result216, ptr %a_var.addr218, align 8
  %5 = call ptr @D.new()
  %dispatch.isnull221 = icmp eq ptr %5, null
  br i1 %dispatch.isnull221, label %dispatch.abort220, label %dispatch.ok219

dispatch.abort210:                                ; preds = %dispatch.ok202
  call void @abort()
  unreachable

dispatch.ok219:                                   ; preds = %dispatch.ok209
  %vtable.ptr222 = load ptr, ptr %5, align 8
  %method.ptr.addr223 = getelementptr ptr, ptr %vtable.ptr222, i64 10
  %method.ptr224 = load ptr, ptr %method.ptr.addr223, align 8
  %self225 = load ptr, ptr %this.addr, align 8
  %avar.addr226 = getelementptr i8, ptr %self225, i32 16
  %avar227 = load ptr, ptr %avar.addr226, align 8
  %dispatch.isnull230 = icmp eq ptr %avar227, null
  br i1 %dispatch.isnull230, label %dispatch.abort229, label %dispatch.ok228

dispatch.abort220:                                ; preds = %dispatch.ok209
  call void @abort()
  unreachable

dispatch.ok228:                                   ; preds = %dispatch.ok219
  %vtable.ptr231 = load ptr, ptr %avar227, align 8
  %method.ptr.addr232 = getelementptr ptr, ptr %vtable.ptr231, i64 5
  %method.ptr233 = load ptr, ptr %method.ptr.addr232, align 8
  %dispatch.result234 = call i32 %method.ptr233(ptr %avar227)
  %self235 = load ptr, ptr %this.addr, align 8
  %a_var.addr236 = getelementptr i8, ptr %self235, i32 24
  %a_var237 = load ptr, ptr %a_var.addr236, align 8
  %dispatch.isnull240 = icmp eq ptr %a_var237, null
  br i1 %dispatch.isnull240, label %dispatch.abort239, label %dispatch.ok238

dispatch.abort229:                                ; preds = %dispatch.ok219
  call void @abort()
  unreachable

dispatch.ok238:                                   ; preds = %dispatch.ok228
  %vtable.ptr241 = load ptr, ptr %a_var237, align 8
  %method.ptr.addr242 = getelementptr ptr, ptr %vtable.ptr241, i64 5
  %method.ptr243 = load ptr, ptr %method.ptr.addr242, align 8
  %dispatch.result244 = call i32 %method.ptr243(ptr %a_var237)
  %dispatch.result245 = call ptr %method.ptr224(ptr %5, i32 %dispatch.result234, i32 %dispatch.result244)
  %self246 = load ptr, ptr %this.addr, align 8
  %avar.addr247 = getelementptr i8, ptr %self246, i32 16
  store ptr %dispatch.result245, ptr %avar.addr247, align 8
  br label %ifcont470

dispatch.abort239:                                ; preds = %dispatch.ok228
  call void @abort()
  unreachable

else248:                                          ; preds = %else196
  %self249 = load ptr, ptr %this.addr, align 8
  %char.addr250 = getelementptr i8, ptr %self249, i32 8
  %char251 = load ptr, ptr %char.addr250, align 8
  %eqtmp252 = call i1 @String.equals(ptr %char251, ptr @.str.14494284460613645429)
  br i1 %eqtmp252, label %then253, label %else266

then253:                                          ; preds = %else248
  %6 = call ptr @C.new()
  %static.dispatch.isnull = icmp eq ptr %6, null
  br i1 %static.dispatch.isnull, label %static.dispatch.abort, label %static.dispatch.ok

static.dispatch.ok:                               ; preds = %then253
  %self254 = load ptr, ptr %this.addr, align 8
  %avar.addr255 = getelementptr i8, ptr %self254, i32 16
  %avar256 = load ptr, ptr %avar.addr255, align 8
  %dispatch.isnull259 = icmp eq ptr %avar256, null
  br i1 %dispatch.isnull259, label %dispatch.abort258, label %dispatch.ok257

static.dispatch.abort:                            ; preds = %then253
  call void @abort()
  unreachable

dispatch.ok257:                                   ; preds = %static.dispatch.ok
  %vtable.ptr260 = load ptr, ptr %avar256, align 8
  %method.ptr.addr261 = getelementptr ptr, ptr %vtable.ptr260, i64 5
  %method.ptr262 = load ptr, ptr %method.ptr.addr261, align 8
  %dispatch.result263 = call i32 %method.ptr262(ptr %avar256)
  %7 = call ptr @A.method5(ptr %6, i32 %dispatch.result263)
  %self264 = load ptr, ptr %this.addr, align 8
  %avar.addr265 = getelementptr i8, ptr %self264, i32 16
  store ptr %7, ptr %avar.addr265, align 8
  br label %ifcont468

dispatch.abort258:                                ; preds = %static.dispatch.ok
  call void @abort()
  unreachable

else266:                                          ; preds = %else248
  %self267 = load ptr, ptr %this.addr, align 8
  %char.addr268 = getelementptr i8, ptr %self267, i32 8
  %char269 = load ptr, ptr %char.addr268, align 8
  %eqtmp270 = call i1 @String.equals(ptr %char269, ptr @.str.2540012008095083820)
  br i1 %eqtmp270, label %then271, label %else287

then271:                                          ; preds = %else266
  %8 = call ptr @C.new()
  %static.dispatch.isnull274 = icmp eq ptr %8, null
  br i1 %static.dispatch.isnull274, label %static.dispatch.abort273, label %static.dispatch.ok272

static.dispatch.ok272:                            ; preds = %then271
  %self275 = load ptr, ptr %this.addr, align 8
  %avar.addr276 = getelementptr i8, ptr %self275, i32 16
  %avar277 = load ptr, ptr %avar.addr276, align 8
  %dispatch.isnull280 = icmp eq ptr %avar277, null
  br i1 %dispatch.isnull280, label %dispatch.abort279, label %dispatch.ok278

static.dispatch.abort273:                         ; preds = %then271
  call void @abort()
  unreachable

dispatch.ok278:                                   ; preds = %static.dispatch.ok272
  %vtable.ptr281 = load ptr, ptr %avar277, align 8
  %method.ptr.addr282 = getelementptr ptr, ptr %vtable.ptr281, i64 5
  %method.ptr283 = load ptr, ptr %method.ptr.addr282, align 8
  %dispatch.result284 = call i32 %method.ptr283(ptr %avar277)
  %9 = call ptr @B.method5(ptr %8, i32 %dispatch.result284)
  %self285 = load ptr, ptr %this.addr, align 8
  %avar.addr286 = getelementptr i8, ptr %self285, i32 16
  store ptr %9, ptr %avar.addr286, align 8
  br label %ifcont466

dispatch.abort279:                                ; preds = %static.dispatch.ok272
  call void @abort()
  unreachable

else287:                                          ; preds = %else266
  %self288 = load ptr, ptr %this.addr, align 8
  %char.addr289 = getelementptr i8, ptr %self288, i32 8
  %char290 = load ptr, ptr %char.addr289, align 8
  %eqtmp291 = call i1 @String.equals(ptr %char290, ptr @.str.8968846175329310707)
  br i1 %eqtmp291, label %then292, label %else308

then292:                                          ; preds = %else287
  %10 = call ptr @C.new()
  %static.dispatch.isnull295 = icmp eq ptr %10, null
  br i1 %static.dispatch.isnull295, label %static.dispatch.abort294, label %static.dispatch.ok293

static.dispatch.ok293:                            ; preds = %then292
  %self296 = load ptr, ptr %this.addr, align 8
  %avar.addr297 = getelementptr i8, ptr %self296, i32 16
  %avar298 = load ptr, ptr %avar.addr297, align 8
  %dispatch.isnull301 = icmp eq ptr %avar298, null
  br i1 %dispatch.isnull301, label %dispatch.abort300, label %dispatch.ok299

static.dispatch.abort294:                         ; preds = %then292
  call void @abort()
  unreachable

dispatch.ok299:                                   ; preds = %static.dispatch.ok293
  %vtable.ptr302 = load ptr, ptr %avar298, align 8
  %method.ptr.addr303 = getelementptr ptr, ptr %vtable.ptr302, i64 5
  %method.ptr304 = load ptr, ptr %method.ptr.addr303, align 8
  %dispatch.result305 = call i32 %method.ptr304(ptr %avar298)
  %11 = call ptr @C.method5(ptr %10, i32 %dispatch.result305)
  %self306 = load ptr, ptr %this.addr, align 8
  %avar.addr307 = getelementptr i8, ptr %self306, i32 16
  store ptr %11, ptr %avar.addr307, align 8
  br label %ifcont464

dispatch.abort300:                                ; preds = %static.dispatch.ok293
  call void @abort()
  unreachable

else308:                                          ; preds = %else287
  %self309 = load ptr, ptr %this.addr, align 8
  %char.addr310 = getelementptr i8, ptr %self309, i32 8
  %char311 = load ptr, ptr %char.addr310, align 8
  %eqtmp312 = call i1 @String.equals(ptr %char311, ptr @.str.11539147918811572172)
  br i1 %eqtmp312, label %then313, label %else422

then313:                                          ; preds = %else308
  %x = alloca ptr, align 8
  store ptr null, ptr %x, align 8
  %12 = call ptr @E.new()
  %dispatch.isnull316 = icmp eq ptr %12, null
  br i1 %dispatch.isnull316, label %dispatch.abort315, label %dispatch.ok314

dispatch.ok314:                                   ; preds = %then313
  %vtable.ptr317 = load ptr, ptr %12, align 8
  %method.ptr.addr318 = getelementptr ptr, ptr %vtable.ptr317, i64 13
  %method.ptr319 = load ptr, ptr %method.ptr.addr318, align 8
  %self320 = load ptr, ptr %this.addr, align 8
  %avar.addr321 = getelementptr i8, ptr %self320, i32 16
  %avar322 = load ptr, ptr %avar.addr321, align 8
  %dispatch.isnull325 = icmp eq ptr %avar322, null
  br i1 %dispatch.isnull325, label %dispatch.abort324, label %dispatch.ok323

dispatch.abort315:                                ; preds = %then313
  call void @abort()
  unreachable

dispatch.ok323:                                   ; preds = %dispatch.ok314
  %vtable.ptr326 = load ptr, ptr %avar322, align 8
  %method.ptr.addr327 = getelementptr ptr, ptr %vtable.ptr326, i64 5
  %method.ptr328 = load ptr, ptr %method.ptr.addr327, align 8
  %dispatch.result329 = call i32 %method.ptr328(ptr %avar322)
  %dispatch.result330 = call ptr %method.ptr319(ptr %12, i32 %dispatch.result329)
  store ptr %dispatch.result330, ptr %x, align 8
  %r = alloca i32, align 4
  %self331 = load ptr, ptr %this.addr, align 8
  %avar.addr332 = getelementptr i8, ptr %self331, i32 16
  %avar333 = load ptr, ptr %avar.addr332, align 8
  %dispatch.isnull336 = icmp eq ptr %avar333, null
  br i1 %dispatch.isnull336, label %dispatch.abort335, label %dispatch.ok334

dispatch.abort324:                                ; preds = %dispatch.ok314
  call void @abort()
  unreachable

dispatch.ok334:                                   ; preds = %dispatch.ok323
  %vtable.ptr337 = load ptr, ptr %avar333, align 8
  %method.ptr.addr338 = getelementptr ptr, ptr %vtable.ptr337, i64 5
  %method.ptr339 = load ptr, ptr %method.ptr.addr338, align 8
  %dispatch.result340 = call i32 %method.ptr339(ptr %avar333)
  %x341 = load ptr, ptr %x, align 8
  %dispatch.isnull344 = icmp eq ptr %x341, null
  br i1 %dispatch.isnull344, label %dispatch.abort343, label %dispatch.ok342

dispatch.abort335:                                ; preds = %dispatch.ok323
  call void @abort()
  unreachable

dispatch.ok342:                                   ; preds = %dispatch.ok334
  %vtable.ptr345 = load ptr, ptr %x341, align 8
  %method.ptr.addr346 = getelementptr ptr, ptr %vtable.ptr345, i64 5
  %method.ptr347 = load ptr, ptr %method.ptr.addr346, align 8
  %dispatch.result348 = call i32 %method.ptr347(ptr %x341)
  %multmp = mul i32 %dispatch.result348, 8
  %subtmp = sub i32 %dispatch.result340, %multmp
  store i32 %subtmp, ptr %r, align 4
  %self349 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull352 = icmp eq ptr %self349, null
  br i1 %dispatch.isnull352, label %dispatch.abort351, label %dispatch.ok350

dispatch.abort343:                                ; preds = %dispatch.ok334
  call void @abort()
  unreachable

dispatch.ok350:                                   ; preds = %dispatch.ok342
  %vtable.ptr353 = load ptr, ptr %self349, align 8
  %method.ptr.addr354 = getelementptr ptr, ptr %vtable.ptr353, i64 5
  %method.ptr355 = load ptr, ptr %method.ptr.addr354, align 8
  %dispatch.result356 = call ptr %method.ptr355(ptr %self349, ptr @.str.1187902871956776895)
  %self357 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull360 = icmp eq ptr %self357, null
  br i1 %dispatch.isnull360, label %dispatch.abort359, label %dispatch.ok358

dispatch.abort351:                                ; preds = %dispatch.ok342
  call void @abort()
  unreachable

dispatch.ok358:                                   ; preds = %dispatch.ok350
  %vtable.ptr361 = load ptr, ptr %self357, align 8
  %method.ptr.addr362 = getelementptr ptr, ptr %vtable.ptr361, i64 14
  %method.ptr363 = load ptr, ptr %method.ptr.addr362, align 8
  %self364 = load ptr, ptr %this.addr, align 8
  %avar.addr365 = getelementptr i8, ptr %self364, i32 16
  %avar366 = load ptr, ptr %avar.addr365, align 8
  %dispatch.result367 = call ptr %method.ptr363(ptr %self357, ptr %avar366)
  %self368 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull371 = icmp eq ptr %self368, null
  br i1 %dispatch.isnull371, label %dispatch.abort370, label %dispatch.ok369

dispatch.abort359:                                ; preds = %dispatch.ok350
  call void @abort()
  unreachable

dispatch.ok369:                                   ; preds = %dispatch.ok358
  %vtable.ptr372 = load ptr, ptr %self368, align 8
  %method.ptr.addr373 = getelementptr ptr, ptr %vtable.ptr372, i64 5
  %method.ptr374 = load ptr, ptr %method.ptr.addr373, align 8
  %dispatch.result375 = call ptr %method.ptr374(ptr %self368, ptr @.str.15037267644295846719)
  %self376 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull379 = icmp eq ptr %self376, null
  br i1 %dispatch.isnull379, label %dispatch.abort378, label %dispatch.ok377

dispatch.abort370:                                ; preds = %dispatch.ok358
  call void @abort()
  unreachable

dispatch.ok377:                                   ; preds = %dispatch.ok369
  %vtable.ptr380 = load ptr, ptr %self376, align 8
  %method.ptr.addr381 = getelementptr ptr, ptr %vtable.ptr380, i64 14
  %method.ptr382 = load ptr, ptr %method.ptr.addr381, align 8
  %x383 = load ptr, ptr %x, align 8
  %dispatch.result384 = call ptr %method.ptr382(ptr %self376, ptr %x383)
  %self385 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull388 = icmp eq ptr %self385, null
  br i1 %dispatch.isnull388, label %dispatch.abort387, label %dispatch.ok386

dispatch.abort378:                                ; preds = %dispatch.ok369
  call void @abort()
  unreachable

dispatch.ok386:                                   ; preds = %dispatch.ok377
  %vtable.ptr389 = load ptr, ptr %self385, align 8
  %method.ptr.addr390 = getelementptr ptr, ptr %vtable.ptr389, i64 5
  %method.ptr391 = load ptr, ptr %method.ptr.addr390, align 8
  %dispatch.result392 = call ptr %method.ptr391(ptr %self385, ptr @.str.15336703179750707214)
  %a393 = alloca ptr, align 8
  %13 = call ptr @A2I.new()
  store ptr %13, ptr %a393, align 8
  %self394 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull397 = icmp eq ptr %self394, null
  br i1 %dispatch.isnull397, label %dispatch.abort396, label %dispatch.ok395

dispatch.abort387:                                ; preds = %dispatch.ok377
  call void @abort()
  unreachable

dispatch.ok395:                                   ; preds = %dispatch.ok386
  %vtable.ptr398 = load ptr, ptr %self394, align 8
  %method.ptr.addr399 = getelementptr ptr, ptr %vtable.ptr398, i64 5
  %method.ptr400 = load ptr, ptr %method.ptr.addr399, align 8
  %a401 = load ptr, ptr %a393, align 8
  %dispatch.isnull404 = icmp eq ptr %a401, null
  br i1 %dispatch.isnull404, label %dispatch.abort403, label %dispatch.ok402

dispatch.abort396:                                ; preds = %dispatch.ok386
  call void @abort()
  unreachable

dispatch.ok402:                                   ; preds = %dispatch.ok395
  %vtable.ptr405 = load ptr, ptr %a401, align 8
  %method.ptr.addr406 = getelementptr ptr, ptr %vtable.ptr405, i64 9
  %method.ptr407 = load ptr, ptr %method.ptr.addr406, align 8
  %r408 = load i32, ptr %r, align 4
  %dispatch.result409 = call ptr %method.ptr407(ptr %a401, i32 %r408)
  %dispatch.result410 = call ptr %method.ptr400(ptr %self394, ptr %dispatch.result409)
  %self411 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull414 = icmp eq ptr %self411, null
  br i1 %dispatch.isnull414, label %dispatch.abort413, label %dispatch.ok412

dispatch.abort403:                                ; preds = %dispatch.ok395
  call void @abort()
  unreachable

dispatch.ok412:                                   ; preds = %dispatch.ok402
  %vtable.ptr415 = load ptr, ptr %self411, align 8
  %method.ptr.addr416 = getelementptr ptr, ptr %vtable.ptr415, i64 5
  %method.ptr417 = load ptr, ptr %method.ptr.addr416, align 8
  %dispatch.result418 = call ptr %method.ptr417(ptr %self411, ptr @.str.18400681194753865968)
  %x419 = load ptr, ptr %x, align 8
  %self420 = load ptr, ptr %this.addr, align 8
  %avar.addr421 = getelementptr i8, ptr %self420, i32 16
  store ptr %x419, ptr %avar.addr421, align 8
  br label %ifcont462

dispatch.abort413:                                ; preds = %dispatch.ok402
  call void @abort()
  unreachable

else422:                                          ; preds = %else308
  %self423 = load ptr, ptr %this.addr, align 8
  %char.addr424 = getelementptr i8, ptr %self423, i32 8
  %char425 = load ptr, ptr %char.addr424, align 8
  %eqtmp426 = call i1 @String.equals(ptr %char425, ptr @.str.10485857595211860659)
  br i1 %eqtmp426, label %then427, label %else430

then427:                                          ; preds = %else422
  %14 = call ptr @A.new()
  %self428 = load ptr, ptr %this.addr, align 8
  %avar.addr429 = getelementptr i8, ptr %self428, i32 16
  store ptr %14, ptr %avar.addr429, align 8
  br label %ifcont460

else430:                                          ; preds = %else422
  %self431 = load ptr, ptr %this.addr, align 8
  %char.addr432 = getelementptr i8, ptr %self431, i32 8
  %char433 = load ptr, ptr %char.addr432, align 8
  %eqtmp434 = call i1 @String.equals(ptr %char433, ptr @.str.747352984659061831)
  br i1 %eqtmp434, label %then435, label %else438

then435:                                          ; preds = %else430
  %self436 = load ptr, ptr %this.addr, align 8
  %flag.addr437 = getelementptr i8, ptr %self436, i32 32
  store i1 false, ptr %flag.addr437, align 1
  br label %ifcont458

else438:                                          ; preds = %else430
  %15 = call ptr @A.new()
  %dispatch.isnull441 = icmp eq ptr %15, null
  br i1 %dispatch.isnull441, label %dispatch.abort440, label %dispatch.ok439

dispatch.ok439:                                   ; preds = %else438
  %vtable.ptr442 = load ptr, ptr %15, align 8
  %method.ptr.addr443 = getelementptr ptr, ptr %vtable.ptr442, i64 7
  %method.ptr444 = load ptr, ptr %method.ptr.addr443, align 8
  %self445 = load ptr, ptr %this.addr, align 8
  %avar.addr446 = getelementptr i8, ptr %self445, i32 16
  %avar447 = load ptr, ptr %avar.addr446, align 8
  %dispatch.isnull450 = icmp eq ptr %avar447, null
  br i1 %dispatch.isnull450, label %dispatch.abort449, label %dispatch.ok448

dispatch.abort440:                                ; preds = %else438
  call void @abort()
  unreachable

dispatch.ok448:                                   ; preds = %dispatch.ok439
  %vtable.ptr451 = load ptr, ptr %avar447, align 8
  %method.ptr.addr452 = getelementptr ptr, ptr %vtable.ptr451, i64 5
  %method.ptr453 = load ptr, ptr %method.ptr.addr452, align 8
  %dispatch.result454 = call i32 %method.ptr453(ptr %avar447)
  %dispatch.result455 = call ptr %method.ptr444(ptr %15, i32 %dispatch.result454)
  %self456 = load ptr, ptr %this.addr, align 8
  %avar.addr457 = getelementptr i8, ptr %self456, i32 16
  store ptr %dispatch.result455, ptr %avar.addr457, align 8
  br label %ifcont458

dispatch.abort449:                                ; preds = %dispatch.ok439
  call void @abort()
  unreachable

ifcont458:                                        ; preds = %dispatch.ok448, %then435
  %cond_result459 = phi ptr [ null, %then435 ], [ %dispatch.result455, %dispatch.ok448 ]
  br label %ifcont460

ifcont460:                                        ; preds = %ifcont458, %then427
  %cond_result461 = phi ptr [ %14, %then427 ], [ %cond_result459, %ifcont458 ]
  br label %ifcont462

ifcont462:                                        ; preds = %ifcont460, %dispatch.ok412
  %cond_result463 = phi ptr [ %x419, %dispatch.ok412 ], [ %cond_result461, %ifcont460 ]
  br label %ifcont464

ifcont464:                                        ; preds = %ifcont462, %dispatch.ok299
  %cond_result465 = phi ptr [ %11, %dispatch.ok299 ], [ %cond_result463, %ifcont462 ]
  br label %ifcont466

ifcont466:                                        ; preds = %ifcont464, %dispatch.ok278
  %cond_result467 = phi ptr [ %9, %dispatch.ok278 ], [ %cond_result465, %ifcont464 ]
  br label %ifcont468

ifcont468:                                        ; preds = %ifcont466, %dispatch.ok257
  %cond_result469 = phi ptr [ %7, %dispatch.ok257 ], [ %cond_result467, %ifcont466 ]
  br label %ifcont470

ifcont470:                                        ; preds = %ifcont468, %dispatch.ok238
  %cond_result471 = phi ptr [ %dispatch.result245, %dispatch.ok238 ], [ %cond_result469, %ifcont468 ]
  br label %ifcont472

ifcont472:                                        ; preds = %ifcont470, %case.end
  %cond_result473 = phi ptr [ %case.result, %case.end ], [ %cond_result471, %ifcont470 ]
  br label %ifcont474

ifcont474:                                        ; preds = %ifcont472, %dispatch.ok104
  %cond_result475 = phi ptr [ %dispatch.result111, %dispatch.ok104 ], [ %cond_result473, %ifcont472 ]
  br label %loop.cond
}

define void @_ZN1AC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.A, ptr %this, i32 0, i32 0
  call void @_ZN6ObjectC2Ev(ptr %parent.subobject)
  store ptr @_ZTV1A, ptr %this, align 8
  %this.addr1 = getelementptr inbounds %class.A, ptr %this, i32 0, i32 1
  store i32 0, ptr %this.addr1, align 4
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
  %this.addr1 = getelementptr inbounds %class.B, ptr %this, i32 0, i32 1
  store i32 0, ptr %this.addr1, align 4
  ret void
}

define ptr @B.new() {
entry:
  %0 = call ptr @malloc(i64 24)
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
  %0 = call ptr @malloc(i64 24)
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
  %0 = call ptr @malloc(i64 24)
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
  %0 = call ptr @malloc(i64 24)
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
  %this.addr1 = getelementptr inbounds %class.Main, ptr %this, i32 0, i32 1
  store ptr null, ptr %this.addr1, align 8
  %this.addr2 = getelementptr inbounds %class.Main, ptr %this, i32 0, i32 2
  store ptr null, ptr %this.addr2, align 8
  %this.addr3 = getelementptr inbounds %class.Main, ptr %this, i32 0, i32 3
  store ptr null, ptr %this.addr3, align 8
  %this.addr4 = getelementptr inbounds %class.Main, ptr %this, i32 0, i32 4
  store i1 true, ptr %this.addr4, align 1
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