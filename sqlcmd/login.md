# Setup

You will need to have the appropriate $PATH configured in order to access the sqlcmd tool. Add the following to your .bash_profile.

```bash
export PATH="$PATH:/opt/mssql-tools/bin"
```

Re-execute your .bash_profile to get the new $PATH
```bash
. ~/.bash_profile
```

# Logging in to an MSSQL instance

To login to a local instance, use the following syntax:

```bash
sqlcmd -S localhost -U sa
```

You will be prompted for a password.