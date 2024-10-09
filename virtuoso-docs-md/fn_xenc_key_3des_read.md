<div>

<div>

</div>

<div>

## Name

xenc_key_3DES_read — Importing a triple-des key into user's repository

</div>

<div>

## Synopsis

<div>

|                                 |                             |
|---------------------------------|-----------------------------|
| ` `**`xenc_key_3DES_read`**` (` | in `name ` varchar ,        |
|                                 | in `key_data ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to import a triple-des serialized key into user's
repository and register it with a name supplied.

Note that key will not be persisted. It is loaded in the memory only.

</div>

<div>

## Parameters

<div>

### name

Name of the key to register

</div>

<div>

### key_data

The base64 encoded binary data with key material

</div>

</div>

<div>

## Return Types

No return value.

</div>

<div>

## Examples

<div>

**Example 24.464. Loading a shared secret**

<div>

``` screen
      xenc_key_3DES_read ('Sample Symmetric Key', 'EE/uaFF5N3ZNJWUTR8DYe+OEbwaKQnso');
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xenc_key_3des_create.html" class="link"
title="xenc_key_3DES_create"><code
class="function">xenc_key_3DES_create </code></a>

<a href="fn_xenc_key_3des_rand_create.html" class="link"
title="xenc_key_3DES_rand_create"><code
class="function">xenc_key_3des_rand_create </code></a>

<a href="fn_xenc_key_aes_create.html" class="link"
title="xenc_key_AES_create"><code
class="function">xenc_key_aes_create </code></a>

<a href="fn_xenc_key_aes_rand_create.html" class="link"
title="xenc_key_AES_rand_create"><code
class="function">xenc_key_aes_rand_create </code></a>

<a href="fn_xenc_key_dsa_read.html" class="link"
title="xenc_key_DSA_read"><code
class="function">xenc_key_DSA_read </code></a>

<a href="fn_xenc_key_dsa_create.html" class="link"
title="xenc_key_DSA_create"><code
class="function">xenc_key_dsa_create </code></a>

<a href="fn_xenc_key_rsa_read.html" class="link"
title="xenc_key_RSA_read"><code
class="function">xenc_key_RSA_read </code></a>

<a href="fn_xenc_key_create_cert.html" class="link"
title="xenc_key_create_cert"><code
class="function">xenc_key_create_cert </code></a>

<a href="fn_xenc_key_serialize.html" class="link"
title="xenc_key_serialize"><code
class="function">xenc_key_serialize </code></a>

<a href="fn_xenc_key_remove.html" class="link"
title="xenc_key_remove"><code
class="function">xenc_key_remove </code></a>

</div>

</div>
