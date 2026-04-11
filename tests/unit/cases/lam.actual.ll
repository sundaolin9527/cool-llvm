; ModuleID = 'main_module'
source_filename = "main_module"

%struct.__cxxabiv1.__class_type_info = type { ptr, ptr }
%struct.__cxxabiv1.__si_class_type_info = type { ptr, ptr, ptr }
%class.Int = type { %class.Object.0, i32, [4 x i8] }
%class.Object.0 = type { ptr }
%class.Bool = type { %class.Object.0, i1, [7 x i8] }
%class.String = type { %class.Object.0, ptr, i32, [4 x i8], i32, [4 x i8] }
%class.IO.1 = type { %class.Object.0 }
%class.VarList = type { %class.IO.1 }
%class.VarListNE = type { %class.VarList, ptr, ptr }
%class.LambdaList = type { %class.Object.0 }
%class.LambdaListNE = type { %class.LambdaList, ptr, i32, [4 x i8], ptr, ptr }
%class.LambdaListRef = type { %class.Object.0, i32, [4 x i8], ptr }
%class.Expr = type { %class.IO.1 }
%class.Variable = type { %class.Expr, ptr }
%class.Lambda = type { %class.Expr, ptr, ptr }
%class.App = type { %class.Expr, ptr, ptr }
%class.Term = type { %class.IO.1 }
%class.Main = type { %class.Term }

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
@_ZTS7VarList = linkonce_odr constant [9 x i8] c"7VarList\00", align 1
@_ZTI7VarList = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS7VarList, ptr @_ZTI2IO }, align 8
@_ZTV7VarList = linkonce_odr constant [14 x ptr] [ptr null, ptr @_ZTI7VarList, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @VarList.isNil, ptr @VarList.head, ptr @VarList.tail, ptr @VarList.add, ptr @VarList.print], align 8
@_ZTS9VarListNE = linkonce_odr constant [11 x i8] c"9VarListNE\00", align 1
@_ZTI9VarListNE = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS9VarListNE, ptr @_ZTI7VarList }, align 8
@_ZTV9VarListNE = linkonce_odr constant [15 x ptr] [ptr null, ptr @_ZTI9VarListNE, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @VarListNE.isNil, ptr @VarListNE.head, ptr @VarListNE.tail, ptr @VarList.add, ptr @VarListNE.print, ptr @VarListNE.init], align 8
@_ZTS10LambdaList = linkonce_odr constant [13 x i8] c"10LambdaList\00", align 1
@_ZTI10LambdaList = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS10LambdaList, ptr @_ZTI6Object }, align 8
@_ZTV10LambdaList = linkonce_odr constant [11 x ptr] [ptr null, ptr @_ZTI10LambdaList, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @LambdaList.isNil, ptr @LambdaList.headE, ptr @LambdaList.headC, ptr @LambdaList.headN, ptr @LambdaList.tail, ptr @LambdaList.add], align 8
@_ZTS12LambdaListNE = linkonce_odr constant [15 x i8] c"12LambdaListNE\00", align 1
@_ZTI12LambdaListNE = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS12LambdaListNE, ptr @_ZTI10LambdaList }, align 8
@_ZTV12LambdaListNE = linkonce_odr constant [12 x ptr] [ptr null, ptr @_ZTI12LambdaListNE, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @LambdaListNE.isNil, ptr @LambdaListNE.headE, ptr @LambdaListNE.headC, ptr @LambdaListNE.headN, ptr @LambdaListNE.tail, ptr @LambdaList.add, ptr @LambdaListNE.init], align 8
@_ZTS13LambdaListRef = linkonce_odr constant [16 x i8] c"13LambdaListRef\00", align 1
@_ZTI13LambdaListRef = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS13LambdaListRef, ptr @_ZTI6Object }, align 8
@_ZTV13LambdaListRef = linkonce_odr constant [12 x ptr] [ptr null, ptr @_ZTI13LambdaListRef, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @LambdaListRef.isNil, ptr @LambdaListRef.headE, ptr @LambdaListRef.headC, ptr @LambdaListRef.headN, ptr @LambdaListRef.reset, ptr @LambdaListRef.add, ptr @LambdaListRef.removeHead], align 8
@_ZTS4Expr = linkonce_odr constant [6 x i8] c"4Expr\00", align 1
@_ZTI4Expr = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Expr, ptr @_ZTI2IO }, align 8
@_ZTV4Expr = linkonce_odr constant [13 x ptr] [ptr null, ptr @_ZTI4Expr, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Expr.print_self, ptr @Expr.beta, ptr @Expr.substitute, ptr @Expr.gen_code], align 8
@_ZTS8Variable = linkonce_odr constant [10 x i8] c"8Variable\00", align 1
@_ZTI8Variable = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS8Variable, ptr @_ZTI4Expr }, align 8
@_ZTV8Variable = linkonce_odr constant [14 x ptr] [ptr null, ptr @_ZTI8Variable, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Variable.print_self, ptr @Variable.beta, ptr @Variable.substitute, ptr @Variable.gen_code, ptr @Variable.init], align 8
@_ZTS6Lambda = linkonce_odr constant [8 x i8] c"6Lambda\00", align 1
@_ZTI6Lambda = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS6Lambda, ptr @_ZTI4Expr }, align 8
@_ZTV6Lambda = linkonce_odr constant [16 x ptr] [ptr null, ptr @_ZTI6Lambda, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Lambda.print_self, ptr @Lambda.beta, ptr @Lambda.substitute, ptr @Lambda.gen_code, ptr @Lambda.init, ptr @Lambda.apply, ptr @Lambda.gen_closure_code], align 8
@_ZTS3App = linkonce_odr constant [5 x i8] c"3App\00", align 1
@_ZTI3App = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS3App, ptr @_ZTI4Expr }, align 8
@_ZTV3App = linkonce_odr constant [14 x ptr] [ptr null, ptr @_ZTI3App, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @App.print_self, ptr @App.beta, ptr @App.substitute, ptr @App.gen_code, ptr @App.init], align 8
@_ZTS4Term = linkonce_odr constant [6 x i8] c"4Term\00", align 1
@_ZTI4Term = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Term, ptr @_ZTI2IO }, align 8
@_ZTV4Term = linkonce_odr constant [15 x ptr] [ptr null, ptr @_ZTI4Term, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Term.var, ptr @Term.lam, ptr @Term.app, ptr @Term.i, ptr @Term.k, ptr @Term.s], align 8
@_ZTS4Main = linkonce_odr constant [6 x i8] c"4Main\00", align 1
@_ZTI4Main = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Main, ptr @_ZTI4Term }, align 8
@_ZTV4Main = linkonce_odr constant [20 x ptr] [ptr null, ptr @_ZTI4Main, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Term.var, ptr @Term.lam, ptr @Term.app, ptr @Term.i, ptr @Term.k, ptr @Term.s, ptr @Main.beta_reduce, ptr @Main.eval_class, ptr @Main.closure_class, ptr @Main.gen_code, ptr @Main.main], align 8
@.str.18400681194753865968 = private constant [2 x i8] c"\0A\00"
@.str.17934988915447438835 = private constant [2 x i8] c" \00"
@.str.12186846601057835936 = private constant [48 x i8] c"\0AError: Expr is pure virtual; can't print self\0A\00"
@.str.17685852440332713262 = private constant [49 x i8] c"\0AError: Expr is pure virtual; can't beta-reduce\0A\00"
@.str.12200006661317483695 = private constant [48 x i8] c"\0AError: Expr is pure virtual; can't substitute\0A\00"
@.str.3189073882171820518 = private constant [46 x i8] c"\0AError: Expr is pure virtual; can't gen_code\0A\00"
@.str.17730896828212622792 = private constant [14 x i8] c"get_parent().\00"
@.str.14653889881731406450 = private constant [28 x i8] c"Error:  free occurrence of \00"
@.str.13284806743914967967 = private constant [8 x i8] c"get_x()\00"
@.str.12541758908481966010 = private constant [2 x i8] c"\\\00"
@.str.15099569138734304119 = private constant [2 x i8] c".\00"
@.str.13123305654767940980 = private constant [14 x i8] c"((new Closure\00"
@.str.5793906371712553756 = private constant [8 x i8] c").init(\00"
@.str.6960962414463079127 = private constant [14 x i8] c"new Closure))\00"
@.str.4783047712059283627 = private constant [7 x i8] c"self))\00"
@.str.4438221701991650061 = private constant [14 x i8] c"class Closure\00"
@.str.13132597237450073676 = private constant [21 x i8] c" inherits Closure {\0A\00"
@.str.1622691923872969250 = private constant [40 x i8] c"  apply(y : EvalObject) : EvalObject {\0A\00"
@.str.17497182908930847761 = private constant [36 x i8] c"    { out_string(\22Applying closure \00"
@.str.8278817361954948235 = private constant [7 x i8] c"\\n\22);\0A\00"
@.str.17271316148737701812 = private constant [15 x i8] c"      x <- y;\0A\00"
@.str.6272164506702699522 = private constant [6 x i8] c";}};\0A\00"
@.str.5250540665876017389 = private constant [4 x i8] c"};\0A\00"
@.str.16400187016935417045 = private constant [3 x i8] c"((\00"
@.str.9143335575124758599 = private constant [4 x i8] c")@(\00"
@.str.2584822283668855122 = private constant [3 x i8] c"))\00"
@.str.3295041690608701107 = private constant [24 x i8] c"(let x : EvalObject <- \00"
@.str.4246255312936368446 = private constant [3 x i8] c",\0A\00"
@.str.7003202724348968002 = private constant [24 x i8] c"     y : EvalObject <- \00"
@.str.5300866883985441106 = private constant [5 x i8] c" in\0A\00"
@.str.8338520256210774706 = private constant [13 x i8] c"  case x of\0A\00"
@.str.14790904847336938787 = private constant [32 x i8] c"    c : Closure => c.apply(y);\0A\00"
@.str.13537854679560670851 = private constant [49 x i8] c"    o : Object => { abort(); new EvalObject; };\0A\00"
@.str.2135580321292951229 = private constant [8 x i8] c"  esac)\00"
@.str.13272411544345499535 = private constant [2 x i8] c"x\00"
@.str.15160494916537613830 = private constant [2 x i8] c"y\00"
@.str.17970277606898470454 = private constant [2 x i8] c"z\00"
@.str.8442259972690638296 = private constant [14 x i8] c"beta-reduce: \00"
@.str.10562876100737056951 = private constant [5 x i8] c" =>\0A\00"
@.str.6331855955268116325 = private constant [32 x i8] c"class EvalObject inherits IO {\0A\00"
@.str.2850205699837169304 = private constant [47 x i8] c"  eval() : EvalObject { { abort(); self; } };\0A\00"
@.str.14140416003148633814 = private constant [37 x i8] c"class Closure inherits EvalObject {\0A\00"
@.str.5555451288312873212 = private constant [21 x i8] c"  parent : Closure;\0A\00"
@.str.5574883564319458106 = private constant [19 x i8] c"  x : EvalObject;\0A\00"
@.str.10263194760683832919 = private constant [38 x i8] c"  get_parent() : Closure { parent };\0A\00"
@.str.11586084180363632084 = private constant [31 x i8] c"  get_x() : EvalObject { x };\0A\00"
@.str.3510506908404628057 = private constant [57 x i8] c"  init(p : Closure) : Closure {{ parent <- p; self; }};\0A\00"
@.str.3273516919774520550 = private constant [62 x i8] c"  apply(y : EvalObject) : EvalObject { { abort(); self; } };\0A\00"
@.str.788317370539978547 = private constant [21 x i8] c"Generating code for \00"
@.str.17456050816934443332 = private constant [47 x i8] c"\0A------------------cut here------------------\0A\00"
@.str.10465691284004345273 = private constant [51 x i8] c"(*Generated by lam.cl (Jeff Foster, March 2000)*)\0A\00"
@.str.8727090228760159220 = private constant [14 x i8] c"class Main {\0A\00"
@.str.4818194514738728155 = private constant [25 x i8] c"  main() : EvalObject {\0A\00"
@.str.3599069525930029565 = private constant [8 x i8] c"\0A};\0A};\0A\00"

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

define i1 @VarList.isNil(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  ret i1 true
}

define ptr @VarList.head(ptr %this) {
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

define ptr @VarList.tail(ptr %this) {
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

define ptr @VarList.add(ptr %this, ptr %x) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %x, ptr %x.addr, align 8
  %VarListNE.newtmp = call ptr @VarListNE.new()
  %dispatch.isnull = icmp eq ptr %VarListNE.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %VarListNE.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 14
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x1 = load ptr, ptr %x.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %VarListNE.newtmp, ptr %x1, ptr %self)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @VarList.print(ptr %this) {
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

define i1 @VarListNE.isNil(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  ret i1 false
}

define ptr @VarListNE.head(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %x.addr = getelementptr i8, ptr %self, i32 8
  %x = load ptr, ptr %x.addr, align 8
  ret ptr %x
}

define ptr @VarListNE.tail(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %rest.addr = getelementptr i8, ptr %self, i32 16
  %rest = load ptr, ptr %rest.addr, align 8
  ret ptr %rest
}

define ptr @VarListNE.init(ptr %this, ptr %y, ptr %r) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %y.addr = alloca ptr, align 8
  store ptr %y, ptr %y.addr, align 8
  %r.addr = alloca ptr, align 8
  store ptr %r, ptr %r.addr, align 8
  %y1 = load ptr, ptr %y.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %x.addr = getelementptr i8, ptr %self, i32 8
  store ptr %y1, ptr %x.addr, align 8
  %r2 = load ptr, ptr %r.addr, align 8
  %self3 = load ptr, ptr %this.addr, align 8
  %rest.addr = getelementptr i8, ptr %self3, i32 16
  store ptr %r2, ptr %rest.addr, align 8
  %self4 = load ptr, ptr %this.addr, align 8
  ret ptr %self4
}

define ptr @VarListNE.print(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %x.addr = getelementptr i8, ptr %self, i32 8
  %x = load ptr, ptr %x.addr, align 8
  %dispatch.isnull = icmp eq ptr %x, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %x, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 9
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %x)
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
  %dispatch.result8 = call ptr %method.ptr7(ptr %self1, ptr @.str.17934988915447438835)
  %self9 = load ptr, ptr %this.addr, align 8
  %rest.addr = getelementptr i8, ptr %self9, i32 16
  %rest = load ptr, ptr %rest.addr, align 8
  %dispatch.isnull12 = icmp eq ptr %rest, null
  br i1 %dispatch.isnull12, label %dispatch.abort11, label %dispatch.ok10

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok10:                                    ; preds = %dispatch.ok2
  %vtable.ptr13 = load ptr, ptr %rest, align 8
  %method.ptr.addr14 = getelementptr ptr, ptr %vtable.ptr13, i64 13
  %method.ptr15 = load ptr, ptr %method.ptr.addr14, align 8
  %dispatch.result16 = call ptr %method.ptr15(ptr %rest)
  %self17 = load ptr, ptr %this.addr, align 8
  ret ptr %self17

dispatch.abort11:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable
}

define i1 @LambdaList.isNil(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  ret i1 true
}

define ptr @LambdaList.headE(ptr %this) {
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

define ptr @LambdaList.headC(ptr %this) {
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

define i32 @LambdaList.headN(ptr %this) {
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

define ptr @LambdaList.tail(ptr %this) {
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

define ptr @LambdaList.add(ptr %this, ptr %e, ptr %x, i32 %n) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %e.addr = alloca ptr, align 8
  store ptr %e, ptr %e.addr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %x, ptr %x.addr, align 8
  %n.addr = alloca i32, align 4
  store i32 %n, ptr %n.addr, align 4
  %LambdaListNE.newtmp = call ptr @LambdaListNE.new()
  %dispatch.isnull = icmp eq ptr %LambdaListNE.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %LambdaListNE.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 11
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %e1 = load ptr, ptr %e.addr, align 8
  %x2 = load ptr, ptr %x.addr, align 8
  %n3 = load i32, ptr %n.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %LambdaListNE.newtmp, ptr %e1, ptr %x2, i32 %n3, ptr %self)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define i1 @LambdaListNE.isNil(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  ret i1 false
}

define ptr @LambdaListNE.headE(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %env.addr = getelementptr i8, ptr %self, i32 24
  %env = load ptr, ptr %env.addr, align 8
  ret ptr %env
}

define ptr @LambdaListNE.headC(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %lam.addr = getelementptr i8, ptr %self, i32 8
  %lam = load ptr, ptr %lam.addr, align 8
  ret ptr %lam
}

define i32 @LambdaListNE.headN(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %num.addr = getelementptr i8, ptr %self, i32 16
  %num = load i32, ptr %num.addr, align 4
  ret i32 %num
}

define ptr @LambdaListNE.tail(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %rest.addr = getelementptr i8, ptr %self, i32 32
  %rest = load ptr, ptr %rest.addr, align 8
  ret ptr %rest
}

define ptr @LambdaListNE.init(ptr %this, ptr %e, ptr %l, i32 %n, ptr %r) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %e.addr = alloca ptr, align 8
  store ptr %e, ptr %e.addr, align 8
  %l.addr = alloca ptr, align 8
  store ptr %l, ptr %l.addr, align 8
  %n.addr = alloca i32, align 4
  store i32 %n, ptr %n.addr, align 4
  %r.addr = alloca ptr, align 8
  store ptr %r, ptr %r.addr, align 8
  %e1 = load ptr, ptr %e.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %env.addr = getelementptr i8, ptr %self, i32 24
  store ptr %e1, ptr %env.addr, align 8
  %l2 = load ptr, ptr %l.addr, align 8
  %self3 = load ptr, ptr %this.addr, align 8
  %lam.addr = getelementptr i8, ptr %self3, i32 8
  store ptr %l2, ptr %lam.addr, align 8
  %n4 = load i32, ptr %n.addr, align 4
  %self5 = load ptr, ptr %this.addr, align 8
  %num.addr = getelementptr i8, ptr %self5, i32 16
  store i32 %n4, ptr %num.addr, align 4
  %r6 = load ptr, ptr %r.addr, align 8
  %self7 = load ptr, ptr %this.addr, align 8
  %rest.addr = getelementptr i8, ptr %self7, i32 32
  store ptr %r6, ptr %rest.addr, align 8
  %self8 = load ptr, ptr %this.addr, align 8
  ret ptr %self8
}

define i1 @LambdaListRef.isNil(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %l.addr = getelementptr i8, ptr %self, i32 16
  %l = load ptr, ptr %l.addr, align 8
  %dispatch.isnull = icmp eq ptr %l, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %l, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call i1 %method.ptr(ptr %l)
  ret i1 %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @LambdaListRef.headE(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %l.addr = getelementptr i8, ptr %self, i32 16
  %l = load ptr, ptr %l.addr, align 8
  %dispatch.isnull = icmp eq ptr %l, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %l, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 6
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %l)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @LambdaListRef.headC(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %l.addr = getelementptr i8, ptr %self, i32 16
  %l = load ptr, ptr %l.addr, align 8
  %dispatch.isnull = icmp eq ptr %l, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %l, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 7
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %l)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define i32 @LambdaListRef.headN(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %l.addr = getelementptr i8, ptr %self, i32 16
  %l = load ptr, ptr %l.addr, align 8
  %dispatch.isnull = icmp eq ptr %l, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %l, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 8
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call i32 %method.ptr(ptr %l)
  ret i32 %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @LambdaListRef.reset(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %nextNum.addr = getelementptr i8, ptr %self, i32 8
  store i32 0, ptr %nextNum.addr, align 4
  %LambdaList.newtmp = call ptr @LambdaList.new()
  %self1 = load ptr, ptr %this.addr, align 8
  %l.addr = getelementptr i8, ptr %self1, i32 16
  store ptr %LambdaList.newtmp, ptr %l.addr, align 8
  %self2 = load ptr, ptr %this.addr, align 8
  ret ptr %self2
}

define i32 @LambdaListRef.add(ptr %this, ptr %env, ptr %c) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %env.addr = alloca ptr, align 8
  store ptr %env, ptr %env.addr, align 8
  %c.addr = alloca ptr, align 8
  store ptr %c, ptr %c.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %l.addr = getelementptr i8, ptr %self, i32 16
  %l = load ptr, ptr %l.addr, align 8
  %dispatch.isnull = icmp eq ptr %l, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %l, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 10
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %env1 = load ptr, ptr %env.addr, align 8
  %c2 = load ptr, ptr %c.addr, align 8
  %self3 = load ptr, ptr %this.addr, align 8
  %nextNum.addr = getelementptr i8, ptr %self3, i32 8
  %nextNum = load i32, ptr %nextNum.addr, align 4
  %dispatch.result = call ptr %method.ptr(ptr %l, ptr %env1, ptr %c2, i32 %nextNum)
  %self4 = load ptr, ptr %this.addr, align 8
  %l.addr5 = getelementptr i8, ptr %self4, i32 16
  store ptr %dispatch.result, ptr %l.addr5, align 8
  %self6 = load ptr, ptr %this.addr, align 8
  %nextNum.addr7 = getelementptr i8, ptr %self6, i32 8
  %nextNum8 = load i32, ptr %nextNum.addr7, align 4
  %addtmp = add i32 %nextNum8, 1
  %self9 = load ptr, ptr %this.addr, align 8
  %nextNum.addr10 = getelementptr i8, ptr %self9, i32 8
  store i32 %addtmp, ptr %nextNum.addr10, align 4
  %self11 = load ptr, ptr %this.addr, align 8
  %nextNum.addr12 = getelementptr i8, ptr %self11, i32 8
  %nextNum13 = load i32, ptr %nextNum.addr12, align 4
  %subtmp = sub i32 %nextNum13, 1
  ret i32 %subtmp

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @LambdaListRef.removeHead(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %l.addr = getelementptr i8, ptr %self, i32 16
  %l = load ptr, ptr %l.addr, align 8
  %dispatch.isnull = icmp eq ptr %l, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %l, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 9
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %l)
  %self1 = load ptr, ptr %this.addr, align 8
  %l.addr2 = getelementptr i8, ptr %self1, i32 16
  store ptr %dispatch.result, ptr %l.addr2, align 8
  %self3 = load ptr, ptr %this.addr, align 8
  ret ptr %self3

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @Expr.print_self(ptr %this) {
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
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.12186846601057835936)
  %self1 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull4 = icmp eq ptr %self1, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %self1, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 3
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %0 = call ptr %method.ptr7(ptr %self1)
  unreachable

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable
}

define ptr @Expr.beta(ptr %this) {
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
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.17685852440332713262)
  %self1 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull4 = icmp eq ptr %self1, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %self1, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 3
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %0 = call ptr %method.ptr7(ptr %self1)
  unreachable

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable
}

define ptr @Expr.substitute(ptr %this, ptr %x, ptr %e) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %x, ptr %x.addr, align 8
  %e.addr = alloca ptr, align 8
  store ptr %e, ptr %e.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.12200006661317483695)
  %self1 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull4 = icmp eq ptr %self1, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %self1, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 3
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %0 = call ptr %method.ptr7(ptr %self1)
  unreachable

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable
}

define ptr @Expr.gen_code(ptr %this, ptr %env, ptr %closures) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %env.addr = alloca ptr, align 8
  store ptr %env, ptr %env.addr, align 8
  %closures.addr = alloca ptr, align 8
  store ptr %closures, ptr %closures.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.3189073882171820518)
  %self1 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull4 = icmp eq ptr %self1, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %self1, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 3
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %0 = call ptr %method.ptr7(ptr %self1)
  unreachable

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable
}

define ptr @Variable.init(ptr %this, ptr %n) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %n.addr = alloca ptr, align 8
  store ptr %n, ptr %n.addr, align 8
  %n1 = load ptr, ptr %n.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %name.addr = getelementptr i8, ptr %self, i32 8
  store ptr %n1, ptr %name.addr, align 8
  %self2 = load ptr, ptr %this.addr, align 8
  ret ptr %self2
}

define ptr @Variable.print_self(ptr %this) {
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
  %name.addr = getelementptr i8, ptr %self1, i32 8
  %name = load ptr, ptr %name.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr %name)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @Variable.beta(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  ret ptr %self
}

define ptr @Variable.substitute(ptr %this, ptr %x, ptr %e) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %x, ptr %x.addr, align 8
  %e.addr = alloca ptr, align 8
  store ptr %e, ptr %e.addr, align 8
  %x1 = load ptr, ptr %x.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %eqtmp = icmp eq ptr %x1, %self
  br i1 %eqtmp, label %then, label %else

then:                                             ; preds = %entry
  %e2 = load ptr, ptr %e.addr, align 8
  br label %ifcont

else:                                             ; preds = %entry
  %self3 = load ptr, ptr %this.addr, align 8
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %cond_result = phi ptr [ %e2, %then ], [ %self3, %else ]
  ret ptr %cond_result
}

define ptr @Variable.gen_code(ptr %this, ptr %env, ptr %closures) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %env.addr = alloca ptr, align 8
  store ptr %env, ptr %env.addr, align 8
  %closures.addr = alloca ptr, align 8
  store ptr %closures, ptr %closures.addr, align 8
  %cur_env = alloca ptr, align 8
  %env1 = load ptr, ptr %env.addr, align 8
  store ptr %env1, ptr %cur_env, align 8
  br label %loop.cond

loop.cond:                                        ; preds = %dispatch.ok20, %entry
  %cur_env2 = load ptr, ptr %cur_env, align 8
  %dispatch.isnull = icmp eq ptr %cur_env2, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

loop.body:                                        ; preds = %ifcont
  %self11 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull14 = icmp eq ptr %self11, null
  br i1 %dispatch.isnull14, label %dispatch.abort13, label %dispatch.ok12

loop.after:                                       ; preds = %ifcont
  %cur_env27 = load ptr, ptr %cur_env, align 8
  %dispatch.isnull30 = icmp eq ptr %cur_env27, null
  br i1 %dispatch.isnull30, label %dispatch.abort29, label %dispatch.ok28

dispatch.ok:                                      ; preds = %loop.cond
  %vtable.ptr = load ptr, ptr %cur_env2, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 9
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call i1 %method.ptr(ptr %cur_env2)
  br i1 %dispatch.result, label %then, label %else

dispatch.abort:                                   ; preds = %loop.cond
  call void @abort()
  unreachable

then:                                             ; preds = %dispatch.ok
  br label %ifcont

else:                                             ; preds = %dispatch.ok
  %cur_env3 = load ptr, ptr %cur_env, align 8
  %dispatch.isnull6 = icmp eq ptr %cur_env3, null
  br i1 %dispatch.isnull6, label %dispatch.abort5, label %dispatch.ok4

dispatch.ok4:                                     ; preds = %else
  %vtable.ptr7 = load ptr, ptr %cur_env3, align 8
  %method.ptr.addr8 = getelementptr ptr, ptr %vtable.ptr7, i64 10
  %method.ptr9 = load ptr, ptr %method.ptr.addr8, align 8
  %dispatch.result10 = call ptr %method.ptr9(ptr %cur_env3)
  %self = load ptr, ptr %this.addr, align 8
  %eqtmp = icmp eq ptr %dispatch.result10, %self
  %comptmp = xor i1 %eqtmp, true
  br label %ifcont

dispatch.abort5:                                  ; preds = %else
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok4, %then
  %cond_result = phi i1 [ false, %then ], [ %comptmp, %dispatch.ok4 ]
  br i1 %cond_result, label %loop.body, label %loop.after

dispatch.ok12:                                    ; preds = %loop.body
  %vtable.ptr15 = load ptr, ptr %self11, align 8
  %method.ptr.addr16 = getelementptr ptr, ptr %vtable.ptr15, i64 5
  %method.ptr17 = load ptr, ptr %method.ptr.addr16, align 8
  %dispatch.result18 = call ptr %method.ptr17(ptr %self11, ptr @.str.17730896828212622792)
  %cur_env19 = load ptr, ptr %cur_env, align 8
  %dispatch.isnull22 = icmp eq ptr %cur_env19, null
  br i1 %dispatch.isnull22, label %dispatch.abort21, label %dispatch.ok20

dispatch.abort13:                                 ; preds = %loop.body
  call void @abort()
  unreachable

dispatch.ok20:                                    ; preds = %dispatch.ok12
  %vtable.ptr23 = load ptr, ptr %cur_env19, align 8
  %method.ptr.addr24 = getelementptr ptr, ptr %vtable.ptr23, i64 11
  %method.ptr25 = load ptr, ptr %method.ptr.addr24, align 8
  %dispatch.result26 = call ptr %method.ptr25(ptr %cur_env19)
  store ptr %dispatch.result26, ptr %cur_env, align 8
  br label %loop.cond

dispatch.abort21:                                 ; preds = %dispatch.ok12
  call void @abort()
  unreachable

dispatch.ok28:                                    ; preds = %loop.after
  %vtable.ptr31 = load ptr, ptr %cur_env27, align 8
  %method.ptr.addr32 = getelementptr ptr, ptr %vtable.ptr31, i64 9
  %method.ptr33 = load ptr, ptr %method.ptr.addr32, align 8
  %dispatch.result34 = call i1 %method.ptr33(ptr %cur_env27)
  br i1 %dispatch.result34, label %then35, label %else67

dispatch.abort29:                                 ; preds = %loop.after
  call void @abort()
  unreachable

then35:                                           ; preds = %dispatch.ok28
  %self36 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull39 = icmp eq ptr %self36, null
  br i1 %dispatch.isnull39, label %dispatch.abort38, label %dispatch.ok37

dispatch.ok37:                                    ; preds = %then35
  %vtable.ptr40 = load ptr, ptr %self36, align 8
  %method.ptr.addr41 = getelementptr ptr, ptr %vtable.ptr40, i64 5
  %method.ptr42 = load ptr, ptr %method.ptr.addr41, align 8
  %dispatch.result43 = call ptr %method.ptr42(ptr %self36, ptr @.str.14653889881731406450)
  %self44 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull47 = icmp eq ptr %self44, null
  br i1 %dispatch.isnull47, label %dispatch.abort46, label %dispatch.ok45

dispatch.abort38:                                 ; preds = %then35
  call void @abort()
  unreachable

dispatch.ok45:                                    ; preds = %dispatch.ok37
  %vtable.ptr48 = load ptr, ptr %self44, align 8
  %method.ptr.addr49 = getelementptr ptr, ptr %vtable.ptr48, i64 9
  %method.ptr50 = load ptr, ptr %method.ptr.addr49, align 8
  %dispatch.result51 = call ptr %method.ptr50(ptr %self44)
  %self52 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull55 = icmp eq ptr %self52, null
  br i1 %dispatch.isnull55, label %dispatch.abort54, label %dispatch.ok53

dispatch.abort46:                                 ; preds = %dispatch.ok37
  call void @abort()
  unreachable

dispatch.ok53:                                    ; preds = %dispatch.ok45
  %vtable.ptr56 = load ptr, ptr %self52, align 8
  %method.ptr.addr57 = getelementptr ptr, ptr %vtable.ptr56, i64 5
  %method.ptr58 = load ptr, ptr %method.ptr.addr57, align 8
  %dispatch.result59 = call ptr %method.ptr58(ptr %self52, ptr @.str.18400681194753865968)
  %self60 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull63 = icmp eq ptr %self60, null
  br i1 %dispatch.isnull63, label %dispatch.abort62, label %dispatch.ok61

dispatch.abort54:                                 ; preds = %dispatch.ok45
  call void @abort()
  unreachable

dispatch.ok61:                                    ; preds = %dispatch.ok53
  %vtable.ptr64 = load ptr, ptr %self60, align 8
  %method.ptr.addr65 = getelementptr ptr, ptr %vtable.ptr64, i64 3
  %method.ptr66 = load ptr, ptr %method.ptr.addr65, align 8
  %0 = call ptr %method.ptr66(ptr %self60)
  unreachable

dispatch.abort62:                                 ; preds = %dispatch.ok53
  call void @abort()
  unreachable

else67:                                           ; preds = %dispatch.ok28
  %self68 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull71 = icmp eq ptr %self68, null
  br i1 %dispatch.isnull71, label %dispatch.abort70, label %dispatch.ok69

dispatch.ok69:                                    ; preds = %else67
  %vtable.ptr72 = load ptr, ptr %self68, align 8
  %method.ptr.addr73 = getelementptr ptr, ptr %vtable.ptr72, i64 5
  %method.ptr74 = load ptr, ptr %method.ptr.addr73, align 8
  %dispatch.result75 = call ptr %method.ptr74(ptr %self68, ptr @.str.13284806743914967967)
  br label %ifcont76

dispatch.abort70:                                 ; preds = %else67
  call void @abort()
  unreachable

ifcont76:                                         ; preds = %dispatch.ok69
  ret ptr %dispatch.result75
}

define ptr @Lambda.init(ptr %this, ptr %a, ptr %b) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %a.addr = alloca ptr, align 8
  store ptr %a, ptr %a.addr, align 8
  %b.addr = alloca ptr, align 8
  store ptr %b, ptr %b.addr, align 8
  %a1 = load ptr, ptr %a.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %arg.addr = getelementptr i8, ptr %self, i32 8
  store ptr %a1, ptr %arg.addr, align 8
  %b2 = load ptr, ptr %b.addr, align 8
  %self3 = load ptr, ptr %this.addr, align 8
  %body.addr = getelementptr i8, ptr %self3, i32 16
  store ptr %b2, ptr %body.addr, align 8
  %self4 = load ptr, ptr %this.addr, align 8
  ret ptr %self4
}

define ptr @Lambda.print_self(ptr %this) {
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
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.12541758908481966010)
  %self1 = load ptr, ptr %this.addr, align 8
  %arg.addr = getelementptr i8, ptr %self1, i32 8
  %arg = load ptr, ptr %arg.addr, align 8
  %dispatch.isnull4 = icmp eq ptr %arg, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %arg, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 9
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %dispatch.result8 = call ptr %method.ptr7(ptr %arg)
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
  %dispatch.result16 = call ptr %method.ptr15(ptr %self9, ptr @.str.15099569138734304119)
  %self17 = load ptr, ptr %this.addr, align 8
  %body.addr = getelementptr i8, ptr %self17, i32 16
  %body = load ptr, ptr %body.addr, align 8
  %dispatch.isnull20 = icmp eq ptr %body, null
  br i1 %dispatch.isnull20, label %dispatch.abort19, label %dispatch.ok18

dispatch.abort11:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable

dispatch.ok18:                                    ; preds = %dispatch.ok10
  %vtable.ptr21 = load ptr, ptr %body, align 8
  %method.ptr.addr22 = getelementptr ptr, ptr %vtable.ptr21, i64 9
  %method.ptr23 = load ptr, ptr %method.ptr.addr22, align 8
  %dispatch.result24 = call ptr %method.ptr23(ptr %body)
  %self25 = load ptr, ptr %this.addr, align 8
  ret ptr %self25

dispatch.abort19:                                 ; preds = %dispatch.ok10
  call void @abort()
  unreachable
}

define ptr @Lambda.beta(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  ret ptr %self
}

define ptr @Lambda.apply(ptr %this, ptr %actual) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %actual.addr = alloca ptr, align 8
  store ptr %actual, ptr %actual.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %body.addr = getelementptr i8, ptr %self, i32 16
  %body = load ptr, ptr %body.addr, align 8
  %dispatch.isnull = icmp eq ptr %body, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %body, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 11
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %self1 = load ptr, ptr %this.addr, align 8
  %arg.addr = getelementptr i8, ptr %self1, i32 8
  %arg = load ptr, ptr %arg.addr, align 8
  %actual2 = load ptr, ptr %actual.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %body, ptr %arg, ptr %actual2)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @Lambda.substitute(ptr %this, ptr %x, ptr %e) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %x, ptr %x.addr, align 8
  %e.addr = alloca ptr, align 8
  store ptr %e, ptr %e.addr, align 8
  %x1 = load ptr, ptr %x.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %arg.addr = getelementptr i8, ptr %self, i32 8
  %arg = load ptr, ptr %arg.addr, align 8
  %eqtmp = icmp eq ptr %x1, %arg
  br i1 %eqtmp, label %then, label %else

then:                                             ; preds = %entry
  %self2 = load ptr, ptr %this.addr, align 8
  br label %ifcont

else:                                             ; preds = %entry
  %new_body = alloca ptr, align 8
  %self3 = load ptr, ptr %this.addr, align 8
  %body.addr = getelementptr i8, ptr %self3, i32 16
  %body = load ptr, ptr %body.addr, align 8
  %dispatch.isnull = icmp eq ptr %body, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %else
  %vtable.ptr = load ptr, ptr %body, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 11
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x4 = load ptr, ptr %x.addr, align 8
  %e5 = load ptr, ptr %e.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %body, ptr %x4, ptr %e5)
  store ptr %dispatch.result, ptr %new_body, align 8
  %new_lam = alloca ptr, align 8
  %Lambda.newtmp = call ptr @Lambda.new()
  store ptr %Lambda.newtmp, ptr %new_lam, align 8
  %new_lam6 = load ptr, ptr %new_lam, align 8
  %dispatch.isnull9 = icmp eq ptr %new_lam6, null
  br i1 %dispatch.isnull9, label %dispatch.abort8, label %dispatch.ok7

dispatch.abort:                                   ; preds = %else
  call void @abort()
  unreachable

dispatch.ok7:                                     ; preds = %dispatch.ok
  %vtable.ptr10 = load ptr, ptr %new_lam6, align 8
  %method.ptr.addr11 = getelementptr ptr, ptr %vtable.ptr10, i64 13
  %method.ptr12 = load ptr, ptr %method.ptr.addr11, align 8
  %self13 = load ptr, ptr %this.addr, align 8
  %arg.addr14 = getelementptr i8, ptr %self13, i32 8
  %arg15 = load ptr, ptr %arg.addr14, align 8
  %new_body16 = load ptr, ptr %new_body, align 8
  %dispatch.result17 = call ptr %method.ptr12(ptr %new_lam6, ptr %arg15, ptr %new_body16)
  br label %ifcont

dispatch.abort8:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok7, %then
  %cond_result = phi ptr [ %self2, %then ], [ %dispatch.result17, %dispatch.ok7 ]
  ret ptr %cond_result
}

define ptr @Lambda.gen_code(ptr %this, ptr %env, ptr %closures) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %env.addr = alloca ptr, align 8
  store ptr %env, ptr %env.addr, align 8
  %closures.addr = alloca ptr, align 8
  store ptr %closures, ptr %closures.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.13123305654767940980)
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
  %closures8 = load ptr, ptr %closures.addr, align 8
  %dispatch.isnull11 = icmp eq ptr %closures8, null
  br i1 %dispatch.isnull11, label %dispatch.abort10, label %dispatch.ok9

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok9:                                     ; preds = %dispatch.ok2
  %vtable.ptr12 = load ptr, ptr %closures8, align 8
  %method.ptr.addr13 = getelementptr ptr, ptr %vtable.ptr12, i64 10
  %method.ptr14 = load ptr, ptr %method.ptr.addr13, align 8
  %env15 = load ptr, ptr %env.addr, align 8
  %self16 = load ptr, ptr %this.addr, align 8
  %dispatch.result17 = call i32 %method.ptr14(ptr %closures8, ptr %env15, ptr %self16)
  %dispatch.result18 = call ptr %method.ptr7(ptr %self1, i32 %dispatch.result17)
  %self19 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull22 = icmp eq ptr %self19, null
  br i1 %dispatch.isnull22, label %dispatch.abort21, label %dispatch.ok20

dispatch.abort10:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable

dispatch.ok20:                                    ; preds = %dispatch.ok9
  %vtable.ptr23 = load ptr, ptr %self19, align 8
  %method.ptr.addr24 = getelementptr ptr, ptr %vtable.ptr23, i64 5
  %method.ptr25 = load ptr, ptr %method.ptr.addr24, align 8
  %dispatch.result26 = call ptr %method.ptr25(ptr %self19, ptr @.str.5793906371712553756)
  %env27 = load ptr, ptr %env.addr, align 8
  %dispatch.isnull30 = icmp eq ptr %env27, null
  br i1 %dispatch.isnull30, label %dispatch.abort29, label %dispatch.ok28

dispatch.abort21:                                 ; preds = %dispatch.ok9
  call void @abort()
  unreachable

dispatch.ok28:                                    ; preds = %dispatch.ok20
  %vtable.ptr31 = load ptr, ptr %env27, align 8
  %method.ptr.addr32 = getelementptr ptr, ptr %vtable.ptr31, i64 9
  %method.ptr33 = load ptr, ptr %method.ptr.addr32, align 8
  %dispatch.result34 = call i1 %method.ptr33(ptr %env27)
  br i1 %dispatch.result34, label %then, label %else

dispatch.abort29:                                 ; preds = %dispatch.ok20
  call void @abort()
  unreachable

then:                                             ; preds = %dispatch.ok28
  %self35 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull38 = icmp eq ptr %self35, null
  br i1 %dispatch.isnull38, label %dispatch.abort37, label %dispatch.ok36

dispatch.ok36:                                    ; preds = %then
  %vtable.ptr39 = load ptr, ptr %self35, align 8
  %method.ptr.addr40 = getelementptr ptr, ptr %vtable.ptr39, i64 5
  %method.ptr41 = load ptr, ptr %method.ptr.addr40, align 8
  %dispatch.result42 = call ptr %method.ptr41(ptr %self35, ptr @.str.6960962414463079127)
  br label %ifcont

dispatch.abort37:                                 ; preds = %then
  call void @abort()
  unreachable

else:                                             ; preds = %dispatch.ok28
  %self43 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull46 = icmp eq ptr %self43, null
  br i1 %dispatch.isnull46, label %dispatch.abort45, label %dispatch.ok44

dispatch.ok44:                                    ; preds = %else
  %vtable.ptr47 = load ptr, ptr %self43, align 8
  %method.ptr.addr48 = getelementptr ptr, ptr %vtable.ptr47, i64 5
  %method.ptr49 = load ptr, ptr %method.ptr.addr48, align 8
  %dispatch.result50 = call ptr %method.ptr49(ptr %self43, ptr @.str.4783047712059283627)
  br label %ifcont

dispatch.abort45:                                 ; preds = %else
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok44, %dispatch.ok36
  %cond_result = phi ptr [ %dispatch.result42, %dispatch.ok36 ], [ %dispatch.result50, %dispatch.ok44 ]
  %self51 = load ptr, ptr %this.addr, align 8
  ret ptr %self51
}

define ptr @Lambda.gen_closure_code(ptr %this, i32 %n, ptr %env, ptr %closures) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %n.addr = alloca i32, align 4
  store i32 %n, ptr %n.addr, align 4
  %env.addr = alloca ptr, align 8
  store ptr %env, ptr %env.addr, align 8
  %closures.addr = alloca ptr, align 8
  store ptr %closures, ptr %closures.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.4438221701991650061)
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
  %n8 = load i32, ptr %n.addr, align 4
  %dispatch.result9 = call ptr %method.ptr7(ptr %self1, i32 %n8)
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
  %dispatch.result17 = call ptr %method.ptr16(ptr %self10, ptr @.str.13132597237450073676)
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
  %dispatch.result25 = call ptr %method.ptr24(ptr %self18, ptr @.str.1622691923872969250)
  %self26 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull29 = icmp eq ptr %self26, null
  br i1 %dispatch.isnull29, label %dispatch.abort28, label %dispatch.ok27

dispatch.abort20:                                 ; preds = %dispatch.ok11
  call void @abort()
  unreachable

dispatch.ok27:                                    ; preds = %dispatch.ok19
  %vtable.ptr30 = load ptr, ptr %self26, align 8
  %method.ptr.addr31 = getelementptr ptr, ptr %vtable.ptr30, i64 5
  %method.ptr32 = load ptr, ptr %method.ptr.addr31, align 8
  %dispatch.result33 = call ptr %method.ptr32(ptr %self26, ptr @.str.17497182908930847761)
  %self34 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull37 = icmp eq ptr %self34, null
  br i1 %dispatch.isnull37, label %dispatch.abort36, label %dispatch.ok35

dispatch.abort28:                                 ; preds = %dispatch.ok19
  call void @abort()
  unreachable

dispatch.ok35:                                    ; preds = %dispatch.ok27
  %vtable.ptr38 = load ptr, ptr %self34, align 8
  %method.ptr.addr39 = getelementptr ptr, ptr %vtable.ptr38, i64 6
  %method.ptr40 = load ptr, ptr %method.ptr.addr39, align 8
  %n41 = load i32, ptr %n.addr, align 4
  %dispatch.result42 = call ptr %method.ptr40(ptr %self34, i32 %n41)
  %self43 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull46 = icmp eq ptr %self43, null
  br i1 %dispatch.isnull46, label %dispatch.abort45, label %dispatch.ok44

dispatch.abort36:                                 ; preds = %dispatch.ok27
  call void @abort()
  unreachable

dispatch.ok44:                                    ; preds = %dispatch.ok35
  %vtable.ptr47 = load ptr, ptr %self43, align 8
  %method.ptr.addr48 = getelementptr ptr, ptr %vtable.ptr47, i64 5
  %method.ptr49 = load ptr, ptr %method.ptr.addr48, align 8
  %dispatch.result50 = call ptr %method.ptr49(ptr %self43, ptr @.str.8278817361954948235)
  %self51 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull54 = icmp eq ptr %self51, null
  br i1 %dispatch.isnull54, label %dispatch.abort53, label %dispatch.ok52

dispatch.abort45:                                 ; preds = %dispatch.ok35
  call void @abort()
  unreachable

dispatch.ok52:                                    ; preds = %dispatch.ok44
  %vtable.ptr55 = load ptr, ptr %self51, align 8
  %method.ptr.addr56 = getelementptr ptr, ptr %vtable.ptr55, i64 5
  %method.ptr57 = load ptr, ptr %method.ptr.addr56, align 8
  %dispatch.result58 = call ptr %method.ptr57(ptr %self51, ptr @.str.17271316148737701812)
  %self59 = load ptr, ptr %this.addr, align 8
  %body.addr = getelementptr i8, ptr %self59, i32 16
  %body = load ptr, ptr %body.addr, align 8
  %dispatch.isnull62 = icmp eq ptr %body, null
  br i1 %dispatch.isnull62, label %dispatch.abort61, label %dispatch.ok60

dispatch.abort53:                                 ; preds = %dispatch.ok44
  call void @abort()
  unreachable

dispatch.ok60:                                    ; preds = %dispatch.ok52
  %vtable.ptr63 = load ptr, ptr %body, align 8
  %method.ptr.addr64 = getelementptr ptr, ptr %vtable.ptr63, i64 12
  %method.ptr65 = load ptr, ptr %method.ptr.addr64, align 8
  %env66 = load ptr, ptr %env.addr, align 8
  %dispatch.isnull69 = icmp eq ptr %env66, null
  br i1 %dispatch.isnull69, label %dispatch.abort68, label %dispatch.ok67

dispatch.abort61:                                 ; preds = %dispatch.ok52
  call void @abort()
  unreachable

dispatch.ok67:                                    ; preds = %dispatch.ok60
  %vtable.ptr70 = load ptr, ptr %env66, align 8
  %method.ptr.addr71 = getelementptr ptr, ptr %vtable.ptr70, i64 12
  %method.ptr72 = load ptr, ptr %method.ptr.addr71, align 8
  %self73 = load ptr, ptr %this.addr, align 8
  %arg.addr = getelementptr i8, ptr %self73, i32 8
  %arg = load ptr, ptr %arg.addr, align 8
  %dispatch.result74 = call ptr %method.ptr72(ptr %env66, ptr %arg)
  %closures75 = load ptr, ptr %closures.addr, align 8
  %dispatch.result76 = call ptr %method.ptr65(ptr %body, ptr %dispatch.result74, ptr %closures75)
  %self77 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull80 = icmp eq ptr %self77, null
  br i1 %dispatch.isnull80, label %dispatch.abort79, label %dispatch.ok78

dispatch.abort68:                                 ; preds = %dispatch.ok60
  call void @abort()
  unreachable

dispatch.ok78:                                    ; preds = %dispatch.ok67
  %vtable.ptr81 = load ptr, ptr %self77, align 8
  %method.ptr.addr82 = getelementptr ptr, ptr %vtable.ptr81, i64 5
  %method.ptr83 = load ptr, ptr %method.ptr.addr82, align 8
  %dispatch.result84 = call ptr %method.ptr83(ptr %self77, ptr @.str.6272164506702699522)
  %self85 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull88 = icmp eq ptr %self85, null
  br i1 %dispatch.isnull88, label %dispatch.abort87, label %dispatch.ok86

dispatch.abort79:                                 ; preds = %dispatch.ok67
  call void @abort()
  unreachable

dispatch.ok86:                                    ; preds = %dispatch.ok78
  %vtable.ptr89 = load ptr, ptr %self85, align 8
  %method.ptr.addr90 = getelementptr ptr, ptr %vtable.ptr89, i64 5
  %method.ptr91 = load ptr, ptr %method.ptr.addr90, align 8
  %dispatch.result92 = call ptr %method.ptr91(ptr %self85, ptr @.str.5250540665876017389)
  ret ptr %dispatch.result92

dispatch.abort87:                                 ; preds = %dispatch.ok78
  call void @abort()
  unreachable
}

define ptr @App.init(ptr %this, ptr %f, ptr %a) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %f.addr = alloca ptr, align 8
  store ptr %f, ptr %f.addr, align 8
  %a.addr = alloca ptr, align 8
  store ptr %a, ptr %a.addr, align 8
  %f1 = load ptr, ptr %f.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %fun.addr = getelementptr i8, ptr %self, i32 8
  store ptr %f1, ptr %fun.addr, align 8
  %a2 = load ptr, ptr %a.addr, align 8
  %self3 = load ptr, ptr %this.addr, align 8
  %arg.addr = getelementptr i8, ptr %self3, i32 16
  store ptr %a2, ptr %arg.addr, align 8
  %self4 = load ptr, ptr %this.addr, align 8
  ret ptr %self4
}

define ptr @App.print_self(ptr %this) {
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
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.16400187016935417045)
  %self1 = load ptr, ptr %this.addr, align 8
  %fun.addr = getelementptr i8, ptr %self1, i32 8
  %fun = load ptr, ptr %fun.addr, align 8
  %dispatch.isnull4 = icmp eq ptr %fun, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %fun, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 9
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %dispatch.result8 = call ptr %method.ptr7(ptr %fun)
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
  %dispatch.result16 = call ptr %method.ptr15(ptr %self9, ptr @.str.9143335575124758599)
  %self17 = load ptr, ptr %this.addr, align 8
  %arg.addr = getelementptr i8, ptr %self17, i32 16
  %arg = load ptr, ptr %arg.addr, align 8
  %dispatch.isnull20 = icmp eq ptr %arg, null
  br i1 %dispatch.isnull20, label %dispatch.abort19, label %dispatch.ok18

dispatch.abort11:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable

dispatch.ok18:                                    ; preds = %dispatch.ok10
  %vtable.ptr21 = load ptr, ptr %arg, align 8
  %method.ptr.addr22 = getelementptr ptr, ptr %vtable.ptr21, i64 9
  %method.ptr23 = load ptr, ptr %method.ptr.addr22, align 8
  %dispatch.result24 = call ptr %method.ptr23(ptr %arg)
  %self25 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull28 = icmp eq ptr %self25, null
  br i1 %dispatch.isnull28, label %dispatch.abort27, label %dispatch.ok26

dispatch.abort19:                                 ; preds = %dispatch.ok10
  call void @abort()
  unreachable

dispatch.ok26:                                    ; preds = %dispatch.ok18
  %vtable.ptr29 = load ptr, ptr %self25, align 8
  %method.ptr.addr30 = getelementptr ptr, ptr %vtable.ptr29, i64 5
  %method.ptr31 = load ptr, ptr %method.ptr.addr30, align 8
  %dispatch.result32 = call ptr %method.ptr31(ptr %self25, ptr @.str.2584822283668855122)
  %self33 = load ptr, ptr %this.addr, align 8
  ret ptr %self33

dispatch.abort27:                                 ; preds = %dispatch.ok18
  call void @abort()
  unreachable
}

define ptr @App.beta(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %fun.addr = getelementptr i8, ptr %self, i32 8
  %fun = load ptr, ptr %fun.addr, align 8
  %case.isnull = icmp eq ptr %fun, null
  br i1 %case.isnull, label %case.abort, label %case.ok

case.ok:                                          ; preds = %entry
  %case.vptr = load ptr, ptr %fun, align 8
  %Lambda.match = icmp eq ptr %case.vptr, @_ZTV6Lambda
  br i1 %Lambda.match, label %case.match, label %case.next

case.abort:                                       ; preds = %entry
  call void @abort()
  unreachable

case.match:                                       ; preds = %case.ok
  %l.addr = alloca ptr, align 8
  store ptr %fun, ptr %l.addr, align 8
  %l = load ptr, ptr %l.addr, align 8
  %dispatch.isnull = icmp eq ptr %l, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %case.match
  %vtable.ptr = load ptr, ptr %l, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 14
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %self1 = load ptr, ptr %this.addr, align 8
  %arg.addr = getelementptr i8, ptr %self1, i32 16
  %arg = load ptr, ptr %arg.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %l, ptr %arg)
  br label %case.end

dispatch.abort:                                   ; preds = %case.match
  call void @abort()
  unreachable

case.next:                                        ; preds = %case.ok
  %App.match = icmp eq ptr %case.vptr, @_ZTV3App
  %Expr.match = icmp eq ptr %case.vptr, @_ZTV4Expr
  %case.or = or i1 %App.match, %Expr.match
  %Lambda.match3 = icmp eq ptr %case.vptr, @_ZTV6Lambda
  %case.or4 = or i1 %case.or, %Lambda.match3
  %Variable.match = icmp eq ptr %case.vptr, @_ZTV8Variable
  %case.or5 = or i1 %case.or4, %Variable.match
  br i1 %case.or5, label %case.match2, label %case.abort6

case.match2:                                      ; preds = %case.next
  %e.addr = alloca ptr, align 8
  store ptr %fun, ptr %e.addr, align 8
  %new_fun = alloca ptr, align 8
  %self7 = load ptr, ptr %this.addr, align 8
  %fun.addr8 = getelementptr i8, ptr %self7, i32 8
  %fun9 = load ptr, ptr %fun.addr8, align 8
  %dispatch.isnull12 = icmp eq ptr %fun9, null
  br i1 %dispatch.isnull12, label %dispatch.abort11, label %dispatch.ok10

case.abort6:                                      ; preds = %case.next
  call void @abort()
  unreachable

dispatch.ok10:                                    ; preds = %case.match2
  %vtable.ptr13 = load ptr, ptr %fun9, align 8
  %method.ptr.addr14 = getelementptr ptr, ptr %vtable.ptr13, i64 10
  %method.ptr15 = load ptr, ptr %method.ptr.addr14, align 8
  %dispatch.result16 = call ptr %method.ptr15(ptr %fun9)
  store ptr %dispatch.result16, ptr %new_fun, align 8
  %new_app = alloca ptr, align 8
  %App.newtmp = call ptr @App.new()
  store ptr %App.newtmp, ptr %new_app, align 8
  %new_app17 = load ptr, ptr %new_app, align 8
  %dispatch.isnull20 = icmp eq ptr %new_app17, null
  br i1 %dispatch.isnull20, label %dispatch.abort19, label %dispatch.ok18

dispatch.abort11:                                 ; preds = %case.match2
  call void @abort()
  unreachable

dispatch.ok18:                                    ; preds = %dispatch.ok10
  %vtable.ptr21 = load ptr, ptr %new_app17, align 8
  %method.ptr.addr22 = getelementptr ptr, ptr %vtable.ptr21, i64 13
  %method.ptr23 = load ptr, ptr %method.ptr.addr22, align 8
  %new_fun24 = load ptr, ptr %new_fun, align 8
  %self25 = load ptr, ptr %this.addr, align 8
  %arg.addr26 = getelementptr i8, ptr %self25, i32 16
  %arg27 = load ptr, ptr %arg.addr26, align 8
  %dispatch.result28 = call ptr %method.ptr23(ptr %new_app17, ptr %new_fun24, ptr %arg27)
  br label %case.end

dispatch.abort19:                                 ; preds = %dispatch.ok10
  call void @abort()
  unreachable

case.end:                                         ; preds = %dispatch.ok18, %dispatch.ok
  %case.result = phi ptr [ %dispatch.result, %dispatch.ok ], [ %dispatch.result28, %dispatch.ok18 ]
  ret ptr %case.result
}

define ptr @App.substitute(ptr %this, ptr %x, ptr %e) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %x, ptr %x.addr, align 8
  %e.addr = alloca ptr, align 8
  store ptr %e, ptr %e.addr, align 8
  %new_fun = alloca ptr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %fun.addr = getelementptr i8, ptr %self, i32 8
  %fun = load ptr, ptr %fun.addr, align 8
  %dispatch.isnull = icmp eq ptr %fun, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %fun, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 11
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x1 = load ptr, ptr %x.addr, align 8
  %e2 = load ptr, ptr %e.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %fun, ptr %x1, ptr %e2)
  store ptr %dispatch.result, ptr %new_fun, align 8
  %new_arg = alloca ptr, align 8
  %self3 = load ptr, ptr %this.addr, align 8
  %arg.addr = getelementptr i8, ptr %self3, i32 16
  %arg = load ptr, ptr %arg.addr, align 8
  %dispatch.isnull6 = icmp eq ptr %arg, null
  br i1 %dispatch.isnull6, label %dispatch.abort5, label %dispatch.ok4

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok4:                                     ; preds = %dispatch.ok
  %vtable.ptr7 = load ptr, ptr %arg, align 8
  %method.ptr.addr8 = getelementptr ptr, ptr %vtable.ptr7, i64 11
  %method.ptr9 = load ptr, ptr %method.ptr.addr8, align 8
  %x10 = load ptr, ptr %x.addr, align 8
  %e11 = load ptr, ptr %e.addr, align 8
  %dispatch.result12 = call ptr %method.ptr9(ptr %arg, ptr %x10, ptr %e11)
  store ptr %dispatch.result12, ptr %new_arg, align 8
  %new_app = alloca ptr, align 8
  %App.newtmp = call ptr @App.new()
  store ptr %App.newtmp, ptr %new_app, align 8
  %new_app13 = load ptr, ptr %new_app, align 8
  %dispatch.isnull16 = icmp eq ptr %new_app13, null
  br i1 %dispatch.isnull16, label %dispatch.abort15, label %dispatch.ok14

dispatch.abort5:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok14:                                    ; preds = %dispatch.ok4
  %vtable.ptr17 = load ptr, ptr %new_app13, align 8
  %method.ptr.addr18 = getelementptr ptr, ptr %vtable.ptr17, i64 13
  %method.ptr19 = load ptr, ptr %method.ptr.addr18, align 8
  %new_fun20 = load ptr, ptr %new_fun, align 8
  %new_arg21 = load ptr, ptr %new_arg, align 8
  %dispatch.result22 = call ptr %method.ptr19(ptr %new_app13, ptr %new_fun20, ptr %new_arg21)
  ret ptr %dispatch.result22

dispatch.abort15:                                 ; preds = %dispatch.ok4
  call void @abort()
  unreachable
}

define ptr @App.gen_code(ptr %this, ptr %env, ptr %closures) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %env.addr = alloca ptr, align 8
  store ptr %env, ptr %env.addr, align 8
  %closures.addr = alloca ptr, align 8
  store ptr %closures, ptr %closures.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.3295041690608701107)
  %self1 = load ptr, ptr %this.addr, align 8
  %fun.addr = getelementptr i8, ptr %self1, i32 8
  %fun = load ptr, ptr %fun.addr, align 8
  %dispatch.isnull4 = icmp eq ptr %fun, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %fun, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 12
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %env8 = load ptr, ptr %env.addr, align 8
  %closures9 = load ptr, ptr %closures.addr, align 8
  %dispatch.result10 = call ptr %method.ptr7(ptr %fun, ptr %env8, ptr %closures9)
  %self11 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull14 = icmp eq ptr %self11, null
  br i1 %dispatch.isnull14, label %dispatch.abort13, label %dispatch.ok12

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok12:                                    ; preds = %dispatch.ok2
  %vtable.ptr15 = load ptr, ptr %self11, align 8
  %method.ptr.addr16 = getelementptr ptr, ptr %vtable.ptr15, i64 5
  %method.ptr17 = load ptr, ptr %method.ptr.addr16, align 8
  %dispatch.result18 = call ptr %method.ptr17(ptr %self11, ptr @.str.4246255312936368446)
  %self19 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull22 = icmp eq ptr %self19, null
  br i1 %dispatch.isnull22, label %dispatch.abort21, label %dispatch.ok20

dispatch.abort13:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable

dispatch.ok20:                                    ; preds = %dispatch.ok12
  %vtable.ptr23 = load ptr, ptr %self19, align 8
  %method.ptr.addr24 = getelementptr ptr, ptr %vtable.ptr23, i64 5
  %method.ptr25 = load ptr, ptr %method.ptr.addr24, align 8
  %dispatch.result26 = call ptr %method.ptr25(ptr %self19, ptr @.str.7003202724348968002)
  %self27 = load ptr, ptr %this.addr, align 8
  %arg.addr = getelementptr i8, ptr %self27, i32 16
  %arg = load ptr, ptr %arg.addr, align 8
  %dispatch.isnull30 = icmp eq ptr %arg, null
  br i1 %dispatch.isnull30, label %dispatch.abort29, label %dispatch.ok28

dispatch.abort21:                                 ; preds = %dispatch.ok12
  call void @abort()
  unreachable

dispatch.ok28:                                    ; preds = %dispatch.ok20
  %vtable.ptr31 = load ptr, ptr %arg, align 8
  %method.ptr.addr32 = getelementptr ptr, ptr %vtable.ptr31, i64 12
  %method.ptr33 = load ptr, ptr %method.ptr.addr32, align 8
  %env34 = load ptr, ptr %env.addr, align 8
  %closures35 = load ptr, ptr %closures.addr, align 8
  %dispatch.result36 = call ptr %method.ptr33(ptr %arg, ptr %env34, ptr %closures35)
  %self37 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull40 = icmp eq ptr %self37, null
  br i1 %dispatch.isnull40, label %dispatch.abort39, label %dispatch.ok38

dispatch.abort29:                                 ; preds = %dispatch.ok20
  call void @abort()
  unreachable

dispatch.ok38:                                    ; preds = %dispatch.ok28
  %vtable.ptr41 = load ptr, ptr %self37, align 8
  %method.ptr.addr42 = getelementptr ptr, ptr %vtable.ptr41, i64 5
  %method.ptr43 = load ptr, ptr %method.ptr.addr42, align 8
  %dispatch.result44 = call ptr %method.ptr43(ptr %self37, ptr @.str.5300866883985441106)
  %self45 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull48 = icmp eq ptr %self45, null
  br i1 %dispatch.isnull48, label %dispatch.abort47, label %dispatch.ok46

dispatch.abort39:                                 ; preds = %dispatch.ok28
  call void @abort()
  unreachable

dispatch.ok46:                                    ; preds = %dispatch.ok38
  %vtable.ptr49 = load ptr, ptr %self45, align 8
  %method.ptr.addr50 = getelementptr ptr, ptr %vtable.ptr49, i64 5
  %method.ptr51 = load ptr, ptr %method.ptr.addr50, align 8
  %dispatch.result52 = call ptr %method.ptr51(ptr %self45, ptr @.str.8338520256210774706)
  %self53 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull56 = icmp eq ptr %self53, null
  br i1 %dispatch.isnull56, label %dispatch.abort55, label %dispatch.ok54

dispatch.abort47:                                 ; preds = %dispatch.ok38
  call void @abort()
  unreachable

dispatch.ok54:                                    ; preds = %dispatch.ok46
  %vtable.ptr57 = load ptr, ptr %self53, align 8
  %method.ptr.addr58 = getelementptr ptr, ptr %vtable.ptr57, i64 5
  %method.ptr59 = load ptr, ptr %method.ptr.addr58, align 8
  %dispatch.result60 = call ptr %method.ptr59(ptr %self53, ptr @.str.14790904847336938787)
  %self61 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull64 = icmp eq ptr %self61, null
  br i1 %dispatch.isnull64, label %dispatch.abort63, label %dispatch.ok62

dispatch.abort55:                                 ; preds = %dispatch.ok46
  call void @abort()
  unreachable

dispatch.ok62:                                    ; preds = %dispatch.ok54
  %vtable.ptr65 = load ptr, ptr %self61, align 8
  %method.ptr.addr66 = getelementptr ptr, ptr %vtable.ptr65, i64 5
  %method.ptr67 = load ptr, ptr %method.ptr.addr66, align 8
  %dispatch.result68 = call ptr %method.ptr67(ptr %self61, ptr @.str.13537854679560670851)
  %self69 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull72 = icmp eq ptr %self69, null
  br i1 %dispatch.isnull72, label %dispatch.abort71, label %dispatch.ok70

dispatch.abort63:                                 ; preds = %dispatch.ok54
  call void @abort()
  unreachable

dispatch.ok70:                                    ; preds = %dispatch.ok62
  %vtable.ptr73 = load ptr, ptr %self69, align 8
  %method.ptr.addr74 = getelementptr ptr, ptr %vtable.ptr73, i64 5
  %method.ptr75 = load ptr, ptr %method.ptr.addr74, align 8
  %dispatch.result76 = call ptr %method.ptr75(ptr %self69, ptr @.str.2135580321292951229)
  ret ptr %dispatch.result76

dispatch.abort71:                                 ; preds = %dispatch.ok62
  call void @abort()
  unreachable
}

define ptr @Term.var(ptr %this, ptr %x) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %x, ptr %x.addr, align 8
  %v = alloca ptr, align 8
  %Variable.newtmp = call ptr @Variable.new()
  store ptr %Variable.newtmp, ptr %v, align 8
  %v1 = load ptr, ptr %v, align 8
  %dispatch.isnull = icmp eq ptr %v1, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %v1, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 13
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x2 = load ptr, ptr %x.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %v1, ptr %x2)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @Term.lam(ptr %this, ptr %x, ptr %e) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %x, ptr %x.addr, align 8
  %e.addr = alloca ptr, align 8
  store ptr %e, ptr %e.addr, align 8
  %l = alloca ptr, align 8
  %Lambda.newtmp = call ptr @Lambda.new()
  store ptr %Lambda.newtmp, ptr %l, align 8
  %l1 = load ptr, ptr %l, align 8
  %dispatch.isnull = icmp eq ptr %l1, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %l1, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 13
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %x2 = load ptr, ptr %x.addr, align 8
  %e3 = load ptr, ptr %e.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %l1, ptr %x2, ptr %e3)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @Term.app(ptr %this, ptr %e1, ptr %e2) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %e1.addr = alloca ptr, align 8
  store ptr %e1, ptr %e1.addr, align 8
  %e2.addr = alloca ptr, align 8
  store ptr %e2, ptr %e2.addr, align 8
  %a = alloca ptr, align 8
  %App.newtmp = call ptr @App.new()
  store ptr %App.newtmp, ptr %a, align 8
  %a1 = load ptr, ptr %a, align 8
  %dispatch.isnull = icmp eq ptr %a1, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %a1, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 13
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %e12 = load ptr, ptr %e1.addr, align 8
  %e23 = load ptr, ptr %e2.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %a1, ptr %e12, ptr %e23)
  ret ptr %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @Term.i(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %x = alloca ptr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 9
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.13272411544345499535)
  store ptr %dispatch.result, ptr %x, align 8
  %self1 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull4 = icmp eq ptr %self1, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %self1, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 10
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %x8 = load ptr, ptr %x, align 8
  %x9 = load ptr, ptr %x, align 8
  %dispatch.result10 = call ptr %method.ptr7(ptr %self1, ptr %x8, ptr %x9)
  ret ptr %dispatch.result10

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable
}

define ptr @Term.k(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %x = alloca ptr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 9
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.13272411544345499535)
  store ptr %dispatch.result, ptr %x, align 8
  %y = alloca ptr, align 8
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
  %dispatch.result8 = call ptr %method.ptr7(ptr %self1, ptr @.str.15160494916537613830)
  store ptr %dispatch.result8, ptr %y, align 8
  %self9 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull12 = icmp eq ptr %self9, null
  br i1 %dispatch.isnull12, label %dispatch.abort11, label %dispatch.ok10

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok10:                                    ; preds = %dispatch.ok2
  %vtable.ptr13 = load ptr, ptr %self9, align 8
  %method.ptr.addr14 = getelementptr ptr, ptr %vtable.ptr13, i64 10
  %method.ptr15 = load ptr, ptr %method.ptr.addr14, align 8
  %x16 = load ptr, ptr %x, align 8
  %self17 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull20 = icmp eq ptr %self17, null
  br i1 %dispatch.isnull20, label %dispatch.abort19, label %dispatch.ok18

dispatch.abort11:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable

dispatch.ok18:                                    ; preds = %dispatch.ok10
  %vtable.ptr21 = load ptr, ptr %self17, align 8
  %method.ptr.addr22 = getelementptr ptr, ptr %vtable.ptr21, i64 10
  %method.ptr23 = load ptr, ptr %method.ptr.addr22, align 8
  %y24 = load ptr, ptr %y, align 8
  %x25 = load ptr, ptr %x, align 8
  %dispatch.result26 = call ptr %method.ptr23(ptr %self17, ptr %y24, ptr %x25)
  %dispatch.result27 = call ptr %method.ptr15(ptr %self9, ptr %x16, ptr %dispatch.result26)
  ret ptr %dispatch.result27

dispatch.abort19:                                 ; preds = %dispatch.ok10
  call void @abort()
  unreachable
}

define ptr @Term.s(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %x = alloca ptr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 9
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.13272411544345499535)
  store ptr %dispatch.result, ptr %x, align 8
  %y = alloca ptr, align 8
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
  %dispatch.result8 = call ptr %method.ptr7(ptr %self1, ptr @.str.15160494916537613830)
  store ptr %dispatch.result8, ptr %y, align 8
  %z = alloca ptr, align 8
  %self9 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull12 = icmp eq ptr %self9, null
  br i1 %dispatch.isnull12, label %dispatch.abort11, label %dispatch.ok10

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok10:                                    ; preds = %dispatch.ok2
  %vtable.ptr13 = load ptr, ptr %self9, align 8
  %method.ptr.addr14 = getelementptr ptr, ptr %vtable.ptr13, i64 9
  %method.ptr15 = load ptr, ptr %method.ptr.addr14, align 8
  %dispatch.result16 = call ptr %method.ptr15(ptr %self9, ptr @.str.17970277606898470454)
  store ptr %dispatch.result16, ptr %z, align 8
  %self17 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull20 = icmp eq ptr %self17, null
  br i1 %dispatch.isnull20, label %dispatch.abort19, label %dispatch.ok18

dispatch.abort11:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable

dispatch.ok18:                                    ; preds = %dispatch.ok10
  %vtable.ptr21 = load ptr, ptr %self17, align 8
  %method.ptr.addr22 = getelementptr ptr, ptr %vtable.ptr21, i64 10
  %method.ptr23 = load ptr, ptr %method.ptr.addr22, align 8
  %x24 = load ptr, ptr %x, align 8
  %self25 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull28 = icmp eq ptr %self25, null
  br i1 %dispatch.isnull28, label %dispatch.abort27, label %dispatch.ok26

dispatch.abort19:                                 ; preds = %dispatch.ok10
  call void @abort()
  unreachable

dispatch.ok26:                                    ; preds = %dispatch.ok18
  %vtable.ptr29 = load ptr, ptr %self25, align 8
  %method.ptr.addr30 = getelementptr ptr, ptr %vtable.ptr29, i64 10
  %method.ptr31 = load ptr, ptr %method.ptr.addr30, align 8
  %y32 = load ptr, ptr %y, align 8
  %self33 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull36 = icmp eq ptr %self33, null
  br i1 %dispatch.isnull36, label %dispatch.abort35, label %dispatch.ok34

dispatch.abort27:                                 ; preds = %dispatch.ok18
  call void @abort()
  unreachable

dispatch.ok34:                                    ; preds = %dispatch.ok26
  %vtable.ptr37 = load ptr, ptr %self33, align 8
  %method.ptr.addr38 = getelementptr ptr, ptr %vtable.ptr37, i64 10
  %method.ptr39 = load ptr, ptr %method.ptr.addr38, align 8
  %z40 = load ptr, ptr %z, align 8
  %self41 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull44 = icmp eq ptr %self41, null
  br i1 %dispatch.isnull44, label %dispatch.abort43, label %dispatch.ok42

dispatch.abort35:                                 ; preds = %dispatch.ok26
  call void @abort()
  unreachable

dispatch.ok42:                                    ; preds = %dispatch.ok34
  %vtable.ptr45 = load ptr, ptr %self41, align 8
  %method.ptr.addr46 = getelementptr ptr, ptr %vtable.ptr45, i64 11
  %method.ptr47 = load ptr, ptr %method.ptr.addr46, align 8
  %self48 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull51 = icmp eq ptr %self48, null
  br i1 %dispatch.isnull51, label %dispatch.abort50, label %dispatch.ok49

dispatch.abort43:                                 ; preds = %dispatch.ok34
  call void @abort()
  unreachable

dispatch.ok49:                                    ; preds = %dispatch.ok42
  %vtable.ptr52 = load ptr, ptr %self48, align 8
  %method.ptr.addr53 = getelementptr ptr, ptr %vtable.ptr52, i64 11
  %method.ptr54 = load ptr, ptr %method.ptr.addr53, align 8
  %x55 = load ptr, ptr %x, align 8
  %z56 = load ptr, ptr %z, align 8
  %dispatch.result57 = call ptr %method.ptr54(ptr %self48, ptr %x55, ptr %z56)
  %self58 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull61 = icmp eq ptr %self58, null
  br i1 %dispatch.isnull61, label %dispatch.abort60, label %dispatch.ok59

dispatch.abort50:                                 ; preds = %dispatch.ok42
  call void @abort()
  unreachable

dispatch.ok59:                                    ; preds = %dispatch.ok49
  %vtable.ptr62 = load ptr, ptr %self58, align 8
  %method.ptr.addr63 = getelementptr ptr, ptr %vtable.ptr62, i64 11
  %method.ptr64 = load ptr, ptr %method.ptr.addr63, align 8
  %y65 = load ptr, ptr %y, align 8
  %z66 = load ptr, ptr %z, align 8
  %dispatch.result67 = call ptr %method.ptr64(ptr %self58, ptr %y65, ptr %z66)
  %dispatch.result68 = call ptr %method.ptr47(ptr %self41, ptr %dispatch.result57, ptr %dispatch.result67)
  %dispatch.result69 = call ptr %method.ptr39(ptr %self33, ptr %z40, ptr %dispatch.result68)
  %dispatch.result70 = call ptr %method.ptr31(ptr %self25, ptr %y32, ptr %dispatch.result69)
  %dispatch.result71 = call ptr %method.ptr23(ptr %self17, ptr %x24, ptr %dispatch.result70)
  ret ptr %dispatch.result71

dispatch.abort60:                                 ; preds = %dispatch.ok49
  call void @abort()
  unreachable
}

define ptr @Main.beta_reduce(ptr %this, ptr %e) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %e.addr = alloca ptr, align 8
  store ptr %e, ptr %e.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.8442259972690638296)
  %e1 = load ptr, ptr %e.addr, align 8
  %dispatch.isnull4 = icmp eq ptr %e1, null
  br i1 %dispatch.isnull4, label %dispatch.abort3, label %dispatch.ok2

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok2:                                     ; preds = %dispatch.ok
  %vtable.ptr5 = load ptr, ptr %e1, align 8
  %method.ptr.addr6 = getelementptr ptr, ptr %vtable.ptr5, i64 9
  %method.ptr7 = load ptr, ptr %method.ptr.addr6, align 8
  %dispatch.result8 = call ptr %method.ptr7(ptr %e1)
  %done = alloca i1, align 1
  store i1 false, ptr %done, align 1
  %new_expr = alloca ptr, align 8
  store ptr null, ptr %new_expr, align 8
  br label %loop.cond

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

loop.cond:                                        ; preds = %ifcont, %dispatch.ok2
  %done9 = load i1, ptr %done, align 1
  %comptmp = xor i1 %done9, true
  br i1 %comptmp, label %loop.body, label %loop.after

loop.body:                                        ; preds = %loop.cond
  %e10 = load ptr, ptr %e.addr, align 8
  %dispatch.isnull13 = icmp eq ptr %e10, null
  br i1 %dispatch.isnull13, label %dispatch.abort12, label %dispatch.ok11

loop.after:                                       ; preds = %loop.cond
  %self37 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull40 = icmp eq ptr %self37, null
  br i1 %dispatch.isnull40, label %dispatch.abort39, label %dispatch.ok38

dispatch.ok11:                                    ; preds = %loop.body
  %vtable.ptr14 = load ptr, ptr %e10, align 8
  %method.ptr.addr15 = getelementptr ptr, ptr %vtable.ptr14, i64 10
  %method.ptr16 = load ptr, ptr %method.ptr.addr15, align 8
  %dispatch.result17 = call ptr %method.ptr16(ptr %e10)
  store ptr %dispatch.result17, ptr %new_expr, align 8
  %new_expr18 = load ptr, ptr %new_expr, align 8
  %e19 = load ptr, ptr %e.addr, align 8
  %eqtmp = icmp eq ptr %new_expr18, %e19
  br i1 %eqtmp, label %then, label %else

dispatch.abort12:                                 ; preds = %loop.body
  call void @abort()
  unreachable

then:                                             ; preds = %dispatch.ok11
  store i1 true, ptr %done, align 1
  br label %ifcont

else:                                             ; preds = %dispatch.ok11
  %new_expr20 = load ptr, ptr %new_expr, align 8
  store ptr %new_expr20, ptr %e.addr, align 8
  %self21 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull24 = icmp eq ptr %self21, null
  br i1 %dispatch.isnull24, label %dispatch.abort23, label %dispatch.ok22

dispatch.ok22:                                    ; preds = %else
  %vtable.ptr25 = load ptr, ptr %self21, align 8
  %method.ptr.addr26 = getelementptr ptr, ptr %vtable.ptr25, i64 5
  %method.ptr27 = load ptr, ptr %method.ptr.addr26, align 8
  %dispatch.result28 = call ptr %method.ptr27(ptr %self21, ptr @.str.10562876100737056951)
  %e29 = load ptr, ptr %e.addr, align 8
  %dispatch.isnull32 = icmp eq ptr %e29, null
  br i1 %dispatch.isnull32, label %dispatch.abort31, label %dispatch.ok30

dispatch.abort23:                                 ; preds = %else
  call void @abort()
  unreachable

dispatch.ok30:                                    ; preds = %dispatch.ok22
  %vtable.ptr33 = load ptr, ptr %e29, align 8
  %method.ptr.addr34 = getelementptr ptr, ptr %vtable.ptr33, i64 9
  %method.ptr35 = load ptr, ptr %method.ptr.addr34, align 8
  %dispatch.result36 = call ptr %method.ptr35(ptr %e29)
  br label %ifcont

dispatch.abort31:                                 ; preds = %dispatch.ok22
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok30, %then
  %cond_result = phi ptr [ inttoptr (i1 true to ptr), %then ], [ %dispatch.result36, %dispatch.ok30 ]
  br label %loop.cond

dispatch.ok38:                                    ; preds = %loop.after
  %vtable.ptr41 = load ptr, ptr %self37, align 8
  %method.ptr.addr42 = getelementptr ptr, ptr %vtable.ptr41, i64 5
  %method.ptr43 = load ptr, ptr %method.ptr.addr42, align 8
  %dispatch.result44 = call ptr %method.ptr43(ptr %self37, ptr @.str.18400681194753865968)
  %e45 = load ptr, ptr %e.addr, align 8
  ret ptr %e45

dispatch.abort39:                                 ; preds = %loop.after
  call void @abort()
  unreachable
}

define ptr @Main.eval_class(ptr %this) {
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
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.6331855955268116325)
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
  %dispatch.result8 = call ptr %method.ptr7(ptr %self1, ptr @.str.2850205699837169304)
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
  %dispatch.result16 = call ptr %method.ptr15(ptr %self9, ptr @.str.5250540665876017389)
  ret ptr %dispatch.result16

dispatch.abort11:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable
}

define ptr @Main.closure_class(ptr %this) {
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
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.14140416003148633814)
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
  %dispatch.result8 = call ptr %method.ptr7(ptr %self1, ptr @.str.5555451288312873212)
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
  %dispatch.result16 = call ptr %method.ptr15(ptr %self9, ptr @.str.5574883564319458106)
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
  %dispatch.result24 = call ptr %method.ptr23(ptr %self17, ptr @.str.10263194760683832919)
  %self25 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull28 = icmp eq ptr %self25, null
  br i1 %dispatch.isnull28, label %dispatch.abort27, label %dispatch.ok26

dispatch.abort19:                                 ; preds = %dispatch.ok10
  call void @abort()
  unreachable

dispatch.ok26:                                    ; preds = %dispatch.ok18
  %vtable.ptr29 = load ptr, ptr %self25, align 8
  %method.ptr.addr30 = getelementptr ptr, ptr %vtable.ptr29, i64 5
  %method.ptr31 = load ptr, ptr %method.ptr.addr30, align 8
  %dispatch.result32 = call ptr %method.ptr31(ptr %self25, ptr @.str.11586084180363632084)
  %self33 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull36 = icmp eq ptr %self33, null
  br i1 %dispatch.isnull36, label %dispatch.abort35, label %dispatch.ok34

dispatch.abort27:                                 ; preds = %dispatch.ok18
  call void @abort()
  unreachable

dispatch.ok34:                                    ; preds = %dispatch.ok26
  %vtable.ptr37 = load ptr, ptr %self33, align 8
  %method.ptr.addr38 = getelementptr ptr, ptr %vtable.ptr37, i64 5
  %method.ptr39 = load ptr, ptr %method.ptr.addr38, align 8
  %dispatch.result40 = call ptr %method.ptr39(ptr %self33, ptr @.str.3510506908404628057)
  %self41 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull44 = icmp eq ptr %self41, null
  br i1 %dispatch.isnull44, label %dispatch.abort43, label %dispatch.ok42

dispatch.abort35:                                 ; preds = %dispatch.ok26
  call void @abort()
  unreachable

dispatch.ok42:                                    ; preds = %dispatch.ok34
  %vtable.ptr45 = load ptr, ptr %self41, align 8
  %method.ptr.addr46 = getelementptr ptr, ptr %vtable.ptr45, i64 5
  %method.ptr47 = load ptr, ptr %method.ptr.addr46, align 8
  %dispatch.result48 = call ptr %method.ptr47(ptr %self41, ptr @.str.3273516919774520550)
  %self49 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull52 = icmp eq ptr %self49, null
  br i1 %dispatch.isnull52, label %dispatch.abort51, label %dispatch.ok50

dispatch.abort43:                                 ; preds = %dispatch.ok34
  call void @abort()
  unreachable

dispatch.ok50:                                    ; preds = %dispatch.ok42
  %vtable.ptr53 = load ptr, ptr %self49, align 8
  %method.ptr.addr54 = getelementptr ptr, ptr %vtable.ptr53, i64 5
  %method.ptr55 = load ptr, ptr %method.ptr.addr54, align 8
  %dispatch.result56 = call ptr %method.ptr55(ptr %self49, ptr @.str.5250540665876017389)
  ret ptr %dispatch.result56

dispatch.abort51:                                 ; preds = %dispatch.ok42
  call void @abort()
  unreachable
}

define ptr @Main.gen_code(ptr %this, ptr %e) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %e.addr = alloca ptr, align 8
  store ptr %e, ptr %e.addr, align 8
  %cl = alloca ptr, align 8
  %LambdaListRef.newtmp = call ptr @LambdaListRef.new()
  %dispatch.isnull = icmp eq ptr %LambdaListRef.newtmp, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %LambdaListRef.newtmp, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 9
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %LambdaListRef.newtmp)
  store ptr %dispatch.result, ptr %cl, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull3 = icmp eq ptr %self, null
  br i1 %dispatch.isnull3, label %dispatch.abort2, label %dispatch.ok1

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok1:                                     ; preds = %dispatch.ok
  %vtable.ptr4 = load ptr, ptr %self, align 8
  %method.ptr.addr5 = getelementptr ptr, ptr %vtable.ptr4, i64 5
  %method.ptr6 = load ptr, ptr %method.ptr.addr5, align 8
  %dispatch.result7 = call ptr %method.ptr6(ptr %self, ptr @.str.788317370539978547)
  %e8 = load ptr, ptr %e.addr, align 8
  %dispatch.isnull11 = icmp eq ptr %e8, null
  br i1 %dispatch.isnull11, label %dispatch.abort10, label %dispatch.ok9

dispatch.abort2:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok9:                                     ; preds = %dispatch.ok1
  %vtable.ptr12 = load ptr, ptr %e8, align 8
  %method.ptr.addr13 = getelementptr ptr, ptr %vtable.ptr12, i64 9
  %method.ptr14 = load ptr, ptr %method.ptr.addr13, align 8
  %dispatch.result15 = call ptr %method.ptr14(ptr %e8)
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
  %dispatch.result23 = call ptr %method.ptr22(ptr %self16, ptr @.str.17456050816934443332)
  %self24 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull27 = icmp eq ptr %self24, null
  br i1 %dispatch.isnull27, label %dispatch.abort26, label %dispatch.ok25

dispatch.abort18:                                 ; preds = %dispatch.ok9
  call void @abort()
  unreachable

dispatch.ok25:                                    ; preds = %dispatch.ok17
  %vtable.ptr28 = load ptr, ptr %self24, align 8
  %method.ptr.addr29 = getelementptr ptr, ptr %vtable.ptr28, i64 5
  %method.ptr30 = load ptr, ptr %method.ptr.addr29, align 8
  %dispatch.result31 = call ptr %method.ptr30(ptr %self24, ptr @.str.10465691284004345273)
  %self32 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull35 = icmp eq ptr %self32, null
  br i1 %dispatch.isnull35, label %dispatch.abort34, label %dispatch.ok33

dispatch.abort26:                                 ; preds = %dispatch.ok17
  call void @abort()
  unreachable

dispatch.ok33:                                    ; preds = %dispatch.ok25
  %vtable.ptr36 = load ptr, ptr %self32, align 8
  %method.ptr.addr37 = getelementptr ptr, ptr %vtable.ptr36, i64 16
  %method.ptr38 = load ptr, ptr %method.ptr.addr37, align 8
  %dispatch.result39 = call ptr %method.ptr38(ptr %self32)
  %self40 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull43 = icmp eq ptr %self40, null
  br i1 %dispatch.isnull43, label %dispatch.abort42, label %dispatch.ok41

dispatch.abort34:                                 ; preds = %dispatch.ok25
  call void @abort()
  unreachable

dispatch.ok41:                                    ; preds = %dispatch.ok33
  %vtable.ptr44 = load ptr, ptr %self40, align 8
  %method.ptr.addr45 = getelementptr ptr, ptr %vtable.ptr44, i64 17
  %method.ptr46 = load ptr, ptr %method.ptr.addr45, align 8
  %dispatch.result47 = call ptr %method.ptr46(ptr %self40)
  %self48 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull51 = icmp eq ptr %self48, null
  br i1 %dispatch.isnull51, label %dispatch.abort50, label %dispatch.ok49

dispatch.abort42:                                 ; preds = %dispatch.ok33
  call void @abort()
  unreachable

dispatch.ok49:                                    ; preds = %dispatch.ok41
  %vtable.ptr52 = load ptr, ptr %self48, align 8
  %method.ptr.addr53 = getelementptr ptr, ptr %vtable.ptr52, i64 5
  %method.ptr54 = load ptr, ptr %method.ptr.addr53, align 8
  %dispatch.result55 = call ptr %method.ptr54(ptr %self48, ptr @.str.8727090228760159220)
  %self56 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull59 = icmp eq ptr %self56, null
  br i1 %dispatch.isnull59, label %dispatch.abort58, label %dispatch.ok57

dispatch.abort50:                                 ; preds = %dispatch.ok41
  call void @abort()
  unreachable

dispatch.ok57:                                    ; preds = %dispatch.ok49
  %vtable.ptr60 = load ptr, ptr %self56, align 8
  %method.ptr.addr61 = getelementptr ptr, ptr %vtable.ptr60, i64 5
  %method.ptr62 = load ptr, ptr %method.ptr.addr61, align 8
  %dispatch.result63 = call ptr %method.ptr62(ptr %self56, ptr @.str.4818194514738728155)
  %e64 = load ptr, ptr %e.addr, align 8
  %dispatch.isnull67 = icmp eq ptr %e64, null
  br i1 %dispatch.isnull67, label %dispatch.abort66, label %dispatch.ok65

dispatch.abort58:                                 ; preds = %dispatch.ok49
  call void @abort()
  unreachable

dispatch.ok65:                                    ; preds = %dispatch.ok57
  %vtable.ptr68 = load ptr, ptr %e64, align 8
  %method.ptr.addr69 = getelementptr ptr, ptr %vtable.ptr68, i64 12
  %method.ptr70 = load ptr, ptr %method.ptr.addr69, align 8
  %VarList.newtmp = call ptr @VarList.new()
  %cl71 = load ptr, ptr %cl, align 8
  %dispatch.result72 = call ptr %method.ptr70(ptr %e64, ptr %VarList.newtmp, ptr %cl71)
  %self73 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull76 = icmp eq ptr %self73, null
  br i1 %dispatch.isnull76, label %dispatch.abort75, label %dispatch.ok74

dispatch.abort66:                                 ; preds = %dispatch.ok57
  call void @abort()
  unreachable

dispatch.ok74:                                    ; preds = %dispatch.ok65
  %vtable.ptr77 = load ptr, ptr %self73, align 8
  %method.ptr.addr78 = getelementptr ptr, ptr %vtable.ptr77, i64 5
  %method.ptr79 = load ptr, ptr %method.ptr.addr78, align 8
  %dispatch.result80 = call ptr %method.ptr79(ptr %self73, ptr @.str.3599069525930029565)
  br label %loop.cond

dispatch.abort75:                                 ; preds = %dispatch.ok65
  call void @abort()
  unreachable

loop.cond:                                        ; preds = %dispatch.ok123, %dispatch.ok74
  %cl81 = load ptr, ptr %cl, align 8
  %dispatch.isnull84 = icmp eq ptr %cl81, null
  br i1 %dispatch.isnull84, label %dispatch.abort83, label %dispatch.ok82

loop.body:                                        ; preds = %dispatch.ok82
  %e89 = alloca ptr, align 8
  %cl90 = load ptr, ptr %cl, align 8
  %dispatch.isnull93 = icmp eq ptr %cl90, null
  br i1 %dispatch.isnull93, label %dispatch.abort92, label %dispatch.ok91

loop.after:                                       ; preds = %dispatch.ok82
  %self133 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull136 = icmp eq ptr %self133, null
  br i1 %dispatch.isnull136, label %dispatch.abort135, label %dispatch.ok134

dispatch.ok82:                                    ; preds = %loop.cond
  %vtable.ptr85 = load ptr, ptr %cl81, align 8
  %method.ptr.addr86 = getelementptr ptr, ptr %vtable.ptr85, i64 5
  %method.ptr87 = load ptr, ptr %method.ptr.addr86, align 8
  %dispatch.result88 = call i1 %method.ptr87(ptr %cl81)
  %comptmp = xor i1 %dispatch.result88, true
  br i1 %comptmp, label %loop.body, label %loop.after

dispatch.abort83:                                 ; preds = %loop.cond
  call void @abort()
  unreachable

dispatch.ok91:                                    ; preds = %loop.body
  %vtable.ptr94 = load ptr, ptr %cl90, align 8
  %method.ptr.addr95 = getelementptr ptr, ptr %vtable.ptr94, i64 6
  %method.ptr96 = load ptr, ptr %method.ptr.addr95, align 8
  %dispatch.result97 = call ptr %method.ptr96(ptr %cl90)
  store ptr %dispatch.result97, ptr %e89, align 8
  %c = alloca ptr, align 8
  %cl98 = load ptr, ptr %cl, align 8
  %dispatch.isnull101 = icmp eq ptr %cl98, null
  br i1 %dispatch.isnull101, label %dispatch.abort100, label %dispatch.ok99

dispatch.abort92:                                 ; preds = %loop.body
  call void @abort()
  unreachable

dispatch.ok99:                                    ; preds = %dispatch.ok91
  %vtable.ptr102 = load ptr, ptr %cl98, align 8
  %method.ptr.addr103 = getelementptr ptr, ptr %vtable.ptr102, i64 7
  %method.ptr104 = load ptr, ptr %method.ptr.addr103, align 8
  %dispatch.result105 = call ptr %method.ptr104(ptr %cl98)
  store ptr %dispatch.result105, ptr %c, align 8
  %n = alloca i32, align 4
  %cl106 = load ptr, ptr %cl, align 8
  %dispatch.isnull109 = icmp eq ptr %cl106, null
  br i1 %dispatch.isnull109, label %dispatch.abort108, label %dispatch.ok107

dispatch.abort100:                                ; preds = %dispatch.ok91
  call void @abort()
  unreachable

dispatch.ok107:                                   ; preds = %dispatch.ok99
  %vtable.ptr110 = load ptr, ptr %cl106, align 8
  %method.ptr.addr111 = getelementptr ptr, ptr %vtable.ptr110, i64 8
  %method.ptr112 = load ptr, ptr %method.ptr.addr111, align 8
  %dispatch.result113 = call i32 %method.ptr112(ptr %cl106)
  store i32 %dispatch.result113, ptr %n, align 4
  %cl114 = load ptr, ptr %cl, align 8
  %dispatch.isnull117 = icmp eq ptr %cl114, null
  br i1 %dispatch.isnull117, label %dispatch.abort116, label %dispatch.ok115

dispatch.abort108:                                ; preds = %dispatch.ok99
  call void @abort()
  unreachable

dispatch.ok115:                                   ; preds = %dispatch.ok107
  %vtable.ptr118 = load ptr, ptr %cl114, align 8
  %method.ptr.addr119 = getelementptr ptr, ptr %vtable.ptr118, i64 11
  %method.ptr120 = load ptr, ptr %method.ptr.addr119, align 8
  %dispatch.result121 = call ptr %method.ptr120(ptr %cl114)
  %c122 = load ptr, ptr %c, align 8
  %dispatch.isnull125 = icmp eq ptr %c122, null
  br i1 %dispatch.isnull125, label %dispatch.abort124, label %dispatch.ok123

dispatch.abort116:                                ; preds = %dispatch.ok107
  call void @abort()
  unreachable

dispatch.ok123:                                   ; preds = %dispatch.ok115
  %vtable.ptr126 = load ptr, ptr %c122, align 8
  %method.ptr.addr127 = getelementptr ptr, ptr %vtable.ptr126, i64 15
  %method.ptr128 = load ptr, ptr %method.ptr.addr127, align 8
  %n129 = load i32, ptr %n, align 4
  %e130 = load ptr, ptr %e89, align 8
  %cl131 = load ptr, ptr %cl, align 8
  %dispatch.result132 = call ptr %method.ptr128(ptr %c122, i32 %n129, ptr %e130, ptr %cl131)
  br label %loop.cond

dispatch.abort124:                                ; preds = %dispatch.ok115
  call void @abort()
  unreachable

dispatch.ok134:                                   ; preds = %loop.after
  %vtable.ptr137 = load ptr, ptr %self133, align 8
  %method.ptr.addr138 = getelementptr ptr, ptr %vtable.ptr137, i64 5
  %method.ptr139 = load ptr, ptr %method.ptr.addr138, align 8
  %dispatch.result140 = call ptr %method.ptr139(ptr %self133, ptr @.str.17456050816934443332)
  ret ptr %dispatch.result140

dispatch.abort135:                                ; preds = %loop.after
  call void @abort()
  unreachable
}

define i32 @Main.main(ptr %this) {
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
  %dispatch.isnull3 = icmp eq ptr %dispatch.result, null
  br i1 %dispatch.isnull3, label %dispatch.abort2, label %dispatch.ok1

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

dispatch.ok1:                                     ; preds = %dispatch.ok
  %vtable.ptr4 = load ptr, ptr %dispatch.result, align 8
  %method.ptr.addr5 = getelementptr ptr, ptr %vtable.ptr4, i64 9
  %method.ptr6 = load ptr, ptr %method.ptr.addr5, align 8
  %dispatch.result7 = call ptr %method.ptr6(ptr %dispatch.result)
  %self8 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull11 = icmp eq ptr %self8, null
  br i1 %dispatch.isnull11, label %dispatch.abort10, label %dispatch.ok9

dispatch.abort2:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable

dispatch.ok9:                                     ; preds = %dispatch.ok1
  %vtable.ptr12 = load ptr, ptr %self8, align 8
  %method.ptr.addr13 = getelementptr ptr, ptr %vtable.ptr12, i64 5
  %method.ptr14 = load ptr, ptr %method.ptr.addr13, align 8
  %dispatch.result15 = call ptr %method.ptr14(ptr %self8, ptr @.str.18400681194753865968)
  %self16 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull19 = icmp eq ptr %self16, null
  br i1 %dispatch.isnull19, label %dispatch.abort18, label %dispatch.ok17

dispatch.abort10:                                 ; preds = %dispatch.ok1
  call void @abort()
  unreachable

dispatch.ok17:                                    ; preds = %dispatch.ok9
  %vtable.ptr20 = load ptr, ptr %self16, align 8
  %method.ptr.addr21 = getelementptr ptr, ptr %vtable.ptr20, i64 13
  %method.ptr22 = load ptr, ptr %method.ptr.addr21, align 8
  %dispatch.result23 = call ptr %method.ptr22(ptr %self16)
  %dispatch.isnull26 = icmp eq ptr %dispatch.result23, null
  br i1 %dispatch.isnull26, label %dispatch.abort25, label %dispatch.ok24

dispatch.abort18:                                 ; preds = %dispatch.ok9
  call void @abort()
  unreachable

dispatch.ok24:                                    ; preds = %dispatch.ok17
  %vtable.ptr27 = load ptr, ptr %dispatch.result23, align 8
  %method.ptr.addr28 = getelementptr ptr, ptr %vtable.ptr27, i64 9
  %method.ptr29 = load ptr, ptr %method.ptr.addr28, align 8
  %dispatch.result30 = call ptr %method.ptr29(ptr %dispatch.result23)
  %self31 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull34 = icmp eq ptr %self31, null
  br i1 %dispatch.isnull34, label %dispatch.abort33, label %dispatch.ok32

dispatch.abort25:                                 ; preds = %dispatch.ok17
  call void @abort()
  unreachable

dispatch.ok32:                                    ; preds = %dispatch.ok24
  %vtable.ptr35 = load ptr, ptr %self31, align 8
  %method.ptr.addr36 = getelementptr ptr, ptr %vtable.ptr35, i64 5
  %method.ptr37 = load ptr, ptr %method.ptr.addr36, align 8
  %dispatch.result38 = call ptr %method.ptr37(ptr %self31, ptr @.str.18400681194753865968)
  ret i32 0

dispatch.abort33:                                 ; preds = %dispatch.ok24
  call void @abort()
  unreachable
}

define void @_ZN7VarListC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.VarList, ptr %this, i32 0, i32 0
  call void @_ZN2IOC2Ev(ptr %parent.subobject)
  store ptr @_ZTV7VarList, ptr %this, align 8
  ret void
}

define ptr @VarList.new() {
entry:
  %0 = call ptr @malloc(i64 8)
  call void @_ZN7VarListC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN9VarListNEC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.VarListNE, ptr %this, i32 0, i32 0
  call void @_ZN7VarListC2Ev(ptr %parent.subobject)
  store ptr @_ZTV9VarListNE, ptr %this, align 8
  %x.addr.byte = getelementptr i8, ptr %this, i64 8
  store ptr null, ptr %x.addr.byte, align 8
  %rest.addr.byte = getelementptr i8, ptr %this, i64 16
  store ptr null, ptr %rest.addr.byte, align 8
  ret void
}

define ptr @VarListNE.new() {
entry:
  %0 = call ptr @malloc(i64 24)
  call void @_ZN9VarListNEC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN10LambdaListC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.LambdaList, ptr %this, i32 0, i32 0
  call void @_ZN6ObjectC2Ev(ptr %parent.subobject)
  store ptr @_ZTV10LambdaList, ptr %this, align 8
  ret void
}

define ptr @LambdaList.new() {
entry:
  %0 = call ptr @malloc(i64 8)
  call void @_ZN10LambdaListC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN12LambdaListNEC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.LambdaListNE, ptr %this, i32 0, i32 0
  call void @_ZN10LambdaListC2Ev(ptr %parent.subobject)
  store ptr @_ZTV12LambdaListNE, ptr %this, align 8
  %lam.addr.byte = getelementptr i8, ptr %this, i64 8
  store ptr null, ptr %lam.addr.byte, align 8
  %num.addr.byte = getelementptr i8, ptr %this, i64 16
  store i32 0, ptr %num.addr.byte, align 4
  %env.addr.byte = getelementptr i8, ptr %this, i64 24
  store ptr null, ptr %env.addr.byte, align 8
  %rest.addr.byte = getelementptr i8, ptr %this, i64 32
  store ptr null, ptr %rest.addr.byte, align 8
  ret void
}

define ptr @LambdaListNE.new() {
entry:
  %0 = call ptr @malloc(i64 40)
  call void @_ZN12LambdaListNEC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN13LambdaListRefC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.LambdaListRef, ptr %this, i32 0, i32 0
  call void @_ZN6ObjectC2Ev(ptr %parent.subobject)
  store ptr @_ZTV13LambdaListRef, ptr %this, align 8
  %nextNum.addr.byte = getelementptr i8, ptr %this, i64 8
  store i32 0, ptr %nextNum.addr.byte, align 4
  %l.addr.byte = getelementptr i8, ptr %this, i64 16
  store ptr null, ptr %l.addr.byte, align 8
  ret void
}

define ptr @LambdaListRef.new() {
entry:
  %0 = call ptr @malloc(i64 24)
  call void @_ZN13LambdaListRefC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN4ExprC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Expr, ptr %this, i32 0, i32 0
  call void @_ZN2IOC2Ev(ptr %parent.subobject)
  store ptr @_ZTV4Expr, ptr %this, align 8
  ret void
}

define ptr @Expr.new() {
entry:
  %0 = call ptr @malloc(i64 8)
  call void @_ZN4ExprC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN8VariableC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Variable, ptr %this, i32 0, i32 0
  call void @_ZN4ExprC2Ev(ptr %parent.subobject)
  store ptr @_ZTV8Variable, ptr %this, align 8
  %name.addr.byte = getelementptr i8, ptr %this, i64 8
  store ptr @.str.const.6142509188972423790, ptr %name.addr.byte, align 8
  ret void
}

define ptr @Variable.new() {
entry:
  %0 = call ptr @malloc(i64 16)
  call void @_ZN8VariableC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN6LambdaC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Lambda, ptr %this, i32 0, i32 0
  call void @_ZN4ExprC2Ev(ptr %parent.subobject)
  store ptr @_ZTV6Lambda, ptr %this, align 8
  %arg.addr.byte = getelementptr i8, ptr %this, i64 8
  store ptr null, ptr %arg.addr.byte, align 8
  %body.addr.byte = getelementptr i8, ptr %this, i64 16
  store ptr null, ptr %body.addr.byte, align 8
  ret void
}

define ptr @Lambda.new() {
entry:
  %0 = call ptr @malloc(i64 24)
  call void @_ZN6LambdaC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN3AppC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.App, ptr %this, i32 0, i32 0
  call void @_ZN4ExprC2Ev(ptr %parent.subobject)
  store ptr @_ZTV3App, ptr %this, align 8
  %fun.addr.byte = getelementptr i8, ptr %this, i64 8
  store ptr null, ptr %fun.addr.byte, align 8
  %arg.addr.byte = getelementptr i8, ptr %this, i64 16
  store ptr null, ptr %arg.addr.byte, align 8
  ret void
}

define ptr @App.new() {
entry:
  %0 = call ptr @malloc(i64 24)
  call void @_ZN3AppC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN4TermC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Term, ptr %this, i32 0, i32 0
  call void @_ZN2IOC2Ev(ptr %parent.subobject)
  store ptr @_ZTV4Term, ptr %this, align 8
  ret void
}

define ptr @Term.new() {
entry:
  %0 = call ptr @malloc(i64 8)
  call void @_ZN4TermC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN4MainC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Main, ptr %this, i32 0, i32 0
  call void @_ZN4TermC2Ev(ptr %parent.subobject)
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
  %0 = call i32 @Main.main(ptr %main.obj)
  ret i32 0
}

attributes #0 = { noreturn }
