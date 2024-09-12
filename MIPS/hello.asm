.data
hello:      .asciiz "Hello, World!"

.text
main:
    # Print "Hello, World!"
    li $v0, 4           # Load system call code for print_str into $v0
    la $a0, hello       # Load address of string into $a0
    syscall             # Make system call

    # Exit program
    li $v0, 10          # Load system call code for exit into $v0
    syscall             # Make system call
