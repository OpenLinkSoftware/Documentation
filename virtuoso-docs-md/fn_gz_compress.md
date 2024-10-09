<div>

<div>

</div>

<div>

## Name

gz_compress — Compress data using gzip algorithm

</div>

<div>

## Synopsis

<div>

|                          |                        |
|--------------------------|------------------------|
| ` `**`gz_compress`**` (` | in `str ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The gz_compress returns its argument compressed with the gzip algorithm.
The argument and return values are arbitrary strings, possibly including
any 8 bit characters.

</div>

<div>

## Parameters

<div>

### str

The string containing data to be compressed.

</div>

</div>

<div>

## Return Types

A string containing the compressed data.

</div>

<div>

## Examples

<div>

**Example 24.134. GZIP test 2**

<div>

Just see how it compresses.

``` screen
create procedure
gz_test_2 (in str varchar)
{
  declare res any;
  declare _out varchar;
  declare _len integer;

  result_names (_out, _len);

  res := string_output ();
  result (str, length (str));
  str := gz_compress (str);
  result ('binary', length (str));
  gz_uncompress (str, res);
  result (res, length (res));
}

SQL> gz_test_2 ('f00f f00f m0053 2 w3r h4x0r7 ch002 00000000000000000000000');
_out                      _len
VARCHAR                   INTEGER
_______________________________________________________________________________

f00f f00f m0053 5 w3r h4x0r7 ch002 00000000000000000000000  58
binary                    43
f00f f00f m0053 5 w3r h4x0r7 ch002 00000000000000000000000  58

3 Rows. -- 10 msec.
SQL>
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_gz_uncompress.html" class="link" title="gz_uncompress"><code
class="function">gz_uncompress </code></a> ,
<a href="fn_string_output_gz_compress.html" class="link"
title="string_output_gz_compress"><code
class="function">string_output_gz_compress</code></a> ,
<a href="fn_string_output.html" class="link" title="string_output"><code
class="function">string_output</code></a> .

</div>

</div>
