<div>

<div>

</div>

<div>

## Name

http_internal_redirect — Performs internal redirect.

</div>

<div>

## Synopsis

<div>

|                                        |                               |
|----------------------------------------|-------------------------------|
| `any `**`http_internal_redirect`**` (` | in `full_path ` varchar ,     |
|                                        | in `p_full_path ` varchar ,   |
|                                        | in `long_url ` varchar ,      |
|                                        | in `keep_lpath ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function performs internal redirect. Can be used in handling
situations where HTTP level redirection is inadequate. For example, 303
redirection offered when implementing hashless Linked Data URIs. Instead
of sending a 303 Virtuoso will redirect to the URL in "Location:" and
return 200 OK. Basically, this is like curl -iL instead of curl -i, but
implemented inside Virtuoso.

The function can be used directly or via URI template syntax used to
construct rewrite rules for Virtuoso virtual directories / web service
endpoints.

</div>

<div>

## Parameters

<div>

### full_path

Set new logical path to be redirected to.

</div>

<div>

### p_full_path

Set physical path to be redirected to.

</div>

<div>

### long_url

Reserved for internal usage.

</div>

<div>

### keep_lpath

Reserved for internal usage.

</div>

</div>

<div>

## Examples

<div>

**Example 24.162. Using http_internal_redirect()**

<div>

``` programlisting
create procedure my_redirect()
{
  declare full_path varchar;
      ...
      full_path := '/DAV/VAD/test/';
      http_internal_redirect (full_path);
      set_user_id ('demo');
      set http_charset='utf-8';
      http_header ('Content-Type: text/xml; charset=UTF-8\r\n');
      WS.WS.GET (path, pars, lines);
      return null;
    }
}   
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
<a href="fn_http_header.html" class="link" title="http_header"><code
class="function">http_header</code></a> .

</div>

</div>
