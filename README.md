### Run on VsCode(linux)

#### Assemble the Program

In the terminal, navigate to the directory containing hello.asm and run the following command to assemble the code into an object file:

`nasm -f elf32 -o hello.o hello.asm`

#### Link the Object File:

Use the linker to create an executable from the object file:
`ld -m elf_i386 -o hello hello.o`

#### Run the Program:

Finally, execute the program:
`./hello`

#### Summary:

1. You installed NASM and GCC.
2. Wrote an assembly program in VS Code.
3. Assembled it using nasm.
4. Linked it using ld.
5. Ran it to print "Hello, World!" in the terminal.

---

### Assemble and Link on Ubuntu Using NASM:

Open a terminal on Ubuntu and run:

`nasm -f bin filename.asm -o filename.com`

This command converts your assembly code to a `.com` file.

### Run the Executable in DOSBox

After assembling the `.com` file, you can run it within DOSBox:

#### i. Mount the Directory in DOSBox

`mount c /path/to/your/directory
c:`

#### ii. Run the Program

`filename.com`

---

---

## Window

`nasm file.asm -o file.com`

#### Listing

`nasm file.asm  -o file.com -l file.lst`

#### Run:

`file.com`

#### For Degugger

`afd file.com`

## Ubuntu

### 1. Assemble the File:

If your file uses modern NASM syntax and is correctly formatted, assemble it like this:

`nasm -f elf64 yourfile.asm -o yourfile.o`

### 2. Link the Object File:

For first one

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
