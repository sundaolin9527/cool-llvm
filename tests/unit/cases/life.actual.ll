; ModuleID = 'main_module'
source_filename = "main_module"

%struct.__cxxabiv1.__class_type_info = type { ptr, ptr }
%struct.__cxxabiv1.__si_class_type_info = type { ptr, ptr, ptr }
%class.Int = type { %class.Object.0, i32, [4 x i8] }
%class.Object.0 = type { ptr }
%class.Bool = type { %class.Object.0, i1, [7 x i8] }
%class.String = type { %class.Object.0, ptr, i32, [4 x i8], i32, [4 x i8] }
%class.IO.1 = type { %class.Object.0 }
%class.Board = type { %class.IO.1, i32, [4 x i8], i32, [4 x i8], i32, [4 x i8] }
%class.CellularAutomaton = type { %class.Board, ptr }
%class.Main = type { %class.CellularAutomaton, ptr }

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
@_ZTS5Board = linkonce_odr constant [7 x i8] c"5Board\00", align 1
@_ZTI5Board = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS5Board, ptr @_ZTI2IO }, align 8
@_ZTV5Board = linkonce_odr constant [11 x ptr] [ptr null, ptr @_ZTI5Board, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Board.size_of_board, ptr @Board.board_init], align 8
@_ZTS17CellularAutomaton = linkonce_odr constant [20 x i8] c"17CellularAutomaton\00", align 1
@_ZTI17CellularAutomaton = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS17CellularAutomaton, ptr @_ZTI5Board }, align 8
@_ZTV17CellularAutomaton = linkonce_odr constant [29 x ptr] [ptr null, ptr @_ZTI17CellularAutomaton, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Board.size_of_board, ptr @Board.board_init, ptr @CellularAutomaton.init, ptr @CellularAutomaton.print, ptr @CellularAutomaton.num_cells, ptr @CellularAutomaton.cell, ptr @CellularAutomaton.north, ptr @CellularAutomaton.south, ptr @CellularAutomaton.east, ptr @CellularAutomaton.west, ptr @CellularAutomaton.northwest, ptr @CellularAutomaton.northeast, ptr @CellularAutomaton.southeast, ptr @CellularAutomaton.southwest, ptr @CellularAutomaton.neighbors, ptr @CellularAutomaton.cell_at_next_evolution, ptr @CellularAutomaton.evolve, ptr @CellularAutomaton.option, ptr @CellularAutomaton.prompt, ptr @CellularAutomaton.prompt2], align 8
@_ZTS4Main = linkonce_odr constant [6 x i8] c"4Main\00", align 1
@_ZTI4Main = linkonce_odr constant %struct.__cxxabiv1.__si_class_type_info { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS4Main, ptr @_ZTI17CellularAutomaton }, align 8
@_ZTV4Main = linkonce_odr constant [30 x ptr] [ptr null, ptr @_ZTI4Main, ptr @Object_copy, ptr @Object_abort, ptr @Object_type_name, ptr @IO_out_string, ptr @IO_out_int, ptr @IO_in_string, ptr @IO_in_int, ptr @Board.size_of_board, ptr @Board.board_init, ptr @CellularAutomaton.init, ptr @CellularAutomaton.print, ptr @CellularAutomaton.num_cells, ptr @CellularAutomaton.cell, ptr @CellularAutomaton.north, ptr @CellularAutomaton.south, ptr @CellularAutomaton.east, ptr @CellularAutomaton.west, ptr @CellularAutomaton.northwest, ptr @CellularAutomaton.northeast, ptr @CellularAutomaton.southeast, ptr @CellularAutomaton.southwest, ptr @CellularAutomaton.neighbors, ptr @CellularAutomaton.cell_at_next_evolution, ptr @CellularAutomaton.evolve, ptr @CellularAutomaton.option, ptr @CellularAutomaton.prompt, ptr @CellularAutomaton.prompt2, ptr @Main.main], align 8
@.str.18400681194753865968 = private constant [2 x i8] c"\0A\00"
@.str.17934988915447438835 = private constant [2 x i8] c" \00"
@.str.12043374440167815914 = private constant [2 x i8] c"X\00"
@.str.7372855250431704371 = private constant [2 x i8] c"-\00"
@.str.17182423431551013152 = private constant [25 x i8] c"\0APlease chose a number:\0A\00"
@.str.4976805888592363028 = private constant [13 x i8] c"\091: A cross\0A\00"
@.str.8766326927498780616 = private constant [48 x i8] c"\092: A slash from the upper left to lower right\0A\00"
@.str.14472657817268074726 = private constant [48 x i8] c"\093: A slash from the upper right to lower left\0A\00"
@.str.17063214030316861602 = private constant [10 x i8] c"\094: An X\0A\00"
@.str.3237680947941416703 = private constant [26 x i8] c"\095: A greater than sign \0A\00"
@.str.9715675746760777888 = private constant [22 x i8] c"\096: A less than sign\0A\00"
@.str.6188255984384224985 = private constant [28 x i8] c"\097: Two greater than signs\0A\00"
@.str.13093759697997929834 = private constant [25 x i8] c"\098: Two less than signs\0A\00"
@.str.1844808023169469744 = private constant [11 x i8] c"\099: A 'V'\0A\00"
@.str.18392673435121279194 = private constant [21 x i8] c"\0910: An inverse 'V'\0A\00"
@.str.6110194050161560045 = private constant [32 x i8] c"\0911: Numbers 9 and 10 combined\0A\00"
@.str.12861055793599178448 = private constant [18 x i8] c"\0912: A full grid\0A\00"
@.str.12258234201544585219 = private constant [12 x i8] c"\0913: A 'T'\0A\00"
@.str.5915793174505792576 = private constant [17 x i8] c"\0914: A plus '+'\0A\00"
@.str.11055501953781188564 = private constant [12 x i8] c"\0915: A 'W'\0A\00"
@.str.8763693023673063635 = private constant [13 x i8] c"\0916: An 'M'\0A\00"
@.str.10666608565696786357 = private constant [13 x i8] c"\0917: An 'E'\0A\00"
@.str.9010286070556667348 = private constant [12 x i8] c"\0918: A '3'\0A\00"
@.str.3250768254912411348 = private constant [13 x i8] c"\0919: An 'O'\0A\00"
@.str.14635558894957775050 = private constant [13 x i8] c"\0920: An '8'\0A\00"
@.str.17934433099561595079 = private constant [13 x i8] c"\0921: An 'S'\0A\00"
@.str.18110462138288328859 = private constant [16 x i8] c"Your choice => \00"
@.str.6020815297648224428 = private constant [21 x i8] c" XX  XXXX XXXX  XX  \00"
@.str.14082101252600835028 = private constant [26 x i8] c"    X   X   X   X   X    \00"
@.str.10370737271660450686 = private constant [26 x i8] c"X     X     X     X     X\00"
@.str.13810137511727375266 = private constant [26 x i8] c"X   X X X   X   X X X   X\00"
@.str.8554476518536890737 = private constant [26 x i8] c"X     X     X   X   X    \00"
@.str.3578311845064639526 = private constant [26 x i8] c"    X   X   X     X     X\00"
@.str.15475166125855133481 = private constant [21 x i8] c"X  X  X  XX  X      \00"
@.str.6486498083074353280 = private constant [21 x i8] c" X  XX  X  X  X     \00"
@.str.1720376043156572213 = private constant [16 x i8] c"X   X X X   X  \00"
@.str.12164476460503599322 = private constant [16 x i8] c"  X   X X X   X\00"
@.str.13590890355069450419 = private constant [16 x i8] c"X X X X X X X X\00"
@.str.1192997724355619033 = private constant [26 x i8] c"XXXXXXXXXXXXXXXXXXXXXXXXX\00"
@.str.10875632029827725596 = private constant [26 x i8] c"XXXXX  X    X    X    X  \00"
@.str.1322195112996861203 = private constant [26 x i8] c"  X    X  XXXXX  X    X  \00"
@.str.9488634533155329225 = private constant [22 x i8] c"X     X X X X   X X  \00"
@.str.10289097988630045312 = private constant [22 x i8] c"  X X   X X X X     X\00"
@.str.466469543761224631 = private constant [29 x i8] c"XXXXX   X   XXXXX   X   XXXX\00"
@.str.15878700390537487928 = private constant [29 x i8] c"XXX    X   X  X    X   XXXX \00"
@.str.18879824403368309 = private constant [17 x i8] c" XX X  XX  X XX \00"
@.str.15519766171431846422 = private constant [29 x i8] c" XX X  XX  X XX X  XX  X XX \00"
@.str.14526837739119704657 = private constant [29 x i8] c" XXXX   X    XX    X   XXXX \00"
@.str.15742825105966697332 = private constant [26 x i8] c"                         \00"
@.str.1415532122195024542 = private constant [55 x i8] c"Would you like to continue with the next generation? \0A\00"
@.str.16809106215964835616 = private constant [50 x i8] c"Please use lowercase y or n for your answer [y]: \00"
@.str.9826907452181669771 = private constant [2 x i8] c"n\00"
@.str.15867152849721451935 = private constant [3 x i8] c"\0A\0A\00"
@.str.9297509020441554450 = private constant [49 x i8] c"Would you like to choose a background pattern? \0A\00"
@.str.3293305892035076251 = private constant [50 x i8] c"Please use lowercase y or n for your answer [n]: \00"
@.str.15160494916537613830 = private constant [2 x i8] c"y\00"
@.str.1858591978224213472 = private constant [30 x i8] c"Welcome to the Game of Life.\0A\00"
@.str.6558307453630196106 = private constant [48 x i8] c"There are many initial states to choose from. \0A\00"

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

define i32 @Board.size_of_board(ptr %this, ptr %initial) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %initial.addr = alloca ptr, align 8
  store ptr %initial, ptr %initial.addr, align 8
  %initial1 = load ptr, ptr %initial.addr, align 8
  %dispatch.isnull = icmp eq ptr %initial1, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %dispatch.result = call i32 @String_length(ptr %initial1)
  ret i32 %dispatch.result

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @Board.board_init(ptr %this, ptr %start) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %start.addr = alloca ptr, align 8
  store ptr %start, ptr %start.addr, align 8
  %size = alloca i32, align 4
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 9
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %start1 = load ptr, ptr %start.addr, align 8
  %dispatch.result = call i32 %method.ptr(ptr %self, ptr %start1)
  store i32 %dispatch.result, ptr %size, align 4
  %size2 = load i32, ptr %size, align 4
  %eqtmp = icmp eq i32 %size2, 15
  br i1 %eqtmp, label %then, label %else

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

then:                                             ; preds = %dispatch.ok
  %self3 = load ptr, ptr %this.addr, align 8
  %rows.addr = getelementptr i8, ptr %self3, i32 8
  store i32 3, ptr %rows.addr, align 4
  %self4 = load ptr, ptr %this.addr, align 8
  %columns.addr = getelementptr i8, ptr %self4, i32 16
  store i32 5, ptr %columns.addr, align 4
  %size5 = load i32, ptr %size, align 4
  %self6 = load ptr, ptr %this.addr, align 8
  %board_size.addr = getelementptr i8, ptr %self6, i32 24
  store i32 %size5, ptr %board_size.addr, align 4
  br label %ifcont77

else:                                             ; preds = %dispatch.ok
  %size7 = load i32, ptr %size, align 4
  %eqtmp8 = icmp eq i32 %size7, 16
  br i1 %eqtmp8, label %then9, label %else17

then9:                                            ; preds = %else
  %self10 = load ptr, ptr %this.addr, align 8
  %rows.addr11 = getelementptr i8, ptr %self10, i32 8
  store i32 4, ptr %rows.addr11, align 4
  %self12 = load ptr, ptr %this.addr, align 8
  %columns.addr13 = getelementptr i8, ptr %self12, i32 16
  store i32 4, ptr %columns.addr13, align 4
  %size14 = load i32, ptr %size, align 4
  %self15 = load ptr, ptr %this.addr, align 8
  %board_size.addr16 = getelementptr i8, ptr %self15, i32 24
  store i32 %size14, ptr %board_size.addr16, align 4
  br label %ifcont75

else17:                                           ; preds = %else
  %size18 = load i32, ptr %size, align 4
  %eqtmp19 = icmp eq i32 %size18, 20
  br i1 %eqtmp19, label %then20, label %else28

then20:                                           ; preds = %else17
  %self21 = load ptr, ptr %this.addr, align 8
  %rows.addr22 = getelementptr i8, ptr %self21, i32 8
  store i32 4, ptr %rows.addr22, align 4
  %self23 = load ptr, ptr %this.addr, align 8
  %columns.addr24 = getelementptr i8, ptr %self23, i32 16
  store i32 5, ptr %columns.addr24, align 4
  %size25 = load i32, ptr %size, align 4
  %self26 = load ptr, ptr %this.addr, align 8
  %board_size.addr27 = getelementptr i8, ptr %self26, i32 24
  store i32 %size25, ptr %board_size.addr27, align 4
  br label %ifcont73

else28:                                           ; preds = %else17
  %size29 = load i32, ptr %size, align 4
  %eqtmp30 = icmp eq i32 %size29, 21
  br i1 %eqtmp30, label %then31, label %else39

then31:                                           ; preds = %else28
  %self32 = load ptr, ptr %this.addr, align 8
  %rows.addr33 = getelementptr i8, ptr %self32, i32 8
  store i32 3, ptr %rows.addr33, align 4
  %self34 = load ptr, ptr %this.addr, align 8
  %columns.addr35 = getelementptr i8, ptr %self34, i32 16
  store i32 7, ptr %columns.addr35, align 4
  %size36 = load i32, ptr %size, align 4
  %self37 = load ptr, ptr %this.addr, align 8
  %board_size.addr38 = getelementptr i8, ptr %self37, i32 24
  store i32 %size36, ptr %board_size.addr38, align 4
  br label %ifcont71

else39:                                           ; preds = %else28
  %size40 = load i32, ptr %size, align 4
  %eqtmp41 = icmp eq i32 %size40, 25
  br i1 %eqtmp41, label %then42, label %else50

then42:                                           ; preds = %else39
  %self43 = load ptr, ptr %this.addr, align 8
  %rows.addr44 = getelementptr i8, ptr %self43, i32 8
  store i32 5, ptr %rows.addr44, align 4
  %self45 = load ptr, ptr %this.addr, align 8
  %columns.addr46 = getelementptr i8, ptr %self45, i32 16
  store i32 5, ptr %columns.addr46, align 4
  %size47 = load i32, ptr %size, align 4
  %self48 = load ptr, ptr %this.addr, align 8
  %board_size.addr49 = getelementptr i8, ptr %self48, i32 24
  store i32 %size47, ptr %board_size.addr49, align 4
  br label %ifcont69

else50:                                           ; preds = %else39
  %size51 = load i32, ptr %size, align 4
  %eqtmp52 = icmp eq i32 %size51, 28
  br i1 %eqtmp52, label %then53, label %else61

then53:                                           ; preds = %else50
  %self54 = load ptr, ptr %this.addr, align 8
  %rows.addr55 = getelementptr i8, ptr %self54, i32 8
  store i32 7, ptr %rows.addr55, align 4
  %self56 = load ptr, ptr %this.addr, align 8
  %columns.addr57 = getelementptr i8, ptr %self56, i32 16
  store i32 4, ptr %columns.addr57, align 4
  %size58 = load i32, ptr %size, align 4
  %self59 = load ptr, ptr %this.addr, align 8
  %board_size.addr60 = getelementptr i8, ptr %self59, i32 24
  store i32 %size58, ptr %board_size.addr60, align 4
  br label %ifcont

else61:                                           ; preds = %else50
  %self62 = load ptr, ptr %this.addr, align 8
  %rows.addr63 = getelementptr i8, ptr %self62, i32 8
  store i32 5, ptr %rows.addr63, align 4
  %self64 = load ptr, ptr %this.addr, align 8
  %columns.addr65 = getelementptr i8, ptr %self64, i32 16
  store i32 5, ptr %columns.addr65, align 4
  %size66 = load i32, ptr %size, align 4
  %self67 = load ptr, ptr %this.addr, align 8
  %board_size.addr68 = getelementptr i8, ptr %self67, i32 24
  store i32 %size66, ptr %board_size.addr68, align 4
  br label %ifcont

ifcont:                                           ; preds = %else61, %then53
  %cond_result = phi i32 [ %size58, %then53 ], [ %size66, %else61 ]
  br label %ifcont69

ifcont69:                                         ; preds = %ifcont, %then42
  %cond_result70 = phi i32 [ %size47, %then42 ], [ %cond_result, %ifcont ]
  br label %ifcont71

ifcont71:                                         ; preds = %ifcont69, %then31
  %cond_result72 = phi i32 [ %size36, %then31 ], [ %cond_result70, %ifcont69 ]
  br label %ifcont73

ifcont73:                                         ; preds = %ifcont71, %then20
  %cond_result74 = phi i32 [ %size25, %then20 ], [ %cond_result72, %ifcont71 ]
  br label %ifcont75

ifcont75:                                         ; preds = %ifcont73, %then9
  %cond_result76 = phi i32 [ %size14, %then9 ], [ %cond_result74, %ifcont73 ]
  br label %ifcont77

ifcont77:                                         ; preds = %ifcont75, %then
  %cond_result78 = phi i32 [ %size5, %then ], [ %cond_result76, %ifcont75 ]
  %self79 = load ptr, ptr %this.addr, align 8
  ret ptr %self79
}

define ptr @CellularAutomaton.init(ptr %this, ptr %map) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %map.addr = alloca ptr, align 8
  store ptr %map, ptr %map.addr, align 8
  %map1 = load ptr, ptr %map.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %population_map.addr = getelementptr i8, ptr %self, i32 32
  store ptr %map1, ptr %population_map.addr, align 8
  %self2 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self2, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self2, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 10
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %map3 = load ptr, ptr %map.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self2, ptr %map3)
  %self4 = load ptr, ptr %this.addr, align 8
  ret ptr %self4

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable
}

define ptr @CellularAutomaton.print(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %i = alloca i32, align 4
  store i32 0, ptr %i, align 4
  %num = alloca i32, align 4
  %self = load ptr, ptr %this.addr, align 8
  %board_size.addr = getelementptr i8, ptr %self, i32 24
  %board_size = load i32, ptr %board_size.addr, align 4
  store i32 %board_size, ptr %num, align 4
  %self1 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self1, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self1, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self1, ptr @.str.18400681194753865968)
  br label %loop.cond

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

loop.cond:                                        ; preds = %dispatch.ok20, %dispatch.ok
  %i2 = load i32, ptr %i, align 4
  %num3 = load i32, ptr %num, align 4
  %cmptmp = icmp slt i32 %i2, %num3
  br i1 %cmptmp, label %loop.body, label %loop.after

loop.body:                                        ; preds = %loop.cond
  %self4 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull7 = icmp eq ptr %self4, null
  br i1 %dispatch.isnull7, label %dispatch.abort6, label %dispatch.ok5

loop.after:                                       ; preds = %loop.cond
  %self31 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull34 = icmp eq ptr %self31, null
  br i1 %dispatch.isnull34, label %dispatch.abort33, label %dispatch.ok32

dispatch.ok5:                                     ; preds = %loop.body
  %vtable.ptr8 = load ptr, ptr %self4, align 8
  %method.ptr.addr9 = getelementptr ptr, ptr %vtable.ptr8, i64 5
  %method.ptr10 = load ptr, ptr %method.ptr.addr9, align 8
  %self11 = load ptr, ptr %this.addr, align 8
  %population_map.addr = getelementptr i8, ptr %self11, i32 32
  %population_map = load ptr, ptr %population_map.addr, align 8
  %dispatch.isnull14 = icmp eq ptr %population_map, null
  br i1 %dispatch.isnull14, label %dispatch.abort13, label %dispatch.ok12

dispatch.abort6:                                  ; preds = %loop.body
  call void @abort()
  unreachable

dispatch.ok12:                                    ; preds = %dispatch.ok5
  %i15 = load i32, ptr %i, align 4
  %self16 = load ptr, ptr %this.addr, align 8
  %columns.addr = getelementptr i8, ptr %self16, i32 16
  %columns = load i32, ptr %columns.addr, align 4
  %dispatch.result17 = call ptr @String_substr(ptr %population_map, i32 %i15, i32 %columns)
  %dispatch.result18 = call ptr %method.ptr10(ptr %self4, ptr %dispatch.result17)
  %self19 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull22 = icmp eq ptr %self19, null
  br i1 %dispatch.isnull22, label %dispatch.abort21, label %dispatch.ok20

dispatch.abort13:                                 ; preds = %dispatch.ok5
  call void @abort()
  unreachable

dispatch.ok20:                                    ; preds = %dispatch.ok12
  %vtable.ptr23 = load ptr, ptr %self19, align 8
  %method.ptr.addr24 = getelementptr ptr, ptr %vtable.ptr23, i64 5
  %method.ptr25 = load ptr, ptr %method.ptr.addr24, align 8
  %dispatch.result26 = call ptr %method.ptr25(ptr %self19, ptr @.str.18400681194753865968)
  %i27 = load i32, ptr %i, align 4
  %self28 = load ptr, ptr %this.addr, align 8
  %columns.addr29 = getelementptr i8, ptr %self28, i32 16
  %columns30 = load i32, ptr %columns.addr29, align 4
  %addtmp = add i32 %i27, %columns30
  store i32 %addtmp, ptr %i, align 4
  br label %loop.cond

dispatch.abort21:                                 ; preds = %dispatch.ok12
  call void @abort()
  unreachable

dispatch.ok32:                                    ; preds = %loop.after
  %vtable.ptr35 = load ptr, ptr %self31, align 8
  %method.ptr.addr36 = getelementptr ptr, ptr %vtable.ptr35, i64 5
  %method.ptr37 = load ptr, ptr %method.ptr.addr36, align 8
  %dispatch.result38 = call ptr %method.ptr37(ptr %self31, ptr @.str.18400681194753865968)
  %self39 = load ptr, ptr %this.addr, align 8
  ret ptr %self39

dispatch.abort33:                                 ; preds = %loop.after
  call void @abort()
  unreachable
}

define i32 @CellularAutomaton.num_cells(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %self = load ptr, ptr %this.addr, align 8
  %population_map.addr = getelementptr i8, ptr %self, i32 32
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
  %board_size.addr = getelementptr i8, ptr %self, i32 24
  %board_size = load i32, ptr %board_size.addr, align 4
  %subtmp = sub i32 %board_size, 1
  %position1 = load i32, ptr %position.addr, align 4
  %cmptmp = icmp slt i32 %subtmp, %position1
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  br label %ifcont

else:                                             ; preds = %entry
  %self2 = load ptr, ptr %this.addr, align 8
  %population_map.addr = getelementptr i8, ptr %self2, i32 32
  %population_map = load ptr, ptr %population_map.addr, align 8
  %dispatch.isnull = icmp eq ptr %population_map, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %else
  %position3 = load i32, ptr %position.addr, align 4
  %dispatch.result = call ptr @String_substr(ptr %population_map, i32 %position3, i32 1)
  br label %ifcont

dispatch.abort:                                   ; preds = %else
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok, %then
  %cond_result = phi ptr [ @.str.17934988915447438835, %then ], [ %dispatch.result, %dispatch.ok ]
  ret ptr %cond_result
}

define ptr @CellularAutomaton.north(ptr %this, i32 %position) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %position.addr = alloca i32, align 4
  store i32 %position, ptr %position.addr, align 4
  %position1 = load i32, ptr %position.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %columns.addr = getelementptr i8, ptr %self, i32 16
  %columns = load i32, ptr %columns.addr, align 4
  %subtmp = sub i32 %position1, %columns
  %cmptmp = icmp slt i32 %subtmp, 0
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  br label %ifcont

else:                                             ; preds = %entry
  %self2 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self2, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %else
  %vtable.ptr = load ptr, ptr %self2, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 14
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %position3 = load i32, ptr %position.addr, align 4
  %self4 = load ptr, ptr %this.addr, align 8
  %columns.addr5 = getelementptr i8, ptr %self4, i32 16
  %columns6 = load i32, ptr %columns.addr5, align 4
  %subtmp7 = sub i32 %position3, %columns6
  %dispatch.result = call ptr %method.ptr(ptr %self2, i32 %subtmp7)
  br label %ifcont

dispatch.abort:                                   ; preds = %else
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok, %then
  %cond_result = phi ptr [ @.str.17934988915447438835, %then ], [ %dispatch.result, %dispatch.ok ]
  ret ptr %cond_result
}

define ptr @CellularAutomaton.south(ptr %this, i32 %position) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %position.addr = alloca i32, align 4
  store i32 %position, ptr %position.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %board_size.addr = getelementptr i8, ptr %self, i32 24
  %board_size = load i32, ptr %board_size.addr, align 4
  %position1 = load i32, ptr %position.addr, align 4
  %self2 = load ptr, ptr %this.addr, align 8
  %columns.addr = getelementptr i8, ptr %self2, i32 16
  %columns = load i32, ptr %columns.addr, align 4
  %addtmp = add i32 %position1, %columns
  %cmptmp = icmp slt i32 %board_size, %addtmp
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  br label %ifcont

else:                                             ; preds = %entry
  %self3 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self3, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %else
  %vtable.ptr = load ptr, ptr %self3, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 14
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %position4 = load i32, ptr %position.addr, align 4
  %self5 = load ptr, ptr %this.addr, align 8
  %columns.addr6 = getelementptr i8, ptr %self5, i32 16
  %columns7 = load i32, ptr %columns.addr6, align 4
  %addtmp8 = add i32 %position4, %columns7
  %dispatch.result = call ptr %method.ptr(ptr %self3, i32 %addtmp8)
  br label %ifcont

dispatch.abort:                                   ; preds = %else
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok, %then
  %cond_result = phi ptr [ @.str.17934988915447438835, %then ], [ %dispatch.result, %dispatch.ok ]
  ret ptr %cond_result
}

define ptr @CellularAutomaton.east(ptr %this, i32 %position) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %position.addr = alloca i32, align 4
  store i32 %position, ptr %position.addr, align 4
  %position1 = load i32, ptr %position.addr, align 4
  %addtmp = add i32 %position1, 1
  %self = load ptr, ptr %this.addr, align 8
  %columns.addr = getelementptr i8, ptr %self, i32 16
  %columns = load i32, ptr %columns.addr, align 4
  %divtmp = sdiv i32 %addtmp, %columns
  %self2 = load ptr, ptr %this.addr, align 8
  %columns.addr3 = getelementptr i8, ptr %self2, i32 16
  %columns4 = load i32, ptr %columns.addr3, align 4
  %multmp = mul i32 %divtmp, %columns4
  %position5 = load i32, ptr %position.addr, align 4
  %addtmp6 = add i32 %position5, 1
  %eqtmp = icmp eq i32 %multmp, %addtmp6
  br i1 %eqtmp, label %then, label %else

then:                                             ; preds = %entry
  br label %ifcont

else:                                             ; preds = %entry
  %self7 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self7, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %else
  %vtable.ptr = load ptr, ptr %self7, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 14
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %position8 = load i32, ptr %position.addr, align 4
  %addtmp9 = add i32 %position8, 1
  %dispatch.result = call ptr %method.ptr(ptr %self7, i32 %addtmp9)
  br label %ifcont

dispatch.abort:                                   ; preds = %else
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok, %then
  %cond_result = phi ptr [ @.str.17934988915447438835, %then ], [ %dispatch.result, %dispatch.ok ]
  ret ptr %cond_result
}

define ptr @CellularAutomaton.west(ptr %this, i32 %position) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %position.addr = alloca i32, align 4
  store i32 %position, ptr %position.addr, align 4
  %position1 = load i32, ptr %position.addr, align 4
  %eqtmp = icmp eq i32 %position1, 0
  br i1 %eqtmp, label %then, label %else

then:                                             ; preds = %entry
  br label %ifcont12

else:                                             ; preds = %entry
  %position2 = load i32, ptr %position.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %columns.addr = getelementptr i8, ptr %self, i32 16
  %columns = load i32, ptr %columns.addr, align 4
  %divtmp = sdiv i32 %position2, %columns
  %self3 = load ptr, ptr %this.addr, align 8
  %columns.addr4 = getelementptr i8, ptr %self3, i32 16
  %columns5 = load i32, ptr %columns.addr4, align 4
  %multmp = mul i32 %divtmp, %columns5
  %position6 = load i32, ptr %position.addr, align 4
  %eqtmp7 = icmp eq i32 %multmp, %position6
  br i1 %eqtmp7, label %then8, label %else9

then8:                                            ; preds = %else
  br label %ifcont

else9:                                            ; preds = %else
  %self10 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self10, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %else9
  %vtable.ptr = load ptr, ptr %self10, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 14
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %position11 = load i32, ptr %position.addr, align 4
  %subtmp = sub i32 %position11, 1
  %dispatch.result = call ptr %method.ptr(ptr %self10, i32 %subtmp)
  br label %ifcont

dispatch.abort:                                   ; preds = %else9
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok, %then8
  %cond_result = phi ptr [ @.str.17934988915447438835, %then8 ], [ %dispatch.result, %dispatch.ok ]
  br label %ifcont12

ifcont12:                                         ; preds = %ifcont, %then
  %cond_result13 = phi ptr [ @.str.17934988915447438835, %then ], [ %cond_result, %ifcont ]
  ret ptr %cond_result13
}

define ptr @CellularAutomaton.northwest(ptr %this, i32 %position) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %position.addr = alloca i32, align 4
  store i32 %position, ptr %position.addr, align 4
  %position1 = load i32, ptr %position.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %columns.addr = getelementptr i8, ptr %self, i32 16
  %columns = load i32, ptr %columns.addr, align 4
  %subtmp = sub i32 %position1, %columns
  %cmptmp = icmp slt i32 %subtmp, 0
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  br label %ifcont15

else:                                             ; preds = %entry
  %position2 = load i32, ptr %position.addr, align 4
  %self3 = load ptr, ptr %this.addr, align 8
  %columns.addr4 = getelementptr i8, ptr %self3, i32 16
  %columns5 = load i32, ptr %columns.addr4, align 4
  %divtmp = sdiv i32 %position2, %columns5
  %self6 = load ptr, ptr %this.addr, align 8
  %columns.addr7 = getelementptr i8, ptr %self6, i32 16
  %columns8 = load i32, ptr %columns.addr7, align 4
  %multmp = mul i32 %divtmp, %columns8
  %position9 = load i32, ptr %position.addr, align 4
  %eqtmp = icmp eq i32 %multmp, %position9
  br i1 %eqtmp, label %then10, label %else11

then10:                                           ; preds = %else
  br label %ifcont

else11:                                           ; preds = %else
  %self12 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self12, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %else11
  %vtable.ptr = load ptr, ptr %self12, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 15
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %position13 = load i32, ptr %position.addr, align 4
  %subtmp14 = sub i32 %position13, 1
  %dispatch.result = call ptr %method.ptr(ptr %self12, i32 %subtmp14)
  br label %ifcont

dispatch.abort:                                   ; preds = %else11
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok, %then10
  %cond_result = phi ptr [ @.str.17934988915447438835, %then10 ], [ %dispatch.result, %dispatch.ok ]
  br label %ifcont15

ifcont15:                                         ; preds = %ifcont, %then
  %cond_result16 = phi ptr [ @.str.17934988915447438835, %then ], [ %cond_result, %ifcont ]
  ret ptr %cond_result16
}

define ptr @CellularAutomaton.northeast(ptr %this, i32 %position) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %position.addr = alloca i32, align 4
  store i32 %position, ptr %position.addr, align 4
  %position1 = load i32, ptr %position.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %columns.addr = getelementptr i8, ptr %self, i32 16
  %columns = load i32, ptr %columns.addr, align 4
  %subtmp = sub i32 %position1, %columns
  %cmptmp = icmp slt i32 %subtmp, 0
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  br label %ifcont16

else:                                             ; preds = %entry
  %position2 = load i32, ptr %position.addr, align 4
  %addtmp = add i32 %position2, 1
  %self3 = load ptr, ptr %this.addr, align 8
  %columns.addr4 = getelementptr i8, ptr %self3, i32 16
  %columns5 = load i32, ptr %columns.addr4, align 4
  %divtmp = sdiv i32 %addtmp, %columns5
  %self6 = load ptr, ptr %this.addr, align 8
  %columns.addr7 = getelementptr i8, ptr %self6, i32 16
  %columns8 = load i32, ptr %columns.addr7, align 4
  %multmp = mul i32 %divtmp, %columns8
  %position9 = load i32, ptr %position.addr, align 4
  %addtmp10 = add i32 %position9, 1
  %eqtmp = icmp eq i32 %multmp, %addtmp10
  br i1 %eqtmp, label %then11, label %else12

then11:                                           ; preds = %else
  br label %ifcont

else12:                                           ; preds = %else
  %self13 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self13, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %else12
  %vtable.ptr = load ptr, ptr %self13, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 15
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %position14 = load i32, ptr %position.addr, align 4
  %addtmp15 = add i32 %position14, 1
  %dispatch.result = call ptr %method.ptr(ptr %self13, i32 %addtmp15)
  br label %ifcont

dispatch.abort:                                   ; preds = %else12
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok, %then11
  %cond_result = phi ptr [ @.str.17934988915447438835, %then11 ], [ %dispatch.result, %dispatch.ok ]
  br label %ifcont16

ifcont16:                                         ; preds = %ifcont, %then
  %cond_result17 = phi ptr [ @.str.17934988915447438835, %then ], [ %cond_result, %ifcont ]
  ret ptr %cond_result17
}

define ptr @CellularAutomaton.southeast(ptr %this, i32 %position) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %position.addr = alloca i32, align 4
  store i32 %position, ptr %position.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %board_size.addr = getelementptr i8, ptr %self, i32 24
  %board_size = load i32, ptr %board_size.addr, align 4
  %position1 = load i32, ptr %position.addr, align 4
  %self2 = load ptr, ptr %this.addr, align 8
  %columns.addr = getelementptr i8, ptr %self2, i32 16
  %columns = load i32, ptr %columns.addr, align 4
  %addtmp = add i32 %position1, %columns
  %cmptmp = icmp slt i32 %board_size, %addtmp
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  br label %ifcont18

else:                                             ; preds = %entry
  %position3 = load i32, ptr %position.addr, align 4
  %addtmp4 = add i32 %position3, 1
  %self5 = load ptr, ptr %this.addr, align 8
  %columns.addr6 = getelementptr i8, ptr %self5, i32 16
  %columns7 = load i32, ptr %columns.addr6, align 4
  %divtmp = sdiv i32 %addtmp4, %columns7
  %self8 = load ptr, ptr %this.addr, align 8
  %columns.addr9 = getelementptr i8, ptr %self8, i32 16
  %columns10 = load i32, ptr %columns.addr9, align 4
  %multmp = mul i32 %divtmp, %columns10
  %position11 = load i32, ptr %position.addr, align 4
  %addtmp12 = add i32 %position11, 1
  %eqtmp = icmp eq i32 %multmp, %addtmp12
  br i1 %eqtmp, label %then13, label %else14

then13:                                           ; preds = %else
  br label %ifcont

else14:                                           ; preds = %else
  %self15 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self15, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %else14
  %vtable.ptr = load ptr, ptr %self15, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 16
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %position16 = load i32, ptr %position.addr, align 4
  %addtmp17 = add i32 %position16, 1
  %dispatch.result = call ptr %method.ptr(ptr %self15, i32 %addtmp17)
  br label %ifcont

dispatch.abort:                                   ; preds = %else14
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok, %then13
  %cond_result = phi ptr [ @.str.17934988915447438835, %then13 ], [ %dispatch.result, %dispatch.ok ]
  br label %ifcont18

ifcont18:                                         ; preds = %ifcont, %then
  %cond_result19 = phi ptr [ @.str.17934988915447438835, %then ], [ %cond_result, %ifcont ]
  ret ptr %cond_result19
}

define ptr @CellularAutomaton.southwest(ptr %this, i32 %position) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %position.addr = alloca i32, align 4
  store i32 %position, ptr %position.addr, align 4
  %self = load ptr, ptr %this.addr, align 8
  %board_size.addr = getelementptr i8, ptr %self, i32 24
  %board_size = load i32, ptr %board_size.addr, align 4
  %position1 = load i32, ptr %position.addr, align 4
  %self2 = load ptr, ptr %this.addr, align 8
  %columns.addr = getelementptr i8, ptr %self2, i32 16
  %columns = load i32, ptr %columns.addr, align 4
  %addtmp = add i32 %position1, %columns
  %cmptmp = icmp slt i32 %board_size, %addtmp
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  br label %ifcont15

else:                                             ; preds = %entry
  %position3 = load i32, ptr %position.addr, align 4
  %self4 = load ptr, ptr %this.addr, align 8
  %columns.addr5 = getelementptr i8, ptr %self4, i32 16
  %columns6 = load i32, ptr %columns.addr5, align 4
  %divtmp = sdiv i32 %position3, %columns6
  %self7 = load ptr, ptr %this.addr, align 8
  %columns.addr8 = getelementptr i8, ptr %self7, i32 16
  %columns9 = load i32, ptr %columns.addr8, align 4
  %multmp = mul i32 %divtmp, %columns9
  %position10 = load i32, ptr %position.addr, align 4
  %eqtmp = icmp eq i32 %multmp, %position10
  br i1 %eqtmp, label %then11, label %else12

then11:                                           ; preds = %else
  br label %ifcont

else12:                                           ; preds = %else
  %self13 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self13, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %else12
  %vtable.ptr = load ptr, ptr %self13, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 16
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %position14 = load i32, ptr %position.addr, align 4
  %subtmp = sub i32 %position14, 1
  %dispatch.result = call ptr %method.ptr(ptr %self13, i32 %subtmp)
  br label %ifcont

dispatch.abort:                                   ; preds = %else12
  call void @abort()
  unreachable

ifcont:                                           ; preds = %dispatch.ok, %then11
  %cond_result = phi ptr [ @.str.17934988915447438835, %then11 ], [ %dispatch.result, %dispatch.ok ]
  br label %ifcont15

ifcont15:                                         ; preds = %ifcont, %then
  %cond_result16 = phi ptr [ @.str.17934988915447438835, %then ], [ %cond_result, %ifcont ]
  ret ptr %cond_result16
}

define i32 @CellularAutomaton.neighbors(ptr %this, i32 %position) {
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
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 15
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
  %method.ptr.addr7 = getelementptr ptr, ptr %vtable.ptr6, i64 16
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
  %method.ptr.addr21 = getelementptr ptr, ptr %vtable.ptr20, i64 17
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
  %self31 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull34 = icmp eq ptr %self31, null
  br i1 %dispatch.isnull34, label %dispatch.abort33, label %dispatch.ok32

dispatch.ok32:                                    ; preds = %ifcont28
  %vtable.ptr35 = load ptr, ptr %self31, align 8
  %method.ptr.addr36 = getelementptr ptr, ptr %vtable.ptr35, i64 18
  %method.ptr37 = load ptr, ptr %method.ptr.addr36, align 8
  %position38 = load i32, ptr %position.addr, align 4
  %dispatch.result39 = call ptr %method.ptr37(ptr %self31, i32 %position38)
  %eqtmp40 = call i1 @String_equals(ptr %dispatch.result39, ptr @.str.12043374440167815914)
  br i1 %eqtmp40, label %then41, label %else42

dispatch.abort33:                                 ; preds = %ifcont28
  call void @abort()
  unreachable

then41:                                           ; preds = %dispatch.ok32
  br label %ifcont43

else42:                                           ; preds = %dispatch.ok32
  br label %ifcont43

ifcont43:                                         ; preds = %else42, %then41
  %cond_result44 = phi i32 [ 1, %then41 ], [ 0, %else42 ]
  %addtmp45 = add i32 %addtmp30, %cond_result44
  %self46 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull49 = icmp eq ptr %self46, null
  br i1 %dispatch.isnull49, label %dispatch.abort48, label %dispatch.ok47

dispatch.ok47:                                    ; preds = %ifcont43
  %vtable.ptr50 = load ptr, ptr %self46, align 8
  %method.ptr.addr51 = getelementptr ptr, ptr %vtable.ptr50, i64 20
  %method.ptr52 = load ptr, ptr %method.ptr.addr51, align 8
  %position53 = load i32, ptr %position.addr, align 4
  %dispatch.result54 = call ptr %method.ptr52(ptr %self46, i32 %position53)
  %eqtmp55 = call i1 @String_equals(ptr %dispatch.result54, ptr @.str.12043374440167815914)
  br i1 %eqtmp55, label %then56, label %else57

dispatch.abort48:                                 ; preds = %ifcont43
  call void @abort()
  unreachable

then56:                                           ; preds = %dispatch.ok47
  br label %ifcont58

else57:                                           ; preds = %dispatch.ok47
  br label %ifcont58

ifcont58:                                         ; preds = %else57, %then56
  %cond_result59 = phi i32 [ 1, %then56 ], [ 0, %else57 ]
  %addtmp60 = add i32 %addtmp45, %cond_result59
  %self61 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull64 = icmp eq ptr %self61, null
  br i1 %dispatch.isnull64, label %dispatch.abort63, label %dispatch.ok62

dispatch.ok62:                                    ; preds = %ifcont58
  %vtable.ptr65 = load ptr, ptr %self61, align 8
  %method.ptr.addr66 = getelementptr ptr, ptr %vtable.ptr65, i64 19
  %method.ptr67 = load ptr, ptr %method.ptr.addr66, align 8
  %position68 = load i32, ptr %position.addr, align 4
  %dispatch.result69 = call ptr %method.ptr67(ptr %self61, i32 %position68)
  %eqtmp70 = call i1 @String_equals(ptr %dispatch.result69, ptr @.str.12043374440167815914)
  br i1 %eqtmp70, label %then71, label %else72

dispatch.abort63:                                 ; preds = %ifcont58
  call void @abort()
  unreachable

then71:                                           ; preds = %dispatch.ok62
  br label %ifcont73

else72:                                           ; preds = %dispatch.ok62
  br label %ifcont73

ifcont73:                                         ; preds = %else72, %then71
  %cond_result74 = phi i32 [ 1, %then71 ], [ 0, %else72 ]
  %addtmp75 = add i32 %addtmp60, %cond_result74
  %self76 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull79 = icmp eq ptr %self76, null
  br i1 %dispatch.isnull79, label %dispatch.abort78, label %dispatch.ok77

dispatch.ok77:                                    ; preds = %ifcont73
  %vtable.ptr80 = load ptr, ptr %self76, align 8
  %method.ptr.addr81 = getelementptr ptr, ptr %vtable.ptr80, i64 21
  %method.ptr82 = load ptr, ptr %method.ptr.addr81, align 8
  %position83 = load i32, ptr %position.addr, align 4
  %dispatch.result84 = call ptr %method.ptr82(ptr %self76, i32 %position83)
  %eqtmp85 = call i1 @String_equals(ptr %dispatch.result84, ptr @.str.12043374440167815914)
  br i1 %eqtmp85, label %then86, label %else87

dispatch.abort78:                                 ; preds = %ifcont73
  call void @abort()
  unreachable

then86:                                           ; preds = %dispatch.ok77
  br label %ifcont88

else87:                                           ; preds = %dispatch.ok77
  br label %ifcont88

ifcont88:                                         ; preds = %else87, %then86
  %cond_result89 = phi i32 [ 1, %then86 ], [ 0, %else87 ]
  %addtmp90 = add i32 %addtmp75, %cond_result89
  %self91 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull94 = icmp eq ptr %self91, null
  br i1 %dispatch.isnull94, label %dispatch.abort93, label %dispatch.ok92

dispatch.ok92:                                    ; preds = %ifcont88
  %vtable.ptr95 = load ptr, ptr %self91, align 8
  %method.ptr.addr96 = getelementptr ptr, ptr %vtable.ptr95, i64 22
  %method.ptr97 = load ptr, ptr %method.ptr.addr96, align 8
  %position98 = load i32, ptr %position.addr, align 4
  %dispatch.result99 = call ptr %method.ptr97(ptr %self91, i32 %position98)
  %eqtmp100 = call i1 @String_equals(ptr %dispatch.result99, ptr @.str.12043374440167815914)
  br i1 %eqtmp100, label %then101, label %else102

dispatch.abort93:                                 ; preds = %ifcont88
  call void @abort()
  unreachable

then101:                                          ; preds = %dispatch.ok92
  br label %ifcont103

else102:                                          ; preds = %dispatch.ok92
  br label %ifcont103

ifcont103:                                        ; preds = %else102, %then101
  %cond_result104 = phi i32 [ 1, %then101 ], [ 0, %else102 ]
  %addtmp105 = add i32 %addtmp90, %cond_result104
  ret i32 %addtmp105
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
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 23
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %position1 = load i32, ptr %position.addr, align 4
  %dispatch.result = call i32 %method.ptr(ptr %self, i32 %position1)
  %eqtmp = icmp eq i32 %dispatch.result, 3
  br i1 %eqtmp, label %then, label %else

dispatch.abort:                                   ; preds = %entry
  call void @abort()
  unreachable

then:                                             ; preds = %dispatch.ok
  br label %ifcont28

else:                                             ; preds = %dispatch.ok
  %self2 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull5 = icmp eq ptr %self2, null
  br i1 %dispatch.isnull5, label %dispatch.abort4, label %dispatch.ok3

dispatch.ok3:                                     ; preds = %else
  %vtable.ptr6 = load ptr, ptr %self2, align 8
  %method.ptr.addr7 = getelementptr ptr, ptr %vtable.ptr6, i64 23
  %method.ptr8 = load ptr, ptr %method.ptr.addr7, align 8
  %position9 = load i32, ptr %position.addr, align 4
  %dispatch.result10 = call i32 %method.ptr8(ptr %self2, i32 %position9)
  %eqtmp11 = icmp eq i32 %dispatch.result10, 2
  br i1 %eqtmp11, label %then12, label %else25

dispatch.abort4:                                  ; preds = %else
  call void @abort()
  unreachable

then12:                                           ; preds = %dispatch.ok3
  %self13 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull16 = icmp eq ptr %self13, null
  br i1 %dispatch.isnull16, label %dispatch.abort15, label %dispatch.ok14

dispatch.ok14:                                    ; preds = %then12
  %vtable.ptr17 = load ptr, ptr %self13, align 8
  %method.ptr.addr18 = getelementptr ptr, ptr %vtable.ptr17, i64 14
  %method.ptr19 = load ptr, ptr %method.ptr.addr18, align 8
  %position20 = load i32, ptr %position.addr, align 4
  %dispatch.result21 = call ptr %method.ptr19(ptr %self13, i32 %position20)
  %eqtmp22 = call i1 @String_equals(ptr %dispatch.result21, ptr @.str.12043374440167815914)
  br i1 %eqtmp22, label %then23, label %else24

dispatch.abort15:                                 ; preds = %then12
  call void @abort()
  unreachable

then23:                                           ; preds = %dispatch.ok14
  br label %ifcont

else24:                                           ; preds = %dispatch.ok14
  br label %ifcont

ifcont:                                           ; preds = %else24, %then23
  %cond_result = phi ptr [ @.str.12043374440167815914, %then23 ], [ @.str.7372855250431704371, %else24 ]
  br label %ifcont26

else25:                                           ; preds = %dispatch.ok3
  br label %ifcont26

ifcont26:                                         ; preds = %else25, %ifcont
  %cond_result27 = phi ptr [ %cond_result, %ifcont ], [ @.str.7372855250431704371, %else25 ]
  br label %ifcont28

ifcont28:                                         ; preds = %ifcont26, %then
  %cond_result29 = phi ptr [ @.str.12043374440167815914, %then ], [ %cond_result27, %ifcont26 ]
  ret ptr %cond_result29
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
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 13
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
  %population_map.addr = getelementptr i8, ptr %self19, i32 32
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
  %method.ptr.addr12 = getelementptr ptr, ptr %vtable.ptr11, i64 24
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

define ptr @CellularAutomaton.option(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %num = alloca i32, align 4
  store i32 0, ptr %num, align 4
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.17182423431551013152)
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
  %dispatch.result8 = call ptr %method.ptr7(ptr %self1, ptr @.str.4976805888592363028)
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
  %dispatch.result16 = call ptr %method.ptr15(ptr %self9, ptr @.str.8766326927498780616)
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
  %dispatch.result24 = call ptr %method.ptr23(ptr %self17, ptr @.str.14472657817268074726)
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
  %dispatch.result32 = call ptr %method.ptr31(ptr %self25, ptr @.str.17063214030316861602)
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
  %dispatch.result40 = call ptr %method.ptr39(ptr %self33, ptr @.str.3237680947941416703)
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
  %dispatch.result48 = call ptr %method.ptr47(ptr %self41, ptr @.str.9715675746760777888)
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
  %dispatch.result56 = call ptr %method.ptr55(ptr %self49, ptr @.str.6188255984384224985)
  %self57 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull60 = icmp eq ptr %self57, null
  br i1 %dispatch.isnull60, label %dispatch.abort59, label %dispatch.ok58

dispatch.abort51:                                 ; preds = %dispatch.ok42
  call void @abort()
  unreachable

dispatch.ok58:                                    ; preds = %dispatch.ok50
  %vtable.ptr61 = load ptr, ptr %self57, align 8
  %method.ptr.addr62 = getelementptr ptr, ptr %vtable.ptr61, i64 5
  %method.ptr63 = load ptr, ptr %method.ptr.addr62, align 8
  %dispatch.result64 = call ptr %method.ptr63(ptr %self57, ptr @.str.13093759697997929834)
  %self65 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull68 = icmp eq ptr %self65, null
  br i1 %dispatch.isnull68, label %dispatch.abort67, label %dispatch.ok66

dispatch.abort59:                                 ; preds = %dispatch.ok50
  call void @abort()
  unreachable

dispatch.ok66:                                    ; preds = %dispatch.ok58
  %vtable.ptr69 = load ptr, ptr %self65, align 8
  %method.ptr.addr70 = getelementptr ptr, ptr %vtable.ptr69, i64 5
  %method.ptr71 = load ptr, ptr %method.ptr.addr70, align 8
  %dispatch.result72 = call ptr %method.ptr71(ptr %self65, ptr @.str.1844808023169469744)
  %self73 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull76 = icmp eq ptr %self73, null
  br i1 %dispatch.isnull76, label %dispatch.abort75, label %dispatch.ok74

dispatch.abort67:                                 ; preds = %dispatch.ok58
  call void @abort()
  unreachable

dispatch.ok74:                                    ; preds = %dispatch.ok66
  %vtable.ptr77 = load ptr, ptr %self73, align 8
  %method.ptr.addr78 = getelementptr ptr, ptr %vtable.ptr77, i64 5
  %method.ptr79 = load ptr, ptr %method.ptr.addr78, align 8
  %dispatch.result80 = call ptr %method.ptr79(ptr %self73, ptr @.str.18392673435121279194)
  %self81 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull84 = icmp eq ptr %self81, null
  br i1 %dispatch.isnull84, label %dispatch.abort83, label %dispatch.ok82

dispatch.abort75:                                 ; preds = %dispatch.ok66
  call void @abort()
  unreachable

dispatch.ok82:                                    ; preds = %dispatch.ok74
  %vtable.ptr85 = load ptr, ptr %self81, align 8
  %method.ptr.addr86 = getelementptr ptr, ptr %vtable.ptr85, i64 5
  %method.ptr87 = load ptr, ptr %method.ptr.addr86, align 8
  %dispatch.result88 = call ptr %method.ptr87(ptr %self81, ptr @.str.6110194050161560045)
  %self89 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull92 = icmp eq ptr %self89, null
  br i1 %dispatch.isnull92, label %dispatch.abort91, label %dispatch.ok90

dispatch.abort83:                                 ; preds = %dispatch.ok74
  call void @abort()
  unreachable

dispatch.ok90:                                    ; preds = %dispatch.ok82
  %vtable.ptr93 = load ptr, ptr %self89, align 8
  %method.ptr.addr94 = getelementptr ptr, ptr %vtable.ptr93, i64 5
  %method.ptr95 = load ptr, ptr %method.ptr.addr94, align 8
  %dispatch.result96 = call ptr %method.ptr95(ptr %self89, ptr @.str.12861055793599178448)
  %self97 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull100 = icmp eq ptr %self97, null
  br i1 %dispatch.isnull100, label %dispatch.abort99, label %dispatch.ok98

dispatch.abort91:                                 ; preds = %dispatch.ok82
  call void @abort()
  unreachable

dispatch.ok98:                                    ; preds = %dispatch.ok90
  %vtable.ptr101 = load ptr, ptr %self97, align 8
  %method.ptr.addr102 = getelementptr ptr, ptr %vtable.ptr101, i64 5
  %method.ptr103 = load ptr, ptr %method.ptr.addr102, align 8
  %dispatch.result104 = call ptr %method.ptr103(ptr %self97, ptr @.str.12258234201544585219)
  %self105 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull108 = icmp eq ptr %self105, null
  br i1 %dispatch.isnull108, label %dispatch.abort107, label %dispatch.ok106

dispatch.abort99:                                 ; preds = %dispatch.ok90
  call void @abort()
  unreachable

dispatch.ok106:                                   ; preds = %dispatch.ok98
  %vtable.ptr109 = load ptr, ptr %self105, align 8
  %method.ptr.addr110 = getelementptr ptr, ptr %vtable.ptr109, i64 5
  %method.ptr111 = load ptr, ptr %method.ptr.addr110, align 8
  %dispatch.result112 = call ptr %method.ptr111(ptr %self105, ptr @.str.5915793174505792576)
  %self113 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull116 = icmp eq ptr %self113, null
  br i1 %dispatch.isnull116, label %dispatch.abort115, label %dispatch.ok114

dispatch.abort107:                                ; preds = %dispatch.ok98
  call void @abort()
  unreachable

dispatch.ok114:                                   ; preds = %dispatch.ok106
  %vtable.ptr117 = load ptr, ptr %self113, align 8
  %method.ptr.addr118 = getelementptr ptr, ptr %vtable.ptr117, i64 5
  %method.ptr119 = load ptr, ptr %method.ptr.addr118, align 8
  %dispatch.result120 = call ptr %method.ptr119(ptr %self113, ptr @.str.11055501953781188564)
  %self121 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull124 = icmp eq ptr %self121, null
  br i1 %dispatch.isnull124, label %dispatch.abort123, label %dispatch.ok122

dispatch.abort115:                                ; preds = %dispatch.ok106
  call void @abort()
  unreachable

dispatch.ok122:                                   ; preds = %dispatch.ok114
  %vtable.ptr125 = load ptr, ptr %self121, align 8
  %method.ptr.addr126 = getelementptr ptr, ptr %vtable.ptr125, i64 5
  %method.ptr127 = load ptr, ptr %method.ptr.addr126, align 8
  %dispatch.result128 = call ptr %method.ptr127(ptr %self121, ptr @.str.8763693023673063635)
  %self129 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull132 = icmp eq ptr %self129, null
  br i1 %dispatch.isnull132, label %dispatch.abort131, label %dispatch.ok130

dispatch.abort123:                                ; preds = %dispatch.ok114
  call void @abort()
  unreachable

dispatch.ok130:                                   ; preds = %dispatch.ok122
  %vtable.ptr133 = load ptr, ptr %self129, align 8
  %method.ptr.addr134 = getelementptr ptr, ptr %vtable.ptr133, i64 5
  %method.ptr135 = load ptr, ptr %method.ptr.addr134, align 8
  %dispatch.result136 = call ptr %method.ptr135(ptr %self129, ptr @.str.10666608565696786357)
  %self137 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull140 = icmp eq ptr %self137, null
  br i1 %dispatch.isnull140, label %dispatch.abort139, label %dispatch.ok138

dispatch.abort131:                                ; preds = %dispatch.ok122
  call void @abort()
  unreachable

dispatch.ok138:                                   ; preds = %dispatch.ok130
  %vtable.ptr141 = load ptr, ptr %self137, align 8
  %method.ptr.addr142 = getelementptr ptr, ptr %vtable.ptr141, i64 5
  %method.ptr143 = load ptr, ptr %method.ptr.addr142, align 8
  %dispatch.result144 = call ptr %method.ptr143(ptr %self137, ptr @.str.9010286070556667348)
  %self145 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull148 = icmp eq ptr %self145, null
  br i1 %dispatch.isnull148, label %dispatch.abort147, label %dispatch.ok146

dispatch.abort139:                                ; preds = %dispatch.ok130
  call void @abort()
  unreachable

dispatch.ok146:                                   ; preds = %dispatch.ok138
  %vtable.ptr149 = load ptr, ptr %self145, align 8
  %method.ptr.addr150 = getelementptr ptr, ptr %vtable.ptr149, i64 5
  %method.ptr151 = load ptr, ptr %method.ptr.addr150, align 8
  %dispatch.result152 = call ptr %method.ptr151(ptr %self145, ptr @.str.3250768254912411348)
  %self153 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull156 = icmp eq ptr %self153, null
  br i1 %dispatch.isnull156, label %dispatch.abort155, label %dispatch.ok154

dispatch.abort147:                                ; preds = %dispatch.ok138
  call void @abort()
  unreachable

dispatch.ok154:                                   ; preds = %dispatch.ok146
  %vtable.ptr157 = load ptr, ptr %self153, align 8
  %method.ptr.addr158 = getelementptr ptr, ptr %vtable.ptr157, i64 5
  %method.ptr159 = load ptr, ptr %method.ptr.addr158, align 8
  %dispatch.result160 = call ptr %method.ptr159(ptr %self153, ptr @.str.14635558894957775050)
  %self161 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull164 = icmp eq ptr %self161, null
  br i1 %dispatch.isnull164, label %dispatch.abort163, label %dispatch.ok162

dispatch.abort155:                                ; preds = %dispatch.ok146
  call void @abort()
  unreachable

dispatch.ok162:                                   ; preds = %dispatch.ok154
  %vtable.ptr165 = load ptr, ptr %self161, align 8
  %method.ptr.addr166 = getelementptr ptr, ptr %vtable.ptr165, i64 5
  %method.ptr167 = load ptr, ptr %method.ptr.addr166, align 8
  %dispatch.result168 = call ptr %method.ptr167(ptr %self161, ptr @.str.17934433099561595079)
  %self169 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull172 = icmp eq ptr %self169, null
  br i1 %dispatch.isnull172, label %dispatch.abort171, label %dispatch.ok170

dispatch.abort163:                                ; preds = %dispatch.ok154
  call void @abort()
  unreachable

dispatch.ok170:                                   ; preds = %dispatch.ok162
  %vtable.ptr173 = load ptr, ptr %self169, align 8
  %method.ptr.addr174 = getelementptr ptr, ptr %vtable.ptr173, i64 5
  %method.ptr175 = load ptr, ptr %method.ptr.addr174, align 8
  %dispatch.result176 = call ptr %method.ptr175(ptr %self169, ptr @.str.18110462138288328859)
  %self177 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull180 = icmp eq ptr %self177, null
  br i1 %dispatch.isnull180, label %dispatch.abort179, label %dispatch.ok178

dispatch.abort171:                                ; preds = %dispatch.ok162
  call void @abort()
  unreachable

dispatch.ok178:                                   ; preds = %dispatch.ok170
  %vtable.ptr181 = load ptr, ptr %self177, align 8
  %method.ptr.addr182 = getelementptr ptr, ptr %vtable.ptr181, i64 8
  %method.ptr183 = load ptr, ptr %method.ptr.addr182, align 8
  %dispatch.result184 = call i32 %method.ptr183(ptr %self177)
  store i32 %dispatch.result184, ptr %num, align 4
  %self185 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull188 = icmp eq ptr %self185, null
  br i1 %dispatch.isnull188, label %dispatch.abort187, label %dispatch.ok186

dispatch.abort179:                                ; preds = %dispatch.ok170
  call void @abort()
  unreachable

dispatch.ok186:                                   ; preds = %dispatch.ok178
  %vtable.ptr189 = load ptr, ptr %self185, align 8
  %method.ptr.addr190 = getelementptr ptr, ptr %vtable.ptr189, i64 5
  %method.ptr191 = load ptr, ptr %method.ptr.addr190, align 8
  %dispatch.result192 = call ptr %method.ptr191(ptr %self185, ptr @.str.18400681194753865968)
  %num193 = load i32, ptr %num, align 4
  %eqtmp = icmp eq i32 %num193, 1
  br i1 %eqtmp, label %then, label %else

dispatch.abort187:                                ; preds = %dispatch.ok178
  call void @abort()
  unreachable

then:                                             ; preds = %dispatch.ok186
  br label %ifcont312

else:                                             ; preds = %dispatch.ok186
  %num194 = load i32, ptr %num, align 4
  %eqtmp195 = icmp eq i32 %num194, 2
  br i1 %eqtmp195, label %then196, label %else197

then196:                                          ; preds = %else
  br label %ifcont310

else197:                                          ; preds = %else
  %num198 = load i32, ptr %num, align 4
  %eqtmp199 = icmp eq i32 %num198, 3
  br i1 %eqtmp199, label %then200, label %else201

then200:                                          ; preds = %else197
  br label %ifcont308

else201:                                          ; preds = %else197
  %num202 = load i32, ptr %num, align 4
  %eqtmp203 = icmp eq i32 %num202, 4
  br i1 %eqtmp203, label %then204, label %else205

then204:                                          ; preds = %else201
  br label %ifcont306

else205:                                          ; preds = %else201
  %num206 = load i32, ptr %num, align 4
  %eqtmp207 = icmp eq i32 %num206, 5
  br i1 %eqtmp207, label %then208, label %else209

then208:                                          ; preds = %else205
  br label %ifcont304

else209:                                          ; preds = %else205
  %num210 = load i32, ptr %num, align 4
  %eqtmp211 = icmp eq i32 %num210, 6
  br i1 %eqtmp211, label %then212, label %else213

then212:                                          ; preds = %else209
  br label %ifcont302

else213:                                          ; preds = %else209
  %num214 = load i32, ptr %num, align 4
  %eqtmp215 = icmp eq i32 %num214, 7
  br i1 %eqtmp215, label %then216, label %else217

then216:                                          ; preds = %else213
  br label %ifcont300

else217:                                          ; preds = %else213
  %num218 = load i32, ptr %num, align 4
  %eqtmp219 = icmp eq i32 %num218, 8
  br i1 %eqtmp219, label %then220, label %else221

then220:                                          ; preds = %else217
  br label %ifcont298

else221:                                          ; preds = %else217
  %num222 = load i32, ptr %num, align 4
  %eqtmp223 = icmp eq i32 %num222, 9
  br i1 %eqtmp223, label %then224, label %else225

then224:                                          ; preds = %else221
  br label %ifcont296

else225:                                          ; preds = %else221
  %num226 = load i32, ptr %num, align 4
  %eqtmp227 = icmp eq i32 %num226, 10
  br i1 %eqtmp227, label %then228, label %else229

then228:                                          ; preds = %else225
  br label %ifcont294

else229:                                          ; preds = %else225
  %num230 = load i32, ptr %num, align 4
  %eqtmp231 = icmp eq i32 %num230, 11
  br i1 %eqtmp231, label %then232, label %else233

then232:                                          ; preds = %else229
  br label %ifcont292

else233:                                          ; preds = %else229
  %num234 = load i32, ptr %num, align 4
  %eqtmp235 = icmp eq i32 %num234, 12
  br i1 %eqtmp235, label %then236, label %else237

then236:                                          ; preds = %else233
  br label %ifcont290

else237:                                          ; preds = %else233
  %num238 = load i32, ptr %num, align 4
  %eqtmp239 = icmp eq i32 %num238, 13
  br i1 %eqtmp239, label %then240, label %else241

then240:                                          ; preds = %else237
  br label %ifcont288

else241:                                          ; preds = %else237
  %num242 = load i32, ptr %num, align 4
  %eqtmp243 = icmp eq i32 %num242, 14
  br i1 %eqtmp243, label %then244, label %else245

then244:                                          ; preds = %else241
  br label %ifcont286

else245:                                          ; preds = %else241
  %num246 = load i32, ptr %num, align 4
  %eqtmp247 = icmp eq i32 %num246, 15
  br i1 %eqtmp247, label %then248, label %else249

then248:                                          ; preds = %else245
  br label %ifcont284

else249:                                          ; preds = %else245
  %num250 = load i32, ptr %num, align 4
  %eqtmp251 = icmp eq i32 %num250, 16
  br i1 %eqtmp251, label %then252, label %else253

then252:                                          ; preds = %else249
  br label %ifcont282

else253:                                          ; preds = %else249
  %num254 = load i32, ptr %num, align 4
  %eqtmp255 = icmp eq i32 %num254, 17
  br i1 %eqtmp255, label %then256, label %else257

then256:                                          ; preds = %else253
  br label %ifcont280

else257:                                          ; preds = %else253
  %num258 = load i32, ptr %num, align 4
  %eqtmp259 = icmp eq i32 %num258, 18
  br i1 %eqtmp259, label %then260, label %else261

then260:                                          ; preds = %else257
  br label %ifcont278

else261:                                          ; preds = %else257
  %num262 = load i32, ptr %num, align 4
  %eqtmp263 = icmp eq i32 %num262, 19
  br i1 %eqtmp263, label %then264, label %else265

then264:                                          ; preds = %else261
  br label %ifcont276

else265:                                          ; preds = %else261
  %num266 = load i32, ptr %num, align 4
  %eqtmp267 = icmp eq i32 %num266, 20
  br i1 %eqtmp267, label %then268, label %else269

then268:                                          ; preds = %else265
  br label %ifcont274

else269:                                          ; preds = %else265
  %num270 = load i32, ptr %num, align 4
  %eqtmp271 = icmp eq i32 %num270, 21
  br i1 %eqtmp271, label %then272, label %else273

then272:                                          ; preds = %else269
  br label %ifcont

else273:                                          ; preds = %else269
  br label %ifcont

ifcont:                                           ; preds = %else273, %then272
  %cond_result = phi ptr [ @.str.14526837739119704657, %then272 ], [ @.str.15742825105966697332, %else273 ]
  br label %ifcont274

ifcont274:                                        ; preds = %ifcont, %then268
  %cond_result275 = phi ptr [ @.str.15519766171431846422, %then268 ], [ %cond_result, %ifcont ]
  br label %ifcont276

ifcont276:                                        ; preds = %ifcont274, %then264
  %cond_result277 = phi ptr [ @.str.18879824403368309, %then264 ], [ %cond_result275, %ifcont274 ]
  br label %ifcont278

ifcont278:                                        ; preds = %ifcont276, %then260
  %cond_result279 = phi ptr [ @.str.15878700390537487928, %then260 ], [ %cond_result277, %ifcont276 ]
  br label %ifcont280

ifcont280:                                        ; preds = %ifcont278, %then256
  %cond_result281 = phi ptr [ @.str.466469543761224631, %then256 ], [ %cond_result279, %ifcont278 ]
  br label %ifcont282

ifcont282:                                        ; preds = %ifcont280, %then252
  %cond_result283 = phi ptr [ @.str.10289097988630045312, %then252 ], [ %cond_result281, %ifcont280 ]
  br label %ifcont284

ifcont284:                                        ; preds = %ifcont282, %then248
  %cond_result285 = phi ptr [ @.str.9488634533155329225, %then248 ], [ %cond_result283, %ifcont282 ]
  br label %ifcont286

ifcont286:                                        ; preds = %ifcont284, %then244
  %cond_result287 = phi ptr [ @.str.1322195112996861203, %then244 ], [ %cond_result285, %ifcont284 ]
  br label %ifcont288

ifcont288:                                        ; preds = %ifcont286, %then240
  %cond_result289 = phi ptr [ @.str.10875632029827725596, %then240 ], [ %cond_result287, %ifcont286 ]
  br label %ifcont290

ifcont290:                                        ; preds = %ifcont288, %then236
  %cond_result291 = phi ptr [ @.str.1192997724355619033, %then236 ], [ %cond_result289, %ifcont288 ]
  br label %ifcont292

ifcont292:                                        ; preds = %ifcont290, %then232
  %cond_result293 = phi ptr [ @.str.13590890355069450419, %then232 ], [ %cond_result291, %ifcont290 ]
  br label %ifcont294

ifcont294:                                        ; preds = %ifcont292, %then228
  %cond_result295 = phi ptr [ @.str.12164476460503599322, %then228 ], [ %cond_result293, %ifcont292 ]
  br label %ifcont296

ifcont296:                                        ; preds = %ifcont294, %then224
  %cond_result297 = phi ptr [ @.str.1720376043156572213, %then224 ], [ %cond_result295, %ifcont294 ]
  br label %ifcont298

ifcont298:                                        ; preds = %ifcont296, %then220
  %cond_result299 = phi ptr [ @.str.6486498083074353280, %then220 ], [ %cond_result297, %ifcont296 ]
  br label %ifcont300

ifcont300:                                        ; preds = %ifcont298, %then216
  %cond_result301 = phi ptr [ @.str.15475166125855133481, %then216 ], [ %cond_result299, %ifcont298 ]
  br label %ifcont302

ifcont302:                                        ; preds = %ifcont300, %then212
  %cond_result303 = phi ptr [ @.str.3578311845064639526, %then212 ], [ %cond_result301, %ifcont300 ]
  br label %ifcont304

ifcont304:                                        ; preds = %ifcont302, %then208
  %cond_result305 = phi ptr [ @.str.8554476518536890737, %then208 ], [ %cond_result303, %ifcont302 ]
  br label %ifcont306

ifcont306:                                        ; preds = %ifcont304, %then204
  %cond_result307 = phi ptr [ @.str.13810137511727375266, %then204 ], [ %cond_result305, %ifcont304 ]
  br label %ifcont308

ifcont308:                                        ; preds = %ifcont306, %then200
  %cond_result309 = phi ptr [ @.str.10370737271660450686, %then200 ], [ %cond_result307, %ifcont306 ]
  br label %ifcont310

ifcont310:                                        ; preds = %ifcont308, %then196
  %cond_result311 = phi ptr [ @.str.14082101252600835028, %then196 ], [ %cond_result309, %ifcont308 ]
  br label %ifcont312

ifcont312:                                        ; preds = %ifcont310, %then
  %cond_result313 = phi ptr [ @.str.6020815297648224428, %then ], [ %cond_result311, %ifcont310 ]
  ret ptr %cond_result313
}

define i1 @CellularAutomaton.prompt(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %ans = alloca ptr, align 8
  store ptr @.str.const.6142509188972423790, ptr %ans, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.1415532122195024542)
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
  %dispatch.result8 = call ptr %method.ptr7(ptr %self1, ptr @.str.16809106215964835616)
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
  store ptr %dispatch.result16, ptr %ans, align 8
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
  %dispatch.result24 = call ptr %method.ptr23(ptr %self17, ptr @.str.18400681194753865968)
  %ans25 = load ptr, ptr %ans, align 8
  %eqtmp = call i1 @String_equals(ptr %ans25, ptr @.str.9826907452181669771)
  br i1 %eqtmp, label %then, label %else

dispatch.abort19:                                 ; preds = %dispatch.ok10
  call void @abort()
  unreachable

then:                                             ; preds = %dispatch.ok18
  br label %ifcont

else:                                             ; preds = %dispatch.ok18
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %cond_result = phi i1 [ false, %then ], [ true, %else ]
  ret i1 %cond_result
}

define i1 @CellularAutomaton.prompt2(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %ans = alloca ptr, align 8
  store ptr @.str.const.6142509188972423790, ptr %ans, align 8
  %self = load ptr, ptr %this.addr, align 8
  %dispatch.isnull = icmp eq ptr %self, null
  br i1 %dispatch.isnull, label %dispatch.abort, label %dispatch.ok

dispatch.ok:                                      ; preds = %entry
  %vtable.ptr = load ptr, ptr %self, align 8
  %method.ptr.addr = getelementptr ptr, ptr %vtable.ptr, i64 5
  %method.ptr = load ptr, ptr %method.ptr.addr, align 8
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.15867152849721451935)
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
  %dispatch.result8 = call ptr %method.ptr7(ptr %self1, ptr @.str.9297509020441554450)
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
  %dispatch.result16 = call ptr %method.ptr15(ptr %self9, ptr @.str.3293305892035076251)
  %self17 = load ptr, ptr %this.addr, align 8
  %dispatch.isnull20 = icmp eq ptr %self17, null
  br i1 %dispatch.isnull20, label %dispatch.abort19, label %dispatch.ok18

dispatch.abort11:                                 ; preds = %dispatch.ok2
  call void @abort()
  unreachable

dispatch.ok18:                                    ; preds = %dispatch.ok10
  %vtable.ptr21 = load ptr, ptr %self17, align 8
  %method.ptr.addr22 = getelementptr ptr, ptr %vtable.ptr21, i64 7
  %method.ptr23 = load ptr, ptr %method.ptr.addr22, align 8
  %dispatch.result24 = call ptr %method.ptr23(ptr %self17)
  store ptr %dispatch.result24, ptr %ans, align 8
  %ans25 = load ptr, ptr %ans, align 8
  %eqtmp = call i1 @String_equals(ptr %ans25, ptr @.str.15160494916537613830)
  br i1 %eqtmp, label %then, label %else

dispatch.abort19:                                 ; preds = %dispatch.ok10
  call void @abort()
  unreachable

then:                                             ; preds = %dispatch.ok18
  br label %ifcont

else:                                             ; preds = %dispatch.ok18
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %cond_result = phi i1 [ true, %then ], [ false, %else ]
  ret i1 %cond_result
}

define ptr @Main.main(ptr %this) {
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
  %dispatch.result = call ptr %method.ptr(ptr %self, ptr @.str.1858591978224213472)
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
  %dispatch.result8 = call ptr %method.ptr7(ptr %self1, ptr @.str.6558307453630196106)
  %self9 = load ptr, ptr %this.addr, align 8
  ret ptr %self9

dispatch.abort3:                                  ; preds = %dispatch.ok
  call void @abort()
  unreachable
}

define void @_ZN5BoardC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Board, ptr %this, i32 0, i32 0
  call void @_ZN2IOC2Ev(ptr %parent.subobject)
  store ptr @_ZTV5Board, ptr %this, align 8
  %rows.addr.byte = getelementptr i8, ptr %this, i64 8
  store i32 0, ptr %rows.addr.byte, align 4
  %columns.addr.byte = getelementptr i8, ptr %this, i64 16
  store i32 0, ptr %columns.addr.byte, align 4
  %board_size.addr.byte = getelementptr i8, ptr %this, i64 24
  store i32 0, ptr %board_size.addr.byte, align 4
  ret void
}

define ptr @Board.new() {
entry:
  %0 = call ptr @malloc(i64 32)
  call void @_ZN5BoardC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN17CellularAutomatonC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.CellularAutomaton, ptr %this, i32 0, i32 0
  call void @_ZN5BoardC2Ev(ptr %parent.subobject)
  store ptr @_ZTV17CellularAutomaton, ptr %this, align 8
  %population_map.addr.byte = getelementptr i8, ptr %this, i64 32
  store ptr @.str.const.6142509188972423790, ptr %population_map.addr.byte, align 8
  ret void
}

define ptr @CellularAutomaton.new() {
entry:
  %0 = call ptr @malloc(i64 40)
  call void @_ZN17CellularAutomatonC2Ev(ptr %0)
  ret ptr %0
}

define void @_ZN4MainC2Ev(ptr %this) {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %parent.subobject = getelementptr inbounds %class.Main, ptr %this, i32 0, i32 0
  call void @_ZN17CellularAutomatonC2Ev(ptr %parent.subobject)
  store ptr @_ZTV4Main, ptr %this, align 8
  %cells.addr.byte = getelementptr i8, ptr %this, i64 40
  store ptr null, ptr %cells.addr.byte, align 8
  ret void
}

define ptr @Main.new() {
entry:
  %0 = call ptr @malloc(i64 48)
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
