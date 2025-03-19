# Erlang Programming in Termux

## Overview
- **Language**: Erlang
- **Platform**: BEAM VM
- **File Extension**: .erl
- **Package Name**: erlang

## Installation
```sh
pkg update && pkg upgrade
pkg install erlang
# Getting Started
```sh
# Optional: Set up environment variables
export LANG=en_US.UTF-8
export ERL_AFLAGS="-kernel shell_history enabled"

# Create project directory
mkdir my_erlang_project
cd my_erlang_project

# Initialize version control
git init

# Create basic project structure
mkdir src test config docs
touch README.md rebar.config
```

## Advanced Installation
```sh
# Install development tools
pkg install make autoconf automake libtool
pkg install build-essential

# Set up environment for larger projects
echo 'export ERL_HEAP_SIZE="2G"' >> ~/.bashrc
echo 'export ERL_MAX_PORTS=65536' >> ~/.bashrc
source ~/.bashrc
```

## Development Tools
```sh
# Install common development utilities
pkg install rlwrap
pkg install vim-python

# Set up erlang shell enhancements
echo 'alias erl="rlwrap -a erl"' >> ~/.bashrc
```

## Dependencies Management
```sh
# Create basic rebar.config
cat > rebar.config << EOL
{erl_opts, [debug_info]}.
{deps, []}.
EOL
```
# Install rebar3 build tool

```
wget https://s3.amazonaws.com/rebar3/rebar3
chmod +x rebar3
```

## Example Program
```erlang
-module(hello).
-export([greet/1]).

greet(Name) ->
    io:format("Hello, ~s!~n", [Name]).
```

## Common Issues
1. **Memory Issues**
   ```sh
   ERL_HEAP_SIZE="2G"
   ```
