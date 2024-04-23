.data
    prompt: .asciiz "nhap xau: "
    result_msg: .asciiz "differentSymbolsNaive(s) = "
    s: .space 20            # bộ nhớ cho chuỗi s
    a: .space 128           # bộ nhớ cho mảng a (128 bytes, đủ cho 128 ký tự ASCII)

.text
    # Chương trình main
    main:
        # In ra câu nhắc nhập chuỗi
        li $v0, 4               # syscall 4 (print_str)
        la $a0, prompt          # địa chỉ chuỗi prompt
        syscall

        # Đọc chuỗi vào bộ nhớ
        li $v0, 8               # syscall 8 (read_str)
        la $a0, s               # con trỏ đến chuỗi s
        li $a1, 20              # số ký tự tối đa cho phép nhập
        syscall

        # Thiết lập mảng a với giá trị ban đầu là 0
        li $t0, 128             # độ dài mảng a (128 bytes, đủ cho 128 ký tự ASCII)
        li $t1, 0               # lặp qua các phần tử của mảng a
        la $s0, a               # con trỏ đến mảng a

        init_a_loop:
            sb $zero, ($s0)     # gán giá trị 0 cho mỗi phần tử của mảng a (sử dụng byte để đánh dấu)
            addi $s0, $s0, 1    # di chuyển con trỏ đến phần tử tiếp theo
            addi $t1, $t1, 1    # tăng biến đếm lên 1
            blt $t1, $t0, init_a_loop

        # Đếm số ký tự khác nhau trong chuỗi
        li $t2, 0               # biến đếm số lượng ký tự khác nhau
        la $s1, s               # con trỏ đến chuỗi s

        loop:
            lb $t3, ($s1)       # đọc ký tự từ chuỗi s
            beq $t3, $zero, exit_loop  # nếu gặp ký tự NULL thì thoát vòng lặp

            # Kiểm tra nếu ký tự là xuống dòng '\n' thì bỏ qua
            beq $t3, 10, skip_character  # nếu là '\n', bỏ qua ký tự này

            sll $t4, $t3, 0     # tính địa chỉ của a[s[i]] (sử dụng giá trị ký tự luôn)
            add $t4, $t4, $s0   # t4 = &a[s[i]]
            lb $t5, ($t4)       # load giá trị tại a[s[i]]

            beq $t5, $zero, update_count  # nếu a[s[i]] == 0, đây là ký tự mới

            j continue_loop     # nếu không, tiếp tục vòng lặp

        update_count:
            # Đánh dấu ký tự này đã xuất hiện
            sb $t3, ($t4)       # a[s[i]] = s[i] (lưu giá trị ký tự thay vì 1)
            addi $t2, $t2, 1    # tăng biến đếm ký tự khác nhau lên 1
            j continue_loop     # tiếp tục vòng lặp

        skip_character:
            addi $s1, $s1, 1    # bỏ qua ký tự xuống dòng '\n'
            j loop              # tiếp tục vòng lặp

        continue_loop:
            addi $s1, $s1, 1    # di chuyển con trỏ đến ký tự tiếp theo
            j loop              # tiếp tục vòng lặp

        exit_loop:
            # In ra số lượng ký tự khác nhau
            li $v0, 4               # syscall 4 (print_str)
            la $a0, result_msg      # địa chỉ chuỗi result_msg
            syscall

            li $v0, 1               # syscall 1 (print_int)
            move $a0, $t2           # in giá trị của biến đếm
            syscall

        # Kết thúc chương trình
        li $v0, 10              # syscall 10 (exit)
        syscall

