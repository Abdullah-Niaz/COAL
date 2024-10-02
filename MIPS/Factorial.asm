.data
    prompt:    .asciiz "Enter a number: "
    result_msg: .asciiz "The factorial is: "

.text
    .globl main
main:
    # Prompt for the number
    li    $v0, 4               # Load syscall for print string
    la    $a0, prompt           # Load address of prompt
    syscall                     # Print the prompt

    # Read the number
    li    $v0, 5               # Load syscall for reading an integer
    syscall                     # Read the input into $v0
    move  $t0, $v0              # Store the number in $t0

    # Initialize factorial calculation
    li    $t1, 1               # Initialize factorial result in $t1
    li    $t2, 1               # Initialize counter in $t2

factorial_loop:
    blez  $t0, end_loop         # If $t0 <= 0, exit loop
    mul   $t1, $t1, $t2         # Multiply factorial result by counter
    addi  $t2, $t2, 1           # Increment counter
    bgt   $t2, $t0, end_loop    # If counter > number, exit loop
    j     factorial_loop        # Repeat loop

end_loop:
    # Print the result message
    li    $v0, 4               # Load syscall for print string
    la    $a0, result_msg       # Load address of result_msg
    syscall                     # Print the message

    # Print the factorial result
    move  $a0, $t1              # Move the result into $a0 for printing
    li    $v0, 1               # Load syscall for print integer
    syscall                     # Print the result

    # Exit the program
    li    $v0, 10              # Load syscall for program exit
    syscall
