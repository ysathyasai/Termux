# Elixir Programming in Termux

## Overview
- **Language**: Elixir
- **Runtime**: BEAM VM
- **File Extension**: .ex, .exs
- **Package Manager**: mix

## Installation
```sh
pkg update && pkg upgrade
pkg install elixir

# Install Erlang (dependency)
pkg install erlang
```

## Example Programs

### 1. Basic Hello World
```elixir
defmodule Hello do
  def greet(name) do
    IO.puts "Hello, #{name}!"
  end
end
```

### 2. Data Types and Operations
```elixir
# Numbers and basic arithmetic
sum = 1 + 2
product = 3 * 4

# Strings and string interpolation
name = "Elixir"
message = "Programming in #{name} is fun!"

# Lists and list operations
list = [1, 2, 3]
[head | tail] = list
new_list = [0 | list]
```

### 3. Pattern Matching
```elixir
defmodule Calculator do
  def calculate({:add, x, y}), do: x + y
  def calculate({:subtract, x, y}), do: x - y
  def calculate({:multiply, x, y}), do: x * y
  def calculate({:divide, x, y}) when y != 0, do: x / y
end
```

### 4. Recursion Example
```elixir
defmodule Factorial do
  def of(0), do: 1
  def of(n) when n > 0, do: n * of(n - 1)
end
```

### 5. Working with Processes
```elixir
defmodule Counter do
  def start do
    spawn(fn -> loop(0) end)
  end

  defp loop(count) do
    receive do
      {:get, sender} ->
        send(sender, count)
        loop(count)
      {:increment} ->
        loop(count + 1)
    end
  end
end
```

## Conclusion
Elixir is a powerful functional programming language that excels in building scalable and maintainable applications. With its foundation on the Erlang VM (BEAM), it provides excellent support for concurrent and distributed systems. The language's syntax is Ruby-inspired, making it friendly for beginners while offering advanced features for experienced developers. Through pattern matching, immutability, and the actor model for concurrency, Elixir enables developers to write clean, efficient, and fault-tolerant code.
```
defmodule Hello do
  def greet(name) do
    IO.puts "Hello, #{name}!"
  end
end
```
