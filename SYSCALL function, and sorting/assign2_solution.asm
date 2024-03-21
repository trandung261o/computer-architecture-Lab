.data
str1: .asciiz "The sum of "
str2: .asciiz " and "
str3: .asciiz " is "

.text
start: 
    # khoi tao gia tri cho $s0 = 5, $s1 = 10
    li $s0, 5
    li $s1, 10

    # tinh tong $s2 = $s0 + $s1
    add $s2, $s0, $s1

    # in "The sum of "
    li $v0, 4
    la $a0, str1
    syscall 

    # in $s0
    li $v0, 1
    move $a0, $s0
    syscall 

    # in " and "
    li $v0, 4
    la $a0, str2
    syscall 

    # in $s1
    li $v0, 1
    move $a0, $s1
    syscall 

    # in " is "
    li $v0, 4
    la $a0, str3
    syscall 

    # in ket qua ($s2)
    li $v0, 1
    move $a0, $s2
    syscall 

    # thoat chuong trinh
    li $v0, 10
    syscall 






