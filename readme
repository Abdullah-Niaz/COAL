### 1. Assemble the File:

If your file uses modern NASM syntax and is correctly formatted, assemble it like this:

`nasm -f elf64 yourfile.asm -o yourfile.o`

### 2. Link the Object File:

`    ld -o yourfile yourfile.o`

### 3. Run the Executable

`    ./yourprogram`

### 4. Checking for Common Issues

If you encounter issues, consider the following:

#### i. File Paths:

Ensure that the file paths used in the mov rsi, msg instruction correctly point to the message in your .asm file.

#### ii. Syscall Numbers:

Verify that the syscall numbers used (1 for sys_write and 60 for sys_exit) are correct for your system.

#### iii. Permissions:

Ensure the executable has execute permissions. If not, set the correct permissions using:

`    chmod +x yourprogram`

### 5. Debugging

If you encounter issues or need to debug your assembly program, follow these steps:

#### i. Assemble with Debug Information

Generate debugging information during the assembly process:

`nasm -f elf64 -g yourfile.asm -o yourfile.o `

#### ii. Link with Debug Information

`ld -g -o yourprogram yourfile.o 3. `

#### iii. Run in gdb

Use gdb (GNU Debugger) to debug your program:

`gdb ./yourprogram`

Inside gdb, you can set breakpoints and step through the code to identify where it might be failing. For example:

**Set a Breakpoint:** `break \_start`

**Run the Program:** `run`

**Step Through Code:** `step`

**Continue Execution:** `continue`

**Print Registers or Variables:** `print rax` (or other registers)
