<div>

<div>

</div>

<div>

## Name

xenc_pem_export — Export of a certificate and optionally private key in
PEM format

</div>

<div>

## Synopsis

<div>

|                              |                            |
|------------------------------|----------------------------|
| ` `**`xenc_pem_export`**` (` | in `key_name ` varchar ,   |
|                              | in `pk_flag ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function is used to export certificate in PEM format, optionally it
can export also private key (if present)

</div>

<div>

## Parameters

<div>

### key_name

The key name which keeps the certificate

</div>

<div>

### pk_flag

A flag : 1 or 0, by default 0. It denotes to export or to skip exporting
private key.

</div>

</div>

<div>

## Examples

<div>

**Example 24.481. Creating a certificate and exporting it in PEM
format**

<div>

The example below imports a client public key, then it creates a
certificate and sign it with CA's private key and finally it exports the
generated certificate in PEM format.

``` screen
kname := xenc_SPKI_read (null, replace (get_keyword ('key', params), '\r\n', ''));
xenc_x509_generate (
    'id_rsa',
    kname,
    sequence_next ('ca_id_rsa'),
    365,
        vector (
            'CN', get_keyword ('name', params, name),
            'C',  get_keyword ('c', params, name),
            'O',  get_keyword ('o', params, name),
            'OU', get_keyword ('ou', params, name),
            'emailAddress', get_keyword ('email', params)
            ),
        vector (
          'subjectAltName',
          'URI:'||webid,
          'nsComment',
          'Virtuoso Generated Certificate',
            'authorityKeyIdentifier',
            'keyid,issuer:always'));
cvalue := xenc_pem_export (kname);
```

</div>

</div>

  

<div>

**Example 24.482. Export Web Server certificate for Virtuoso HTTPS
endpoints**

<div>

This example exports Web Server certificate generated for Virtuoso HTTPS
Endpoint:

<div>

1.  <a
    href="http://ods.openlinksw.com/wiki/ODS/ODSSetupSSL#Configure%20an%20HTTPS%20Listener%20for%20handling%20HTTPS%20requests%20from%20HTTP%20user%20agents%20%28clients%29"
    class="ulink" target="_top">Configure an HTTPS Listener for handling
    HTTPS requests from HTTP user agents (clients).</a>

2.  Suppose the generate certificate from the previous step has name
    "https_key_localhost"

3.  To export the certificate, execute from iSQL:

    ``` programlisting
    SQL> SELECT xenc_pem_export ('https_key_localhost');
    ```

    <div>

    <div>

    **Figure 24.1. iSQL Export Web Server Sertificate Output**

    <div>

    <div>

    ![iSQL Export Web Server Sertificate
    Output](images/ui/export_srv_cert.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xenc_spki_read.html" class="link"
title="xenc_SPKI_read"><code class="function">xenc_SPKI_read </code></a>

<a href="fn_xenc_x509_generate.html" class="link"
title="xenc_x509_generate"><code
class="function">xenc_xenc_x509_generate </code></a>

</div>

</div>
