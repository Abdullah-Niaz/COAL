.data # this section contains the data which will be used in the program

	message: .asciiz "Hello World" # a label message contains the hello world of type asciiz

.text # this section contains all the set of instructions 
	li $v0, 4
	la $a0, message
	syscall 
	