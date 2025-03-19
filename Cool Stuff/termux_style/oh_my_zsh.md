# Oh My Zsh Guide for Termux

This guide explains how to install, configure, and customize Oh My Zsh in Termux. Oh My Zsh is a popular framework for managing Zsh configurations, providing themes, plugins, and utilities to enhance your terminal experience.

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
4. [Configuration](#configuration)
5. [Themes](#themes)
6. [Plugins](#plugins)
7. [Customization](#customization)
8. [Troubleshooting](#troubleshooting)

---

## Overview

Oh My Zsh is a community-driven framework for managing your Zsh configuration. It simplifies customization with pre-built themes and plugins, making your terminal more powerful and visually appealing. This guide focuses on setting up Oh My Zsh in Termux.

---

## Prerequisites

Before installing Oh My Zsh, ensure you have:

- **Termux App**: Latest version installed
- **Zsh Installed**: Install Zsh using:
  ```bash
  pkg install zsh
  ```
- **Git Installed**: Install Git using:
  ```bash
  pkg install git
  ```
- **Storage Permission**: Granted to Termux (`termux-setup-storage`)

---

## Installation

### Step 1: Install Oh My Zsh
Run the following command to install Oh My Zsh:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

This script will:
- Install Oh My Zsh.
- Set Zsh as the default shell (if prompted, confirm by typing `Y`).

### Step 2: Verify Installation
Check if Zsh is set as the default shell:
```bash
echo $SHELL
```
The output should be:
```
/data/data/com.termux/files/usr/bin/zsh
```

If not, set Zsh manually:
```bash
chsh -s zsh
```

### Step 3: Restart Termux
Restart Termux to apply the changes:
```bash
exit
```

---

## Configuration

### Step 1: Locate `.zshrc`
The main configuration file for Oh My Zsh is located at:
```bash
~/.zshrc
```

Edit the file using a text editor like `nano`:
```bash
nano ~/.zshrc
```

### Step 2: Customize `.zshrc`
Here are some common settings you can customize:

#### Change Theme
Set a theme by modifying the `ZSH_THEME` variable. For example:
```bash
ZSH_THEME="agnoster"
```

#### Enable Plugins
Enable plugins by adding them to the `plugins` array. For example:
```bash
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```

Save and exit the editor (`Ctrl+O`, then `Enter` to save, and `Ctrl+X` to exit).

### Step 3: Apply Changes
Reload the `.zshrc` file to apply changes:
```bash
source ~/.zshrc
```

---

## Themes

Oh My Zsh comes with many built-in themes. To change the theme:

1. Open `~/.zshrc`:
   ```bash
   nano ~/.zshrc
   ```

2. Modify the `ZSH_THEME` variable. For example:
   ```bash
   ZSH_THEME="robbyrussell"
   ```

3. Save and reload:
   ```bash
   source ~/.zshrc
   ```

Some popular themes include:
- **agnoster**: A stylish theme with Git status indicators.
- **powerlevel10k**: Requires manual installation (see below).
- **robbyrussell**: The default theme, simple and clean.

---

## Plugins

Oh My Zsh supports a wide range of plugins to enhance functionality. Here are some recommended plugins:

### 1. **zsh-autosuggestions**
Provides auto-suggestions based on your command history.

Install it:
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Enable it in `~/.zshrc`:
```bash
plugins=(git zsh-autosuggestions)
```

Reload:
```bash
source ~/.zshrc
```

### 2. **zsh-syntax-highlighting**
Highlights commands as you type, indicating syntax correctness.

Install it:
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Enable it in `~/.zshrc`:
```bash
plugins=(git zsh-syntax-highlighting)
```

Reload:
```bash
source ~/.zshrc
```

---

## Customization

### Step 1: Add Aliases
Add custom aliases to `~/.zshrc`. For example:
```bash
alias ll='ls -la'
alias gs='git status'
alias gp='git push'
```

Reload:
```bash
source ~/.zshrc
```

### Step 2: Install Powerlevel10k (Optional)
Powerlevel10k is a highly customizable theme for Zsh.

Install it:
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Set the theme in `~/.zshrc`:
```bash
ZSH_THEME="powerlevel10k/powerlevel10k"
```

Reload:
```bash
source ~/.zshrc
```

Follow the on-screen configuration wizard to customize Powerlevel10k.

---

## Troubleshooting

1. **Zsh Not Set as Default Shell**:
   Manually set Zsh as the default shell:
   ```bash
   chsh -s zsh
   ```

2. **Missing Plugins or Themes**:
   Ensure the plugin/theme is installed in the correct directory:
   ```bash
   ls ~/.oh-my-zsh/custom/plugins/
   ```

3. **Configuration Issues**:
   Reset `.zshrc` to default:
   ```bash
   cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
   source ~/.zshrc
   ```

4. **Font Issues**:
   Use a Nerd Font for better compatibility with themes like Powerlevel10k:
   ```bash
   curl -fLo ~/.termux/font.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFont-Regular.ttf
   termux-reload-settings
   ```

---

By following this guide, you can set up and customize Oh My Zsh in Termux to create a powerful and visually appealing terminal environment.