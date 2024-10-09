<div>

<div>

</div>

<div>

## Name

xenc_x509_ss_generate — Creates a self-signed X.509v3 certificate

</div>

<div>

## Synopsis

<div>

|                                    |                              |
|------------------------------------|------------------------------|
| ` `**`xenc_x509_ss_generate`**` (` | in `key_name ` varchar ,     |
|                                    | in `serial ` integer ,       |
|                                    | in `validity ` integer ,     |
|                                    | in `subject ` vector ,       |
|                                    | in `extensions ` vector `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to create a self-signed X.509 certificate by given
private key

</div>

<div>

## Parameters

<div>

### key_name

The name of the key used to create and sign the certificate

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

</div>

<div>

## Examples

<div>

**Example 24.478. Self-signed certificate generation**

<div>

The example below shows how could be created RSA private key, then
self-signed certificate and finally to be stored in the user's key
store.

``` screen
       ...
       xenc_key_RSA_create ('id_rsa', atoi (get_keyword ('num', params, '1024')));
       xenc_x509_ss_generate ('id_rsa', sequence_next ('ca_id_rsa'), 365,
        vector ('C', get_keyword ('c', params),
            'O',  get_keyword ('o', params),
            'CN',  get_keyword ('name', params),
            'emailAddress',  get_keyword ('email', params)),
        vector ('authorityKeyIdentifier', 'keyid,issuer:always'));
       USER_KEY_STORE (user, 'id_rsa', 'X.509', 2, '', xenc_pkcs12_export ('id_rsa', 'CA Certificate', ''));
       ...
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

<a href="fn_xenc_key_rsa_create.html" class="link"
title="xenc_key_RSA_create"><code
class="function">xenc_key_RSA_create() </code></a>

<a href="fn_xenc_pkcs12_export.html" class="link"
title="xenc_pkcs12_export"><code
class="function">xenc_pkcs12_export() </code></a>

</div>

</div>
