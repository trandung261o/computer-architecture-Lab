.data 	#vung du lieu, chua cac khai bao bien
x: .word	0x01020304	#bien x, khoi tao gia tri
message: .asciiz	"Hello world!" 

.text 	#vung lenh, chua cac lenh hop ngu
la	$a0, message	#dua dia chi bien message vao thanh ghi a0
li	$v0, 4		#gan thanh ghi v0 = 4
syscall			#goi ham so v0, ham so 4, la ham print

addi $t1, $zero, 2	#thanh ghi $t1 = 2
addi $t2, $zero, 3	#thanh ghi $t2 = 3
add  $t0, $t1, $t2	#thanh ghi t0 = t1 + t2
