# Python Installation and Usage Guide for Termux

This guide provides detailed steps on how to install and use Python in Termux. Termux is a terminal emulator and Linux environment app for Android, allowing you to run a full-fledged Linux environment directly on your Android device. By following this guide, you can set up Python, manage dependencies, write scripts, and explore advanced features like virtual environments, automation, and web servers.

---

## Table of Contents

1. [Introduction](#introduction)
2. [Prerequisites](#prerequisites)
3. [Step 1: Update and Upgrade Termux Packages](#step-1-update-and-upgrade-termux-packages)
4. [Step 2: Install Python](#step-2-install-python)
5. [Step 3: Verify Python Installation](#step-3-verify-python-installation)
6. [Step 4: Using Python in Termux](#step-4-using-python-in-termux)
7. [Step 5: Creating and Running Python Scripts](#step-5-creating-and-running-python-scripts)
8. [Step 6: Install Micro Text Editor](#step-6-install-micro-text-editor)
9. [Step 7: Creating a Python Script with Micro](#step-7-creating-a-python-script-with-micro)
10. [Step 8: Installing Pip for Package Management](#step-8-installing-pip-for-package-management)
11. [Step 9: Installing and Using Virtual Environments](#step-9-installing-and-using-virtual-environments)
12. [Step 10: Running Python Scripts with Executable Permissions](#step-10-running-python-scripts-with-executable-permissions)
13. [Step 11: Installing Common Python Libraries](#step-11-installing-common-python-libraries)
14. [Step 12: Using Python for Automation in Termux](#step-12-using-python-for-automation-in-termux)
15. [Step 13: Setting Up a Web Server with Python](#step-13-setting-up-a-web-server-with-python)
16. [Step 14: Using Jupyter Notebook in Termux](#step-14-using-jupyter-notebook-in-termux)
17. [Troubleshooting](#troubleshooting)
18. [Additional Resources](#additional-resources)
19. [Conclusion](#conclusion)

---

## Introduction

Python is one of the most popular programming languages, known for its simplicity, versatility, and extensive library ecosystem. In this guide, we'll set up Python in Termux, create scripts, manage dependencies, and explore advanced features like automation, web servers, and Jupyter Notebooks. Whether you're a beginner or an experienced developer, this guide will help you get started with Python on your Android device.

---

## Prerequisites

Before proceeding, ensure the following:

- **Termux Installed**: Download from the [Google Play Store](https://play.google.com/store/apps/details?id=com.termux) or [F-Droid](https://f-droid.org/en/packages/com.termux/).
- **Storage Permission**: Grant storage access to Termux (`termux-setup-storage`).
- **Internet Connection**: A stable internet connection is required for downloading packages and tools.
- **Device Storage**: Ensure sufficient free storage space (at least 1 GB recommended).

---

## Step 1: Update and Upgrade Termux Packages
Ensure all Termux packages are up to date:
```bash
pkg update && pkg upgrade
```

This command updates the package lists and upgrades existing packages to their latest versions.

---

## Step 2: Install Python
Install Python using the Termux package manager:
```bash
pkg install python
```

This command installs Python along with its dependencies.

---

## Step 3: Verify Python Installation
Check the installed version of Python:
```bash
python --version
```

You should see output similar to:
```
Python 3.x.x
```

---

## Step 4: Using Python in Termux
Open the Python interactive shell:
```bash
python
```

You can now write and execute Python code interactively. For example:
```python
print("Hello, Termux!")
```

Exit the interactive shell by pressing `Ctrl + D`.

---

## Step 5: Creating and Running Python Scripts

### Step 5.1: Create a Python Script
Create a new Python script using any text editor available in Termux. We'll use `nano` for simplicity:
```bash
nano hello.py
```

Write the following code:
```python
print("Hello, Termux!")
```

Save the file by pressing `Ctrl + O`, then exit the editor by pressing `Ctrl + X`.

### Step 5.2: Run the Python Script
Run the script using:
```bash
python hello.py
```

Output:
```
Hello, Termux!
```

---

## Step 6: Install Micro Text Editor
Install `micro`, a modern and user-friendly terminal-based text editor:
```bash
pkg install micro
```

---

## Step 7: Creating a Python Script with Micro
Create a new Python script using `micro`:
```bash
micro hello.py
```

Write your Python code:
```python
name = input("Enter your name: ")
print(f"Hello, {name}!")
```

Save the file by pressing `Ctrl + S` and exit the editor by pressing `Ctrl + Q`.

Run the script:
```bash
python hello.py
```

Provide input when prompted:
```
Enter your name: Alice
Hello, Alice!
```

---

## Step 8: Installing Pip for Package Management
Install `pip`, the Python package installer:
```bash
pkg install python-pip
```

Verify the installation:
```bash
pip --version
```

---

## Step 9: Installing and Using Virtual Environments
Virtual environments isolate project dependencies. Install `virtualenv`:
```bash
pip install virtualenv
```

Create a virtual environment:
```bash
virtualenv myenv
```

Activate the virtual environment:
```bash
source myenv/bin/activate
```

Install packages within the virtual environment:
```bash
pip install requests
```

Deactivate the virtual environment:
```bash
deactivate
```

---

## Step 10: Running Python Scripts with Executable Permissions
Make a Python script executable:
```bash
chmod +x hello.py
```

Add a shebang line at the top of the script:
```python
#!/data/data/com.termux/files/usr/bin/python

print("Hello, Termux!")
```

Run the script directly:
```bash
./hello.py
```

---

## Step 11: Installing Common Python Libraries
Install popular Python libraries:
```bash
pip install numpy pandas requests flask
```

For more details on managing Python packages, refer to the [Pip Usage Guide](https://github.com/ysathyasai/Termux/blob/main/Programming%20Langs/Pip.md).

---

## Step 12: Using Python for Automation in Termux
Automate Termux commands using Python:
```python
import os

# List files in the current directory
os.system("ls")

# Create a directory
os.system("mkdir test_dir")
```

Run the script:
```bash
python automation.py
```

---

## Step 13: Setting Up a Web Server with Python
Start a simple HTTP server:
```bash
python -m http.server 8080
```

Open a browser and navigate to `http://localhost:8080` to view the contents of the current directory.

---

## Step 14: Using Jupyter Notebook in Termux
Install Jupyter Notebook:
```bash
pip install jupyter
```

Start Jupyter Notebook:
```bash
jupyter notebook
```

Access the notebook interface in your browser.

---

## Troubleshooting

### 1. Permission Denied Errors
- **Cause**: Missing permissions for global installations.
- **Solution**:
  Use the `--user` flag:
  ```bash
  pip install --user package_name
  ```

### 2. Outdated Pip
- **Cause**: Older versions of `pip` may cause issues.
- **Solution**:
  Upgrade `pip`:
  ```bash
  pip install --upgrade pip
  ```

### 3. Network Issues
- **Cause**: Unstable internet connection during package installation.
- **Solution**:
  Retry the installation or use a mirror:
  ```bash
  pip install package_name --index-url https://pypi.tuna.tsinghua.edu.cn/simple
  ```

---

## Additional Resources

- [Python Documentation](https://docs.python.org/3/)
- [Pip Documentation](https://pip.pypa.io/en/stable/)
- [Jupyter Notebook Documentation](https://jupyter.org/documentation)
- [Termux Wiki](https://wiki.termux.com/wiki/Main_Page)

---

## Conclusion

By following this guide, you have successfully installed and used Python in Termux. Whether you're writing simple scripts, automating tasks, or building web applications, Python provides a powerful and flexible environment. Combine it with tools like `pip`, virtual environments, and Jupyter Notebooks for a seamless development experience. Happy coding!