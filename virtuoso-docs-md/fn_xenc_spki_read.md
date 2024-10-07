<div id="fn_xenc_spki_read" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xenc_SPKI_read — Imports a public key from simple public key
infrastructure (SPKI)

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xenc_spki_read" class="funcsynopsis">

|                             |                             |
|-----------------------------|-----------------------------|
| ` `**`xenc_SPKI_read`**` (` | in `key_name ` varchar ,    |
|                             | in `key_data ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xenc_spki_read" class="refsect1">

## Description

This function is used to read an RSA public key from SPKI content.

</div>

<div id="params_xenc_spki_read" class="refsect1">

## Parameters

<div id="id121056" class="refsect2">

### key_name

The name of the key to be created, if null is given a temp key will be
created

</div>

<div id="id121059" class="refsect2">

### key_data

The SPKI content

</div>

</div>

<div id="examples_xenc_spki_read" class="refsect1">

## Examples

<div id="ex_xenc_spki_read" class="example">

**Example 24.483. SPKI reading**

<div class="example-contents">

The example below creates a temp key.

``` screen
kname := xenc_SPKI_read (null, replace (get_keyword ('key', params), '\r\n', ''));
```

</div>

</div>

  

</div>

<div id="seealso_xenc_spki_read" class="refsect1">

## See Also

<a href="fn_xenc_x509_generate.html" class="link"
title="xenc_x509_generate"><code
class="function">xenc_x509_generate </code></a>

</div>

</div>
