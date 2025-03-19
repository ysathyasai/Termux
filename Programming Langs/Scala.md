# Scala Programming in Termux

## Overview
Scala is a powerful language that combines object-oriented and functional programming paradigms. It runs on the Java Virtual Machine (JVM) and is used for building scalable applications. In Termux, you can set up Scala along with SBT (Simple Build Tool) to manage your Scala projects.

- **Language**: Scala
- **Runtime**: JVM
- **File Extension**: `.scala`
- **Package Name**: `scala`

## Step 1: Installing Scala

### Update and Upgrade Termux Packages
Before installing new packages, it's a good practice to update and upgrade your existing packages:
```sh
pkg update && pkg upgrade
```

### Install Scala
To install Scala, run the following command:
```sh
pkg install scala
```

### Install SBT
SBT is a popular build tool for Scala projects. Install it by running:
```sh
pkg install sbt
```

### Verify Installation
To verify that Scala and SBT have been installed correctly, you can check their versions:
```sh
scala -version
sbt sbtVersion
```

## Step 2: Setting Up a Scala Project

### Project Structure
A typical project structure for a Scala project might look like this:
```
project/
├── src/
│   └── main/
│       └── scala/
│           └── Main.scala
└── build.sbt
```

### Creating a New Project
1. Create a new directory for your project:
    ```sh
    mkdir -p project/src/main/scala
    cd project
    ```

2. Create a new file named `build.sbt` using a text editor like `nano` or `vi`:
    ```sh
    nano build.sbt
    ```

3. Add the following content to the `build.sbt` file:
    ```scala
    name := "MyScalaProject"

    version := "0.1"

    scalaVersion := "2.13.6"
    ```

4. Create a new file named `Main.scala` in the `src/main/scala` directory:
    ```sh
    nano src/main/scala/Main.scala
    ```

5. Add the following code to the `Main.scala` file:
    ```scala
    object Main extends App {
      println("Hello, Scala!")
    }
    ```

6. Save the file and exit the editor (`Ctrl + X` in nano, `:wq` in vi).

## Step 3: Building and Running the Project

### Building the Project
To build the project, use SBT:
```sh
sbt compile
```

### Running the Project
To run the project, use SBT:
```sh
sbt run
```

Output:
```
[info] running Main 
Hello, Scala!
```

## Step 4: Common Issues & Solutions

### Issue 1: Memory Issues
If you encounter memory issues while using SBT, you can increase the available memory by setting the `SBT_OPTS` environment variable:
```sh
export SBT_OPTS="-Xmx512M -XX:+UseConcMarkSweepGC"
```

### Issue 2: Missing Dependencies
If a package requires additional system dependencies, install them using Termux's package manager. For example:
```sh
pkg install openjdk-17
```

### Issue 3: Slow Performance
If Scala or SBT is running slowly, try closing unnecessary apps to free up memory or use smaller projects for testing.

## Additional Resources

- [Scala Documentation](https://docs.scala-lang.org/)
- [SBT Documentation](https://www.scala-sbt.org/documentation.html)
- [Scala Exercises](https://www.scala-exercises.org/)
- [Scala School by Twitter](https://twitter.github.io/scala_school/)

## Conclusion

By following this guide, you can set up and use Scala in Termux to write, build, and run programs. Whether you are exploring functional programming, creating scalable applications, or experimenting with new libraries, this setup provides a robust environment for Scala development. Enjoy exploring the capabilities of Scala on your Android device!
