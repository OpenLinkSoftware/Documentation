<div id="fn_xenc_key_3des_read" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xenc_key_3DES_read — Importing a triple-des key into user's repository

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xenc_key_3des_read" class="funcsynopsis">

|                                 |                             |
|---------------------------------|-----------------------------|
| ` `**`xenc_key_3DES_read`**` (` | in `name ` varchar ,        |
|                                 | in `key_data ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xenc_key_3des_read" class="refsect1">

## Description

This function is used to import a triple-des serialized key into user's
repository and register it with a name supplied.

Note that key will not be persisted. It is loaded in the memory only.

</div>

<div id="params_xenc_key_3des_read" class="refsect1">

## Parameters

<div id="id120071" class="refsect2">

### name

Name of the key to register

</div>

<div id="id120074" class="refsect2">

### key_data

The base64 encoded binary data with key material

</div>

</div>

<div id="ret_xenc_key_3des_read" class="refsect1">

## Return Types

No return value.

</div>

<div id="examples_xenc_key_3des_read" class="refsect1">

## Examples

<div id="ex_xenc_key_3des_read" class="example">

**Example 24.464. Loading a shared secret**

<div class="example-contents">

``` screen
      xenc_key_3DES_read ('Sample Symmetric Key', 'EE/uaFF5N3ZNJWUTR8DYe+OEbwaKQnso');
```

</div>

</div>

  

</div>

<div id="seealso_xenc_key_3des_read" class="refsect1">

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
