# Zsh Setup Guide for Termux

This guide provides a script-like structure to set up Zsh in Termux. It includes steps to install Zsh, configure Oh My Zsh, customize themes, and enable plugins for an enhanced terminal experience.

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Installation Script](#installation-script)
4. [Customization](#customization)
5. [Troubleshooting](#troubleshooting)

---

## Overview

Zsh (Z Shell) is a powerful and highly customizable shell that improves productivity with features like auto-completion, syntax highlighting, and plugin support. This guide will walk you through setting up Zsh in Termux using a script-like approach.

---

## Prerequisites

Before proceeding, ensure the following:

- **Termux App**: Latest version installed
- **Storage Permission**: Granted to Termux (`termux-setup-storage`)
- **Basic Tools**: Install required packages:
  ```bash
  pkg update && pkg install zsh git curl -y
  ```

---

## Installation Script

### Step 1: Install Zsh
Run the following commands to install Zsh:
```bash
pkg install zsh -y
```

Set Zsh as the default shell:
```bash
chsh -s zsh
```

Verify the installation:
```bash
echo $SHELL
```
The output should be:
```
/data/data/com.termux/files/usr/bin/zsh
```

---

### Step 2: Install Oh My Zsh
Install Oh My Zsh using the official installation script:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

This script will:
- Install Oh My Zsh.
- Create the `~/.zshrc` configuration file.
- Set Zsh as the default shell.

---

### Step 3: Customize `.zshrc`
Edit the `~/.zshrc` file to customize your Zsh configuration:
```bash
nano ~/.zshrc
```

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

Reload the configuration:
```bash
source ~/.zshrc
```

---

### Step 4: Install Additional Plugins
Install popular plugins for enhanced functionality.

#### 1. **zsh-autosuggestions**
Provides auto-suggestions based on your command history:
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

#### 2. **zsh-syntax-highlighting**
Highlights commands as you type:
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Enable both plugins in `~/.zshrc`:
```bash
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```

Reload the configuration:
```bash
source ~/.zshrc
```

---

### Step 5: Install Powerlevel10k (Optional)
Powerlevel10k is a highly customizable theme for Zsh.

Install it:
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Set the theme in `~/.zshrc`:
```bash
ZSH_THEME="powerlevel10k/powerlevel10k"
```

Reload the configuration:
```bash
source ~/.zshrc
```

Follow the on-screen configuration wizard to customize Powerlevel10k.

---

## Customization

### Step 1: Add Aliases
Add custom aliases to `~/.zshrc`. For example:
```bash
alias ll='ls -la'
alias gs='git status'
alias gp='git push'
```

Reload the configuration:
```bash
source ~/.zshrc
```

### Step 2: Change Prompt Style
If using Powerlevel10k, re-run the configuration wizard to change the prompt style:
```bash
p10k configure
```

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

By following this guide, you can set up and customize Zsh in Termux to create a powerful and visually appealing terminal environment.