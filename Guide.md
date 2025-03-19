# Termux Guide

This guide provides an overview of what can be done using Termux, how to use its features, and the possibilities it offers. This document does not promote Termux but serves as an informational resource.

---

## 1. Installation

### **1.1 Downloading Termux**
Termux is not available on the Google Play Store due to policy changes. The recommended way to install it is via:
- **[F-Droid](https://f-droid.org/packages/com.termux/)** – Official and updated version.

- **[GitHub Releases](https://github.com/termux/termux-app/releases)** – Direct APK downloads.

<details>
<summary>
  <h3><strong>Note</strong></h3>
</summary>

> **✅ Using this APK method of installation is recommended.**  
> ⚠️ The Termux version in the Play Store has some issues and bugs.

</details>

---

### **1.2 Updating Termux Packages**
After installation, update the package lists and upgrade existing packages:
```sh
pkg update && pkg upgrade
```

---

## 2. Basic Usage

### **2.1 Package Management**
Termux uses pkg (a wrapper for apt) to install, update, and remove packages.

- Install a package:
  ```sh
  pkg install <package_name>
  ```
- Remove a package:
  ```sh
  pkg uninstall <package_name>
  ```
- Update all installed packages:
  ```sh
  pkg upgrade
  ```

### **2.2 File Management**
Termux provides common Linux file operations.

- List files:
  ```sh
  ls -la
  ```
- Create a new directory:
  ```sh
  mkdir <directory_name>
  ```
- Create a new file:
  ```sh
  touch <file_name>
  ```
- Move or rename a file:
  ```sh
  mv <source> <destination>
  ```
- Delete a file or directory:
  ```sh
  rm -r <file_or_directory>
  ```

### **2.3 Text Editors**
Termux supports multiple text editors:

- Nano (simple text editor)
  ```sh
  nano <file>
  ```
- Vim (advanced editor)
  ```sh
  pkg install vim
  vim <file>
  ```
- Micro (user-friendly CLI editor)
  ```sh
  pkg install micro
  micro <file>
  ```

---

## 3. Development in Termux

### **3.1 Programming Languages**
Termux supports various programming environments:

To execute a script or program:
- Python: 
  ```sh
  python script.py
  ```
- C Compilation: 
  ```sh
  gcc program.c -o output && ./output
  ```
- Node.js: 
  ```sh
  node app.js
  ```

### **3.2 Git & Version Control**
Git is available in Termux for managing repositories.

- Install Git:
  ```sh
  pkg install git
  ```
- Clone a repository:
  ```sh
  git clone <repository_url>
  ```
- Commit and push changes:
  ```sh
  git add .
  git commit -m "Commit message"
  git push
  ```

---

## 4. Networking & Servers

### **4.1 SSH & Remote Access**
Termux allows connecting to remote systems using SSH.

- Install SSH:
  ```sh
  pkg install openssh
  ```
- Start SSH server:
  ```sh
  sshd
  ```
- Connect to a remote server:
  ```sh
  ssh user@host
  ```

### **4.2 Running a Web Server**
A simple HTTP server can be set up using Python.

- Python 3 HTTP Server:
  ```sh
  python -m http.server 8080
  ```

---

## 5. Customization & Automation

### **5.1 Shell Customization**
Termux supports Bash and Zsh customization through .bashrc or .zshrc.

- Edit .bashrc:
  ```sh
  nano ~/.bashrc
  ```
- Reload configuration:
  ```sh
  source ~/.bashrc
  ```

### **5.2 Task Automation**
Termux can automate tasks using cron.

- Install cronie:
  ```sh
  pkg install cronie
  ```
- Start the cron service:
  ```sh
  crond
  ```
- Edit cron jobs:
  ```sh
  crontab -e
  ```

---

## 6. Additional Features & Limitations

### **6.1 Additional Features**
- Supports external keyboard and mouse.
- Can run Linux-based commands.
- Allows running Android scripts via Termux API.

### **6.2 Limitations**
- Cannot access root directories without rooting the device.
- Limited access to Android system features.
- No GUI support unless using VNC.

---

## 7. Useful Commands
- Update package list and upgrade all packages:
  ```sh
  pkg update && pkg upgrade
  ```
- List installed packages:
  ```sh
  pkg list-installed
  ```
- Search for a package:
  ```sh
  pkg search <keyword>
  ```

---

## 8. Resources
- [Termux Wiki](https://wiki.termux.com/wiki/Main_Page)
- [Termux GitHub](https://github.com/termux/termux-app)
- [Termux Reddit Community](https://www.reddit.com/r/termux/)
- [Termux Commands](https://github.com/termux/termux-packages)

---

This guide provides a reference for working with Termux without unnecessary praise. Contributions are welcome to enhance this documentation.
