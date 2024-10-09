<div>

<div>

</div>

<div>

## Name

xenc_key_DSA_read — Importing a DSA key into user's repository

</div>

<div>

## Synopsis

<div>

|                                |                             |
|--------------------------------|-----------------------------|
| ` `**`xenc_key_DSA_read`**` (` | in `name ` varchar ,        |
|                                | in `key_data ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to import a DSA serialized key into user's
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

The base64 encoded binary data with DSA key material

</div>

</div>

<div>

## Return Types

No return value.

</div>

<div>

## Examples

<div>

**Example 24.467. Loading a shared secret**

<div>

``` screen
xenc_key_DSA_read ('myDSAkey', 'MII..skipped..Klmu+tlaA==');
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xenc_key_dsa_create.html" class="link"
title="xenc_key_DSA_create"><code
class="function">xenc_key_DSA_create() </code></a>

</div>

</div>
