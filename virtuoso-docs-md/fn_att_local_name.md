<div id="fn_att_local_name" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

att_local_name — Compose a fully qualified table name based on DSN and
remote table name.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_att_local_name" class="funcsynopsis">

|                                    |                          |
|------------------------------------|--------------------------|
| `varchar `**`att_local_name`**` (` | in `dsn ` varchar ,      |
|                                    | in `table ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_att_local_name" class="refsect1">

## Description

The utility function, `att_local_name() ` , can be used to make a fully
qualified table name from non-qualified or qualified one, i.e. the
qualifier and owner will be added if they are missing. The schema name
will be replaced with current qualifier on execution, owner will be
replaced or added with name of supplied DSN name. All non-alphanumeric
characters in the name will be replaced with underscore symbol.

</div>

<div id="params_att_local_name" class="refsect1">

## Parameters

<div id="id80659" class="refsect2">

### dsn

The name of remote data source.

</div>

<div id="id80662" class="refsect2">

### table

The name of remote table.

</div>

</div>

<div id="ret_att_local_name" class="refsect1">

## Return Types

A string will be returned containing the fully qualified table name.

</div>

<div id="examples_att_local_name" class="refsect1">

## Examples

<div id="ex_att_local_name" class="example">

**Example 24.19. Using the att_local_name() function**

<div class="example-contents">

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
