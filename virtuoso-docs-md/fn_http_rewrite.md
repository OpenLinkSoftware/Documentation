<div id="fn_http_rewrite" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_rewrite — Clears output written to a string output or to an HTTP

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_rewrite" class="funcsynopsis">

|                           |                       |
|---------------------------|-----------------------|
| ` `**`http_rewrite`**` (` | in `stream ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_rewrite" class="refsect1">

## Description

This clears any previous output to the stream. If the stream is omitted
or 0 the stream is the HTTP client stream of the calling procedure.

All output from VSP page procedures is buffered into a local string
stream before being sent out. This is done so as to support the HTTP/1.1
required content length and to allow recovery from errors.

</div>

<div id="params_http_rewrite" class="refsect1">

## Parameters

<div id="id93460" class="refsect2">

### stream

Optional stream to clear. Null or zero (0) implies the default HTTP
client stream.

</div>

</div>

<div id="examples_http_rewrite" class="refsect1">

## Using http_rewrite()

<div id="ex_http_rewrite" class="example">

**Example 24.178. A VSP page excerpt.**

<div class="example-contents">

``` programlisting
<p>Nope. You won't see this.</p>

<?vsp
http ('<p>This line will contribute to your local entropy.</p>');
http_rewrite ();
http ('<p>Now THIS is what you wanted to see, isn't it?</p>');
?>
```

</div>

</div>

  

</div>

<div id="seealso_http_rewrite" class="refsect1">

## See Also

<a href="fn_http_value.html" class="link" title="http_value"><code
class="function">http_value </code></a> ,
<a href="fn_http_url.html" class="link" title="http_url"><code
class="function">http_url</code></a> ,
<a href="fn_string_output.html" class="link" title="string_output"><code
class="function">string_output</code></a> .

</div>

</div>
