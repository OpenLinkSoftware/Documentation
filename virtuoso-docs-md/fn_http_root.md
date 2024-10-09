<div>

<div>

</div>

<div>

## Name

http_root — Returns the absolute path of the server root directory.

</div>

<div>

## Synopsis

<div>

|                               |      |
|-------------------------------|------|
| `varchar `**`http_root`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns the absolute path of the server root directory.

</div>

<div>

## Return Types

String of the absolute path of the server root directory.

</div>

<div>

## Examples

<div>

**Example 24.179. Obtaining the Client IP Address**

<div>

``` programlisting
  <?vsp
    http (file_to_string (sprintf ('%s/banner.html', http_root())));
  ?>
```

</div>

</div>

  

</div>

<div>

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
