<div>

<div>

</div>

<div>

## Name

system — runs a shell command from SQL

</div>

<div>

## Synopsis

<div>

|                     |                            |
|---------------------|----------------------------|
| ` `**`system`**` (` | in `command ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The system function will run a shell command from SQL. The shell command
is executed in the server's current directory as the user that owns the
database server process.

This function is available to dba users only. Since this is a security
risk this feature is normally disabled. It can be enabled by setting the
AllowOSCalls setting in virtuoso.ini to 1.

</div>

</div>
