# Termux Productivity Guide

## Task Management
```sh
# Install task warrior
pkg install task

# Install calendar
pkg install calcurse

# Install note-taking
pkg install joplin
```

## Terminal Multiplexer
```sh
# Install and configure tmux
pkg install tmux
cat > ~/.tmux.conf << 'EOF'
set -g mouse on
set -g history-limit 10000
set -g default-terminal "screen-256color"
EOF
```

## File Management
```sh
# Install file managers
pkg install ranger
pkg install mc
```
