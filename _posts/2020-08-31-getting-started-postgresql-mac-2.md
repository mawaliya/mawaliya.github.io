---
title: Getting Started with PostgreSQL on Mac Part 2
published: true
categories: [database, sql, postgresql]
---

This time we will learn:

1. Changing role password
2. Creating a role using postgres utility and psql
3. Adding attributes to a role during creation
4. Connect to a cluster as a role
5. Deleting a role using postgress utility and psql
6. Connect to a cluster as a role

Please make sure the postgres server is running. Check this [post](https://mawaliya.github.io/getting-started-postgresql-mac-1).

## Changing the postgres default password

It's a best practice to change the postgres password for security reason.

1. Enter this to open postgres shell:

   ```
   psql postgres
   ```

2. Enter this in postgres shell to change the default password (no passowrd), the it will prompt to enter a new password:

   ```
   \password
   ```

## Creating a role

By default after installation, a default postgres user or role with your Mac username will be created as a superuser. Creating a new role instead of using the default superuser role is always a best practice.

If you want to add more there are two ways to create a role (user):

1. Through the PostgreSQL utilities (installed with postgres installation) in the terminal.

   Using client utilities [`createuser`](https://www.postgresql.org/docs/12/app-createuser.html).

   ```
   createuser <username>
   ```

2. Directly in database or through psql shell of a superuser.

   ```
   CREATE ROLE <username> WITH LOGIN PASSWORD 'your password';
   ```

### 1. Create a role using utilities

This newly created user will have a default attributes which is empty. Okay, now let's create a role using the postgres utilities.

1.  Open terminal and type this command:

    ```
    createuser testuser
    ```

    This will create a new role with name `testuser`. This role will does not have a database

2.  Now, let's connect to db as this role. Run this on terminal to connect to the default db:

    ```
    psql postgres -U testuser
    ```

    As you can see from the terminal log, we are logged in as a non superuser. (`>`).

    ```
    # terminal log
    psql (12.4)
    Type "help" for help.

    postgres=>
    ```

3.  Let's check the all roles that exist in the database. Run this command on postgres shell:

        ```
        \du
        ```

        As you can see, there our newly created role exists already but with empty attributes (default).

        ```
         Role name |                         Attributes                         | Member of

    -----------+------------------------------------------------------------+-----------
    macuser | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
    testuser |

    ```

    ```

4.  We can add more attributes during role creation by providing the attributes or create the role interactively. For example, creating the role interactively:

        ```
        createuser testuser1 --interactive
        # prompt
        Shall the new role be a superuser? (y/n) n
        Shall the new role be allowed to create databases? (y/n) y
        Shall the new role be allowed to create more new roles? (y/n) n
        ```

        Now if we go into psql shell again and check the roles, we will see `testuser1` will have an attribute we have specified during interactive creation:

        ```
        postgres=> \du
                                       List of roles

    Role name | Attributes | Member of
    -----------+------------------------------------------------------------+-----------
    macuser | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
    testuser | | {}
    testuser1 | Create DB

    ```

    ```

5.  Let's delete all the roles we have created. Run these commands on terminal (assuming they don't have any databases yet):

    ```
    dropuser testuser
    dropuser testuser1
    ```

### 2. Creating a role using psql shell

1.  Open terminal and enter this to open psql shell as a superuser:

    ```
    psql postgres
    ```

2.  Type and enter this sql query in psql shell to create a role. Password can be `NULL`, but it's not recommended:

    ```
    CREATE ROLE testuser WITH LOGIN PASSWORD 'yourpassword';
    ```

3.  Check if the user is created by listing all the users in cluster:

    ```
    \du

    # output
                                   List of roles
    Role name |                         Attributes                         | Member of
    -----------+------------------------------------------------------------+-----------
    macuser   | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
    testuser  |                                                            | {}

    postgres=#

    ```

4.  Now, let's add some attributes. Type and enter this command:

        ```
        ALTER ROLE testuser CREATEDB;
        ```

        Now if check the list of users again using `\du`:

        ```
                                           List of roles

    Role name | Attributes | Member of
    -----------+------------------------------------------------------------+-----------
    swiftmage | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
    testuser | Create DB

    ```

    ```

5.  Let's delete this new role we have created:

    ```
    DROP ROLE testuser;
    ```

    Check it's gone from the list using `\du`.

6.  Type and enter `\q` to quit psql shell.
