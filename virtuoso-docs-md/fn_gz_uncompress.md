<div id="fn_gz_uncompress" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

gz_uncompress — Uncompress a string using gzip algorithm

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_gz_uncompress" class="funcsynopsis">

|                            |                                   |
|----------------------------|-----------------------------------|
| ` `**`gz_uncompress`**` (` | in `str ` varchar ,               |
|                            | out `str_out ` string_output `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_gz_uncompress" class="refsect1">

## Description

`gz_uncompress ` takes a string argument, uncompresses it using the gzip
algorithm, writing it to a string_output given as the second argument.

</div>

<div id="params_gz_uncompress" class="refsect1">

## Parameters

<div id="id90381" class="refsect2">

### str

A <span class="type">string </span> to be uncompressed.

</div>

<div id="id90385" class="refsect2">

### str_out

A <span class="type">string_output </span> where the uncompressed output
should be written.

</div>

</div>

<div id="ret_gz_uncompress" class="refsect1">

## Return Types

Always returns NULL.

</div>

<div id="errors_gz_uncompress" class="refsect1">

## Errors

</div>

<div id="examples_gz_uncompress" class="refsect1">

## Examples

See <a href="fn_gz_compress.html" class="link" title="gz_compress"><code
class="function">gz_compress </code></a> .

</div>

<div id="seealso_gz_uncompress" class="refsect1">

## See Also

<a href="fn_gz_compress.html" class="link" title="gz_compress"><code
class="function">gz_compress </code></a> ,
<a href="fn_string_output_gz_compress.html" class="link"
title="string_output_gz_compress"><code
class="function">string_output_gz_compress</code></a> ,
<a href="fn_string_output.html" class="link" title="string_output"><code
class="function">string_output</code></a> .

</div>

</div>
