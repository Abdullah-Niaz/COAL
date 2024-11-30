
.data
	prompt:        .asciiz "Enter a positive integer (negative to quit): "
	output_min:    .asciiz "\nMinimum: "
	output_max:    .asciiz "\nMaximum: "
	output_avg:    .asciiz "\nAverage: "
	output_cnt:    .asciiz "\nCount: "
	no_input_msg:  .asciiz "No positive numbers entered!"

.text
	.globl main
	
main:
    # Initialize variables
    li $t0, 0      # Count of numbers entered
    li $t1, 2147483647  # Minimum (initialized to max int)
    li $t2, -2147483648 # Maximum (initialized to min int)
    li $t3, 0      # Sum of numbers

input_loop:
    # Prompt user for input
    li $v0, 4
    la $a0, prompt
    syscall

    # Read integer input
    li $v0, 5
    syscall
    move $t4, $v0  # Store input in $t4

    # Check if input is negative
    blt $t4, 0, exit

    # Increment count
    addi $t0, $t0, 1

    # Update sum
    add $t3, $t3, $t4

    # Update minimum
    bge $t4, $t1, check_max
    move $t1, $t4  # Update min if current number is smaller

check_max:
    # Update maximum
    ble $t4, $t2, input_loop
    move $t2, $t4  # Update max if current number is larger
    j input_loop

exit:
    # Check if count is zero (no input)
    beq $t0, $zero, no_input

    # Display count
    li $v0, 4
    la $a0, output_cnt
    syscall
    li $v0, 1
    move $a0, $t0
    syscall

    # Display minimum
    li $v0, 4
    la $a0, output_min
    syscall
    li $v0, 1
    move $a0, $t1
    syscall

    # Display maximum
    li $v0, 4
    la $a0, output_max
    syscall
    li $v0, 1
    move $a0, $t2
    syscall

    # Display average
    li $v0, 4
    la $a0, output_avg
    syscall
    div $t3, $t3, $t0  # Calculate average (sum / count)
    mflo $a0           # Move quotient to $a0
    li $v0, 1
    syscall
    j end_program

no_input:
    la $a0, no_input_msg
    syscall

end_program:
    # End program
    li $v0, 10
    syscall
