.data   # sample0.asm c:  .word  3 
k:  .word  5 
 
.text .global main main: 
la $t0,c              # address of c         la $t1,k              # address of k 
        lw $s0,0($t0)     	# load the contents of c 
        lw $s1,0($t1)     	# load the contents of k 
        slt $s3,$s0,$s1  	# if $s0 < $s1 then $s3 = 1; else $s3 = 0 
        beq $s3,$0,notless  	#if $s3 == 0: go to notless; o/w just go to 
                            	# the next instruction 
        sw $s0,0($t1)    	#store contents of c into k 
        sw $s1,0($t0)    notless: 	#store the contents of k into c 
      addi $v0,$0,5      mov $a0, $v0   li    $v0,1 
        syscall 	# just to do something here
      li    $v0,10 	 	# exit 
        syscall  
