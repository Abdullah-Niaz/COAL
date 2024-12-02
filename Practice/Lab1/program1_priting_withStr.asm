.data 
	take_in: .asciiz "Enter a integer: "
	ans_str: .asciiz "Entered Value is: "
	
.text
	.global main
main: 
	# print the prompt
	la $a0, take_in # load address of take_in 
	li $v0,4
	syscall
	
	
	# Read Integer 
	li $v0, 5
	syscall
	move $t0, $v0
	
	# print the answer string 
	la $a0, ans_str
	li $v0, 4
	syscall
		
	move $a0, $t0
	li $v0,1
	syscall
	
	li $v0,10
	syscall