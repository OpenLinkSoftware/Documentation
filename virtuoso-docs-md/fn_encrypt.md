<div id="fn_encrypt" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

encrypt — Encrypt content in base64 encoding

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_encrypt" class="funcsynopsis">

|                             |                             |
|-----------------------------|-----------------------------|
| `varchar `**`encrypt`**` (` | in `string_session ` any ,  |
|                             | in `key_name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_encrypt" class="refsect1">

## Description

Returns encrypted content in base64 encoding. The algorithm to encrypt
depends of the key, so if the key is AES the AES will be used, if it is
3DES it is 3DES etc. The AES key can be created with
xenc_key_AES_rand_create (key_name, 256). Alternatively 3DES key can be
generated with xenc_key_3DES_rand_create ().

</div>

<div id="params_encrypt" class="refsect1">

## Parameters

<div id="id119826" class="refsect2">

### string_session

A content to be encrypted.

</div>

<div id="id119829" class="refsect2">

### key_name

The key name keeping secret.

</div>

</div>

<div id="ret_encrypt" class="refsect1">

## Return Types

On success the function will return encrypted content in base64
encoding.

</div>

<div id="examples_encrypt" class="refsect1">

## Examples

<div id="ex_encrypt" class="example">

**Example 24.459. Simple Use**

<div class="example-contents">

``` screen
-- The 'ses' is a function which print the string into a string session:
xenc_key_AES_rand_create ('kaes', 256).
decrypt (encrypt (ses ('data to encrypt'), 'kaes'), 'kaes');
```

</div>

</div>

  

</div>

<div id="seealso_encrypt" class="refsect1">

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
