<div>

<div>

</div>

<div>

## Name

xenc_delete_temp_keys — Remove the temporary keys from user's space

</div>

<div>

## Synopsis

<div>

|                                       |      |
|---------------------------------------|------|
| `int `**`xenc_delete_temp_keys`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

When signing an XML document or doing the reverse work like verification
etc. number of temporary keys are created in user's space. These keys at
some point may not needed anymore, so they can be removed from memory.

</div>

<div>

## Return Types

The function returns number of temp keys removed.

</div>

<div>

## Examples

<div>

**Example 24.457. Delete temporary keys**

<div>

``` screen
SQL> select xenc_delete_temp_keys ();
callret
VARCHAR
_______________________________________________________________________________

1
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xenc_decrypt_soap.html" class="link"
title="xenc_decrypt_soap"><code
class="function">xenc_decrypt_soap() </code></a>

<a href="fn_xenc_key_3des_rand_create.html" class="link"
title="xenc_key_3DES_rand_create"><code
class="function">xenc_key_3des_rand_create() </code></a>

<a href="fn_xenc_key_aes_rand_create.html" class="link"
title="xenc_key_AES_rand_create"><code
class="function">xenc_key_aes_rand_create() </code></a>

</div>

</div>
