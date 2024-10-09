<div>

<div>

</div>

<div>

## Name

gz_uncompress — Uncompress a string using gzip algorithm

</div>

<div>

## Synopsis

<div>

|                            |                                   |
|----------------------------|-----------------------------------|
| ` `**`gz_uncompress`**` (` | in `str ` varchar ,               |
|                            | out `str_out ` string_output `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`gz_uncompress ` takes a string argument, uncompresses it using the gzip
algorithm, writing it to a string_output given as the second argument.

</div>

<div>

## Parameters

<div>

### str

A <span class="type">string </span> to be uncompressed.

</div>

<div>

### str_out

A <span class="type">string_output </span> where the uncompressed output
should be written.

</div>

</div>

<div>

## Return Types

Always returns NULL.

</div>

<div>

## Errors

</div>

<div>

## Examples

See <a href="fn_gz_compress.html" class="link" title="gz_compress"><code
class="function">gz_compress </code></a> .

</div>

<div>

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
