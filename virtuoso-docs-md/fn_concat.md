<div>

<div>

</div>

<div>

## Name

concat — Concatenate strings

</div>

<div>

## Synopsis

<div>

|                     |                      |
|---------------------|----------------------|
| ` `**`concat`**` (` | `str1 ` varchar ,    |
|                     | `str2 ` varchar ,    |
|                     | `... ` ,             |
|                     | `strn ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

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

<div>

## Parameters

Concat takes a variable number of <span class="type">string </span>
arguments.

</div>

<div>

## Return types

The `concat ` returns a single <span class="type">string</span> . If
there are <span class="type">wide strings</span> amongst the arguments,
the string returned will also be <span class="type">wide </span> .

</div>

<div>

## Errors

<div>

**Table 24.14. Errors signalled by concat()**

<div>

| sqlstate                              | error code                            | error text                                                                                                                                    |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">SR007 </span> | <span class="errortext">Function concat needs a string or NULL as argument \<argument number\>, not an arg of type \<offending type\> </span> |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.47. Simple Example**

<div>

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
