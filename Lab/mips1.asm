.text
.globl main

main: # main program entery
	li $v0, 5 # Read Integer
	syscall # $v0 = value read
	
	move $v0, $v0 # $a0 = value to print
	li $v0,1      # print integer
	syscall
	
	li $v0,10   # Exit Program
	
	syscall