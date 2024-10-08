<div>

<div>

</div>

<div>

## Name

\_\_any_grants — Checks a table for grants.

</div>

<div>

## Synopsis

<div>

|                                  |                              |
|----------------------------------|------------------------------|
| `integer `**`__any_grants`**` (` | in `tablename ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The `__any_grants() ` can be used to test whether there are any rights
granted (for insert/update/delete) to a table for current SQL account.

</div>

<div>

## Parameters

<div>

### tablename

The table name to be tested.

</div>

</div>

<div>

## Return Types

An integer will be returned to indicate whether the table supplied has
any privileges granted (1) or not granted (zero 0) for current SQL user.

</div>

<div>

## Errors

<div>

**Table 24.1. Errors signalled by**

<div>

| SQLState                              | Error Code                            | Error Text                                                                                                    | Description |
|---------------------------------------|---------------------------------------|---------------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">SR014 </span> | <span class="errortext">Function any_grants needs a string as argument 1, not an arg of type \[type\] </span> |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.12. Using the \_\_any_grants() function**

<div>

This simple example shows testing a grant rights for a table, using the
\_\_any_grants() function from ISQL and demo SQL user accout.

``` screen
$isql localhost:1112 demo demo
-- the demo account owns an Orders table, so it's granted
SQL> select __any_grants ('Demo.demo.Orders');
callret
INTEGER
_______________________________________________________________________________

1

1 Rows. -- 1 msec.

-- but it has no permission to access the table SYS_REPL_ACCOUNTS
SQL> select __any_grants ('DB.DBA.SYS_REPL_ACCOUNTS');
callret
INTEGER
_______________________________________________________________________________

0

1 Rows. -- 5 msec.
```

</div>

</div>

  

</div>

</div>
