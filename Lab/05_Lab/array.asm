.data
    # Declare the array X
    X:  .word 5, 7, 3, 8, 2, 9, 0, 1, 6, 1  # Length is 10
    n:  .word 10  # Length of array X
    
.text
    .globl main
main:
    # Load the length of array X
    la   $t0, n          # Load address of n
    lw   $t1, 0($t0)     # Load the length of array (10)

    # Load the address of the array X
    la   $t2, X          # Load address of array X

    # Loop counter setup
    add  $t3, $t1, $zero # Set loop counter to n (10)

reverse_loop:
    # Check if counter is zero
    beq  $t3, $zero, done  # If counter reaches 0, exit the loop

    # Get the value from array X (starting from the last element)
    sub  $t4, $t3, 1      # Subtract 1 from counter to reverse the index
    sll  $t5, $t4, 2      # Multiply the index by 4 (word size)
    add  $t6, $t2, $t5    # Add the index offset to the base address of X
    lw   $t7, 0($t6)      # Load the value from X

    # Multiply the value by 2
    mul  $t8, $t7, 2      # $t8 = $t7 * 2

    # Print the result "2*<value>"
    li   $v0, 4           # Syscall for print string
    la   $a0, prompt      # Load the prompt string
    syscall

    li   $v0, 1           # Syscall for print integer
    move $a0, $t8         # Move the result to $a0 for printing
    syscall

    # Print the ' | ' separator
    li   $v0, 4           # Syscall for print string
    la   $a0, separator   # Load the separator string
    syscall

    # Decrement the counter and loop
    sub  $t3, $t3, 1      # Decrement the loop counter
    j    reverse_loop     # Jump back to the loop

done:
    # Exit the program
    li   $v0, 10          # Syscall for exit
    syscall

.data
prompt:      .asciiz "2*"
separator:   .asciiz " | "
