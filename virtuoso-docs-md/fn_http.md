<div>

<div>

</div>

<div>

## Name

http — write to HTTP client or a string output stream

</div>

<div>

## Synopsis

<div>

|                   |                       |
|-------------------|-----------------------|
| ` `**`http`**` (` | in `val_expr ` any ,  |
|                   | in `stream ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`http ` writes *`val_expr `* to HTTP client or, if parameter *`stream`*
is given, to the given string output stream.

*`val_expr`* may be any scalar object, i.e.
<span class="type">string</span> , <span class="type">date</span> or
<span class="type">number</span> and will automatically be cast to
<span class="type">varchar</span> before further processing. http will
print out the string without escapes.
<a href="fn_http_value.html" class="link" title="http_value"><code
class="function">http_value</code></a> uses HTML escapes and
<a href="fn_http_url.html" class="link" title="http_url"><code
class="function">http_url</code></a> URL escapes.

</div>

<div>

## Parameters

<div>

### val_expr

A value expression. May be any scalar expression.

</div>

<div>

### stream

Optional parameter. If omitted or is 0 and the function is executed
within a VSP context, the *`val_expr`* will be written to the HTTP
client. If present and non-zero, *`val_expr`* will be written to the
specified stream. If non-zero, the value must be a valid stream obtained
from function
<a href="fn_string_output.html" class="link" title="string_output"><code
class="function">string_output </code></a>

</div>

</div>

<div>

## Errors

<div>

**Table 24.37. Errors signalled by `http `**

<div>

| SQLState                              | Error Code                            | Error Text                                                                                                | Description |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">HT007 </span> | <span class="errortext">An interactive blob can't be passed as argument to http </span>                   |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">HT008 </span> | <span class="errortext">http requires string, blob, or string session as argument 1 </span>               |             |
| <span class="errorcode">37000 </span> | <span class="errorcode">HT006 </span> | <span class="errortext">http output function outside of http context and no stream specified: %s. </span> |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.151. HTTP output**

<div>

Output of various flavours of http. See
<a href="fn_string_output.html" class="link" title="string_output"><code
class="function">string_output</code></a> and
<a href="fn_string_output_string.html" class="link"
title="string_output_string"><code
class="function">string_output_string </code></a> for examples how to
use http to write to streams other than the HTTP output.

``` screen
http (' % <b>')     ' <b>
http_value (' % <b>')   % &lt;b&gt;
http_url (' % <b>')  +%25+<b>
http_value (12, 'li')  <li>12</li>
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_http_value.html" class="link" title="http_value"><code
class="function">http_value </code></a> ,
<a href="fn_http_url.html" class="link" title="http_url"><code
class="function">http_url</code></a> ,
<a href="fn_string_output.html" class="link" title="string_output"><code
class="function">string_output</code></a> ,
<a href="fn_http_rewrite.html" class="link" title="http_rewrite"><code
class="function">http_rewrite</code></a> .

</div>

</div>
