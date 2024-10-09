<div>

<div>

</div>

<div>

## Name

http_client_ext — returns a varchar containing the body of the request
uri

</div>

<div>

## Synopsis

<div>

|                                     |                                |
|-------------------------------------|--------------------------------|
| `varchar `**`http_client_ext`**` (` | in `url ` varchar ,            |
|                                     | in `uid ` varchar ,            |
|                                     | in `pwd ` varchar ,            |
|                                     | in `http_method ` varchar ,    |
|                                     | in `http_headers ` varchar ,   |
|                                     | in `body ` varchar ,           |
|                                     | in `cert_file ` varchar ,      |
|                                     | in `cert_pwd ` varchar ,       |
|                                     | inout `headers ` any ,         |
|                                     | in `timeout ` varchar ,        |
|                                     | in `proxy ` varchar ,          |
|                                     | in `ca_certs ` varchar ,       |
|                                     | in `insecure ` integer ,       |
|                                     | in `n_redirects ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to perform HTTP operations to retrieve generic
content and/or to perform generic operations over HTTP/HTTPS protocols.
It also supports HTTP authentication based on username/password
credentials.

If the URL is https: an no x509 certificate given then it will operate
as https client w/o client certificate.

</div>

<div>

## Parameters

<div>

### url

target URL (http: or https: are supported)

</div>

<div>

### uid

user name

</div>

<div>

### pwd

user password

</div>

<div>

### http_method

'GET', 'POST', 'HEAD' or 'PUT'

</div>

<div>

### http_headers

a string containing a HTTP headers supplied by application

</div>

<div>

### body

content to be sent

</div>

<div>

### cert_file

cpath to the certificate file where is stored x509 certificate, private
key and CA certificates

Can accept 'db:' notation, i.e. can use also keys stored in Virtuoso PKI
repository.

</div>

<div>

### cert_pwd

password for opening the certificate file.

</div>

<div>

### headers

return headers from the http reply.

</div>

<div>

### timeout

use to set how many seconds to wait for reply from the client

</div>

<div>

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

<div>

### ca_certs

Certificate CA. Default is null.

</div>

<div>

### insecure

Sets secure or not. Default is 0.

</div>

<div>

### n_redirects

By default int zero. If is given value greater than zero, so many
redirects will be followed by client. Thus in pl no need to look at 30x
response, just can add this number to follow the redirects.

</div>

</div>

</div>
