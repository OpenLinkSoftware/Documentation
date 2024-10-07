<div id="fn_xenc_get_key_algo" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xenc_get_key_algo — Determine XML signature algorithm of a key

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xenc_get_key_algo" class="funcsynopsis">

|                                       |                             |
|---------------------------------------|-----------------------------|
| `varchar `**`xenc_get_key_algo`**` (` | in `key_name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xenc_get_key_algo" class="refsect1">

## Description

The function is used to determine signing algorithm supported by given
key.

</div>

<div id="params_xenc_get_key_algo" class="refsect1">

## Parameters

<div id="id119991" class="refsect2">

### key_name

Name of a key from user's space.

</div>

</div>

<div id="ret_xenc_get_key_algo" class="refsect1">

## Return Types

The function returns string containing algorithm identifier value as
described in <a href="http://www.w3.org/TR/xmldsig-core/" class="ulink"
target="_top">http://www.w3.org/TR/xmldsig-core</a> .

</div>

<div id="examples_xenc_get_key_algo" class="refsect1">

## Examples

<div id="ex_xenc_get_key_algo" class="example">

**Example 24.462. Determine signing algorithm of a key**

<div class="example-contents">

``` screen
SQL> select xenc_get_key_algo ('myKey');
callret
VARCHAR
_______________________________________________________________________________

http://www.w3.org/2000/09/xmldsig#dsa-sha1
```

</div>

</div>

  

</div>

<div id="seealso_xenc_get_key_algo" class="refsect1">

## See Also

<a href="fn_dsig_template_ext.html" class="link"
title="dsig_template_ext"><code
class="function">dsig_template_ext() </code></a>

<a href="fn_xenc_get_key_identifier.html" class="link"
title="xenc_get_key_identifier"><code
class="function">xenc_get_key_identifier() </code></a>

</div>

</div>
