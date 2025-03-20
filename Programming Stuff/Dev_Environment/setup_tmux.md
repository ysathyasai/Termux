# Setting Up Tmux in Termux

This guide explains how to install, configure, and use `tmux` in Termux. `tmux` is a terminal multiplexer that allows you to manage multiple terminal sessions within a single window. It is particularly useful for multitasking, running long-running processes, and organizing your workflow efficiently. By following this guide, you can set up `tmux` on your Android device and customize it for productivity.

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
   - [Step 1: Update Termux Packages](#step-1-update-termux-packages)
   - [Step 2: Install Tmux](#step-2-install-tmux)
4. [Basic Usage](#basic-usage)
   - [Starting a Session](#starting-a-session)
   - [Navigating Windows and Panes](#navigating-windows-and-panes)
5. [Configuration](#configuration)
   - [Creating a `.tmux.conf` File](#creating-a-tmuxconf-file)
   - [Essential Settings](#essential-settings)
6. [Customization](#customization)
   - [Themes and Colors](#themes-and-colors)
   - [Keybindings](#keybindings)
7. [Advanced Features](#advanced-features)
   - [Detaching and Reattaching Sessions](#detaching-and-reattaching-sessions)
   - [Sharing Sessions](#sharing-sessions)
8. [Troubleshooting](#troubleshooting)
9. [Additional Resources](#additional-resources)
10. [Conclusion](#conclusion)

---

## Overview

`tmux` is a powerful tool for managing terminal sessions. It allows you to create multiple windows and panes, detach and reattach sessions, and run processes in the background. In this guide, we'll set up `tmux` in Termux, configure it for efficiency, and explore its features to enhance your productivity.

---

## Prerequisites

Before proceeding, ensure the following:

- **Termux App**: Latest version installed from the Play Store or F-Droid.
- **Storage Permission**: Granted to Termux (`termux-setup-storage`).
- **Internet Connection**: A stable internet connection is required for downloading packages and tools.
- **Device Storage**: Ensure sufficient free storage space (at least 100 MB recommended).

---

## Installation

### Step 1: Update Termux Packages
Ensure all Termux packages are up to date:
```bash
pkg update && pkg upgrade
```

### Step 2: Install Tmux
Install `tmux` using the Termux package manager:
```bash
pkg install tmux
```

Verify the installation:
```bash
tmux -V
```
You should see the installed version of `tmux` (e.g., `tmux 3.x`).

---

## Basic Usage

### Starting a Session
Start a new `tmux` session:
```bash
tmux new -s mysession
```
Replace `mysession` with your desired session name.

### Navigating Windows and Panes
- Create a new window: `Ctrl + b` followed by `c`.
- Switch between windows: `Ctrl + b` followed by `n` (next) or `p` (previous).
- Split the current pane horizontally: `Ctrl + b` followed by `%`.
- Split the current pane vertically: `Ctrl + b` followed by `"`.

Exit `tmux` by typing `exit` in all panes or pressing `Ctrl + d`.

---

## Configuration

### Creating a `.tmux.conf` File
The `.tmux.conf` file is used to customize `tmux`. Create it in your home directory:
```bash
nano ~/.tmux.conf
```

### Essential Settings
Add the following basic settings to your `.tmux.conf` file:
```bash
# Use vi-style keybindings
set -g mode-keys vi

# Enable mouse support
set -g mouse on

# Set default terminal to screen-256color
set -g default-terminal "screen-256color"

# Reload configuration without restarting tmux
bind r source-file ~/.tmux.conf \; display "Reloaded!"

# Increase history limit
set -g history-limit 10000
```

Reload the configuration:
```bash
tmux source-file ~/.tmux.conf
```

---

## Customization

### Themes and Colors
Customize the appearance of `tmux` by adding a theme. For example:
```bash
# Status bar colors
set -g status-bg black
set -g status-fg white

# Active window color
setw -g window-status-current-bg green
setw -g window-status-current-fg black
```

### Keybindings
Customize keybindings to suit your workflow. For example:
```bash
# Use Ctrl + a as the prefix instead of Ctrl + b
unbind C-b
set-option -g prefix C-a
bind C-a send-prefix

# Quick pane navigation
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
```

Reload the configuration after making changes:
```bash
tmux source-file ~/.tmux.conf
```

---

## Advanced Features

### Detaching and Reattaching Sessions
Detach from a session:
```bash
Ctrl + b followed by d
```

Reattach to a session:
```bash
tmux attach -t mysession
```

List all sessions:
```bash
tmux ls
```

### Sharing Sessions
Share a `tmux` session with another user:
1. Start a session:
   ```bash
   tmux new -s shared_session
   ```

2. Allow another user to attach:
   ```bash
   tmux attach -t shared_session
   ```

---

## Troubleshooting

### 1. Mouse Support Not Working
- **Cause**: Incorrect terminal type or missing configuration.
- **Solution**:
  Ensure `default-terminal` is set to `screen-256color` in `.tmux.conf`:
  ```bash
  set -g default-terminal "screen-256color"
  ```

### 2. Configuration Changes Not Applied
- **Cause**: Configuration file not reloaded.
- **Solution**:
  Reload the configuration manually:
  ```bash
  tmux source-file ~/.tmux.conf
  ```

### 3. Missing Colors
- **Cause**: Terminal emulator does not support 256 colors.
- **Solution**:
  Verify terminal support:
  ```bash
  echo $TERM
  ```
  If not `screen-256color`, set it explicitly:
  ```bash
  export TERM=screen-256color
  ```

---

## Additional Resources

- [Tmux Official Documentation](https://github.com/tmux/tmux/wiki)
- [Tmux Cheat Sheet](https://tmuxcheatsheet.com/)
- [Tmux Productivity Guide](https://leanpub.com/the-tao-of-tmux)

---

## Conclusion

By following this guide, you can set up and customize `tmux` in Termux to enhance your productivity. Whether you're managing multiple tasks, running long-running processes, or organizing your workflow, `tmux` provides a robust and flexible environment. Combine it with themes, keybindings, and advanced features like session sharing for a seamless experience. Enjoy exploring the power of `tmux` on your Android device!