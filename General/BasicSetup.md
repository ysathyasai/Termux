# Git Setup and Usage in Termux

This guide will help you set up and use **Git** in Termux for version control, repository management, and collaboration. Whether you're working on personal projects or contributing to open-source repositories, Git is an essential tool for developers.

---

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Installing Git](#installing-git)
3. [Configuring Git](#configuring-git)
4. [Basic Git Workflow](#basic-git-workflow)
   - [Initializing a Repository](#initializing-a-repository)
   - [Cloning a Repository](#cloning-a-repository)
   - [Staging Changes](#staging-changes)
   - [Committing Changes](#committing-changes)
   - [Pushing to Remote](#pushing-to-remote)
5. [Advanced Features](#advanced-features)
   - [SSH Key Setup](#ssh-key-setup)
   - [Branch Management](#branch-management)
6. [Troubleshooting](#troubleshooting)
7. [Repository Information](#repository-information)

---

## Prerequisites

Before proceeding, ensure the following:

1. **Termux Installed**: Download and install Termux from the official source (F-Droid or GitHub).
2. **Internet Connection**: Ensure your device has an active internet connection.
3. **Storage Permissions**: Grant storage permissions to Termux if required:
   ```bash
   termux-setup-storage
   ```

---

## Installing Git

Install Git using the Termux package manager:

```bash
pkg update && pkg upgrade -y
pkg install git -y
```

Verify the installation:

```bash
git --version
```

---

## Configuring Git

Set up your Git identity (username and email). These details will be associated with your commits.

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

Check your configuration:

```bash
git config --list
```

---

## Basic Git Workflow

### Initializing a Repository

Create a new Git repository in your current directory:

```bash
git init
```

This creates a `.git` folder to track changes.

---

### Cloning a Repository

Clone the repository from your provided URL:

```bash
git clone https://github.com/ysathyasai/Termux.git
```

For SSH-based cloning (requires SSH key setup):

```bash
git clone git@github.com:ysathyasai/Termux.git
```

---

### Staging Changes

Stage files for the next commit:

```bash
git add <file_name>
```

To stage all changes:

```bash
git add .
```

---

### Committing Changes

Commit staged changes with a descriptive message:

```bash
git commit -m "Your commit message"
```

---

### Pushing to Remote

Push your local commits to the remote repository:

```bash
git push origin <branch_name>
```

For example, to push to the `main` branch:

```bash
git push origin main
```

---

## Advanced Features

### SSH Key Setup

To avoid entering your username and password every time you interact with a remote repository, set up an SSH key.

1. Generate an SSH key:
   ```bash
   ssh-keygen -t rsa -b 4096 -C "your.email@example.com"
   ```
   Press Enter to accept default paths and optionally set a passphrase.

2. Copy the public key to your clipboard:
   ```bash
   cat ~/.ssh/id_rsa.pub
   ```

3. Add the key to your GitHub account under **Settings > SSH Keys**.

4. Test the connection:
   ```bash
   ssh -T git@github.com
   ```

---

### Branch Management

#### Create a New Branch
```bash
git branch <branch_name>
```

#### Switch to a Branch
```bash
git checkout <branch_name>
```

#### Create and Switch to a Branch in One Step
```bash
git checkout -b <branch_name>
```

#### Merge a Branch
Switch to the target branch and merge:
```bash
git checkout main
git merge <branch_name>
```

#### Delete a Branch
```bash
git branch -d <branch_name>
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

By following this guide, you should now have Git fully configured and ready to use in Termux. Use it to manage your projects, collaborate with others, and streamline your development workflow.

Happy coding! 🚀