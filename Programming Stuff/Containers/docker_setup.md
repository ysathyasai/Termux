# Docker Setup in Termux

## Overview
Docker is a platform for developing, shipping, and running applications inside containers. Containers allow you to package an application with all its dependencies, ensuring that it runs consistently across different environments. In Termux, you can set up Docker to manage and run containers for various applications.

- **Language**: Shell
- **Platform**: Docker
- **File Extension**: `.sh`
- **Package Name**: `docker`

## Step 1: Installing Docker

### Update and Upgrade Termux Packages
Before installing new packages, it's a good practice to update and upgrade your existing packages:
```sh
pkg update && pkg upgrade
```

### Install Docker
To install Docker, you need to install the `docker` package from a third-party repository. Here are the steps to install Docker in Termux:

1. Install the `proot` package:
    ```sh
    pkg install proot
    ```

2. Install `proot-distro`:
    ```sh
    pkg install proot-distro
    ```

3. Install an Ubuntu distribution using `proot-distro`:
    ```sh
    proot-distro install ubuntu
    ```

4. Start the Ubuntu distribution:
    ```sh
    proot-distro login ubuntu
    ```

5. Inside the Ubuntu environment, update the package list:
    ```sh
    apt update && apt upgrade
    ```

6. Install Docker:
    ```sh
    apt install docker.io
    ```

7. Start the Docker service:
    ```sh
    service docker start
    ```

### Verify Installation
To verify that Docker has been installed correctly, you can run a simple command:
```sh
docker --version
```

## Step 2: Configuring Docker

### Add User to Docker Group
To run Docker commands without `sudo`, add your user to the Docker group:
```sh
usermod -aG docker $USER
```

### Restart Docker Service
Restart the Docker service to apply the changes:
```sh
service docker restart
```

## Step 3: Performing Basic Operations

### Pull a Docker Image
To pull a Docker image from Docker Hub, use the following command:
```sh
docker pull hello-world
```

### Run a Docker Container
To run a Docker container, use the following command:
```sh
docker run hello-world
```

### List Docker Containers
To list all Docker containers, use the following command:
```sh
docker ps -a
```

### Stop a Docker Container
To stop a running Docker container, use the following command:
```sh
docker stop <container-id>
```

### Remove a Docker Container
To remove a Docker container, use the following command:
```sh
docker rm <container-id>
```

### Remove a Docker Image
To remove a Docker image, use the following command:
```sh
docker rmi <image-id>
```

## Step 4: Common Issues & Solutions

### Issue 1: Permission Issues
If you encounter permission issues while running Docker commands, ensure that your user is added to the Docker group and that the Docker service is running.

### Issue 2: Missing Dependencies
If a package requires additional system dependencies, install them using Termux's package manager. For example:
```sh
pkg install curl
```

### Issue 3: Docker Service Fails to Start
If the Docker service fails to start, ensure that you are running the command inside the proot-distro environment and that all necessary dependencies are installed.

## Step 5: Advanced Topics

### Using Docker Compose
Docker Compose is a tool for defining and running multi-container Docker applications. Here is an example of how to create a simple Docker Compose setup.

#### Example Docker Compose File (`docker-compose.yml`)
1. Create a new file named `docker-compose.yml`:
    ```sh
    nano docker-compose.yml
    ```

2. Add the following code to the file:
    ```yaml
    version: '3'
    services:
      web:
        image: nginx:latest
        ports:
          - "8080:80"
      db:
        image: mysql:latest
        environment:
          MYSQL_ROOT_PASSWORD: example
    ```

3. Save the file and exit the editor.

### Running Docker Compose
To run the Docker Compose setup, use the following command:
```sh
docker-compose up
```

## Additional Resources

- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [Docker Hub](https://hub.docker.com/)
- [Docker CLI Reference](https://docs.docker.com/engine/reference/commandline/docker/)

## Conclusion

By following this guide, you can set up and use Docker in Termux to manage and run containers for various applications. Whether you are developing, testing, or deploying applications, this setup provides a robust environment for Docker. Enjoy exploring the capabilities of Docker on your Android device!
