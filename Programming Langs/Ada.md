# Ada Programming in Termux

## Overview
Ada is a structured, statically typed, imperative, and object-oriented high-level programming language, extended from Pascal and other languages. It is widely used in systems where safety and security are critical, such as in aviation, healthcare, and defense systems.

In Termux, you can compile and run Ada programs using the GNAT compiler, which is part of the GCC (GNU Compiler Collection).

- **Language**: Ada
- **Compiler**: GNAT (GNU NYU Ada Translator)
- **File Extensions**: `.adb`, `.ads`
- **Package Name**: `gcc-ada`

## Step 1: Installing Ada Compiler

### Update and Upgrade Termux Packages
Before installing new packages, it's a good practice to update and upgrade your existing packages:
```sh
pkg update && pkg upgrade
```

### Install GNAT (GCC Ada Compiler)
To install GNAT, which is included in the GCC package for Ada:
```sh
pkg install gcc-ada
```

### Verify Installation
To verify that GNAT has been installed correctly, you can check the version:
```sh
gnat --version
```

## Step 2: Writing and Compiling Ada Programs

### Example Program
Create a simple "Hello, World!" program in Ada.

1. Open Termux and create a new file named `hello.adb` using a text editor like `nano` or `vi`:
    ```sh
    nano hello.adb
    ```

2. Add the following code to the file:
    ```ada
    with Ada.Text_IO; use Ada.Text_IO;

    procedure Hello is
    begin
       Put_Line("Hello, World!");
    end Hello;
    ```

3. Save the file and exit the editor (`Ctrl + X` in nano, `:wq` in vi).

### Compiling the Ada Program
To compile the Ada program, use the `gnatmake` command:
```sh
gnatmake hello.adb
```

This command will generate an executable file named `hello`.

### Running the Compiled Program
To run the compiled program, use:
```sh
./hello
```

## Step 3: Common Issues and Solutions

### Issue 1: Build Issues
If you encounter build issues, you may need to install additional tools:
```sh
pkg install binutils make
```

### Issue 2: Missing or Corrupted Libraries
If you encounter issues related to missing or corrupted libraries, you can try reinstalling the Ada compiler and related packages:
```sh
pkg reinstall gcc-ada
```

## Step 4: Advanced Topics

### Creating and Using Ada Packages
Ada supports modular programming through the use of packages. A package consists of a specification file (`.ads`) and a body file (`.adb`).

#### Example Package Specification (`math_operations.ads`)
```ada
package Math_Operations is
    function Add (A, B : Integer) return Integer;
    function Subtract (A, B : Integer) return Integer;
end Math_Operations;
```

#### Example Package Body (`math_operations.adb`)
```ada
package body Math_Operations is
    function Add (A, B : Integer) return Integer is
    begin
        return A + B;
    end Add;

    function Subtract (A, B : Integer) return Integer is
    begin
        return A - B;
    end Subtract;
end Math_Operations;
```

#### Example Program Using the Package (`main.adb`)
```ada
with Ada.Text_IO; use Ada.Text_IO;
with Math_Operations; use Math_Operations;

procedure Main is
begin
    Put_Line("5 + 3 = " & Integer'Image(Add(5, 3)));
    Put_Line("5 - 3 = " & Integer'Image(Subtract(5, 3)));
end Main;
```

#### Compiling the Package and Program
```sh
gnatmake main.adb
```

### Debugging Ada Programs
To debug Ada programs, you can use `gdb`, the GNU Debugger. Install `gdb` if you haven't already:
```sh
pkg install gdb
```

#### Running the Debugger
```sh
gdb ./hello
```

### Using Ada with Makefiles
For larger projects, you might want to use `make` and `Makefiles` to manage the build process.

#### Example Makefile
```makefile
all: main

main: main.adb math_operations.adb
    gnatmake main.adb

clean:
    gnatclean main
    rm -f main
```

#### Running `make`
```sh
make
```

### Cross-Compiling Ada Programs
GNAT supports cross-compiling to different architectures. This is useful if you need to run your Ada programs on devices with different hardware.

## Conclusion
You have successfully set up and configured Ada programming in Termux, written and compiled Ada programs, and learned how to handle common issues. For more advanced usage and features, refer to the official Ada and GNAT documentation.

Happy coding with Ada in Termux!