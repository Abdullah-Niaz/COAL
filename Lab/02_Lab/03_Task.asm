.data
    prompt: .asciiz "Enter your name: "
    greeting: .asciiz "Hello "
    name_buffer: .space 100     # Space for user name input

.text
main:
    # Ask for user's name
    li $v0, 4                  # syscall for print string
    la $a0, prompt             # load address of prompt
    syscall

    li $v0, 8                  # syscall for read string
    la $a0, name_buffer        # load address of buffer
    li $a1, 100                # max string length
    syscall

    # Print "Hello "
    li $v0, 4                  # syscall for print string
    la $a0, greeting           # load address of greeting
    syscall

    # Print the user's name
    li $v0, 4                  # syscall for print string
    la $a0, name_buffer        # load address of the name
    syscall

    # Exit program
    li $v0, 10                 # syscall for exit
    syscall
