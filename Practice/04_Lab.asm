.data
save: .word 5, 5, 5, 3, 5  # Example array for testing (change as needed)

.text
.globl main
main:
    li $s3, 0             # Initialize index to 0
    la $s6, save          # Base address of the array
    li $s5, 5             # Value to compare

loop:
    sll $t1, $s3, 2       # Multiply index by 4 (word size) for offset
    add $t1, $t1, $s6     # Add base address to offset
    lw $t0, 0($t1)        # Load value at current index
    bne $t0, $s5, exit_loop # Exit loop if value is not equal to $s5
    addi $s3, $s3, 1      # Increment index
    j loop                # Repeat loop

exit_loop:
    move $s6, $s3         # Store the final index in $s6
    li $v0, 10            # Exit syscall
    syscall
