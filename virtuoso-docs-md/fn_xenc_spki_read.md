<div>

<div>

</div>

<div>

## Name

xenc_SPKI_read — Imports a public key from simple public key
infrastructure (SPKI)

</div>

<div>

## Synopsis

<div>

|                             |                             |
|-----------------------------|-----------------------------|
| ` `**`xenc_SPKI_read`**` (` | in `key_name ` varchar ,    |
|                             | in `key_data ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to read an RSA public key from SPKI content.

</div>

<div>

## Parameters

<div>

### key_name

The name of the key to be created, if null is given a temp key will be
created

</div>

<div>

### key_data

The SPKI content

</div>

</div>

<div>

## Examples

<div>

**Example 24.483. SPKI reading**

<div>

The example below creates a temp key.

``` screen
kname := xenc_SPKI_read (null, replace (get_keyword ('key', params), '\r\n', ''));
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xenc_x509_generate.html" class="link"
title="xenc_x509_generate"><code
class="function">xenc_x509_generate </code></a>

</div>

</div>
