<div>

<div>

</div>

<div>

## Name

substring — returns a substring of a string

</div>

<div>

## Synopsis

<div>

|                        |                        |
|------------------------|------------------------|
| ` `**`substring`**` (` | `str ` string ,        |
|                        | `from ` integer ,      |
|                        | `sublen ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns a substring of string str. The start index is 1 based. The
substring is sublen characters long.

This function follows SQL 92.

``` screen
substring('AbracadabrA',1,4) -> 'Abra'
substring('AbracadabrA',5,4) -> 'cada'
substring('AbracadabrA',8,4) -> 'abrA'
```

</div>

</div>
