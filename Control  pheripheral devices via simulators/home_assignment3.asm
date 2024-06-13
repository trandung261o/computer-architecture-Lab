.eqv HEADING 0xffff8010 #địa chỉ lưu trữ giá trị góc di chuyển
.eqv MOVING 0xffff8050 #giá trị boolean 1/0 (di chuyển/dừng)
.eqv LEAVETRACK 0xffff8020 #1/0 (để lại vết/ko để lại vết)
.eqv WHEREX 0xffff8030 #tọa độ x hiện tại
.eqv WHEREY 0xffff8040 #tọa độ y hiện tại

.text 
main:
 jal TRACK #bắt đầu vẽ dấu vết
 addi $a0, $zero, 90 #đặt góc xoay là 90 (sang phải)
 jal ROTATE #xoay
 jal GO #chạy
 
sleep1: 
 addi $v0, $zero, 32 #cho BOT chạy trong chế độ ngủ
 li $a0, 1000 #chạy trong 1000ms hay 1s
 syscall
 
 jal UNTRACK #BOT chạy xong 1s rồi thì ngừng lưu vết cũ
 jal TRACK #bắt đầu lưu vết mới
 
goDOWN: #quay xuống
 addi $a0, $zero, 180
 jal ROTATE
 
sleep2:
 addi $v0, $zero, 32 #tiếp tục chặng mới trong chế độ ngủ
 li $a0, 2000 #đi chặng mới trong 2s
 syscall
 
 jal UNTRACK #sau 2s, lưu và thoát vết cũ
 jal TRACK #bắt đầu vết mới
 
goLEFT: #quay sang trái bắt đầu chặng mới
 addi $a0, $zero, 270 
 jal ROTATE
 
sleep3:
 addi $a0, $zero, 32
 li $a0, 1000 #đi chặng mới trong 1s
 syscall
 
 jal UNTRACK #hết chặng lưu và thoát vết cũ
 jal TRACK #bắt đầu lưu chặng mới
 
goASKEW:
 addi $a0, $zero, 120 #đi chặng mới với góc quay là 120
 jal ROTATE

sleep4:
 addi $v0, $zero, 32
 li $a0, 2000 #đi chặng mới trong 2s
 syscall
 
 jal UNTRACK #sau 2s lưu và thoát vết cũ
 jal TRACK #lưu vết mới
endmain:

GO: #bắt đầu di chuyển
 li $at, MOVING
 addi $k0, $zero, 1
 sb $k0, 0($at)
 jr $ra
 
STOP: #dừng di chuyển
 li $at, MOVING
 sb $zero, 0($at)
 jr $ra
 
TRACK: #bắt đầu vẽ dấu vết
 li $at, LEAVETRACK
 addi $k0, $zero, 1
 sb $k0, 0($at)
 jr $ra
 
UNTRACK: #dừng vẽ dấu vết
 li $at, LEAVETRACK
 sb $zero, 0($at)
 jr $ra
 
ROTATE: #xoay theo góc bằng với giá trị được gán trong $a0
 li $at, HEADING
 sw $a0, 0($at)
 jr $ra 
 
