.data
    prompt: .asciiz "Enter the Name: "
    greetings: .asciiz "Hello "
    name_buffer: .space 100

.text
    # Prompt user to enter their name
    la $a0, prompt         # Load prompt message
    li $v0, 4              # Print string syscall
    syscall

    # Read user input (name)
    la $a0, name_buffer    # Load address of input buffer
    li $a1, 100            # Set maximum length
    li $v0, 8              # Syscall to read string
    syscall

    # Print greeting
    la $a0, greetings      # Load greeting message
    li $v0, 4              # Print string syscall
    syscall

    # Print the entered name
    la $a0, name_buffer    # Load address of the entered name
    li $v0, 4              # Print string syscall
    syscall

    # Exit
    li $v0, 10             # Exit syscall
    syscall
