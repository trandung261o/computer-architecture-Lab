.eqv SEVENSEG_LEFT 0xFFFF0011
.eqv SEVENSEG_RIGHT 0xFFFF0010

.text 
main: 

	#in so ben phai tu 0->9->0
	#in 0
	li $a0, 0x3F
	jal SHOW_7SEG_RIGHT
	
	#in 1
	li $a0, 0x6
	jal SHOW_7SEG_RIGHT

	#in 2
	li $a0, 0x5B
	jal SHOW_7SEG_RIGHT
	
	#in 3
	li $a0, 0x4F
	jal SHOW_7SEG_RIGHT
	
	#in 4
	li $a0, 0x66
	jal SHOW_7SEG_RIGHT

	#in 5
	li $a0, 0x6D
	jal SHOW_7SEG_RIGHT

	#in 6
	li $a0, 0x7D
	jal SHOW_7SEG_RIGHT

	#in 7
	li $a0, 0x7
	jal SHOW_7SEG_RIGHT

	#in 8
	li $a0, 0x7F
	jal SHOW_7SEG_RIGHT

	#in 9
	li $a0, 0x6F
	jal SHOW_7SEG_RIGHT

	#in 8
	li $a0, 0x7F
	jal SHOW_7SEG_RIGHT
	
	#in 7
	li $a0, 0x7
	jal SHOW_7SEG_RIGHT
	
	#in 6
	li $a0, 0x7D
	jal SHOW_7SEG_RIGHT
	
	#in 5
	li $a0, 0x6D
	jal SHOW_7SEG_RIGHT
	
	#in 4
	li $a0, 0x66
	jal SHOW_7SEG_RIGHT
	
	#in 3
	li $a0, 0x4F
	jal SHOW_7SEG_RIGHT
	
	#in 2
	li $a0, 0x5B
	jal SHOW_7SEG_RIGHT
	
	#in 1
	li $a0, 0x6
	jal SHOW_7SEG_RIGHT
	
	#in 0
	li $a0, 0x3F
	jal SHOW_7SEG_RIGHT
	
exit:	li $v0, 10
	syscall
endmain:

SHOW_7SEG_LEFT:	li $t0, SEVENSEG_LEFT
		sb $a0, 0($t0)
		nop
		jr $ra
		nop

SHOW_7SEG_RIGHT: li $t0, SEVENSEG_RIGHT
		 sb $a0, 0($t0) 
		 nop
		 jr $ra
		 nop

	
