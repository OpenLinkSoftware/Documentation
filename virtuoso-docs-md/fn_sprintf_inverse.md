<div id="fn_sprintf_inverse" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sprintf_inverse — returns vector on a specified pattern.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sprintf_inverse" class="funcsynopsis">

|                              |                     |
|------------------------------|---------------------|
| ` `**`sprintf_inverse`**` (` | `strg ` string ,    |
|                              | `format ` string ,  |
|                              | `err ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_25" class="refsect1">

## Description

sprintf_inverse gets a string to parse, a format string and an integer
(0,1 or 2) that indicates error recovery method. If the first argument
matches the format string then it returns vector of the pattern values.

</div>

<div id="params_sprintf_inverse" class="refsect1">

## Parameters

<div id="id111137" class="refsect2">

### strg

a string to parse

</div>

<div id="id111140" class="refsect2">

### format

a format string

</div>

<div id="id111143" class="refsect2">

### err

indicates the error recovery method in case the string does not match to
the format: 0 - to return NULL, 1 - to return shorter vector that
consists of all values extracted before the mismatch has been detected,
2 - to return vector of expected length with NULLs instead of values
that were not found due to mismatch

</div>

</div>

<div id="examples_sprintf_inverse" class="refsect1">

## Examples

<div id="ex_sprintf_inverse" class="example">

**Example 24.388. Example 1**

<div class="example-contents">

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

  

<div id="ex_sprintf_inverse_01" class="example">

**Example 24.389. Example 2**

<div class="example-contents">

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
