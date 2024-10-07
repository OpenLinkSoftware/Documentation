<div id="fn_xenc_x509_generate" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xenc_x509_generate — Generates a X.509v3 certificate using client's
public key

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xenc_x509_generate" class="funcsynopsis">

|                                 |                                 |
|---------------------------------|---------------------------------|
| ` `**`xenc_x509_generate`**` (` | in `ca_key_name ` varchar ,     |
|                                 | in `public_key_name ` varchar , |
|                                 | in `serial ` integer ,          |
|                                 | in `validity ` integer ,        |
|                                 | in `subject ` vector ,          |
|                                 | in `extensions ` vector ,       |
|                                 | in `hours ` integer `)`;        |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xenc_x509_generate" class="refsect1">

## Description

This function creates a X.509v3 certificate from a public key and sign
the certificate with CA private key

</div>

<div id="params_xenc_x509_generate" class="refsect1">

## Parameters

<div id="id120883" class="refsect2">

### ca_key_name

The name of CA key, the key must have corresponding certificate.

</div>

<div id="id120886" class="refsect2">

### public_key_name

The name of the public key used to create certificate, it is given by
certificate owner to CA. Note that public key must be imported already
in CA'a key space.

</div>

<div id="id120889" class="refsect2">

### serial

The serial number

</div>

<div id="id120892" class="refsect2">

### validity

Certificate's validity in days

</div>

<div id="id120895" class="refsect2">

### subject

An array of name/value pairs representing the subject aka name enties

</div>

<div id="id120898" class="refsect2">

### extensions

An array of name/value pairs to add as X.509v3 extensions to certificate

</div>

<div id="id120901" class="refsect2">

### hours

If specified it is added to the days which allows a more fine-grained
control over the expiration date.

</div>

</div>

<div id="examples_xenc_x509_generate" class="refsect1">

## Examples

<div id="ex_xenc_x509_generate" class="example">

**Example 24.479. Issuing a certificate**

<div class="example-contents">

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

<div id="seealso_xenc_x509_generate" class="refsect1">

## See Also

<a href="fn_xenc_spki_read.html" class="link"
title="xenc_SPKI_read"><code
class="function">xenc_SPKI_read() </code></a>

<a href="fn_xenc_x509_ss_generate.html" class="link"
title="xenc_x509_ss_generate"><code
class="function">xenc_x509_ss_generate() </code></a>

</div>

</div>
