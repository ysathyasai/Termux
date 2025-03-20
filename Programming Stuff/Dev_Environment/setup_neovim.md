# Setting Up Neovim in Termux

This guide explains how to install, configure, and use Neovim in Termux. Neovim is a modern fork of Vim that offers improved extensibility, performance, and usability. By following this guide, you can set up Neovim on your Android device and customize it for efficient coding, text editing, and more.

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
   - [Step 1: Update Termux Packages](#step-1-update-termux-packages)
   - [Step 2: Install Neovim](#step-2-install-neovim)
4. [Basic Configuration](#basic-configuration)
   - [Step 1: Create a `init.lua` File](#step-1-create-a-initlua-file)
   - [Step 2: Add Essential Settings](#step-2-add-essential-settings)
5. [Essential Plugins](#essential-plugins)
   - [Plugin Management with `packer.nvim`](#plugin-management-with-packernvim)
   - [Installing Common Plugins](#installing-common-plugins)
6. [Keybindings and Customization](#keybindings-and-customization)
7. [Using Neovim as an IDE](#using-neovim-as-an-ide)
   - [Language Support](#language-support)
   - [Integrating LSP (Language Server Protocol)](#integrating-lsp-language-server-protocol)
8. [Troubleshooting](#troubleshooting)
9. [Additional Resources](#additional-resources)
10. [Conclusion](#conclusion)

---

## Overview

Neovim is a highly extensible text editor that builds on the strengths of Vim while adding modern features like asynchronous job control, better plugin management, and improved configurability. In this guide, we'll set up Neovim in Termux, configure it for productivity, and explore its capabilities as both a text editor and an IDE.

---

## Prerequisites

Before proceeding, ensure the following:

- **Termux App**: Latest version installed from the Play Store or F-Droid.
- **Storage Permission**: Granted to Termux (`termux-setup-storage`).
- **Internet Connection**: A stable internet connection is required for downloading packages and tools.
- **Device Storage**: Ensure sufficient free storage space (at least 500 MB recommended).

---

## Installation

### Step 1: Update Termux Packages
Ensure all Termux packages are up to date:
```bash
pkg update && pkg upgrade
```

### Step 2: Install Neovim
Install Neovim using the Termux package manager:
```bash
pkg install neovim
```

Verify the installation:
```bash
nvim --version
```
You should see the installed version of Neovim (e.g., `v0.9.x`).

---

## Basic Configuration

### Step 1: Create a `init.lua` File
Neovim uses Lua for configuration by default. Create an `init.lua` file in the `.config/nvim/` directory:
```bash
mkdir -p ~/.config/nvim
nano ~/.config/nvim/init.lua
```

### Step 2: Add Essential Settings
Add the following basic settings to your `init.lua` file:
```lua
-- Disable compatibility mode
vim.o.compatible = false

-- Enable line numbers
vim.o.number = true

-- Enable relative line numbers
vim.o.relativenumber = true

-- Set tab width to 4 spaces
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Enable syntax highlighting
vim.cmd("syntax on")

-- Enable clipboard integration
vim.o.clipboard = "unnamedplus"

-- Backup files in a separate directory
vim.o.backupdir = "~/.config/nvim/backups"
os.execute("mkdir -p ~/.config/nvim/backups")
```

Save the file and exit the editor.

---

## Essential Plugins

### Plugin Management with `packer.nvim`
`packer.nvim` is a popular plugin manager for Neovim. Install it by adding the following to your `init.lua`:
```lua
-- Install packer.nvim if not already installed
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    vim.notify("Installing packer.nvim...")
    fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    vim.cmd("packadd packer.nvim")
end

-- Load packer.nvim
require("packer").startup(function(use)
    -- Packer itself
    use("wbthomason/packer.nvim")

    -- Add plugins here
end)
```

Reload your configuration:
```bash
nvim +PackerSync
```

### Installing Common Plugins
Use `packer.nvim` to install common plugins. Add the following to your `init.lua`:

#### 1. Telescope (Fuzzy Finder)
```lua
use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
})
```

#### 2. Nvim-Tree (File Explorer)
```lua
use({
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons" },
})
```

#### 3. Lualine (Status Line)
```lua
use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
})
```

#### 4. Treesitter (Syntax Highlighting)
```lua
use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
})
```

Reload your configuration after adding these plugins:
```bash
nvim +PackerSync
```

---

## Keybindings and Customization

Customize keybindings to suit your workflow. For example:
```lua
-- Map leader key to <Space>
vim.g.mapleader = " "

-- Bind <Leader>ff to open Telescope file finder
vim.api.nvim_set_keymap("n", "<Leader>ff", ":Telescope find_files<CR>", { noremap = true })

-- Bind <Leader>e to open Nvim-Tree
vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true })
```

---

## Using Neovim as an IDE

### Language Support
Install language-specific plugins using `packer.nvim`. For example:

#### Python Support
```lua
use({
    "python-mode/python-mode",
    ft = "python",
})
```

#### JavaScript Support
```lua
use({
    "pangloss/vim-javascript",
    ft = "javascript",
})
```

### Integrating LSP (Language Server Protocol)
Install `nvim-lspconfig` for IDE-like features such as autocompletion, linting, and code navigation:
```lua
use({
    "neovim/nvim-lspconfig",
    config = function()
        require("lspconfig").pyright.setup({})
        require("lspconfig").tsserver.setup({})
    end,
})
```

---

## Troubleshooting

### 1. Slow Startup Time
- **Cause**: Large number of plugins or misconfigured settings.
- **Solution**:
  Use `packer.nvim`'s lazy loading feature:
  ```lua
  use({
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
  })
  ```

### 2. Missing Fonts
- **Cause**: Default font rendering issues in Termux.
- **Solution**:
  Install additional fonts:
  ```bash
  pkg install fontconfig
  fc-cache -fv
  ```

### 3. Plugin Installation Fails
- **Cause**: Network issues or outdated plugin repositories.
- **Solution**:
  Run `:PackerSync` again to refresh and retry plugin installation.

---

## Additional Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [Packer.nvim GitHub Repository](https://github.com/wbthomason/packer.nvim)
- [Learn Vimscript the Hard Way](https://learnvimscriptthehardway.stevelosh.com/)
- [Awesome Neovim](https://github.com/rockerBOO/awesome-neovim)

---

## Conclusion

By following this guide, you can set up and customize Neovim in Termux to suit your needs. Whether you're writing code, managing projects, or automating tasks, Neovim provides a powerful and flexible environment. Combine it with essential plugins like `telescope`, `nvim-tree`, and `lspconfig` for a seamless development experience. Enjoy exploring the endless possibilities of Neovim on your Android device!