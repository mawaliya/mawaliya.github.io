---
title: Getting Started with PostgreSQL on Mac Part 1
published: true
categories: [database, sql, postgresql]
---

## Install postgreSQL using homebrew

There are multiple ways to install postgresql on your mac. Let's install it through command line for this post.

You need to have `homebrew` installed before continuing. Check [here](https://brew.sh/) on how to install `homebrew`.

Open terminal and run this:

```
brew install postgresql
```

Once installation is done, check just installed postgresql version using this command:

```
psql -V
# or
postgres -V
```

Output will be like:

```
# output
postgres (PostgreSQL) 12.4
```

## Configure cluster and start server

After successfully installing postgresql, in terminal log there will be this note:

```
==> postgresql
To migrate existing data from a previous major version of PostgreSQL run:
  brew postgresql-upgrade-database

This formula has created a default database cluster with:
  initdb --locale=C -E UTF-8 /usr/local/var/postgres
For more details, read:
  https://www.postgresql.org/docs/12/app-initdb.html

To have launchd start postgresql now and restart at login:
  brew services start postgresql
Or, if you don't want/need a background service you can just run:
  pg_ctl -D /usr/local/var/postgres start
```

So, first create your cluster using this command:

```
initdb --locale=C -E UTF-8 /usr/local/var/postgres
```

When it's done, at the end of the the terminal log, will say this:

```
Success. You can now start the database server using:

    pg_ctl -D /usr/local/var/postgres -l logfile start
```

Start your server using `pg_ctl`,
it is a utility to initialize, start, stop, or control a PostgreSQL server.

Full documentation [here](https://www.postgresql.org/docs/12/app-pg-ctl.html).
Let's start the server by running this command:

```
pg_ctl -D /usr/local/var/postgres -l logfile start
```

This will start a database cluster server we specify in `-D` option (`/usr/local/var/postgres`) and redirect the log to a file using `-l` option with file name `logfile` in the current directory.
The output will be like:

```
waiting for server to start.... done
server started
```

If you want to start the server automatically during login, this command will add postgresql service to `launchd`.

```
brew services start postgresql
```

Let's try to open the postgresql shell, try to typer and run `psql` command on terminal.
If you get this output error, it means the database is not created yet.

```
# output
psql: error: could not connect to server: FATAL:  database "macuser" does not exist
```

In Mac, after installation using brew, you a default user with the mac username is created but the database is not. You need to run `createdb` in the terminal. then you can enter the shell as your mac user name (superuser) with only entering `psql`.

Other terminal utilities for postgreSQL is documented [here](https://www.postgresql.org/docs/12/reference-client.html). This often happen on Mac. Just create a database by running this command on terminal:

```
createdb
```

Type and enter `psql` on terminal again and the postgresql shell should be opened:

```
psql (12.4)
Type "help" for help.

macuser=#
```

The `#` sign tells that you are logged in as a role with superuser capabilities.
Type `\q` to exit the shell.

You can enter the postgres shell as the default superuser role with this command:

```
psql postgres
```

or enter the shell as a role

```
psql postgres -U <username>
```

## Stop server

To stop the server, use this `pg_ctl` command:

```
pg_ctl -D /usr/local/var/postgres stop
```

## Checking the log

If you start the server using `-l` option, just open the file that is specified there. In this case `logfile`:

```
less logfile
```
