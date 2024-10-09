<div>

<div>

</div>

<div>

## Name

http_rewrite — Clears output written to a string output or to an HTTP

</div>

<div>

## Synopsis

<div>

|                           |                       |
|---------------------------|-----------------------|
| ` `**`http_rewrite`**` (` | in `stream ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This clears any previous output to the stream. If the stream is omitted
or 0 the stream is the HTTP client stream of the calling procedure.

All output from VSP page procedures is buffered into a local string
stream before being sent out. This is done so as to support the HTTP/1.1
required content length and to allow recovery from errors.

</div>

<div>

## Parameters

<div>

### stream

Optional stream to clear. Null or zero (0) implies the default HTTP
client stream.

</div>

</div>

<div>

## Using http_rewrite()

<div>

**Example 24.178. A VSP page excerpt.**

<div>

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

<div>

## See Also

<a href="fn_http_value.html" class="link" title="http_value"><code
class="function">http_value </code></a> ,
<a href="fn_http_url.html" class="link" title="http_url"><code
class="function">http_url</code></a> ,
<a href="fn_string_output.html" class="link" title="string_output"><code
class="function">string_output</code></a> .

</div>

</div>
