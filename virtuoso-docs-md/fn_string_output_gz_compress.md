<div>

<div>

</div>

<div>

## Name

string_output_gz_compress — compress a string_output with gzip algorithm

</div>

<div>

## Synopsis

<div>

|                                        |                                        |
|----------------------------------------|----------------------------------------|
| ` `**`string_output_gz_compress`**` (` | in `str_out_in ` string_session ,      |
|                                        | out `str_out_out ` string_session `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The string_output_gz_compress compresses its string_output argument
using the gzip algorithm and writes the result to another string_output
given as an argument. When successful, the number of bytes written to
*`str_out_out`* is returned.

</div>

<div>

## Parameters

<div>

### str_out_in

A string session as returned by `string_output ` function.

</div>

<div>

### str_out_out

A string session as returned by `string_output ` function.

</div>

</div>

<div>

## Return Types

<span class="type">INTEGER </span> number of bytes written to
*`str_out_out `*

</div>

<div>

## Examples

<div>

**Example 24.409. GZIP test**

<div>

Test if the gzip implementation works.

``` screen
create procedure
gz_test_1 (in fname varchar)
{
  declare dta, dta_2, res any;
  declare len integer;

  res := string_output ();
  dta_2 := string_output ();
  dta := file_to_string_output (fname);

  result_names (len);

  -- send length of input to client

  result (length (dta));

  -- compress and return compressed size.

  result (string_output_gz_compress (dta, res));
  gz_uncompress (string_output_string (res), dta_2);

  if (md5 (dta) <> md5 (dta_2))
    signal ('SNAFU', 'GZIP algorithm implementation is faulty.');

  result (length (dta));
  end_result();
}
;

SQL> gz_test_1 ('tmp/test.dat');
len
INTEGER
_______________________________________________________________________________

11689
2477
11689

3 Rows. -- 11 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_string_output.html" class="link"
title="string_output">string_output</a>

</div>

</div>
