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
##### assign.3
    Procedure strcpy copies string y to string x using the null byte termination 
    convention of C. Read this example carefully, try to understand this code section.
<img width="286" alt="image" src="https://github.com/trandung261o/computer-architecture-Lab/assets/114976992/54b737de-6e4c-4203-b858-7e0ab2e0ca19">

    Create a new project to implement the program. Add 
    more instructions to assign a test string for y variable and implement strcpy
    function
##### assign.4
    The program count the length of a null-terminated string.
    Accomplish the assignment with syscall function to get a string from 
    dialog and show the length to message dialog
