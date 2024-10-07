<div id="fn_xenc_key_remove" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xenc_key_remove — This will delete a key from current user's space.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xenc_key_remove" class="funcsynopsis">

|                              |                             |
|------------------------------|-----------------------------|
| ` `**`xenc_key_remove`**` (` | in `key_name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xenc_key_remove" class="refsect1">

## Description

This will delete a key from current user's space.

</div>

<div id="params_xenc_key_remove" class="refsect1">

## Parameters

<div id="id120706" class="refsect2">

### key_name

The name of the key.

</div>

</div>

<div id="examples_xenc_key_remove" class="refsect1">

## Example

<div id="ex_xenc_key_remove" class="example">

**Example 24.475. Simple Use**

<div class="example-contents">

``` screen
xenc_key_remove ('file:dsa.der');
```

</div>

</div>

  

</div>

<div id="seealso_xenc_key_remove" class="refsect1">

## See Also

<a href="fn_xenc_key_exists.html" class="link"
title="xenc_key_exists"><code
class="function">xenc_key_exists() </code></a>

</div>

</div>
