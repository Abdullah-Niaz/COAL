.data
	n : .word 10
	sum : .word 0
	
.text
	lw $t0, n
	
	li $t1, 0 #sum
	
	li $t2,1 #counter
	
loop:
	bgt $t2, $t0,end_loop
	add $t1, $t1, $t2
	addi $t2, $t2,1
	j loop
end_loop:
	sw $t1, sum
	
	la $a0, sum
	li $v0, 1
	syscall
	
	li $v0, 10 
	syscall