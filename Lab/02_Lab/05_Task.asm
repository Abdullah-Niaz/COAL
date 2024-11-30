.data
    prompt1: .asciiz "Enter first integer: "
    prompt2: .asciiz "Enter second integer: "
    equal_msg: .asciiz "equal"
    not_equal_msg: .asciiz "not equal"

.text
main:
    # Ask for first integer
    li $v0, 4                  # syscall for print string
    la $a0, prompt1            # load address of prompt1
    syscall

    li $v0, 5                  # syscall for read integer
    syscall
    move $s0, $v0              # store first integer in $s0

    # Ask for second integer
    li $v0, 4                  # syscall for print string
    la $a0, prompt2            # load address of prompt2
    syscall

    li $v0, 5                  # syscall for read integer
    syscall
    move $s1, $v0              # store second integer in $s1

    # Compare the two integers
    beq $s0, $s1, equal        # if a == b, branch to equal

    # If not equal
    li $v0, 4                  # syscall for print string
    la $a0, not_equal_msg      # load address of not_equal_msg
    syscall
    j exit_program             # jump to exit

equal:
    # If equal
    li $v0, 4                  # syscall for print string
    la $a0, equal_msg          # load address of equal_msg
    syscall

exit_program:
    # Exit program
    li $v0, 10                 # syscall for exit
    syscall
