# C Installation and Usage Guide for Termux

## Introduction
This guide provides detailed steps on how to install and use C in Termux. Termux is a terminal emulator and Linux environment app for Android. It allows you to run a full-fledged Linux environment on your Android device.

## Prerequisites
Before you begin, ensure that you have Termux installed on your Android device. You can download it from the [Google Play Store](https://play.google.com/store/apps/details?id=com.termux) or [F-Droid](https://f-droid.org/en/packages/com.termux/).
Or else go with this [guide](https://github.com/ysathyasai/Termux/blob/main/Guide.md).

## Step 1: Update and Upgrade Termux Packages
First, update and upgrade the Termux packages to ensure that you have the latest package lists:
```sh
pkg update && pkg upgrade
```

## Step 2: Install C Compiler
To install the C compiler (GCC) in Termux, run the following command:
```sh
pkg install clang
```
This command will install the GCC compiler along with the necessary dependencies.

## Step 3: Verify C Compiler Installation
After the installation is complete, you can verify that the C compiler is installed correctly by checking the version:
```sh
clang --version
```
You should see the installed C compiler version displayed.

## Step 4: Using C in Termux
You can now start using C in Termux. To create a simple C program, follow these steps:

## Step 5: Creating and Running C Programs
To create a C program, you can use any text editor available in Termux. We will use the Micro text editor for this guide.

## Step 6: Install Micro Text Editor
Micro is a modern and easy-to-use terminal-based text editor. Install it with:
```sh
pkg install micro
```

## Step 7: Creating a C Program with Micro
To create a program called `hello.c` using Micro, run:
```sh
micro hello.c
```
In the Micro editor, write your C code. For example:
```c
#include <stdio.h>

int main() {
    printf("Hello, Termux!\n");
    return 0;
}
```
Save the file by pressing `Ctrl + S` and exit the editor by pressing `Ctrl + Q`. To compile the program, use the following command:
```sh
clang hello.c -o hello
```
To run the compiled program, use:
```sh
./hello
```
You should see the output `Hello, Termux!` displayed.

## Step 8: Compiling with Debugging Symbols
To enable debugging for your program, compile it with the `-g` flag:
```sh
clang -g hello.c -o hello
```
This allows you to debug it using a debugger like `gdb`.

## Step 9: Installing and Using GDB for Debugging
GDB (GNU Debugger) can be installed in Termux for debugging purposes:
```sh
pkg install gdb
```
Run the debugger on your compiled program:
```sh
gdb hello
```

## Step 10: Optimizing Compilation
For better performance, compile with optimizations using the `-O2` flag:
```sh
clang -O2 hello.c -o hello
```

## Conclusion
You have successfully installed and used C in Termux. This guide covered the basic steps to get you started. For more advanced usage and features, refer to the official C documentation.

Happy coding!