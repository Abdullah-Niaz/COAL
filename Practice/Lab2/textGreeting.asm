.data
	prompt: .asciiz "\n Enter the Name: "
	greetings: .asciiz "\n Hello "
	str: .space 100
	repeat_str: .asciiz "\n Repeat [Y/N]: "
.text

repeat:
	la $a0, prompt
	li $v0,4
	syscall
	
	la $a0,str
	li $a1, 100
	
	li $v0,8
	syscall
	
	la $a0, greetings
	li $v0, 4
	syscall
	
	la $a0,str
	li $v0, 4
	syscall
	
	la $a0, repeat_str
	li $v0, 4
	syscall
	
	li $v0, 12
	syscall
	move $t0, $v0
	
	li $t1,'y'
	
	beq $t0,$t1,repeat
	
	
	li $v0,10
	syscall