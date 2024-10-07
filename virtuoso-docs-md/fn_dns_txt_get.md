<div id="fn_dns_txt_get" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

dns_txt_get — Use for DNS text record retrieval.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_dns_txt_get" class="funcsynopsis">

|                                 |                                   |
|---------------------------------|-----------------------------------|
| `varchar `**`dns_txt_get`**` (` | in `dns_serevr_ip_or_null ` any , |
|                                 | in `dns_entry ` varchar `)`;      |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_dns_txt_get" class="refsect1">

## Description

This function can be used for DNS text record retrieval. It works on
UNIX, Windows, Mac OS X w/o additional libraries.

</div>

<div id="params_dns_txt_get" class="refsect1">

## Parameters

<div id="id92375" class="refsect2">

### dns_serevr_ip_or_null

DNS server IP or null. If null, then the system will try to find the
system defined DNS servers. First argument null together with
<a href="fn_xenc_key_rsa_read.html" class="link"
title="xenc_key_RSA_read"><code
class="function">xenc_key_RSA_read()</code></a> with 3d argument of 1
(int) can be used to write a PL procedure for DKIM signature check of
mails.

</div>

<div id="id92380" class="refsect2">

### dns_entry

DNS entry.

</div>

</div>

<div id="examples_dns_txt_get" class="refsect1">

## Examples

<div id="ex_dns_txt_get" class="example">

**Example 24.156. Obtaining DNS text record**

<div class="example-contents">

``` programlisting
SELECT dns_txt_get (null, 'x._domainkey.example.com');
dns_txt_get
VARCHAR
_______________________________________________________________________________

v=DKIM1; k=rsa; p=...
```

</div>

</div>

  

</div>

<div id="seealso_dns_txt_get" class="refsect1">

## See Also

<a href="fn_http.html" class="link" title="http"><code
class="function">http </code></a> ,
<a href="fn_http_client_ip.html" class="link"
title="http_client_ip"><code class="function">http_client_ip </code></a>
, <a href="fn_http_value.html" class="link" title="http_value"><code
class="function">http_value </code></a> ,
<a href="fn_http_url.html" class="link" title="http_url"><code
class="function">http_url </code></a> ,
<a href="fn_string_output.html" class="link" title="string_output"><code
class="function">string_output </code></a> ,
<a href="fn_http_acl_get.html" class="link" title="http_acl_get"><code
class="function">http_acl_get </code></a> ,
<a href="fn_http_rewrite.html" class="link" title="http_rewrite"><code
class="function">http_rewrite </code></a> .

</div>

</div>
