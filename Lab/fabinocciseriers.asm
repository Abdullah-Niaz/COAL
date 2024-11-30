.data
n:          .word 10                  
result:    .space 4              
msg: .asciiz "Fibonacci: "
 .text
 .globl main

main:
    lw $a0, n                
    jal fibonacci
    sw $v0, result

    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 1
    lw $a0, result
    syscall

    li $v0, 10


fibonacci:
    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $a0, 0($sp)

    beq $a0, $zero, fib_zero

    li $t0, 1
    beq $a0, $t0, fib_one

    addi $a0, $a0, -1
    jal fibonacci
    move $t0, $v0

    lw $a0, 0($sp)
    addi $a0, $a0, -2
    jal fibonacci

    add $v0, $t0, $v0
    j fib_end

fib_zero:
    li $v0, 0
    j fib_end

fib_one:
    li $v0, 1

fib_end:
    lw $ra, 4($sp)
    lw $a0, 0($sp)
    addi $sp, $sp, 8
    jr $ra
