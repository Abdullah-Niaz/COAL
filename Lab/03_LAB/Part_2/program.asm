.data
# sample0.asm
c: .word 3        # Variable 'c' initialized to 3
k: .word 5        # Variable 'k' initialized to 5

.text
.globl main
main:
    la $t0, c           # Load the address of 'c' into $t0
    la $t1, k           # Load the address of 'k' into $t1
    lw $s0, 0($t0)      # Load the value of 'c' into $s0
    lw $s1, 0($t1)      # Load the value of 'k' into $s1
    slt $s3, $s0, $s1   # Set $s3 to 1 if $s0 < $s1, otherwise 0
    beq $s3, $0, notless # If $s3 is 0 (c >= k), jump to 'notless'

    # Swap values if $s0 < $s1
    sw $s0, 0($t1)      # Store the value of 'c' into 'k'
    sw $s1, 0($t0)      # Store the value of 'k' into 'c'

notless:
    addi $v0, $0, 5     # Just to perform a placeholder operation
    move $a0, $v0
    li $v0, 1           # Print integer syscall
    syscall
    li $v0, 10          # Exit syscall
    syscall
