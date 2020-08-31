---
title: Getting Started with PostgreSQL on Mac Part 3 (Final)
published: true
categories: [database, sql, postgresql]
---

This time we will practice:

1. Creating a database using postgres utility and psql
2. Renaming a database using psql
3. Deleting a database using postgres utility and psql
4. Collection of commands

Please make sure the postgres server is running. Check this [post](https://mawaliya.github.io/getting-started-postgresql-mac-1).

## Creating a database

Just like creating a role, we could create a database using both postgres utility or using psql as well.

### Using postgres utility

1.  Open terminal
2.  Enter and type this command to create a database with name `my_database` for role `myrole`.

    ```
    createdb -U myrole my_database
    ```

    but if you don't have any role setup at the moment, enter this:

    ```
    createdb my_database
    ```

    This will create a database owned by the default user.

3.  Check the database is created, open postgres shell by running this on terminal `psql` or `psql postgres`.
4.  Run this command on shell to list the databases:

    ```
    \list
    ```

    You should see the newly created database.

### Deleting a database using postgres utility

1. Open terminal and run this command:

   ```
   dropdb my_database
   ```

2. You can go to psql shell and run command `\list` to check that `my_database` should be gone from the list.

### Using psql

1. Open terminal
2. Go to psql shell:

   ```
   psql postgres
   ```

3. Type and enter this query to create a database:

   ```
   CREATE DATABASE my_database;
   ```

4. Check the database is created by running `\list` command.
5. Let's rename the database while we are in psql shell.
6. Run this command to rename the database:

   ```
   ALTER DATABASE my_database RENAME TO updated_database;
   ```

### Deleting a database using psql

1. Open postgres shell (`psql postgres`) and run this command:

   ```
   DROP DATABASE updated_database
   ```

2. You can go to psql shell and run command `\list` to check that `updated_database` should be gone from the list.

From here, you can use any postgreSQL clients (python client etc) or directly using psql console to start using the database.


### Collection of commands

Terminal commands:

* `pg_ctl -D /usr/local/var/postgres -l logfile start`	:	start a postgres server of the specified path cluster.
* `pg_ctl -D /usr/local/var/postgres -l logfile stop`: stop a postgres server of the specifiec path cluster.
* [Postgress utilities](https://www.postgresql.org/docs/12/reference-client.html).
* `psql -U <role name>`	:	open psql shell or console as a role.
* `psql postgres`	:	open psql shell or console as the default role (superuser).

Psql shell/console commands:

* `\du`	:	list roles.
* `\list`	: 	list databases.
* `\connect <database name>`	:	connect to a database specified.
* `\dt`	:	list tables in a database.
* `\q`	:	quit psql shell / console.