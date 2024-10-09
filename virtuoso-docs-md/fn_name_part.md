<div>

<div>

</div>

<div>

## Name

name_part — Returns portion of dotted name such as a fully qualified
table name.

</div>

<div>

## Synopsis

<div>

|                               |                            |
|-------------------------------|----------------------------|
| `varchar `**`name_part`**` (` | in `string ` varchar ,     |
|                               | in `idx ` integer ,        |
|                               | in `dstring ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The `name_part() ` can be used to dissecting parts of a three part names
(string where items are divided by dots ".") such as table names or
columns names. The table name "DB"."DBA"."SYS_USERS" contains three
parts which can be extracted individually using this function providing
the correct index from a 0 base: 0 would return "DB", 1 would return
"DBA", 2 would return "SYS_USERS".

</div>

<div>

## Parameters

<div>

### string

The string to be disected.

</div>

<div>

### idx

The part index starting from 0.

</div>

<div>

### dstring

The default value if the found value is null.

</div>

</div>

<div>

## Return Types

A string will be returned containing the text from the specified index.

</div>

<div>

## Errors

<div>

**Table 24.55. Errors signalled by**

<div>

| SQLState                              | Error Code                            | Error Text                                                                                                     | Description |
|---------------------------------------|---------------------------------------|----------------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">SR014 </span> | <span class="errortext">Function name_part needs a string as argument 1, not an arg of type \[type\] </span>   |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">SR008 </span> | <span class="errortext">Function name_part needs an integer as argument 2, not an arg of type \[type\] </span> |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.224. Using the name_part() function**

<div>

This simple example shows the 3 parts of a table name being retrieved
using the name_part() function from ISQL.

``` screen
SQL> select name_part('"DB"."DBA"."SYS_TABLES"', 0);
callret
VARCHAR
__________________________________________________________

"DB"

1 Rows. -- 20 msec.
SQL> select name_part('"DB"."DBA"."SYS_TABLES"', 1);
callret
VARCHAR
__________________________________________________________

"DBA"

1 Rows. -- 30 msec.
SQL> select name_part('"DB"."DBA"."SYS_TABLES"', 2);
callret
VARCHAR
__________________________________________________________

SYS_TABLES"

1 Rows. -- 20 msec.
```

</div>

</div>

  

</div>

</div>
