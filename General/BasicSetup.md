# Basic Termux Setup Guide

## Initial Setup
```sh
# Update package lists
pkg update && pkg upgrade

# Install essential packages
pkg install coreutils
pkg install termux-tools
pkg install termux-api
```

## Storage Setup
```sh
# Setup storage access
termux-setup-storage

# Create common directories
mkdir -p ~/storage/downloads
mkdir -p ~/storage/documents
```

## Shell Configuration
```sh
# Install better shell
pkg install zsh

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Configure aliases
echo "alias ll='ls -l'" >> ~/.zshrc
echo "alias la='ls -la'" >> ~/.zshrc
```
