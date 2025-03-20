# Cloud Sync Guide for Termux Backups

This guide explains how to sync your Termux backups (created using the `backup_guide.md`) to cloud storage services such as Google Drive, Dropbox, or others. This ensures your backups are securely stored off-device and accessible from anywhere.

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Setting Up Rclone](#setting-up-rclone)
4. [Syncing Backups to the Cloud](#syncing-backups-to-the-cloud)
5. [Automating Cloud Sync](#automating-cloud-sync)
6. [Troubleshooting](#troubleshooting)

---

## Overview

Backing up your Termux environment is essential, but storing backups locally can be risky if your device is lost, damaged, or reset. This guide uses `rclone`, a powerful command-line tool, to sync your Termux backups to cloud storage services like Google Drive, Dropbox, or OneDrive.

---

## Prerequisites

Before proceeding, ensure the following:

- **Termux Backup**: Follow the steps in `backup_guide.md` to create a backup.
- **Storage Permission**: Granted to Termux (`termux-setup-storage`).
- **Rclone Installed**: Install `rclone` using:
  ```bash
  pkg install rclone -y
  ```

---

## Setting Up Rclone

### Step 1: Configure Rclone
Run the following command to configure `rclone`:
```bash
rclone config
```

Follow the interactive prompts to add your cloud storage provider:
1. Choose `n` to create a new remote.
2. Provide a name for the remote (e.g., `gdrive` for Google Drive).
3. Select your cloud provider from the list (e.g., `13` for Google Drive).
4. Authenticate by following the instructions (e.g., opening a link in your browser and pasting the authentication token).

Example configuration for Google Drive:
```
Name: gdrive
Type: 13 (Google Drive)
Client ID: Leave blank to use default
Client Secret: Leave blank to use default
Scope: Full access (option 1)
Root Folder ID: Leave blank
Service Account: No
Edit advanced config: No
Use auto config: Yes
```

Verify the configuration:
```bash
rclone listremotes
```

Test access to your cloud storage:
```bash
rclone lsd gdrive:
```

---

## Syncing Backups to the Cloud

### Step 1: Sync Backups
Assume your backups are stored in `~/storage/shared/TermuxBackup`. Use the following command to sync them to your cloud storage:
```bash
rclone sync ~/storage/shared/TermuxBackup gdrive:/TermuxBackup --progress
```

- **Explanation**:
  - `rclone sync`: Syncs files between local and remote storage.
  - `~/storage/shared/TermuxBackup`: Local backup directory.
  - `gdrive:/TermuxBackup`: Remote folder on Google Drive.
  - `--progress`: Displays progress during the sync.

### Step 2: Verify the Sync
List the contents of the remote folder to confirm the sync:
```bash
rclone ls gdrive:/TermuxBackup
```

---

## Automating Cloud Sync

### Step 1: Create a Sync Script
Save the following script as `~/.scripts/cloud_sync.sh`:
```bash
#!/data/data/com.termux/files/usr/bin/bash

# Set backup directory and remote path
BACKUP_DIR="$HOME/storage/shared/TermuxBackup"
REMOTE_PATH="gdrive:/TermuxBackup"

# Sync backups to the cloud
echo "[$(date)] Starting cloud sync..."
rclone sync "$BACKUP_DIR" "$REMOTE_PATH" --progress >> ~/.scripts/cloud_sync.log 2>&1
echo "[$(date)] Cloud sync completed."
```

Make the script executable:
```bash
chmod +x ~/.scripts/cloud_sync.sh
```

### Step 2: Schedule Sync with Cron
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

Add the following line to schedule daily sync at 3 AM:
```bash
0 3 * * * ~/.scripts/cloud_sync.sh
```

---

## Troubleshooting

1. **Authentication Issues**:
   Re-run `rclone config` to re-authenticate your cloud storage account.

2. **Sync Fails**:
   Ensure you have enough storage space on your cloud provider:
   ```bash
   rclone about gdrive:
   ```

3. **Permission Denied**:
   Check file permissions for the backup directory:
   ```bash
   ls -l ~/storage/shared/TermuxBackup
   ```

4. **Logs**:
   Check the log file for errors:
   ```bash
   cat ~/.scripts/cloud_sync.log
   ```

5. **Network Issues**:
   Ensure you have a stable internet connection before running the sync.