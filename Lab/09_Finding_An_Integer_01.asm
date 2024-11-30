.data
	array:  .word   5, 7, 3, 8, 2, 9, 0, 1, 6, 1   # Array elements
	length: .word   10                              # Length of the array
	target: .word   8                               # Target number to search for
	result: .word   -1                              # Result to store position or -1

.text
.globl main

main:
    # Load array base address and length
    la   $t0, array        # $t0 points to the start of the array
    lw   $t1, length       # $t1 contains the length of the array
    lw   $t2, target       # $t2 contains the target number

    # Initialize loop variables
    li   $t3, 0            # $t3 is the index (starts from 0)

loop:
    # Check if we've reached the end of the array
    beq  $t3, $t1, not_found

    # Load the current array element
    lw   $t4, 0($t0)

    # Compare current element with the target number
    beq  $t4, $t2, found

    # Move to the next element
    addi $t0, $t0, 4       # Increment pointer to next word
    addi $t3, $t3, 1       # Increment index
    j    loop

found:
    # Store the found index in result
    la   $t5, result
    sw   $t3, 0($t5)

    # Print the found index
    li   $v0, 1            # Syscall for print integer
    move $a0, $t3          # Move the index into $a0
    syscall
    j    exit

not_found:
    # Store -1 in result
    li   $t6, -1
    la   $t5, result
    sw   $t6, 0($t5)

    # Print -1
    li   $v0, 1            # Syscall for print integer
    move $a0, $t6          # Move -1 into $a0
    syscall

exit:
    # Exit the program
    li   $v0, 10           # Exit syscall
    syscall
