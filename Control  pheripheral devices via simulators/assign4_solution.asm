.eqv KEY_CODE 0xFFFF0004
.eqv KEY_READY 0xFFFF0000

.eqv DISPLAY_CODE 0xFFFF000C
.eqv DISPLAY_READY 0xFFFF0008

.text
	li $k0, KEY_CODE
	li $k1, KEY_READY
	
	li $s0, DISPLAY_CODE
	li $s1, DISPLAY_READY
	
loop:	nop

WaitForKey:	lw $t1, 0($k1)
		beq $t1, $0, WaitForKey
		
ReadKey:	lw $t0, 0($k0)

WaitForDis:	lw $t2, 0($s1)
		beq $t2, $0, WaitForDis

KiemTraE: 
	beq $t3, 1, KiemTraX 
	beq $t0, 101, Co 
KiemTraX: 
	beq $t3, 2, KiemTraI 
	beq $t0, 120, Co 
KiemTraI: 
	beq $t3, 3, KiemTraT 
	beq $t0, 105, Co 
KiemTraT: 
	beq $t3, 4, Encrypt
	beq $t0, 116, Co

Reset:	addi $t3, $0, 0						
																		
Encrypt:	addi $t0, $t0, 1

ShowKey:	sw $t0, 0($s0)
		beq $t3, 4, Exit 
		j loop
		
Co:	addi $t3, $t3, 1 
	j Encrypt

Exit: 	li $v0, 10 
	syscall 
