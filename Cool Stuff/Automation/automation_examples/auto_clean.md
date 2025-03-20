# Cleanup and Optimization Guide for Termux

This guide explains how to clean up unnecessary files, free up storage space, and optimize your Termux environment using a custom bash script. The cleanup process removes temporary files, unused packages, and cached data while ensuring your Termux setup remains efficient.

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Cleanup Script](#cleanup-script)
4. [How It Works](#how-it-works)
5. [Step-by-Step Setup](#step-by-step-setup)
   - [Step 1: Create the Cleanup Script](#step-1-create-the-cleanup-script)
   - [Step 2: Make the Script Executable](#step-2-make-the-script-executable)
   - [Step 3: Run the Script Manually or Schedule It](#step-3-run-the-script-manually-or-schedule-it)
6. [What Gets Cleaned](#what-gets-cleaned)
7. [Troubleshooting](#troubleshooting)

---

## Overview

Over time, Termux accumulates temporary files, unused packages, and cached data that can consume storage space and slow down your environment. This guide provides a simple and automated way to clean up these files and optimize your Termux setup.

The cleanup process:
- Removes unused packages and dependencies.
- Clears package cache and temporary files.
- Deletes unnecessary files from the Termux home directory.
- Can be run manually or scheduled for regular maintenance.

---

## Prerequisites

Before setting up the cleanup system, ensure the following:

- **Termux App**: Installed on your Android device.
- **Package Manager**: Ensure `pkg` is available (pre-installed with Termux).
- **Storage Permission**: Grant storage access by running:
  ```bash
  termux-setup-storage
  ```
- **Cron Installed** (optional): Required for scheduling automated cleanups. Install it using:
  ```bash
  pkg install cronie
  ```

---

## Cleanup Script

The cleanup script is a Bash script that performs the following tasks:
1. Removes unused packages and dependencies.
2. Clears package cache and temporary files.
3. Deletes unnecessary files from the Termux home directory.

Here is the script content:

```bash
#!/data/data/com.termux/files/usr/bin/bash

# ==========================================
# Cleanup and Optimization Script for Termux
# ==========================================

# Log the start of the cleanup process
echo "[$(date)] Starting cleanup process..."

# Step 1: Remove unused packages and dependencies
echo "[$(date)] Removing unused packages and dependencies..."
pkg autoremove -y

# Step 2: Clear package cache
echo "[$(date)] Clearing package cache..."
pkg clean

# Step 3: Delete temporary files
echo "[$(date)] Deleting temporary files..."
rm -rf $HOME/.tmp/* || true
rm -rf $HOME/tmp/* || true

# Step 4: Delete unnecessary files (customize as needed)
echo "[$(date)] Deleting unnecessary files..."
rm -f $HOME/*.log || true
rm -f $HOME/*.tmp || true

# Log the completion of the cleanup process
echo "[$(date)] Cleanup process completed."
```

---

## How It Works

1. **Remove Unused Packages**: The `pkg autoremove` command removes unused packages and dependencies.
2. **Clear Package Cache**: The `pkg clean` command clears downloaded package files and cached data.
3. **Delete Temporary Files**: Removes files in `$HOME/.tmp` and `$HOME/tmp`.
4. **Customizable Cleanup**: Deletes specific file types (e.g., `.log`, `.tmp`) from the home directory.

---

## Step-by-Step Setup

### Step 1: Create the Cleanup Script

1. Open Termux and create a directory for your scripts:
   ```bash
   mkdir -p ~/.scripts
   ```

2. Use a text editor like `nano` to create the cleanup script:
   ```bash
   nano ~/.scripts/cto_clean.sh
   ```

3. Copy and paste the script content provided above into the editor.

4. Save the file and exit (`Ctrl+O`, then `Enter` to save, and `Ctrl+X` to exit).

### Step 2: Make the Script Executable

Make the script executable by running:
```bash
chmod +x ~/.scripts/cto_clean.sh
```

### Step 3: Run the Script Manually or Schedule It

#### Option 1: Run Manually
You can run the script manually whenever you want to clean up your Termux environment:
```bash
~/.scripts/cto_clean.sh
```

#### Option 2: Schedule with Cron
To automate the cleanup process:

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

4. Add the following line to schedule weekly cleanups every Sunday at midnight:
   ```bash
   0 0 * * 0 ~/.scripts/cto_clean.sh >> ~/.scripts/cleanup.log 2>&1
   ```

   - This logs both standard output and errors to `~/.scripts/cleanup.log`.

5. Save and exit the crontab editor.

---

## What Gets Cleaned

The script cleans up the following:
- **Unused Packages**: Removes packages no longer required by your system.
- **Package Cache**: Deletes downloaded package files and cached data.
- **Temporary Files**: Removes files in `$HOME/.tmp` and `$HOME/tmp`.
- **Customizable Files**: Deletes specific file types (e.g., `.log`, `.tmp`) from the home directory.

---

## Troubleshooting

If the cleanup fails, check the following:

- **Permissions**: Ensure you have write permissions for the directories being cleaned.
- **Logs**: Check the log file (`~/.scripts/cleanup.log`) for errors.
- **Customization**: Modify the script to exclude files or directories you don't want to delete.
- **Manual Execution**: Test the script manually by running:
  ```bash
  ~/.scripts/cto_clean.sh
  ```

---

By following this guide, you will have a reliable cleanup and optimization system for your Termux environment. This ensures that your Termux setup remains efficient and free of unnecessary clutter.