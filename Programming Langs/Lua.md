# Lua Programming in Termux

## Overview
Lua is a lightweight, high-level, multi-paradigm programming language designed primarily for embedded use in applications. It is known for its simplicity, speed, and portability. In Termux, you can use both Lua 5.4 and LuaJIT for scripting.

- **Language**: Lua
- **Version**: Lua 5.4 / LuaJIT
- **File Extension**: `.lua`
- **Package Name**: `lua`

## Step 1: Installing Lua

### Update and Upgrade Termux Packages
Before installing new packages, it's a good practice to update and upgrade your existing packages:
```sh
pkg update && pkg upgrade
```

### Install Lua and LuaJIT
To install Lua and LuaJIT, run the following command:
```sh
pkg install lua-dev luajit
```

### Install Luarocks
Luarocks is a package manager for Lua modules:
```sh
pkg install luarocks
```

### Verify Installation
To verify that Lua has been installed correctly, you can check the version:
```sh
lua -v
luajit -v
```

## Step 2: Writing and Running Lua Programs

### Project Structure
A typical project structure for a Lua project might look like this:
```
project/
├── src/
│   └── main.lua
├── lib/
│   └── module.lua
└── rockspec/
```

### Example Program
Create a simple "Hello, World!" program in Lua.

1. Open Termux and create a new directory for your project:
    ```sh
    mkdir -p project/src
    cd project/src
    ```

2. Create a new file named `main.lua` using a text editor like `nano` or `vi`:
    ```sh
    nano main.lua
    ```

3. Add the following code to the file:
    ```lua
    print("Hello, World!")

    local function greet(name)
        print("Hello, " .. name .. "!")
    end

    greet("Termux User")
    ```

4. Save the file and exit the editor (`Ctrl + X` in nano, `:wq` in vi).

### Running the Lua Program
To run the Lua program, use the `lua` or `luajit` command:
```sh
lua main.lua
```

## Step 3: Using Luarocks

### Installing Packages with Luarocks
Luarocks makes it easy to install and manage Lua modules. For example, to install the `luasocket` module:
```sh
luarocks install luasocket
```

### Using Installed Modules
After installing a module with Luarocks, you can use it in your Lua programs. Here is an example of using `luasocket` to fetch data from a URL:

1. Create a new file named `fetch.lua`:
    ```sh
    nano fetch.lua
    ```

2. Add the following code to the file:
    ```lua
    local http = require("socket.http")

    local response, status = http.request("http://www.example.com")
    if status == 200 then
        print(response)
    else
        print("Failed to fetch data: " .. status)
    end
    ```

3. Save the file and exit the editor.

4. Run the script:
    ```sh
    lua fetch.lua
    ```

## Step 4: Common Issues and Solutions

### Issue 1: Build Dependencies
If you encounter issues related to missing build dependencies, you can install them using:
```sh
pkg install build-essential
```

### Issue 2: Missing or Corrupted Libraries
If you encounter issues related to missing or corrupted libraries, you can try reinstalling the Lua and Luarocks packages:
```sh
pkg reinstall lua-dev luajit luarocks
```

## Step 5: Advanced Topics

### Creating and Using Lua Modules
Lua supports modular programming through the use of modules. Modules allow you to encapsulate functions and data for reuse.

#### Example Module (`module.lua`)
1. Create a new directory for your modules:
    ```sh
    mkdir -p ../lib
    cd ../lib
    ```

2. Create a new file named `module.lua`:
    ```sh
    nano module.lua
    ```

3. Add the following code to the file:
    ```lua
    local module = {}

    function module.add(a, b)
        return a + b
    end

    function module.subtract(a, b)
        return a - b
    end

    return module
    ```

4. Save the file and exit the editor.

#### Using the Module in Your Program
1. Go back to the `src` directory:
    ```sh
    cd ../src
    ```

2. Modify `main.lua` to use the module:
    ```lua
    local module = require("module")

    print("5 + 3 =", module.add(5, 3))
    print("5 - 3 =", module.subtract(5, 3))
    ```

3. Save the file and exit the editor.

4. Run the program:
    ```sh
    lua main.lua
    ```

### Using LuaJIT
LuaJIT is a Just-In-Time Compiler (JIT) for the Lua programming language. It is known for its high performance.

To use LuaJIT, simply replace `lua` with `luajit` in your commands:
```sh
luajit main.lua
```

### Creating and Using Rockspec Files
Rockspec files are used by Luarocks to define packages. They contain metadata about the package, such as its name, version, dependencies, and source code location.

#### Example Rockspec File
1. Create a new directory for your rockspec files:
    ```sh
    mkdir -p ../rockspec
    cd ../rockspec
    ```

2. Create a new file named `myproject-0.1-1.rockspec`:
    ```sh
    nano myproject-0.1-1.rockspec
    ```

3. Add the following code to the file:
    ```lua
    package = "myproject"
    version = "0.1-1"
    source = {
        url = "git://github.com/yourusername/myproject"
    }
    description = {
        summary = "A simple Lua project",
        detailed = "This is a simple Lua project to demonstrate the use of rockspec files.",
        homepage = "http://github.com/yourusername/myproject",
        license = "MIT"
    }
    dependencies = {
        "lua >= 5.4",
        "luajit >= 2.1.0"
    }
    build = {
        type = "builtin",
        modules = {
            ["module"] = "lib/module.lua"
        }
    }
    ```

4. Save the file and exit the editor.

## Conclusion
You have successfully set up and configured Lua programming in Termux, written and compiled Lua programs, and learned how to handle common issues. For more advanced usage and features, refer to the official Lua, LuaJIT, and Luarocks documentation.

Happy coding with Lua in Termux!