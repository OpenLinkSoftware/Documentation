<div>

<div>

</div>

<div>

## Name

make_string — make a string

</div>

<div>

## Synopsis

<div>

|                          |                          |
|--------------------------|--------------------------|
| ` `**`make_string`**` (` | in `count ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

make_string returns a new string of length count, filled with binary
zeros.

If count is zero, an empty string '' is returned.

</div>

<div>

## Parameters

<div>

### count

Length of the string to be generated.

</div>

</div>

<div>

## Return Values

A string with defined length is returned.

</div>

<div>

## Examples

<div>

**Example 24.215. Using `make_string ` and `aref`**

<div>

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

<div>

## See Also

<a href="fn_vector.html" class="link" title="vector"><code
class="function">vector() </code></a> ,
<a href="fn_aref.html" class="link" title="aref"><code
class="function">aref</code></a> ,
<a href="fn_aset.html" class="link" title="aset"><code
class="function">aset</code></a>

</div>

</div>
