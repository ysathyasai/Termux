# Haskell Programming Guide for Termux

This guide explains how to set up and use the Haskell programming language in Termux. Haskell is a purely functional programming language known for its strong type system and lazy evaluation. By following this guide, you can write, compile, and run Haskell programs directly on your Android device using GHC (Glasgow Haskell Compiler) and Cabal (Haskell's package manager).

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
   - [Step 1: Update Termux Packages](#step-1-update-termux-packages)
   - [Step 2: Install GHC and Cabal](#step-2-install-ghc-and-cabal)
   - [Step 3: Configure Cabal](#step-3-configure-cabal)
4. [Project Structure](#project-structure)
5. [Writing and Running Haskell Programs](#writing-and-running-haskell-programs)
6. [Example Programs](#example-programs)
7. [Troubleshooting](#troubleshooting)
8. [Conclusion](#conclusion)

---

## Overview

Haskell is a powerful functional programming language that emphasizes correctness, modularity, and expressiveness. In this guide, we'll set up Haskell in Termux, configure Cabal for dependency management, create projects, and explore common tools and workflows.

---

## Prerequisites

Before proceeding, ensure the following:

- **Termux App**: Latest version installed from the Play Store or F-Droid.
- **Storage Permission**: Granted to Termux (`termux-setup-storage`).
- **Internet Connection**: A stable internet connection is required for downloading packages and tools.
- **Device Storage**: Ensure sufficient free storage space (at least 1 GB recommended).

---

## Installation

### Step 1: Update Termux Packages
Ensure all Termux packages are up to date:
```bash
pkg update && pkg upgrade
```

### Step 2: Install GHC and Cabal
Install the Glasgow Haskell Compiler (GHC) and Cabal (Haskell's package manager):
```bash
pkg install ghc cabal-install
```

Verify the installation:
```bash
ghc --version
cabal --version
```
You should see the installed versions of GHC and Cabal.

### Step 3: Configure Cabal
Update Cabal's package index and initialize the configuration:
```bash
cabal update
cabal new-update
```

Set up a default Cabal environment:
```bash
cabal install --lib base
```

---

## Project Structure

A typical Haskell project follows this structure:
```
project/
├── src/
│   └── Main.hs       # Entry point for the application
├── test/
│   └── Spec.hs       # Test cases
└── package.yaml      # Package configuration file
```

### Creating a New Project
1. Create a new directory for your project:
   ```bash
   mkdir -p ~/haskell-project
   cd ~/haskell-project
   ```

2. Initialize a Cabal project:
   ```bash
   cabal init
   ```

3. Add files to the `src` and `test` directories as needed.

---

## Writing and Running Haskell Programs

### Creating a Simple Haskell Program
1. Create a `Main.hs` file:
   ```bash
   nano ~/haskell-project/src/Main.hs
   ```

2. Add the following code:
   ```haskell
   module Main where

   main :: IO ()
   main = putStrLn "Hello, Haskell!"
   ```

3. Compile and run the program:
   ```bash
   ghc -o hello ~/haskell-project/src/Main.hs
   ./hello
   ```

Output:
```
Hello, Haskell!
```

### Using Cabal to Build and Run
1. Build the project with Cabal:
   ```bash
   cabal build
   ```

2. Run the compiled executable:
   ```bash
   cabal run
   ```

Output:
```
Hello, Haskell!
```

---

## Example Programs

### 1. Factorial Function
Calculate factorial using recursion:
```haskell
module Main where

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

main :: IO ()
main = print (factorial 5)
```

Run the program:
```bash
ghc -o factorial Main.hs
./factorial
```

Output:
```
120
```

### 2. Sum of List
Calculate the sum of a list:
```haskell
module Main where

sumList :: [Int] -> Int
sumList [] = 0
sumList (x:xs) = x + sumList xs

main :: IO ()
main = print (sumList [1, 2, 3, 4, 5])
```

Run the program:
```bash
ghc -o sumlist Main.hs
./sumlist
```

Output:
```
15
```

---

## Troubleshooting

### 1. Build Dependencies
- **Cause**: Missing dependencies like `llvm` or `make`.
- **Solution**:
  Install the required tools:
  ```bash
  pkg install llvm make
  ```

### 2. Memory Issues
- **Cause**: Limited memory on Android devices causing GHC to crash.
- **Solution**:
  Limit GHC's memory usage:
  ```bash
  export GHCRTS="-M2G"
  ```

### 3. Cabal Errors
- **Cause**: Outdated package index or missing libraries.
- **Solution**:
  Update Cabal's package index:
  ```bash
  cabal update
  ```

### 4. Slow Compilation
- **Cause**: High resource usage during compilation.
- **Solution**:
  Close unnecessary apps to free up memory.
  Use lightweight scripts for testing.

---

## Conclusion

By following this guide, you can set up and use Haskell in Termux to write, compile, and run programs. Whether you're experimenting with functional programming, building CLI tools, or learning advanced concepts, Haskell provides a robust and expressive environment. Combine it with Cabal for dependency management and seamless project workflows. Enjoy exploring the power of Haskell on your Android device!