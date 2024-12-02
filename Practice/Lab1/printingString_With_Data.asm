.data 
	str: .space 10
	take_str: .asciiz "Enter a String: "
	ans_str: .asciiz "Entered String is: "

.text
	# promt the string
	la $a0, take_str
	li $v0,4
	syscall
	
	la $a0, str
	li $a1, 10 # maximum length of string to read which is equal to 10 
	
	li $v0, 8 # reading string
	syscall
	
	# print the string 
	la $a0, ans_str
	li $v0, 4
	syscall
	
	la $a0,str
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall