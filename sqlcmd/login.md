## A quick recommendation

Switch to the mssql user created during the MSSQL installation prior to working with your instance or configuration.

```
sudo su - mssql
```

# Setup

You will need to have the appropriate $PATH configured in order to access the sqlcmd tool. Add the following to your .bash_profile.

```
export PATH="$PATH:/opt/mssql-tools/bin"
```

Re-execute your .bash_profile to get the new $PATH
```
. ~/.bash_profile
```

If you still cannot access sqlcmd, [make sure it is installed](https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-red-hat?view=sql-server-linux-2017#tools).

# Logging in to an MSSQL instance

To login to a local instance, use the following syntax:

```
sqlcmd -S localhost -U sa
```

You will be prompted for a password.