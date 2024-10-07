<div id="fn_dbname" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

dbname — get current catalog

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_dbname" class="funcsynopsis">

|                     |          |     |
|---------------------|----------|-----|
| ` `**`dbname`**` (` | `void)`; |     |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_dbname" class="refsect1">

## Description

Returns the current qualifier as set by the USE statement or default.

</div>

<div id="params_dbname" class="refsect1">

## Parameters

None

</div>

<div id="ret_dbname" class="refsect1">

## Return Values

A <span class="type">varchar </span> containing the current catalog
name/qualifier.

</div>

<div id="examples_dbname" class="refsect1">

## Examples

<div id="ex_dbname_1" class="example">

**Example 24.88. Simple Example**

<div class="example-contents">

Get current catalog/qualifier

``` screen
SQL> select dbname();
callret
VARCHAR
_______________________________________________________________________________

DB

1 Rows. -- 117 msec.
SQL> use Demo;

Done. -- 73 msec.
SQL> select dbname();
callret
VARCHAR
_______________________________________________________________________________

Demo

1 Rows. -- 4 msec.
SQL>
```

</div>

</div>

  

</div>

</div>
