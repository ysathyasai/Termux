# Troubleshooting Guide for Termux

This document provides solutions to common issues users may face while setting up or using Termux and its associated tools. If you encounter a problem not listed here, feel free to open an issue in this repository or seek help from the Termux community.

---

## Table of Contents

1. [General Issues](#general-issues)
   - [Permission Denied Errors](#permission-denied-errors)
   - [Package Not Found](#package-not-found)
   - [Storage Access Problems](#storage-access-problems)
2. [Networking Issues](#networking-issues)
   - [Ping Fails or No Internet Connectivity](#ping-fails-or-no-internet-connectivity)
   - [Nmap Scans Fail](#nmap-scans-fail)
3. [Security Tools Issues](#security-tools-issues)
   - [Metasploit Installation Fails](#metasploit-installation-fails)
   - [Hashcat GPU Support Issues](#hashcat-gpu-support-issues)
4. [Media Tools Issues](#media-tools-issues)
   - [FFmpeg Encoding Errors](#ffmpeg-encoding-errors)
   - [ImageMagick Errors](#imagemagick-errors)
5. [System Tools Issues](#system-tools-issues)
   - [Cron Jobs Not Running](#cron-jobs-not-running)
   - [High CPU or Memory Usage](#high-cpu-or-memory-usage)

---

## General Issues

### Permission Denied Errors

**Symptoms**:
- Unable to access files or directories.
- Commands fail with "Permission denied."

**Solution**:
1. Grant Termux storage permissions:
   ```bash
   termux-setup-storage
   ```
2. Ensure the file or directory has the correct permissions:
   ```bash
   chmod +x script.sh
   ```

---

### Package Not Found

**Symptoms**:
- Error messages like "Package not found" or "Unable to locate package."

**Solution**:
1. Update your package list:
   ```bash
   pkg update
   ```
2. Reinstall the package:
   ```bash
   pkg install <package_name>
   ```
3. If the issue persists, check if the package is available in the Termux repositories:
   ```bash
   pkg search <package_name>
   ```

---

### Storage Access Problems

**Symptoms**:
- Unable to access files in `~/storage/shared`.
- Error messages like "No such file or directory."

**Solution**:
1. Re-run the storage setup command:
   ```bash
   termux-setup-storage
   ```
2. Check if the symbolic link exists:
   ```bash
   ls ~/storage
   ```
3. If the issue persists, restart Termux or your device.

---

## Networking Issues

### Ping Fails or No Internet Connectivity

**Symptoms**:
- `ping` commands fail or return "Network unreachable."

**Solution**:
1. Check your internet connection on your device.
2. Verify DNS settings:
   ```bash
   nslookup google.com
   ```
3. Restart Termux or your device.

---

### Nmap Scans Fail

**Symptoms**:
- Nmap scans return no results or fail.

**Solution**:
1. Run Nmap with root privileges (if supported):
   ```bash
   tsu
   nmap <target>
   ```
2. Use the `-Pn` flag to skip host discovery:
   ```bash
   nmap -Pn <target>
   ```

---

## Security Tools Issues

### Metasploit Installation Fails

**Symptoms**:
- Metasploit installation script fails or crashes.

**Solution**:
1. Ensure sufficient storage space is available.
2. Re-run the installation script:
   ```bash
   ./metasploit.sh
   ```
3. If the issue persists, manually install dependencies:
   ```bash
   pkg install ruby postgresql -y
   ```

---

### Hashcat GPU Support Issues

**Symptoms**:
- Hashcat fails to utilize GPU acceleration.

**Solution**:
1. Note that GPU acceleration is limited on Android devices.
2. Use CPU-only mode:
   ```bash
   hashcat -m 0 hash.txt wordlist.txt
   ```
3. Consider using a desktop environment for GPU-intensive tasks.

---

## Media Tools Issues

### FFmpeg Encoding Errors

**Symptoms**:
- FFmpeg fails to encode or convert files.

**Solution**:
1. Ensure the input file is not corrupted.
2. Use the `-v error` flag to debug errors:
   ```bash
   ffmpeg -v error -i input.mp4 output.mp4
   ```
3. Specify codecs explicitly:
   ```bash
   ffmpeg -i input.mp4 -c:v libx264 -c:a aac output.mp4
   ```

---

### ImageMagick Errors

**Symptoms**:
- ImageMagick fails to process images.

**Solution**:
1. Ensure the input file format is supported.
2. Install additional delegates for unsupported formats:
   ```bash
   pkg install imagemagick-delegates
   ```
3. Check file permissions and paths.

---

## System Tools Issues

### Cron Jobs Not Running

**Symptoms**:
- Scheduled cron jobs do not execute.

**Solution**:
1. Start the cron service:
   ```bash
   crond
   ```
2. Check the cron logs:
   ```bash
   cat /data/data/com.termux/files/usr/var/log/cron.log
   ```
3. Verify the crontab syntax:
   ```bash
   crontab -e
   ```

---

### High CPU or Memory Usage

**Symptoms**:
- Termux consumes excessive CPU or memory.

**Solution**:
1. Monitor resource usage:
   ```bash
   htop
   ```
2. Terminate unnecessary processes:
   ```bash
   kill <PID>
   ```
3. Reduce the workload or close unused Termux sessions.

---

## Additional Resources

If you're unable to resolve your issue using this guide, consider the following resources:

- **Termux Wiki**: [https://wiki.termux.com](https://wiki.termux.com)
- **Termux GitHub Issues**: [https://github.com/termux/termux-app/issues](https://github.com/termux/termux-app/issues)
- **Community Forums**: Join the Termux community on Reddit or Telegram for additional support.

---

Happy troubleshooting! 🛠️