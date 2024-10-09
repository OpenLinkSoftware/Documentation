<div>

<div>

</div>

<div>

## Name

encrypt — Encrypt content in base64 encoding

</div>

<div>

## Synopsis

<div>

|                             |                             |
|-----------------------------|-----------------------------|
| `varchar `**`encrypt`**` (` | in `string_session ` any ,  |
|                             | in `key_name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns encrypted content in base64 encoding. The algorithm to encrypt
depends of the key, so if the key is AES the AES will be used, if it is
3DES it is 3DES etc. The AES key can be created with
xenc_key_AES_rand_create (key_name, 256). Alternatively 3DES key can be
generated with xenc_key_3DES_rand_create ().

</div>

<div>

## Parameters

<div>

### string_session

A content to be encrypted.

</div>

<div>

### key_name

The key name keeping secret.

</div>

</div>

<div>

## Return Types

On success the function will return encrypted content in base64
encoding.

</div>

<div>

## Examples

<div>

**Example 24.459. Simple Use**

<div>

``` screen
-- The 'ses' is a function which print the string into a string session:
xenc_key_AES_rand_create ('kaes', 256).
decrypt (encrypt (ses ('data to encrypt'), 'kaes'), 'kaes');
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_decrypt.html" class="link" title="decrypt"><code
class="function">decrypt() </code></a>

<a href="fn_xenc_encrypt.html" class="link" title="xenc_encrypt"><code
class="function">xenc_encrypt() </code></a>

<a href="fn_dsig_template_ext.html" class="link"
title="dsig_template_ext"><code
class="function">dsig_template_ext() </code></a>

<a href="fn_xenc_key_inst_create.html" class="link"
title="xenc_key_inst_create"><code
class="function">xenc_key_inst_create() </code></a>

</div>

</div>
