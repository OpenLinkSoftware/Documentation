<div id="fn_concat" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

concat — Concatenate strings

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_concat" class="funcsynopsis">

|                     |                      |
|---------------------|----------------------|
| ` `**`concat`**` (` | `str1 ` varchar ,    |
|                     | `str2 ` varchar ,    |
|                     | `... ` ,             |
|                     | `strn ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_concat" class="refsect1">

## Description

`concat ` returns a new <span class="type">string </span> , concatenated
from a variable number of strings given as arguments. NULL arguments are
handled as empty strings.

``` programlisting
concat (str)
```

returns a copy of *`str`* .

``` programlisting
concat ()
```

returns an empty <span class="type">string </span> .

</div>

<div id="params_concat" class="refsect1">

## Parameters

Concat takes a variable number of <span class="type">string </span>
arguments.

</div>

<div id="ret_concat" class="refsect1">

## Return types

The `concat ` returns a single <span class="type">string</span> . If
there are <span class="type">wide strings</span> amongst the arguments,
the string returned will also be <span class="type">wide </span> .

</div>

<div id="err_concat" class="refsect1">

## Errors

<div id="id82640" class="table">

**Table 24.15. Errors signalled by concat()**

<div class="table-contents">

|                                       |                                       |                                                                                                                                               |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| sqlstate                              | error code                            | error text                                                                                                                                    |
| <span class="errorcode">22023 </span> | <span class="errorcode">SR007 </span> | <span class="errortext">Function concat needs a string or NULL as argument \<argument number\>, not an arg of type \<offending type\> </span> |

</div>

</div>

  

</div>

<div id="examples_concat" class="refsect1">

## Examples

<div id="ex_concat_1" class="example">

**Example 24.47. Simple Example**

<div class="example-contents">

Cross a mule with an ass.

``` screen
SQL> select concat ('Muuli', 'aasi');
callret
VARCHAR
_______________________________________________________________________________

Muuliaasi

1 Rows. -- 4 msec.
```

</div>

</div>

  

</div>

</div>
