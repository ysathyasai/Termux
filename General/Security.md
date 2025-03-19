# Termux Security Guide

## Basic Security
```sh
# Set storage permissions
chmod 700 $HOME
chmod 700 -R .termux

# Setup SSH security
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

## Password Protection
```sh
# Password storage
pkg install pass
gpg --full-generate-key

# Password manager setup
pass init your.email@domain.com
```

## Encryption Tools
```sh
# File encryption
pkg install gnupg
pkg install ccrypt

# Directory encryption
pkg install encfs
```
