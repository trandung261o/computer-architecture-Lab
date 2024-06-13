.eqv KEY_CODE 0xFFFF0004 #receiver data: lưu mã ASCII từ bàn phím, 1 byte
.eqv KEY_READY 0xFFFF0000 #=1 nếu có mã phím mới, reset về 0 sau khi đọc dữ liệu từ receiver data bằng lệnh lw

.eqv DISPLAY_CODE 0xFFFF000C #mã ASCII để hiển thị, 1 byte
.eqv DISPLAY_READY 0xFFFF0008 #=1 nếu màn hình sẵn sàng hiển thị, reset về 0 sau khi ghi dữ liệu vào DISPLAY_CODE bằng lệnh sw

.text
#nạp các địa chỉ vào các thanh ghi
 li $k0, KEY_CODE
 li $k1, KEY_READY
 li $s0, DISPLAY_CODE
 li $s1, DISPLAY_READY
 
loop: #vòng lặp chính
 
 WaitForKey: #đợi phím nhấn 
  lw $t1, 0($k1) #nạp KEY_READY vào $t1
  beq $t1, $zero, WaitForKey #nếu $t1 bằng 0, tiếp tực kiểm tra
  
 ReadKey: #đọc mã phím
  lw $t0, 0($k0) #nạp KEY_CODE vào $t0
  
 WaitForDis: #đợi màn hình sãn sàng
  lw $t2, 0($s1) #nạp DISPLAY_READY vào $t2
  beq $t2, $zero, WaitForDis #nếu $t2 bằng 0, tiếp tực kiểm tra
  
 Encrypt: #mã hóa phím bằng cách tăng giá trị ASCII
  addi $t0, $t0, 1
  
 ShowKey: #hiển thị mã phím đã mã hóa trên màn hình
  sw $t0, 0($s0) #lưu mã ASCII mới vào DISPLAY_CODE
  
 j loop #quay lại vòng lặp chính
