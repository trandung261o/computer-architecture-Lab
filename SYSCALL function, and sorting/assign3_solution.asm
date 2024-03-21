.data
x: .space 32 		# chuoi dich x, empty
y: .asciiz "Hello" 	# chuoi nguon y
.text
main:
    	la $a0, x 		# load dia chi cua x vao $a0
    	la $a1, y 		# load dia chi cua y vao $a1
    	jal strcpy 		# goi ham strcpy


strcpy:
	add $s0,$zero,$zero 		# $s0 = i = 0
L1:
	add $t1,$s0,$a1 		# $t1 = $s0 + $a1 = i + y[0]
 					# = dia chi cua y[i]
	lb $t2,0($t1) 			# $t2 = gia tri tai $t1 = y[i]
	add $t3,$s0,$a0 		# $t3 = $s0 + $a0 = i + x[0] 
 					# = dia chi cua x[i]
	sb $t2,0($t3) 			# x[i]= $t2 = y[i]
	beq $t2,$zero,end_of_strcpy 	# if y[i] == 0, exit
	nop
	addi $s0,$s0,1 			# $s0 = $s0 + 1 <-> i = i + 1
	j L1 				# next character
	nop
end_of_strcpy:






