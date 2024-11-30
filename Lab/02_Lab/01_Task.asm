.data
    str1: .asciiz "Enter an integer value:"
    str2: .asciiz "You entered: "
    str3: .asciiz "The doubled value is: "

.text
main:
    # Ask user for input
    li $v0, 4                  # syscall for print string
    la $a0, str1               # load address of str1
    syscall

    li $v0, 5                  # syscall for read integer
    syscall
    move $s0, $v0              # store input in $s0

    # Print the entered number
    li $v0, 4                  # syscall for print string
    la $a0, str2               # load address of str2
    syscall

    li $v0, 1                  # syscall for print integer
    move $a0, $s0              # move input to $a0
    syscall

    # Double the number using add instruction
    add $s1, $s0, $s0          # $s1 = $s0 + $s0 (double the value)

    # Print the doubled value
    li $v0, 4                  # syscall for print string
    la $a0, str3               # load address of str3
    syscall

    li $v0, 1                  # syscall for print integer
    move $a0, $s1              # move doubled value to $a0
    syscall

    # Exit program
    li $v0, 10                 # syscall for exit
    syscall
