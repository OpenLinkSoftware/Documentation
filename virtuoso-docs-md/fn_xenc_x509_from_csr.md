<div>

<div>

</div>

<div>

## Name

xenc_x509_from_csr — Generate x509 certificate from CSR.

</div>

<div>

## Synopsis

<div>

|                                        |                                   |
|----------------------------------------|-----------------------------------|
| `varchar `**`xenc_x509_from_csr`**` (` | in `ca_key_name ` varchar ,       |
|                                        | in `cli_key_name ` varchar ,      |
|                                        | in `csr_str ` varchar ,           |
|                                        | in `serial_no ` varchar ,         |
|                                        | in `days_validity ` varchar ,     |
|                                        | in `hours_validity ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function generates Certificate Signing Request (CSR). The function
return 1 upon success, sql error on failure. The new certificate can be
exported in PEM format with
<a href="fn_xenc_pem_export.html" class="link"
title="xenc_pem_export"><code
class="function">xenc_pem_export(cli_key_name) </code></a> .

</div>

<div>

## Parameters

<div>

### ca_key_name

The name of CA private key which will be used to sign certificate.

</div>

<div>

### cli_key_name

The name of a key which will be created and will contains the client
certificate.

</div>

<div>

### csr_str

pem encoded CSR.

</div>

<div>

### serial_no

Serial number.

</div>

<div>

### days_validity

How many days will be valid the certificate.

</div>

<div>

### hours_validity

How many hours will be valid the certificate.

</div>

</div>

<div>

## Return Types

the function returns 1 upon success, sql error on failure.

</div>

<div>

## Errors

<div>

**Table 24.119. Errors signalled by `xenc_x509_from_csr `**

<div>

| SQLState                              | Error Code                            | Error Text                                                                                 | Description |
|---------------------------------------|---------------------------------------|--------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">XECXX </span> | <span class="errortext">The key \[name of the key\] already exists </span>                 |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">XECXX </span> | <span class="errortext">Missing or invalid signer certificate </span>                      |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">XECXX </span> | <span class="errortext">Invalid certificate request </span>                                |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">XECXX </span> | <span class="errortext">Invalid certificate request public key </span>                     |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">XECXX </span> | <span class="errortext">Signature did not match the certificate request </span>            |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">XECXX </span> | <span class="errortext">Invalid certificate request subject name </span>                   |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">XECXX </span> | <span class="errortext">Can not create x.509 structure </span>                             |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">XECXX </span> | <span class="errortext">Can not sign certificate </span>                                   |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">XECXX </span> | <span class="errortext">The type of public key is not supported mus tbe RSA or DSA </span> |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">XECXX </span> | <span class="errortext">Can not create a key </span>                                       |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">XECXX </span> | <span class="errortext">Can not sign certificate : \[the sign error text\] </span>         |             |

</div>

</div>

  

</div>

<div>

## Example

<div>

**Example 24.486. Generating a Certificate Signing Request (CSR)**

<div>

The following example demonstrates how to generate Certificate Signing
Request (CSR).

<div>

- <a href="vfoafsslcacondt.html" class="link"
  title="17.3.8. CA Keys Import using Conductor">Using Conductor, for user
  dba import a certificate with primary key and with name id_rsa.</a>

- Execute:

</div>

``` programlisting
SQL>create procedure csr_demo()
{
declare kname, cvalue varchar;
declare _key any;
declare _output int;

       xenc_key_RSA_create ('RSAKey1', 1024);

    _key := xenc_x509_csr_generate ('RSAKey1',
        vector (
            'CN', 'Demo user',
            'C',  'US',
            'O',  'OpenLink',
            'OU', 'Accounts',
            'emailAddress', 'demo@openlinksw.com'),
        vector ('subjectAltName', 'URI: http://www.openlinksw.com/dataspace/person/demo#this', 'nsComment', 'Virtuoso Generated Certificate',
            'authorityKeyIdentifier', 'keyid,issuer:always'));

   xenc_x509_from_csr ('id_rsa', 'MyKey1', _key , sequence_next ('ca_id_rsa'), 365, 100);
   return xenc_pem_export ('MyKey1');

}
;

Done. -- 0 msec.

SQL> select csr_demo();
temp2
VARCHAR
_______________________________________________________________________________

-----BEGIN CERTIFICATE-----
MIIDSjCCAjKgAwIBAgIBEzANBgkqhkiG9w0BAQQFADBVMQswCQYDVQQIEwJvbDEL
MAkGA1UEChMCb2wxCzAJBgNVBAsTAm9sMQ0wCwYDVQQDEwRqb2huMR0wGwYJKoZI
hvcNAQkBFg5qb2huQGdtYWlsLmNvbTAeFw0xMTA2MDcxNTAxNDhaFw0xMjA2MTAx
OTAxNDhaMGsxEjAQBgNVBAMTCURlbW8gdXNlcjELMAkGA1UEBhMCVVMxETAPBgNV
BAoTCE9wZW5MaW5rMREwDwYDVQQLEwhBY2NvdW50czEiMCAGCSqGSIb3DQEJARYT
ZGVtb0BvcGVubGlua3N3LmNvbTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEA
3Ma/MlMrGruwpDsW2D3iYA6sqFqldPsgx837dNJel8ZQu5/0Nyr5DCtAQNq6nWZo
0bezK9UIfAXEQXWt4S7IMPfTF6oCT85YDsQEEE/o1spsZ9Q7kXhKu3R3LNNiTxYr
TR4FSl361pUqyYngSMTxVWJxKnPW30p94i5QuQjLF1sCAwEAAaOBkjCBjzAdBgNV
HQ4EFgQUF5wTSXH98IqiaaxfVTNcui8p8SowPwYDVR0RBDgwNoY0aHR0cDovL3d3
dy5vcGVubGlua3N3LmNvbS9kYXRhc3BhY2UvcGVyc29uL2RlbW8jdGhpczAtBglg
hkgBhvhCAQ0EIBYeVmlydHVvc28gR2VuZXJhdGVkIENlcnRpZmljYXRlMA0GCSqG
SIb3DQEBBAUAA4IBAQCwSN3y6yeCNe+/izo5GwM+16cjmZkyMUYmAO62I6T62jmI
p0nYaVhJ9WV0ntVnx1H8/LKwrgyLlhXacVw4jyXwFMSo+YuONj+kKpobNH2cl+u1
+c0kJGbY/eS99S2D3JhL6n+QukvQIqhYniZ21wT1ugwpN2A7NtY+g925+vQBO0UH
0wQm3eQk8NADEjcqrmGmJcrK22jfaBNov+O2wvcZQM7WIKm98f/7So7kBN0BoRX8
7LRf3zIhp4f9fk1QDwlm9NgwgxARqNOfRuJU2YU1ICz88LbwM4XDeb+Mdr0YMNdU
6eYkCB4vKsVH+s1E8m67QZ8TGxpNZLYXLZZBdt86
-----END CERTIFICATE-----

1 Rows. -- 172 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_get_certificate_info.html" class="link"
title="get_certificate_info">get_certificate_info()</a>

<a href="fn_xenc_x509_csr_generate.html" class="link"
title="xenc_x509_csr_generate">xenc_x509_csr_generate()</a>

<a href="fn_xenc_x509_generate.html" class="link"
title="xenc_x509_generate">xenc_x509_generate()</a>

</div>

</div>
