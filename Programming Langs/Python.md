# Python Installation and Usage Guide for Termux

## Introduction
This guide provides detailed steps on how to install and use Python in Termux. Termux is a terminal emulator and Linux environment app for Android. It allows you to run a full-fledged Linux environment on your Android device.

## Prerequisites
Before you begin, ensure that you have Termux installed on your Android device. You can download it from the [Google Play Store](https://play.google.com/store/apps/details?id=com.termux) or [F-Droid](https://f-droid.org/en/packages/com.termux/).
Or else go with this [guide](https://github.com/ysathyasai/Termux/blob/main/Guide.md).

## Step 1: Update and Upgrade Termux Packages
First, update and upgrade the Termux packages to ensure that you have the latest package lists:
```sh
pkg update && pkg upgrade
```

## Step 2: Install Python
To install Python in Termux, run the following command:
```sh
pkg install python
```
This command will install Python along with the necessary dependencies.

## Step 3: Verify Python Installation
After the installation is complete, you can verify that Python is installed correctly by checking the version:
```sh
python --version
```
You should see the installed Python version displayed.

## Step 4: Using Python in Termux
You can now start using Python in Termux. To open the Python interactive shell, simply type:
```sh
python
```
You can write and execute Python code directly in the interactive shell.

## Step 5: Creating and Running Python Scripts
To create a Python script, you can use any text editor available in Termux. We will use the Micro text editor for this guide.

## Step 6: Install Micro Text Editor
Micro is a modern and easy-to-use terminal-based text editor. Install it with:
```sh
pkg install micro
```

## Step 7: Creating a Python Script with Micro
To create a script called `hello.py` using Micro, run:
```sh
micro hello.py
```
In the Micro editor, write your Python code. For example:
```python
print("Hello, Termux!")
```
Save the file by pressing `Ctrl + S` and exit the editor by pressing `Ctrl + Q`. To run the script, use the following command:
```sh
python hello.py
```
You should see the output `Hello, Termux!` displayed.

## Step 8: Installing Pip for Package Management
`pip` is essential for installing Python packages. Install and verify it with:
```sh
pkg install python-pip
pip --version
```

## Step 9: Installing and Using Virtual Environments
Virtual environments help manage dependencies:
```sh
pip install virtualenv
virtualenv myenv
source myenv/bin/activate
```

## Step 10: Running Python Scripts with Executable Permissions
Allow Python scripts to be executed without explicitly calling `python`:
```sh
chmod +x hello.py
./hello.py
```

## Step 11: Installing Common Python Libraries
Users might want to install popular Python libraries like NumPy, Pandas, etc.:
For the pip guide [check this](https://github.com/ysathyasai/Termux/blob/main/Programming%20Langs/Pip.md)
```sh
pip install numpy pandas requests
```

## Step 12: Using Python for Automation in Termux
Python can be used to automate Termux commands:
```python
import os
os.system("ls")
```

## Step 13: Setting Up a Web Server with Python
You can start a simple HTTP server:
```sh
python -m http.server 8080
```

## Step 14: Using Jupyter Notebook in Termux
For advanced users:
```sh
pip install jupyter
jupyter notebook
```

## Conclusion
You have successfully installed and used Python in Termux. This guide covered the basic steps to get you started. For more advanced usage and features, refer to the official Python documentation.

Happy coding!
