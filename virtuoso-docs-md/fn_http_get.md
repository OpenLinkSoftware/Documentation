<div>

<div>

</div>

<div>

## Name

http_get — returns a varchar containing the body of the request uri

</div>

<div>

## Synopsis

<div>

|                              |                                |
|------------------------------|--------------------------------|
| `varchar `**`http_get`**` (` | in `target_uri ` varchar ,     |
|                              | out `return_header ` any ,     |
|                              | in `http_method ` varchar ,    |
|                              | in `request_header ` varchar , |
|                              | in `request_body ` varchar ,   |
|                              | in `proxy ` varchar `)`;       |

<div>

 

</div>

</div>

</div>

<div>

## Description

http_get returns a varchar containing the body of the requested
target_uri or NULL if the body is not received.

</div>

<div>

## Parameters

<div>

### target_uri

HTTP target in form http://\<target_host\>:\<target_port\>/\<path\> (if
\<target_port\> is not given then 80 will be used by default)

</div>

<div>

### return_header

This output parameter is set to the array of HTTP response header lines
from the target server, if the parameter is a constant it will be
ignored.

</div>

<div>

### http_method

This parameter will be used to specify the HTTP request method. Possible
values are: GET, POST, PUT, OPTIONS or see RFC2616\[5.1.1\] for details.

</div>

<div>

### request_header

This string will be sent to the target server together with other header
fields. If more than one header field should be sent then header fields
must be separated with CR/LF pair. (Warning: this string must not be
terminated with CR/LF pair!).

</div>

<div>

### request_body

This string will be sent to the target server as the request body. The
"Content-Length" header field is set to the length of this string.

</div>

<div>

### proxy

If this parameter is supplied the request will be passed through this
HTTP proxy. The format is \<proxy_host\>:\<proxy_port\> .

Supports:

``` programlisting
http://[user:pass@]host:port - user & pass are optional
```

``` programlisting
socks4://[user:pass@]host:port - user & pass are optional
```

``` programlisting
socks5://[user:pass@]host:port - user & pass are optional
```

``` programlisting
socks5-host://[user:pass@]host:port - user & pass are optional
```

In the INI file, in section HTTPServer should be set:

``` programlisting
HTTPProxyServer       = proxytest:3128
HTTPProxyExceptions   = localhost:8890, 127.0.0.1:8890
```

Exception could be also 127.0.0.\* i.e. there could have also wildcard.

</div>

</div>

<div>

## Errors

<div>

**Table 24.39. Errors signalled by**

<div>

| SQLState                        | Error Code                            | Error Text                                                             | Description |
|---------------------------------|---------------------------------------|------------------------------------------------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode">HT001 </span> | <span class="errortext">Not valid host name or host IP address </span> |             |
| <span class="errorcode"></span> | <span class="errorcode">HT002 </span> | <span class="errortext">Target host is unreachable </span>             |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.163. Using http_get()**

<div>

``` programlisting
declare header any;
page := http_get ('http://www.openlinksw.com/');
...
page := http_get ('http://www.openlinksw.com/',
        header, 'GET', 'If-Modified-Since: Fri, 21 Jul 2000 11:19:45 GMT');
...
page := http_get ('http://example.com/some_link.html',
        header, 'POST', '', 'a=1&b=2');
...
page := http_get ('http://www.openlinksw.com/',
        NULL, 'GET', '', '', 'proxy.server.com:8080');
```

</div>

</div>

  

</div>

</div>
