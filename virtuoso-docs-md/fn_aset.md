<div id="fn_aset" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

aset — set array element

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_aset" class="funcsynopsis">

|                   |                         |
|-------------------|-------------------------|
| ` `**`aset`**` (` | in `arg ` any ,         |
|                   | in `nth ` integer ,     |
|                   | in `new_elem ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_aset" class="refsect1">

## Description

aset sets the nth element of a string, array or vector where nth is a
zero-based index. If the first argument is a string, the nth character
of string is replaced with the ASCII value given in the third argument
elem.

</div>

<div id="params_aset" class="refsect1">

## Parameters

<div id="id80508" class="refsect2">

### arg

A string, array or vector.

</div>

<div id="id80511" class="refsect2">

### nth

Zero-based element index.

</div>

<div id="id80514" class="refsect2">

### nelem

The new element. If *`arg `* is a string, its nth element will be
replaced by the ASCII value given in *`new_elem `* .

</div>

</div>

<div id="ret_aset" class="refsect1">

## Return Values

`Aset ` returns *`nelem `* . It modifies its first argument.

</div>

<div id="errors_aset" class="refsect1">

## Errors

<div id="id80526" class="table">

**Table 24.4. Errors signalled by aset**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                      | Description |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------|-------------|
| <span class="errorcode">22003 </span> | <span class="errorcode">SR020 </span> | <span class="errortext">Bad array subscript %d in aset. </span> |             |

</div>

</div>

  

</div>

<div id="examples_aset" class="refsect1">

## Examples

<div id="ex_aset_1" class="example">

**Example 24.15. Using `make_string ` and `aref`**

<div class="example-contents">

Make a string, fill with character sequence from A to Z.

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

  

<div id="ex_aset_2" class="example">

**Example 24.16. Reverse a string using aset**

<div class="example-contents">

Note that str is modified by aset.

``` screen
SQL> create procedure
revstr (in str varchar)
{
    declare len, inx1, inx2, tmp integer;

    if (str is null) return (str);

    len := length (str);
    if (len < 2)
      return (str); -- No need for further processing

    inx1 := 0;       -- Index from the left.
    inx2 := len - 1; -- Index from the right.
    len  := len / 2; -- Upper limit for inx1.

    while (inx1 < len)
      {
        tmp := aref (str, inx1);
    aset (str, inx1, aref (str, inx2));
    aset (str, inx2, tmp);
    inx1 := inx1 + 1;
    inx2 := inx2 - 1;
      }
    return (str);
}
;

Done. -- 7 msec.
SQL> select revstr ('repaid'), revstr ('Alli, tapa pulu papatilla!');
callret   callret
VARCHAR   VARCHAR
_______________________________________________________________________________

diaper    !allitapap ulup apat ,illA

1 Rows. -- 11 msec.
```

</div>

</div>

  

</div>

<div id="seealso_aset" class="refsect1">

## See Also

<a href="fn_aref.html" class="link" title="aref"><code
class="function">aref() </code></a> ,
<a href="fn_vector.html" class="link" title="vector"><code
class="function">vector()</code></a> ,
<a href="fn_make_string.html" class="link" title="make_string"><code
class="function">make_string()</code></a>

</div>

</div>
