# Java Installation and Usage Guide for Termux

## Introduction
This guide provides detailed steps on how to install and use Java in Termux. Termux is a terminal emulator and Linux environment app for Android. It allows you to run a full-fledged Linux environment on your Android device.

## Prerequisites
Before you begin, ensure that you have Termux installed on your Android device. You can download it from the [Google Play Store](https://play.google.com/store/apps/details?id=com.termux) or [F-Droid](https://f-droid.org/en/packages/com.termux/).
Or else go with this [guide](https://github.com/ysathyasai/Termux/blob/main/Guide.md).

## Step 1: Update and Upgrade Termux Packages
First, update and upgrade the Termux packages to ensure that you have the latest package lists:
```sh
pkg update && pkg upgrade
```

## Step 2: Install Java
To install Java in Termux, run the following command:
```sh
pkg install openjdk-17
```
This command will install the Java Development Kit (JDK) along with the necessary dependencies.

## Step 3: Verify Java Installation
After the installation is complete, you can verify that Java is installed correctly by checking the version:
```sh
java -version
```
You should see the installed Java version displayed.

## Step 4: Using Java in Termux
You can now start using Java in Termux. To create a simple Java program, follow these steps:

## Step 5: Creating and Running Java Programs
To create a Java program, you can use any text editor available in Termux. We will use the Micro text editor for this guide.

## Step 6: Install Micro Text Editor
Micro is a modern and easy-to-use terminal-based text editor. Install it with:
```sh
pkg install micro
```

## Step 7: Creating a Java Program with Micro
To create a program called `HelloWorld.java` using Micro, run:
```sh
micro HelloWorld.java
```
In the Micro editor, write your Java code. For example:
```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, Termux!");
    }
}
```
Save the file by pressing `Ctrl + S` and exit the editor by pressing `Ctrl + Q`. To compile the program, use the following command:
```sh
javac HelloWorld.java
```
To run the compiled program, use:
```sh
java HelloWorld
```
You should see the output `Hello, Termux!` displayed.

## Step 8: Setting Up Environment Variables
To set up environment variables for Java, add the following lines to your `~/.profile` file:
```sh
export JAVA_HOME=$PREFIX
export PATH=$JAVA_HOME/bin:$PATH
```
Reload the profile:
```sh
source ~/.profile
```

## Step 9: Running Java Programs with Arguments
To run Java programs with command-line arguments:
```sh
java HelloWorld arg1 arg2
```
In your Java program, you can access these arguments using the `args` array:
```java
public class HelloWorld {
    public static void main(String[] args) {
        for (String arg : args) {
            System.out.println("Argument: " + arg);
        }
    }
}
```

## Conclusion
You have successfully installed and used Java in Termux. This guide covered the basic steps to get you started. For more advanced usage and features, refer to the official Java documentation.

Happy coding!