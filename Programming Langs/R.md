# R Programming in Termux

## Overview
R is a language and environment for statistical computing and graphics. It is widely used among statisticians and data miners for developing statistical software and performing data analysis. In Termux, you can set up R to run data analysis scripts, create visualizations, and more.

- **Language**: R
- **Version**: Latest stable
- **File Extension**: `.R`
- **Package Name**: `r-base`

## Step 1: Installing R

### Update and Upgrade Termux Packages
Before installing new packages, it's a good practice to update and upgrade your existing packages:
```sh
pkg update && pkg upgrade
```

### Install R
To install the R programming language, run the following command:
```sh
pkg install r-base
```

### Install Development Tools
Install essential development tools required for compiling R packages:
```sh
pkg install clang make
```

### Verify Installation
To verify that R has been installed correctly, you can check the version:
```sh
R --version
```

## Step 2: Setting Up Development Environment

### Install Essential R Packages
Install essential R packages for data analysis, development, and document generation:
```sh
R -e "install.packages(c('tidyverse', 'devtools', 'rmarkdown'))"
```

### Verify Package Installation
To verify that the packages have been installed correctly, you can start R and check the installed packages:
```sh
R
# Inside R shell
installed.packages()
# Exit R shell
q()
```

## Step 3: Writing and Running R Programs

### Project Structure
A typical project structure for an R project might look like this:
```
project/
├── R/
│   └── analysis.R       # Main R script
├── data/
│   └── dataset.csv      # Data files
└── DESCRIPTION          # Project metadata
```

### Example Program
Create a simple R script to demonstrate data analysis.

1. Open Termux and create a new directory for your project:
    ```sh
    mkdir -p project/R
    mkdir -p project/data
    cd project/R
    ```

2. Create a new file named `analysis.R` using a text editor like `nano` or `vi`:
    ```sh
    nano analysis.R
    ```

3. Add the following code to the file:
    ```r
    # Load required libraries
    library(tidyverse)

    # Read dataset
    data <- read_csv("../data/dataset.csv")

    # Print summary of the dataset
    print(summary(data))

    # Create a scatter plot
    ggplot(data, aes(x = variable1, y = variable2)) +
      geom_point() +
      theme_minimal() +
      labs(title = "Scatter plot of variable1 vs variable2")
    ```

4. Save the file and exit the editor (`Ctrl + X` in nano, `:wq` in vi).

### Running the R Script
To run the R script, use the `Rscript` command:
```sh
Rscript analysis.R
```

## Step 4: Troubleshooting

### Common Issues & Solutions

#### Issue 1: Package Installation Errors
If you encounter errors while installing packages, you may need to install additional system libraries:
```sh
pkg install libxml2 libcurl
```

#### Issue 2: Missing Dependencies
If a package requires additional system dependencies, install them using Termux's package manager. For example:
```sh
pkg install openssl
```

#### Issue 3: R Session Crashes
If R crashes during a session, try increasing the available memory for Termux or using smaller datasets.

## Additional Resources

- [R Documentation](https://www.r-project.org/other-docs.html)
- [Tidyverse Documentation](https://www.tidyverse.org/)
- [RStudio Cheat Sheets](https://rstudio.com/resources/cheatsheets/)
- [R for Data Science](https://r4ds.had.co.nz/)

## Conclusion

By following this guide, you can set up and use R in Termux to write, run, and debug programs. Whether you are performing data analysis, creating visualizations, or developing statistical models, this setup provides a robust environment for R development. Enjoy exploring the capabilities of R on your Android device!
