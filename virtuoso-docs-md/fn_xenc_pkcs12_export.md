<div>

<div>

</div>

<div>

## Name

xenc_pkcs12_export — Generates a secure Public-Key Cryptography
Standards (PKCS#12) file from a PEM (base64 encoded DER) file comprised
of an X.509 certificate and an associated Private Key.

</div>

<div>

## Synopsis

<div>

|                                 |                                     |
|---------------------------------|-------------------------------------|
| ` `**`xenc_pkcs12_export`**` (` | in `key_name ` varchar ,            |
|                                 | in `name ` varchar ,                |
|                                 | in `pass ` varchar ,                |
|                                 | in `export_chain ` integer := 0 ,   |
|                                 | in `additional_certs ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Generates a secure Public-Key Cryptography Standards (PKCS#12) file from
a PEM (base64 encoded DER) file comprised of an X.509 certificate and an
associated Private Key.

</div>

<div>

## Parameters

<div>

### key_name

Name that identifies private key associated with X.509 certificate.

</div>

<div>

### name

Name to used to identify each pkcs#12 object bundle.

</div>

<div>

### pass

A password or pass phrase used to encrypt the pkcs#12 file

</div>

<div>

### export_chain

1/0 - to export the certificate chain if there is a such

</div>

<div>

### additional_certs

Certificates in PEM format to be added to the bundle even if they are
not in the certificate chain stored in the memory object of the
certificate

</div>

</div>

<div>

## Examples

<div>

**Example 24.480. Persisting a key & certificate**

<div>

The example below persists a key named 'id_rsa' and certificate created
for it into user's key space. Thus after server restart the key will be
available again.

``` programlisting
USER_KEY_STORE (user, 'id_rsa', 'X.509', 2, '', xenc_pkcs12_export ('id_rsa', 'CA Certificate', ''));
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_user_key_store.html" class="link"
title="USER_KEY_STORE"><code
class="function">user_key_store() </code></a>

<a href="fn_xenc_x509_generate.html" class="link"
title="xenc_x509_generate"><code
class="function">xenc_x509_generate() </code></a>

<a href="fn_xenc_x509_ss_generate.html" class="link"
title="xenc_x509_ss_generate"><code
class="function">xenc_x509_ss_generate() </code></a>

</div>

</div>
