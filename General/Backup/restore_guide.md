# Restore Guide for Termux

This guide explains how to restore your Termux environment from a backup. The process includes restoring configurations, installed packages, scripts, and data from a previously created backup archive.

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Restoring from Local Backup](#restoring-from-local-backup)
4. [Restoring from Cloud Backup](#restoring-from-cloud-backup)
5. [Reinstalling Packages](#reinstalling-packages)
6. [Troubleshooting](#troubleshooting)

---

## Overview

Restoring your Termux environment ensures you can recover your setup after a device reset, corruption, or loss. This guide covers restoring backups stored locally or synced to cloud storage (e.g., Google Drive, Dropbox).

---

## Prerequisites

Before proceeding, ensure the following:

- **Backup File**: A valid backup archive created using the `backup_guide.md`.
- **Termux App**: Latest version installed.
- **Storage Permission**: Granted to Termux (`termux-setup-storage`).
- **Basic Tools**: Install required packages:
  ```bash
  pkg install tar gzip rclone -y
  ```

---

## Restoring from Local Backup

### Step 1: Locate the Backup File
Ensure your backup file is accessible. If stored locally, it should be in:
```bash
~/storage/shared/TermuxBackup/
```

List the files to confirm:
```bash
ls ~/storage/shared/TermuxBackup/
```

### Step 2: Extract the Backup Archive
Navigate to your home directory and extract the backup:
```bash
cd ~
tar -xzf ~/storage/shared/TermuxBackup/termux_backup_<timestamp>.tar.gz
```

Replace `<timestamp>` with the actual timestamp of your backup file.

### Step 3: Verify the Restoration
Check if the files have been restored:
```bash
ls ~
```

---

## Restoring from Cloud Backup

### Step 1: Download the Backup from Cloud
If your backup is stored in the cloud (e.g., Google Drive), use `rclone` to download it:
```bash
rclone copy gdrive:/TermuxBackup/termux_backup_<timestamp>.tar.gz ~/storage/shared/TermuxBackup/
```

Verify the download:
```bash
ls ~/storage/shared/TermuxBackup/
```

### Step 2: Extract the Backup Archive
Extract the downloaded backup archive:
```bash
cd ~
tar -xzf ~/storage/shared/TermuxBackup/termux_backup_<timestamp>.tar.gz
```

---

## Reinstalling Packages

### Step 1: Generate a Package List (Optional)
If you backed up a package list (`pkg_list.txt`), reinstall the packages:
```bash
pkg install $(cat ~/pkg_list.txt) -y
```

If no package list exists, manually reinstall essential packages:
```bash
pkg install git curl zsh tmux vim -y
```

### Step 2: Reapply Configurations
If you use custom configurations (e.g., `.bashrc`, `.zshrc`), ensure they are restored correctly:
```bash
source ~/.bashrc
```

For Zsh users:
```bash
source ~/.zshrc
```

---

## Troubleshooting

1. **Restore Fails**:
   Verify the integrity of the backup archive:
   ```bash
   tar -tzf ~/storage/shared/TermuxBackup/termux_backup_<timestamp>.tar.gz
   ```

2. **Missing Files**:
   Ensure the backup includes all necessary files by reviewing the `tar` command used during creation.

3. **Package Installation Issues**:
   Update the package list before reinstalling:
   ```bash
   pkg update
   ```

4. **Configuration Errors**:
   Check for syntax errors in configuration files:
   ```bash
   bash -n ~/.bashrc
   ```

5. **Cloud Sync Issues**:
   Check the log file for errors:
   ```bash
   cat ~/.scripts/cloud_sync.log
   ```