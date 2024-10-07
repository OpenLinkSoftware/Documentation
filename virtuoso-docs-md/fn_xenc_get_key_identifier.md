<div id="fn_xenc_get_key_identifier" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xenc_get_key_identifier — Determine a key identifier

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xenc_get_key_identifier" class="funcsynopsis">

|                                             |                             |
|---------------------------------------------|-----------------------------|
| `varchar `**`xenc_get_key_identifier`**` (` | in `key_name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xenc_get_key_identifier" class="refsect1">

## Description

The function returns key identifier.

</div>

<div id="params_xenc_get_key_identifier" class="refsect1">

## Parameters

<div id="id120030" class="refsect2">

### key_name

Name of the key

</div>

</div>

<div id="ret_xenc_get_key_identifier" class="refsect1">

## Return Types

The function returns a base64 encoded string containing the key
identifier. If key identifier is not available (the key have no
identifier or key does not exists a NULL will be returned).

</div>

<div id="examples_xenc_get_key_identifier" class="refsect1">

## Examples

<div id="ex_xenc_get_key_identifier" class="example">

**Example 24.463. Determine the key identifier**

<div class="example-contents">

``` screen
SQL> select xenc_get_key_identifier ('myKey');
callret
VARCHAR
_______________________________________________________________________________

LtVJHvVXJFFvzRnfrCaKmdxQaGQ=
```

</div>

</div>

  

</div>

<div id="seealso_xenc_get_key_identifier" class="refsect1">

## See Also

<a href="fn_xenc_get_key_algo.html" class="link"
title="xenc_get_key_algo"><code
class="function">xenc_get_key_algo() </code></a>

<a href="fn_get_certificate_info.html" class="link"
title="get_certificate_info"><code
class="function">get_certificate_info() </code></a>

</div>

</div>
