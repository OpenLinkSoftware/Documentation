<div>

<div>

</div>

<div>

## Name

att_local_name — Compose a fully qualified table name based on DSN and
remote table name.

</div>

<div>

## Synopsis

<div>

|                                    |                          |
|------------------------------------|--------------------------|
| `varchar `**`att_local_name`**` (` | in `dsn ` varchar ,      |
|                                    | in `table ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The utility function, `att_local_name() ` , can be used to make a fully
qualified table name from non-qualified or qualified one, i.e. the
qualifier and owner will be added if they are missing. The schema name
will be replaced with current qualifier on execution, owner will be
replaced or added with name of supplied DSN name. All non-alphanumeric
characters in the name will be replaced with underscore symbol.

</div>

<div>

## Parameters

<div>

### dsn

The name of remote data source.

</div>

<div>

### table

The name of remote table.

</div>

</div>

<div>

## Return Types

A string will be returned containing the fully qualified table name.

</div>

<div>

## Examples

<div>

**Example 24.19. Using the att_local_name() function**

<div>

This simple example shows retrieval of fully qualified table name. using
the att_local_name() function from ISQL.

``` screen
SQL> select att_local_name ('Oracle', 'DEMO.EMP');
callret
VARCHAR
_______________________________________________________________________________

DB.ORACLE.EMP

1 Rows. -- 9 msec.
```

</div>

</div>

  

</div>

</div>
