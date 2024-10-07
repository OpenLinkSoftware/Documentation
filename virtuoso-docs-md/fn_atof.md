<div id="fn_atof" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

atof — Convert a string to single precision float

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_atof" class="funcsynopsis">

|                   |                       |
|-------------------|-----------------------|
| ` `**`atof`**` (` | in `arg ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_atof" class="refsect1">

## Description

atof returns its argument as a single precision floating point. If the
string cannot be parsed and converted to a valid float, a value 0.0 is
returned.

</div>

<div id="params_atof" class="refsect1">

## Parameters

<div id="id80584" class="refsect2">

### *`arg `*

A string input parameter

</div>

</div>

<div id="ret_atof" class="refsect1">

## Return Types

Single precision floating point

</div>

<div id="examples_atof" class="refsect1">

## Examples

<div id="ex_atof" class="example">

**Example 24.17. Simple examples**

<div class="example-contents">

``` screen
SQL> select atof('1.23456789');
callret
REAL
_______________________________________________________________________________

1.234568

1 Rows. -- 5 msec.

SQL> select atof ('Cadena de los patos amarillos');
callret
REAL
_______________________________________________________________________________

0.000000

1 Rows. -- 4 msec.

SQL> select atof (sprintf ('%f', 2.3423));
callret
REAL
_______________________________________________________________________________

2.342300

1 Rows. -- 5 msec.
```

</div>

</div>

  

</div>

<div id="seealso_atof" class="refsect1">

## See Also

` `<a href="fn_atoi.html" class="link" title="atoi"><code
class="function">atoi</code></a>` `

</div>

</div>
