<div>

<div>

</div>

<div>

## Name

xenc_key_inst_create — Key instance generation

</div>

<div>

## Synopsis

<div>

|                                      |                      |
|--------------------------------------|----------------------|
| `any `**`xenc_key_inst_create`**` (` | in `name ` varchar , |
|                                      | in `super ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function is used to make a key reference used in encryption
functions.

</div>

<div>

## Parameters

<div>

### name

Name of the key to be instantiated.

</div>

<div>

### super

Optional parameter, is specified must contains a key reference to the
super key. In other words the key used to encrypt key specified by
*`name `* .

</div>

</div>

<div>

## Return Types

On success the function returns a non-null value containing key
reference data.

</div>

<div>

## Examples

<div>

**Example 24.474. Key instance creation**

<div>

The example specifies to use an AES key to be used as a session key,
also AES will be encrypted with a RSA one.

``` screen
...
keyi := xenc_key_inst_create ('myAES', xenc_key_inst_create ('rsa-test'))
...
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xenc_key_exists.html" class="link"
title="xenc_key_exists"><code
class="function">xenc_key_exists() </code></a>

</div>

</div>
