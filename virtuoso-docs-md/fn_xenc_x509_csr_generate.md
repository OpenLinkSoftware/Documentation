<div id="fn_xenc_x509_csr_generate" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xenc_x509_csr_generate — Generate Certificate Signing Request (CSR)

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xenc_x509_csr_generate" class="funcsynopsis">

|                                            |                             |
|--------------------------------------------|-----------------------------|
| `varchar `**`xenc_x509_csr_generate`**` (` | in `cli_pk_name ` varchar , |
|                                            | in `subject ` array ,       |
|                                            | in `extensions ` array `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xenc_x509_csr_generate" class="refsect1">

## Description

This function generates Certificate Signing Request (CSR)

</div>

<div id="params_xenc_x509_csr_generate" class="refsect1">

## Parameters

<div id="id121182" class="refsect2">

### cli_pk_name

The user's private key name.

</div>

<div id="id121185" class="refsect2">

### subject

An array of name/value pairs representing the subject aka name enties,
for ex:

``` programlisting
('CN', 'Demo User', 'C', 'US')
```

</div>

<div id="id121189" class="refsect2">

### extensions

An array of name/value pairs to add as X.509v3 extensions to
certificate.

</div>

</div>

<div id="ret_xenc_x509_csr_generate" class="refsect1">

## Return Types

String

</div>

<div id="errors_xenc_x509_csr_generate" class="refsect1">

## Errors

<div id="id121197" class="table">

**Table 24.119. Errors signalled by `xenc_x509_csr_generate `**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                         | Description |
|---------------------------------------|---------------------------------------|------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">XECXX </span> | <span class="errortext">Missing key </span>                                        |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">XECXX </span> | <span class="errortext">Key is not DSA nor RSA </span>                             |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">XECXX </span> | <span class="errortext">Missing private key </span>                                |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">XECXX </span> | <span class="errortext">Subject array must be name/value pairs </span>             |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">XECXX </span> | <span class="errortext">Extension array must be name/value pairs </span>           |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">XECXX </span> | <span class="errortext">Can not create pkey </span>                                |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">XECXX </span> | <span class="errortext">Can not assign primary key </span>                         |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">XECXX </span> | <span class="errortext">Can not create pkey </span>                                |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">XECXX </span> | <span class="errortext">Can not create x.509 structure </span>                     |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">XECXX </span> | <span class="errortext">Can not sign certificate : \[the sign error text\] </span> |             |

</div>

</div>

  

</div>

<div id="examples_xenc_x509_csr_generate" class="refsect1">

## Examples

<div id="ex_xenc_x509_csr_generate" class="example">

**Example 24.485. Create a new xenc_x509 CSR**

<div class="example-contents">

``` programlisting
SQL> create procedure csr_gen_demo()
{
declare kname, cvalue varchar;
       xenc_key_RSA_create ('myRSAkey', 1024);
       xenc_x509_csr_generate ('myRSAkey',
        vector (
            'CN', 'Demo user',
            'C',  'US',
            'O',  'OpenLink',
            'OU', 'Accounts',
            'emailAddress', 'demo@openlinksw.com'),
        vector ('subjectAltName', 'URI: http://www.openlinksw.com/dataspace/person/demo#this', 'nsComment', 'Virtuoso Generated Certificate',
            'authorityKeyIdentifier', 'keyid,issuer:always'));
};

Done. -- 0 msec.
SQL> select csr_gen_demo();
temp
VARCHAR
_______________________________________________________________________________

-----BEGIN CERTIFICATE REQUEST-----
MIICLDCCAZUCADBrMRIwEAYDVQQDEwlEZW1vIHVzZXIxCzAJBgNVBAYTAlVTMREw
DwYDVQQKEwhPcGVuTGluazERMA8GA1UECxMIQWNjb3VudHMxIjAgBgkqhkiG9w0B
CQEWE2RlbW9Ab3Blbmxpbmtzdy5jb20wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJ
AoGBAM+e21xeQIJX5ySd6Juc3GtCnyT+JvDKgoxkmovFdqkCm1Ks7Pys0x59ksSZ
DZoEATEt/sQsEB7AnRAkH76lWyG0zMtvxdkFH8Cepaaq4bcdqSgmE12DRwViR95a
ZNA8vhonr5UdTbtKkIGD67IrkGH81C8trwF+8LnYKdtf1bMdAgMBAAGggYEwfwYJ
KoZIhvcNAQkOMXIwcDA/BgNVHREEODA2hjRodHRwOi8vd3d3Lm9wZW5saW5rc3cu
Y29tL2RhdGFzcGFjZS9wZXJzb24vZGVtbyN0aGlzMC0GCWCGSAGG+EIBDQQgFh5W
aXJ0dW9zbyBHZW5lcmF0ZWQgQ2VydGlmaWNhdGUwDQYJKoZIhvcNAQEEBQADgYEA
CQ+UeQGWLnHn5X9tKumvgP2p4LgxHsNq0uFZffVBRUAV6w8WRwor5ZKOeNhHrldp
ZvxHc9ESFBTA772W01VmQNfpjkFcpH5yd81dFkSsF3lKemQIHnlz4bORU4av2TMM
T9OIp5FNOec13jXqVesymd+Kl+Vb9sRBaC1Xb1OSryU=
-----END CERTIFICATE REQUEST-----

1 Rows. -- 390 msec.
```

</div>

</div>

  

</div>

<div id="seealso_xenc_x509_csr_generate" class="refsect1">

## See Also

<a href="fn_get_certificate_info.html" class="link"
title="get_certificate_info">get_certificate_info()</a>

<a href="fn_xenc_x509_from_csr.html" class="link"
title="xenc_x509_from_csr">xenc_x509_from_csr()</a>

<a href="fn_xenc_x509_generate.html" class="link"
title="xenc_x509_generate">xenc_x509_generate()</a>

</div>

</div>
