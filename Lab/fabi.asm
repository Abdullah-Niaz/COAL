.data
	prompt:  .ascii "Enter a non-negative integer: "
.text
.globl main

# Computes Fibonacci Sequence
# i =  0  1  2  3  4  5  6  7  8  9  10 ...
# x =  0  1  1  2  3  5  8 13 21 34  55 ...


main:
 	la $a0, prompt # load addresss of prompt message 
 	li $v0, 4      # print it 
 	syscall    

 	li $v0, 5     # read the integer
	syscall    

	move $a0, $v0  # Move the input value into $a0 (the argument for vfib) Register

	# Call Fibonacci function
 	jal vfib
 	# $ra will store the returing address
   	
   	# Display the Result
   	move $a0, $v0          # Move the result of Fibonacci into $a0 for printing
    	li $v0, 1              # Print integer system call
    	syscall

 	li $v0, 10   # Exit Program using System Call 10
 	syscall



# Recursive Fibonacci function
vfib: 
    # Base cases
    addi $t0, $zero, 1     # Set $t0 to 1
    beq $a0, $zero, fib0   # If n == 0, return 0
    beq $a0, $t0, fib1     # If n == 1, return 1
    j fib                  # Otherwise, calculate recursively

# Fibonacci(n == 0)
fib0:
 	li $v0, 0   # Return 0 for Fib(0)
 	jr $ra


# Fibonacci(n == 1)
fib1:
 	li $v0, 1    # Return 1 for Fib(1)
 	jr $ra


# Recursive case: Fibonacci(n-1) + Fibonacci(n-2)
fib:
 	#  stack frame space for recursion
 	addi $sp, $sp, -16   # Allocate space on the stack 
 	sw $ra, 0($sp)  # Save return address
 	sw $a0, 4($sp)  # Save argument n

 	#Calculate (fib(n-1))
 	addi $a0, $a0, -1  # Decrement n to n - 1
 	jal vfib    # Recursive call for Fib(n-1)
 	sw $v0, 8($sp)  # Save the result of Fib(n-1)

 	# Calculate Fib(n-2)
 	lw $a0, 4($sp)   # Restore original n value from stack
 	addi $a0, $a0, -2  # Decrement n to n-2
 	jal vfib   # Recursive call for Fib(n-2)
 	sw $v0, 12($sp)  # Save the result of Fib(n-2)

 	# Restore from stack and sum
 	lw $ra, 0($sp)  # Restore return address
 	lw $t0, 8($sp) # Load Fib(n-1)
 	lw $t1, 12($sp)  # Load Fib(n-2)
 	addi $sp, $sp, 16  #free up space on stack
 	add $v0, $t0, $t1  # Add Fib(n-1) + Fib(n-2)


 	jr $ra

