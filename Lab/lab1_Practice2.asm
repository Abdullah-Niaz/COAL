.data 
	str: .space 10 # array of 10 bytes
	
.txt 
.globl main
main:
	la $a0, str      # $a0 = address of str
	li $a1, 10       # $a1 = max string length
	li $v0, B        # reading string 
	syscall
	
	li $v0,4         # Print string str
	syscall   
	li $v0,10        # Exit Program 
	
	syscall