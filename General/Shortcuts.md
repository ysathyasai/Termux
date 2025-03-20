# Termux Shortcuts Guide

## Keyboard Shortcuts
```
CTRL + A  -> Move cursor to beginning of line
CTRL + E  -> Move cursor to end of line
CTRL + K  -> Delete from cursor to end of line
CTRL + U  -> Delete from cursor to start of line
```

## Extra Keys Row
```sh
# Edit ~/.termux/termux.properties
echo "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]" > ~/.termux/termux.properties

# Reload settings
termux-reload-settings
```
