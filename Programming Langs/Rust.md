# Rust Programming Guide for Termux

This guide explains how to set up and use the Rust programming language in Termux. Rust is a systems programming language known for its safety, performance, and concurrency. By following this guide, you can write, compile, and run Rust programs directly on your Android device.

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
   - [Step 1: Update Termux Packages](#step-1-update-termux-packages)
   - [Step 2: Install Rust](#step-2-install-rust)
   - [Step 3: Install Development Tools](#step-3-install-development-tools)
4. [Project Structure](#project-structure)
5. [Writing and Running Rust Programs](#writing-and-running-rust-programs)
6. [Example Programs](#example-programs)
7. [Troubleshooting](#troubleshooting)
8. [Additional Resources](#additional-resources)
9. [Conclusion](#conclusion)

---

## Overview

Rust is a modern systems programming language designed for performance, safety, and concurrency. It is widely used for building web servers, command-line tools, operating systems, and more. In this guide, we'll set up Rust in Termux, configure essential tools, create projects, and explore common workflows for development.

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

### Step 2: Install Rust
Install Rust using the Termux package manager:
```bash
pkg install rust
```

Verify the installation:
```bash
rustc --version
cargo --version
```
You should see the installed versions of `rustc` (the Rust compiler) and `cargo` (Rust's package manager).

### Step 3: Install Development Tools
Install additional tools for Rust development:

1. Install `cargo-edit` for managing dependencies:
   ```bash
   cargo install cargo-edit
   ```

2. Install `cargo-watch` for automatically rebuilding your project on file changes:
   ```bash
   cargo install cargo-watch
   ```

3. Install `clippy` for linting and code quality checks:
   ```bash
   cargo install clippy
   ```

4. Install `rustfmt` for code formatting:
   ```bash
   cargo install rustfmt
   ```

---

## Project Structure

A typical Rust project follows this structure:
```
project/
├── src/
│   └── main.rs       # Entry point for the application
├── tests/
│   └── integration_test.rs  # Integration test cases
└── Cargo.toml        # Project metadata and dependencies
```

### Creating a New Project
1. Create a new directory for your project:
   ```bash
   mkdir ~/rust-project
   cd ~/rust-project
   ```

2. Initialize a new Rust project:
   ```bash
   cargo new my_project
   cd my_project
   ```

3. Explore the project structure:
   - `src/main.rs`: Contains the entry point of your application.
   - `Cargo.toml`: Defines project metadata and dependencies.

---

## Writing and Running Rust Programs

### Hello World Example
Edit the `src/main.rs` file:
```rust
fn main() {
    println!("Hello, Rust!");
}
```

Build and run the program:
```bash
cargo run
```

Output:
```
Hello, Rust!
```

### Using Cargo Watch
Automatically rebuild and run your program when files change:
```bash
cargo watch -x run
```

---

## Example Programs

### 1. Fibonacci Function
Calculate Fibonacci numbers:
```rust
fn fibonacci(n: u32) -> u32 {
    if n <= 1 {
        return n;
    }
    fibonacci(n - 1) + fibonacci(n - 2)
}

fn main() {
    let result = fibonacci(10);
    println!("Fibonacci of 10: {}", result);
}
```

Build and run:
```bash
cargo run
```

Output:
```
Fibonacci of 10: 55
```

### 2. HTTP Server with `hyper`
Create a simple HTTP server using the `hyper` crate:

1. Add `hyper` to your `Cargo.toml`:
   ```toml
   [dependencies]
   hyper = "0.14"
   tokio = { version = "1", features = ["full"] }
   ```

2. Edit `src/main.rs`:
   ```rust
   use hyper::service::{make_service_fn, service_fn};
   use hyper::{Body, Request, Response, Server};
   use std::convert::Infallible;

   async fn handle_request(_req: Request<Body>) -> Result<Response<Body>, Infallible> {
       Ok(Response::new(Body::from("Hello, Rust!")))
   }

   #[tokio::main]
   async fn main() -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
       let addr = ([127, 0, 0, 1], 3000).into();
       let make_svc = make_service_fn(|_conn| async { Ok::<_, Infallible>(service_fn(handle_request)) });

       let server = Server::bind(&addr).serve(make_svc);
       println!("Server running at http://127.0.0.1:3000");
       server.await?;
       Ok(())
   }
   ```

3. Build and run:
   ```bash
   cargo run
   ```

Open a browser and navigate to `http://127.0.0.1:3000` to see the message `Hello, Rust!`.

---

## Troubleshooting

### 1. Linker Errors
- **Cause**: Missing linker tools like `binutils`.
- **Solution**:
  Install the required tools:
  ```bash
  pkg install binutils
  ```

### 2. Build Dependencies
- **Cause**: Missing build tools like `gcc` or `make`.
- **Solution**:
  Install the build essentials:
  ```bash
  pkg install build-essential
  ```

### 3. Slow Compilation
- **Cause**: High resource usage during compilation.
- **Solution**:
  Close unnecessary apps to free up memory.
  Use lightweight scripts for testing.

---

## Additional Resources

- [Rust Documentation](https://doc.rust-lang.org/)
- [Cargo Documentation](https://doc.rust-lang.org/cargo/)
- [Clippy Documentation](https://github.com/rust-lang/rust-clippy)
- [Rustfmt Documentation](https://github.com/rust-lang/rustfmt)

---

## Conclusion

By following this guide, you can set up and use Rust in Termux to write, compile, and run programs. Whether you're building command-line tools, web servers, or experimenting with systems programming, this setup provides a robust environment for Rust development. Combine it with tools like `cargo-watch`, `clippy`, and `rustfmt` for a seamless workflow. Enjoy exploring the power of Rust on your Android device!