# Clojure Programming in Termux

## Overview
- **Language**: Clojure
- **Platform**: JVM
- **File Extension**: .clj
- **Package Manager**: Leiningen

# Clojure Programming in Termux

## Overview
- **Language**: Clojure
- **Platform**: JVM (Java Virtual Machine)
- **File Extension**: .clj, .cljs (ClojureScript), .cljc (Cross-platform)
- **Package Manager**: Leiningen
- **Version**: Latest stable
- **Paradigm**: Functional Programming
- **Type System**: Dynamic, Strong typing

## Installation
```sh
# Update package repositories
pkg update && pkg upgrade

# Install Java Development Kit
pkg install openjdk-17

# Install Clojure
pkg install clojure

# Install Leiningen (Build Tool)
pkg install leiningen

# Verify installations
java -version
clj -h
lein version
```

## Environment Setup
```sh
# Configure Memory Settings
export LEIN_JVM_OPTS="-Xmx512m"

# Add to .bashrc for persistence
echo 'export LEIN_JVM_OPTS="-Xmx512m"' >> ~/.bashrc

# Create project directory
mkdir ~/clojure-projects
cd ~/clojure-projects
```

## Creating a New Project
```sh
# Create a new project
lein new app my-project

# Project structure
# my-project/
# ├── README.md
# ├── doc/
# ├── project.clj
# ├── resources/
# ├── src/
# │   └── my_project/
# │       └── core.clj
# └── test/
```

## Basic Examples
### Hello World
```clojure
(defn hello [name]
  (println (str "Hello, " name "!")))

(hello "World")
```

### Data Structures
```clojure
;; Lists
(def my-list '(1 2 3 4 5))

;; Vectors
(def my-vector [1 2 3 4 5])

;; Maps
(def my-map {:name "John" :age 30})

;; Sets
(def my-set #{1 2 3 4 5})
```

### Functions
```clojure
;; Anonymous function
(def add-numbers #(+ %1 %2))

;; Named function
(defn multiply [x y]
  (* x y))

;; Higher-order function
(defn apply-twice [f x]
  (f (f x)))
```

## Common Operations
```clojure
;; Map operation
(map #(* % 2) [1 2 3 4 5])

;; Filter operation
(filter even? [1 2 3 4 5])

;; Reduce operation
(reduce + [1 2 3 4 5])
```

## Common Issues and Solutions
1. **Memory Issues**
   ```sh
   # Increase JVM heap size
   export LEIN_JVM_OPTS="-Xmx512m"
   ```

2. **Dependency Resolution**
   ```clojure
   ;; In project.clj
   :repositories [["central" "https://repo1.maven.org/maven2/"]
                 ["clojars" "https://clojars.org/repo"]]
   ```

3. **REPL Issues**
   ```sh
   # Clear REPL state
   lein clean
   
   # Start REPL with increased memory
   LEIN_JVM_OPTS="-Xmx1g" lein repl
   ```

## Useful Resources
- [Clojure Official Documentation](https://clojure.org/guides/getting_started)
- [Clojuredocs](https://clojuredocs.org/)
- [Brave Clojure](https://www.braveclojure.com/)

## Development Tools
- **REPL**: Interactive development environment
- **Leiningen**: Build tool and dependency manager
- **deps.edn**: Alternative dependency management
- **Cursive**: IntelliJ plugin for Clojure
- **CIDER**: Emacs integration for Clojure

## Testing
```clojure
;; In test/my_project/core_test.clj
(ns my-project.core-test
  (:require [clojure.test :refer :all]
            [my-project.core :refer :all]))

(deftest sample-test
  (testing "Basic arithmetic"
    (is (= 4 (+ 2 2)))
    (is (= 6 (* 2 3)))))
```

## Production Tips
1. Always use proper namespaces
2. Implement proper error handling
3. Use appropriate logging
4. Profile code performance
5. Follow Clojure style guide
```sh
pkg update && pkg upgrade
pkg install clojure

# Install Leiningen
pkg install leiningen
```

## Example Program
```clojure
(defn hello [name]
  (println (str "Hello, " name "!")))

(hello "World")
```

## Common Issues
1. **Memory Issues**
   ```sh
   export LEIN_JVM_OPTS="-Xmx512m"
   ```
