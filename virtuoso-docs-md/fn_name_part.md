<div id="fn_name_part" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

name_part — Returns portion of dotted name such as a fully qualified
table name.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_name_part" class="funcsynopsis">

|                               |                            |
|-------------------------------|----------------------------|
| `varchar `**`name_part`**` (` | in `string ` varchar ,     |
|                               | in `idx ` integer ,        |
|                               | in `dstring ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_name_part" class="refsect1">

## Description

The `name_part() ` can be used to dissecting parts of a three part names
(string where items are divided by dots ".") such as table names or
columns names. The table name "DB"."DBA"."SYS_USERS" contains three
parts which can be extracted individually using this function providing
the correct index from a 0 base: 0 would return "DB", 1 would return
"DBA", 2 would return "SYS_USERS".

</div>

<div id="params_name_part" class="refsect1">

## Parameters

<div id="id97007" class="refsect2">

### string

The string to be disected.

</div>

<div id="id97010" class="refsect2">

### idx

The part index starting from 0.

</div>

<div id="id97013" class="refsect2">

### dstring

The default value if the found value is null.

</div>

</div>

<div id="ret_name_part" class="refsect1">

## Return Types

A string will be returned containing the text from the specified index.

</div>

<div id="errors_name_part" class="refsect1">

## Errors

<div id="id97021" class="table">

**Table 24.56. Errors signalled by**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                                     | Description |
|---------------------------------------|---------------------------------------|----------------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">SR014 </span> | <span class="errortext">Function name_part needs a string as argument 1, not an arg of type \[type\] </span>   |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">SR008 </span> | <span class="errortext">Function name_part needs an integer as argument 2, not an arg of type \[type\] </span> |             |

</div>

</div>

  

</div>

<div id="examples_name_part" class="refsect1">

## Examples

<div id="ex_name_part" class="example">

**Example 24.224. Using the name_part() function**

<div class="example-contents">

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
