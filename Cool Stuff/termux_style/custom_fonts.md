# Custom Fonts Guide for Termux

This guide explains how to set up custom fonts in Termux to complement your terminal themes (Nord, Solarized, Gruvbox, Dracula). Custom fonts improve readability and aesthetics, especially when using ligatures or glyphs.

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Popular Fonts](#popular-fonts)
4. [Installation Guide](#installation-guide)
5. [Extra Information](#extra-information)
6. [Troubleshooting](#troubleshooting)

---

## Overview

Custom fonts enhance the appearance of your terminal by providing better spacing, ligatures, and glyph support. This guide covers downloading, installing, and configuring fonts for use with Termux themes such as Nord, Solarized, Gruvbox, and Dracula.

All theme configurations are stored in the `Themes` folder in the same directory as this file.

---

## Prerequisites

Before installing custom fonts, ensure you have:

- **Termux App**: Latest version installed
- **Storage Permission**: Granted to Termux
- **Themes Folder**: A `Themes` folder containing your theme files (`colors.properties` for each theme)

---

## Popular Fonts

Here are some popular fonts that work well with terminal themes:

### 1. **JetBrains Mono**
- **Description**: A free, open-source font optimized for developers with ligature support.
- **Download Link**: [JetBrains Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFont-Regular.ttf)

### 2. **Fira Code**
- **Description**: A monospaced font with programming ligatures.
- **Download Link**: [Fira Code Nerd Font](https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/FiraCodeNerdFont-Regular.ttf)

### 3. **Hack**
- **Description**: A clean, simple font designed for source code.
- **Download Link**: [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/HackNerdFont-Regular.ttf)

### 4. **Source Code Pro**
- **Description**: A versatile font with excellent readability.
- **Download Link**: [Source Code Pro Nerd Font](https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Regular/SourceCodeProNerdFont-Regular.ttf)

### 5. **Roboto Mono**
- **Description**: A modern monospaced font with good spacing.
- **Download Link**: [Roboto Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/RobotoMonoNerdFont-Regular.ttf)

---

## Installation Guide

### Step 1: Download the Font
Use `curl` to download your preferred font into the Termux home directory:
```bash
curl -fLo ~/.termux/font.ttf <font_download_link>
```

For example, to download JetBrains Mono:
```bash
curl -fLo ~/.termux/font.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFont-Regular.ttf
```

### Step 2: Apply the Font
Reload Termux settings to apply the new font:
```bash
termux-reload-settings
```

### Step 3: Verify the Font
Check if the font has been applied correctly:
```bash
cat ~/.termux/font.ttf
```

If the file exists, the font should be active.

---

## Extra Information

### Font Compatibility
- **Nerd Fonts**: These fonts include glyphs and icons, making them ideal for themes like Dracula and Nord.
- **Ligatures**: Fonts like Fira Code and JetBrains Mono support ligatures, which combine symbols like `->`, `===`, or `!=` into single characters for better readability.

### Recommended Fonts for Themes
- [**Nord**](themes/nord_theme.md): JetBrains Mono, Fira Code
- [**Solarized**](themes/solarized_theme.md): Source Code Pro, Roboto Mono
- [**Gruvbox**](themes/gruvbox_theme.md): Hack, JetBrains Mono
- [**Dracula**](themes/dracula_theme.md): Fira Code, JetBrains Mono

### Resetting to Default Font
To reset to the default font, delete the custom font file:
```bash
rm ~/.termux/font.ttf
termux-reload-settings
```

---

## Troubleshooting

1. **Font Not Applied**:
   Ensure the font file is named `font.ttf` and located in the `~/.termux/` directory:
   ```bash
   ls ~/.termux/font.ttf
   ```

2. **Corrupted Font File**:
   Re-download the font:
   ```bash
   rm ~/.termux/font.ttf
   curl -fLo ~/.termux/font.ttf <font_download_link>
   termux-reload-settings
   ```

3. **Missing Glyphs**:
   Use a Nerd Font variant of the font to ensure glyph support.

4. **Font Display Issues**:
   Restart Termux after applying the font:
   ```bash
   termux-reload-settings
   ```

---

By following this guide, you can enhance the visual experience of your Termux environment with custom fonts that complement your chosen themes.