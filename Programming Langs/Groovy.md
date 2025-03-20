# Groovy Programming in Termux

## Overview
Groovy is a powerful, optionally typed, and dynamic language that runs on the Java platform. It integrates seamlessly with any Java program and can be used for scripting, testing, and building applications.

- **Language**: Groovy
- **Platform**: JVM (Java Virtual Machine)
- **File Extension**: `.groovy`
- **Package Name**: `groovy`

## Step 1: Installing Groovy

### Update and Upgrade Termux Packages
Before installing new packages, it's a good practice to update and upgrade your existing packages:
```sh
pkg update && pkg upgrade
```

### Install Groovy
To install Groovy, run the following command:
```sh
pkg install groovy
```

### Install Required Dependencies
Groovy requires the Java Development Kit (JDK) to run. Install OpenJDK 17:
```sh
pkg install openjdk-17
```

### Verify Installation
To verify that Groovy has been installed correctly, you can check the version:
```sh
groovy --version
```

## Step 2: Writing and Running Groovy Programs

### Example Program
Create a simple "Hello, World!" program in Groovy.

1. Open Termux and create a new file named `hello.groovy` using a text editor like `nano` or `vi`:
    ```sh
    nano hello.groovy
    ```

2. Add the following code to the file:
    ```groovy
    println "Hello, World!"

    def greet = { name ->
        println "Hello, ${name}!"
    }

    greet("Termux User")
    ```

3. Save the file and exit the editor (`Ctrl + X` in nano, `:wq` in vi).

### Running the Groovy Program
To run the Groovy program, use the `groovy` command:
```sh
groovy hello.groovy
```

## Step 3: Common Issues and Solutions

### Issue 1: JAVA_HOME Not Set
If you encounter an error related to the JAVA_HOME environment variable not being set, you can set it manually:
```sh
export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
```

### Issue 2: Missing or Corrupted Libraries
If you encounter issues related to missing or corrupted libraries, you can try reinstalling the Groovy package and related dependencies:
```sh
pkg reinstall groovy openjdk-17
```

## Step 4: Advanced Topics

### Using Groovy for Scripting
Groovy is an excellent scripting language and can be used to automate tasks. Here is an example of a simple script to list files in a directory:

1. Create a new file named `list_files.groovy`:
    ```sh
    nano list_files.groovy
    ```

2. Add the following code to the file:
    ```groovy
    def listFilesInDir(dir) {
        new File(dir).eachFile { file ->
            println file.name
        }
    }

    listFilesInDir(".")
    ```

3. Save the file and exit the editor.

4. Run the script:
    ```sh
    groovy list_files.groovy
    ```

### Using Groovy with Gradle
Gradle is a powerful build automation tool that uses Groovy as its default scripting language. You can use Gradle to manage dependencies, compile code, and run tests.

#### Installing Gradle
To install Gradle, run the following command:
```sh
pkg install gradle
```

#### Creating a Gradle Project
1. Create a new directory for your project:
    ```sh
    mkdir my-groovy-project
    cd my-groovy-project
    ```

2. Initialize a new Gradle project:
    ```sh
    gradle init --type java-application
    ```

3. Modify the `build.gradle` file to use Groovy:
    ```groovy
    plugins {
        id 'groovy'
    }

    repositories {
        mavenCentral()
    }

    dependencies {
        implementation 'org.codehaus.groovy:groovy-all:3.0.9'
    }
    ```

4. Create a new Groovy file in `src/main/groovy`:
    ```sh
    mkdir -p src/main/groovy
    nano src/main/groovy/Hello.groovy
    ```

5. Add the following code to the file:
    ```groovy
    class Hello {
        static void main(String[] args) {
            println "Hello, Gradle!"
        }
    }
    ```

6. Save the file and exit the editor.

#### Building and Running the Gradle Project
To build the project, run:
```sh
gradle build
```

To run the project, use:
```sh
gradle run
```

## Conclusion
You have successfully set up and configured Groovy programming in Termux, written and compiled Groovy programs, and learned how to handle common issues. For more advanced usage and features, refer to the official Groovy and Gradle documentation.

Happy coding with Groovy in Termux!