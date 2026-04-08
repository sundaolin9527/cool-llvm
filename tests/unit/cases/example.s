# start of generated code
	.data
	.align	2
	.globl	class_nameTab
	.globl	Main_protObj
	.globl	Int_protObj
	.globl	String_protObj
	.globl	bool_const0
	.globl	bool_const1
	.globl	_int_tag
	.globl	_bool_tag
	.globl	_string_tag
_int_tag:
	.word	2
_bool_tag:
	.word	3
_string_tag:
	.word	4
	.globl	_MemMgr_INITIALIZER
_MemMgr_INITIALIZER:
	.word	_NoGC_Init
	.globl	_MemMgr_COLLECTOR
_MemMgr_COLLECTOR:
	.word	_NoGC_Collect
	.globl	_MemMgr_TEST
_MemMgr_TEST:
	.word	0
	.word	-1
str_const70:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const5
	.ascii	"Main"
	.byte	0	
	.align	2
	.word	-1
str_const69:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const3
	.ascii	"A2I"
	.byte	0	
	.align	2
	.word	-1
str_const68:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"E"
	.byte	0	
	.align	2
	.word	-1
str_const67:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"D"
	.byte	0	
	.align	2
	.word	-1
str_const66:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"C"
	.byte	0	
	.align	2
	.word	-1
str_const65:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"B"
	.byte	0	
	.align	2
	.word	-1
str_const64:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"A"
	.byte	0	
	.align	2
	.word	-1
str_const63:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const7
	.ascii	"String"
	.byte	0	
	.align	2
	.word	-1
str_const62:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const5
	.ascii	"Bool"
	.byte	0	
	.align	2
	.word	-1
str_const61:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const3
	.ascii	"Int"
	.byte	0	
	.align	2
	.word	-1
str_const60:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const2
	.ascii	"IO"
	.byte	0	
	.align	2
	.word	-1
str_const59:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const7
	.ascii	"Object"
	.byte	0	
	.align	2
	.word	-1
str_const58:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const10
	.ascii	"_prim_slot"
	.byte	0	
	.align	2
	.word	-1
str_const57:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const9
	.ascii	"SELF_TYPE"
	.byte	0	
	.align	2
	.word	-1
str_const56:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const9
	.ascii	"_no_class"
	.byte	0	
	.align	2
	.word	-1
str_const55:
	.word	4
	.word	8
	.word	String_dispTab
	.word	int_const11
	.ascii	"<basic class>"
	.byte	0	
	.align	2
	.word	-1
str_const54:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"q"
	.byte	0	
	.align	2
	.word	-1
str_const53:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"j"
	.byte	0	
	.align	2
	.word	-1
str_const52:
	.word	4
	.word	12
	.word	String_dispTab
	.word	int_const12
	.ascii	"times 8 with a remainder of "
	.byte	0	
	.align	2
	.word	-1
str_const51:
	.word	4
	.word	8
	.word	String_dispTab
	.word	int_const13
	.ascii	"is equal to "
	.byte	0	
	.align	2
	.word	-1
str_const50:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"h"
	.byte	0	
	.align	2
	.word	-1
str_const49:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"f"
	.byte	0	
	.align	2
	.word	-1
str_const48:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"e"
	.byte	0	
	.align	2
	.word	-1
str_const47:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"d"
	.byte	0	
	.align	2
	.word	-1
str_const46:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"c"
	.byte	0	
	.align	2
	.word	-1
str_const45:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"b"
	.byte	0	
	.align	2
	.word	-1
str_const44:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"a"
	.byte	0	
	.align	2
	.word	-1
str_const43:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const4
	.ascii	"is odd!\n"
	.byte	0	
	.align	2
	.word	-1
str_const42:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const9
	.ascii	"is even!\n"
	.byte	0	
	.align	2
	.word	-1
str_const41:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const8
	.ascii	"number "
	.byte	0	
	.align	2
	.word	-1
str_const40:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	" "
	.byte	0	
	.align	2
	.word	-1
str_const39:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const8
	.ascii	"Oooops\n"
	.byte	0	
	.align	2
	.word	-1
str_const38:
	.word	4
	.word	10
	.word	String_dispTab
	.word	int_const14
	.ascii	"Class type is now E\n"
	.byte	0	
	.align	2
	.word	-1
str_const37:
	.word	4
	.word	10
	.word	String_dispTab
	.word	int_const14
	.ascii	"Class type is now D\n"
	.byte	0	
	.align	2
	.word	-1
str_const36:
	.word	4
	.word	10
	.word	String_dispTab
	.word	int_const14
	.ascii	"Class type is now C\n"
	.byte	0	
	.align	2
	.word	-1
str_const35:
	.word	4
	.word	10
	.word	String_dispTab
	.word	int_const14
	.ascii	"Class type is now B\n"
	.byte	0	
	.align	2
	.word	-1
str_const34:
	.word	4
	.word	10
	.word	String_dispTab
	.word	int_const14
	.ascii	"Class type is now A\n"
	.byte	0	
	.align	2
	.word	-1
str_const33:
	.word	4
	.word	11
	.word	String_dispTab
	.word	int_const15
	.ascii	"Please enter a number...  "
	.byte	0	
	.align	2
	.word	-1
str_const32:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"\n"
	.byte	0	
	.align	2
	.word	-1
str_const31:
	.word	4
	.word	10
	.word	String_dispTab
	.word	int_const16
	.ascii	"\tTo quit...enter q:\n\n"
	.byte	0	
	.align	2
	.word	-1
str_const30:
	.word	4
	.word	13
	.word	String_dispTab
	.word	int_const17
	.ascii	"\tTo get a new number...enter j:\n"
	.byte	0	
	.align	2
	.word	-1
str_const29:
	.word	4
	.word	9
	.word	String_dispTab
	.word	int_const18
	.ascii	"by 8...enter h:\n"
	.byte	0	
	.align	2
	.word	-1
str_const28:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const19
	.ascii	"\tTo divide "
	.byte	0	
	.align	2
	.word	-1
str_const27:
	.word	4
	.word	12
	.word	String_dispTab
	.word	int_const20
	.ascii	"is a multiple of 3...enter g:\n"
	.byte	0	
	.align	2
	.word	-1
str_const26:
	.word	4
	.word	9
	.word	String_dispTab
	.word	int_const18
	.ascii	"\tTo find out if "
	.byte	0	
	.align	2
	.word	-1
str_const25:
	.word	4
	.word	8
	.word	String_dispTab
	.word	int_const13
	.ascii	"...enter f:\n"
	.byte	0	
	.align	2
	.word	-1
str_const24:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const9
	.ascii	"\tTo cube "
	.byte	0	
	.align	2
	.word	-1
str_const23:
	.word	4
	.word	8
	.word	String_dispTab
	.word	int_const13
	.ascii	"...enter e:\n"
	.byte	0	
	.align	2
	.word	-1
str_const22:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const19
	.ascii	"\tTo square "
	.byte	0	
	.align	2
	.word	-1
str_const21:
	.word	4
	.word	8
	.word	String_dispTab
	.word	int_const13
	.ascii	"...enter d:\n"
	.byte	0	
	.align	2
	.word	-1
str_const20:
	.word	4
	.word	11
	.word	String_dispTab
	.word	int_const15
	.ascii	"\tTo find the factorial of "
	.byte	0	
	.align	2
	.word	-1
str_const19:
	.word	4
	.word	12
	.word	String_dispTab
	.word	int_const20
	.ascii	"and another number...enter c:\n"
	.byte	0	
	.align	2
	.word	-1
str_const18:
	.word	4
	.word	13
	.word	String_dispTab
	.word	int_const17
	.ascii	"\tTo find the difference between "
	.byte	0	
	.align	2
	.word	-1
str_const17:
	.word	4
	.word	8
	.word	String_dispTab
	.word	int_const13
	.ascii	"...enter b:\n"
	.byte	0	
	.align	2
	.word	-1
str_const16:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const19
	.ascii	"\tTo negate "
	.byte	0	
	.align	2
	.word	-1
str_const15:
	.word	4
	.word	8
	.word	String_dispTab
	.word	int_const13
	.ascii	"...enter a:\n"
	.byte	0	
	.align	2
	.word	-1
str_const14:
	.word	4
	.word	10
	.word	String_dispTab
	.word	int_const16
	.ascii	"\n\tTo add a number to "
	.byte	0	
	.align	2
	.word	-1
str_const13:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"+"
	.byte	0	
	.align	2
	.word	-1
str_const12:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"-"
	.byte	0	
	.align	2
	.word	-1
str_const11:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const0
	.byte	0	
	.align	2
	.word	-1
str_const10:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"9"
	.byte	0	
	.align	2
	.word	-1
str_const9:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"8"
	.byte	0	
	.align	2
	.word	-1
str_const8:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"7"
	.byte	0	
	.align	2
	.word	-1
str_const7:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"6"
	.byte	0	
	.align	2
	.word	-1
str_const6:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"5"
	.byte	0	
	.align	2
	.word	-1
str_const5:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"4"
	.byte	0	
	.align	2
	.word	-1
str_const4:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"3"
	.byte	0	
	.align	2
	.word	-1
str_const3:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"2"
	.byte	0	
	.align	2
	.word	-1
str_const2:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"1"
	.byte	0	
	.align	2
	.word	-1
str_const1:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"0"
	.byte	0	
	.align	2
	.word	-1
str_const0:
	.word	4
	.word	16
	.word	String_dispTab
	.word	int_const21
	.ascii	"/opt/sundaolin/cool/tests/unit/cases/example.cl"
	.byte	0	
	.align	2
	.word	-1
int_const21:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	47
	.word	-1
int_const20:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	30
	.word	-1
int_const19:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	11
	.word	-1
int_const18:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	16
	.word	-1
int_const17:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	32
	.word	-1
int_const16:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	21
	.word	-1
int_const15:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	26
	.word	-1
int_const14:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	20
	.word	-1
int_const13:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	12
	.word	-1
int_const12:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	28
	.word	-1
int_const11:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	13
	.word	-1
int_const10:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	10
	.word	-1
int_const9:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	9
	.word	-1
int_const8:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	7
	.word	-1
int_const7:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	6
	.word	-1
int_const6:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	5
	.word	-1
int_const5:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	4
	.word	-1
int_const4:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	8
	.word	-1
int_const3:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	3
	.word	-1
int_const2:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	2
	.word	-1
int_const1:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	1
	.word	-1
int_const0:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	0
	.word	-1
bool_const0:
	.word	3
	.word	4
	.word	Bool_dispTab
	.word	0
	.word	-1
bool_const1:
	.word	3
	.word	4
	.word	Bool_dispTab
	.word	1
class_nameTab:
	.word	str_const59
	.word	str_const60
	.word	str_const61
	.word	str_const62
	.word	str_const63
	.word	str_const64
	.word	str_const65
	.word	str_const66
	.word	str_const67
	.word	str_const68
	.word	str_const69
	.word	str_const70
class_objTab:
	.word	Object_protObj
	.word	Object_init
	.word	IO_protObj
	.word	IO_init
	.word	Int_protObj
	.word	Int_init
	.word	Bool_protObj
	.word	Bool_init
	.word	String_protObj
	.word	String_init
	.word	A_protObj
	.word	A_init
	.word	B_protObj
	.word	B_init
	.word	C_protObj
	.word	C_init
	.word	D_protObj
	.word	D_init
	.word	E_protObj
	.word	E_init
	.word	A2I_protObj
	.word	A2I_init
	.word	Main_protObj
	.word	Main_init
	.word	-1
Main_protObj:
	.word	11
	.word	7
	.word	Main_dispTab
	.word	str_const11
	.word	0
	.word	0
	.word	bool_const0
	.word	-1
A2I_protObj:
	.word	10
	.word	3
	.word	A2I_dispTab
	.word	-1
E_protObj:
	.word	9
	.word	5
	.word	E_dispTab
	.word	int_const0
	.word	int_const0
	.word	-1
D_protObj:
	.word	8
	.word	5
	.word	D_dispTab
	.word	int_const0
	.word	int_const0
	.word	-1
C_protObj:
	.word	7
	.word	5
	.word	C_dispTab
	.word	int_const0
	.word	int_const0
	.word	-1
B_protObj:
	.word	6
	.word	5
	.word	B_dispTab
	.word	int_const0
	.word	int_const0
	.word	-1
A_protObj:
	.word	5
	.word	4
	.word	A_dispTab
	.word	int_const0
	.word	-1
String_protObj:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const0
	.word	0
	.word	-1
Bool_protObj:
	.word	3
	.word	4
	.word	Bool_dispTab
	.word	0
	.word	-1
Int_protObj:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	0
	.word	-1
IO_protObj:
	.word	1
	.word	3
	.word	IO_dispTab
	.word	-1
Object_protObj:
	.word	0
	.word	3
	.word	Object_dispTab
Main_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	IO.out_string
	.word	IO.out_int
	.word	IO.in_string
	.word	IO.in_int
	.word	Main.menu
	.word	Main.prompt
	.word	Main.get_int
	.word	Main.is_even
	.word	Main.class_type
	.word	Main.print
	.word	Main.main
A2I_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	A2I.c2i
	.word	A2I.i2c
	.word	A2I.a2i
	.word	A2I.a2i_aux
	.word	A2I.i2a
	.word	A2I.i2a_aux
E_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	A.value
	.word	A.set_var
	.word	A.method1
	.word	A.method2
	.word	A.method3
	.word	A.method4
	.word	B.method5
	.word	D.method7
	.word	E.method6
D_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	A.value
	.word	A.set_var
	.word	A.method1
	.word	A.method2
	.word	A.method3
	.word	A.method4
	.word	B.method5
	.word	D.method7
C_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	A.value
	.word	A.set_var
	.word	A.method1
	.word	A.method2
	.word	A.method3
	.word	A.method4
	.word	C.method5
	.word	C.method6
B_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	A.value
	.word	A.set_var
	.word	A.method1
	.word	A.method2
	.word	A.method3
	.word	A.method4
	.word	B.method5
A_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	A.value
	.word	A.set_var
	.word	A.method1
	.word	A.method2
	.word	A.method3
	.word	A.method4
	.word	A.method5
String_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	String.length
	.word	String.concat
	.word	String.substr
Bool_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
Int_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
IO_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	IO.out_string
	.word	IO.out_int
	.word	IO.in_string
	.word	IO.in_int
Object_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.globl	heap_start
heap_start:
	.word	0
	.text
	.globl	Main_init
	.globl	Int_init
	.globl	String_init
	.globl	Bool_init
	.globl	Main.main
Main_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	jal	IO_init
	la	$a0 bool_const1
	sw	$a0 24($s0)
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
A2I_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
E_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	jal	D_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
D_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	jal	B_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
C_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	jal	B_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
B_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	jal	A_init
	la	$a0 int_const0
	sw	$a0 16($s0)
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
A_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	jal	Object_init
	la	$a0 int_const0
	sw	$a0 12($s0)
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
String_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Bool_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Int_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
IO_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Object_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Main.menu:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 str_const14
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label0
	la	$a0 str_const0
	li	$t1 247
	jal	_dispatch_abort
label0:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 16($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label1
	la	$a0 str_const0
	li	$t1 248
	jal	_dispatch_abort
label1:
	lw	$t1 8($a0)
	lw	$t1 48($t1)
	jalr		$t1
	la	$a0 str_const15
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label2
	la	$a0 str_const0
	li	$t1 249
	jal	_dispatch_abort
label2:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const16
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label3
	la	$a0 str_const0
	li	$t1 250
	jal	_dispatch_abort
label3:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 16($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label4
	la	$a0 str_const0
	li	$t1 251
	jal	_dispatch_abort
label4:
	lw	$t1 8($a0)
	lw	$t1 48($t1)
	jalr		$t1
	la	$a0 str_const17
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label5
	la	$a0 str_const0
	li	$t1 252
	jal	_dispatch_abort
label5:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const18
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label6
	la	$a0 str_const0
	li	$t1 253
	jal	_dispatch_abort
label6:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 16($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label7
	la	$a0 str_const0
	li	$t1 254
	jal	_dispatch_abort
label7:
	lw	$t1 8($a0)
	lw	$t1 48($t1)
	jalr		$t1
	la	$a0 str_const19
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label8
	la	$a0 str_const0
	li	$t1 255
	jal	_dispatch_abort
label8:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const20
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label9
	la	$a0 str_const0
	li	$t1 256
	jal	_dispatch_abort
label9:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 16($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label10
	la	$a0 str_const0
	li	$t1 257
	jal	_dispatch_abort
label10:
	lw	$t1 8($a0)
	lw	$t1 48($t1)
	jalr		$t1
	la	$a0 str_const21
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label11
	la	$a0 str_const0
	li	$t1 258
	jal	_dispatch_abort
label11:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const22
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label12
	la	$a0 str_const0
	li	$t1 259
	jal	_dispatch_abort
label12:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 16($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label13
	la	$a0 str_const0
	li	$t1 260
	jal	_dispatch_abort
label13:
	lw	$t1 8($a0)
	lw	$t1 48($t1)
	jalr		$t1
	la	$a0 str_const23
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label14
	la	$a0 str_const0
	li	$t1 261
	jal	_dispatch_abort
label14:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const24
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label15
	la	$a0 str_const0
	li	$t1 262
	jal	_dispatch_abort
label15:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 16($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label16
	la	$a0 str_const0
	li	$t1 263
	jal	_dispatch_abort
label16:
	lw	$t1 8($a0)
	lw	$t1 48($t1)
	jalr		$t1
	la	$a0 str_const25
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label17
	la	$a0 str_const0
	li	$t1 264
	jal	_dispatch_abort
label17:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const26
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label18
	la	$a0 str_const0
	li	$t1 265
	jal	_dispatch_abort
label18:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 16($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label19
	la	$a0 str_const0
	li	$t1 266
	jal	_dispatch_abort
label19:
	lw	$t1 8($a0)
	lw	$t1 48($t1)
	jalr		$t1
	la	$a0 str_const27
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label20
	la	$a0 str_const0
	li	$t1 267
	jal	_dispatch_abort
label20:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const28
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label21
	la	$a0 str_const0
	li	$t1 268
	jal	_dispatch_abort
label21:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 16($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label22
	la	$a0 str_const0
	li	$t1 269
	jal	_dispatch_abort
label22:
	lw	$t1 8($a0)
	lw	$t1 48($t1)
	jalr		$t1
	la	$a0 str_const29
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label23
	la	$a0 str_const0
	li	$t1 270
	jal	_dispatch_abort
label23:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const30
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label24
	la	$a0 str_const0
	li	$t1 271
	jal	_dispatch_abort
label24:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const31
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label25
	la	$a0 str_const0
	li	$t1 272
	jal	_dispatch_abort
label25:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label26
	la	$a0 str_const0
	li	$t1 273
	jal	_dispatch_abort
label26:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Main.prompt:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 str_const32
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label27
	la	$a0 str_const0
	li	$t1 279
	jal	_dispatch_abort
label27:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const33
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label28
	la	$a0 str_const0
	li	$t1 280
	jal	_dispatch_abort
label28:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label29
	la	$a0 str_const0
	li	$t1 281
	jal	_dispatch_abort
label29:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Main.get_int:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 A2I_protObj
	jal	Object.copy
	jalr	A2I_init
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label30
	la	$a0 str_const0
	li	$t1 288
	jal	_dispatch_abort
label30:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -16($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	bne	$a0 $zero label31
	la	$a0 str_const0
	li	$t1 289
	jal	_dispatch_abort
label31:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	addiu	$sp $sp 4
	addiu	$sp $sp 4
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Main.is_even:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	blt	$t1 $t2 label32
	la	$a0 bool_const0
label32:
	lw	$t1 12($a0)
	beqz	$t1 label33
	lw	$a0 -12($fp)
	jal	Object.copy
	lw	$t1 12($a0)
	neg	$t1 $t1
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label35
	la	$a0 str_const0
	li	$t1 297
	jal	_dispatch_abort
label35:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	b	label34
label33:
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label36
	jal	equality_test
label36:
	lw	$t1 12($a0)
	beqz	$t1 label37
	la	$a0 bool_const1
	b	label38
label37:
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label39
	jal	equality_test
label39:
	lw	$t1 12($a0)
	beqz	$t1 label40
	la	$a0 bool_const0
	b	label41
label40:
	lw	$a0 -12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const2
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	sub	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label42
	la	$a0 str_const0
	li	$t1 300
	jal	_dispatch_abort
label42:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
label41:
label38:
label34:
	addiu	$sp $sp 4
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
Main.class_type:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 4($fp)
	bne	$a0 $zero label43
	la	$a0 str_const0
	li	$t1 306
	jal	_case_abort2
label43:
	lw	$t1 0($a0)
label44:
	beq	$t1 9 label45
	b	label46
label45:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const38
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label57
	la	$a0 str_const0
	li	$t1 311
	jal	_dispatch_abort
label57:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	addiu	$sp $sp 4
	b	label56
label46:
	beq	$t1 8 label47
	beq	$t1 9 label47
	b	label48
label47:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const37
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label58
	la	$a0 str_const0
	li	$t1 310
	jal	_dispatch_abort
label58:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	addiu	$sp $sp 4
	b	label56
label48:
	beq	$t1 7 label49
	b	label50
label49:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const36
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label59
	la	$a0 str_const0
	li	$t1 309
	jal	_dispatch_abort
label59:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	addiu	$sp $sp 4
	b	label56
label50:
	beq	$t1 6 label51
	beq	$t1 7 label51
	beq	$t1 8 label51
	beq	$t1 9 label51
	b	label52
label51:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const35
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label60
	la	$a0 str_const0
	li	$t1 308
	jal	_dispatch_abort
label60:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	addiu	$sp $sp 4
	b	label56
label52:
	beq	$t1 5 label53
	beq	$t1 6 label53
	beq	$t1 7 label53
	beq	$t1 8 label53
	beq	$t1 9 label53
	b	label54
label53:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const34
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label61
	la	$a0 str_const0
	li	$t1 307
	jal	_dispatch_abort
label61:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	addiu	$sp $sp 4
	b	label56
label54:
	beq	$t1 0 label55
	beq	$t1 1 label55
	beq	$t1 11 label55
	beq	$t1 2 label55
	beq	$t1 3 label55
	beq	$t1 4 label55
	beq	$t1 5 label55
	beq	$t1 6 label55
	beq	$t1 7 label55
	beq	$t1 8 label55
	beq	$t1 9 label55
	beq	$t1 10 label55
	jal	_case_abort
label55:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const39
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label62
	la	$a0 str_const0
	li	$t1 312
	jal	_dispatch_abort
label62:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	addiu	$sp $sp 4
	b	label56
label56:
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
Main.print:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 A2I_protObj
	jal	Object.copy
	jalr	A2I_init
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label63
	la	$a0 str_const0
	li	$t1 319
	jal	_dispatch_abort
label63:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	bne	$a0 $zero label64
	la	$a0 str_const0
	li	$t1 319
	jal	_dispatch_abort
label64:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label65
	la	$a0 str_const0
	li	$t1 319
	jal	_dispatch_abort
label65:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const40
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label66
	la	$a0 str_const0
	li	$t1 320
	jal	_dispatch_abort
label66:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	addiu	$sp $sp 4
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
Main.main:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 A_protObj
	jal	Object.copy
	jalr	A_init
	sw	$a0 16($s0)
label67:
	lw	$a0 24($s0)
	lw	$t1 12($a0)
	beqz	$t1 label68
	la	$a0 str_const41
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label69
	la	$a0 str_const0
	li	$t1 331
	jal	_dispatch_abort
label69:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 16($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label70
	la	$a0 str_const0
	li	$t1 332
	jal	_dispatch_abort
label70:
	lw	$t1 8($a0)
	lw	$t1 48($t1)
	jalr		$t1
	lw	$a0 16($s0)
	bne	$a0 $zero label71
	la	$a0 str_const0
	li	$t1 333
	jal	_dispatch_abort
label71:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label72
	la	$a0 str_const0
	li	$t1 333
	jal	_dispatch_abort
label72:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	lw	$t1 12($a0)
	beqz	$t1 label73
	la	$a0 str_const42
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label75
	la	$a0 str_const0
	li	$t1 334
	jal	_dispatch_abort
label75:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	b	label74
label73:
	la	$a0 str_const43
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label76
	la	$a0 str_const0
	li	$t1 336
	jal	_dispatch_abort
label76:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
label74:
	lw	$a0 16($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label77
	la	$a0 str_const0
	li	$t1 339
	jal	_dispatch_abort
label77:
	lw	$t1 8($a0)
	lw	$t1 44($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label78
	la	$a0 str_const0
	li	$t1 340
	jal	_dispatch_abort
label78:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	sw	$a0 12($s0)
	lw	$a0 12($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const44
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label79
	jal	equality_test
label79:
	lw	$t1 12($a0)
	beqz	$t1 label80
	move	$a0 $s0
	bne	$a0 $zero label82
	la	$a0 str_const0
	li	$t1 343
	jal	_dispatch_abort
label82:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 A_protObj
	jal	Object.copy
	jalr	A_init
	bne	$a0 $zero label83
	la	$a0 str_const0
	li	$t1 343
	jal	_dispatch_abort
label83:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	sw	$a0 20($s0)
	lw	$a0 16($s0)
	bne	$a0 $zero label84
	la	$a0 str_const0
	li	$t1 344
	jal	_dispatch_abort
label84:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 20($s0)
	bne	$a0 $zero label85
	la	$a0 str_const0
	li	$t1 344
	jal	_dispatch_abort
label85:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 B_protObj
	jal	Object.copy
	jalr	B_init
	bne	$a0 $zero label86
	la	$a0 str_const0
	li	$t1 344
	jal	_dispatch_abort
label86:
	lw	$t1 8($a0)
	lw	$t1 24($t1)
	jalr		$t1
	sw	$a0 16($s0)
	b	label81
label80:
	lw	$a0 12($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const45
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label87
	jal	equality_test
label87:
	lw	$t1 12($a0)
	beqz	$t1 label88
	lw	$a0 16($s0)
	bne	$a0 $zero label90
	la	$a0 str_const0
	li	$t1 347
	jal	_case_abort2
label90:
	lw	$t1 0($a0)
label91:
	beq	$t1 7 label92
	b	label93
label92:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	bne	$a0 $zero label98
	la	$a0 str_const0
	li	$t1 348
	jal	_dispatch_abort
label98:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	bne	$a0 $zero label99
	la	$a0 str_const0
	li	$t1 348
	jal	_dispatch_abort
label99:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	sw	$a0 16($s0)
	addiu	$sp $sp 4
	b	label97
label93:
	beq	$t1 5 label94
	beq	$t1 6 label94
	beq	$t1 7 label94
	beq	$t1 8 label94
	beq	$t1 9 label94
	b	label95
label94:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	bne	$a0 $zero label100
	la	$a0 str_const0
	li	$t1 349
	jal	_dispatch_abort
label100:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	bne	$a0 $zero label101
	la	$a0 str_const0
	li	$t1 349
	jal	_dispatch_abort
label101:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	sw	$a0 16($s0)
	addiu	$sp $sp 4
	b	label97
label95:
	beq	$t1 0 label96
	beq	$t1 1 label96
	beq	$t1 11 label96
	beq	$t1 2 label96
	beq	$t1 3 label96
	beq	$t1 4 label96
	beq	$t1 5 label96
	beq	$t1 6 label96
	beq	$t1 7 label96
	beq	$t1 8 label96
	beq	$t1 9 label96
	beq	$t1 10 label96
	jal	_case_abort
label96:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const39
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label102
	la	$a0 str_const0
	li	$t1 351
	jal	_dispatch_abort
label102:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label103
	la	$a0 str_const0
	li	$t1 352
	jal	_dispatch_abort
label103:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr		$t1
	la	$a0 int_const0
	addiu	$sp $sp 4
	b	label97
label97:
	b	label89
label88:
	lw	$a0 12($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const46
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label104
	jal	equality_test
label104:
	lw	$t1 12($a0)
	beqz	$t1 label105
	move	$a0 $s0
	bne	$a0 $zero label107
	la	$a0 str_const0
	li	$t1 357
	jal	_dispatch_abort
label107:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 A_protObj
	jal	Object.copy
	jalr	A_init
	bne	$a0 $zero label108
	la	$a0 str_const0
	li	$t1 357
	jal	_dispatch_abort
label108:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	sw	$a0 20($s0)
	lw	$a0 16($s0)
	bne	$a0 $zero label109
	la	$a0 str_const0
	li	$t1 358
	jal	_dispatch_abort
label109:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 20($s0)
	bne	$a0 $zero label110
	la	$a0 str_const0
	li	$t1 358
	jal	_dispatch_abort
label110:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 D_protObj
	jal	Object.copy
	jalr	D_init
	bne	$a0 $zero label111
	la	$a0 str_const0
	li	$t1 358
	jal	_dispatch_abort
label111:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr		$t1
	sw	$a0 16($s0)
	b	label106
label105:
	lw	$a0 12($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const47
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label112
	jal	equality_test
label112:
	lw	$t1 12($a0)
	beqz	$t1 label113
	lw	$a0 16($s0)
	bne	$a0 $zero label115
	la	$a0 str_const0
	li	$t1 360
	jal	_dispatch_abort
label115:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 C_protObj
	jal	Object.copy
	jalr	C_init
	bne	$a0 $zero label116
	la	$a0 str_const0
	li	$t1 360
	jal	_dispatch_abort
label116:
	la	$t1 A_dispTab
	lw	$t1 36($t1)
	jalr		$t1
	sw	$a0 16($s0)
	b	label114
label113:
	lw	$a0 12($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const48
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label117
	jal	equality_test
label117:
	lw	$t1 12($a0)
	beqz	$t1 label118
	lw	$a0 16($s0)
	bne	$a0 $zero label120
	la	$a0 str_const0
	li	$t1 362
	jal	_dispatch_abort
label120:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 C_protObj
	jal	Object.copy
	jalr	C_init
	bne	$a0 $zero label121
	la	$a0 str_const0
	li	$t1 362
	jal	_dispatch_abort
label121:
	la	$t1 B_dispTab
	lw	$t1 36($t1)
	jalr		$t1
	sw	$a0 16($s0)
	b	label119
label118:
	lw	$a0 12($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const49
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label122
	jal	equality_test
label122:
	lw	$t1 12($a0)
	beqz	$t1 label123
	lw	$a0 16($s0)
	bne	$a0 $zero label125
	la	$a0 str_const0
	li	$t1 364
	jal	_dispatch_abort
label125:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 C_protObj
	jal	Object.copy
	jalr	C_init
	bne	$a0 $zero label126
	la	$a0 str_const0
	li	$t1 364
	jal	_dispatch_abort
label126:
	la	$t1 C_dispTab
	lw	$t1 36($t1)
	jalr		$t1
	sw	$a0 16($s0)
	b	label124
label123:
	lw	$a0 12($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const50
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label127
	jal	equality_test
label127:
	lw	$t1 12($a0)
	beqz	$t1 label128
	li	$a0 0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 16($s0)
	bne	$a0 $zero label130
	la	$a0 str_const0
	li	$t1 384
	jal	_dispatch_abort
label130:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 E_protObj
	jal	Object.copy
	jalr	E_init
	bne	$a0 $zero label131
	la	$a0 str_const0
	li	$t1 384
	jal	_dispatch_abort
label131:
	lw	$t1 8($a0)
	lw	$t1 44($t1)
	jalr		$t1
	sw	$a0 -12($fp)
	lw	$a0 16($s0)
	bne	$a0 $zero label132
	la	$a0 str_const0
	li	$t1 385
	jal	_dispatch_abort
label132:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	bne	$a0 $zero label133
	la	$a0 str_const0
	li	$t1 385
	jal	_dispatch_abort
label133:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const4
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	mul	$t1 $t1 $t2
	sw	$t1 12($a0)
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	sub	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const41
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label134
	la	$a0 str_const0
	li	$t1 387
	jal	_dispatch_abort
label134:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 16($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label135
	la	$a0 str_const0
	li	$t1 388
	jal	_dispatch_abort
label135:
	lw	$t1 8($a0)
	lw	$t1 48($t1)
	jalr		$t1
	la	$a0 str_const51
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label136
	la	$a0 str_const0
	li	$t1 389
	jal	_dispatch_abort
label136:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 -12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label137
	la	$a0 str_const0
	li	$t1 390
	jal	_dispatch_abort
label137:
	lw	$t1 8($a0)
	lw	$t1 48($t1)
	jalr		$t1
	la	$a0 str_const52
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label138
	la	$a0 str_const0
	li	$t1 391
	jal	_dispatch_abort
label138:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 A2I_protObj
	jal	Object.copy
	jalr	A2I_init
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -16($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -20($fp)
	bne	$a0 $zero label139
	la	$a0 str_const0
	li	$t1 394
	jal	_dispatch_abort
label139:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label140
	la	$a0 str_const0
	li	$t1 394
	jal	_dispatch_abort
label140:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const32
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label141
	la	$a0 str_const0
	li	$t1 395
	jal	_dispatch_abort
label141:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	addiu	$sp $sp 4
	addiu	$sp $sp 4
	lw	$a0 -12($fp)
	sw	$a0 16($s0)
	addiu	$sp $sp 4
	b	label129
label128:
	lw	$a0 12($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const53
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label142
	jal	equality_test
label142:
	lw	$t1 12($a0)
	beqz	$t1 label143
	la	$a0 A_protObj
	jal	Object.copy
	jalr	A_init
	sw	$a0 16($s0)
	b	label144
label143:
	lw	$a0 12($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const54
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label145
	jal	equality_test
label145:
	lw	$t1 12($a0)
	beqz	$t1 label146
	la	$a0 bool_const0
	sw	$a0 24($s0)
	b	label147
label146:
	lw	$a0 16($s0)
	bne	$a0 $zero label148
	la	$a0 str_const0
	li	$t1 408
	jal	_dispatch_abort
label148:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 A_protObj
	jal	Object.copy
	jalr	A_init
	bne	$a0 $zero label149
	la	$a0 str_const0
	li	$t1 408
	jal	_dispatch_abort
label149:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 16($s0)
label147:
label144:
label129:
label124:
label119:
label114:
label106:
label89:
label81:
	b	label67
label68:
	li	$a0 0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
A2I.c2i:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const1
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label150
	jal	equality_test
label150:
	lw	$t1 12($a0)
	beqz	$t1 label151
	la	$a0 int_const0
	b	label152
label151:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const2
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label153
	jal	equality_test
label153:
	lw	$t1 12($a0)
	beqz	$t1 label154
	la	$a0 int_const1
	b	label155
label154:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const3
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label156
	jal	equality_test
label156:
	lw	$t1 12($a0)
	beqz	$t1 label157
	la	$a0 int_const2
	b	label158
label157:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const4
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label159
	jal	equality_test
label159:
	lw	$t1 12($a0)
	beqz	$t1 label160
	la	$a0 int_const3
	b	label161
label160:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const5
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label162
	jal	equality_test
label162:
	lw	$t1 12($a0)
	beqz	$t1 label163
	la	$a0 int_const5
	b	label164
label163:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const6
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label165
	jal	equality_test
label165:
	lw	$t1 12($a0)
	beqz	$t1 label166
	la	$a0 int_const6
	b	label167
label166:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const7
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label168
	jal	equality_test
label168:
	lw	$t1 12($a0)
	beqz	$t1 label169
	la	$a0 int_const7
	b	label170
label169:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const8
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label171
	jal	equality_test
label171:
	lw	$t1 12($a0)
	beqz	$t1 label172
	la	$a0 int_const8
	b	label173
label172:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const9
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label174
	jal	equality_test
label174:
	lw	$t1 12($a0)
	beqz	$t1 label175
	la	$a0 int_const4
	b	label176
label175:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const10
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label177
	jal	equality_test
label177:
	lw	$t1 12($a0)
	beqz	$t1 label178
	la	$a0 int_const9
	b	label179
label178:
	move	$a0 $s0
	bne	$a0 $zero label180
	la	$a0 str_const0
	li	$t1 158
	jal	_dispatch_abort
label180:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr		$t1
	la	$a0 int_const0
label179:
label176:
label173:
label170:
label167:
label164:
label161:
label158:
label155:
label152:
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
A2I.i2c:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label181
	jal	equality_test
label181:
	lw	$t1 12($a0)
	beqz	$t1 label182
	la	$a0 str_const1
	b	label183
label182:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label184
	jal	equality_test
label184:
	lw	$t1 12($a0)
	beqz	$t1 label185
	la	$a0 str_const2
	b	label186
label185:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const2
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label187
	jal	equality_test
label187:
	lw	$t1 12($a0)
	beqz	$t1 label188
	la	$a0 str_const3
	b	label189
label188:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label190
	jal	equality_test
label190:
	lw	$t1 12($a0)
	beqz	$t1 label191
	la	$a0 str_const4
	b	label192
label191:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const5
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label193
	jal	equality_test
label193:
	lw	$t1 12($a0)
	beqz	$t1 label194
	la	$a0 str_const5
	b	label195
label194:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const6
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label196
	jal	equality_test
label196:
	lw	$t1 12($a0)
	beqz	$t1 label197
	la	$a0 str_const6
	b	label198
label197:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const7
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label199
	jal	equality_test
label199:
	lw	$t1 12($a0)
	beqz	$t1 label200
	la	$a0 str_const7
	b	label201
label200:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const8
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label202
	jal	equality_test
label202:
	lw	$t1 12($a0)
	beqz	$t1 label203
	la	$a0 str_const8
	b	label204
label203:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const4
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label205
	jal	equality_test
label205:
	lw	$t1 12($a0)
	beqz	$t1 label206
	la	$a0 str_const9
	b	label207
label206:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const9
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label208
	jal	equality_test
label208:
	lw	$t1 12($a0)
	beqz	$t1 label209
	la	$a0 str_const10
	b	label210
label209:
	move	$a0 $s0
	bne	$a0 $zero label211
	la	$a0 str_const0
	li	$t1 177
	jal	_dispatch_abort
label211:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr		$t1
	la	$a0 str_const11
label210:
label207:
label204:
label201:
label198:
label195:
label192:
label189:
label186:
label183:
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
A2I.a2i:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 4($fp)
	bne	$a0 $zero label212
	la	$a0 str_const0
	li	$t1 190
	jal	_dispatch_abort
label212:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label213
	jal	equality_test
label213:
	lw	$t1 12($a0)
	beqz	$t1 label214
	la	$a0 int_const0
	b	label215
label214:
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label216
	la	$a0 str_const0
	li	$t1 191
	jal	_dispatch_abort
label216:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const12
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label217
	jal	equality_test
label217:
	lw	$t1 12($a0)
	beqz	$t1 label218
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label220
	la	$a0 str_const0
	li	$t1 191
	jal	_dispatch_abort
label220:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	sub	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label221
	la	$a0 str_const0
	li	$t1 191
	jal	_dispatch_abort
label221:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label222
	la	$a0 str_const0
	li	$t1 191
	jal	_dispatch_abort
label222:
	lw	$t1 8($a0)
	lw	$t1 24($t1)
	jalr		$t1
	jal	Object.copy
	lw	$t1 12($a0)
	neg	$t1 $t1
	sw	$t1 12($a0)
	b	label219
label218:
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label223
	la	$a0 str_const0
	li	$t1 192
	jal	_dispatch_abort
label223:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const13
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label224
	jal	equality_test
label224:
	lw	$t1 12($a0)
	beqz	$t1 label225
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label227
	la	$a0 str_const0
	li	$t1 192
	jal	_dispatch_abort
label227:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	sub	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label228
	la	$a0 str_const0
	li	$t1 192
	jal	_dispatch_abort
label228:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label229
	la	$a0 str_const0
	li	$t1 192
	jal	_dispatch_abort
label229:
	lw	$t1 8($a0)
	lw	$t1 24($t1)
	jalr		$t1
	b	label226
label225:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label230
	la	$a0 str_const0
	li	$t1 193
	jal	_dispatch_abort
label230:
	lw	$t1 8($a0)
	lw	$t1 24($t1)
	jalr		$t1
label226:
label219:
label215:
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
A2I.a2i_aux:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label231
	la	$a0 str_const0
	li	$t1 203
	jal	_dispatch_abort
label231:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
label232:
	lw	$a0 -20($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -16($fp)
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	blt	$t1 $t2 label234
	la	$a0 bool_const0
label234:
	lw	$t1 12($a0)
	beqz	$t1 label233
	lw	$a0 -12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const10
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	mul	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -20($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label235
	la	$a0 str_const0
	li	$t1 207
	jal	_dispatch_abort
label235:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label236
	la	$a0 str_const0
	li	$t1 207
	jal	_dispatch_abort
label236:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 -12($fp)
	lw	$a0 -20($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 -20($fp)
	b	label232
label233:
	li	$a0 0
	addiu	$sp $sp 4
	addiu	$sp $sp 4
	lw	$a0 -12($fp)
	addiu	$sp $sp 4
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
A2I.i2a:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label237
	jal	equality_test
label237:
	lw	$t1 12($a0)
	beqz	$t1 label238
	la	$a0 str_const1
	b	label239
label238:
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	blt	$t1 $t2 label240
	la	$a0 bool_const0
label240:
	lw	$t1 12($a0)
	beqz	$t1 label241
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label243
	la	$a0 str_const0
	li	$t1 223
	jal	_dispatch_abort
label243:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr		$t1
	b	label242
label241:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	jal	Object.copy
	lw	$t1 12($a0)
	neg	$t1 $t1
	sw	$t1 12($a0)
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	mul	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label244
	la	$a0 str_const0
	li	$t1 224
	jal	_dispatch_abort
label244:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const12
	bne	$a0 $zero label245
	la	$a0 str_const0
	li	$t1 224
	jal	_dispatch_abort
label245:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
label242:
label239:
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
A2I.i2a_aux:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label246
	jal	equality_test
label246:
	lw	$t1 12($a0)
	beqz	$t1 label247
	la	$a0 str_const11
	b	label248
label247:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const10
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	div	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const10
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	mul	$t1 $t1 $t2
	sw	$t1 12($a0)
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	sub	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label249
	la	$a0 str_const0
	li	$t1 233
	jal	_dispatch_abort
label249:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label250
	la	$a0 str_const0
	li	$t1 233
	jal	_dispatch_abort
label250:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr		$t1
	bne	$a0 $zero label251
	la	$a0 str_const0
	li	$t1 233
	jal	_dispatch_abort
label251:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	addiu	$sp $sp 4
label248:
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
E.method6:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 Int_protObj
	jal	Object.copy
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const4
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	div	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 -12($fp)
	lw	$a0 -12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 A_protObj
	jal	Object.copy
	jalr	A_init
	bne	$a0 $zero label252
	la	$a0 str_const0
	li	$t1 126
	jal	_dispatch_abort
label252:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	addiu	$sp $sp 4
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
D.method7:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	blt	$t1 $t2 label253
	la	$a0 bool_const0
label253:
	lw	$t1 12($a0)
	beqz	$t1 label254
	lw	$a0 -12($fp)
	jal	Object.copy
	lw	$t1 12($a0)
	neg	$t1 $t1
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label256
	la	$a0 str_const0
	li	$t1 111
	jal	_dispatch_abort
label256:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	b	label255
label254:
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label257
	jal	equality_test
label257:
	lw	$t1 12($a0)
	beqz	$t1 label258
	la	$a0 bool_const1
	b	label259
label258:
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label260
	jal	equality_test
label260:
	lw	$t1 12($a0)
	beqz	$t1 label261
	la	$a0 bool_const0
	b	label262
label261:
	la	$a0 int_const2
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label263
	jal	equality_test
label263:
	lw	$t1 12($a0)
	beqz	$t1 label264
	la	$a0 bool_const0
	b	label265
label264:
	lw	$a0 -12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	sub	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label266
	la	$a0 str_const0
	li	$t1 115
	jal	_dispatch_abort
label266:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
label265:
label262:
label259:
label255:
	addiu	$sp $sp 4
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
C.method6:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 Int_protObj
	jal	Object.copy
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	jal	Object.copy
	lw	$t1 12($a0)
	neg	$t1 $t1
	sw	$t1 12($a0)
	sw	$a0 -12($fp)
	lw	$a0 -12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 A_protObj
	jal	Object.copy
	jalr	A_init
	bne	$a0 $zero label267
	la	$a0 str_const0
	li	$t1 93
	jal	_dispatch_abort
label267:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	addiu	$sp $sp 4
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
C.method5:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 Int_protObj
	jal	Object.copy
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	mul	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	mul	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 -12($fp)
	lw	$a0 -12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 E_protObj
	jal	Object.copy
	jalr	E_init
	bne	$a0 $zero label268
	la	$a0 str_const0
	li	$t1 102
	jal	_dispatch_abort
label268:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	addiu	$sp $sp 4
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
B.method5:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 Int_protObj
	jal	Object.copy
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	mul	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 -12($fp)
	lw	$a0 -12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 E_protObj
	jal	Object.copy
	jalr	E_init
	bne	$a0 $zero label269
	la	$a0 str_const0
	li	$t1 82
	jal	_dispatch_abort
label269:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	addiu	$sp $sp 4
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
A.value:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 12($s0)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
A.set_var:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 4($fp)
	sw	$a0 12($s0)
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
A.method1:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
A.method2:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 Int_protObj
	jal	Object.copy
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 -12($fp)
	lw	$a0 -12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 B_protObj
	jal	Object.copy
	jalr	B_init
	bne	$a0 $zero label270
	la	$a0 str_const0
	li	$t1 27
	jal	_dispatch_abort
label270:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	addiu	$sp $sp 4
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 20
	jr	$ra	
A.method3:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 Int_protObj
	jal	Object.copy
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	jal	Object.copy
	lw	$t1 12($a0)
	neg	$t1 $t1
	sw	$t1 12($a0)
	sw	$a0 -12($fp)
	lw	$a0 -12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 C_protObj
	jal	Object.copy
	jalr	C_init
	bne	$a0 $zero label271
	la	$a0 str_const0
	li	$t1 36
	jal	_dispatch_abort
label271:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	addiu	$sp $sp 4
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
A.method4:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	blt	$t1 $t2 label272
	la	$a0 bool_const0
label272:
	lw	$t1 12($a0)
	beqz	$t1 label273
	la	$a0 Int_protObj
	jal	Object.copy
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	sub	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 -12($fp)
	lw	$a0 -12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 D_protObj
	jal	Object.copy
	jalr	D_init
	bne	$a0 $zero label275
	la	$a0 str_const0
	li	$t1 46
	jal	_dispatch_abort
label275:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	addiu	$sp $sp 4
	b	label274
label273:
	la	$a0 Int_protObj
	jal	Object.copy
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	sub	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 -12($fp)
	lw	$a0 -12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 D_protObj
	jal	Object.copy
	jalr	D_init
	bne	$a0 $zero label276
	la	$a0 str_const0
	li	$t1 53
	jal	_dispatch_abort
label276:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	addiu	$sp $sp 4
label274:
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 20
	jr	$ra	
A.method5:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
label277:
	lw	$a0 -16($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	ble	$t1 $t2 label279
	la	$a0 bool_const0
label279:
	lw	$t1 12($a0)
	beqz	$t1 label278
	lw	$a0 -12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -16($fp)
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	mul	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 -12($fp)
	lw	$a0 -16($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 -16($fp)
	b	label277
label278:
	li	$a0 0
	addiu	$sp $sp 4
	lw	$a0 -12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 E_protObj
	jal	Object.copy
	jalr	E_init
	bne	$a0 $zero label280
	la	$a0 str_const0
	li	$t1 70
	jal	_dispatch_abort
label280:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	addiu	$sp $sp 4
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	

# end of generated code
