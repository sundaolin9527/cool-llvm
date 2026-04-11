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
str_const36:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const6
	.ascii	"BoolOp"
	.byte	0	
	.align	2
	.word	-1
str_const35:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"Main"
	.byte	0	
	.align	2
	.word	-1
str_const34:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const5
	.ascii	"Parse"
	.byte	0	
	.align	2
	.word	-1
str_const33:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const5
	.ascii	"VCons"
	.byte	0	
	.align	2
	.word	-1
str_const32:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const5
	.ascii	"VList"
	.byte	0	
	.align	2
	.word	-1
str_const31:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const5
	.ascii	"ECons"
	.byte	0	
	.align	2
	.word	-1
str_const30:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const5
	.ascii	"EList"
	.byte	0	
	.align	2
	.word	-1
str_const29:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"Edge"
	.byte	0	
	.align	2
	.word	-1
str_const28:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const7
	.ascii	"Vertice"
	.byte	0	
	.align	2
	.word	-1
str_const27:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const5
	.ascii	"Graph"
	.byte	0	
	.align	2
	.word	-1
str_const26:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const6
	.ascii	"String"
	.byte	0	
	.align	2
	.word	-1
str_const25:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"Bool"
	.byte	0	
	.align	2
	.word	-1
str_const24:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const3
	.ascii	"Int"
	.byte	0	
	.align	2
	.word	-1
str_const23:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const2
	.ascii	"IO"
	.byte	0	
	.align	2
	.word	-1
str_const22:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const6
	.ascii	"Object"
	.byte	0	
	.align	2
	.word	-1
str_const21:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const10
	.ascii	"_prim_slot"
	.byte	0	
	.align	2
	.word	-1
str_const20:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const9
	.ascii	"SELF_TYPE"
	.byte	0	
	.align	2
	.word	-1
str_const19:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const9
	.ascii	"_no_class"
	.byte	0	
	.align	2
	.word	-1
str_const18:
	.word	4
	.word	8
	.word	String_dispTab
	.word	int_const15
	.ascii	"<basic class>"
	.byte	0	
	.align	2
	.word	-1
str_const17:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const0
	.ascii	" "
	.byte	0	
	.align	2
	.word	-1
str_const16:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const0
	.ascii	"-"
	.byte	0	
	.align	2
	.word	-1
str_const15:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const0
	.ascii	"9"
	.byte	0	
	.align	2
	.word	-1
str_const14:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const0
	.ascii	"8"
	.byte	0	
	.align	2
	.word	-1
str_const13:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const0
	.ascii	"7"
	.byte	0	
	.align	2
	.word	-1
str_const12:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const0
	.ascii	"6"
	.byte	0	
	.align	2
	.word	-1
str_const11:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const0
	.ascii	"5"
	.byte	0	
	.align	2
	.word	-1
str_const10:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const0
	.ascii	"4"
	.byte	0	
	.align	2
	.word	-1
str_const9:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const0
	.ascii	"3"
	.byte	0	
	.align	2
	.word	-1
str_const8:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const0
	.ascii	"2"
	.byte	0	
	.align	2
	.word	-1
str_const7:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const0
	.ascii	"1"
	.byte	0	
	.align	2
	.word	-1
str_const6:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const0
	.ascii	"0"
	.byte	0	
	.align	2
	.word	-1
str_const5:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.byte	0	
	.align	2
	.word	-1
str_const4:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const0
	.ascii	"\n"
	.byte	0	
	.align	2
	.word	-1
str_const3:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const0
	.ascii	")"
	.byte	0	
	.align	2
	.word	-1
str_const2:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const0
	.ascii	","
	.byte	0	
	.align	2
	.word	-1
str_const1:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const2
	.ascii	" ("
	.byte	0	
	.align	2
	.word	-1
str_const0:
	.word	4
	.word	17
	.word	String_dispTab
	.word	int_const16
	.ascii	"/opt/sundaolin/cool-llvm/tests/unit/cases/graph.cl"
	.byte	0	
	.align	2
	.word	-1
int_const16:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	50
	.word	-1
int_const15:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	13
	.word	-1
int_const14:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	55
	.word	-1
int_const13:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	150
	.word	-1
int_const12:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	200
	.word	-1
int_const11:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	100
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
	.word	8
	.word	-1
int_const7:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	7
	.word	-1
int_const6:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	6
	.word	-1
int_const5:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	5
	.word	-1
int_const4:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	4
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
	.word	0
	.word	-1
int_const0:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	1
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
	.word	str_const22
	.word	str_const23
	.word	str_const24
	.word	str_const25
	.word	str_const26
	.word	str_const27
	.word	str_const28
	.word	str_const29
	.word	str_const30
	.word	str_const31
	.word	str_const32
	.word	str_const33
	.word	str_const34
	.word	str_const35
	.word	str_const36
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
	.word	Graph_protObj
	.word	Graph_init
	.word	Vertice_protObj
	.word	Vertice_init
	.word	Edge_protObj
	.word	Edge_init
	.word	EList_protObj
	.word	EList_init
	.word	ECons_protObj
	.word	ECons_init
	.word	VList_protObj
	.word	VList_init
	.word	VCons_protObj
	.word	VCons_init
	.word	Parse_protObj
	.word	Parse_init
	.word	Main_protObj
	.word	Main_init
	.word	BoolOp_protObj
	.word	BoolOp_init
	.word	-1
BoolOp_protObj:
	.word	14
	.word	3
	.word	BoolOp_dispTab
	.word	-1
Main_protObj:
	.word	13
	.word	5
	.word	Main_dispTab
	.word	0
	.word	str_const5
	.word	-1
Parse_protObj:
	.word	12
	.word	5
	.word	Parse_dispTab
	.word	0
	.word	str_const5
	.word	-1
VCons_protObj:
	.word	11
	.word	5
	.word	VCons_dispTab
	.word	0
	.word	0
	.word	-1
VList_protObj:
	.word	10
	.word	4
	.word	VList_dispTab
	.word	0
	.word	-1
ECons_protObj:
	.word	9
	.word	5
	.word	ECons_dispTab
	.word	0
	.word	0
	.word	-1
EList_protObj:
	.word	8
	.word	4
	.word	EList_dispTab
	.word	0
	.word	-1
Edge_protObj:
	.word	7
	.word	6
	.word	Edge_dispTab
	.word	int_const1
	.word	int_const1
	.word	int_const1
	.word	-1
Vertice_protObj:
	.word	6
	.word	5
	.word	Vertice_dispTab
	.word	int_const1
	.word	0
	.word	-1
Graph_protObj:
	.word	5
	.word	5
	.word	Graph_dispTab
	.word	0
	.word	0
	.word	-1
String_protObj:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
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
BoolOp_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	BoolOp.and
	.word	BoolOp.or
Main_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	IO.out_string
	.word	IO.out_int
	.word	IO.in_string
	.word	IO.in_int
	.word	Parse.read_input
	.word	Parse.parse_line
	.word	Parse.c2i
	.word	Parse.a2i
	.word	Parse.a2i_aux
	.word	Main.main
Parse_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	IO.out_string
	.word	IO.out_int
	.word	IO.in_string
	.word	IO.in_int
	.word	Parse.read_input
	.word	Parse.parse_line
	.word	Parse.c2i
	.word	Parse.a2i
	.word	Parse.a2i_aux
VCons_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	IO.out_string
	.word	IO.out_int
	.word	IO.in_string
	.word	IO.in_int
	.word	VCons.isNil
	.word	VCons.head
	.word	VCons.tail
	.word	VList.cons
	.word	VCons.print
	.word	VCons.init
VList_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	IO.out_string
	.word	IO.out_int
	.word	IO.in_string
	.word	IO.in_int
	.word	VList.isNil
	.word	VList.head
	.word	VList.tail
	.word	VList.cons
	.word	VList.print
ECons_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	IO.out_string
	.word	IO.out_int
	.word	IO.in_string
	.word	IO.in_int
	.word	ECons.isNil
	.word	ECons.head
	.word	ECons.tail
	.word	EList.cons
	.word	EList.append
	.word	ECons.print
	.word	ECons.init
EList_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	IO.out_string
	.word	IO.out_int
	.word	IO.in_string
	.word	IO.in_int
	.word	EList.isNil
	.word	EList.head
	.word	EList.tail
	.word	EList.cons
	.word	EList.append
	.word	EList.print
Edge_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	IO.out_string
	.word	IO.out_int
	.word	IO.in_string
	.word	IO.in_int
	.word	Edge.init
	.word	Edge.print
Vertice_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	IO.out_string
	.word	IO.out_int
	.word	IO.in_string
	.word	IO.in_int
	.word	Vertice.outgoing
	.word	Vertice.number
	.word	Vertice.init
	.word	Vertice.add_out
	.word	Vertice.print
Graph_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	Graph.add_vertice
	.word	Graph.print_E
	.word	Graph.print_V
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
BoolOp_init:
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
Main_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	jal	Parse_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Parse_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	jal	IO_init
	la	$a0 BoolOp_protObj
	jal	Object.copy
	jalr	BoolOp_init
	sw	$a0 12($s0)
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
VCons_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	jal	VList_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
VList_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	jal	IO_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
ECons_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	jal	EList_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
EList_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	jal	IO_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Edge_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	jal	IO_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Vertice_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	jal	IO_init
	la	$a0 EList_protObj
	jal	Object.copy
	jalr	EList_init
	sw	$a0 16($s0)
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Graph_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	jal	Object_init
	la	$a0 VList_protObj
	jal	Object.copy
	jalr	VList_init
	sw	$a0 12($s0)
	la	$a0 EList_protObj
	jal	Object.copy
	jalr	EList_init
	sw	$a0 16($s0)
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
BoolOp.and:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 8($fp)
	lw	$t1 12($a0)
	beqz	$t1 label0
	lw	$a0 4($fp)
	b	label1
label0:
	la	$a0 bool_const0
label1:
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 20
	jr	$ra	
BoolOp.or:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 8($fp)
	lw	$t1 12($a0)
	beqz	$t1 label2
	la	$a0 bool_const1
	b	label3
label2:
	lw	$a0 4($fp)
label3:
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 20
	jr	$ra	
Main.main:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 Graph_protObj
	jal	Object.copy
	jalr	Graph_init
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const2
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const11
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Edge_protObj
	jal	Object.copy
	jalr	Edge_init
	bne	$a0 $zero label4
	la	$a0 str_const0
	li	$t1 362
	jal	_dispatch_abort
label4:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Vertice_protObj
	jal	Object.copy
	jalr	Vertice_init
	bne	$a0 $zero label5
	la	$a0 str_const0
	li	$t1 362
	jal	_dispatch_abort
label5:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr		$t1
	bne	$a0 $zero label6
	la	$a0 str_const0
	li	$t1 362
	jal	_dispatch_abort
label6:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	bne	$a0 $zero label7
	la	$a0 str_const0
	li	$t1 361
	jal	_dispatch_abort
label7:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 int_const2
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const13
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Edge_protObj
	jal	Object.copy
	jalr	Edge_init
	bne	$a0 $zero label8
	la	$a0 str_const0
	li	$t1 367
	jal	_dispatch_abort
label8:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const2
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const12
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Edge_protObj
	jal	Object.copy
	jalr	Edge_init
	bne	$a0 $zero label9
	la	$a0 str_const0
	li	$t1 366
	jal	_dispatch_abort
label9:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const2
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Vertice_protObj
	jal	Object.copy
	jalr	Vertice_init
	bne	$a0 $zero label10
	la	$a0 str_const0
	li	$t1 365
	jal	_dispatch_abort
label10:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr		$t1
	bne	$a0 $zero label11
	la	$a0 str_const0
	li	$t1 366
	jal	_dispatch_abort
label11:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	bne	$a0 $zero label12
	la	$a0 str_const0
	li	$t1 367
	jal	_dispatch_abort
label12:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	bne	$a0 $zero label13
	la	$a0 str_const0
	li	$t1 364
	jal	_dispatch_abort
label13:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 int_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const2
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const10
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Edge_protObj
	jal	Object.copy
	jalr	Edge_init
	bne	$a0 $zero label14
	la	$a0 str_const0
	li	$t1 370
	jal	_dispatch_abort
label14:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Vertice_protObj
	jal	Object.copy
	jalr	Vertice_init
	bne	$a0 $zero label15
	la	$a0 str_const0
	li	$t1 370
	jal	_dispatch_abort
label15:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr		$t1
	bne	$a0 $zero label16
	la	$a0 str_const0
	li	$t1 370
	jal	_dispatch_abort
label16:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	bne	$a0 $zero label17
	la	$a0 str_const0
	li	$t1 369
	jal	_dispatch_abort
label17:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 int_const4
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const5
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const11
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Edge_protObj
	jal	Object.copy
	jalr	Edge_init
	bne	$a0 $zero label18
	la	$a0 str_const0
	li	$t1 375
	jal	_dispatch_abort
label18:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const4
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const14
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Edge_protObj
	jal	Object.copy
	jalr	Edge_init
	bne	$a0 $zero label19
	la	$a0 str_const0
	li	$t1 374
	jal	_dispatch_abort
label19:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const4
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Vertice_protObj
	jal	Object.copy
	jalr	Vertice_init
	bne	$a0 $zero label20
	la	$a0 str_const0
	li	$t1 373
	jal	_dispatch_abort
label20:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr		$t1
	bne	$a0 $zero label21
	la	$a0 str_const0
	li	$t1 374
	jal	_dispatch_abort
label21:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	bne	$a0 $zero label22
	la	$a0 str_const0
	li	$t1 375
	jal	_dispatch_abort
label22:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	bne	$a0 $zero label23
	la	$a0 str_const0
	li	$t1 372
	jal	_dispatch_abort
label23:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 int_const5
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const5
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const5
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Edge_protObj
	jal	Object.copy
	jalr	Edge_init
	bne	$a0 $zero label24
	la	$a0 str_const0
	li	$t1 383
	jal	_dispatch_abort
label24:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const5
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const4
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const4
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Edge_protObj
	jal	Object.copy
	jalr	Edge_init
	bne	$a0 $zero label25
	la	$a0 str_const0
	li	$t1 382
	jal	_dispatch_abort
label25:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const5
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Edge_protObj
	jal	Object.copy
	jalr	Edge_init
	bne	$a0 $zero label26
	la	$a0 str_const0
	li	$t1 381
	jal	_dispatch_abort
label26:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const5
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const2
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const2
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Edge_protObj
	jal	Object.copy
	jalr	Edge_init
	bne	$a0 $zero label27
	la	$a0 str_const0
	li	$t1 380
	jal	_dispatch_abort
label27:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const5
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Edge_protObj
	jal	Object.copy
	jalr	Edge_init
	bne	$a0 $zero label28
	la	$a0 str_const0
	li	$t1 379
	jal	_dispatch_abort
label28:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const5
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Vertice_protObj
	jal	Object.copy
	jalr	Vertice_init
	bne	$a0 $zero label29
	la	$a0 str_const0
	li	$t1 378
	jal	_dispatch_abort
label29:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr		$t1
	bne	$a0 $zero label30
	la	$a0 str_const0
	li	$t1 379
	jal	_dispatch_abort
label30:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	bne	$a0 $zero label31
	la	$a0 str_const0
	li	$t1 380
	jal	_dispatch_abort
label31:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	bne	$a0 $zero label32
	la	$a0 str_const0
	li	$t1 381
	jal	_dispatch_abort
label32:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	bne	$a0 $zero label33
	la	$a0 str_const0
	li	$t1 382
	jal	_dispatch_abort
label33:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	bne	$a0 $zero label34
	la	$a0 str_const0
	li	$t1 383
	jal	_dispatch_abort
label34:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	bne	$a0 $zero label35
	la	$a0 str_const0
	li	$t1 377
	jal	_dispatch_abort
label35:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 -12($fp)
	bne	$a0 $zero label36
	la	$a0 str_const0
	li	$t1 385
	jal	_dispatch_abort
label36:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	lw	$a0 -12($fp)
	bne	$a0 $zero label37
	la	$a0 str_const0
	li	$t1 386
	jal	_dispatch_abort
label37:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	addiu	$sp $sp 4
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Parse.read_input:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 Graph_protObj
	jal	Object.copy
	jalr	Graph_init
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label38
	la	$a0 str_const0
	li	$t1 259
	jal	_dispatch_abort
label38:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
label39:
	lw	$a0 -16($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const4
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label41
	jal	equality_test
label41:
	lw	$t1 12($a0)
	la	$a0 bool_const1
	beqz	$t1 label42
	la	$a0 bool_const0
label42:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -16($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const5
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label43
	jal	equality_test
label43:
	lw	$t1 12($a0)
	la	$a0 bool_const1
	beqz	$t1 label44
	la	$a0 bool_const0
label44:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 12($s0)
	bne	$a0 $zero label45
	la	$a0 str_const0
	li	$t1 260
	jal	_dispatch_abort
label45:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$t1 12($a0)
	beqz	$t1 label40
	lw	$a0 -16($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label46
	la	$a0 str_const0
	li	$t1 263
	jal	_dispatch_abort
label46:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	bne	$a0 $zero label47
	la	$a0 str_const0
	li	$t1 263
	jal	_dispatch_abort
label47:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label48
	la	$a0 str_const0
	li	$t1 264
	jal	_dispatch_abort
label48:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 -16($fp)
	b	label39
label40:
	li	$a0 0
	addiu	$sp $sp 4
	lw	$a0 -12($fp)
	addiu	$sp $sp 4
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Parse.parse_line:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label49
	la	$a0 str_const0
	li	$t1 273
	jal	_dispatch_abort
label49:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Vertice_protObj
	jal	Object.copy
	jalr	Vertice_init
	bne	$a0 $zero label50
	la	$a0 str_const0
	li	$t1 273
	jal	_dispatch_abort
label50:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
label51:
	lw	$a0 16($s0)
	bne	$a0 $zero label53
	la	$a0 str_const0
	li	$t1 274
	jal	_dispatch_abort
label53:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label54
	jal	equality_test
label54:
	lw	$t1 12($a0)
	la	$a0 bool_const1
	beqz	$t1 label55
	la	$a0 bool_const0
label55:
	lw	$t1 12($a0)
	beqz	$t1 label52
	lw	$a0 16($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label56
	la	$a0 str_const0
	li	$t1 277
	jal	_dispatch_abort
label56:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 16($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label57
	la	$a0 str_const0
	li	$t1 278
	jal	_dispatch_abort
label57:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	bne	$a0 $zero label58
	la	$a0 str_const0
	li	$t1 280
	jal	_dispatch_abort
label58:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -16($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -20($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Edge_protObj
	jal	Object.copy
	jalr	Edge_init
	bne	$a0 $zero label59
	la	$a0 str_const0
	li	$t1 280
	jal	_dispatch_abort
label59:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	bne	$a0 $zero label60
	la	$a0 str_const0
	li	$t1 280
	jal	_dispatch_abort
label60:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	addiu	$sp $sp 4
	addiu	$sp $sp 4
	b	label51
label52:
	li	$a0 0
	lw	$a0 -12($fp)
	addiu	$sp $sp 4
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
Parse.c2i:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const6
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label61
	jal	equality_test
label61:
	lw	$t1 12($a0)
	beqz	$t1 label62
	la	$a0 int_const1
	b	label63
label62:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const7
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label64
	jal	equality_test
label64:
	lw	$t1 12($a0)
	beqz	$t1 label65
	la	$a0 int_const0
	b	label66
label65:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const8
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label67
	jal	equality_test
label67:
	lw	$t1 12($a0)
	beqz	$t1 label68
	la	$a0 int_const2
	b	label69
label68:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const9
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label70
	jal	equality_test
label70:
	lw	$t1 12($a0)
	beqz	$t1 label71
	la	$a0 int_const3
	b	label72
label71:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const10
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label73
	jal	equality_test
label73:
	lw	$t1 12($a0)
	beqz	$t1 label74
	la	$a0 int_const4
	b	label75
label74:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const11
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label76
	jal	equality_test
label76:
	lw	$t1 12($a0)
	beqz	$t1 label77
	la	$a0 int_const5
	b	label78
label77:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const12
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
	la	$a0 int_const6
	b	label81
label80:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const13
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label82
	jal	equality_test
label82:
	lw	$t1 12($a0)
	beqz	$t1 label83
	la	$a0 int_const7
	b	label84
label83:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const14
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label85
	jal	equality_test
label85:
	lw	$t1 12($a0)
	beqz	$t1 label86
	la	$a0 int_const8
	b	label87
label86:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const15
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label88
	jal	equality_test
label88:
	lw	$t1 12($a0)
	beqz	$t1 label89
	la	$a0 int_const9
	b	label90
label89:
	move	$a0 $s0
	bne	$a0 $zero label91
	la	$a0 str_const0
	li	$t1 301
	jal	_dispatch_abort
label91:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr		$t1
	la	$a0 int_const1
label90:
label87:
label84:
label81:
label78:
label75:
label72:
label69:
label66:
label63:
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
Parse.a2i:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 4($fp)
	bne	$a0 $zero label92
	la	$a0 str_const0
	li	$t1 308
	jal	_dispatch_abort
label92:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label93
	jal	equality_test
label93:
	lw	$t1 12($a0)
	beqz	$t1 label94
	la	$a0 int_const1
	b	label95
label94:
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label96
	la	$a0 str_const0
	li	$t1 309
	jal	_dispatch_abort
label96:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const16
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label97
	jal	equality_test
label97:
	lw	$t1 12($a0)
	beqz	$t1 label98
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label100
	la	$a0 str_const0
	li	$t1 309
	jal	_dispatch_abort
label100:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
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
	bne	$a0 $zero label101
	la	$a0 str_const0
	li	$t1 309
	jal	_dispatch_abort
label101:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label102
	la	$a0 str_const0
	li	$t1 309
	jal	_dispatch_abort
label102:
	lw	$t1 8($a0)
	lw	$t1 44($t1)
	jalr		$t1
	jal	Object.copy
	lw	$t1 12($a0)
	neg	$t1 $t1
	sw	$t1 12($a0)
	b	label99
label98:
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label103
	la	$a0 str_const0
	li	$t1 310
	jal	_dispatch_abort
label103:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const17
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
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label107
	la	$a0 str_const0
	li	$t1 310
	jal	_dispatch_abort
label107:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
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
	bne	$a0 $zero label108
	la	$a0 str_const0
	li	$t1 310
	jal	_dispatch_abort
label108:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label109
	la	$a0 str_const0
	li	$t1 310
	jal	_dispatch_abort
label109:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	b	label106
label105:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label110
	la	$a0 str_const0
	li	$t1 311
	jal	_dispatch_abort
label110:
	lw	$t1 8($a0)
	lw	$t1 44($t1)
	jalr		$t1
label106:
label99:
label95:
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
Parse.a2i_aux:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label111
	la	$a0 str_const0
	li	$t1 324
	jal	_dispatch_abort
label111:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
label112:
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
	blt	$t1 $t2 label114
	la	$a0 bool_const0
label114:
	lw	$t1 12($a0)
	beqz	$t1 label113
	lw	$a0 -20($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label115
	la	$a0 str_const0
	li	$t1 327
	jal	_dispatch_abort
label115:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -24($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const17
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label116
	jal	equality_test
label116:
	lw	$t1 12($a0)
	beqz	$t1 label117
	lw	$a0 -20($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label119
	la	$a0 str_const0
	li	$t1 330
	jal	_dispatch_abort
label119:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -20($fp)
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	sub	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
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
	bne	$a0 $zero label120
	la	$a0 str_const0
	li	$t1 330
	jal	_dispatch_abort
label120:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 16($s0)
	lw	$a0 -16($fp)
	sw	$a0 -20($fp)
	b	label118
label117:
	lw	$a0 -24($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const2
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label121
	jal	equality_test
label121:
	lw	$t1 12($a0)
	beqz	$t1 label122
	lw	$a0 -20($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label124
	la	$a0 str_const0
	li	$t1 335
	jal	_dispatch_abort
label124:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -20($fp)
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	sub	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
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
	bne	$a0 $zero label125
	la	$a0 str_const0
	li	$t1 335
	jal	_dispatch_abort
label125:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 16($s0)
	lw	$a0 -16($fp)
	sw	$a0 -20($fp)
	b	label123
label122:
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
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label126
	la	$a0 str_const0
	li	$t1 340
	jal	_dispatch_abort
label126:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label127
	la	$a0 str_const0
	li	$t1 340
	jal	_dispatch_abort
label127:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
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
	la	$a0 int_const0
	jal	Object.copy
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 -20($fp)
	lw	$a0 -20($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -16($fp)
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label128
	jal	equality_test
label128:
	lw	$t1 12($a0)
	beqz	$t1 label129
	la	$a0 str_const5
	sw	$a0 16($s0)
	b	label130
label129:
	la	$a0 str_const5
label130:
label123:
label118:
	addiu	$sp $sp 4
	b	label112
label113:
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
VCons.isNil:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 bool_const0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
VCons.head:
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
VCons.tail:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 16($s0)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
VCons.init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 8($fp)
	sw	$a0 12($s0)
	lw	$a0 4($fp)
	sw	$a0 16($s0)
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 20
	jr	$ra	
VCons.print:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 12($s0)
	bne	$a0 $zero label131
	la	$a0 str_const0
	li	$t1 241
	jal	_dispatch_abort
label131:
	lw	$t1 8($a0)
	lw	$t1 44($t1)
	jalr		$t1
	lw	$a0 16($s0)
	bne	$a0 $zero label132
	la	$a0 str_const0
	li	$t1 242
	jal	_dispatch_abort
label132:
	lw	$t1 8($a0)
	lw	$t1 44($t1)
	jalr		$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
VList.isNil:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 bool_const1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
VList.head:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	move	$a0 $s0
	bne	$a0 $zero label133
	la	$a0 str_const0
	li	$t1 201
	jal	_dispatch_abort
label133:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr		$t1
	lw	$a0 12($s0)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
VList.tail:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	move	$a0 $s0
	bne	$a0 $zero label134
	la	$a0 str_const0
	li	$t1 203
	jal	_dispatch_abort
label134:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr		$t1
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
VList.cons:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 VCons_protObj
	jal	Object.copy
	jalr	VCons_init
	bne	$a0 $zero label135
	la	$a0 str_const0
	li	$t1 213
	jal	_dispatch_abort
label135:
	lw	$t1 8($a0)
	lw	$t1 48($t1)
	jalr		$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
VList.print:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 str_const4
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label136
	la	$a0 str_const0
	li	$t1 216
	jal	_dispatch_abort
label136:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
ECons.isNil:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 bool_const0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
ECons.head:
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
ECons.tail:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 16($s0)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
ECons.init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 8($fp)
	sw	$a0 12($s0)
	lw	$a0 4($fp)
	sw	$a0 16($s0)
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 20
	jr	$ra	
ECons.print:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 12($s0)
	bne	$a0 $zero label137
	la	$a0 str_const0
	li	$t1 184
	jal	_dispatch_abort
label137:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr		$t1
	lw	$a0 16($s0)
	bne	$a0 $zero label138
	la	$a0 str_const0
	li	$t1 185
	jal	_dispatch_abort
label138:
	lw	$t1 8($a0)
	lw	$t1 48($t1)
	jalr		$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
EList.isNil:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 bool_const1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
EList.head:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	move	$a0 $s0
	bne	$a0 $zero label139
	la	$a0 str_const0
	li	$t1 123
	jal	_dispatch_abort
label139:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr		$t1
	lw	$a0 12($s0)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
EList.tail:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	move	$a0 $s0
	bne	$a0 $zero label140
	la	$a0 str_const0
	li	$t1 125
	jal	_dispatch_abort
label140:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr		$t1
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
EList.cons:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 ECons_protObj
	jal	Object.copy
	jalr	ECons_init
	bne	$a0 $zero label141
	la	$a0 str_const0
	li	$t1 135
	jal	_dispatch_abort
label141:
	lw	$t1 8($a0)
	lw	$t1 52($t1)
	jalr		$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
EList.append:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	move	$a0 $s0
	bne	$a0 $zero label142
	la	$a0 str_const0
	li	$t1 139
	jal	_dispatch_abort
label142:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	lw	$t1 12($a0)
	beqz	$t1 label143
	lw	$a0 4($fp)
	b	label144
label143:
	move	$a0 $s0
	bne	$a0 $zero label145
	la	$a0 str_const0
	li	$t1 140
	jal	_dispatch_abort
label145:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label146
	la	$a0 str_const0
	li	$t1 140
	jal	_dispatch_abort
label146:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr		$t1
	bne	$a0 $zero label147
	la	$a0 str_const0
	li	$t1 140
	jal	_dispatch_abort
label147:
	lw	$t1 8($a0)
	lw	$t1 44($t1)
	jalr		$t1
	bne	$a0 $zero label148
	la	$a0 str_const0
	li	$t1 140
	jal	_dispatch_abort
label148:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
label144:
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
EList.print:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 str_const4
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label149
	la	$a0 str_const0
	li	$t1 145
	jal	_dispatch_abort
label149:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Edge.init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 12($fp)
	sw	$a0 12($s0)
	lw	$a0 8($fp)
	sw	$a0 16($s0)
	lw	$a0 4($fp)
	sw	$a0 20($s0)
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 24
	jr	$ra	
Edge.print:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	la	$a0 str_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label150
	la	$a0 str_const0
	li	$t1 103
	jal	_dispatch_abort
label150:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 12($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label151
	la	$a0 str_const0
	li	$t1 104
	jal	_dispatch_abort
label151:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	la	$a0 str_const2
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label152
	la	$a0 str_const0
	li	$t1 105
	jal	_dispatch_abort
label152:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 16($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label153
	la	$a0 str_const0
	li	$t1 106
	jal	_dispatch_abort
label153:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	la	$a0 str_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label154
	la	$a0 str_const0
	li	$t1 107
	jal	_dispatch_abort
label154:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 20($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label155
	la	$a0 str_const0
	li	$t1 108
	jal	_dispatch_abort
label155:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Vertice.outgoing:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 16($s0)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Vertice.number:
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
Vertice.init:
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
Vertice.add_out:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 16($s0)
	bne	$a0 $zero label156
	la	$a0 str_const0
	li	$t1 72
	jal	_dispatch_abort
label156:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	sw	$a0 16($s0)
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
Vertice.print:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 12($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label157
	la	$a0 str_const0
	li	$t1 79
	jal	_dispatch_abort
label157:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	lw	$a0 16($s0)
	bne	$a0 $zero label158
	la	$a0 str_const0
	li	$t1 80
	jal	_dispatch_abort
label158:
	lw	$t1 8($a0)
	lw	$t1 48($t1)
	jalr		$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Graph.add_vertice:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 16($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label159
	la	$a0 str_const0
	li	$t1 44
	jal	_dispatch_abort
label159:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	bne	$a0 $zero label160
	la	$a0 str_const0
	li	$t1 44
	jal	_dispatch_abort
label160:
	lw	$t1 8($a0)
	lw	$t1 44($t1)
	jalr		$t1
	sw	$a0 16($s0)
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 12($s0)
	bne	$a0 $zero label161
	la	$a0 str_const0
	li	$t1 45
	jal	_dispatch_abort
label161:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	sw	$a0 12($s0)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
Graph.print_E:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 16($s0)
	bne	$a0 $zero label162
	la	$a0 str_const0
	li	$t1 48
	jal	_dispatch_abort
label162:
	lw	$t1 8($a0)
	lw	$t1 48($t1)
	jalr		$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Graph.print_V:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 12
	move	$s0 $a0
	lw	$a0 12($s0)
	bne	$a0 $zero label163
	la	$a0 str_const0
	li	$t1 49
	jal	_dispatch_abort
label163:
	lw	$t1 8($a0)
	lw	$t1 44($t1)
	jalr		$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	

# end of generated code
