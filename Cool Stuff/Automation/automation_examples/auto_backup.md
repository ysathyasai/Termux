# Automated Backup Guide for Termux

This guide explains how to set up automated backups for your Termux environment using a custom bash script and cron jobs. The backup system ensures that your Termux data (configurations, installed packages, scripts, etc.) is safely backed up on a regular basis.

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Backup Script](#backup-script)
4. [How It Works](#how-it-works)
5. [Step-by-Step Setup](#step-by-step-setup)
   - [Step 1: Create the Backup Script](#step-1-create-the-backup-script)
   - [Step 2: Make the Script Executable](#step-2-make-the-script-executable)
   - [Step 3: Schedule Backups with Cron](#step-3-schedule-backups-with-cron)
6. [Backup Location](#backup-location)
7. [Restoring from Backup](#restoring-from-backup)
8. [Troubleshooting](#troubleshooting)

---

## Overview

Backing up your Termux environment is essential to prevent data loss due to accidental deletions, device resets, or other issues. This guide provides a simple and automated way to back up your Termux files, configurations, and installed packages.

The backup process:
- Creates compressed `.tar.gz` archives of your Termux home directory.
- Excludes external storage directories to save space.
- Retains only the last 5 backups to avoid excessive storage usage.
- Can be scheduled to run automatically using cron jobs.

---

## Prerequisites

Before setting up the backup system, ensure the following:

- **Termux App**: Installed on your Android device.
- **Termux:API Add-on**: Installed from the Play Store or F-Droid.
- **Storage Permission**: Grant storage access by running:
  ```bash
  termux-setup-storage
  ```
- **Cron Installed**: Required for scheduling automated backups. Install it using:
  ```bash
  pkg install cronie
  ```

---

## Backup Script

The backup script is a Bash script that performs the following tasks:
1. Creates a timestamped backup archive of your Termux environment.
2. Stores the backup in a specified directory.
3. Deletes older backups to retain only the last 5.

Here is the script content:

```bash
#!/data/data/com.termux/files/usr/bin/bash

# Set the backup directory
BACKUP_DIR="$HOME/storage/shared/TermuxBackup"

# Generate a timestamp for the backup file
DATE=$(date +%Y%m%d_%H%M%S)

# Define the backup file name
BACKUP_FILE="termux_backup_$DATE.tar.gz"

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Perform the backup
tar -zcf "$BACKUP_DIR/$BACKUP_FILE" \
    -C $HOME \
    --exclude="storage" \
    .

# Keep only the last 5 backups
cd "$BACKUP_DIR" && ls -t termux_backup_* | tail -n +6 | xargs -r rm -f
```

---

## How It Works

1. **Set Backup Directory**: The script specifies a directory (`$HOME/storage/shared/TermuxBackup`) where backups will be stored.
2. **Create Archive**: It compresses the Termux home directory into a `.tar.gz` file, excluding the `storage` directory.
3. **Delete Old Backups**: Only the latest 5 backups are retained to save space.

---

## Step-by-Step Setup

### Step 1: Create the Backup Script

1. Open Termux and create a directory for your scripts:
   ```bash
   mkdir -p ~/.scripts
   ```

2. Use a text editor like `nano` to create the backup script:
   ```bash
   nano ~/.scripts/auto_backup.sh
   ```

3. Copy and paste the script content provided above into the editor.

4. Save the file and exit (`Ctrl+O`, then `Enter` to save, and `Ctrl+X` to exit).

### Step 2: Make the Script Executable

Make the script executable by running:
```bash
chmod +x ~/.scripts/auto_backup.sh
```

### Step 3: Schedule Backups with Cron

1. Install `cronie` (if not already installed):
   ```bash
   pkg install cronie
   ```

2. Start the cron service:
   ```bash
   crond
   ```

3. Edit the cron jobs:
   ```bash
   crontab -e
   ```

4. Add the following line to schedule daily backups at 2 AM:
   ```bash
   0 2 * * * ~/.scripts/auto_backup.sh >> ~/.scripts/backup.log 2>&1
   ```

   - This logs both standard output and errors to `~/.scripts/backup.log`.

5. Save and exit the crontab editor.

---

## Backup Location

Backups are stored in:
```
/storage/emulated/0/TermuxBackup/
```

Each backup file is named in the format:
```
termux_backup_YYYYMMDD_HHMMSS.tar.gz
```

---

## Restoring from Backup

To restore your Termux environment from a backup:

1. Navigate to your Termux home directory:
   ```bash
   cd $HOME
   ```

2. Extract the backup file:
   ```bash
   tar -xf /path/to/backup/termux_backup_YYYYMMDD_HHMMSS.tar.gz
   ```

Replace `/path/to/backup/termux_backup_YYYYMMDD_HHMMSS.tar.gz` with the actual path to your backup file.

---

## Troubleshooting

If the backup fails, check the following:

- **Storage Permissions**: Ensure you granted storage access using `termux-setup-storage`.
- **Backup Directory**: Verify that the backup directory exists and is accessible.
- **Cron Logs**: Check the cron log file (`~/.scripts/backup.log`) for errors.
- **Free Space**: Ensure there is enough storage space on your device.
- **Script Execution**: Test the script manually by running:
  ```bash
  ~/.scripts/auto_backup.sh
  ```

---

By following this guide, you will have a reliable automated backup system for your Termux environment. This ensures that your data is safely backed up and can be restored whenever needed.