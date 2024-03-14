.data
	s1: .word 0x7FFFFFFF # initial value for $s1
	s2: .word 0x00000001 # initial value for $s2

.text
start:
	la $s1, s1 	# load address of s1 into $s1
	la $s2, s2 	# load address of s2 into $s2
	lw $s1, 0($s1) 	# load value at address s1 into $s1
	lw $s2, 0($s2) 	# load value at address s2 into $s2

	li $t0,0 		# No overflow is the default status
	addu $s3,$s1,$s2 	# s3 = s1 + s2
	xor $t1,$s1,$s2 	# Test if $s1 and $s2 have the same sign
	bltz $t1,EXIT 		# If not, exit
	slt $t2,$s3,$s1
	bltz $s1,NEGATIVE 	# Test if $s1 and $s2 are negative?
	beq $t2,$zero,EXIT 	# $s1 and $s2 are positive
 		# if $s3 > $s1 then the result is not overflow
	j OVERFLOW
NEGATIVE:
	bne $t2,$zero,EXIT 	# $s1 and $s2 are negative
 		# if $s3 < $s1 then the result is not overflow
OVERFLOW:
	li $t0,1 # the result is overflow
EXIT:
