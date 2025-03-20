# Nord Theme Guide for Termux

This guide explains how to set up and customize the Nord theme for Termux, providing a visually appealing arctic color palette designed for clarity and comfort.

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

The Nord theme is an elegant and minimalistic color scheme inspired by the colors of the Arctic region. It emphasizes readability and aesthetics, making it ideal for terminal environments like Termux.

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
```properties
# Nord Theme Color Properties
background=#2E3440
foreground=#D8DEE9
cursor=#D8DEE9

# Normal colors
color0=#3B4252
color1=#BF616A
color2=#A3BE8C
color3=#EBCB8B
color4=#81A1C1
color5=#B48EAD
color6=#88C0D0
color7=#E5E9F0

# Bright colors
color8=#4C566A
color9=#BF616A
color10=#A3BE8C
color11=#EBCB8B
color12=#81A1C1
color13=#B48EAD
color14=#8FBCBB
color15=#ECEFF4
```

### Step 3: Apply Theme
Reload Termux settings to apply the theme:
```bash
termux-reload-settings
```

---

## Color Scheme

The Nord theme uses the following signature colors:

- **Background**: `#2E3440` (Arctic Dark Blue)
- **Foreground**: `#D8DEE9` (Snow White)
- **Cursor**: `#D8DEE9` (Snow White)
- **Red**: `#BF616A` (Aurora Red)
- **Green**: `#A3BE8C` (Frost Green)
- **Yellow**: `#EBCB8B` (Polar Yellow)
- **Blue**: `#81A1C1` (Frost Blue)
- **Magenta**: `#B48EAD` (Aurora Purple)
- **Cyan**: `#88C0D0` (Frost Cyan)
- **Bright Variants**: Slightly lighter shades of the normal colors.

---

## Customization

### Font Configuration
Download and set a compatible font such as JetBrains Mono or Fira Code:
```bash
curl -fLo ~/.termux/font.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFont-Regular.ttf
```

Apply the font by reloading settings:
```bash
termux-reload-settings
```

### Terminal Properties
Edit or create `~/.termux/termux.properties`:
```properties
extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]
terminal-cursor-style = bar
terminal-transcript-rows = 8000
```

Reload settings after editing:
```bash
termux-reload-settings
```

---

## Examples

### Sample Terminal Output
Run a directory listing with color support:
```bash
ls -la --color=auto
```

### VS Code Integration
If using VS Code with Remote-SSH, add the following to your settings:
```json
{
    "workbench.colorCustomizations": {
        "terminal.background": "#2E3440",
        "terminal.foreground": "#D8DEE9"
    }
}
```

---

## Troubleshooting

1. **Theme Not Applied**:
   Reset Termux settings:
   ```bash
   termux-reload-settings
   ```

2. **Color Issues**:
   Verify color support:
   ```bash
   tput colors
   ```

3. **Font Problems**:
   Reset font to default:
   ```bash
   rm ~/.termux/font.ttf
   termux-reload-settings
   ```

4. **Reset to Default**:
   Remove custom color settings:
   ```bash
   rm ~/.termux/colors.properties
   termux-reload-settings
   ```

---

This theme implementation provides a consistent and visually appealing terminal experience across your Termux environment.