<div id="fn_user_key_store" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

USER_KEY_STORE — Saves a key in the database and in case the database is
restarted, the key will be loaded again.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_user_key_store" class="funcsynopsis">

|                             |                                      |
|-----------------------------|--------------------------------------|
| ` `**`USER_KEY_STORE`**` (` | in `username ` varchar ,             |
|                             | in `key_name ` varchar ,             |
|                             | in `key_type ` varchar ,             |
|                             | in `key_format ` varchar ,           |
|                             | in `key_pwd ` varchar ,              |
|                             | in `key_value ` varchar := NULL `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_user_key_store" class="refsect1">

## Description

This function saves a key in the database and in case the database is
restarted, the key will be loaded again.

</div>

<div id="params_user_key_store" class="refsect1">

## Parameters

<div id="id117380" class="refsect2">

### username

User name

</div>

<div id="id117383" class="refsect2">

### key_name

Key name

</div>

<div id="id117386" class="refsect2">

### key_type

Key type

</div>

<div id="id117389" class="refsect2">

### key_format

Key format

</div>

<div id="id117392" class="refsect2">

### key_pwd

Key password

</div>

<div id="id117395" class="refsect2">

### key_value

Key value

</div>

</div>

<div id="examples_user_key_store" class="refsect1">

## Examples

<div id="ex_user_key_store" class="example">

**Example 24.436. Persisting a key & certificate**

<div class="example-contents">

The example below persists a key named 'id_rsa' and certificate created
for it into user's key space. Thus after server restart the key will be
available again.

``` programlisting
SQL> USER_KEY_STORE (user, 'id_rsa', 'X.509', 2, '', xenc_pkcs12_export ('id_rsa', 'CA Certificate', ''));
```

</div>

</div>

  

</div>

<div id="seealso_user_key_store" class="refsect1">

## See Also

<a href="fn_xenc_pkcs12_export.html" class="link"
title="xenc_pkcs12_export"><code
class="function">xenc_pkcs12_export() </code></a>

</div>

</div>
