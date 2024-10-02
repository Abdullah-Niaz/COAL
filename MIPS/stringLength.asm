.data
    prompt:   .asciiz "Enter a string: "
    result_msg: .asciiz "The length of the string is: "
    user_input: .space 31        # Reserve space for the input string (30 characters + null terminator)

.text
    .globl main
main:
    # Print the prompt message
    li    $v0, 4               # Load syscall for print string
    la    $a0, prompt           # Load address of prompt
    syscall                     # Print the prompt

    # Read the string input
    la    $a0, user_input       # Load address of input buffer
    li    $a1, 31               # Set maximum length of input (30 characters + null terminator)
    li    $v0, 8               # Load syscall for reading a string
    syscall                     # Read the string input

    # Initialize length calculation
    la    $t0, user_input       # Load the starting address of the string into $t0
    li    $t1, 0               # Initialize the length counter in $t1

strlen_loop:
    lb    $t2, ($t0)            # Load the byte at current position into $t2
    beqz  $t2, strlen_done      # If it's the null terminator (end of string), exit loop
    addi  $t1, $t1, 1           # Increment the length counter
    addi  $t0, $t0, 1           # Move to the next character
    j     strlen_loop           # Repeat the loop

strlen_done:
    # Print the result message
    li    $v0, 4               # Load syscall for print string
    la    $a0, result_msg       # Load address of result_msg
    syscall                     # Print the message

    # Print the length of the string
    move  $a0, $t1              # Move the string length into $a0 for printing
    li    $v0, 1               # Load syscall for print integer
    syscall                     # Print the string length

    # Exit the program
    li    $v0, 10              # Load syscall for program exit
    syscall
