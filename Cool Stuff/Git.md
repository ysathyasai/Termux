# Git Installation and Usage Guide for Termux

## Introduction
This guide provides detailed steps on how to install and use Git in Termux. Git is a distributed version control system that allows you to track changes in your source code during software development. Termux is a terminal emulator and Linux environment app for Android, which allows you to run a full-fledged Linux environment on your Android device.

## Prerequisites
Before you begin, ensure that you have Termux installed on your Android device. You can download it from the [F-Droid](https://f-droid.org/en/packages/com.termux/).
Alternatively, follow this [guide](https://github.com/ysathyasai/Termux/blob/main/Guide.md) for installation instructions.

## Step 1: Update and Upgrade Termux Packages
First, update and upgrade the Termux packages to ensure that you have the latest package lists:
```sh
pkg update && pkg upgrade
```

## Step 2: Install Git
To install Git in Termux, run the following command:
```sh
pkg install git
```

## Step 3: Verify Git Installation
After the installation is complete, you can verify that Git is installed correctly by checking the version:
```sh
git --version
```
You should see the installed Git version displayed.

## Step 4: Configure Git
Before using Git, configure your Git environment by setting your username and email address:
```sh
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## Step 5: Setting Up SSH Authentication for GitHub
Using SSH is the recommended method for authenticating with GitHub in Termux.

### Generate SSH Key
To generate an SSH key, use the following command:
```sh
ssh-keygen -t rsa -b 4096 -C "your.email@example.com"
```
Follow the prompts to save the key and set a passphrase (optional).

### Start the SSH Agent
To start the SSH agent and add your SSH key:
```sh
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

### Add SSH Key to GitHub
Copy your SSH key to the clipboard:
```sh
cat ~/.ssh/id_rsa.pub
```
Log in to your GitHub account, go to **Settings > SSH and GPG keys**, and add your SSH key.

### Test SSH Connection
To verify that the SSH connection is working, run:
```sh
ssh -T git@github.com
```
If successful, you should see a message like:
```
Hi username! You've successfully authenticated, but GitHub does not provide shell access.
```

### Clone Repository with SSH
To clone a repository using SSH, use the following command:
```sh
git clone git@github.com:username/repository.git
```

## Step 6: Basic Git Commands
Here are some basic Git commands to get you started:

### Initialize a Repository
To create a new Git repository, use the following command:
```sh
git init
```

### Check Repository Status
To check the status of your repository, use the following command:
```sh
git status
```

### Add Files to Staging Area
To add a file to the staging area, use the following command:
```sh
git add filename
```
To add all files to the staging area, use:
```sh
git add .
```

### Commit Changes
To commit changes to your repository, use the following command:
```sh
git commit -m "Your commit message"
```

### Push Changes
To push your changes to a remote repository, use the following command:
```sh
git push origin branch_name
```

### Pull Changes
To pull changes from a remote repository, use the following command:
```sh
git pull origin branch_name
```

### Create a New Branch
To create a new branch, use the following command:
```sh
git branch branch_name
```

### Switch to a Branch
To switch to a different branch, use the following command:
```sh
git checkout branch_name
```

### Merge Branches
To merge a branch into the current branch, use the following command:
```sh
git merge branch_name
```

### Delete a Branch
To delete a branch, use the following command:
```sh
git branch -d branch_name
```

## Step 7: Advanced Git Commands
Here are some advanced Git commands for more complex workflows:

### Stash Changes
To stash your changes, use the following command:
```sh
git stash
```
To apply stashed changes, use:
```sh
git stash apply
```

### View Commit History
To view the commit history, use the following command:
```sh
git log
```

### Revert a Commit
To revert a commit, use the following command:
```sh
git revert commit_hash
```

### Reset to a Previous Commit
To reset your repository to a previous commit, use the following command:
```sh
git reset --hard commit_hash
```

### Cherry-Pick a Commit
To cherry-pick a commit from another branch, use the following command:
```sh
git cherry-pick commit_hash
```

### Rebase Branches
To rebase your current branch onto another branch, use the following command:
```sh
git rebase branch_name
```

## Conclusion
You have successfully installed and configured Git in Termux, including SSH authentication for GitHub. This guide covered basic and advanced Git commands to help you get started with version control. For more advanced usage and features, refer to the official Git documentation.

Happy coding!
