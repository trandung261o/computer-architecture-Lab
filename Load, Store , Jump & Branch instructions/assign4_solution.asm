.data 
	A: .word 3, -5, 8, -12, 6
.text
	la $s0, A 		# Load A to $s0
	addi $s1, $zero, 0 	# i = 0
	addi $s2, $zero, 0 	# Max = 0
	addi $s3, $zero, 5 	# n = 5
loop:
	slt $t2, $s1, $s3 		# $s2 = $s1 < $s3 ? 1 : 0
	beq $t2, $zero, endloop
	add $t1, $s1, $s1
	add $t1, $t1, $t1 		# $t1 = 4 * $s1
	add $t1, $t1, $s0
	lw $t0, 0($t1) 			# $t0 = A[i]
if_Left:
	slt $t2, $t0, $zero 		# $t2 = $t0 < $zero ? 1 : 0
	beq $t2, $zero, if_else
	sub $t0, $zero, $t0 		# $t0 = -$t0
	j if_else
if_else:
	slt $t2, $t0, $s2 	# $t2 = $t0 < $s2 ? 1 : 0
	bne $t2, $zero, next
	add $s2, $t0, $zero 	# max = A[i]
next:
	addi $s1, $s1, 1 	# i += 1
	j loop
endloop:
