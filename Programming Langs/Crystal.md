# Crystal Programming in Termux

## Overview
- **Language**: Crystal
- **Compiler**: Crystal compiler
- **File Extension**: .cr
# Crystal Programming in Termux

## Overview
- **Language**: Crystal
- **Compiler**: Crystal compiler (LLVM-based)
- **File Extension**: .cr
- **Package Manager**: Shards
- **First Release**: 2014
- **Paradigm**: Object-oriented, Concurrent
- **Typing**: Static, with type inference

## Description
Crystal is a programming language that aims to have the elegance and productivity of Ruby with the speed and efficiency of C. It features:
- Compile-time type checking
- Native code generation via LLVM
- Null reference checks
- Built-in concurrency support
- Macro system for metaprogramming
- C bindings without overhead

## Installation
```sh
pkg update && pkg upgrade
pkg install crystal

# Install essential dependencies
pkg install pkgconfig openssl-dev
pkg install libxml2-dev yaml-dev
pkg install llvm readline-dev
```

## Package Management
```sh
# Install Shards (Package Manager)
pkg install shards

# Initialize a new project
crystal init app myproject
cd myproject

# Create/Edit shard.yml for dependencies
nano shard.yml

# Install dependencies
shards install
```

## Basic Syntax Examples

### Hello World
```crystal
# Simple hello world
puts "Hello, World!"

# With function
def greet(name : String)
  puts "Hello, #{name}!"
end

greet("Crystal")
```

### Variables and Types
```crystal
# Type inference
name = "Crystal"     # String
age = 9             # Int32
pi = 3.14           # Float64

# Explicit typing
explicit_string : String = "Hello"
numbers : Array(Int32) = [1, 2, 3]
```

### Control Structures
```crystal
# If statement
if age >= 18
  puts "Adult"
else
  puts "Minor"
end

# Loop structures
while count < 10
  puts count
  count += 1
end

# Each loop
[1, 2, 3].each do |num|
  puts num
end
```

## Development Tools

### Testing
```sh
# Initialize spec structure
crystal spec init

# Run tests
crystal spec
```

### Documentation
```sh
# Generate docs
crystal docs

# Serve docs locally
crystal docs --serve
```

### Debugging
```crystal
# Add debugging output
pp some_variable    # Pretty print
p some_variable     # Print inspect

# Add breakpoint
require "debug"
debugger
```

## Common Libraries
- **HTTP::Server**: Web server implementation
- **JSON**: JSON parsing and generation
- **DB**: Database access
- **Spec**: Testing framework
- **Crypto**: Cryptographic operations
- **CSV**: CSV file handling

## Resources
- Official Documentation: https://crystal-lang.org/docs/
- Standard Library API: https://crystal-lang.org/api/
- Crystal Forum: https://forum.crystal-lang.org/
- GitHub Repository: https://github.com/crystal-lang/crystal

## Common Issues in Termux
1. Memory limitations
2. Compilation time
3. Architecture compatibility

## Performance Tips
- Use `--release` flag for optimized builds
- Implement proper type annotations
- Use structs for value types
- Leverage concurrency with `spawn`

## Security Considerations
- Keep Crystal updated
- Review dependencies regularly
- Use proper input validation
- Handle errors appropriately

## Installation
```sh
pkg update && pkg upgrade
pkg install crystal

# Install dependencies
pkg install pkgconfig openssl-dev
```

## Example Program
```crystal
def greet(name : String)
  puts "Hello, #{name}!"
end

greet("World")
```

## Development Tools
```sh
# Install testing framework
crystal spec init
```
