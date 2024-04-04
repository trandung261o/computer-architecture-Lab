.text
main:	li	$t5, 1		#load test input
	li 	$t6, 2
	li 	$t7, 3
	jal 	max 		#call max procedure
	nop
	add 	$s0, $v0, $zero	#copy v0 in s0
	li	$v0, 10		#terminate
	syscall
endmain:
#----------------------------------------------------
#procedure max: find the largest of three intergers
#param[in] $a0 intergers
#param[in] $a1 intergers
#param[in] $a1 intergers
#return $v0 the largest value
#----------------------------------------------------

max:	add 	$v0, $t5, $zero 	#copy a0 in v0; largest so far
	sub	$t0, $t6, $v0 		#compute a1 - v0
	bltz	$t0, okay		#if a1-v0 < 0 then no change
	nop
	add 	$v0, $t6, $zero		#else a1 is largest thus far
okay: 	sub 	$t0, $t7, $v0		#compute a2 - v0
	bltz	$t0, done		#if a2-v0 < 0 then no change
	nop
	add	$v0, $t7, $zero		#else a2 is the largest overall
done:	jr 	$ra			#return to calling program
