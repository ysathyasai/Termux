# Julia Programming Guide for Termux

This guide explains how to set up and use the Julia programming language in Termux. Julia is a high-performance programming language designed for scientific computing, data analysis, and numerical simulations. By following this guide, you can write, run, and debug Julia programs directly on your Android device.

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
   - [Step 1: Update Termux Packages](#step-1-update-termux-packages)
   - [Step 2: Install Julia](#step-2-install-julia)
   - [Step 3: Install Essential Packages](#step-3-install-essential-packages)
4. [Project Structure](#project-structure)
5. [Writing and Running Julia Programs](#writing-and-running-julia-programs)
6. [Example Programs](#example-programs)
7. [Troubleshooting](#troubleshooting)
8. [Additional Resources](#additional-resources)
9. [Conclusion](#conclusion)

---

## Overview

Julia is a modern programming language known for its speed, ease of use, and rich ecosystem for scientific computing. In this guide, we'll set up Julia in Termux, configure essential packages, create projects, and explore common workflows for development.

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

### Step 2: Install Julia
Install Julia using the Termux package manager:
```bash
pkg install julia
```

Verify the installation:
```bash
julia --version
```
You should see the installed version of Julia (e.g., `1.x.x`).

### Step 3: Install Essential Packages
Start Julia and install commonly used packages such as `DataFrames` and `Plots`:
```bash
julia -e 'using Pkg; Pkg.add(["DataFrames", "Plots"])'
```

- **Explanation**:
  - `Pkg`: Julia's built-in package manager.
  - `DataFrames`: For working with tabular data.
  - `Plots`: For creating visualizations.

---

## Project Structure

A typical Julia project follows this structure:
```
project/
├── src/
│   └── main.jl       # Entry point for the application
├── test/
│   └── runtests.jl   # Test cases
└── Project.toml      # Project metadata and dependencies
```

### Creating a New Project
1. Create a new directory for your project:
   ```bash
   mkdir -p ~/julia-project
   cd ~/julia-project
   ```

2. Initialize a Julia project:
   ```bash
   julia --project=.
   ```

3. Add dependencies:
   ```julia
   using Pkg
   Pkg.add("DataFrames")
   Pkg.add("Plots")
   ```

4. Exit Julia:
   ```julia
   exit()
   ```

---

## Writing and Running Julia Programs

### Creating a Simple Julia Program
1. Create a `main.jl` file:
   ```bash
   nano ~/julia-project/src/main.jl
   ```

2. Add the following code:
   ```julia
   println("Hello, Julia!")
   ```

3. Run the program:
   ```bash
   julia ~/julia-project/src/main.jl
   ```

Output:
```
Hello, Julia!
```

### Using Packages
Here’s an example of using the `DataFrames` package:
```julia
using DataFrames

df = DataFrame(A = 1:3, B = ["x", "y", "z"])
println(df)
```

Run the program:
```bash
julia script.jl
```

Output:
```
3×2 DataFrame
 Row │ A      B      
     │ Int64  String 
─────┼───────────────
   1 │     1  x
   2 │     2  y
   3 │     3  z
```

---

## Example Programs

### 1. Fibonacci Function
Calculate Fibonacci numbers:
```julia
function fibonacci(n::Int)::Int
    if n <= 1
        return n
    end
    return fibonacci(n - 1) + fibonacci(n - 2)
end

println("Fibonacci of 10: ", fibonacci(10))
```

Run the program:
```bash
julia fibonacci.jl
```

Output:
```
Fibonacci of 10: 55
```

### 2. Plotting with Plots
Create a simple plot:
```julia
using Plots

x = 1:10
y = x.^2
plot(x, y, label="y = x^2", title="Simple Plot")
savefig("plot.png")
```

Run the program:
```bash
julia plot.jl
```

The plot will be saved as `plot.png`.

---

## Troubleshooting

### 1. Memory Issues
- **Cause**: Limited memory on Android devices causing Julia to crash.
- **Solution**:
  Limit Julia's thread usage:
  ```bash
  export JULIA_NUM_THREADS=2
  ```

### 2. Package Installation Fails
- **Cause**: Network issues or outdated package registry.
- **Solution**:
  Update the package registry:
  ```julia
  using Pkg
  Pkg.update()
  ```

### 3. Slow Performance
- **Cause**: High resource usage during computation.
- **Solution**:
  Close unnecessary apps to free up memory.
  Use lightweight scripts for testing.

### 4. Missing Dependencies
- **Cause**: Required packages not installed.
- **Solution**:
  Install missing packages using `Pkg.add()`.

---

## Additional Resources

- [Julia Documentation](https://docs.julialang.org/)
- [Julia Packages](https://pkg.julialang.org/)
- [Plots Documentation](https://docs.juliaplots.org/)
- [DataFrames Documentation](https://dataframes.juliadata.org/)

---

## Conclusion

By following this guide, you can set up and use Julia in Termux to write, run, and debug programs. Whether you're performing data analysis, creating visualizations, or experimenting with numerical simulations, Julia provides a powerful and efficient environment. Combine it with tools like `DataFrames` and `Plots` for advanced workflows. Enjoy exploring the power of Julia on your Android device!