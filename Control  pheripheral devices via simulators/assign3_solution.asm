.eqv HEADING 0xffff8010
.eqv MOVING 0xffff8050
.eqv LEAVETRACK 0xffff8020
.eqv WHEREX 0xffff8030
.eqv WHEREY 0xffff8040

.text 
main: 	
	#bat dau di trong 5s
	li $at, HEADING
	li $k0, 120
	sb $k0, ($at)
	jal GO
	
	li $v0, 32
	li $a0, 5000
	syscall
	
	#ve canh 1
	li $a0, 180
	jal ROTATE
 
	jal TRACK
	
	li $v0, 32
	li $a0, 5000
	syscall
	
	jal UNTRACK
	
	#ve canh 2	
	li $a0, 60
	jal ROTATE
	
	jal TRACK
	
	li $v0, 32
	li $a0, 5000
	syscall
	
	jal UNTRACK	
	
	#ve canh 3
	li $a0, -60
	jal ROTATE
	
	jal TRACK
	
	li $v0, 32
	li $a0, 5000
	syscall
	
	jal UNTRACK
	
	#redraw the triangle
	li $a0, 180
	jal ROTATE
	jal TRACK
	li $v0, 32
	li $a0, 5000
	syscall
	jal UNTRACK
	li $a0, 60
	jal ROTATE
	jal TRACK
	li $v0, 32
	li $a0, 5000
	syscall
	jal UNTRACK	
	li $a0, -60
	jal ROTATE
	jal TRACK
	li $v0, 32
	li $a0, 5000
	syscall
	jal UNTRACK
	
	
	li $v0, 32
	li $a0, 3000
	syscall
	
	jal STOP
	
end_main:
	#exit
	li $v0, 10
	syscall
	
GO:	li $at, MOVING
	addi $k0, $zero, 1
	sb $k0, 0($at)
	jr $ra
	
STOP: 	li $at, MOVING
	sb $zero, 0($at)
	jr $ra

TRACK:	li $at, LEAVETRACK
	addi $k0, $zero, 1
	sb $k0, 0($at)
	jr $ra

UNTRACK:	li $at, LEAVETRACK
		sb $zero, 0($at)
		jr $ra

ROTATE:	li $at, HEADING
	sw $a0, 0($at)
	jr $ra
