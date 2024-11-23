.data
	str: .space 10         # array of 10 bytes
	
.text 
.globl main

main:
	la $a0,str		# $a0 = address of str
	li $a1, 20              # $a1 = max string length
	li $v0, 8 		# read string 
	
	syscall 
	
	li $v0, 4 		# print string str
	syscall 
	
	li $v0, 10		# Exit Program 
	syscall