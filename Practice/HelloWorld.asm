.data # this section contains the data which will be used in the program
    message: .asciiz "Hello World" # a label message contains the hello world of type asciiz
    myMessage: .asciiz "Hello world 2"

.text # this section contains all the set of instructions 
    li $v0, 4     # load the system call code for print_string into $v0
    la $a0, message # load the address of the message into $a0
    
   li $v0, 4
   la $a0, myMessage
    syscall         # make the system call
