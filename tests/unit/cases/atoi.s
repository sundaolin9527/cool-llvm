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
str_const27:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"Main"
	.byte	0	
	.align	2
	.word	-1
str_const26:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const3
	.ascii	"A2I"
	.byte	0	
	.align	2
	.word	-1
str_const25:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const6
	.ascii	"String"
	.byte	0	
	.align	2
	.word	-1
str_const24:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"Bool"
	.byte	0	
	.align	2
	.word	-1
str_const23:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const3
	.ascii	"Int"
	.byte	0	
	.align	2
	.word	-1
str_const22:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const2
	.ascii	"IO"
	.byte	0	
	.align	2
	.word	-1
str_const21:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const6
	.ascii	"Object"
	.byte	0	
	.align	2
	.word	-1
str_const20:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const10
	.ascii	"_prim_slot"
	.byte	0	
	.align	2
	.word	-1
str_const19:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const9
	.ascii	"SELF_TYPE"
	.byte	0	
	.align	2
	.word	-1
str_const18:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const9
	.ascii	"_no_class"
	.byte	0	
	.align	2
	.word	-1
str_const17:
	.word	4
	.word	8
	.word	String_dispTab
	.word	int_const11
	.ascii	"<basic class>"
	.byte	0	
	.align	2
	.word	-1
str_const16:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const2
	.ascii	"+0"
	.byte	0	
	.align	2
	.word	-1
str_const15:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"\n"
	.byte	0	
	.align	2
	.word	-1
str_const14:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const2
	.ascii	"42"
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
	.word	17
	.word	String_dispTab
	.word	int_const12
	.ascii	"/opt/sundaolin/cool-llvm/tests/unit/cases/atoi.cl"
	.byte	0	
	.align	2
	.word	-1
int_const12:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	49
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
	.word	str_const21
	.word	str_const22
	.word	str_const23
	.word	str_const24
	.word	str_const25
	.word	str_const26
	.word	str_const27
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
	.word	A2I_protObj
	.word	A2I_init
	.word	Main_protObj
	.word	Main_init
	.word	-1
Main_protObj:
	.word	6
	.word	3
	.word	Main_dispTab
	.word	-1
A2I_protObj:
	.word	5
	.word	3
	.word	A2I_dispTab
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
Main.main:
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
	la	$a0 str_const14
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	bne	$a0 $zero label0
	la	$a0 str_const0
	li	$t1 114
	jal	_dispatch_abort
label0:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label1
	la	$a0 str_const0
	li	$t1 114
	jal	_dispatch_abort
label1:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	la	$a0 str_const15
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label2
	la	$a0 str_const0
	li	$t1 115
	jal	_dispatch_abort
label2:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 int_const7
	jal	Object.copy
	lw	$t1 12($a0)
	neg	$t1 $t1
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	bne	$a0 $zero label3
	la	$a0 str_const0
	li	$t1 116
	jal	_dispatch_abort
label3:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label4
	la	$a0 str_const0
	li	$t1 116
	jal	_dispatch_abort
label4:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const15
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label5
	la	$a0 str_const0
	li	$t1 117
	jal	_dispatch_abort
label5:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const16
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	bne	$a0 $zero label6
	la	$a0 str_const0
	li	$t1 118
	jal	_dispatch_abort
label6:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	bne	$a0 $zero label7
	la	$a0 str_const0
	li	$t1 118
	jal	_dispatch_abort
label7:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label8
	la	$a0 str_const0
	li	$t1 118
	jal	_dispatch_abort
label8:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const15
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label9
	la	$a0 str_const0
	li	$t1 119
	jal	_dispatch_abort
label9:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	addiu	$sp $sp 4
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
	beq	$t1 $t2 label10
	jal	equality_test
label10:
	lw	$t1 12($a0)
	beqz	$t1 label11
	la	$a0 int_const0
	b	label12
label11:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const2
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label13
	jal	equality_test
label13:
	lw	$t1 12($a0)
	beqz	$t1 label14
	la	$a0 int_const1
	b	label15
label14:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const3
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label16
	jal	equality_test
label16:
	lw	$t1 12($a0)
	beqz	$t1 label17
	la	$a0 int_const2
	b	label18
label17:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const4
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label19
	jal	equality_test
label19:
	lw	$t1 12($a0)
	beqz	$t1 label20
	la	$a0 int_const3
	b	label21
label20:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const5
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label22
	jal	equality_test
label22:
	lw	$t1 12($a0)
	beqz	$t1 label23
	la	$a0 int_const4
	b	label24
label23:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const6
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label25
	jal	equality_test
label25:
	lw	$t1 12($a0)
	beqz	$t1 label26
	la	$a0 int_const5
	b	label27
label26:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const7
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label28
	jal	equality_test
label28:
	lw	$t1 12($a0)
	beqz	$t1 label29
	la	$a0 int_const6
	b	label30
label29:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const8
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label31
	jal	equality_test
label31:
	lw	$t1 12($a0)
	beqz	$t1 label32
	la	$a0 int_const7
	b	label33
label32:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const9
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label34
	jal	equality_test
label34:
	lw	$t1 12($a0)
	beqz	$t1 label35
	la	$a0 int_const8
	b	label36
label35:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const10
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label37
	jal	equality_test
label37:
	lw	$t1 12($a0)
	beqz	$t1 label38
	la	$a0 int_const9
	b	label39
label38:
	move	$a0 $s0
	bne	$a0 $zero label40
	la	$a0 str_const0
	li	$t1 26
	jal	_dispatch_abort
label40:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr		$t1
	la	$a0 int_const0
label39:
label36:
label33:
label30:
label27:
label24:
label21:
label18:
label15:
label12:
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
	beq	$t1 $t2 label41
	jal	equality_test
label41:
	lw	$t1 12($a0)
	beqz	$t1 label42
	la	$a0 str_const1
	b	label43
label42:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label44
	jal	equality_test
label44:
	lw	$t1 12($a0)
	beqz	$t1 label45
	la	$a0 str_const2
	b	label46
label45:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const2
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label47
	jal	equality_test
label47:
	lw	$t1 12($a0)
	beqz	$t1 label48
	la	$a0 str_const3
	b	label49
label48:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label50
	jal	equality_test
label50:
	lw	$t1 12($a0)
	beqz	$t1 label51
	la	$a0 str_const4
	b	label52
label51:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const4
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label53
	jal	equality_test
label53:
	lw	$t1 12($a0)
	beqz	$t1 label54
	la	$a0 str_const5
	b	label55
label54:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const5
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label56
	jal	equality_test
label56:
	lw	$t1 12($a0)
	beqz	$t1 label57
	la	$a0 str_const6
	b	label58
label57:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const6
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label59
	jal	equality_test
label59:
	lw	$t1 12($a0)
	beqz	$t1 label60
	la	$a0 str_const7
	b	label61
label60:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const7
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label62
	jal	equality_test
label62:
	lw	$t1 12($a0)
	beqz	$t1 label63
	la	$a0 str_const8
	b	label64
label63:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const8
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label65
	jal	equality_test
label65:
	lw	$t1 12($a0)
	beqz	$t1 label66
	la	$a0 str_const9
	b	label67
label66:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const9
	lw	$t1 4($sp)
	addiu	$sp $sp 4
	move	$t2 $a0
	la	$a0 bool_const1
	la	$a1 bool_const0
	beq	$t1 $t2 label68
	jal	equality_test
label68:
	lw	$t1 12($a0)
	beqz	$t1 label69
	la	$a0 str_const10
	b	label70
label69:
	move	$a0 $s0
	bne	$a0 $zero label71
	la	$a0 str_const0
	li	$t1 44
	jal	_dispatch_abort
label71:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr		$t1
	la	$a0 str_const11
label70:
label67:
label64:
label61:
label58:
label55:
label52:
label49:
label46:
label43:
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
	bne	$a0 $zero label72
	la	$a0 str_const0
	li	$t1 57
	jal	_dispatch_abort
label72:
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
	beq	$t1 $t2 label73
	jal	equality_test
label73:
	lw	$t1 12($a0)
	beqz	$t1 label74
	la	$a0 int_const0
	b	label75
label74:
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label76
	la	$a0 str_const0
	li	$t1 58
	jal	_dispatch_abort
label76:
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
	beq	$t1 $t2 label77
	jal	equality_test
label77:
	lw	$t1 12($a0)
	beqz	$t1 label78
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label80
	la	$a0 str_const0
	li	$t1 58
	jal	_dispatch_abort
label80:
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
	bne	$a0 $zero label81
	la	$a0 str_const0
	li	$t1 58
	jal	_dispatch_abort
label81:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label82
	la	$a0 str_const0
	li	$t1 58
	jal	_dispatch_abort
label82:
	lw	$t1 8($a0)
	lw	$t1 24($t1)
	jalr		$t1
	jal	Object.copy
	lw	$t1 12($a0)
	neg	$t1 $t1
	sw	$t1 12($a0)
	b	label79
label78:
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label83
	la	$a0 str_const0
	li	$t1 59
	jal	_dispatch_abort
label83:
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
	beq	$t1 $t2 label84
	jal	equality_test
label84:
	lw	$t1 12($a0)
	beqz	$t1 label85
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label87
	la	$a0 str_const0
	li	$t1 59
	jal	_dispatch_abort
label87:
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
	bne	$a0 $zero label88
	la	$a0 str_const0
	li	$t1 59
	jal	_dispatch_abort
label88:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label89
	la	$a0 str_const0
	li	$t1 59
	jal	_dispatch_abort
label89:
	lw	$t1 8($a0)
	lw	$t1 24($t1)
	jalr		$t1
	b	label86
label85:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label90
	la	$a0 str_const0
	li	$t1 60
	jal	_dispatch_abort
label90:
	lw	$t1 8($a0)
	lw	$t1 24($t1)
	jalr		$t1
label86:
label79:
label75:
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
	bne	$a0 $zero label91
	la	$a0 str_const0
	li	$t1 71
	jal	_dispatch_abort
label91:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
label92:
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
	blt	$t1 $t2 label94
	la	$a0 bool_const0
label94:
	lw	$t1 12($a0)
	beqz	$t1 label93
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
	bne	$a0 $zero label95
	la	$a0 str_const0
	li	$t1 75
	jal	_dispatch_abort
label95:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label96
	la	$a0 str_const0
	li	$t1 75
	jal	_dispatch_abort
label96:
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
	b	label92
label93:
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
	beq	$t1 $t2 label97
	jal	equality_test
label97:
	lw	$t1 12($a0)
	beqz	$t1 label98
	la	$a0 str_const1
	b	label99
label98:
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
	blt	$t1 $t2 label100
	la	$a0 bool_const0
label100:
	lw	$t1 12($a0)
	beqz	$t1 label101
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label103
	la	$a0 str_const0
	li	$t1 92
	jal	_dispatch_abort
label103:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr		$t1
	b	label102
label101:
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
	bne	$a0 $zero label104
	la	$a0 str_const0
	li	$t1 93
	jal	_dispatch_abort
label104:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const12
	bne	$a0 $zero label105
	la	$a0 str_const0
	li	$t1 93
	jal	_dispatch_abort
label105:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
label102:
label99:
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
	beq	$t1 $t2 label106
	jal	equality_test
label106:
	lw	$t1 12($a0)
	beqz	$t1 label107
	la	$a0 str_const11
	b	label108
label107:
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
	bne	$a0 $zero label109
	la	$a0 str_const0
	li	$t1 103
	jal	_dispatch_abort
label109:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 -12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label110
	la	$a0 str_const0
	li	$t1 103
	jal	_dispatch_abort
label110:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr		$t1
	bne	$a0 $zero label111
	la	$a0 str_const0
	li	$t1 103
	jal	_dispatch_abort
label111:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	addiu	$sp $sp 4
label108:
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	

# end of generated code
