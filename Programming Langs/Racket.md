# Racket Programming in Termux

## Overview
Racket is a general-purpose, multi-paradigm programming language in the Lisp-Scheme family. It is designed to be a platform for programming language design and implementation. In Termux, you can use Racket for scripting, programming, and teaching.

- **Language**: Racket
- **Platform**: DrRacket
- **File Extension**: `.rkt`
- **Package Name**: `racket`

## Step 1: Installing Racket

### Update and Upgrade Termux Packages
Before installing new packages, it's a good practice to update and upgrade your existing packages:
```sh
pkg update && pkg upgrade
```

### Install Racket
To install Racket, run the following command:
```sh
pkg install racket
```

### Install Package Manager
Racket uses `raco` as its package manager. To install the package manager, run the following command:
```sh
raco pkg install --auto pkg
```

### Verify Installation
To verify that Racket has been installed correctly, you can check the version:
```sh
racket --version
```

## Step 2: Writing and Running Racket Programs

### Example Program
Create a simple "Hello, World!" program in Racket.

1. Open Termux and create a new file named `hello.rkt` using a text editor like `nano` or `vi`:
    ```sh
    nano hello.rkt
    ```

2. Add the following code to the file:
    ```racket
    #lang racket

    (define (hello name)
      (printf "Hello, ~a!~n" name))

    (hello "World")
    ```

3. Save the file and exit the editor (`Ctrl + X` in nano, `:wq` in vi).

### Running the Racket Program
To run the Racket program, use the `racket` command:
```sh
racket hello.rkt
```

Output:
```
Hello, World!
```

## Step 3: Common Issues & Solutions

### Issue 1: Package Installation
If you encounter issues while installing packages, you may need to set up the documentation index:
```sh
raco setup --doc-index
```

### Issue 2: Missing Dependencies
If a package requires additional system dependencies, install them using Termux's package manager. For example:
```sh
pkg install gcc
```

### Issue 3: Racket Session Crashes
If Racket crashes during a session, try increasing the available memory for Termux or using smaller programs.

## Step 4: Advanced Topics

### Using Racket Modules
Racket supports modular programming. You can create and use modules to organize your code.

#### Example Module (`math-utils.rkt`)
1. Create a new file named `math-utils.rkt`:
    ```sh
    nano math-utils.rkt
    ```

2. Add the following code to the file:
    ```racket
    #lang racket

    (provide add subtract)

    (define (add x y)
      (+ x y))

    (define (subtract x y)
      (- x y))
    ```

3. Save the file and exit the editor.

#### Using the Module in Your Program
1. Create a new file named `main.rkt`:
    ```sh
    nano main.rkt
    ```

2. Add the following code to the file:
    ```racket
    #lang racket
    (require "math-utils.rkt")

    (printf "5 + 3 = ~a~n" (add 5 3))
    (printf "5 - 3 = ~a~n" (subtract 5 3))
    ```

3. Save the file and exit the editor.

4. Run the program:
    ```sh
    racket main.rkt
    ```

Output:
```
5 + 3 = 8
5 - 3 = 2
```

## Additional Resources

- [Racket Documentation](https://docs.racket-lang.org/)
- [Racket Guide](https://docs.racket-lang.org/guide/)
- [Racket Reference](https://docs.racket-lang.org/reference/)
- [DrRacket IDE](https://racket-lang.org/dr-racket.html)

## Conclusion

By following this guide, you can set up and use Racket in Termux to write, run, and debug programs. Whether you are exploring functional programming, creating scripts, or developing applications, this setup provides a robust environment for Racket development. Enjoy exploring the capabilities of Racket on your Android device!
