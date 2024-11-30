.data
    prompt_a: .asciiz "Enter value for a: "
    prompt_b: .asciiz "Enter value for b: "
    prompt_c: .asciiz "Enter value for c: "
    result_msg: .asciiz "The result is: "

.text
main:
    # Ask for a
    li $v0, 4                  # syscall for print string
    la $a0, prompt_a           # load address of prompt_a
    syscall

    li $v0, 5                  # syscall for read integer
    syscall
    move $s0, $v0              # store value of a in $s0

    # Ask for b
    li $v0, 4                  # syscall for print string
    la $a0, prompt_b           # load address of prompt_b
    syscall

    li $v0, 5                  # syscall for read integer
    syscall
    move $s1, $v0              # store value of b in $s1

    # Ask for c
    li $v0, 4                  # syscall for print string
    la $a0, prompt_c           # load address of prompt_c
    syscall

    li $v0, 5                  # syscall for read integer
    syscall
    move $s2, $v0              # store value of c in $s2

    # Compute s = (a + b) - (c + 101)
    add $t0, $s0, $s1          # t0 = a + b
    addi $t1, $s2, 101         # t1 = c + 101
    sub $s3, $t0, $t1          # s3 = (a + b) - (c + 101)

    # Print the result
    li $v0, 4                  # syscall for print string
    la $a0, result_msg         # load address of result_msg
    syscall

    li $v0, 1                  # syscall for print integer
    move $a0, $s3              # move result to $a0
    syscall

    # Exit program
    li $v0, 10                 # syscall for exit
    syscall
