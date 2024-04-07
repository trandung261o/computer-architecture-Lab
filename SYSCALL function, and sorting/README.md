### Assignment 1:
The following simple assembly program will display a welcome string. We use 
printf function for this purpose.

    .data
    test: .asciiz "Hello World"
    .text
     li $v0, 4
     la $a0, test
     syscall
Create a new project to implement the program 
### Assignment 2:
Create a new project to print the sum of two register $s0 and $s1 according to 
this format:

“The sum of (s0) and (s1) is (result)”
### Assignment 3:
Procedure strcpy copies string y to string x using the null byte termination 
convention of C. 
Create a new project to implement the program. 
### Assignment 4:
The program count the length of a null-terminated string.
Accomplish the assignment with syscall function to get a string from 
dialog and show the length to message dialog
### Assignment 5:
Write a program that let user input a string by typing individual letters. Input 
process will be terminated when user press Enter or then length of the string 
exceed 20 characters. Print the reverse string.
