.data
	str: .space 10
	
.text 
	la $a0, str # load address of str into $a0
	li $a1, 10 # length of a1 is 10 bytes now 
	li $v0, 8 # read the string 
	syscall
	
	li $v0, 4 # print the string 
	syscall
	
	li $v0, 10 # exit program 
	syscall