<div id="fn_sha1_digest" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sha1_digest — returns string containing sha1 digest encoded in base64

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sha1_digest" class="funcsynopsis">

|                          |                        |
|--------------------------|------------------------|
| ` `**`sha1_digest`**` (` | in `str ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_sha1_digest" class="refsect1">

## Description

Returns string containing sha1 digest encoded in base64. This function
has an alias: xenc_sha1_digest ().

</div>

<div id="params_sha1_digest" class="refsect1">

## Parameters

<div id="id96956" class="refsect2">

### *`str `*

A <span class="type">varchar </span> value.

</div>

</div>

<div id="ret_sha1_digest" class="refsect1">

## Return Values

`sha1_digest ` returns a <span class="type">varchar </span> containing
sha1 digest encoded in base64.

</div>

<div id="examples_sha1_digest" class="refsect1">

## Examples

<div id="ex_sha1_digest_1" class="example">

**Example 24.223. Simple Example**

<div class="example-contents">

Base64-encode a string

``` screen
SQL> select sha1_digest('demodemo');
callret
VARCHAR
_______________________________________________________________________________

WGPZ5MvfUi6qYuB0f86xxbJJuhM=

1 Rows. -- 25 msec.
```

</div>

</div>

  

</div>

<div id="seealso_sha1_digest" class="refsect1">

## See Also

<a href="fn_encode_base64.html" class="link" title="encode_base64"><code
class="function">encode_base64 </code></a>

<a href="fn_md5.html" class="link" title="md5"><code
class="function">md5 </code></a>

<a href="fn_serialize.html" class="link" title="serialize"><code
class="function">serialize </code></a>

</div>

</div>
