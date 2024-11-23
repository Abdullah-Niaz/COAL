.text

.global main
main:			# Main program entry
	li $v0, 5 	# Read integer
	syscall
	
	move $a0, $v0 	# $a0 = Value to print
	li $v0, 1       # print integer
	syscall
	
	li $v0, 10      # Exit program
	syscall