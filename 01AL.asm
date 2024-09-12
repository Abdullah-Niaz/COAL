org  0x0100              ; Origin, set the starting address
 
mov  ax,       5         ; Move the constant 5 into register AX
mov  bx,       10        ; Move the constant 10 into register BX

add  ax,       bx        ; Add the value in BX to AX (AX = AX + BX)

mov  bx,       15        ; Move the constant 15 into register BX
add  ax,       bx        ; Add the value in BX to AX (AX = AX + BX)

mov  ax,       0x4c00    ; Terminate program
int  0x21                ; DOS interrupt to exit
