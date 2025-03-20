k# System Tools Setup and Usage in Termux

This guide will walk you through setting up and using essential system tools and configurations in Termux. These tools are useful for managing packages, monitoring system resources, accessing storage, and automating tasks.

---

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Installing System Tools](#installing-system-tools)
   - [Package Management](#package-management)
   - [Storage Access](#storage-access)
   - [Process Management](#process-management)
   - [Automation Tools](#automation-tools)
3. [Usage Examples](#usage-examples)
   - [Package Management](#package-management-usage)
   - [Accessing Storage](#accessing-storage-usage)
   - [Monitoring Resources](#monitoring-resources-usage)
   - [Automating Tasks](#automating-tasks-usage)
4. [Troubleshooting](#troubleshooting)

---

## Prerequisites

Before proceeding, ensure the following:

1. **Termux Installed**: Download and install Termux from the official source (F-Droid or GitHub).
2. **Internet Connection**: Ensure your device has an active internet connection.
3. **Storage Permissions**: Grant storage permissions to Termux if required:
   ```bash
   termux-setup-storage
   ```

---

## Installing System Tools

### Package Management

#### Install Core Utilities
```bash
pkg update && pkg upgrade -y
pkg install coreutils findutils grep sed awk -y
```

**Tools Included:**
- `coreutils`: Basic system utilities like `ls`, `cp`, `mv`, etc.
- `findutils`: File search utilities (`find`, `locate`).
- `grep`, `sed`, `awk`: Text processing tools.

---

### Storage Access

#### Access Device Storage
Grant Termux access to your device's storage:
```bash
termux-setup-storage
```

This creates a symbolic link to your device's storage at `~/storage`.

---

### Process Management

#### Install Monitoring Tools
```bash
pkg install htop tmux neofetch -y
```

**Tools Included:**
- `htop`: Interactive process viewer.
- `tmux`: Terminal multiplexer for managing multiple sessions.
- `neofetch`: Display system information.

---

### Automation Tools

#### Install Scripting Tools
```bash
pkg install cronie at bash-completion -y
```

**Tools Included:**
- `cronie`: Schedule tasks using cron jobs.
- `at`: Schedule one-time tasks.
- `bash-completion`: Auto-complete commands in Bash.

---

## Usage Examples

### Package Management Usage

#### Update and Upgrade Packages
```bash
pkg update && pkg upgrade -y
```

#### Search for a Package
```bash
pkg search <package_name>
```

#### Install a Package
```bash
pkg install <package_name> -y
```

#### Remove a Package
```bash
pkg uninstall <package_name>
```

---

### Accessing Storage Usage

#### Navigate to Storage Directories
```bash
cd ~/storage/shared
ls
```

#### Backup Files to Storage
```bash
cp ~/important_file.txt ~/storage/shared/backup/
```

---

### Monitoring Resources Usage

#### View Running Processes
```bash
htop
```

#### Check System Information
```bash
neofetch
```

#### Monitor CPU and Memory Usage
```bash
top
```

---

### Automating Tasks Usage

#### Schedule a Cron Job
Edit the crontab file:
```bash
crontab -e
```

Add a task to run every day at 8 AM:
```bash
0 8 * * * echo "Good Morning!" > ~/morning_message.txt
```

#### Schedule a One-Time Task with `at`
```bash
echo "echo 'Task Completed'" | at now + 5 minutes
```

#### Use Tmux for Multiple Sessions
Start a new tmux session:
```bash
tmux new -s mysession
```

Detach from the session:
```bash
Ctrl+b d
```

Reattach to the session:
```bash
tmux attach -t mysession
```

---

## Troubleshooting

1. **Permission Denied Errors**:
   - Ensure you have granted Termux the necessary permissions.
   - Run `termux-setup-storage` if required.

2. **Cron Jobs Not Running**:
   - Start the cron service:
     ```bash
     crond
     ```
   - Check the cron logs:
     ```bash
     cat /data/data/com.termux/files/usr/var/log/cron.log
     ```

3. **Storage Not Accessible**:
   - Re-run `termux-setup-storage` to re-grant permissions.
   - Ensure no other app is locking the storage directory.

4. **Tool Not Found**:
   - Update your package list: `pkg update`.
   - Reinstall the tool: `pkg install <tool_name>`.

---

## Conclusion

By following this guide, you should now have a fully functional system toolkit in Termux. These tools are invaluable for managing packages, monitoring resources, accessing storage, and automating tasks.

For further assistance, refer to the official documentation of each tool or seek help from the Termux community.

Happy system management! ⚙️
