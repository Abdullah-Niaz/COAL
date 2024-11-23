    .data 
str: 
    .space 10       # Reserve 10 bytes in memory for the string

    .text 
    .globl main

main:
    la $a0, str      # Load the address of 'str' into $a0
    li $a1, 10       # Load the maximum string length (10 bytes) into $a1
    li $v0, 8        # Syscall code for reading a string
    syscall          # System call to read the string

    li $v0, 4        # Syscall code for printing a string
    la $a0, str      # Load the address of 'str' into $a0
    syscall          # System call to print the string

    li $v0, 10       # Syscall code for exiting the program
    syscall          # Exit the program
