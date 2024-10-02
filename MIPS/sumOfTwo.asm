.data
    prompt1:    .asciiz "Enter the first number: "
    prompt2:    .asciiz "Enter the second number: "
    result_msg: .asciiz "The sum is: "

.text
    .globl main
main:
    # Prompt for first number
    li    $v0, 4               # Load syscall for print string
    la    $a0, prompt1          # Load address of prompt1
    syscall                     # Print the prompt

    # Read first number
    li    $v0, 5               # Load syscall for reading an integer
    syscall                     # Read the input into $v0
    move  $t0, $v0              # Store first number in $t0

    # Prompt for second number
    li    $v0, 4               # Load syscall for print string
    la    $a0, prompt2          # Load address of prompt2
    syscall                     # Print the prompt

    # Read second number
    li    $v0, 5               # Load syscall for reading an integer
    syscall                     # Read the input into $v0
    move  $t1, $v0              # Store second number in $t1

    # Add numbers
    add   $t2, $t0, $t1         # $t2 = $t0 + $t1

    # Print the result message
    li    $v0, 4               # Load syscall for print string
    la    $a0, result_msg       # Load address of result_msg
    syscall                     # Print the message

    # Print the sum
    move  $a0, $t2              # Move the sum into $a0 for printing
    li    $v0, 1               # Load syscall for print integer
    syscall                     # Print the sum

    # Exit the program
    li    $v0, 10              # Load syscall for program exit
    syscall
