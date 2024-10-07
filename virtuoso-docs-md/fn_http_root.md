<div id="fn_http_root" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_root — Returns the absolute path of the server root directory.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_root" class="funcsynopsis">

|                               |      |
|-------------------------------|------|
| `varchar `**`http_root`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_root" class="refsect1">

## Description

Returns the absolute path of the server root directory.

</div>

<div id="ret_http_root" class="refsect1">

## Return Types

String of the absolute path of the server root directory.

</div>

<div id="examples_http_root" class="refsect1">

## Examples

<div id="ex_http_root" class="example">

**Example 24.179. Obtaining the Client IP Address**

<div class="example-contents">

``` programlisting
  <?vsp
    http (file_to_string (sprintf ('%s/banner.html', http_root())));
  ?>
```

</div>

</div>

  

</div>

<div id="seealso_http_root" class="refsect1">

## See Also

<a href="fn_http.html" class="link" title="http"><code
class="function">http </code></a> ,
<a href="fn_http_value.html" class="link" title="http_value"><code
class="function">http_value</code></a> ,
<a href="fn_http_url.html" class="link" title="http_url"><code
class="function">http_url</code></a> ,
<a href="fn_string_output.html" class="link" title="string_output"><code
class="function">string_output</code></a> ,
<a href="fn_http_rewrite.html" class="link" title="http_rewrite"><code
class="function">http_rewrite</code></a> .

</div>

</div>
