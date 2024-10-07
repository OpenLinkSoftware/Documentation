<div id="fn_http_client" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_client — returns a varchar containing the body of the request uri

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_client" class="funcsynopsis">

|                                 |                                |
|---------------------------------|--------------------------------|
| `varchar `**`http_client`**` (` | in `url ` varchar ,            |
|                                 | in `uid ` varchar ,            |
|                                 | in `pwd ` varchar ,            |
|                                 | in `http_method ` varchar ,    |
|                                 | in `http_headers ` varchar ,   |
|                                 | in `body ` varchar ,           |
|                                 | in `cert_file ` varchar ,      |
|                                 | in `cert_pwd ` varchar ,       |
|                                 | in `timeout ` varchar ,        |
|                                 | in `proxy ` varchar ,          |
|                                 | in `ca_certs ` varchar ,       |
|                                 | in `insecure ` integer ,       |
|                                 | in `n_redirects ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_client" class="refsect1">

## Description

This function is used to perform HTTP operations to retrieve generic
content and/or to perform generic operations over HTTP/HTTPS protocols.
It also supports HTTP authentication based on username/password
credentials.

If the URL is https: an no x509 certificate given then it will operate
as https client w/o client certificate.

</div>

<div id="params_http_client" class="refsect1">

## Parameters

<div id="id92162" class="refsect2">

### url

target URL (http: or https: are supported)

</div>

<div id="id92165" class="refsect2">

### uid

user name

</div>

<div id="id92168" class="refsect2">

### pwd

user password

</div>

<div id="id92171" class="refsect2">

### http_method

'GET', 'POST', 'HEAD' or 'PUT'

</div>

<div id="id92174" class="refsect2">

### http_headers

a string containing a HTTP headers supplied by application

</div>

<div id="id92177" class="refsect2">

### body

content to be sent

</div>

<div id="id92180" class="refsect2">

### cert_file

cpath to the certificate file where is stored x509 certificate, private
key and CA certificates

Can accept 'db:' notation, i.e. can use also keys stored in Virtuoso PKI
repository.

</div>

<div id="id92184" class="refsect2">

### cert_pwd

password for opening the certificate file.

</div>

<div id="id92187" class="refsect2">

### timeout

use to set how many seconds to wait for reply from the client

</div>

<div id="id92190" class="refsect2">

### proxy

supports:

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

<div id="id92200" class="refsect2">

### ca_certs

Certificate CA. Default is null.

</div>

<div id="id92203" class="refsect2">

### insecure

Sets secure or not. Default is 0.

</div>

<div id="id92206" class="refsect2">

### n_redirects

By default int zero. If is given value greater than zero, so many
redirects will be followed by client. Thus in pl no need to look at 30x
response, just can add this number to follow the redirects.

</div>

</div>

</div>
