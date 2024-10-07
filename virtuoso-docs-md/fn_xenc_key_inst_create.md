<div id="fn_xenc_key_inst_create" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xenc_key_inst_create — Key instance generation

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xenc_key_inst_create" class="funcsynopsis">

|                                      |                      |
|--------------------------------------|----------------------|
| `any `**`xenc_key_inst_create`**` (` | in `name ` varchar , |
|                                      | in `super ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xenc_key_inst_create" class="refsect1">

## Description

The function is used to make a key reference used in encryption
functions.

</div>

<div id="params_xenc_key_inst_create" class="refsect1">

## Parameters

<div id="id120666" class="refsect2">

### name

Name of the key to be instantiated.

</div>

<div id="id120669" class="refsect2">

### super

Optional parameter, is specified must contains a key reference to the
super key. In other words the key used to encrypt key specified by
*`name `* .

</div>

</div>

<div id="ret_xenc_key_inst_create" class="refsect1">

## Return Types

On success the function returns a non-null value containing key
reference data.

</div>

<div id="examples_xenc_key_inst_create" class="refsect1">

## Examples

<div id="ex_xenc_key_inst_create" class="example">

**Example 24.474. Key instance creation**

<div class="example-contents">

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

<div id="seealso_xenc_key_inst_create" class="refsect1">

## See Also

<a href="fn_xenc_key_exists.html" class="link"
title="xenc_key_exists"><code
class="function">xenc_key_exists() </code></a>

</div>

</div>
