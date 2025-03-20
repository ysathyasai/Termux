# Termux Customization Guide

## Color Schemes
```sh
# Create colors directory
mkdir -p ~/.termux/colors

# Install color schemes
curl -fLo ~/.termux/colors/gruvbox.properties https://raw.githubusercontent.com/gruvbox-community/gruvbox-contrib/master/termux/colors.properties
```

## Font Configuration
```sh
# Create fonts directory
mkdir -p ~/.termux/font

# Install powerline fonts
pkg install figlet
pkg install termux-style
```

## Shell Prompt
```sh
# Install Starship prompt
pkg install starship

# Configure starship
echo 'eval "$(starship init bash)"' >> ~/.bashrc
```
