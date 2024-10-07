<div id="fn_make_string" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

make_string — make a string

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_make_string" class="funcsynopsis">

|                          |                          |
|--------------------------|--------------------------|
| ` `**`make_string`**` (` | in `count ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_03" class="refsect1">

## Description

make_string returns a new string of length count, filled with binary
zeros.

If count is zero, an empty string '' is returned.

</div>

<div id="params_02" class="refsect1">

## Parameters

<div id="id96323" class="refsect2">

### count

Length of the string to be generated.

</div>

</div>

<div id="ret_01_01" class="refsect1">

## Return Values

A string with defined length is returned.

</div>

<div id="examples_02" class="refsect1">

## Examples

<div id="ex_make_string" class="example">

**Example 24.215. Using `make_string ` and `aref`**

<div class="example-contents">

Make a string and fill it with character sequence containing the
alphabet upper case characters from A to Z.

``` screen
SQL> create procedure
alphabet_string ()
{
  declare _inx integer;
  declare _str varchar;
  _str := make_string (26);

  while (_inx < 26)
    {
      aset (_str, _inx, _inx + 65);
      _inx := _inx + 1;
    }
  return (_str);
}
;

Done. -- 6 msec.
SQL> select alphabet_string ();
callret
VARCHAR NOT NULL
_______________________________________________________________________________

ABCDEFGHIJKLMNOPQRSTUVWXYZ

1 Rows. -- 4 msec.
```

</div>

</div>

  

</div>

<div id="seealso_05" class="refsect1">

## See Also

<a href="fn_vector.html" class="link" title="vector"><code
class="function">vector() </code></a> ,
<a href="fn_aref.html" class="link" title="aref"><code
class="function">aref</code></a> ,
<a href="fn_aset.html" class="link" title="aset"><code
class="function">aset</code></a>

</div>

</div>
