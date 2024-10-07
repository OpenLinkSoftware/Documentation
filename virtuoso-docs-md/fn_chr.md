<div id="fn_chr" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

chr — Convert a <span class="type">long </span> character code to a
character or wide character

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_chr" class="funcsynopsis">

|                         |                          |
|-------------------------|--------------------------|
| `varchar `**`chr`**` (` | in `chr_code ` long `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_chr" class="refsect1">

## Description

`chr ` returns a new one character long string containing the character
with character code given as parameter.

</div>

<div id="params_chr" class="refsect1">

## Parameters

<div id="id82257" class="refsect2">

### *`chr_code `*

The <span class="type">LONG </span> character code value for the
<span class="type">character </span> or <span class="type">wide
character </span> to be produced.

</div>

</div>

<div id="ret_chr" class="refsect1">

## Return Values

If the *`chr_code `* is smaller than or equal to 255, the returned 1
character string will be of type <span class="type">VARCHAR </span> .
Otherwise the returned type is <span class="type">NVARCHAR </span> .

</div>

<div id="errors_chr" class="refsect1">

## Errors

<div id="id82272" class="table">

**Table 24.10. Errors signalled by chr**

<div class="table-contents">

|                                 |                                 |
|---------------------------------|---------------------------------|
| <span class="errorcode"></span> | <span class="errortext"></span> |

</div>

</div>

  

</div>

<div id="examples_chr" class="refsect1">

## Examples

<div id="ex_chr_1" class="example">

**Example 24.42. Simple example**

<div class="example-contents">

``` screen
SQL> select chr (33);
callret
VARCHAR
_______________________________________________________________________________

!

1 Rows. -- 3 msec.
```

</div>

</div>

  

<div id="ex_chr_2" class="example">

**Example 24.43. Stored procedure example**

<div class="example-contents">

This stored procedure lists the ASCII values and characters in a string
given as argument.

``` screen
SQL> create procedure
test_chr (in str varchar)
{
  declare pos integer; pos := 0;
  declare c_code, c_code2 integer; declare c_char varchar;

  result_names (c_code, c_code2, c_char);

  while (pos < length (str))
    {
      result (aref (str, pos), ascii (subseq (str, pos, pos+1, 1)),
        chr (aref (str, pos)));
      pos := pos + 1;
    }
}
;

Done. -- 7 msec.
SQL> test_chr ('Nebuchadnessar');
c_code            c_code2           c_char
INTEGER NOT NULL  INTEGER NOT NULL  VARCHAR NOT NULL
_______________________________________________________________________________

78                78                N
101               101               e
98                98                b
117               117               u
99                99                c
104               104               h
97                97                a
100               100               d
110               110               n
101               101               e
115               115               s
115               115               s
97                97                a
114               114               r

14 Rows. -- 7 msec.
```

</div>

</div>

  

</div>

<div id="seealso_chr" class="refsect1">

## See Also

<a href="fn_aref.html" class="link" title="aref"><code
class="function">aref </code></a> ,
<a href="fn_ascii.html" class="link" title="ascii"><code
class="function">ascii </code></a>

</div>

</div>
