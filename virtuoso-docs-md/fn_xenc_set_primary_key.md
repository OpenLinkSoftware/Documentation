<div id="fn_xenc_set_primary_key" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xenc_set_primary_key — Associate a X.509 certificate with a key

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xenc_set_primary_key" class="funcsynopsis">

|                                   |                         |
|-----------------------------------|-------------------------|
| ` `**`xenc_set_primary_key`**` (` | in `name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xenc_set_primary_key" class="refsect1">

## Description

This function is used to associate a key (to be used as primary) with a
X.509 certificate. Usually this function is called after key import from
a X.509 certificate.

</div>

<div id="params_xenc_set_primary_key" class="refsect1">

## Parameters

<div id="id120774" class="refsect2">

### name

Name of the key to be processed.

</div>

</div>

<div id="ret_xenc_set_primary_key" class="refsect1">

## Return Types

No return value.

</div>

<div id="examples_xenc_set_primary_key" class="refsect1">

## Examples

<div id="ex_xenc_set_primary_key" class="example">

**Example 24.477. Importing a key from X.509 certificate**

<div class="example-contents">

``` screen
...
xenc_key_create_cert (key_name, key_value, key_type, fmt, NULL, key_passwd);
xenc_set_primary_key (key_name);
...
```

</div>

</div>

  

</div>

<div id="seealso_xenc_set_primary_key" class="refsect1">

## See Also

<a href="fn_xenc_key_create_cert.html" class="link"
title="xenc_key_create_cert"><code
class="function">xenc_key_create_cert() </code></a>

</div>

</div>
