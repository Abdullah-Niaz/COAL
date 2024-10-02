################### Data segment #####################
.data
name_prompt:    .asciiz  "Please type your name: "   # Prompt to ask for the user's name
out_msg:        .asciiz  "Your name in capitals is: " # Message before displaying the converted name
in_name:        .space   31                          # Space for input string (30 characters + null terminator)

################### Code segment #####################
.text
.globl main
main:
    # Print the prompt asking for the user's name
    la    $a0, name_prompt    # Load the address of the prompt message into $a0
    li    $v0, 4              # System call code for printing a string (syscall 4)
    syscall                   # Make the system call to print the prompt

    # Read the input string from the user
    la    $a0, in_name        # Load the address of the input buffer into $a0
    li    $a1, 31             # Set the buffer size (30 characters + null terminator)
    li    $v0, 8              # System call code for reading a string (syscall 8)
    syscall                   # Make the system call to read the input string

    # Print the output message "Your name in capitals is: "
    la    $a0, out_msg        # Load the address of the output message into $a0
    li    $v0, 4              # System call code for printing a string (syscall 4)
    syscall                   # Make the system call to print the output message

    # Convert the input string to uppercase
    la    $t0, in_name        # Load the address of the input string into $t0 (pointer to the current character)
    
convert_loop:
    lb    $t1, ($t0)          # Load the byte at the current address (character) into $t1
    beqz  $t1, exit_loop      # If the byte is null (end of string), exit the loop

    # Check if the character is a lowercase letter
    blt   $t1, 'a', no_change # If the character is less than 'a', it's not lowercase, skip conversion
    bgt   $t1, 'z', no_change # If the character is greater than 'z', it's not lowercase, skip conversion

    # Convert the lowercase letter to uppercase
    addiu $t1, $t1, -32       # Convert to uppercase: 'A' - 'a' = -32
    sb    $t1, ($t0)          # Store the converted character back into the same position

no_change:
    addiu $t0, $t0, 1         # Move the pointer to the next character
    j     convert_loop        # Jump back to the start of the loop

exit_loop:
    # Print the converted string (now in uppercase)
    la    $a0, in_name        # Load the address of the converted string into $a0
    li    $v0, 4              # System call code for printing a string (syscall 4)
    syscall                   # Make the system call to print the converted string

    # Exit the program
    li    $v0, 10             # System call code for exiting the program (syscall 10)
    syscall                   # Make the system call to exit
