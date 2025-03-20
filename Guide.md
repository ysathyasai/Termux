# Termux Overall Guide

Welcome to **Termux**, the powerful terminal emulator and Linux environment for Android! This guide will walk you through everything you need to know about Termux, from basic setup to advanced usage. Whether you're a beginner or an experienced user, this guide will help you unlock the full potential of Termux.

---

## Table of Contents

1. [What is Termux?](#what-is-termux)
2. [Why Use Termux?](#why-use-termux)
3. [Getting Started](#getting-started)
   - [Installation](#installation)
   - [Basic Setup](#basic-setup)
   - [Granting Storage Permissions](#granting-storage-permissions)
4. [Essential Tools and Commands](#essential-tools-and-commands)
5. [Customizing Your Environment](#customizing-your-environment)
6. [Automation and Productivity](#automation-and-productivity)
7. [Networking and Security](#networking-and-security)
8. [Programming and Development](#programming-and-development)
9. [Backup and Restore](#backup-and-restore)
10. [Troubleshooting](#troubleshooting)
11. [Resources](#resources)

---

## What is Termux?

Termux is a terminal emulator and Linux environment app for Android. It allows you to run a full-fledged Linux shell directly on your Android device without requiring root access. With Termux, you can:

- Install and use popular Linux packages.
- Develop software using programming languages like Python, C++, and JavaScript.
- Perform system administration tasks.
- Automate workflows with scripts.
- Explore networking, security, and multimedia tools.

---

## Why Use Termux?

- **Portability**: Carry a Linux environment in your pocket.
- **Versatility**: Supports development, automation, networking, and more.
- **No Root Required**: Works seamlessly on non-rooted devices.
- **Open Source**: Fully customizable and community-driven.

---

## Getting Started

### Installation

1. Download Termux from the official source:
   - [F-Droid](https://f-droid.org/en/packages/com.termux/)
   - [GitHub Releases](https://github.com/termux/termux-app/releases)
2. Install the app and launch it.


<details>
<summary>
  <h3><strong>Note</strong></h3>
</summary>

> **✅ Using this APK method of installation is recommended.**  
> ⚠️ The Termux version in the Play Store has some issues and bugs.

</details>

### Basic Setup

Once installed, update and upgrade the package lists to ensure you have the latest tools:

```sh
pkg update && pkg upgrade -y
```

Install essential tools like `git`, `curl`, and `vim`:

```sh
pkg install git curl vim -y
```

### Granting Storage Permissions

To access your device's storage, run:

```sh
termux-setup-storage
```

This creates a symbolic link to your device's storage at `~/storage`.

---

## Essential Tools and Commands

Here are some essential tools and commands to get started:

- **Package Management**:
  ```sh
  pkg install <package_name>    # Install a package
  pkg uninstall <package_name>  # Remove a package
  pkg list-installed            # List installed packages
  ```

- **File Navigation**:
  ```sh
  ls                           # List files and directories
  cd <directory>               # Change directory
  cp <source> <destination>     # Copy files
  mv <source> <destination>     # Move or rename files
  rm <file>                    # Remove a file
  ```

- **System Monitoring**:
  ```sh
  htop                         # Interactive process viewer
  df -h                        # Check disk usage
  free -h                      # Check memory usage
  ```

- **Text Editors**:
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

## Customizing Your Environment

Termux is highly customizable. Here are some ways to personalize your setup:

- **Shell Customization**:
  Modify your `.bashrc` or `.zshrc` file to add aliases, themes, and custom prompts.
  ```sh
  nano ~/.bashrc
  ```
  Example alias:
  ```sh
  alias ll='ls -la'
  ```

- **Themes and Fonts**:
  Install custom fonts and themes like Dracula, Nord, or Gruvbox for a visually appealing experience.

- **Oh My Zsh**:
  Install Oh My Zsh for enhanced shell customization:
  ```sh
  pkg install zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```

---

## Automation and Productivity

Automate repetitive tasks and boost productivity with these tools:

- **Cron Jobs**:
  Schedule tasks using `cron`:
  ```sh
  crontab -e
  ```
  Example: Run a script every day at 8 AM:
  ```sh
  0 8 * * * /path/to/script.sh
  ```

- **Task Automation**:
  Use `bash` or `zsh` scripts to automate workflows. For example, create a script to clean temporary files:
  ```sh
  #!/bin/bash
  rm -rf ~/tmp/*
  echo "Temporary files cleaned!"
  ```

- **Tmux**:
  Use Tmux for terminal multiplexing:
  ```sh
  pkg install tmux
  tmux new -s mysession
  tmux attach -t mysession
  ```

---

## Networking and Security

Termux provides powerful tools for networking and security:

- **Networking Tools**:
  - Test connectivity:
    ```sh
    ping google.com
    ```
  - Scan networks:
    ```sh
    pkg install nmap
    nmap <target>
    ```

- **SSH Access**:
  Set up SSH for remote access:
  ```sh
  pkg install openssh
  ssh-keygen
  ssh-copy-id user@remote_host
  ssh user@remote_host
  ```

- **Security Tools**:
  - Crack passwords with `john` or `hashcat`.
  - Test vulnerabilities with `nmap` or `sqlmap`.

---

## Programming and Development

Termux supports multiple programming languages and development tools:

- **Python**:
  Install Python and manage packages with `pip`:
  ```sh
  pkg install python
  pip install requests
  ```

- **C/C++**:
  Compile programs with GCC:
  ```sh
  pkg install clang
  gcc hello.c -o hello
  ./hello
  ```

- **Web Development**:
  Use Node.js for JavaScript development:
  ```sh
  pkg install nodejs
  npm init
  ```

- **Machine Learning**:
  Set up tools like TensorFlow or PyTorch:
  ```sh
  pkg install python
  pip install tensorflow
  ```

- **Git & Version Control**:
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

## Backup and Restore

Regularly back up your Termux environment to avoid data loss:

- **Backup**:
  Archive your Termux home directory:
  ```sh
  tar -czvf termux-backup.tar.gz ~/
  ```

- **Restore**:
  Extract the backup:
  ```sh
  tar -xzvf termux-backup.tar.gz -C ~/
  ```

- **Cloud Sync**:
  Use tools like `rclone` to sync backups to cloud storage.

---

## Troubleshooting

Here are solutions to common issues:

- **Permission Denied Errors**:
  Ensure you've granted storage permissions:
  ```sh
  termux-setup-storage
  ```

- **Package Not Found**:
  Update your package list:
  ```sh
  pkg update
  ```

- **High CPU or Memory Usage**:
  Monitor resource usage:
  ```sh
  pkg install htop
  htop
  ```

- **SSH Key Issues**:
  Regenerate SSH keys if necessary:
  ```sh
  ssh-keygen -t rsa -b 4096
  ```

---

## Resources

- [Termux Wiki](https://wiki.termux.com/wiki/Main_Page)
- [Termux GitHub](https://github.com/termux/termux-app)
- [Termux Reddit Community](https://www.reddit.com/r/termux/)
- [Termux Commands](https://github.com/termux/termux-packages)

---

This guide provides a comprehensive reference for working with Termux. Contributions are welcome to enhance this documentation.

Happy coding and exploring with Termux! 🚀