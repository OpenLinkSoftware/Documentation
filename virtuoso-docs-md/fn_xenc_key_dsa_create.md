<div id="fn_xenc_key_dsa_create" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xenc_key_DSA_create — Used to make asymmetric DSA key.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xenc_key_dsa_create" class="funcsynopsis">

|                                  |                         |
|----------------------------------|-------------------------|
| ` `**`xenc_key_DSA_create`**` (` | in `name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xenc_key_dsa_create" class="refsect1">

## Description

Used to make asymmetric DSA key for digital signatures. The generated
key will contain private and public keys.

</div>

<div id="params_xenc_key_dsa_create" class="refsect1">

## Parameters

<div id="id120570" class="refsect2">

### name

The name of the key.

</div>

</div>

<div id="ret_xenc_key_dsa_create" class="refsect1">

## Return Types

None.

</div>

<div id="examples_xenc_key_dsa_create" class="refsect1">

## Example

<div id="ex_xenc_key_dsa_create" class="example">

**Example 24.472. Simple Use**

<div class="example-contents">

``` screen
xenc_key_DSA_create ('myDSAkey');
```

</div>

</div>

  

</div>

<div id="seealso_xenc_key_dsa_create" class="refsect1">

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