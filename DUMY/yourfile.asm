section  .data
         msg       db 'Hello, World!', 0    ; Message text (null-terminated)
         title     db 'Message Box', 0      ; Title of the message box (null-terminated)

section  .text
         global    _start                   ; Entry point for the program
         extern    MessageBoxA              ; External function from user32.dll
         extern    ExitProcess              ; External function from kernel32.dll

_start:
    ; Call MessageBoxA
         push      0                        ; uType: MB_OK (0)
         push      offset title             ; lpCaption: Title of the message box
         push      offset msg               ; lpText: Message text
         push      0                        ; hWnd: Handle to owner window (NULL)
         call      MessageBoxA              ; Call MessageBoxA function

    ; Call ExitProcess
         push      0                        ; uExitCode: Exit code (0)
         call      ExitProcess              ; Call ExitProcess function
