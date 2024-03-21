##### assign.1
    The following simple assembly program will display a welcome string. We use 
    printf function for this purpose.
        .data
        test: .asciiz "Hello World"
        .text
         li $v0, 4
         la $a0, test
         syscall
    Create a new project to implement the program 

##### assign.2
    Create a new project to print the sum of two register $s0 and $s1 according to 
    this format:
    “The sum of (s0) and (s1) is (result)”
