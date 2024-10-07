<div id="fn_xenc_key_aes_rand_create" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xenc_key_AES_rand_create — Used to make a temporary session key.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xenc_key_aes_rand_create" class="funcsynopsis">

|                                       |                      |
|---------------------------------------|----------------------|
| ` `**`xenc_key_AES_rand_create`**` (` | in `name ` varchar , |
|                                       | in `bits ` int `)`;  |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xenc_key_aes_rand_create" class="refsect1">

## Description

Used to make a temporary session key for AES encryption.

</div>

<div id="params_xenc_key_aes_rand_create" class="refsect1">

## Parameters

<div id="id120421" class="refsect2">

### name

The name of the key.

</div>

<div id="id120424" class="refsect2">

### bits

Number of bits in generated key. The values supported are 128, 192 and
256 bits.

</div>

</div>

<div id="ret_xenc_key_aes_rand_create" class="refsect1">

## Return Types

None.

</div>

<div id="examples_xenc_key_aes_rand_create" class="refsect1">

## Example

<div id="ex_xenc_key_aes_rand_create" class="example">

**Example 24.470. Simple Use**

<div class="example-contents">

``` screen
xenc_key_AES_rand_create ('ses_key', 192);
```

</div>

</div>

  

</div>

<div id="seealso_xenc_key_aes_rand_create" class="refsect1">

## See Also

<a href="fn_xenc_key_3des_create.html" class="link"
title="xenc_key_3DES_create"><code
class="function">xenc_key_3DES_create() </code></a>

<a href="fn_xenc_key_3des_rand_create.html" class="link"
title="xenc_key_3DES_rand_create"><code
class="function">xenc_key_3des_rand_create() </code></a>

<a href="fn_xenc_key_aes_create.html" class="link"
title="xenc_key_AES_create"><code
class="function">xenc_key_aes_create() </code></a>

<a href="fn_xenc_key_3des_read.html" class="link"
title="xenc_key_3DES_read"><code
class="function">xenc_key_3DES_read() </code></a>

<a href="fn_xenc_key_dsa_read.html" class="link"
title="xenc_key_DSA_read"><code
class="function">xenc_key_DSA_read() </code></a>

<a href="fn_xenc_key_dsa_create.html" class="link"
title="xenc_key_DSA_create"><code
class="function">xenc_key_DSA_create() </code></a>

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
