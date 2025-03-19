# Network Management Guide

## Network Tools
```sh
# Basic tools
pkg install net-tools
pkg install iproute2

# Network monitoring
pkg install nethogs
pkg install iftop
```

## Firewall Setup
```sh
# Install firewall
pkg install ufw

# Basic rules
ufw allow 22/tcp
ufw enable
```

## Network Diagnostics
```sh
# Install diagnostic tools
pkg install mtr
pkg install nmap
pkg install tracepath
```
