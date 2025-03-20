# Ruby Programming Guide for Termux

This guide explains how to set up and use the Ruby programming language in Termux. Ruby is a dynamic, object-oriented programming language known for its simplicity and productivity. By following this guide, you can write, run, and debug Ruby programs directly on your Android device.

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
   - [Step 1: Update Termux Packages](#step-1-update-termux-packages)
   - [Step 2: Install Ruby](#step-2-install-ruby)
4. [Development Environment](#development-environment)
   - [Essential Tools](#essential-tools)
   - [Version Management](#version-management)
5. [Project Structure](#project-structure)
6. [Writing and Running Ruby Programs](#writing-and-running-ruby-programs)
7. [Example Programs](#example-programs)
8. [Troubleshooting](#troubleshooting)
9. [Additional Resources](#additional-resources)
10. [Conclusion](#conclusion)

---

## Overview

Ruby is a versatile programming language that emphasizes simplicity and productivity. It is widely used for web development (e.g., Ruby on Rails), scripting, automation, and more. In this guide, we'll set up Ruby in Termux, configure essential tools, create projects, and explore common workflows for development.

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

### Step 2: Install Ruby
Install Ruby using the Termux package manager:
```bash
pkg install ruby
```

Verify the installation:
```bash
ruby --version
```
You should see the installed version of Ruby (e.g., `ruby 3.x.x`).

---

## Development Environment

### Essential Tools

Install essential tools for Ruby development:

1. Update RubyGems (Ruby's package manager):
   ```bash
   gem update --system
   ```

2. Install Bundler for dependency management:
   ```bash
   gem install bundler
   ```

3. Install Solargraph for code intelligence:
   ```bash
   gem install solargraph
   ```

4. Install RuboCop for linting and code quality checks:
   ```bash
   gem install rubocop
   ```

---

## Version Management

Use **rbenv** to manage multiple Ruby versions:

1. Install `rbenv`:
   ```bash
   pkg install rbenv
   ```

2. Initialize `rbenv`:
   ```bash
   rbenv init
   ```

3. Add `rbenv` to your shell configuration:
   ```bash
   echo 'eval "$(rbenv init -)"' >> ~/.bashrc
   source ~/.bashrc
   ```

4. Install different Ruby versions:
   ```bash
   rbenv install 2.7.0
   rbenv install 3.0.0
   ```

5. Set a global Ruby version:
   ```bash
   rbenv global 3.0.0
   ```

6. Verify the selected Ruby version:
   ```bash
   ruby --version
   ```

---

## Project Structure

A typical Ruby project follows this structure:
```
project/
├── lib/
│   └── main.rb       # Main entry point
├── spec/
│   └── main_spec.rb  # Test cases
└── Gemfile           # Dependency management
```

### Creating a New Project
1. Create a new directory for your project:
   ```bash
   mkdir ~/ruby-project
   cd ~/ruby-project
   ```

2. Create a `Gemfile`:
   ```bash
   nano Gemfile
   ```

3. Add dependencies to the `Gemfile`:
   ```ruby
   source 'https://rubygems.org'

   gem 'rspec'
   ```

4. Install dependencies:
   ```bash
   bundle install
   ```

5. Create a `lib/main.rb` file:
   ```bash
   nano lib/main.rb
   ```

6. Add the following code:
   ```ruby
   def greet(name)
     "Hello, #{name}!"
   end

   puts greet("World")
   ```

7. Run the program:
   ```bash
   ruby lib/main.rb
   ```

Output:
```
Hello, World!
```

---

## Writing and Running Ruby Programs

### Hello World Example
Create a simple Ruby program:
```ruby
puts "Hello, Ruby!"
```

Run the program:
```bash
ruby hello.rb
```

Output:
```
Hello, Ruby!
```

### Using Gems
Install and use gems (libraries) in your Ruby programs. For example, install the `nokogiri` gem for XML parsing:
```bash
gem install nokogiri
```

Write a script to parse an XML file:
```ruby
require 'nokogiri'

xml = <<-XML
<root>
  <item>Item 1</item>
  <item>Item 2</item>
</root>
XML

doc = Nokogiri::XML(xml)
doc.xpath('//item').each do |item|
  puts item.text
end
```

Run the script:
```bash
ruby parse_xml.rb
```

Output:
```
Item 1
Item 2
```

---

## Troubleshooting

### 1. Gem Installation Fails
- **Cause**: Missing development tools like `ruby-dev`, `make`, or `clang`.
- **Solution**:
  Install the required tools:
  ```bash
  pkg install ruby-dev make clang
  ```

### 2. SSL Problems
- **Cause**: SSL certificate issues during gem installation.
- **Solution**:
  Install OpenSSL tools:
  ```bash
  pkg install openssl-tool
  ```

### 3. Slow Performance
- **Cause**: High resource usage during execution.
- **Solution**:
  Close unnecessary apps to free up memory.
  Use lightweight scripts for testing.

---

## Additional Resources

- [Ruby Documentation](https://www.ruby-lang.org/en/documentation/)
- [RubyGems Documentation](https://guides.rubygems.org/)
- [RSpec Documentation](https://rspec.info/documentation/)
- [RuboCop Documentation](https://docs.rubocop.org/)

---

## Conclusion

By following this guide, you can set up and use Ruby in Termux to write, run, and debug programs. Whether you're building web applications, automating tasks, or experimenting with libraries, this setup provides a robust environment for Ruby development. Combine it with tools like `Bundler`, `RSpec`, and `RuboCop` for a professional workflow. Enjoy exploring the power of Ruby on your Android device!