.data
	myMessage: .asciiz "Enter the Three Numbers: "
	sum: .asciiz "Sum is: "
	
.text
	la $a0, myMessage
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	#adding 
	add $t3 , $t1, $t0
	add $t3, $t3, $t2
	
	#display the sum message
	la $a0, sum
	li $v0, 4
	syscall
	
	# diaply sum 
	move $a0, $t3
	li $v0, 1
	syscall
	
	li $v0,10
	syscall
	
	