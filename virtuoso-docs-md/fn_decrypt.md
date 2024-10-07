<div id="fn_decrypt" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

decrypt — Encrypt content in base64 encoding

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_decrypt" class="funcsynopsis">

|                             |                                   |
|-----------------------------|-----------------------------------|
| `varchar `**`decrypt`**` (` | in `base64_string_session ` any , |
|                             | in `key_name ` varchar `)`;       |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_decrypt" class="refsect1">

## Description

Returns decrypted content as a string_session. The algorithm to encrypt
depends of the key, so if the key is AES the AES will be used, if it is
3DES it is 3DES etc. The AES key can be created with
xenc_key_AES_rand_create (key_name, 256). Alternatively 3DES key can be
generated with xenc_key_3DES_rand_create ().

</div>

<div id="params_decrypt" class="refsect1">

## Parameters

<div id="id119875" class="refsect2">

### base64_string_session

A base64 string content to be decrypted.

</div>

<div id="id119878" class="refsect2">

### key_name

The key name keeping secret.

</div>

</div>

<div id="ret_decrypt" class="refsect1">

## Return Types

On success the function will return decrypted content as a
string_session.

</div>

<div id="examples_decrypt" class="refsect1">

## Examples

<div id="ex_decrypt" class="example">

**Example 24.460. Simple Use**

<div class="example-contents">

``` screen
-- The 'ses' is a function which print the string into a string session:
xenc_key_AES_rand_create ('kaes', 256).
decrypt (encrypt (ses ('data to encrypt'), 'kaes'), 'kaes');
```

</div>

</div>

  

</div>

<div id="seealso_decrypt" class="refsect1">

## See Also

<a href="fn_encrypt.html" class="link" title="encrypt"><code
class="function">encrypt() </code></a>

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
