# C++ Installation and Usage Guide for Termux

## Introduction
This guide provides detailed steps on how to install and use C++ in Termux. Termux is a terminal emulator and Linux environment app for Android. It allows you to run a full-fledged Linux environment on your Android device.

## Prerequisites
Before you begin, ensure that you have Termux installed on your Android device. You can download it from the [Google Play Store](https://play.google.com/store/apps/details?id=com.termux) or [F-Droid](https://f-droid.org/en/packages/com.termux/).
Or else go with this [guide](https://github.com/ysathyasai/Termux/blob/main/Guide.md).

## Step 1: Update and Upgrade Termux Packages
First, update and upgrade the Termux packages to ensure that you have the latest package lists:
```sh
pkg update && pkg upgrade
```

## Step 2: Install C++ Compiler
To install the C++ compiler (G++) in Termux, run the following command:
```sh
pkg install clang
```
This command will install the G++ compiler along with the necessary dependencies.

## Step 3: Verify C++ Compiler Installation
After the installation is complete, you can verify that the C++ compiler is installed correctly by checking the version:
```sh
g++ --version
```
You should see the installed C++ compiler version displayed.

## Step 4: Using C++ in Termux
You can now start using C++ in Termux. To create a simple C++ program, follow these steps:

## Step 5: Creating and Running C++ Programs
To create a C++ program, you can use any text editor available in Termux. We will use the Micro text editor for this guide.

## Step 6: Install Micro Text Editor
Micro is a modern and easy-to-use terminal-based text editor. Install it with:
```sh
pkg install micro
```

## Step 7: Creating a C++ Program with Micro
To create a program called `hello.cpp` using Micro, run:
```sh
micro hello.cpp
```
In the Micro editor, write your C++ code. For example:
```cpp
#include <iostream>

int main() {
    std::cout << "Hello, Termux!" << std::endl;
    return 0;
}
```
Save the file by pressing `Ctrl + S` and exit the editor by pressing `Ctrl + Q`. To compile the program, use the following command:
```sh
g++ hello.cpp -o hello
```
To run the compiled program, use:
```sh
./hello
```
You should see the output `Hello, Termux!` displayed.

## Step 8: Compiling with Debugging Symbols
To enable debugging for your program, compile it with the `-g` flag:
```sh
g++ -g hello.cpp -o hello
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
g++ -O2 hello.cpp -o hello
```

## Conclusion
You have successfully installed and used C++ in Termux. This guide covered the basic steps to get you started. For more advanced usage and features, refer to the official C++ documentation.

Happy coding!
## Step 11: Handling Multiple Source Files

If your project has multiple C files, you can compile them together:

```sh
clang file1.c file2.c -o output
```

Or, compile separately and link later:

```sh
clang -c file1.c -o file1.o  
clang -c file2.c -o file2.o  
clang file1.o file2.o -o output
```

## Step 12: Using Makefile for Project Automation

For larger projects, use a `Makefile` to automate compilation. Create a `Makefile` and add:

```makefile
all: hello  

hello: hello.c  
	clang hello.c -o hello  

clean:  
	rm -f hello
```

Run `make` to compile and `make clean` to remove the executable.

## Step 13: Running C Code Interactively

You can use an interactive C interpreter (`tcc`) to test snippets without compiling:

```sh
pkg install tcc  
tcc -run hello.c
```

This allows you to execute C programs without compiling them separately.

## Conclusion

You have successfully installed and used C++ in Termux. This guide covered the basic steps to get you started. For more advanced usage and features, refer to the official C documentation.

Happy coding!

