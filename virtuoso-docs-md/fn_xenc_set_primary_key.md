<div>

<div>

</div>

<div>

## Name

xenc_set_primary_key — Associate a X.509 certificate with a key

</div>

<div>

## Synopsis

<div>

|                                   |                         |
|-----------------------------------|-------------------------|
| ` `**`xenc_set_primary_key`**` (` | in `name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to associate a key (to be used as primary) with a
X.509 certificate. Usually this function is called after key import from
a X.509 certificate.

</div>

<div>

## Parameters

<div>

### name

Name of the key to be processed.

</div>

</div>

<div>

## Return Types

No return value.

</div>

<div>

## Examples

<div>

**Example 24.477. Importing a key from X.509 certificate**

<div>

``` screen
...
xenc_key_create_cert (key_name, key_value, key_type, fmt, NULL, key_passwd);
xenc_set_primary_key (key_name);
...
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xenc_key_create_cert.html" class="link"
title="xenc_key_create_cert"><code
class="function">xenc_key_create_cert() </code></a>

</div>

</div>
