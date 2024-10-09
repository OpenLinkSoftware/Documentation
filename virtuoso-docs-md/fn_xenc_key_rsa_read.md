<div>

<div>

</div>

<div>

## Name

xenc_key_RSA_read — Importing a RSA key into user's repository

</div>

<div>

## Synopsis

<div>

|                                |                             |
|--------------------------------|-----------------------------|
| ` `**`xenc_key_RSA_read`**` (` | in `name ` varchar ,        |
|                                | in `key_data ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to import an RSA serialized key into user's
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

The base64 encoded binary data with RSA key material

</div>

</div>

<div>

## Return Types

No return value.

</div>

<div>

## Examples

<div>

**Example 24.468. Loading a shared secret**

<div>

``` screen
xenc_key_RSA_read ('MyRSAkey', 'MIG..skipped..MBAAE=');
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xenc_key_rsa_create.html" class="link"
title="xenc_key_RSA_create"><code
class="function">xenc_key_RSA_create() </code></a>

</div>

</div>
