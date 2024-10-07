<div id="fn_xenc_key_create_cert" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xenc_key_create_cert — Import a key from a certificate

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xenc_key_create_cert" class="funcsynopsis">

|                                   |                         |
|-----------------------------------|-------------------------|
| ` `**`xenc_key_create_cert`**` (` | in `name ` varchar ,    |
|                                   | in `cert ` varchar ,    |
|                                   | in `type ` varchar ,    |
|                                   | in `fmt ` int ,         |
|                                   | in `pkey ` varchar ,    |
|                                   | in `pass ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xenc_key_create_cert" class="refsect1">

## Description

The function is used to import a key (usually an asymmetric key like RSA
or DSA) into user's space from a certificate.

</div>

<div id="params_xenc_key_create_cert" class="refsect1">

## Parameters

<div id="id120496" class="refsect2">

### name

The name of the key to be registered

</div>

<div id="id120499" class="refsect2">

### cert

String containing the certificate

</div>

<div id="id120502" class="refsect2">

### type

'X.509' is only supported value

</div>

<div id="id120505" class="refsect2">

### fmt

The input format of the certificate: 3 - "DER", 1 - "PEM" or 2 -
"PKCS#12".

</div>

<div id="id120508" class="refsect2">

### pkey

When an X.509 certificate is imported, this can be supplied to load the
corresponding private key also. This is optional. Note that when the
PKCS#12 format is used to import an X.509 certificate, the private key
is in the 'cert', hence this parameter in such case must be omitted.

</div>

<div id="id120511" class="refsect2">

### pass

The password to unlock the private key. If not required this can be NULL
to indicate no password is needed.

</div>

</div>

<div id="examples_xenc_key_create_cert" class="refsect1">

## Examples

<div id="ex_xenc_key_create_cert" class="example">

**Example 24.471. Importing a key from X.509 certificate**

<div class="example-contents">

``` screen
...
xenc_key_create_cert ('myRSA', file_to_string ('keys/mycert.pfx'), 'X.509', 2, NULL, 'secret');
xenc_set_primary_key ('myRSA');
...
```

</div>

</div>

  

</div>

<div id="seealso_xenc_key_create_cert" class="refsect1">

## See Also

<a href="fn_xenc_set_primary_key.html" class="link"
title="xenc_set_primary_key"><code
class="function">xenc_set_primary_key() </code></a>

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
class="function">xenc_key_dsa_create() </code></a>

<a href="fn_xenc_key_rsa_read.html" class="link"
title="xenc_key_RSA_read"><code
class="function">xenc_key_RSA_read() </code></a>

<a href="fn_xenc_key_serialize.html" class="link"
title="xenc_key_serialize"><code
class="function">xenc_key_serialize() </code></a>

<a href="fn_xenc_key_remove.html" class="link"
title="xenc_key_remove"><code
class="function">xenc_key_remove() </code></a>

</div>

</div>
