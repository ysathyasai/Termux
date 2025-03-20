# Assembly Programming in Termux

## Overview
Assembly language is a low-level programming language that provides direct control over the hardware. In Termux, you can write and compile Assembly programs using NASM (Netwide Assembler).

- **Language**: Assembly (NASM)
- **Assembler**: NASM
- **File Extension**: `.asm`
- **Package Name**: `nasm`

## Step 1: Installing NASM

### Install NASM and Binutils
To install NASM and binutils, run the following command:
```sh
pkg install nasm binutils
```

### Install Additional Tools
For debugging and building larger projects, you may also want to install `gdb` and `make`:
```sh
pkg install gdb make
```

### Verify Installation
To verify that NASM has been installed correctly, you can check the version:
```sh
nasm -v
```

## Step 2: Writing and Compiling Assembly Programs

### Project Structure
A typical project structure for an Assembly program might look like this:
```
project/
├── src/
│   └── main.asm
└── Makefile
```

### Example Code
Create a simple "Hello, World!" program in Assembly.

1. Open Termux and create a new directory for your project:
    ```sh
    mkdir -p project/src
    cd project/src
    ```

2. Create a new file named `main.asm` using a text editor like `nano` or `vi`:
    ```sh
    nano main.asm
    ```

3. Add the following code to the file:
    ```nasm
    section .data
        msg db 'Hello, World!',0xa
        len equ $ - msg

    section .text
        global _start
    _start:
        mov eax, 4      ; sys_write
        mov ebx, 1      ; stdout
        mov ecx, msg    ; message
        mov edx, len    ; length
        int 0x80        ; syscall

        mov eax, 1      ; sys_exit
        xor ebx, ebx    ; exit code 0
        int 0x80        ; syscall
    ```

4. Save the file and exit the editor (`Ctrl + X` in nano, `:wq` in vi).

### Compiling the Assembly Program
To compile the Assembly program, use NASM:
```sh
nasm -f elf32 main.asm -o main.o
```

### Linking the Object File
To link the object file and create an executable, use `ld`:
```sh
ld -m elf_i386 main.o -o main
```

### Running the Compiled Program
To run the compiled program, use:
```sh
./main
```

## Step 3: Debugging Assembly Programs

### Using GDB for Debugging
To debug Assembly programs, you can use `gdb`, the GNU Debugger.

#### Running the Debugger
```sh
gdb ./main
```

#### Common GDB Commands
- `break <location>`: Set a breakpoint at the specified location.
- `run`: Start the program.
- `step`: Step through the program one instruction at a time.
- `continue`: Continue running the program until the next breakpoint.
- `print <variable>`: Print the value of a variable or register.
- `quit`: Exit GDB.

## Step 4: Using Makefiles for Automation

### Example Makefile
For larger projects, you might want to use `make` and `Makefiles` to manage the build process.

Create a `Makefile` in the root of your project directory:
```makefile
all: main

main: src/main.o
    ld -m elf_i386 src/main.o -o main

src/main.o: src/main.asm
    nasm -f elf32 src/main.asm -o src/main.o

clean:
    rm -f src/*.o main
```

### Running `make`
To build your project using `make`, run:
```sh
make
```

### Cleaning Up
To clean up the compiled files, run:
```sh
make clean
```

## Conclusion
You have successfully set up and configured Assembly programming in Termux, written and compiled Assembly programs, and learned how to handle common issues. For more advanced usage and features, refer to the official NASM and GNU documentation.

Happy coding with Assembly in Termux!