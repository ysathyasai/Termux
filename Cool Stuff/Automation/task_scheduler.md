# Startup Scripts Guide for Termux

This guide explains how to set up and manage startup scripts in Termux. These scripts allow you to automate tasks such as starting services, running commands, or setting up your environment every time you open Termux.

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Creating a Startup Script](#creating-a-startup-script)
4. [How It Works](#how-it-works)
5. [Step-by-Step Setup](#step-by-step-setup)
6. [Example Use Cases](#example-use-cases)
7. [Troubleshooting](#troubleshooting)

---

## Overview

Startup scripts are useful for automating repetitive tasks or configuring your Termux environment when it starts. By adding commands or scripts to your Termux startup configuration, you can:
- Start background services (e.g., SSH, HTTP server).
- Set environment variables.
- Run custom scripts or commands.
- Display welcome messages or system information.

Termux executes commands from the `~/.bashrc` or `~/.zshrc` file when it starts, depending on the shell you are using.

---

## Prerequisites

Before setting up startup scripts, ensure the following:

- **Termux App**: Installed on your Android device.
- **Shell Configuration File**: Ensure you have access to `~/.bashrc` (for Bash) or `~/.zshrc` (for Zsh).
- **Scripts or Commands**: Have the scripts or commands you want to run at startup ready.

---

## Creating a Startup Script

A startup script is simply a collection of commands added to your shell's configuration file (`~/.bashrc` or `~/.zshrc`). These commands are executed every time Termux starts.

### Example Startup Script
Here’s an example of what you might add to your `~/.bashrc` file:

```bash
# ============================
# Startup Script for Termux
# ============================

# Display a welcome message
echo "Welcome back to Termux!"
echo "Today's date: $(date)"

# Set environment variables
export EDITOR=nano
export PATH=$HOME/bin:$PATH

# Start SSH server if not already running
if ! pgrep -x "sshd" > /dev/null; then
    echo "Starting SSH server..."
    sshd
fi

# Check for updates
echo "Checking for package updates..."
pkg update -y

# Run a custom script
if [ -f ~/.scripts/startup.sh ]; then
    echo "Running custom startup script..."
    bash ~/.scripts/startup.sh
fi
```

---

## How It Works

1. **Shell Configuration File**: When Termux starts, it reads and executes commands from the shell configuration file (`~/.bashrc` or `~/.zshrc`).
2. **Commands Execution**: Any commands or scripts added to this file are executed automatically.
3. **Customization**: You can customize the file to suit your needs, such as starting services, setting environment variables, or running scripts.

---

## Step-by-Step Setup

### Step 1: Open the Shell Configuration File

1. Open Termux.
2. Edit the `~/.bashrc` file (or `~/.zshrc` if you use Zsh):
   ```bash
   nano ~/.bashrc
   ```

### Step 2: Add Your Startup Commands

Copy and paste the example script provided above or customize it with your own commands. For example:
- Start an SSH server.
- Display system information.
- Run a custom script.

### Step 3: Save and Exit

Save the file and exit the editor (`Ctrl+O`, then `Enter` to save, and `Ctrl+X` to exit).

### Step 4: Apply Changes

To apply the changes immediately without restarting Termux, source the configuration file:
```bash
source ~/.bashrc
```

---

## Example Use Cases

Here are some practical examples of startup scripts for Termux:

### 1. Display System Information
Show system information (e.g., battery status, storage usage) when Termux starts:
```bash
echo "Battery Status: $(termux-battery-status | jq -r '.percentage')%"
echo "Storage Usage: $(df -h | grep /data)"
```

### 2. Start Background Services
Start an SSH server and a Python HTTP server:
```bash
# Start SSH server
if ! pgrep -x "sshd" > /dev/null; then
    echo "Starting SSH server..."
    sshd
fi

# Start Python HTTP server
if ! pgrep -x "python" > /dev/null; then
    echo "Starting Python HTTP server on port 8000..."
    python -m http.server 8000 &
fi
```

### 3. Run Custom Scripts
Run a custom script located in `~/.scripts/startup.sh`:
```bash
if [ -f ~/.scripts/startup.sh ]; then
    echo "Running custom startup script..."
    bash ~/.scripts/startup.sh
fi
```

### 4. Set Aliases and Environment Variables
Define aliases and environment variables for convenience:
```bash
# Aliases
alias ll='ls -la'
alias gs='git status'

# Environment Variables
export EDITOR=nano
export PATH=$HOME/bin:$PATH
```

---

## Troubleshooting

If your startup script is not working as expected, check the following:

1. **File Location**:
   Ensure you are editing the correct configuration file (`~/.bashrc` for Bash or `~/.zshrc` for Zsh).

2. **Syntax Errors**:
   Double-check the syntax of your commands. Use `bash -n ~/.bashrc` to check for syntax errors.

3. **Permissions**:
   Ensure any scripts you reference are executable:
   ```bash
   chmod +x ~/.scripts/startup.sh
   ```

4. **Logs**:
   Redirect output to a log file for debugging:
   ```bash
   echo "Running startup script..." >> ~/startup.log 2>&1
   ```

5. **Conflicts**:
   Avoid conflicts with existing commands or scripts in the configuration file.

---

By following this guide, you can effectively set up and manage startup scripts in Termux to automate tasks and streamline your workflow.