<div>

<div>

</div>

<div>

## Name

complete_table_name — Returns a fully qualified table name.

</div>

<div>

## Synopsis

<div>

|                                         |                           |
|-----------------------------------------|---------------------------|
| `varchar `**`complete_table_name`**` (` | in `tablename ` varchar , |
|                                         | in `mode ` integer `)`;   |

<div>

 

</div>

</div>

</div>

<div>

## Description

The `complete_table_name() ` can be used to make a fully qualified table
name from non-qualified one, i.e. the qualifier and owner will be added
if they are missing.

</div>

<div>

## Parameters

<div>

### tablename

The table name to be retrieved.

</div>

<div>

### mode

If this mode parameter is set to 1 this function will first look-up the
supplied tablename for a match in the system tables. If a match is found
the full name will be returned, if the table is not found the function
will continue as if the mode were set to 0.

When the mode parameter is 0 the result will be generated using the
current qualifier and current SQL user account names.

</div>

</div>

<div>

## Return Types

A string will be returned containing the fully qualified table name.

</div>

<div>

## Errors

<div>

**Table 24.11. Errors signalled by**

<div>

| SQLState                              | Error Code                            | Error Text                                                                                                               | Description |
|---------------------------------------|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">SR014 </span> | <span class="errortext">Function complete_table_name needs a string as argument 1, not an arg of type \[type\] </span>   |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">SR008 </span> | <span class="errortext">Function complete_table_name needs an integer as argument 2, not an arg of type \[type\] </span> |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.44. Using the complete_table_name() function**

<div>

This simple example shows retrieval of a fully qualified table name
using the complete_table_name() function from ISQL. In the first case
the table name supplied is a system table, in the second case the table
does not exist and the result is generated based on the users details:

``` screen
SQL> use WS;

Done. -- 4 msec.
SQL> select complete_table_name('SYS_DAV_RES', 1);
callret
VARCHAR
_______________________________________________________________________________

WS.WS.SYS_DAV_RES

1 Rows. -- 1 msec.

SQL> select complete_table_name('SYS_DAV_RES__', 1);
callret
VARCHAR
_______________________________________________________________________________

WS.DBA.SYS_DAV_RES__

1 Rows. -- 1 msec.
```

</div>

</div>

  

</div>

</div>
