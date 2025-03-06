# Node.js Installation and Usage Guide for Termux

## Introduction
This guide provides detailed steps on how to install and use Node.js in Termux. Termux is a terminal emulator and Linux environment app for Android. It allows you to run a full-fledged Linux environment on your Android device.

## Prerequisites
Before you begin, ensure that you have Termux installed on your Android device. You can download it from the [Google Play Store](https://play.google.com/store/apps/details?id=com.termux) or [F-Droid](https://f-droid.org/en/packages/com.termux/).
Or else go with this [guide](https://github.com/ysathyasai/Termux/blob/main/Guide.md).

## Step 1: Update and Upgrade Termux Packages
First, update and upgrade the Termux packages to ensure that you have the latest package lists:
```sh
pkg update && pkg upgrade
```

## Step 2: Install Node.js
To install Node.js in Termux, run the following command:
```sh
pkg install nodejs
```
This command will install Node.js along with the necessary dependencies.

## Step 3: Verify Node.js Installation
After the installation is complete, you can verify that Node.js is installed correctly by checking the version:
```sh
node -v
```
You should see the installed Node.js version displayed.

## Step 4: Using Node.js in Termux
You can now start using Node.js in Termux. To create a simple Node.js application, follow these steps:

## Step 5: Creating and Running Node.js Applications
To create a Node.js application, you can use any text editor available in Termux. We will use the Micro text editor for this guide.

## Step 6: Install Micro Text Editor
Micro is a modern and easy-to-use terminal-based text editor. Install it with:
```sh
pkg install micro
```

## Step 7: Creating a Node.js Application with Micro
To create a program called `app.js` using Micro, run:
```sh
micro app.js
```
In the Micro editor, write your Node.js code. For example:
```javascript
console.log("Hello, Termux!");
```
Save the file by pressing `Ctrl + S` and exit the editor by pressing `Ctrl + Q`. To run the application, use the following command:
```sh
node app.js
```
You should see the output `Hello, Termux!` displayed.

## Step 8: Using npm for Package Management
Node.js comes with npm (Node Package Manager) for managing packages. To verify npm installation, run:
```sh
npm -v
```
You can install packages using npm. For example, to install the Express framework, run:
```sh
npm install express
```

## Step 9: Creating an Express Application
To create an Express application, follow these steps:

### Step 9.1: Initialize a Node.js Project
Run the following command to initialize a new Node.js project:
```sh
npm init -y
```

### Step 9.2: Install Express
Install the Express framework:
```sh
npm install express
```

### Step 9.3: Create an Express Application
Create a file called `server.js`:
```sh
micro server.js
```
In the Micro editor, write your Express application code:
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
Save the file by pressing `Ctrl + S` and exit the editor by pressing `Ctrl + Q`.

### Step 9.4: Run the Express Application
To run the Express application, use the following command:
```sh
node server.js
```
You should see the output `Server running at http://localhost:3000/` displayed. Open a web browser and navigate to `http://localhost:3000/` to see the message `Hello, Termux!`.

## Step 10: Installing and Using nodemon for Development
nodemon is a utility that monitors for changes in your source code and automatically restarts your Node.js application. Install nodemon globally with:
```sh
npm install -g nodemon
```
To use nodemon, run your application with:
```sh
nodemon server.js
```

## Step 11: Setting Up Environment Variables
To set up environment variables for Node.js, add the following lines to your `~/.profile` file:
```sh
export NODE_ENV=development
```
Reload the profile:
```sh
source ~/.profile
```

## Step 12: Running Node.js Applications with Arguments
To run Node.js applications with command-line arguments:
```sh
node app.js arg1 arg2
```
In your Node.js application, you can access these arguments using the `process.argv` array:
```javascript
process.argv.forEach((val, index) => {
  console.log(`${index}: ${val}`);
});
```

## Step 13: Using package.json Effectively
The `package.json` file is essential for managing your Node.js project dependencies and scripts. You can add scripts for automation. Edit `package.json` and add a custom script:
```json
"scripts": {
  "start": "node server.js",
  "dev": "nodemon server.js"
}
```
Now, you can run:
```sh
npm run start   # Runs node server.js
npm run dev     # Runs nodemon server.js
```
This simplifies application startup.

## Step 14: Deploying Node.js Applications
### Step 14.1: Deploying Locally
To keep your application running in the background, use:
```sh
nohup node server.js &
```
This prevents the process from stopping when the terminal closes.

### Step 14.2: Deploying with PM2
PM2 is a process manager for Node.js applications:
```sh
npm install -g pm2
pm2 start server.js --name myapp
pm2 list     # Check running processes
pm2 logs     # View logs
pm2 stop myapp  # Stop the process
```
PM2 ensures your application runs persistently.

## Conclusion
You have successfully installed and used Node.js in Termux. This guide covered the basic steps to get you started. For more advanced usage and features, refer to the official Node.js documentation.

Happy coding! 🚀

