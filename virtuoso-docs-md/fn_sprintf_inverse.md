<div>

<div>

</div>

<div>

## Name

sprintf_inverse — returns vector on a specified pattern.

</div>

<div>

## Synopsis

<div>

|                              |                     |
|------------------------------|---------------------|
| ` `**`sprintf_inverse`**` (` | `strg ` string ,    |
|                              | `format ` string ,  |
|                              | `err ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

sprintf_inverse gets a string to parse, a format string and an integer
(0,1 or 2) that indicates error recovery method. If the first argument
matches the format string then it returns vector of the pattern values.

</div>

<div>

## Parameters

<div>

### strg

a string to parse

</div>

<div>

### format

a format string

</div>

<div>

### err

indicates the error recovery method in case the string does not match to
the format: 0 - to return NULL, 1 - to return shorter vector that
consists of all values extracted before the mismatch has been detected,
2 - to return vector of expected length with NULLs instead of values
that were not found due to mismatch

</div>

</div>

<div>

## Examples

<div>

**Example 24.388. Example 1**

<div>

``` screen
SQL> select sprintf_inverse ('qwe123asd456zxcABRACADABRA', 'qwe%dasd%dzxc%s', 2);
callret
VARCHAR
_______________________________________________________________________________

vector(123,456,0x00adfae8)

1 Rows. -- 0 msec.
SQL>
```

</div>

</div>

  

<div>

**Example 24.389. Example 2**

<div>

``` screen
SQL> select sprintf_inverse ('---123', '%-R', 2);
callret
VARCHAR
_______________________________________________________________________________

vector(0x00b070e8)

1 Rows. -- 0 msec.
SQL>
```

</div>

</div>

  

</div>

</div>
