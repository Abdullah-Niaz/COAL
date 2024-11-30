# Task 2: Compute x^n using loops
# Inputs: x (base) and n (exponent)
# Output: x^n

.data
	prompt_x:      .asciiz "Enter the base (x): "
	prompt_n:      .asciiz "Enter the exponent (n): "
	output_result: .asciiz "Result (x^n): "

.text
.globl main

main:
    # Prompt user for base (x)
    li $v0, 4
    la $a0, prompt_x
    syscall

    # Read integer input for x
    li $v0, 5
    syscall
    move $t0, $v0  # $t0 = x (base)

    # Prompt user for exponent (n)
    li $v0, 4
    la $a0, prompt_n
    syscall

    # Read integer input for n
    li $v0, 5
    syscall
    move $t1, $v0  # $t1 = n (exponent)

    # Initialize result
    li $t2, 1      # $t2 = result, initially 1

    # Handle edge case: if n == 0, x^n = 1
    beq $t1, $zero, display_result

compute_power:
    # Multiply result by x
    mul $t2, $t2, $t0  # result *= x

    # Decrement n
    subi $t1, $t1, 1

    # Repeat loop until n == 0
    bne $t1, $zero, compute_power

display_result:
    # Display result label
    li $v0, 4
    la $a0, output_result
    syscall

    # Display result value
    li $v0, 1
    move $a0, $t2
    syscall

    # Exit program
    li $v0, 10
    syscall
