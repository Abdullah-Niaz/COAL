# int fact (int n) 
#{
#	if (n < 1) return 1;
#	else return (n * fact (n-1)); 
# }


.text
	li $a0, 5
	
	jal fact
	move $a0, $v0
	li $v0,1
	syscall
	
	li $v0,10
	syscall	

fact:
	addi $sp , $sp , -8 
	sw $ra , 0($sp)
	sw $a0, 4($sp)
	
	li $t0, 1
	blt $a0,$t0,return_1
	
	addi $a0, $a0, -1
	
	jal fact
	
	lw $a0, 4($sp)
	
	mult $a0, $v0
	mflo $v0
	
	addi $sp , $sp , 8
	jr $ra
	
	
return_1:
	li $v0,1
	jr $ra