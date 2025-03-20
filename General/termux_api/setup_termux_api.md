# Termux API Setup Guide

This guide explains how to install, configure, and use the Termux API to access Android device features from within Termux. The Termux API provides a bridge between your terminal and Android's system functionalities, enabling tasks like sending notifications, taking photos, accessing location data, and more.

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
   - [Step 1: Install Termux API Packages](#step-1-install-termux-api-packages)
   - [Step 2: Grant Required Permissions](#step-2-grant-required-permissions)
4. [Using the Termux API](#using-the-termux-api)
   - [Basic Commands](#basic-commands)
   - [Example Use Cases](#example-use-cases)
5. [Troubleshooting](#troubleshooting)
6. [Conclusion](#conclusion)

---

## Overview

The Termux API extends the functionality of Termux by allowing you to interact with Android device features programmatically. It includes tools for sending notifications, vibrating the device, accessing the camera, reading sensor data, and more. This guide will walk you through setting up and using the Termux API effectively.

---

## Prerequisites

Before proceeding, ensure the following:

- **Termux App**: Latest version installed from the Play Store or F-Droid.
- **Termux:API Add-on**: Installed from the Play Store or F-Droid.
- **Storage Permission**: Granted to Termux (`termux-setup-storage`).
- **Basic Knowledge**: Familiarity with Linux commands and Termux.

---

## Installation

### Step 1: Install Termux API Packages
Install the required Termux API packages:
```bash
pkg update -y && pkg install termux-api -y
```

- **Explanation**:
  - `termux-api`: Provides command-line tools for interacting with Android features.

### Step 2: Grant Required Permissions
After installing the Termux:API add-on, grant the necessary permissions:
1. Open the **Termux:API** app on your Android device.
2. Grant permissions for features like **Camera**, **Location**, **SMS**, and **Notifications** when prompted.

You can also verify and manage permissions in your device's **Settings > Apps > Termux:API > Permissions**.

---

## Using the Termux API

### Basic Commands

Here are some basic commands provided by the Termux API:

#### 1. Send a Notification
Send a notification to your device:
```bash
termux-notification --title "Hello" --content "This is a test notification"
```

#### 2. Vibrate the Device
Vibrate the device for 1 second:
```bash
termux-vibrate -d 1000
```

#### 3. Access the Camera
Take a photo using the device's camera:
```bash
termux-camera-photo -c 0 ~/storage/shared/photo.jpg
```
- `-c 0`: Specifies the camera (0 for rear, 1 for front).
- `~/storage/shared/photo.jpg`: Saves the photo to shared storage.

#### 4. Get Location Data
Fetch the device's current GPS location:
```bash
termux-location
```

#### 5. Read Sensor Data
Read data from the device's sensors (e.g., accelerometer):
```bash
termux-sensor -s ACCELEROMETER -n 5
```
- `-s ACCELEROMETER`: Specifies the sensor type.
- `-n 5`: Reads 5 samples.

#### 6. Send an SMS
Send an SMS message:
```bash
termux-sms-send -n <phone_number> "Your message here"
```
Replace `<phone_number>` with the recipient's phone number.

---

### Example Use Cases

#### 1. Automate Notifications
Create a script to send daily reminders:
```bash
#!/data/data/com.termux/files/usr/bin/bash

termux-notification --title "Reminder" --content "Don't forget to complete your tasks today!"
```

Make the script executable:
```bash
chmod +x ~/reminder.sh
```

Schedule it with cron:
```bash
crontab -e
```
Add the following line to run the script daily at 8 AM:
```bash
0 8 * * * ~/reminder.sh
```

#### 2. Capture a Photo and Save It
Create a script to capture a photo and save it to shared storage:
```bash
#!/data/data/com.termux/files/usr/bin/bash

echo "Capturing photo..."
termux-camera-photo -c 0 ~/storage/shared/photo_$(date +%Y%m%d_%H%M%S).jpg
echo "Photo saved to shared storage."
```

#### 3. Monitor Device Sensors
Monitor the accelerometer in real-time:
```bash
termux-sensor -s ACCELEROMETER -d 1000
```
- `-d 1000`: Sets a delay of 1 second between readings.

---

## Troubleshooting

### 1. Commands Not Working
- **Cause**: Missing permissions or Termux:API add-on not installed.
- **Solution**:
  - Ensure the Termux:API add-on is installed and permissions are granted.
  - Reinstall the `termux-api` package:
    ```bash
    pkg reinstall termux-api
    ```

### 2. Permission Denied Errors
- **Cause**: Insufficient permissions for specific features (e.g., SMS, Camera).
- **Solution**:
  - Go to **Settings > Apps > Termux:API > Permissions** and enable the required permissions.

### 3. Command Not Found
- **Cause**: `termux-api` package not installed.
- **Solution**:
  - Install the package:
    ```bash
    pkg install termux-api -y
    ```

### 4. Slow or Unresponsive Commands
- **Cause**: High resource usage or unstable connection.
- **Solution**:
  - Restart Termux and ensure your device has sufficient resources.

---

## Conclusion

By following this guide, you can set up and use the Termux API to interact with Android device features directly from your terminal. Whether you're automating tasks, monitoring sensors, or accessing hardware components, the Termux API provides a powerful toolkit for extending the capabilities of Termux. Experiment with the commands and scripts provided to unlock the full potential of your Android device!