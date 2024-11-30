.data
	array:      .word 3, 1, 5, 2, 4   # Array to be sorted
	size:       .word 5               # Size of the array
	space:    .asciiz " "          # For printing a new line

.text
.globl main

main:
    # Load base address and size of the array
    la $t0, array          # $t0 = base address of the array
    lw $t1, size           # $t1 = size of the array (n)

    # Outer loop: Iterate through the array
    move $t2, $zero        # $t2 = i (outer loop index, initialized to 0)

outer_loop:
    bge $t2, $t1, exit     # If i >= size, exit loop
    move $t3, $t2          # $t3 = min_index = i
    add $t4, $t2, 1        # $t4 = j = i + 1 (inner loop index)

    # Inner loop: Find the index of the minimum element
inner_loop:
    bge $t4, $t1, swap     # If j >= size, proceed to swap
    # Compare array[j] with array[min_index]
    sll $t5, $t3, 2        # $t5 = min_index * 4 (word size)
    add $t5, $t5, $t0      # $t5 = address of array[min_index]
    lw $t6, 0($t5)         # $t6 = array[min_index]

    sll $t7, $t4, 2        # $t7 = j * 4 (word size)
    add $t7, $t7, $t0      # $t7 = address of array[j]
    lw $t8, 0($t7)         # $t8 = array[j]

    blt $t8, $t6, update_min_index  # If array[j] < array[min_index]
    j inner_continue                # Otherwise, continue inner loop

update_min_index:
    move $t3, $t4          # min_index = j

inner_continue:
    addi $t4, $t4, 1       # j++
    j inner_loop

    # Swap array[i] with array[min_index]
swap:
    sll $t5, $t2, 2        # $t5 = i * 4 (word size)
    add $t5, $t5, $t0      # $t5 = address of array[i]
    lw $t6, 0($t5)         # $t6 = array[i]

    sll $t7, $t3, 2        # $t7 = min_index * 4 (word size)
    add $t7, $t7, $t0      # $t7 = address of array[min_index]
    lw $t8, 0($t7)         # $t8 = array[min_index]

    sw $t8, 0($t5)         # array[i] = array[min_index]
    sw $t6, 0($t7)         # array[min_index] = array[i]

    addi $t2, $t2, 1       # i++
    j outer_loop

exit:
    # Print sorted array
    la $a0, array          # Load base address of the array
    li $a1, 5              # Load size of the array
    jal print_array        # Call print_array function

    # Exit program
    li $v0, 10             # Exit syscall
    syscall

# Function: print_array
# Prints the elements of the array
print_array:
    move $t0, $a0          # Base address of the array
    move $t1, $a1          # Size of the array

print_loop:
    beqz $t1, print_done   # If size == 0, return
    lw $a0, 0($t0)         # Load current element
    li $v0, 1              # Print integer syscall
    syscall

    la $a0, space        # Print newline
    li $v0, 4              # Print string syscall
    syscall

    addi $t0, $t0, 4       # Move to the next element
    subi $t1, $t1, 1       # Decrement size
    j print_loop

print_done:
    jr $ra                 # Return to caller
