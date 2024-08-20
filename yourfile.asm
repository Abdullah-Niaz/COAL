section .data
msg db 'Hello, World!', 0

section .text
global _start

_start:
    ; Write the message to stdout
    mov rax, 1          ; syscall number for sys_write
    mov rdi, 1          ; file descriptor 1 is stdout
    mov rsi, msg        ; pointer to message
    mov rdx, 13         ; message length
    syscall             ; invoke syscall

    ; Exit the program
    mov rax, 60         ; syscall number for sys_exit
    xor rdi, rdi        ; exit code 0
    syscall             ; invoke syscall
