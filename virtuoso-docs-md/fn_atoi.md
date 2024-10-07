<div id="fn_atoi" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

atoi — Convert a string to an integer

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_atoi" class="funcsynopsis">

|                   |                       |
|-------------------|-----------------------|
| ` `**`atoi`**` (` | in `arg ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_atoi" class="refsect1">

## Description

atoi returns its argument as an integer. If the string cannot be parsed
and converted to a valid integer, a value 0 is returned.

</div>

<div id="params_atoi" class="refsect1">

## Parameters

<div id="id80620" class="refsect2">

### *`arg `*

A string input parameter

</div>

</div>

<div id="ret_atoi" class="refsect1">

## Return Types

The string converted to an integer. If the string is a number then the
absolute value of the literal will be returned as an integer. Otherwise
0 is returned.

</div>

<div id="examples_atoi" class="refsect1">

## Examples

<div id="ex_atoi" class="example">

**Example 24.18. Simple examples**

<div class="example-contents">

``` screen
SQL> select atoi('1.23456789');
callret
INTEGER
_______________________________________________________________________________

1

1 Rows. -- 5 msec.

SQL> select atoi ('Cadena de los patos amarillos');
callret
INTEGER
_______________________________________________________________________________

0

1 Rows. -- 4 msec.
```

</div>

</div>

  

</div>

<div id="seealso_atoi" class="refsect1">

## See Also

` `<a href="fn_atof.html" class="link" title="atof"><code
class="function">atof</code></a>` `

</div>

</div>
