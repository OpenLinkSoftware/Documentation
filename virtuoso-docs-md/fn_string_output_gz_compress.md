<div id="fn_string_output_gz_compress" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

string_output_gz_compress — compress a string_output with gzip algorithm

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_string_output_gz_compress" class="funcsynopsis">

|                                        |                                        |
|----------------------------------------|----------------------------------------|
| ` `**`string_output_gz_compress`**` (` | in `str_out_in ` string_session ,      |
|                                        | out `str_out_out ` string_session `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_string_output_gz_compress" class="refsect1">

## Description

The string_output_gz_compress compresses its string_output argument
using the gzip algorithm and writes the result to another string_output
given as an argument. When successful, the number of bytes written to
*`str_out_out`* is returned.

</div>

<div id="params_string_output_gz_compress" class="refsect1">

## Parameters

<div id="id112406" class="refsect2">

### str_out_in

A string session as returned by `string_output ` function.

</div>

<div id="id112410" class="refsect2">

### str_out_out

A string session as returned by `string_output ` function.

</div>

</div>

<div id="ret_string_output_gz_compress" class="refsect1">

## Return Types

<span class="type">INTEGER </span> number of bytes written to
*`str_out_out `*

</div>

<div id="examples_string_output_gz_compress" class="refsect1">

## Examples

<div id="ex_string_output_gz_compress_1" class="example">

**Example 24.409. GZIP test**

<div class="example-contents">

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

<div id="seealso_string_output_gz_compress" class="refsect1">

## See Also

<a href="fn_string_output.html" class="link"
title="string_output">string_output</a>

</div>

</div>
