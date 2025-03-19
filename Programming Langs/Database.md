# Database Setup and Usage Guide for Termux

## Introduction
This guide provides detailed steps on how to install and use databases in Termux. We will cover installing SQLite, MySQL (MariaDB), and PostgreSQL, along with basic commands for database management, creating and managing databases, and running SQL queries.

## Prerequisites
Before you begin, ensure that you have Termux installed on your Android device. You can download it from the [Google Play Store](https://play.google.com/store/apps/details?id=com.termux) or [F-Droid](https://f-droid.org/en/packages/com.termux/).
Alternatively, follow this [guide](https://github.com/ysathyasai/Termux/blob/main/Guide.md) for installation instructions.

## Step 1: Update and Upgrade Termux Packages
First, update and upgrade the Termux packages to ensure that you have the latest package lists:
```sh
pkg update && pkg upgrade
```

## SQLite

### Step 2: Install SQLite
To install SQLite in Termux, run the following command:
```sh
pkg install sqlite
```

### Step 3: Using SQLite
After installation, you can start using SQLite by typing:
```sh
sqlite3
```

### Step 4: Basic SQLite Commands
Here are some basic SQLite commands to get you started:

#### Creating a Database
To create a new database, use the following command:
```sh
sqlite3 mydatabase.db
```

#### Creating a Table
To create a table in the database:
```sql
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE
);
```

#### Inserting Data
To insert data into the table:
```sql
INSERT INTO users (name, email) VALUES ('John Doe', 'john@example.com');
```

#### Querying Data
To query data from the table:
```sql
SELECT * FROM users;
```

#### Updating Data
To update data in the table:
```sql
UPDATE users SET email = 'john.doe@example.com' WHERE name = 'John Doe';
```

#### Deleting Data
To delete data from the table:
```sql
DELETE FROM users WHERE name = 'John Doe';
```

## MySQL (MariaDB)

### Step 5: Install MySQL (MariaDB)
To install MySQL in Termux, run the following command:
```sh
pkg install mariadb
```
MariaDB is a drop-in replacement for MySQL.

### Step 6: Initialize MySQL
After installation, initialize the MySQL data directory:
```sh
mysql_install_db
```

### Step 7: Start MySQL Server
To start the MySQL server:
```sh
mysqld_safe --datadir=$PREFIX/var/lib/mysql
```

### Step 8: Secure MySQL Installation
Secure your MySQL installation by running:
```sh
mysql_secure_installation
```
Follow the prompts to set a root password and secure your installation.

### Step 9: Using MySQL
To start using MySQL, type:
```sh
mysql -u root -p
```
Enter the root password you set during the secure installation process.

### Step 10: Basic MySQL Commands
Here are some basic MySQL commands to get you started:

#### Creating a Database
To create a new database, use the following command:
```sql
CREATE DATABASE mydatabase;
```

#### Selecting a Database
To select a database to use:
```sql
USE mydatabase;
```

#### Creating a Table
To create a table in the database:
```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);
```

#### Inserting Data
To insert data into the table:
```sql
INSERT INTO users (name, email) VALUES ('John Doe', 'john@example.com');
```

#### Querying Data
To query data from the table:
```sql
SELECT * FROM users;
```

#### Updating Data
To update data in the table:
```sql
UPDATE users SET email = 'john.doe@example.com' WHERE name = 'John Doe';
```

#### Deleting Data
To delete data from the table:
```sql
DELETE FROM users WHERE name = 'John Doe';
```

### Step 11: Backup & Restore MySQL Databases
#### Backup a Database
To backup a MySQL database, use the following command:
```sh
mysqldump -u root -p mydatabase > mydatabase_backup.sql
```

#### Restore a Database
To restore a MySQL database from a backup, use the following command:
```sh
mysql -u root -p mydatabase < mydatabase_backup.sql
```

## PostgreSQL

### Step 12: Install PostgreSQL
To install PostgreSQL in Termux, run the following command:
```sh
pkg install postgresql
```

### Step 13: Initialize PostgreSQL
After installation, initialize the PostgreSQL data directory:
```sh
initdb $PREFIX/var/lib/postgresql
```

### Step 14: Start PostgreSQL Server
To start the PostgreSQL server:
```sh
pg_ctl -D $PREFIX/var/lib/postgresql start
```

### Step 15: Create a PostgreSQL User
Create a new PostgreSQL user with the following command:
```sh
createuser -P myuser
```
You will be prompted to set a password for the new user.

### Step 16: Create a PostgreSQL Database
Create a new PostgreSQL database with the following command:
```sh
createdb -O myuser mydatabase
```

### Step 17: Grant Privileges to a User
Grant all privileges on the database to the user:
```sql
GRANT ALL PRIVILEGES ON DATABASE mydatabase TO myuser;
```

### Step 18: Using PostgreSQL
To start using PostgreSQL, type:
```sh
psql -U myuser -d mydatabase
```
Enter the password you set for the user.

### Step 19: Basic PostgreSQL Commands
Here are some basic PostgreSQL commands to get you started:

#### Creating a Table
To create a table in the database:
```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);
```

#### Inserting Data
To insert data into the table:
```sql
INSERT INTO users (name, email) VALUES ('John Doe', 'john@example.com');
```

#### Querying Data
To query data from the table:
```sql
SELECT * FROM users;
```

#### Updating Data
To update data in the table:
```sql
UPDATE users SET email = 'john.doe@example.com' WHERE name = 'John Doe';
```

#### Deleting Data
To delete data from the table:
```sql
DELETE FROM users WHERE name = 'John Doe';
```

### Step 20: Backup & Restore PostgreSQL Databases
#### Backup a Database
To backup a PostgreSQL database, use the following command:
```sh
pg_dump -U myuser mydatabase > mydatabase_backup.sql
```

#### Restore a Database
To restore a PostgreSQL database from a backup, use the following command:
```sh
psql -U myuser -d mydatabase < mydatabase_backup.sql
```

## Automate Startup for Databases
### MySQL (MariaDB)
To restart the MySQL server after closing Termux:
```sh
mysqld_safe --datadir=$PREFIX/var/lib/mysql &
```

### PostgreSQL
To restart the PostgreSQL server after closing Termux:
```sh
pg_ctl -D $PREFIX/var/lib/postgresql restart
```

## Step 21: Troubleshooting Common Issues
### Issue: Permission Errors
Ensure you have the correct permissions to access the database directories and files.

### Issue: Missing Data Directory
If the data directory is missing, initialize it again using the appropriate commands for MySQL or PostgreSQL.

### Issue: Connection Errors
Ensure the database server is running and you are using the correct username, password, and database name.

## Conclusion
You have successfully installed and used SQLite, MySQL (MariaDB), and PostgreSQL in Termux. This guide covered the basic steps to get you started with database management, including creating and managing databases, running SQL queries, and handling backups and restores. For more advanced usage and features, refer to the official documentation of each database.

Happy coding!
