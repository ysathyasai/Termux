# Termux Remote Access Guide

## SSH Server Setup
```sh
# Install OpenSSH
pkg install openssh

# Generate SSH keys
ssh-keygen -t ed25519

# Start SSH server
sshd
```

## Remote Desktop
```sh
# Install VNC server
pkg install tigervnc

# Start VNC server
vncserver -localhost no
```

## Web-Based Terminal
```sh
# Install ttyd
pkg install ttyd

# Start web terminal
ttyd -p 8080 bash
```
