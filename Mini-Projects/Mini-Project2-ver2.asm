.data
	string: .space 50 #mang ki tu 50 phan tu
	a: .space 26 #mang danh dau
	output: .asciiz "differentSymbolsNaive(s) = "
	error: .asciiz "gia tri nhap vao chua dung!"
.text
	#nhap xau 
	li $v0, 8
	la $a0, string
	li $a1, 50
	syscall
	
	
	
	#han che loi nhap tu nguoi dung (neu nhap gia tri khong phai chu cai a-z)
	la $t1, string #$t1 tro danh chuoi string
	loop2:
		lb $t2, ($t1) #$t2 luu tri ki tu hien tai
		beq $t2, 10, exit_loop2 #neu $t2 la ki tu '\n', thoat vong lap 
		
		#neu khong phai chu cai thuoc a-z, ket thuc chuong trinh
		slti $t3, $t2, 97 
		bne $t3, $0, exit_program2
		sgt $t3, $t2, 122
		bne $t3, $0, exit_program2
		
		#tiep tuc chuong trinh
		addi $t1, $t1, 1
		j loop2
	exit_loop2: 
	
	
	
	
	#dem so ki tu khac nhau
	la $t1, string #$t1 tro den chuoi string
	loop: 
		lb $t2, ($t1) #$t2 luu ki tu hien tai
		beq $t2, $0, exit_loop #thoat neu ki tu hien tai la NULL
		
		#kiem tra xem ki tu hien tai da duoc danh dau chua?
		addi $t4, $t2, -97 #tim` chi so cua ki tu trong mang a, luu vao $t4
		lb $t3, a($t4) #$t3 lay gia tri cua mang tai chi so ki tu hien tai
		
		bne $t3, $0, continue_loop #neu ki tu gap lan dau, bien dem +1, danh dau da gap. nguoc lai, tiep tuc vong lap
		addi $t5, $t5, 1 	#tang bien dem $t5, $t5 chua so luong ki tu khac nhau
		addi $t3, $0, 1	 	#gan gia tri bien $t3 bang 1
		sb $t3, a($t4)	 	#danh dau da gap ki tu hien tai
		j continue_loop #tiep tuc vong lap
		
	continue_loop: 
		addi $t1, $t1, 1 #tro den ki tu tiep theo cua chuoi
		j loop
	
	exit_loop:
		#hien thi: "differentSymbolsNaive(s) = "
		li $v0, 4
		la $a0, output
		syscall
		
		addi $t5, $t5, -1 #tru di ki tu xuong dong '\n'
		
		#hien thi so luong ki tu khac nhau
		li $v0, 1
		move $a0, $t5
		syscall
		
		#ket thuc chuong trinh
		li $v0, 10
		syscall
		
	exit_program2: #ket thuc trong truong hop neu co loi nhap lieu
		li $v0, 4
		la $a0, error
		syscall
		
		li $v0, 10
		syscall
		
		
		
		
		
		
