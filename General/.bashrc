# ~/.bashrc - Custom Configuration for Termux

# Ensure required packages are installed before using them:
# Run: pkg install figlet w3m micro

# Custom function to clear the terminal and display a message
custom_clear() {
    tput reset  # Clears the terminal screen
    figlet "Cleaned Tab"  # Displays the welcome message (requires 'figlet' package)
}

# Display a welcome message on terminal startup
clear
figlet "Welcome to Termux"  # Requires 'figlet' package

# Alias the 'clear' command to use custom_clear
alias clear='custom_clear'

# Custom Aliases for Convenience
alias ss='cd ~/storage/shared/'  # Quick access to shared storage
alias p='python'  # Short command for Python
alias sb='source ~/.bashrc'  # Reload .bashrc
alias eng='enjoy_pandugo'
alias n='nano'  # Open nano editor
alias m='micro'  # Open micro editor (requires 'micro' package)
alias mb='micro ~/.bashrc'  # Edit .bashrc with micro
alias termux='cd ~/storage/shared/Programs/Termux'  # Navigate to Termux projects
alias f='figlet'  # Quick figlet command (requires 'figlet' package)
alias code='code-server'  # Open VS Code Server
alias ll='ls -la'  # List all files in long format
alias pkgupdate='pkg update && pkg upgrade -y'  # Update Termux packages
alias aptupdate='apt update && apt upgrade -y'  # Update APT packages
alias c='clear'
alias cl='clear'
alias cle='clear'
alias clea='clear'
alias phd='pd sh debian'  # Shortcut for Debian shell
alias e='exit'
alias enjoy='exit'
alias browse='w3m'  # Open text-based web browser (requires 'w3m' package)

# Disable command history logging for privacy
unset HISTFILE  

# Define a function for exiting Termux safely
enjoy_pandugo() {
    pkill -f termux
    am force-stop com.termux
    exit
}

# Custom greeting functions
good_night() {
   figlet "Good Night"  # Requires 'figlet' package
}

good_morning() {
    figlet "Good Morning"  # Requires 'figlet' package
}

# Run external motivation script if available
if [ -f ~/scripts/motivation.py ]; then
    python3 ~/scripts/motivation.py
fi

# Reference: Check out my motivational quotes script in the "motivational-quotes-script" repository to run it correctly

# End of .bashrc
