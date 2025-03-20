# Git Installation and Usage Guide for Termux

## Introduction
This guide provides detailed steps on how to install and use Git in Termux. Git is a distributed version control system that allows you to track changes in your source code during software development. Termux is a terminal emulator and Linux environment app for Android, which allows you to run a full-fledged Linux environment on your Android device.

For more information about this repository, visit:
```bash
git clone https://github.com/ysathyasai/Termux.git
```
This repository is licensed under the **Apache 2.0 License**.

---

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Step 1: Update and Upgrade Termux Packages](#step-1-update-and-upgrade-termux-packages)
3. [Step 2: Install Git](#step-2-install-git)
4. [Step 3: Verify Git Installation](#step-3-verify-git-installation)
5. [Step 4: Configure Git](#step-4-configure-git)
6. [Step 5: Setting Up SSH Authentication for GitHub](#step-5-setting-up-ssh-authentication-for-github)
7. [Step 6: Basic Git Commands](#step-6-basic-git-commands)
8. [Step 7: Advanced Git Commands](#step-7-advanced-git-commands)
9. [Troubleshooting](#troubleshooting)
10. [Repository Information](#repository-information)

---

## Prerequisites

Before you begin, ensure that you have Termux installed on your Android device. You can download it from the [F-Droid](https://f-droid.org/en/packages/com.termux/) or follow this [guide](https://github.com/ysathyasai/Termux/blob/main/Guide.md) for installation instructions.

Additionally, grant storage permissions to Termux if required:
```bash
termux-setup-storage
```

---

## Step 1: Update and Upgrade Termux Packages

First, update and upgrade the Termux packages to ensure that you have the latest package lists:
```bash
pkg update && pkg upgrade -y
```

---

## Step 2: Install Git

To install Git in Termux, run the following command:
```bash
pkg install git -y
```

---

## Step 3: Verify Git Installation

After the installation is complete, verify that Git is installed correctly by checking the version:
```bash
git --version
```
You should see the installed Git version displayed.

---

## Step 4: Configure Git

Before using Git, configure your Git environment by setting your username and email address:
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

Check your configuration:
```bash
git config --list
```

---

## Step 5: Setting Up SSH Authentication for GitHub

Using SSH is the recommended method for authenticating with GitHub in Termux.

### Generate SSH Key

To generate an SSH key, use the following command:
```bash
ssh-keygen -t rsa -b 4096 -C "your.email@example.com"
```
Follow the prompts to save the key and set a passphrase (optional).

### Start the SSH Agent

To start the SSH agent and add your SSH key:
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

### Add SSH Key to GitHub

Copy your SSH key to the clipboard:
```bash
cat ~/.ssh/id_rsa.pub
```

---
<h2>Log in to your GitHub account, go to **Settings > SSH and GPG keys**, and add your SSH key.</h2>

---


### Test SSH Connection

To verify that the SSH connection is working, run:
```bash
ssh -T git@github.com
```
If successful, you should see a message like:
```
Hi username! You've successfully authenticated, but GitHub does not provide shell access.
```

### Clone Repository with SSH

To clone a repository using SSH, use the following command:
```bash
git clone git@github.com:username/repository.git
```

---

## Step 6: Basic Git Commands

Here are some basic Git commands to get you started:

### Initialize a Repository
To create a new Git repository, use the following command:
```bash
git init
```

### Check Repository Status
To check the status of your repository, use the following command:
```bash
git status
```

### Add Files to Staging Area
To add a file to the staging area, use the following command:
```bash
git add filename
```
To add all files to the staging area, use:
```bash
git add .
```

### Commit Changes
To commit changes to your repository, use the following command:
```bash
git commit -m "Your commit message"
```

### Push Changes
To push your changes to a remote repository, use the following command:
```bash
git push origin branch_name
```

### Pull Changes
To pull changes from a remote repository, use the following command:
```bash
git pull origin branch_name
```

### Create a New Branch
To create a new branch, use the following command:
```bash
git branch branch_name
```

### Switch to a Branch
To switch to a different branch, use the following command:
```bash
git checkout branch_name
```

### Merge Branches
To merge a branch into the current branch, use the following command:
```bash
git merge branch_name
```

### Delete a Branch
To delete a branch, use the following command:
```bash
git branch -d branch_name
```

---

## Step 7: Advanced Git Commands

Here are some advanced Git commands for more complex workflows:

### Stash Changes
To stash your changes, use the following command:
```bash
git stash
```
To apply stashed changes, use:
```bash
git stash apply
```

### View Commit History
To view the commit history, use the following command:
```bash
git log
```

### Revert a Commit
To revert a commit, use the following command:
```bash
git revert commit_hash
```

### Reset to a Previous Commit
To reset your repository to a previous commit, use the following command:
```bash
git reset --hard commit_hash
```

### Cherry-Pick a Commit
To cherry-pick a commit from another branch, use the following command:
```bash
git cherry-pick commit_hash
```

### Rebase Branches
To rebase your current branch onto another branch, use the following command:
```bash
git rebase branch_name
```

---

## Troubleshooting

### Permission Denied Errors (SSH)

- Ensure your SSH key is added to the SSH agent:
  ```bash
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
  ```

- Verify the correct permissions for your `.ssh` directory:
  ```bash
  chmod 700 ~/.ssh
  chmod 600 ~/.ssh/id_rsa
  chmod 644 ~/.ssh/id_rsa.pub
  ```

### Git Command Not Found

- Reinstall Git:
  ```bash
  pkg install git -y
  ```

### Authentication Failed

- If using HTTPS, ensure your credentials are correct.
- For SSH, regenerate and re-add your SSH key if necessary.

---

## Repository Information

This guide is part of the **Termux Tools Repository**, available at:

```bash
git clone https://github.com/ysathyasai/Termux.git
```

The repository is licensed under the **Apache 2.0 License**. Feel free to use, modify, and distribute the content as long as you include the original license notice.

---

## Conclusion

You have successfully installed and configured Git in Termux, including SSH authentication for GitHub. This guide covered basic and advanced Git commands to help you get started with version control. For more advanced usage and features, refer to the official Git documentation.

Happy coding! 🚀