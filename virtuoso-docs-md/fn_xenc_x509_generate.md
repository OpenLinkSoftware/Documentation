<div>

<div>

</div>

<div>

## Name

xenc_x509_generate — Generates a X.509v3 certificate using client's
public key

</div>

<div>

## Synopsis

<div>

|                                 |                                 |
|---------------------------------|---------------------------------|
| ` `**`xenc_x509_generate`**` (` | in `ca_key_name ` varchar ,     |
|                                 | in `public_key_name ` varchar , |
|                                 | in `serial ` integer ,          |
|                                 | in `validity ` integer ,        |
|                                 | in `subject ` vector ,          |
|                                 | in `extensions ` vector ,       |
|                                 | in `hours ` integer `)`;        |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function creates a X.509v3 certificate from a public key and sign
the certificate with CA private key

</div>

<div>

## Parameters

<div>

### ca_key_name

The name of CA key, the key must have corresponding certificate.

</div>

<div>

### public_key_name

The name of the public key used to create certificate, it is given by
certificate owner to CA. Note that public key must be imported already
in CA'a key space.

</div>

<div>

### serial

The serial number

</div>

<div>

### validity

Certificate's validity in days

</div>

<div>

### subject

An array of name/value pairs representing the subject aka name enties

</div>

<div>

### extensions

An array of name/value pairs to add as X.509v3 extensions to certificate

</div>

<div>

### hours

If specified it is added to the days which allows a more fine-grained
control over the expiration date.

</div>

</div>

<div>

## Examples

<div>

**Example 24.479. Issuing a certificate**

<div>

The example below decodes a public key sent from client and then issue a
certificate and sign it with CA's key 'id_rsa'. The client's key is
create as temp key.

``` screen
declare kname, cvalue varchar;
kname := xenc_SPKI_read (null, replace (get_keyword ('key', params), '\r\n', ''));
xenc_x509_generate ('id_rsa', kname, sequence_next ('ca_id_rsa'), 365,
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
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xenc_spki_read.html" class="link"
title="xenc_SPKI_read"><code
class="function">xenc_SPKI_read() </code></a>

<a href="fn_xenc_x509_ss_generate.html" class="link"
title="xenc_x509_ss_generate"><code
class="function">xenc_x509_ss_generate() </code></a>

</div>

</div>
