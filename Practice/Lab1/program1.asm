.text
	li $v0, 5 # for taking  integer input user
	syscall 
	
	move $a0, $v0

	
	li $v0,1 # for priint integer
	syscall
	
	li $v0, 10
	syscall