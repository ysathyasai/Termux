# Swift Programming Guide for Termux

This guide explains how to set up and use the Swift programming language in Termux. Swift is a powerful and intuitive language developed by Apple, widely used for iOS/macOS app development and server-side applications. By following this guide, you can write, compile, and run Swift programs directly on your Android device.

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
   - [Step 1: Update Termux Packages](#step-1-update-termux-packages)
   - [Step 2: Install Swift](#step-2-install-swift)
   - [Step 3: Install Dependencies](#step-3-install-dependencies)
4. [Project Structure](#project-structure)
5. [Writing and Running Swift Programs](#writing-and-running-swift-programs)
6. [Example Programs](#example-programs)
7. [Development Tools](#development-tools)
8. [Troubleshooting](#troubleshooting)
9. [Additional Resources](#additional-resources)
10. [Conclusion](#conclusion)

---

## Overview

Swift is a modern, fast, and safe programming language designed for building applications across Apple platforms and beyond. It is known for its readability, performance, and robust ecosystem. In this guide, we'll set up Swift in Termux, configure essential tools, create projects, and explore common workflows for development.

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

### Step 2: Install Swift
Install Swift using the Termux package manager:
```bash
pkg install swift
```

Verify the installation:
```bash
swift --version
```
You should see the installed version of Swift (e.g., `Swift version 5.x.x`).

### Step 3: Install Dependencies
Install additional tools required for Swift development:
```bash
pkg install clang cmake ninja llvm
```

---

## Project Structure

A typical Swift project follows this structure:
```
project/
├── Sources/
│   └── main.swift       # Entry point for the application
├── Tests/
│   └── MainTests/       # Unit test cases
└── Package.swift        # Project metadata and dependencies
```

### Creating a New Project
1. Create a new directory for your project:
   ```bash
   mkdir ~/swift-project
   cd ~/swift-project
   ```

2. Initialize a new Swift project:
   ```bash
   swift package init --type executable
   ```

3. Explore the project structure:
   - `Sources/main.swift`: Contains the entry point of your application.
   - `Tests/MainTests/`: Contains unit test cases.
   - `Package.swift`: Defines project metadata and dependencies.

---

## Writing and Running Swift Programs

### Hello World Example
Edit the `Sources/main.swift` file:
```swift
print("Hello, Swift!")
```

Build and run the program:
```bash
swift run
```

Output:
```
Hello, Swift!
```

### Using Package Dependencies
Add dependencies to your `Package.swift` file:
```swift
// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "MySwiftProject",
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "MySwiftProject",
            dependencies: ["NIO"]),
    ]
)
```

Resolve and fetch dependencies:
```bash
swift package resolve
```

Build the project:
```bash
swift build
```

Run the project:
```bash
swift run
```

---

## Example Programs

### 1. Fibonacci Function
Calculate Fibonacci numbers:
```swift
func fibonacci(_ n: Int) -> Int {
    if n <= 1 { return n }
    return fibonacci(n - 1) + fibonacci(n - 2)
}

print("Fibonacci of 10: \(fibonacci(10))")
```

Build and run:
```bash
swift run
```

Output:
```
Fibonacci of 10: 55
```

### 2. HTTP Server with SwiftNIO
Create a simple HTTP server using the `SwiftNIO` library:

1. Add `SwiftNIO` to your `Package.swift`:
   ```swift
   dependencies: [
       .package(url: "https://github.com/apple/swift-nio.git", from: "2.0.0")
   ],
   ```

2. Edit `Sources/main.swift`:
   ```swift
   import NIO
   import NIOHTTP1

   let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
   defer { try! group.syncShutdownGracefully() }

   let bootstrap = ServerBootstrap(group: group)
       .serverChannelOption(ChannelOptions.backlog, value: 256)
       .serverChannelOption(ChannelOptions.socket(SocketOptionLevel(SOL_SOCKET), SO_REUSEADDR), value: 1)
       .childChannelInitializer { channel in
           channel.pipeline.configureHTTPServerPipeline(withErrorHandling: true).flatMap {
               channel.pipeline.addHandler(HTTPHandler())
           }
       }

   let channel = try! bootstrap.bind(host: "127.0.0.1", port: 8080).wait()
   print("Server running at http://127.0.0.1:8080")
   try! channel.closeFuture.wait()

   final class HTTPHandler: ChannelInboundHandler {
       typealias InboundIn = HTTPServerRequestPart
       typealias OutboundOut = HTTPServerResponsePart

       func channelRead(context: ChannelHandlerContext, data: NIOAny) {
           let reqPart = self.unwrapInboundIn(data)
           switch reqPart {
           case .head(let head):
               var buffer = context.channel.allocator.buffer(capacity: 0)
               buffer.writeString("Hello, Swift!")
               let responseHead = HTTPResponseHead(version: head.version, status: .ok)
               context.write(self.wrapOutboundOut(.head(responseHead)), promise: nil)
               context.write(self.wrapOutboundOut(.body(.byteBuffer(buffer))), promise: nil)
               context.writeAndFlush(self.wrapOutboundOut(.end(nil)), promise: nil)
           default:
               break
           }
       }
   }
   ```

3. Build and run:
   ```bash
   swift run
   ```

Open a browser and navigate to `http://127.0.0.1:8080` to see the message `Hello, Swift!`.

---

## Development Tools

### Install SwiftLint
SwiftLint is a tool for enforcing Swift style and conventions:
```bash
git clone https://github.com/realm/SwiftLint.git
cd SwiftLint
make
```

Run SwiftLint on your project:
```bash
swiftlint
```

---

## Troubleshooting

### 1. Build Issues
- **Cause**: Missing build tools like `clang` or `llvm`.
- **Solution**:
  Install the required tools:
  ```bash
  pkg install llvm
  ```

### 2. Package Dependencies
- **Cause**: Dependency resolution fails due to network issues or missing packages.
- **Solution**:
  Resolve dependencies manually:
  ```bash
  swift package resolve
  ```

### 3. Slow Compilation
- **Cause**: High resource usage during compilation.
- **Solution**:
  Close unnecessary apps to free up memory.
  Use lightweight scripts for testing.

---

## Additional Resources

- [Swift Documentation](https://www.swift.org/documentation/)
- [Swift Package Manager](https://swift.org/package-manager/)
- [SwiftNIO Documentation](https://github.com/apple/swift-nio)
- [SwiftLint Documentation](https://github.com/realm/SwiftLint)

---

## Conclusion

By following this guide, you can set up and use Swift in Termux to write, compile, and run programs. Whether you're building command-line tools, web servers, or experimenting with Swift's features, this setup provides a robust environment for Swift development. Combine it with tools like `SwiftLint` and `SwiftNIO` for a seamless workflow. Enjoy exploring the power of Swift on your Android device!