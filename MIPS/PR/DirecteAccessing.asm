.data
	var: .word 20
	
.text
	lw $t0, var
	li $t1, 5
	sw $t1, var
	syscall
	