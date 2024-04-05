.data 	#vùng dữ liệu, chứa các khai báo biến
x: .word	0x01020304	#biến x, khởi tạo giá trị 0x01020304
message: .asciiz	"Hello world!" #biến message, khởi tạo giá trị "Hello world!"

.text 	#vùng lệnh, chứa các lệnh hợp ngữ
la	$a0, message	#đưa địa chỉ của biến message vào thanh ghi $a0
li	$v0, 4		#gán thanh ghi v0 = 4
syscall			#gọi hàm số v0, hàm số 4, là hàm print

addi $t1, $zero, 2	#thanh ghi $t1 = 2
addi $t2, $zero, 3	#thanh ghi $t2 = 3
add  $t0, $t1, $t2	#thanh ghi t0 = t1 + t2
