<div>

<div>

</div>

<div>

## Name

xenc_key_3DES_create — Used to make a symmetric key.

</div>

<div>

## Synopsis

<div>

|                                   |                           |
|-----------------------------------|---------------------------|
| ` `**`xenc_key_3DES_create`**` (` | in `name ` varchar ,      |
|                                   | in `secret ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Used to make a symmetric session key for triple-des algorithm.

</div>

<div>

## Parameters

<div>

### name

The name of the key.

</div>

<div>

### secret

The shared secret for key generation.

</div>

</div>

<div>

## Return Types

None.

</div>

<div>

## Example

<div>

**Example 24.465. Simple Use**

<div>

``` screen
xenc_key_3DES_create ('ses_key', 'mysecret');
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xenc_key_3des_read.html" class="link"
title="xenc_key_3DES_read"><code
class="function">xenc_key_3DES_read() </code></a>

<a href="fn_xenc_key_3des_rand_create.html" class="link"
title="xenc_key_3DES_rand_create"><code
class="function">xenc_key_3des_rand_create() </code></a>

<a href="fn_xenc_key_aes_create.html" class="link"
title="xenc_key_AES_create"><code
class="function">xenc_key_aes_create() </code></a>

<a href="fn_xenc_key_aes_rand_create.html" class="link"
title="xenc_key_AES_rand_create"><code
class="function">xenc_key_aes_rand_create() </code></a>

<a href="fn_xenc_key_dsa_read.html" class="link"
title="xenc_key_DSA_read"><code
class="function">xenc_key_DSA_read() </code></a>

<a href="fn_xenc_key_dsa_create.html" class="link"
title="xenc_key_DSA_create"><code
class="function">xenc_key_dsa_create() </code></a>

<a href="fn_xenc_key_rsa_read.html" class="link"
title="xenc_key_RSA_read"><code
class="function">xenc_key_RSA_read() </code></a>

<a href="fn_xenc_key_create_cert.html" class="link"
title="xenc_key_create_cert"><code
class="function">xenc_key_create_cert() </code></a>

<a href="fn_xenc_key_serialize.html" class="link"
title="xenc_key_serialize"><code
class="function">xenc_key_serialize() </code></a>

<a href="fn_xenc_key_remove.html" class="link"
title="xenc_key_remove"><code
class="function">xenc_key_remove() </code></a>

</div>

</div>
