.data 
	take_in: .asciiz "\n Enter a integer: "
	ans_str: .asciiz "\n Entered Value is:"
	ans_double: .asciiz "\n Doubled Value is: "
	rep: .asciiz "Do you Want to Repeat [Y/N] : "
.text
	.global main
main: 


repeat:
	la $a0, take_in
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	la $a0, ans_str
	li $v0,4
	syscall
	
	move $a0,$t0
	
	li $v0,1
	syscall
	
	la $a0, ans_double
	li $v0,4
	syscall
	
	add $t1, $t0,$t0
	
	move $a0,$t1
	li $v0,1
	syscall
	
	la $a0,rep
	li $v0,4
	syscall
	
	li $v0,12
	syscall
	
	move $t0,$v0
	
	# Check if the user enter y 
	li $t1, 'y'
	beq $t1,$t0,repeat
	
	
	
	li $v0,10
	syscall
	
	
	