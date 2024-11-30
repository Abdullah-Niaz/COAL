.data
	str:    .asciiz "This is my string to search a character"   # Input string
	target: .byte   'm'                                        # Target character to search
	result: .word   -1                                         # Result to store position or -1

.text
.globl main

main:
    # Load the base address of the string and target character
    la   $t0, str         # $t0 points to the start of the string
    lb   $t2, target      # $t2 contains the target character

    # Initialize loop variables
    li   $t3, 0           # $t3 is the index (starts from 0)

loop:
    # Load the current character
    lb   $t4, 0($t0)      # Load the byte at address $t0 into $t4

    # Check if we reached the end of the string
    beq  $t4, $zero, not_found

    # Compare the current character with the target character
    beq  $t4, $t2, found

    # Move to the next character
    addi $t0, $t0, 1      # Increment pointer to next character
    addi $t3, $t3, 1      # Increment index
    j    loop

found:
    # Store the found index in result
    la   $t5, result
    sw   $t3, 0($t5)

    # Print the found index
    li   $v0, 1           # Syscall for print integer
    move $a0, $t3         # Move the index into $a0
    syscall
    j    exit

not_found:
    # Store -1 in result
    li   $t6, -1
    la   $t5, result
    sw   $t6, 0($t5)

    # Print -1
    li   $v0, 1           # Syscall for print integer
    move $a0, $t6         # Move -1 into $a0
    syscall

exit:
    # Exit the program
    li   $v0, 10          # Exit syscall
    syscall
