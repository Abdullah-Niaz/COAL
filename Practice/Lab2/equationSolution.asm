.data
	prompt_a: .asciiz "Enter the Value of a: "
	prompt_b: .asciiz "Enter the Value of b: "
	prompt_c: .asciiz "Enter the Value of c: "
	result_msg: .asciiz "Result is: "

.text
	la $a0, prompt_a
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	
	la $a0, prompt_b
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	move $s1, $v0
	
			
	la $a0, prompt_c
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $s2, $v0
	
	add $t0 , $s0, $s1
	addi $t1, $s2, 101
	sub $s3, $t0, $t1
	
	la $a0, result_msg
	li $v0, 4
	syscall
	
	 move $a0, $s3
	 li $v0, 1
	 syscall
	 
	 li $v0, 10 
	 syscall