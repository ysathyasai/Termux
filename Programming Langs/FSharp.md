# F# Programming Guide for Termux

This guide explains how to set up and use the F# programming language in Termux. F# is a functional-first programming language that runs on the .NET platform, making it a powerful tool for scripting, data science, and application development. By following this guide, you can write, compile, and run F# programs directly on your Android device.

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
   - [Step 1: Update Termux Packages](#step-1-update-termux-packages)
   - [Step 2: Install .NET SDK](#step-2-install-net-sdk)
   - [Step 3: Install F# Tools](#step-3-install-f-tools)
4. [Writing and Running F# Programs](#writing-and-running-f-programs)
   - [Creating an F# Script](#creating-an-f-script)
   - [Compiling and Running an F# Program](#compiling-and-running-an-f-program)
5. [Example Programs](#example-programs)
6. [Using NuGet for Package Management](#using-nuget-for-package-management)
7. [Troubleshooting](#troubleshooting)
8. [Conclusion](#conclusion)

---

## Overview

F# is a functional-first programming language that integrates seamlessly with the .NET ecosystem. It supports both functional and object-oriented programming paradigms, making it versatile for a wide range of applications. In this guide, we'll set up F# in Termux, write simple programs, and explore how to use NuGet for package management.

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

### Step 2: Install .NET SDK
Install the .NET SDK, which includes the runtime and tools for F#:
```bash
pkg install dotnet-sdk-6.0
```

Verify the installation:
```bash
dotnet --version
```
You should see the installed version of the .NET SDK.

### Step 3: Install F# Tools
Install additional F# tools, such as `fsautocomplete`, for enhanced development:
```bash
dotnet tool install --global fsautocomplete
```

---

## Writing and Running F# Programs

### Creating an F# Script
You can create and run F# scripts (`.fsx`) directly without compiling them.

1. Create a new script file:
   ```bash
   nano hello.fsx
   ```

2. Add the following code:
   ```fsharp
   let hello name = 
       printfn "Hello, %s!" name

   hello "World"
   ```

3. Run the script:
   ```bash
   dotnet fsi hello.fsx
   ```

Output:
```
Hello, World!
```

### Compiling and Running an F# Program
For larger projects, you may want to compile your F# code into an executable.

1. Create a new program file:
   ```bash
   nano hello.fs
   ```

2. Add the following code:
   ```fsharp
   let hello name = 
       printfn "Hello, %s!" name

   [<EntryPoint>]
   let main argv =
       hello "World"
       0
   ```

3. Compile the program:
   ```bash
   dotnet new console -lang F# -o HelloWorld
   cd HelloWorld
   dotnet build
   ```

4. Run the compiled program:
   ```bash
   dotnet run
   ```

Output:
```
Hello, World!
```

---

## Example Programs

### 1. Factorial Function
```fsharp
let rec factorial n =
    if n <= 1 then 1
    else n * factorial (n - 1)

printfn "Factorial of 5 is %d" (factorial 5)
```

Run the script:
```bash
dotnet fsi factorial.fsx
```

Output:
```
Factorial of 5 is 120
```

### 2. List Operations
```fsharp
let numbers = [1; 2; 3; 4; 5]

let squared = List.map (fun x -> x * x) numbers
let sum = List.sum squared

printfn "Squared numbers: %A" squared
printfn "Sum of squares: %d" sum
```

Run the script:
```bash
dotnet fsi list_operations.fsx
```

Output:
```
Squared numbers: [1; 4; 9; 16; 25]
Sum of squares: 55
```

---

## Using NuGet for Package Management

NuGet is the package manager for .NET. You can use it to add libraries and dependencies to your F# projects.

### Adding a Package
1. Create a new project:
   ```bash
   dotnet new console -lang F# -o MyProject
   cd MyProject
   ```

2. Add a package (e.g., `Newtonsoft.Json`):
   ```bash
   dotnet add package Newtonsoft.Json
   ```

3. Use the package in your code:
   ```fsharp
   open Newtonsoft.Json

   let json = JsonConvert.SerializeObject({| Name = "Alice"; Age = 30 |})
   printfn "JSON: %s" json
   ```

4. Run the program:
   ```bash
   dotnet run
   ```

Output:
```
JSON: {"Name":"Alice","Age":30}
```

---

## Troubleshooting

### 1. Command Not Found
- **Cause**: Missing `.NET SDK` or incorrect installation.
- **Solution**:
  - Reinstall the .NET SDK:
    ```bash
    pkg reinstall dotnet-sdk-6.0
    ```

### 2. Compilation Errors
- **Cause**: Syntax errors or missing dependencies.
- **Solution**:
  - Double-check your code for syntax issues.
  - Ensure all required packages are installed using `dotnet add package`.

### 3. Slow Performance
- **Cause**: Limited resources on the Android device.
- **Solution**:
  - Close unnecessary apps to free up memory.
  - Use lightweight scripts for testing.

---

## Conclusion

By following this guide, you can set up and use F# in Termux to write, compile, and run programs. Whether you're experimenting with functional programming, building scripts, or working on larger projects, F# provides a robust and expressive environment. Combine it with NuGet for access to a vast ecosystem of libraries and tools. Enjoy exploring the power of F# on your Android device!