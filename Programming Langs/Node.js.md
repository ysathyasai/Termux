# Node.js Installation and Usage Guide for Termux

This guide provides detailed steps on how to install and use Node.js in Termux. Termux is a terminal emulator and Linux environment app for Android, allowing you to run a full-fledged Linux environment on your Android device.

---

## Table of Contents

1. [Introduction](#introduction)
2. [Prerequisites](#prerequisites)
3. [Step 1: Update and Upgrade Termux Packages](#step-1-update-and-upgrade-termux-packages)
4. [Step 2: Install Node.js](#step-2-install-nodejs)
5. [Step 3: Verify Node.js Installation](#step-3-verify-nodejs-installation)
6. [Step 4: Using Node.js in Termux](#step-4-using-nodejs-in-termux)
7. [Step 5: Creating and Running Node.js Applications](#step-5-creating-and-running-nodejs-applications)
8. [Step 6: Using npm for Package Management](#step-6-using-npm-for-package-management)
9. [Step 7: Creating an Express Application](#step-7-creating-an-express-application)
10. [Step 8: Installing and Using nodemon for Development](#step-8-installing-and-using-nodemon-for-development)
11. [Step 9: Setting Up Environment Variables](#step-9-setting-up-environment-variables)
12. [Step 10: Running Node.js Applications with Arguments](#step-10-running-nodejs-applications-with-arguments)
13. [Step 11: Using package.json Effectively](#step-11-using-packagejson-effectively)
14. [Step 12: Deploying Node.js Applications](#step-12-deploying-nodejs-applications)
15. [Troubleshooting](#troubleshooting)
16. [Conclusion](#conclusion)

---

## Introduction

Node.js is a JavaScript runtime built on Chrome's V8 engine, enabling server-side scripting and application development. This guide will walk you through setting up Node.js in Termux, creating applications, managing dependencies, and deploying them.

---

## Prerequisites

Before you begin, ensure the following:
- **Termux Installed**: Download from the [Google Play Store](https://play.google.com/store/apps/details?id=com.termux) or [F-Droid](https://f-droid.org/en/packages/com.termux/).
- **Storage Permission**: Grant storage access to Termux (`termux-setup-storage`).
- **Internet Connection**: A stable internet connection is required for downloading packages and tools.

---

## Step 1: Update and Upgrade Termux Packages
Ensure all Termux packages are up to date:
```bash
pkg update && pkg upgrade
```

---

## Step 2: Install Node.js
Install Node.js using the Termux package manager:
```bash
pkg install nodejs
```

---

## Step 3: Verify Node.js Installation
Check the installed version of Node.js:
```bash
node -v
```
You should see the installed version (e.g., `v18.x.x`).

Verify the installation of npm (Node Package Manager):
```bash
npm -v
```

---

## Step 4: Using Node.js in Termux
You can now start using Node.js in Termux. To create and run a simple Node.js application, follow the next steps.

---

## Step 5: Creating and Running Node.js Applications

### Step 5.1: Install Micro Text Editor
Install `micro`, a modern terminal-based text editor:
```bash
pkg install micro
```

### Step 5.2: Create a Node.js Application
Create a file called `app.js`:
```bash
micro app.js
```

Write the following code in the editor:
```javascript
console.log("Hello, Termux!");
```

Save the file by pressing `Ctrl + S` and exit the editor by pressing `Ctrl + Q`.

Run the application:
```bash
node app.js
```

Output:
```
Hello, Termux!
```

---

## Step 6: Using npm for Package Management
npm is used to manage Node.js packages. For example, install the `express` framework:
```bash
npm install express
```

---

## Step 7: Creating an Express Application

### Step 7.1: Initialize a Node.js Project
Initialize a new project:
```bash
npm init -y
```

### Step 7.2: Install Express
Install the Express framework:
```bash
npm install express
```

### Step 7.3: Create an Express Application
Create a file called `server.js`:
```bash
micro server.js
```

Write the following code:
```javascript
const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello, Termux!');
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});
```

Save the file and exit the editor.

Run the application:
```bash
node server.js
```

Output:
```
Server running at http://localhost:3000/
```

Open a browser and navigate to `http://localhost:3000/` to see the message `Hello, Termux!`.

---

## Step 8: Installing and Using nodemon for Development
Install `nodemon` globally to automatically restart your application when files change:
```bash
npm install -g nodemon
```

Run your application with `nodemon`:
```bash
nodemon server.js
```

---

## Step 9: Setting Up Environment Variables
Add environment variables to your `~/.profile` file:
```bash
echo 'export NODE_ENV=development' >> ~/.profile
source ~/.profile
```

---

## Step 10: Running Node.js Applications with Arguments
Run a Node.js application with command-line arguments:
```bash
node app.js arg1 arg2
```

Access these arguments in your application:
```javascript
process.argv.forEach((val, index) => {
  console.log(`${index}: ${val}`);
});
```

---

## Step 11: Using package.json Effectively
Edit the `package.json` file to add custom scripts:
```json
"scripts": {
  "start": "node server.js",
  "dev": "nodemon server.js"
}
```

Run scripts using:
```bash
npm run start   # Runs node server.js
npm run dev     # Runs nodemon server.js
```

---

## Step 12: Deploying Node.js Applications

### Step 12.1: Running in the Background
Run your application in the background:
```bash
nohup node server.js &
```

### Step 12.2: Using PM2
Install PM2 globally:
```bash
npm install -g pm2
```

Start your application with PM2:
```bash
pm2 start server.js --name myapp
pm2 list     # Check running processes
pm2 logs     # View logs
pm2 stop myapp  # Stop the process
```

---

## Troubleshooting

### 1. Permission Denied Errors
- **Cause**: Missing permissions for global installations.
- **Solution**:
  ```bash
  mkdir ~/.npm-global
  npm config set prefix '~/.npm-global'
  export PATH=~/.npm-global/bin:$PATH
  ```

### 2. Outdated npm
- **Cause**: Older versions of npm may cause issues.
- **Solution**:
  ```bash
  npm install -g npm@latest
  ```

### 3. Memory Issues
- **Cause**: Limited memory on Android devices.
- **Solution**:
  Close unnecessary apps or limit Node.js memory usage:
  ```bash
  export NODE_OPTIONS="--max-old-space-size=512"
  ```

---

## Conclusion

By following this guide, you can successfully install and use Node.js in Termux. Whether you're building web servers, automating tasks, or experimenting with APIs, this setup provides a robust environment for Node.js development. Combine it with tools like `nodemon` and `PM2` for seamless workflows.

Happy coding! 🚀