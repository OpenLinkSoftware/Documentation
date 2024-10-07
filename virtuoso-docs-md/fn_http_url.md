<div id="fn_http_url" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_url — write to HTTP client or string output stream with URL escapes

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_url" class="funcsynopsis">

|                       |                       |
|-----------------------|-----------------------|
| ` `**`http_url`**` (` | in `val_expr ` any ,  |
|                       | in `tag ` varchar ,   |
|                       | in `stream ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_url" class="refsect1">

## Description

The `http_url ` is used to write to an HTTP client (when in a VSP
context) or a specified string output stream. `http_url` uses URL
escapes for special characters.

</div>

<div id="params_http_url" class="refsect1">

## Parameters

<div id="id93678" class="refsect2">

### val_expr

A value expression. May be any scalar expression. If *`val_expr`* is an
XML entity, a serialization of the entity is written to the *`stream`* .
This is not the XML as a text string, but a serialization of the
internal representation of parsed XML data.

</div>

<div id="id93683" class="refsect2">

### tag

Optional. If present and is a string, the output will be enclosed in
tags named by the string content of *`tag`* . If the expression
evaluates to 0 or null, it will be ignored.

</div>

<div id="id93687" class="refsect2">

### stream

Optional parameter. If omitted or is 0 and the function is executed
within VSP context, the *`val_expr`* will be written to the HTTP client.
If present and non-zero, *`val_expr`* will be written to the specified
stream. If non-zero, the value must be a valid stream obtained from
function
<a href="fn_string_output.html" class="link" title="string_output"><code
class="function">string_output </code></a>

</div>

</div>

<div id="ret_http_url" class="refsect1">

## Return Values

None

</div>

<div id="errors_http_url" class="refsect1">

## Errors

<div id="id93699" class="table">

**Table 24.46. Errors signalled by `http_url `**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                               | Description |
|---------------------------------------|---------------------------------------|----------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">37000 </span> | <span class="errorcode">HT006 </span> | <span class="errortext">http output function outside of http context and no stream specified: %s </span> |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">SR066 </span> | <span class="errortext">Unsupported case in CONVERT (%s -\> VARCHAR) </span>                             |             |

</div>

</div>

  

</div>

<div id="examples_http_url" class="refsect1">

## Examples

<div id="ex_http_url" class="example">

**Example 24.182. HTTP output**

<div class="example-contents">

Output of various flavours of `http ` . See
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

<div id="seealso_http_url" class="refsect1">

## See Also

<a href="fn_http.html" class="link" title="http"><code
class="function">http </code></a> ,
<a href="fn_http_value.html" class="link" title="http_value"><code
class="function">http_value</code></a> ,
<a href="fn_string_output.html" class="link" title="string_output"><code
class="function">string_output</code></a> ,
<a href="fn_http_rewrite.html" class="link" title="http_rewrite"><code
class="function">http_rewrite</code></a> .

</div>

</div>
