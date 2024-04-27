.data
	student1: .space 30 #chuoi ki tu 30 phan tu chua ten sv 1
	student2: .space 30 #chuoi ki tu 30 phan tu chua ten sv 2
	error: .asciiz "loi thao tac nhap lieu! gia tri chua dung!"
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
	
	
#----------------------han che loi nhap lieu ten SINH VIEN 1 tu nguoi dung----------------------------------
	la $t1, student1
	check1:
		lb $t2, ($t1) 
		beq $t2, '\n', exit_check1 #thoat neu $t2 la ki tu '\n'
		beq $t2, ' ', continue #tiep tuc vong lap neu $t2 la ki tu cach ' '
		
		#thoat chuong trinh neu ki tu ko hop le
		blt $t2, 'A', exit_program2
		bgt $t2, 'z', exit_program2

		blt $t2, 'a', check_upper
		bgt $t2, 'Z', check_lower
		
	check_upper: 
		bgt $t2, 'Z', exit_program2
		j continue
	
	check_lower:
		blt $t2, 'a', exit_program2
		j continue

	continue:
		addi $t1, $t1, 1
		j check1
	
	exit_check1:
	
	
	
#--------------han che loi nhap lieu ten SINH VIEN 2 tu nguoi dung-------------------------------------------
	la $t1, student2
	check2:
		lb $t2, ($t1) 
		beq $t2, '\n', exit_check2 #thoat neu $t2 la ki tu '\n'
		beq $t2, ' ', continue2 #tiep tuc vong lap neu $t2 la ki tu cach ' '
		
		#thoat chuong trinh neu ki tu ko hop le
		blt $t2, 'A', exit_program2
		bgt $t2, 'z', exit_program2

		blt $t2, 'a', check_upper2
		bgt $t2, 'Z', check_lower2
		
	check_upper2: 
		bgt $t2, 'Z', exit_program2
		j continue2
	
	check_lower2:
		blt $t2, 'a', exit_program2
		j continue2

	continue2:
		addi $t1, $t1, 1
		j check2
	
	exit_check2:
	
	
	
	
	
#---------------------------------------IN SINH VIEN 1-----------------------------------------------
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
		beq $t2, '\n' , exit_loop2 # neu ki tu hien tai la newline, ket thuc vong lap
	
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
	
	
	
	
# -------------------------------IN SINH VIEN 2--------------------------------------------------------
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
	
	#ket thuc chuong trinh neu chay binh thuong
	li $v0, 10
	syscall
	
	
#----------------------KET THUC CHUONG TRINH NEU CO LOI NHAP LIEU-----------------------------
	exit_program2:
		li $v0, 4
		la $a0, error
		syscall
	
		li $v0, 10
		syscall
