# Package Management Guide

## Repository Management
```sh
# Add repositories
echo "deb https://mirrors.ustc.edu.cn/termux/apt/termux-main stable main" >> $PREFIX/etc/apt/sources.list

# Update sources
pkg update
```

## Package Maintenance
```sh
# Clean package cache
apt clean
apt autoclean

# Remove unused dependencies
apt autoremove
```

## Package Information
```sh
# Search packages
pkg search <package>

# Show package info
pkg show <package>

# List installed packages
pkg list-installed
```
