# Solarized Theme Guide for Termux

This guide explains how to set up and customize the Solarized theme for Termux, providing a visually balanced and comfortable color scheme designed for readability and aesthetics.

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

The Solarized theme is a carefully crafted color scheme that emphasizes usability and visual harmony. It comes in two variants: **Solarized Dark** and **Solarized Light**, both of which are optimized for terminal environments like Termux.

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
Create or edit `~/.termux/colors.properties` with the following content for **Solarized Dark**:

```properties
# Solarized Dark Theme Color Properties
background=#002b36
foreground=#839496
cursor=#839496

# Normal colors
color0=#073642
color1=#dc322f
color2=#859900
color3=#b58900
color4=#268bd2
color5=#6c71c4
color6=#2aa198
color7=#eee8d5

# Bright colors
color8=#002b36
color9=#cb4b16
color10=#586e75
color11=#657b83
color12=#839496
color13=#6c71c4
color14=#93a1a1
color15=#fdf6e3
```

For **Solarized Light**, use the following configuration:

```properties
# Solarized Light Theme Color Properties
background=#fdf6e3
foreground=#657b83
cursor=#657b83

# Normal colors
color0=#eee8d5
color1=#dc322f
color2=#859900
color3=#b58900
color4=#268bd2
color5=#6c71c4
color6=#2aa198
color7=#073642

# Bright colors
color8=#fdf6e3
color9=#cb4b16
color10=#586e75
color11=#657b83
color12=#839496
color13=#6c71c4
color14=#93a1a1
color15=#002b36
```

### Step 3: Apply Theme
Reload Termux settings to apply the theme:
```bash
termux-reload-settings
```

---

## Color Scheme

The Solarized theme uses the following signature colors:

### Solarized Dark
- **Background**: `#002b36` (Base03)
- **Foreground**: `#839496` (Base0)
- **Cursor**: `#839496` (Base0)
- **Red**: `#dc322f` (Red)
- **Green**: `#859900` (Green)
- **Yellow**: `#b58900` (Yellow)
- **Blue**: `#268bd2` (Blue)
- **Magenta**: `#6c71c4` (Violet)
- **Cyan**: `#2aa198` (Cyan)
- **Bright Variants**: Slightly lighter shades of the normal colors.

### Solarized Light
- **Background**: `#fdf6e3` (Base3)
- **Foreground**: `#657b83` (Base00)
- **Cursor**: `#657b83` (Base00)
- **Red**: `#dc322f` (Red)
- **Green**: `#859900` (Green)
- **Yellow**: `#b58900` (Yellow)
- **Blue**: `#268bd2` (Blue)
- **Magenta**: `#6c71c4` (Violet)
- **Cyan**: `#2aa198` (Cyan)
- **Bright Variants**: Slightly darker shades of the normal colors.

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
        "terminal.background": "#002b36", // For Solarized Dark
        "terminal.foreground": "#839496"  // For Solarized Dark
    }
}
```

For Solarized Light:
```json
{
    "workbench.colorCustomizations": {
        "terminal.background": "#fdf6e3", // For Solarized Light
        "terminal.foreground": "#657b83"  // For Solarized Light
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