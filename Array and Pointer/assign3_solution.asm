.data 
	A: .word 7 -2 5 1 5 6 7 3 6 8 8 59 5
	Aend: .word 
.text 
	la $a0, A 
	la $a1, Aend 
	li $s0, 0 # count = 0 (count la bien dem phan tu) 
	li $s1, -1 # i = -1 (i trong loopi) 
DemPhanTu: 
	beq $a1, $a0, Size # So sanh dia chi hien tai trong a1 
		#voi dia chi co so cua mang A 
	addi $a1, $a1, -4 # dia chi a1 giam de den tung dia chi 
		#cua tung phan tu trong mang 
	addi $s0, $s0, 1 # So luong phan tu tang thêm 1 
	j DemPhanTu 
Size: 
	addi $t0, $s0, -1 # t0 = So luong phan tu cua mang A - 1 
loop1: 
	addi $s1, $s1, 1 # i++ 
	li $s2, 0 # j = 0 (j trong loop 2) 
	beq $s1, $t0, Exit # Neu i = size - 1 thì thoat 
loop2: 
	sub $t2, $t0, $s1 # t2 = (size - 1) - i 
	beq $s2, $t2, loop1 # Neu j = (size - 1) - i thi nhay den loop1 
if_swap: 
	sll $t3, $s2, 2 # Tính offset cua dia chi A[j] 
	add $s3, $a0, $t3 # Tính dia chi A[j] 
	lw $v0, 0($s3) # Load giá tri A[j] 
	addi $s3, $s3, 4 # Tính dia chi cua A[j+1] 
	lw $v1, 0($s3) # Load giá tri A[j+1] 
	sle $t4, $v0, $v1 # Neu A[j] <= A[j+1] thì t4 = 1; 
		# A[j] > A[j+1] thì t4 = 0 
	beq $t4, $zero, swap # t4 = 0 thì nhay den swap 
	addi $s2, $s2, 1 # j++ 
	j loop2 
swap: 
	sw $v0, 0($s3) # Ghi A[j] vào A[j+1] 
	addi $s3, $s3, -4 # Tính dia chi cua A[j] = dia chi cua A[j+1] - 4 
	sw $v1, 0($s3) # Ghi A[j+1] vào A[j] 
	addi $s2, $s2, 1 # j++ 
	j loop2 
Exit: 
	li $v0, 10 
	syscall
