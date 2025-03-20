# Shell Scripting Guide for Termux

## Introduction
This guide provides detailed steps on how to write and execute shell scripts in Termux. Shell scripting allows you to automate tasks, run multiple commands, and manage complex workflows in the terminal. Termux is a terminal emulator and Linux environment app for Android, which allows you to run a full-fledged Linux environment on your Android device.

## Prerequisites
Before you begin, ensure that you have Termux installed on your Android device. You can download it from the [Google Play Store](https://play.google.com/store/apps/details?id=com.termux) or [F-Droid](https://f-droid.org/en/packages/com.termux/).
Alternatively, follow this [guide](https://github.com/ysathyasai/Termux/blob/main/Guide.md) for installation instructions.

## Step 1: Basics of Shell Scripting
Shell scripting involves writing a series of commands in a file, which can be executed as a script. The most common shell used in Termux is the Bourne Again Shell (bash). Note that Termux's default shell is dash. If you prefer Bash, you should install it and set it as the default.

### Installing Bash
To install Bash, run:
```sh
pkg install bash
chsh -s bash
```

### Note on Shell Differences
Dash and Bash have some differences in syntax and features. For example, function declarations in dash use `name() { ... }` while Bash supports both `name() { ... }` and `function name { ... }`. Ensure you use the correct syntax for your chosen shell.

### Hello World Script
To create a simple "Hello World" script:

1. Open Termux and create a new file using a text editor like `nano` or `vi`:
    ```sh
    nano hello.sh
    ```

2. Add the following lines to the file:
    ```sh
    #!/bin/bash
    echo "Hello, Termux!"
    ```

3. Save the file and exit the editor (`Ctrl + X` in nano, `:wq` in vi).

### Making the Script Executable
To make the script executable, use the `chmod` command:
```sh
chmod +x hello.sh
```

### Running the Script
To run the script, use:
```sh
./hello.sh
```

## Step 2: Writing and Executing Shell Scripts
### Variables
You can define variables in a shell script to store values:
```sh
#!/bin/bash
name="John"
echo "Hello, $name!"
```

### Conditional Statements
Conditional statements allow you to execute commands based on certain conditions:
```sh
#!/bin/bash
if [ "$name" == "John" ]; then
    echo "Hello, John!"
else
    echo "Hello, Stranger!"
fi
```

### Loops
Loops allow you to repeat commands multiple times:
```sh
#!/bin/bash
for i in {1..5}; do
    echo "Iteration $i"
done
```

### Functions
Functions allow you to group commands and reuse them:
```sh
#!/bin/bash
greet() {
    echo "Hello, $1!"
}
greet "John"
```

### Interactive User Input
You can prompt the user for input and use it in your script:
```sh
#!/bin/bash
echo "Enter your name:"
read user_name
echo "Hello, $user_name!"
```

## Step 3: Common Shell Commands and Utilities
### File Management
- `ls`: List directory contents
- `cp`: Copy files and directories
- `mv`: Move or rename files and directories
- `rm`: Remove files and directories

### Text Processing
- `cat`: Concatenate and display file contents
- `grep`: Search for patterns in files
- `awk`: Pattern scanning and processing language
- `sed`: Stream editor for filtering and transforming text

### System Monitoring
- `top`: Display tasks and system status
- `ps`: Report a snapshot of current processes
- `df`: Report file system disk space usage
- `du`: Estimate file space usage

### Networking
- `ping`: Send ICMP ECHO_REQUEST to network hosts
- `curl`: Transfer data from or to a server
- `wget`: Retrieve files from the web

## Step 4: Automating Tasks with Scripts
Shell scripts can be used to automate repetitive tasks, such as backups, system monitoring, and data processing.

### Example: Backup Script
Create a script to back up a directory:
```sh
#!/bin/bash
source_dir="/path/to/source"
backup_dir="/path/to/backup"
timestamp=$(date +%Y%m%d%H%M%S)
tar -czf "$backup_dir/backup-$timestamp.tar.gz" "$source_dir"
echo "Backup completed: $backup_dir/backup-$timestamp.tar.gz"
```

### Example: System Monitoring Script
Create a script to monitor system resources:
```sh
#!/bin/bash
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | \
sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
awk '{print 100 - $1"%"}'

echo "Memory Usage:"
free -h | grep Mem | awk '{print $3"/"$2}'

echo "Disk Usage:"
df -h | grep '/$' | awk '{print $3"/"$2}'
```

## Step 5: Error Handling in Scripts
You can handle errors using `set -e` or by checking exit statuses:
```sh
#!/bin/bash
set -e
cp /path/to/source /path/to/destination || echo "Copy failed"
```

## Step 6: Using termux-wake-lock for Long-Running Scripts
To prevent Termux from stopping a script when the screen is off, use `termux-wake-lock`:
```sh
termux-wake-lock
# Your long-running script here
termux-wake-unlock
```
Note that `termux-wake-lock` prevents the device from sleeping but does not prevent Termux from being killed by Android's battery optimization. You might need to disable battery optimization for Termux in your device settings.

## Step 7: Scheduling Scripts with Cron
You can schedule scripts to run at specific intervals using `cron`. Termux uses `crond` for cron jobs.

### Install and Start Cron
To install and start `crond`, run:
```sh
pkg install cronie
crond
```

### Ensure crond Runs on Boot
Add `crond &` to your `.bashrc` or `.profile` to ensure the cron daemon starts automatically:
```sh
echo "crond &" >> ~/.bashrc
source ~/.bashrc
```

### Edit the Crontab
To edit the crontab, use:
```sh
crontab -e
```

### Add a Cron Job
Add a line to schedule a script, e.g., to run `backup.sh` every day at 2 AM:
```sh
0 2 * * * /path/to/backup.sh
```

### Permission Issues with Crontab
If you face permission issues while using `crontab -e`, check logs via:
```sh
logcat -s crond
```

### Cron Permissions Note
Some Android versions restrict background execution. If `crond` does not persist after closing Termux, consider using alternative solutions like Termux:Boot (for rooted users) or using `at` instead of `cron`.

## Step 8: Debugging Tips
To debug scripts, you can use `set -x` to print each command before it is executed:
```sh
#!/bin/bash
set -x
# Your script here
```

## Conclusion
You have successfully learned the basics of shell scripting in Termux, including writing and executing scripts, using common shell commands and utilities, automating tasks, handling errors, and scheduling scripts with cron. For more advanced usage and features, refer to the official bash documentation and other shell scripting resources.

Happy scripting!
