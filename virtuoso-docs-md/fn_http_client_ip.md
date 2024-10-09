<div>

<div>

</div>

<div>

## Name

http_client_ip — Returns the IP address of the calling client.

</div>

<div>

## Synopsis

<div>

|                                    |                         |
|------------------------------------|-------------------------|
| `varchar `**`http_client_ip`**` (` | in `what ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to determine the IP address or DNS name of the
calling client.

Please note that this function is slow when resolving a DNS names. It is
advisable to use IP addresses to to make applications faster.

</div>

<div>

## Parameters

<div>

### what

a flag designating what to return:

|                                                                                                                |
|----------------------------------------------------------------------------------------------------------------|
| 0 - (default) : IP number of a client                                                                          |
| 1 - DNS name if it can be resolved; if no reverse DNS record can be found then the IP number will be returned. |

</div>

</div>

<div>

## Return Types

By default, a string of the dotted IP address of the client user agent.
If what=1 then the DNS name will be returned.

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
<a href="fn_http_acl_get.html" class="link" title="http_acl_get"><code
class="function">http_acl_get</code></a> ,
<a href="fn_http_rewrite.html" class="link" title="http_rewrite"><code
class="function">http_rewrite</code></a> .

</div>

<div>

## Examples

<div>

**Example 24.155. Obtaining the Client IP Address**

<div>

``` programlisting
  <?vsp
    declare ip varchar;
    ip := http_client_ip ();
    http (sprintf ('<p>Your IP address is: %s</p>', ip));
  ?>
  
```

</div>

</div>

  

</div>

</div>
