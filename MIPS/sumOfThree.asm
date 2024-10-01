.data
prompt:     .asciiz "Please enter three numbers: \n"
sum_msg:    .asciiz "The sum is: "

################### Code segment ###################
.text
.globl main
main:
      # Display the prompt message
      la    $a0, prompt      # Load address of prompt into $a0
      li    $v0, 4           # System call code for print_string
      syscall                # Make system call to print prompt
      
      # Read the 1st integer and store in $t0
      li    $v0, 5           # System call code for read_int
      syscall                # Make system call to read integer
      move  $t0, $v0         # Move the first integer to $t0
      
      # Read the 2nd integer and store in $t1
      li    $v0, 5           # System call code for read_int
      syscall                # Make system call to read integer
      move  $t1, $v0         # Move the second integer to $t1
      
      # Read the 3rd integer and store in $t2
      li    $v0, 5           # System call code for read_int
      syscall                # Make system call to read integer
      move  $t2, $v0         # Move the third integer to $t2
      
      # Compute the sum of the three integers
      add   $t3, $t0, $t1    # Add the first and second integers, result in $t3
      add   $t3, $t3, $t2    # Add the third integer to the sum in $t3
      
      # Display the sum message
      la    $a0, sum_msg      # Load address of sum_msg into $a0
      li    $v0, 4           # System call code for print_string
      syscall                # Make system call to print the sum message
      
      # Display the sum
      move  $a0, $t3         # Move the sum into $a0
      li    $v0, 1           # System call code for print_int
      syscall                # Make system call to print the sum
      
      # Exit the program
      li    $v0, 10          # System call code for exit
      syscall                # Make system call to exit
