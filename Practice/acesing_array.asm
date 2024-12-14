.data
A: .word 2, 3, 4, 5   # Array A
b: .word 5            # Variable b

.text
main:
    lw $s3, A         # Load base address of array A into $s3
    lw $s1, b         # Load the value of b into $s1
    li $t0, 1         # Index i (load immediate value 1 into $t0)

    # Compute c = A[i] - b
    # Step 1: Calculate address of A[i]
    sll $t0, $t0, 2   # $t0 = i * 4 (Shift left logical by 2 to get byte offset)
    # add $t0, $t0, $t0 # $t0 = 1 + 1
    # add $t0, $t0, $t0 # $t0 = 2 + 2 (byte offset for word access)
    add $t0, $t0, $s3 # $t0 = base address of A + offset (address of A[i])

    # Step 2: Load A[i] into $t1
    lw $t1, 0($t0)    # Load the value at address $t0 into $t1

    # Step 3: Compute c = A[i] - b
    sub $s2, $t1, $s1 # $s2 = A[i] - b

    # Exit program
    li $v0, 10        # Exit system call
    syscall
