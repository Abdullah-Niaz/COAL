.data 
	str: .space 10
	take_str: .asciiz "Enter a String: "
	ans_str: .asciiz "Entered String is: "

.text
	la $a0, take_str
	li $v0,4
	syscall
	
	la $a0, str
	li $a1, 10 #maximum length of string 
	li $v0, 8
	syscall
	
	
	la $a0, ans_str
	li $v0, 4
	syscall 
	
	la $a0, str
	li $v0,4
	syscall
	
	li $v0, 10
	syscall