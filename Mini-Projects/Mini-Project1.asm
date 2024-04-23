.data
	student1: .space 30
	student2: .space 30

.text



	#nhap ten sinh vien 1
	li $v0, 8
	la $a0, student1
	li $a1, 30
	syscall
	
	#nhap ten sinh vien 2
	li $v0, 8
	la $a0, student2
	li $a1, 30
	syscall
	
	
#---------------------------------------SINH VIEN 1-----------------------------------------------
	#tim vi tri khoang trang cuoi cung
	la $t1, student1 #$t1 tro den chuoi student1
	loop:
		lb $t2, ($t1) #luu ki tu hien tai vao $t2	
		beq $t2, $0, exit_loop #neu ki tu hien tai la NULL thi thoat vong lap
		bne $t2, ' ', continue_loop #neu $t2 la khoang trang , 
					    #luu dia chi $t1 vao $t3,
					    #khong thi tiep tuc vong lap
		la $t3, ($t1)
		addi $t1, $t1, 1 #t1 tro den ki tu ke tiep
		j loop	
	
	continue_loop:
		addi $t1, $t1, 1
		j loop
	
	exit_loop:
	
	#in ten sinh vien truoc
	la $t1, 1($t3) #$t1 tro den ten cua sinh vien 1
	loop2:
		lb $t2, ($t1) #$$t2 luu ki tu hien tai
		beq $t2, '\n' , exit_loop2 # neu ki tu hien tai la NULL, ket thuc vong lap
	
		#in ki tu hien tai
		li $v0, 11
		move $a0, $t2
		syscall
	
		#tiep tuc lap
		addi $t1, $t1, 1
		j loop2
		
	exit_loop2:
	
	#in dau cach
	li $v0, 11
	li $a0, 32
	syscall
	
	
	#in ho va ten dem sinh vien sau
	la $t1, student1 #$t1 tr? ??n chu?i student1
	loop1:
		lb $t2, ($t1) # luu ki tu hien tai vao $t2
		beq $t1, $t3, exit_loop1 # neu dia chi trong $t1 bang $t3 (khoang trang cuoi cung)
					 #thoat vong lap
		#in ki tu hien tai
		li $v0, 11
		move $a0, $t2
		syscall
		
		#tiep tuc lap
		addi $t1, $t1, 1
		j loop1		
	exit_loop1:
	
	#in dau xuong dong
	li $v0, 11
	li $a0, 10
	syscall
	
	
	
	
# -------------------------------SINH VIEN 2--------------------------------------------------------
#tim vi tri khoang trang cuoi cung
	la $t1, student2 #$t1 tro den chuoi student1
	loop3:
		lb $t2, ($t1) #luu ki tu hien tai vao $t2	
		beq $t2, $0, exit_loop3 #neu ki tu hien tai la NULL thi thoat vong lap
		bne $t2, ' ', continue_loop3 #neu $t2 la khoang trang , 
					    #luu dia chi $t1 vao $t3,
					    #khong thi tiep tuc vong lap
		la $t3, ($t1)
		addi $t1, $t1, 1 #t1 tro den ki tu ke tiep
		j loop3	
	
	continue_loop3:
		addi $t1, $t1, 1
		j loop3
	
	exit_loop3:
	
	#in ten sinh vien truoc
	la $t1, 1($t3) #$t1 tro den ten cua sinh vien 2
	loop4:
		lb $t2, ($t1) #$$t2 luu ki tu hien tai
		beq $t2, '\n' , exit_loop4 # neu ki tu hien tai la NULL, ket thuc vong lap
	
		#in ki tu hien tai
		li $v0, 11
		move $a0, $t2
		syscall
	
		#tiep tuc lap
		addi $t1, $t1, 1
		j loop4
		
	exit_loop4:
	
	#in dau cach
	li $v0, 11
	li $a0, 32
	syscall
	
	
	#in ho va ten dem sinh vien sau
	la $t1, student2 #$t1 tro den chuoi student2
	loop5:
		lb $t2, ($t1) # luu ki tu hien tai vao $t2
		beq $t1, $t3, exit_loop5 # neu dia chi trong $t1 bang $t3 (khoang trang cuoi cung)
					 #thoat vong lap
		#in ki tu hien tai
		li $v0, 11
		move $a0, $t2
		syscall
		
		#tiep tuc lap
		addi $t1, $t1, 1
		j loop5		
	exit_loop5:
	

