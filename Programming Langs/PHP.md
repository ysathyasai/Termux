# PHP Programming Guide for Termux

This guide explains how to set up and use the PHP programming language in Termux. PHP is a widely-used server-side scripting language designed for web development but also used for general-purpose programming. By following this guide, you can write, run, and debug PHP programs directly on your Android device.

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
   - [Step 1: Update Termux Packages](#step-1-update-termux-packages)
   - [Step 2: Install PHP](#step-2-install-php)
   - [Step 3: Install Composer](#step-3-install-composer)
4. [Development Tools](#development-tools)
5. [Project Structure](#project-structure)
6. [Writing and Running PHP Programs](#writing-and-running-php-programs)
7. [Example Programs](#example-programs)
8. [Troubleshooting](#troubleshooting)
9. [Additional Resources](#additional-resources)
10. [Conclusion](#conclusion)

---

## Overview

PHP is a versatile scripting language primarily used for web development. It powers dynamic websites, APIs, and backend services. In this guide, we'll set up PHP in Termux, configure essential tools like Composer, create projects, and explore common workflows for development.

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

### Step 2: Install PHP
Install PHP and its Apache module:
```bash
pkg install php php-apache
```

Verify the installation:
```bash
php --version
```
You should see the installed version of PHP (e.g., `PHP 8.x.x`).

### Step 3: Install Composer
Composer is a dependency manager for PHP. Install it as follows:
```bash
curl -sS https://getcomposer.org/installer | php
mv composer.phar $PREFIX/bin/composer
```

Verify the installation:
```bash
composer --version
```

---

## Development Tools

### Install Common Extensions
Install commonly used PHP extensions:
```bash
pkg install php-mysql php-xml
```

### Install Testing and Code Quality Tools
Install PHPUnit for testing and PHP_CodeSniffer for code quality checks:
```bash
composer global require phpunit/phpunit squizlabs/php_codesniffer
```

Add Composer's global binaries to your PATH:
```bash
echo 'export PATH="$HOME/.composer/vendor/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

Verify the tools:
```bash
phpunit --version
phpcs --version
```

---

## Project Structure

A typical PHP project follows this structure:
```
project/
├── src/
│   └── index.php       # Main entry point
├── tests/
│   └── TestCase.php    # Test cases
└── composer.json       # Project metadata and dependencies
```

### Creating a New Project
1. Create a new directory for your project:
   ```bash
   mkdir ~/php-project
   cd ~/php-project
   ```

2. Initialize a `composer.json` file:
   ```bash
   composer init
   ```

3. Add dependencies as needed:
   ```bash
   composer require monolog/monolog
   ```

4. Create a `src/index.php` file:
   ```bash
   nano src/index.php
   ```

5. Add the following code:
   ```php
   <?php
   echo "Hello, PHP!";
   ```

---

## Writing and Running PHP Programs

### Running a PHP Script
Run a PHP script directly:
```bash
php src/index.php
```

Output:
```
Hello, PHP!
```

### Using PHP Built-in Web Server
Start a local web server:
```bash
php -S localhost:8080 -t src/
```

Open a browser and navigate to `http://localhost:8080` to see the output.

---

## Example Programs

### 1. Simple Web Page
Create a simple web page:
```php
<?php
echo "<h1>Welcome to PHP in Termux!</h1>";
?>
```

Run the built-in server:
```bash
php -S localhost:8080 -t src/
```

Visit `http://localhost:8080` to see the result.

### 2. Database Connection
Connect to a MySQL database:
```php
<?php
$host = 'localhost';
$dbname = 'testdb';
$user = 'root';
$pass = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);
    echo "Connected successfully!";
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
?>
```

---

## Troubleshooting

### 1. Memory Limits
- **Cause**: Default memory limit is too low for large scripts.
- **Solution**:
  Increase the memory limit:
  ```bash
  echo "memory_limit = 256M" >> $PREFIX/etc/php.ini
  ```

### 2. Extension Issues
- **Cause**: Missing PHP extensions for specific functionality.
- **Solution**:
  Install the required extensions:
  ```bash
  pkg install php-fpm php-sodium
  ```

### 3. Composer Errors
- **Cause**: Network issues or outdated Composer.
- **Solution**:
  Update Composer:
  ```bash
  composer self-update
  ```

### 4. Slow Performance
- **Cause**: High resource usage during execution.
- **Solution**:
  Close unnecessary apps to free up memory.
  Use lightweight scripts for testing.

---

## Additional Resources

- [PHP Documentation](https://www.php.net/docs.php)
- [Composer Documentation](https://getcomposer.org/doc/)
- [PHPUnit Documentation](https://phpunit.de/documentation.html)
- [PHP_CodeSniffer Documentation](https://github.com/squizlabs/PHP_CodeSniffer)

---

## Conclusion

By following this guide, you can set up and use PHP in Termux to write, run, and debug programs. Whether you're building web applications, experimenting with APIs, or automating tasks, this setup provides a robust environment for PHP development. Combine it with tools like Composer, PHPUnit, and PHP_CodeSniffer for a professional workflow. Enjoy exploring the power of PHP on your Android device!