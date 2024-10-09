<div>

<div>

</div>

<div>

## Name

dbname — get current catalog

</div>

<div>

## Synopsis

<div>

|                     |          |     |
|---------------------|----------|-----|
| ` `**`dbname`**` (` | `void)`; |     |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns the current qualifier as set by the USE statement or default.

</div>

<div>

## Parameters

None

</div>

<div>

## Return Values

A <span class="type">varchar </span> containing the current catalog
name/qualifier.

</div>

<div>

## Examples

<div>

**Example 24.88. Simple Example**

<div>

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
