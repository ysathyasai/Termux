# Fortran Programming in Termux

## Overview
Fortran is a high-level programming language that is particularly well-suited for numerical computation and scientific computing. In Termux, you can compile and run Fortran programs using GFortran, which is part of the GNU Compiler Collection (GCC).

- **Language**: Fortran
- **Version**: GFortran
- **File Extensions**: `.f90`, `.f95`
- **Package Name**: `gfortran`

## Step 1: Installing Fortran Compiler

### Update and Upgrade Termux Packages
Before installing new packages, it's a good practice to update and upgrade your existing packages:
```sh
pkg update && pkg upgrade
```

### Install GFortran
To install GFortran, run the following command:
```sh
pkg install gfortran
```

### Install Additional Tools
For building and managing larger projects, you may also want to install `make` and `cmake`:
```sh
pkg install make cmake
```

### Verify Installation
To verify that GFortran has been installed correctly, you can check the version:
```sh
gfortran --version
```

## Step 2: Writing and Compiling Fortran Programs

### Example Program
Create a simple "Hello, World!" program in Fortran.

1. Open Termux and create a new file named `hello.f90` using a text editor like `nano` or `vi`:
    ```sh
    nano hello.f90
    ```

2. Add the following code to the file:
    ```fortran
    program hello
        implicit none
        print *, "Hello, World!"
    end program hello
    ```

3. Save the file and exit the editor (`Ctrl + X` in nano, `:wq` in vi).

### Compiling the Fortran Program
To compile the Fortran program, use GFortran:
```sh
gfortran hello.f90 -o hello
```

This command will generate an executable file named `hello`.

### Running the Compiled Program
To run the compiled program, use:
```sh
./hello
```

## Step 3: Common Issues and Solutions

### Issue 1: Build Errors
If you encounter build errors, you may need to install additional tools like `binutils`:
```sh
pkg install binutils
```

### Issue 2: Missing or Corrupted Libraries
If you encounter issues related to missing or corrupted libraries, you can try reinstalling the Fortran compiler and related packages:
```sh
pkg reinstall gfortran
```

## Step 4: Advanced Topics

### Creating and Using Modules
Fortran supports modular programming through the use of modules. Modules allow you to encapsulate procedures and data.

#### Example Module (`math_operations.f90`)
```fortran
module math_operations
    implicit none
    contains
    function add(a, b)
        real :: add
        real, intent(in) :: a, b
        add = a + b
    end function add

    function subtract(a, b)
        real :: subtract
        real, intent(in) :: a, b
        subtract = a - b
    end function subtract
end module math_operations
```

#### Example Program Using the Module (`main.f90`)
```fortran
program main
    use math_operations
    implicit none
    real :: x, y
    x = 5.0
    y = 3.0
    print *, "5 + 3 =", add(x, y)
    print *, "5 - 3 =", subtract(x, y)
end program main
```

#### Compiling the Module and Program
```sh
gfortran -c math_operations.f90
gfortran main.f90 math_operations.o -o main
```

### Debugging Fortran Programs
To debug Fortran programs, you can use `gdb`, the GNU Debugger. Install `gdb` if you haven't already:
```sh
pkg install gdb
```

#### Running the Debugger
```sh
gdb ./main
```

### Using Fortran with Makefiles
For larger projects, you might want to use `make` and `Makefiles` to manage the build process.

#### Example Makefile
```makefile
all: main

main: main.o math_operations.o
    gfortran main.o math_operations.o -o main

main.o: main.f90
    gfortran -c main.f90

math_operations.o: math_operations.f90
    gfortran -c math_operations.f90

clean:
    rm -f *.o main
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
You have successfully set up and configured Fortran programming in Termux, written and compiled Fortran programs, and learned how to handle common issues. For more advanced usage and features, refer to the official Fortran and GNU documentation.

Happy coding with Fortran in Termux!