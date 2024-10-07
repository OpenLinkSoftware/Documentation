<div id="fn_string_output_string" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

string_output_string — produce a string out of a string output stream

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_string_output_string" class="funcsynopsis">

|                                   |                           |
|-----------------------------------|---------------------------|
| ` `**`string_output_string`**` (` | in `string_out ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_35" class="refsect1">

## Description

This function is used to produce a string from contents of a string
output stream. See
<a href="fn_string_output.html" class="link" title="string_output"><code
class="function">string_output</code></a> for more information about
string output streams.

</div>

<div id="params_09" class="refsect1">

## Parameters

<div id="id112450" class="refsect2">

### string_out

The string output stream

</div>

</div>

<div id="ret_03_01" class="refsect1">

## Return Values

A <span class="type">varchar </span> with the contents of the string
output stream.

</div>

<div id="examples_06_01" class="refsect1">

## Examples

<div id="ex_string_output_string" class="example">

**Example 24.410. Convert string output stream into a string**

<div class="example-contents">

Create a string output, write 'foo' and ' bar' into it, convert to
string and produce a result.

``` screen
SQL> create procedure
ex_string_output_string ()
{
  declare s_out any; s_out := string_output();
  declare s varchar;

  result_names (s);
  http('foo', s_out);
  http(' bar', s_out);
  s := string_output_string (s_out);
  result (s);
}
;

SQL> ex_string_output_string ();
s
VARCHAR NOT NULL
_______________________________________________________________________________

foo bar

1 Rows. -- 5 msec.
```

</div>

</div>

  

</div>

<div id="seealso_16" class="refsect1">

## See Also

<a href="fn_string_output.html" class="link" title="string_output"><code
class="function">string_output </code></a> ,
<a href="fn_http.html" class="link" title="http"><code
class="function">http </code></a> ,
<a href="fn_http_value.html" class="link" title="http_value"><code
class="function">http_value</code></a> ,
<a href="fn_http_rewrite.html" class="link" title="http_rewrite"><code
class="function">http_rewrite</code></a> .

</div>

</div>
