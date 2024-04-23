.data
	string: .space 50
	a: .space 26
	output: .asciiz "differentSymbolsNaive(s) = "
.text

	#nhap xau 
	li $v0, 8
	la $a0, string
	li $a1, 50
	syscall
	
	#dem so ki tu khac nhau
	la $t1, string #$t1 tro den chuoi string
	loop: 
		lb $t2, ($t1) #$t2 luu ki tu hien tai
		beq $t2, $0, exit_loop #thoat neu ki tu hien tai la NULL
		addi $t4, $t2, -97 #tinh chi so trong mang a
		lb $t3, a($t4) #$t3 luu gia tri cua mang tai chi si ki tu hien tai
		#neu ki tu gap lan dau, bien dem +1, danh dau da gap
		bne $t3, $0, continue_loop
		addi $t5, $t5, 1
		addi $t3, $0, 1
		sb $t3, a($t4)
		j continue_loop
		
	continue_loop:
		addi $t1, $t1, 1
		j loop
	
	exit_loop:
		li $v0, 4
		la $a0, output
		syscall
		
		addi $t5, $t5, -1 #tru di ki tu xuong dong '\n'
		
		li $v0, 1
		move $a0, $t5
		syscall
		
		
		
		
		
		
		
		
		
		
