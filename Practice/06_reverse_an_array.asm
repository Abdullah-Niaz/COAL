.data 
	x: .word 2,3,4,5
	n: .word 4
	str: .asciiz "2 * "
	separator: .asciiz " | "
	
	
.text
	la $t0,n
	lw $t1, 0($t0) #length of array 
	
	la $t2, x
	
	#loop counter 
	add $t3, $t1,$zero #conter = 10 
	
reverse_loop:
	#check the counter
	beq $t3, $zero, done
	
	# get the element from array
	
	# derement the counter
	subi $t4, $t3,1
	
	add $t5, $t4, $t4
	add $t6,$t4, $t5
	
	
	lw $t7, 0($t6)
	
	mul $t8, $t7, 2
	
	# print the string
	la  $a0, str
	li $v0, 4
	syscall
	
	move $a0, $t8
	li $v0, 1
	syscall
	
	la $a0, separator
	li $v0, 4
	syscall
	
							
	#decrement counter 					
	subi $t3, $t3, 1
	
	j reverse_loop
	
done:
	li $v0, 10
	syscall
	
					

	
			