# Programming Languages and Tools in Termux

Welcome to the **Programming Languages and Tools** section of the Termux Tools Repository! This folder contains guides for setting up and using various programming languages and frameworks directly in Termux. Whether you're a developer, data scientist, or hobbyist, these guides will help you get started with coding and development in Termux.

---

## Table of Contents

1. [Folder Structure](#folder-structure)
2. [General Setup](#general-setup)
3. [Programming Languages](#programming-languages)
   - Compiled Languages
   - Interpreted Languages
   - Functional and Domain-Specific Languages
4. [Database Tools](#database-tools)
5. [Machine Learning and Data Science](#machine-learning-and-data-science)
6. [Getting Started](#getting-started)
7. [Contributing](#contributing)
8. [License](#license)

---

## Folder Structure

The `Programming Langs` folder is organized into categories for easy navigation:

```
Programming Langs/
├── ML_Data_Science/         # Guides for machine learning and data science tools
│   ├── setup_jupyter.md
│   ├── setup_pytorch.md
│   ├── setup_scikit.md
│   └── setup_tensorflow.md
│
├── Ada.md                   # Guide for Ada programming language
├── Assembly.md              # Guide for Assembly programming
├── C++.md                   # Guide for C++ programming
├── C.md                     # Guide for C programming
├── Clojure.md               # Guide for Clojure programming
├── COBOL.md                 # Guide for COBOL programming
├── Crystal.md               # Guide for Crystal programming
├── Dart.md                  # Guide for Dart programming
├── Database.md              # Guide for database tools (e.g., SQLite, MySQL)
├── Elixir.md                # Guide for Elixir programming
├── Erlang.md                # Guide for Erlang programming
├── Fortran.md               # Guide for Fortran programming
├── FSharp.md                # Guide for F# programming
├── Go.md                    # Guide for Go programming
├── Groovy.md                # Guide for Groovy programming
├── Haskell.md               # Guide for Haskell programming
├── Java.md                  # Guide for Java programming
├── JavaScript.md            # Guide for JavaScript programming
├── Julia.md                 # Guide for Julia programming
├── Kotlin.md                # Guide for Kotlin programming
├── LISP.md                  # Guide for LISP programming
├── Lua.md                   # Guide for Lua programming
├── Node.js.md               # Guide for Node.js setup and usage
├── OCaml.md                 # Guide for OCaml programming
├── Pascal.md                # Guide for Pascal programming
├── Perl.md                  # Guide for Perl programming
├── PHP.md                   # Guide for PHP programming
├── Pip.md                   # Guide for Python package management (pip)
├── Prolog.md                # Guide for Prolog programming
├── Python.md                # Guide for Python programming
├── R.md                     # Guide for R programming
├── Racket.md                # Guide for Racket programming
├── README.md                # This file
├── Ruby.md                  # Guide for Ruby programming
├── Rust.md                  # Guide for Rust programming
├── Scala.md                 # Guide for Scala programming
├── Swift.md                 # Guide for Swift programming
├── TypeScript.md            # Guide for TypeScript programming
└── VimScript.md             # Guide for VimScript programming
```

---

## General Setup

Before using any programming language in Termux, ensure the following:

1. **Install Termux**: Download and install Termux from [F-Droid](https://f-droid.org/en/packages/com.termux/) or follow this [guide](https://github.com/ysathyasai/Termux/blob/main/Guide.md).
2. **Update Packages**:
   ```bash
   pkg update && pkg upgrade -y
   ```
3. **Grant Storage Permissions** (if required):
   ```bash
   termux-setup-storage
   ```

---

## Programming Languages

### Compiled Languages

- **[C.md](C.md)**: Set up and compile C programs using GCC.
- **[C++.md](C++.md)**: Set up and compile C++ programs using G++.
- **[Rust.md](Rust.md)**: Install and use Rust for systems programming.
- **[Go.md](Go.md)**: Set up Go for building efficient and scalable applications.
- **[Fortran.md](Fortran.md)**: Compile and run Fortran programs in Termux.

### Interpreted Languages

- **[Python.md](Python.md)**: Install and use Python for scripting and automation.
- **[Ruby.md](Ruby.md)**: Set up Ruby for web development and scripting.
- **[JavaScript.md](JavaScript.md)**: Use Node.js for JavaScript runtime environments.
- **[PHP.md](PHP.md)**: Set up PHP for server-side scripting.
- **[Perl.md](Perl.md)**: Use Perl for text processing and scripting.

### Functional and Domain-Specific Languages

- **[Haskell.md](Haskell.md)**: Install and use Haskell for functional programming.
- **[Erlang.md](Erlang.md)**: Set up Erlang for concurrent and distributed systems.
- **[LISP.md](LISP.md)**: Use LISP for symbolic computation and AI.
- **[Prolog.md](Prolog.md)**: Set up Prolog for logic programming.
- **[Julia.md](Julia.md)**: Install Julia for high-performance numerical computing.

---

## Database Tools

- **[Database.md](Database.md)**: Set up and manage databases like SQLite, MySQL, and PostgreSQL in Termux.

---

## Machine Learning and Data Science

The `ML_Data_Science` folder contains guides for setting up popular machine learning and data science tools:

- **[setup_jupyter.md](ML_Data_Science/setup_jupyter.md)**: Install and use Jupyter Notebook for interactive coding.
- **[setup_pytorch.md](ML_Data_Science/setup_pytorch.md)**: Set up PyTorch for deep learning.
- **[setup_scikit.md](ML_Data_Science/setup_scikit.md)**: Install scikit-learn for machine learning.
- **[setup_tensorflow.md](ML_Data_Science/setup_tensorflow.md)**: Set up TensorFlow for neural networks.

---

## Getting Started

To get started with these guides:

1. Clone the repository:
   ```bash
   git clone https://github.com/ysathyasai/Termux.git
   cd Programming\ Langs
   ```

2. Explore the relevant `.md` files based on your needs:
   - For general-purpose programming: Start with [Python.md](Python.md) or [C++.md](C++.md).
   - For data science: Follow the guides in the [ML_Data_Science](ML_Data_Science/) folder.
   - For database tools: Refer to [Database.md](Database.md).

---

## Contributing

We welcome contributions to this repository! If you'd like to contribute:

1. Fork the repository.
2. Create a new branch for your changes.
3. Add or improve content in the existing `.md` files.
4. Submit a pull request with a detailed description of your changes.

Please ensure your contributions are well-documented and follow the existing structure.

---

## License

This repository is licensed under the **Apache 2.0 License**. Feel free to use, modify, and distribute the content as long as you include the original license notice.

---

Happy coding in Termux! 🚀