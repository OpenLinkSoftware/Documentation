<div>

<div>

</div>

<div>

## Name

USER_KEY_STORE — Saves a key in the database and in case the database is
restarted, the key will be loaded again.

</div>

<div>

## Synopsis

<div>

|                             |                                      |
|-----------------------------|--------------------------------------|
| ` `**`USER_KEY_STORE`**` (` | in `username ` varchar ,             |
|                             | in `key_name ` varchar ,             |
|                             | in `key_type ` varchar ,             |
|                             | in `key_format ` varchar ,           |
|                             | in `key_pwd ` varchar ,              |
|                             | in `key_value ` varchar := NULL `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function saves a key in the database and in case the database is
restarted, the key will be loaded again.

</div>

<div>

## Parameters

<div>

### username

User name

</div>

<div>

### key_name

Key name

</div>

<div>

### key_type

Key type

</div>

<div>

### key_format

Key format

</div>

<div>

### key_pwd

Key password

</div>

<div>

### key_value

Key value

</div>

</div>

<div>

## Examples

<div>

**Example 24.436. Persisting a key & certificate**

<div>

The example below persists a key named 'id_rsa' and certificate created
for it into user's key space. Thus after server restart the key will be
available again.

``` programlisting
SQL> USER_KEY_STORE (user, 'id_rsa', 'X.509', 2, '', xenc_pkcs12_export ('id_rsa', 'CA Certificate', ''));
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xenc_pkcs12_export.html" class="link"
title="xenc_pkcs12_export"><code
class="function">xenc_pkcs12_export() </code></a>

</div>

</div>
