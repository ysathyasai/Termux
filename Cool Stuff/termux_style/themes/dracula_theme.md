# Dracula Theme for Termux

This guide explains how to set up and customize the Dracula theme for Termux, providing a dark, comfortable, and visually appealing terminal experience.

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
4. [Color Scheme](#color-scheme)
5. [Customization](#customization)
6. [Examples](#examples)
7. [Troubleshooting](#troubleshooting)

---

## Overview

The Dracula theme is a dark theme designed to reduce eye strain while providing excellent color contrast for better readability. This implementation is specifically tailored for Termux.

---

## Prerequisites

Before installing the theme, ensure you have:

- **Termux App**: Latest version installed
- **Storage Permission**: Granted to Termux
- **Basic Tools**: Install required packages:
    ```bash
    pkg install ncurses-utils
    ```

---

## Installation

### Step 1: Create Theme Directory
```bash
mkdir -p ~/.termux
```

### Step 2: Create Color File
Create or edit `~/.termux/colors.properties`:
```bash
# Dracula Theme Color Properties
background=#282a36
foreground=#f8f8f2
cursor=#f8f8f2

# Normal colors
color0=#000000
color1=#ff5555
color2=#50fa7b
color3=#f1fa8c
color4=#bd93f9
color5=#ff79c6
color6=#8be9fd
color7=#bfbfbf

# Bright colors
color8=#4d4d4d
color9=#ff6e67
color10=#5af78e
color11=#f4f99d
color12=#caa9fa
color13=#ff92d0
color14=#9aedfe
color15=#e6e6e6
```

### Step 3: Apply Theme
```bash
termux-reload-settings
```

---

## Color Scheme

The Dracula theme uses the following signature colors:

- **Background**: `#282a36` (Dark gray)
- **Foreground**: `#f8f8f2` (Light gray)
- **Selection**: `#44475a` (Light purple)
- **Comment**: `#6272a4` (Purple)
- **Purple**: `#bd93f9`
- **Pink**: `#ff79c6`
- **Red**: `#ff5555`
- **Orange**: `#ffb86c`
- **Yellow**: `#f1fa8c`
- **Green**: `#50fa7b`
- **Cyan**: `#8be9fd`

---

## Customization

### Font Configuration
Create or edit `~/.termux/font.ttf`:
```bash
# Download and set a compatible font
curl -fLo ~/.termux/font.ttf https://github.com/source-foundry/Hack/blob/master/build/ttf/Hack-Regular.ttf?raw=true
```

### Terminal Properties
Edit `~/.termux/termux.properties`:
```properties
extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]
terminal-cursor-style = bar
terminal-transcript-rows = 8000
```

---

## Examples

### Sample Terminal Output
```bash
# Directory listing with Dracula theme
ls -la --color=auto
```

### VS Code Integration
If using VS Code with Remote-SSH:
```json
{
        "workbench.colorCustomizations": {
                "terminal.background":"#282a36",
                "terminal.foreground":"#f8f8f2"
        }
}
```

---

## Troubleshooting

1. **Theme Not Applied**:
     ```bash
     # Reset Termux
     termux-reload-settings
     ```

2. **Color Issues**:
     ```bash
     # Verify color support
     tput colors
     ```

3. **Font Problems**:
     ```bash
     # Reset font
     rm ~/.termux/font.ttf
     termux-reload-settings
     ```

4. **Reset to Default**:
     ```bash
     rm ~/.termux/colors.properties
     termux-reload-settings
     ```

---

This theme implementation provides a consistent and eye-friendly terminal experience across your Termux environment.
