# Backup Guide for Termux

This guide explains how to back up your entire Termux environment, including configurations, installed packages, scripts, and data. Backing up ensures you can restore your setup in case of device loss, reset, or corruption.

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Backup Process](#backup-process)
4. [Restoring from Backup](#restoring-from-backup)
5. [Automating Backups](#automating-backups)
6. [Troubleshooting](#troubleshooting)

---

## Overview

Backing up your Termux environment is crucial to prevent data loss. This guide covers creating a compressed archive of your Termux home directory and restoring it when needed. The backup includes:
- Installed packages
- Configurations (e.g., `.bashrc`, `.zshrc`)
- Scripts and personal files
- Package lists for easy reinstallation

---

## Prerequisites

Before proceeding, ensure the following:

- **Termux App**: Latest version installed
- **Storage Permission**: Granted to Termux (`termux-setup-storage`)
- **Basic Tools**: Install required packages:
  ```bash
  pkg install tar gzip -y
  ```

---

## Backup Process

### Step 1: Create a Backup Directory
Create a directory to store your backups:
```bash
mkdir -p ~/storage/shared/TermuxBackup
```

### Step 2: Generate a Timestamped Backup
Run the following command to create a timestamped backup archive:
```bash
tar -czf ~/storage/shared/TermuxBackup/termux_backup_$(date +%Y%m%d_%H%M%S).tar.gz -C ~/ . --exclude="storage"
```

- **Explanation**:
  - `tar`: Creates an archive.
  - `-czf`: Compresses the archive using gzip.
  - `~/storage/shared/TermuxBackup/`: Stores the backup in the shared storage directory.
  - `--exclude="storage"`: Excludes external storage to save space.

### Step 3: Verify the Backup
List the contents of the backup directory to confirm the archive was created:
```bash
ls ~/storage/shared/TermuxBackup/
```

---

## Restoring from Backup

### Step 1: Extract the Backup Archive
Navigate to your home directory and extract the backup:
```bash
cd ~
tar -xzf ~/storage/shared/TermuxBackup/termux_backup_<timestamp>.tar.gz
```

Replace `<timestamp>` with the actual timestamp of your backup file.

### Step 2: Reinstall Packages
If the backup does not include installed packages, reinstall them using the package list:
```bash
pkg install $(cat pkg_list.txt) -y
```

To generate a package list before backing up:
```bash
pkg list-installed > ~/pkg_list.txt
```

Include this `pkg_list.txt` file in your backup directory.

---

## Automating Backups

### Step 1: Create a Backup Script
Save the following script as `~/.scripts/backup.sh`:
```bash
#!/data/data/com.termux/files/usr/bin/bash

# Set backup directory
BACKUP_DIR="$HOME/storage/shared/TermuxBackup"
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="termux_backup_$DATE.tar.gz"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create backup
tar -czf "$BACKUP_DIR/$BACKUP_FILE" -C $HOME . --exclude="storage"

# Keep only last 5 backups
cd "$BACKUP_DIR" && ls -t termux_backup_* | tail -n +6 | xargs -r rm -f
```

Make the script executable:
```bash
chmod +x ~/.scripts/backup.sh
```

### Step 2: Schedule Backups with Cron
Install `cronie` if not already installed:
```bash
pkg install cronie
```

Start the cron service:
```bash
crond
```

Edit the crontab file:
```bash
crontab -e
```

Add the following line to schedule daily backups at 2 AM:
```bash
0 2 * * * ~/.scripts/backup.sh >> ~/.scripts/backup.log 2>&1
```

---

## Troubleshooting

1. **Backup Fails**:
   Ensure you have enough storage space:
   ```bash
   df -h
   ```

2. **Restore Issues**:
   Verify the integrity of the backup archive:
   ```bash
   tar -tzf ~/storage/shared/TermuxBackup/termux_backup_<timestamp>.tar.gz
   ```

3. **Missing Files**:
   Ensure the backup includes all necessary files by reviewing the `tar` command.

4. **Cron Logs**:
   Check the cron log file for errors:
   ```bash
   cat ~/.scripts/backup.log
   ```