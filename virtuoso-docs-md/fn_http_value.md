<div>

<div>

</div>

<div>

## Name

http_value — write to HTTP client or string output stream with HTML
escapes

</div>

<div>

## Synopsis

<div>

|                         |                       |
|-------------------------|-----------------------|
| ` `**`http_value`**` (` | in `val_expr ` any ,  |
|                         | in `tag ` varchar ,   |
|                         | in `stream ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The `http_value ` is used to write to an HTTP client (when in a VSP
context) or a specified string output stream. `http_value` uses
HTML-escapes for characters that should be escaped according to the HTML
spec.

</div>

<div>

## Parameters

<div>

### val_expr

A value expression. May be any string expression. If *`val_expr`* is an
XML entity, a serialization of the entity is written to the *`stream`* .
This is not the string value of the XML fragment, but a serialization of
the XML fragment as text including all the markup, i.e. elements,
attributes, namespaces, text nodes, etc. To get the string value of an
XML entity, convert it to a varchar using `cast` . Casting as varchar
will only produce a concatenation of the text nodes in the XML fragment,
leaving out elements, attributes, name spaces, etc.

</div>

<div>

### tag

Optional. If present and is a string, the output will be enclosed in
tags named as the string content of *`tag`* . If the expression
evaluates to 0 or null, it will be ignored.

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

## Return Values

None

</div>

<div>

## Errors

<div>

**Table 24.44. Errors signalled by `http_value `**

<div>

| SQLSTATE                              | Error Code                            | Error Text                                                                                              | Description                                                                                                  |
|---------------------------------------|---------------------------------------|---------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">37000 </span> | <span class="errorcode">HT006 </span> | <span class="errortext">http output function outside of http context and no stream specified: %s</span> | occurs if called outside VSP and no string session is given                                                  |
| <span class="errorcode">22023 </span> | <span class="errorcode">SR066 </span> | <span class="errortext">Unsupported case in CONVERT (\<data_type_of 1st arg\> -\> VARCHAR): %s</span>   | if the value passed as the 1st argument can't be converted to a VARCHAR value and it's not a XML/XQUERY tree |

</div>

</div>

  

</div>

<div>

## Using http_value()

<div>

**Example 24.180. HTTP output**

<div>

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

<div>

## See Also

<a href="fn_http.html" class="link" title="http"><code
class="function">http </code></a> ,
<a href="fn_http_url.html" class="link" title="http_url"><code
class="function">http_url</code></a> ,
<a href="fn_string_output.html" class="link" title="string_output"><code
class="function">string_output</code></a> ,
<a href="fn_http_rewrite.html" class="link" title="http_rewrite"><code
class="function">http_rewrite</code></a> .

</div>

</div>
