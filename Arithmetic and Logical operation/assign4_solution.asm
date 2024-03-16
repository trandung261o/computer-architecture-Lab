.text
start:
	li $s0, 0x7FFFFFFF 	
	li $s1, 0x00000001 	

	li 	$t0,0 		#ko tran so la trang thai mac dinh
	addu 	$s2,$s0,$s1 	# s2 = s0 + s1
	xor 	$t1,$s0,$s1 	#kiem tra xem $s0 và $s1 co cung dau khong
	bltz 	$t1,EXIT 		#neu khong, thoat
	xor 	$t2,$s2,$s0 	#kiem tra xem $s2 và $s0 co cung dau khong
	bgez 	$t2,EXIT 		#neu co, thoat
	li 	$t0,1 		#ke qua la tran so
EXIT:
