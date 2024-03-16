.text

main:
li $s0, 5 # gia tri khoi tao cho $s0

# Nhân $s0 voi 2 (tuong ung dich trai 1 bit)
sll $s1, $s0, 1 # $s1 = $s0 * 2

# Nhân $s0 voi 4 (tuong ung dich trai 2 bit)
sll $s2, $s0, 2 # $s2 = $s0 * 4

# Nhân $s0 voi 8 (tuong ung dich trai 3 bit)
sll $s3, $s0, 3 # $s3 = $s0 * 8

# Nhân $s0 voi 16 (tuong ung dich trai 4 bit)
sll $s4, $s0, 4 # $s4 = $s0 * 16

