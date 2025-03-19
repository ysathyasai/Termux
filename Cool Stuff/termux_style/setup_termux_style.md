# Customize Termux Appearance and Behavior

This guide explains how to customize the appearance and behavior of Termux to suit your preferences. You'll learn how to configure themes, fonts, extra keys, and other settings to create a personalized and efficient terminal environment.

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Customizing Themes](#customizing-themes)
4. [Changing Fonts](#changing-fonts)
5. [Configuring Extra Keys](#configuring-extra-keys)
6. [Terminal Properties](#terminal-properties)
7. [Troubleshooting](#troubleshooting)

---

## Overview

Termux allows you to customize its appearance and behavior to improve usability and aesthetics. This includes setting color themes, installing custom fonts, configuring extra keys, and tweaking terminal properties.

---

## Prerequisites

Before customizing Termux, ensure you have:

- **Termux App**: Latest version installed
- **Storage Permission**: Granted to Termux (`termux-setup-storage`)
- **Basic Tools**: Install required packages:
  ```bash
  pkg install ncurses-utils
  ```

---

## Customizing Themes

### Step 1: Create Theme Directory
Create the `.termux` directory if it doesn't exist:
```bash
mkdir -p ~/.termux
```

### Step 2: Apply a Color Scheme
Edit or create `~/.termux/colors.properties` with your preferred theme. For example, here's the **Dracula Theme**:
```properties
background=#282a36
foreground=#f8f8f2
cursor=#f8f8f2

color0=#000000
color1=#ff5555
color2=#50fa7b
color3=#f1fa8c
color4=#bd93f9
color5=#ff79c6
color6=#8be9fd
color7=#bfbfbf

color8=#4d4d4d
color9=#ff6e67
color10=#5af78e
color11=#f4f99d
color12=#caa9fa
color13=#ff92d0
color14=#9aedfe
color15=#e6e6e6
```

Reload settings to apply the theme:
```bash
termux-reload-settings
```

For more themes, refer to the `Themes` folder in your repository.

---

## Changing Fonts

### Step 1: Download a Font
Download a custom font using `curl`. For example, to download JetBrains Mono Nerd Font:
```bash
curl -fLo ~/.termux/font.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFont-Regular.ttf
```

### Step 2: Apply the Font
Reload Termux settings to apply the new font:
```bash
termux-reload-settings
```

### Step 3: Reset to Default Font
To reset to the default font, delete the custom font file:
```bash
rm ~/.termux/font.ttf
termux-reload-settings
```

For more font options, refer to the `custom_fonts.md` file in your repository.

---

## Configuring Extra Keys

Extra keys provide quick access to commonly used commands like `ESC`, `CTRL`, `ALT`, and navigation keys.

### Step 1: Edit `termux.properties`
Edit or create `~/.termux/termux.properties`:
```properties
extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]
```

### Step 2: Reload Settings
Apply the changes by reloading Termux settings:
```bash
termux-reload-settings
```

### Step 3: Customize Further
You can customize the layout by adding or removing keys. For example:
```properties
extra-keys = [['ESC','|','/','HOME','UP','END'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT']]
```

---

## Terminal Properties

### Step 1: Configure Cursor Style
Set the cursor style in `~/.termux/termux.properties`. Options include `bar`, `underline`, or `block`:
```properties
terminal-cursor-style = bar
```

### Step 2: Increase Scrollback Buffer
Increase the scrollback buffer size (default is 1000 lines):
```properties
terminal-transcript-rows = 8000
```

### Step 3: Reload Settings
Apply the changes by reloading Termux settings:
```bash
termux-reload-settings
```

---

## Troubleshooting

1. **Changes Not Applied**:
   Ensure you reload settings after making changes:
   ```bash
   termux-reload-settings
   ```

2. **Font Issues**:
   Verify the font file exists:
   ```bash
   ls ~/.termux/font.ttf
   ```
   If missing, re-download the font.

3. **Extra Keys Not Working**:
   Ensure `termux.properties` is correctly formatted and located in `~/.termux/`.

4. **Reset to Default Settings**:
   Remove custom files and reload settings:
   ```bash
   rm ~/.termux/colors.properties ~/.termux/font.ttf ~/.termux/termux.properties
   termux-reload-settings
   ```

---

By following this guide, you can fully customize the appearance and behavior of Termux to create a personalized and efficient terminal environment.