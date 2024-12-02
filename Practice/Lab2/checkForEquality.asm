.data 
	prompt1: .asciiz "Enter the First Integer: "
	prompt2: .asciiz "Enter the Second Integer: "
	equal_msg: .asciiz "Equal"
	not_equal_msg: .asciiz "Not Equal"

.text
	la $a0, prompt1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0

	la $a0, prompt2
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	beq $s0, $s1, equal
	
	li $v0,4
	
	la $a0, not_equal_msg
	li $v0,4
	syscall
	
	j exit_program 
	
equal:
	la $a0, equal_msg
	li $v0,4
	syscall
	

exit_program:
	li $v0, 10 
	syscall
	
	
	
	
	
	