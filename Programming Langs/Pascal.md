# Pascal Programming Guide for Termux

This guide explains how to set up and use the Pascal programming language in Termux with the Free Pascal compiler. Pascal is a procedural programming language known for its simplicity and readability, making it an excellent choice for beginners and educational purposes. By following this guide, you can write, compile, and run Pascal programs directly on your Android device.

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
   - [Step 1: Update Termux Packages](#step-1-update-termux-packages)
   - [Step 2: Install Free Pascal Compiler](#step-2-install-free-pascal-compiler)
4. [Writing and Running Pascal Programs](#writing-and-running-pascal-programs)
5. [Example Programs](#example-programs)
6. [Troubleshooting](#troubleshooting)
7. [Additional Resources](#additional-resources)
8. [Conclusion](#conclusion)

---

## Overview

Pascal is a classic programming language that emphasizes structured programming and clarity. It is widely used for teaching programming concepts and developing small applications. In this guide, we'll set up Pascal in Termux, write simple programs, and explore common workflows for development.

---

## Prerequisites

Before proceeding, ensure the following:

- **Termux App**: Latest version installed from the Play Store or F-Droid.
- **Storage Permission**: Granted to Termux (`termux-setup-storage`).
- **Internet Connection**: A stable internet connection is required for downloading packages and tools.
- **Device Storage**: Ensure sufficient free storage space (at least 500 MB recommended).

---

## Installation

### Step 1: Update Termux Packages
Ensure all Termux packages are up to date:
```bash
pkg update && pkg upgrade
```

### Step 2: Install Free Pascal Compiler
Install the Free Pascal compiler (`fp-compiler`) using the Termux package manager:
```bash
pkg install fp-compiler
```

Verify the installation:
```bash
fpc -h
```
You should see help information about the Free Pascal compiler.

---

## Writing and Running Pascal Programs

### Step 1: Create a Pascal Program
Create a new Pascal source file using any text editor available in Termux. For example, use `nano`:
```bash
nano hello.pas
```

Add the following code to the file:
```pascal
program Hello;
begin
  writeln('Hello, World!');
end.
```

Save the file by pressing `Ctrl + O`, then exit the editor by pressing `Ctrl + X`.

### Step 2: Compile the Pascal Program
Compile the Pascal program using the Free Pascal compiler:
```bash
fpc hello.pas
```

This will generate an executable file named `hello` in the current directory.

### Step 3: Run the Compiled Program
Run the compiled program:
```bash
./hello
```

Output:
```
Hello, World!
```

---

## Example Programs

### 1. Simple Arithmetic
Perform basic arithmetic operations:
```pascal
program Arithmetic;
var
  a, b, sum: Integer;
begin
  a := 10;
  b := 20;
  sum := a + b;
  writeln('Sum: ', sum);
end.
```

Compile and run:
```bash
fpc arithmetic.pas
./arithmetic
```

Output:
```
Sum: 30
```

### 2. Factorial Calculation
Calculate factorial using recursion:
```pascal
program Factorial;
function fact(n: Integer): Integer;
begin
  if n <= 1 then
    fact := 1
  else
    fact := n * fact(n - 1);
end;

var
  num: Integer;
begin
  num := 5;
  writeln('Factorial of ', num, ' is ', fact(num));
end.
```

Compile and run:
```bash
fpc factorial.pas
./factorial
```

Output:
```
Factorial of 5 is 120
```

---

## Troubleshooting

### 1. Compilation Errors
- **Cause**: Missing dependencies like `binutils` or `make`.
- **Solution**:
  Install the required tools:
  ```bash
  pkg install binutils make
  ```

### 2. File Not Found Errors
- **Cause**: Incorrect file path or missing source file.
- **Solution**:
  Ensure the Pascal source file exists in the current directory:
  ```bash
  ls
  ```

### 3. Syntax Errors
- **Cause**: Mistakes in the Pascal code.
- **Solution**:
  Double-check the syntax and structure of your Pascal program. Refer to Pascal documentation for guidance.

### 4. Slow Compilation
- **Cause**: High resource usage during compilation.
- **Solution**:
  Close unnecessary apps to free up memory.
  Use lightweight scripts for testing.

---

## Additional Resources

- [Free Pascal Documentation](https://www.freepascal.org/docs.var)
- [Learn Pascal Programming](https://www.tutorialspoint.com/pascal/index.htm)
- [Pascal Programming Examples](https://rosettacode.org/wiki/Category:Pascal)

---

## Conclusion

By following this guide, you can set up and use Pascal in Termux to write, compile, and run programs. Whether you're learning programming basics, experimenting with algorithms, or building simple applications, Pascal provides a clear and structured environment. Combine it with tools like `nano` for editing and debugging for a seamless development experience. Enjoy exploring the power of Pascal on your Android device!