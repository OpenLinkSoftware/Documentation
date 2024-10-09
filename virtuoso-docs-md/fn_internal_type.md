<div>

<div>

</div>

<div>

## Name

internal_type — returns internal integer datatype of its argument

</div>

<div>

## Synopsis

<div>

|                            |                      |
|----------------------------|----------------------|
| ` `**`internal_type`**` (` | `arg ` anything `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

internal_type returns an integer value representing the internal type of
its argument. These values are the same as what Virtuoso uses in the
column COL_DTP of the system table SYS_COLS for keeping the track of the
default types of each column of each table.

``` screen
internal_type(space(5))     -> 182 (A long string)
```

</div>

</div>
