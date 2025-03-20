# Perl Programming in Termux

## Overview
Perl is a highly capable, feature-rich programming language with over 30 years of development. It is particularly well-suited for text processing, system administration, and web development. In Termux, you can use Perl along with its package manager, CPAN, to manage libraries and dependencies.

- **Language**: Perl
- **Version**: Latest stable
- **File Extension**: `.pl`
- **Package Manager**: CPAN

## Step 1: Installing Perl

### Update and Upgrade Termux Packages
Before installing new packages, it's a good practice to update and upgrade your existing packages:
```sh
pkg update && pkg upgrade
```

### Install Perl
To install Perl, run the following command:
```sh
pkg install perl
```

### Install CPAN
CPAN (Comprehensive Perl Archive Network) is the primary repository for Perl libraries and modules. To install `cpanminus`, a script to get, unpack, build and install modules from CPAN:
```sh
cpan App::cpanminus
```

### Verify Installation
To verify that Perl has been installed correctly, you can check the version:
```sh
perl -v
```

## Step 2: Setting Up Development Tools

### Installing Essential Modules
To install some essential modules for Perl development, use `cpanminus`:
```sh
# Install Perl::Critic for code quality checks
cpanm Perl::Critic

# Install Perl::Tidy for code formatting
cpanm Perl::Tidy
```

## Step 3: Writing and Running Perl Programs

### Project Structure
A typical project structure for a Perl project might look like this:
```
project/
├── lib/
│   └── Module.pm
├── t/
│   └── test.t
└── Makefile.PL
```

### Example Program
Create a simple "Hello, World!" program in Perl.

1. Open Termux and create a new directory for your project:
    ```sh
    mkdir -p project
    cd project
    ```

2. Create a new file named `hello.pl` using a text editor like `nano` or `vi`:
    ```sh
    nano hello.pl
    ```

3. Add the following code to the file:
    ```perl
    #!/usr/bin/perl
    use strict;
    use warnings;

    sub hello {
        my ($name) = @_;
        print "Hello, $name!\n";
    }

    hello("World");
    ```

4. Save the file and exit the editor (`Ctrl + X` in nano, `:wq` in vi).

5. Make the script executable:
    ```sh
    chmod +x hello.pl
    ```

### Running the Perl Program
To run the Perl program, use:
```sh
./hello.pl
```

## Step 4: Using CPAN

### Installing Modules with CPAN
CPAN makes it easy to install and manage Perl modules. For example, to install the `LWP::Simple` module:
```sh
cpanm LWP::Simple
```

### Using Installed Modules
After installing a module with CPAN, you can use it in your Perl programs. Here is an example of using `LWP::Simple` to fetch data from a URL:

1. Create a new file named `fetch.pl`:
    ```sh
    nano fetch.pl
    ```

2. Add the following code to the file:
    ```perl
    #!/usr/bin/perl
    use strict;
    use warnings;
    use LWP::Simple;

    my $url = 'http://www.example.com';
    my $content = get($url);

    die "Couldn't get $url" unless defined $content;

    print $content;
    ```

3. Save the file and exit the editor.

4. Make the script executable:
    ```sh
    chmod +x fetch.pl
    ```

5. Run the script:
    ```sh
    ./fetch.pl
    ```

## Step 5: Common Issues and Solutions

### Issue 1: Module Installation
If you encounter issues while installing modules, you may need to install additional build dependencies:
```sh
pkg install make perl-dev
```

### Issue 2: Missing or Corrupted Libraries
If you encounter issues related to missing or corrupted libraries, you can try reinstalling Perl and CPAN:
```sh
pkg reinstall perl
cpan App::cpanminus
```

## Step 6: Advanced Topics

### Creating and Using Perl Modules
Perl supports modular programming through the use of modules. Modules allow you to encapsulate functions and data for reuse.

#### Example Module (`Module.pm`)
1. Create a new directory for your modules:
    ```sh
    mkdir -p lib
    cd lib
    ```

2. Create a new file named `Module.pm`:
    ```sh
    nano Module.pm
    ```

3. Add the following code to the file:
    ```perl
    package Module;

    use strict;
    use warnings;
    use Exporter 'import';
    our @EXPORT_OK = qw(add subtract);

    sub add {
        my ($a, $b) = @_;
        return $a + $b;
    }

    sub subtract {
        my ($a, $b) = @_;
        return $a - $b;
    }

    1; # End of Module
    ```

4. Save the file and exit the editor.

#### Using the Module in Your Program
1. Go back to the project directory:
    ```sh
    cd ..
    ```

2. Create a new file named `main.pl`:
    ```sh
    nano main.pl
    ```

3. Add the following code to the file:
    ```perl
    #!/usr/bin/perl
    use strict;
    use warnings;
    use lib 'lib';
    use Module qw(add subtract);

    print "5 + 3 = ", add(5, 3), "\n";
    print "5 - 3 = ", subtract(5, 3), "\n";
    ```

4. Save the file and exit the editor.

5. Make the script executable:
    ```sh
    chmod +x main.pl
    ```

6. Run the program:
    ```sh
    ./main.pl
    ```

### Creating a Makefile.PL
A `Makefile.PL` file is used to define the build process for a Perl module.

1. Create a new file named `Makefile.PL`:
    ```sh
    nano Makefile.PL
    ```

2. Add the following code to the file:
    ```perl
    use ExtUtils::MakeMaker;

    WriteMakefile(
        NAME         => 'Module',
        VERSION_FROM => 'lib/Module.pm',
        PREREQ_PM    => {},
        LIBS         => [''],
        DEFINE       => '',
        INC          => '-I.',
        clean        => { FILES => 'Module-*' },
    );
    ```

3. Save the file and exit the editor.

4. To build and install the module, run:
    ```sh
    perl Makefile.PL
    make
    make test
    make install
    ```

## Conclusion
You have successfully set up and configured Perl programming in Termux, written and compiled Perl programs, and learned how to handle common issues. For more advanced usage and features, refer to the official Perl and CPAN documentation.

Happy coding with Perl in Termux!