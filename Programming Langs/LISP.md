# Common LISP Programming in Termux

## Overview
Common LISP is a powerful, multi-paradigm programming language, known for its flexibility and efficiency. It supports procedural, functional, and object-oriented programming styles. In Termux, you can use the Steel Bank Common Lisp (SBCL) implementation to run Common LISP programs.

- **Language**: Common LISP
- **Implementation**: SBCL (Steel Bank Common Lisp)
- **File Extension**: `.lisp`
- **Package Name**: `sbcl`

## Step 1: Installing SBCL

### Update and Upgrade Termux Packages
Before installing new packages, it's a good practice to update and upgrade your existing packages:
```sh
pkg update && pkg upgrade
```

### Install SBCL
To install SBCL, run the following command:
```sh
pkg install sbcl
```

### Verify Installation
To verify that SBCL has been installed correctly, you can check the version:
```sh
sbcl --version
```

## Step 2: Setting Up Quicklisp

Quicklisp is a library manager for Common LISP that makes it easy to install and manage LISP libraries.

### Download and Install Quicklisp
1. Download the Quicklisp installation script:
    ```sh
    curl -O https://beta.quicklisp.org/quicklisp.lisp
    ```

2. Run the Quicklisp installation script with SBCL:
    ```sh
    sbcl --load quicklisp.lisp
    ```

3. Follow the prompts to install Quicklisp. When asked, you can load Quicklisp automatically in future sessions by adding the following lines to your SBCL init file (`~/.sbclrc`):
    ```lisp
    (load (expand-file-name "~/quicklisp/setup.lisp"))
    ```

## Step 3: Writing and Running Common LISP Programs

### Example Program
Create a simple "Hello, World!" program in Common LISP.

1. Open Termux and create a new file named `hello.lisp` using a text editor like `nano` or `vi`:
    ```sh
    nano hello.lisp
    ```

2. Add the following code to the file:
    ```lisp
    (defun hello (name)
      (format t "Hello, ~a!~%" name))

    (hello "World")
    ```

3. Save the file and exit the editor (`Ctrl + X` in nano, `:wq` in vi).

### Running the Common LISP Program
To run the Common LISP program, use the `sbcl` command:
```sh
sbcl --script hello.lisp
```

## Step 4: Common Issues and Solutions

### Issue 1: Memory Limits
If you encounter memory limit issues, you can increase the heap size by setting the `SBCL_HEAP_SIZE` environment variable:
```sh
export SBCL_HEAP_SIZE=1024
```

### Issue 2: Missing or Corrupted Libraries
If you encounter issues related to missing or corrupted libraries, you can try reinstalling SBCL and Quicklisp:
```sh
pkg reinstall sbcl
curl -O https://beta.quicklisp.org/quicklisp.lisp
sbcl --load quicklisp.lisp
```

## Step 5: Advanced Topics

### Using Quicklisp to Manage Libraries
Quicklisp makes it easy to install and manage Common LISP libraries. Here is how you can use Quicklisp to install a library and use it in your project.

#### Example: Installing and Using the `cl-ppcre` Library
1. Start SBCL and load Quicklisp:
    ```sh
    sbcl
    (load (expand-file-name "~/quicklisp/setup.lisp"))
    ```

2. Install the `cl-ppcre` library (a regular expression library for Common LISP):
    ```lisp
    (ql:quickload "cl-ppcre")
    ```

3. Use the `cl-ppcre` library in your program:
    ```lisp
    (ql:quickload "cl-ppcre")

    (defun match-pattern (pattern string)
      (cl-ppcre:scan pattern string))

    (format t "~a~%" (match-pattern "world" "Hello, world!"))
    ```

### Creating and Loading ASDF Systems
ASDF (Another System Definition Facility) is a build system for Common LISP that manages dependencies and organizes code into systems.

#### Creating an ASDF System
1. Create a directory for your project:
    ```sh
    mkdir my-lisp-project
    cd my-lisp-project
    ```

2. Create a system definition file named `my-lisp-project.asd`:
    ```sh
    nano my-lisp-project.asd
    ```

3. Add the following code to the file:
    ```lisp
    (defsystem "my-lisp-project"
      :description "A simple Common LISP project"
      :version "0.1"
      :author "Your Name <you@example.com>"
      :license "MIT"
      :depends-on ("cl-ppcre")
      :components ((:file "main")))

    ```

4. Create the main source file named `main.lisp`:
    ```sh
    nano main.lisp
    ```

5. Add the following code to the file:
    ```lisp
    (defun main ()
      (format t "Hello, ASDF!~%"))

    (main)
    ```

6. Load and run the system:
    ```sh
    sbcl
    (load "~/quicklisp/setup.lisp")
    (ql:quickload "my-lisp-project")
    (asdf:load-system "my-lisp-project")
    ```

## Conclusion
You have successfully set up and configured Common LISP programming in Termux, written and compiled Common LISP programs, and learned how to handle common issues. For more advanced usage and features, refer to the official Common LISP, SBCL, and Quicklisp documentation.

Happy coding with Common LISP in Termux!