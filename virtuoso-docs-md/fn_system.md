<div id="fn_system" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

system — runs a shell command from SQL

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_system" class="funcsynopsis">

|                     |                            |
|---------------------|----------------------------|
| ` `**`system`**` (` | in `command ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_system" class="refsect1">

## Description

The system function will run a shell command from SQL. The shell command
is executed in the server's current directory as the user that owns the
database server process.

This function is available to dba users only. Since this is a security
risk this feature is normally disabled. It can be enabled by setting the
AllowOSCalls setting in virtuoso.ini to 1.

</div>

</div>
