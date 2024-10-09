<div>

<div>

</div>

<div>

## Name

sha1_digest — returns string containing sha1 digest encoded in base64

</div>

<div>

## Synopsis

<div>

|                          |                        |
|--------------------------|------------------------|
| ` `**`sha1_digest`**` (` | in `str ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns string containing sha1 digest encoded in base64. This function
has an alias: xenc_sha1_digest ().

</div>

<div>

## Parameters

<div>

### *`str `*

A <span class="type">varchar </span> value.

</div>

</div>

<div>

## Return Values

`sha1_digest ` returns a <span class="type">varchar </span> containing
sha1 digest encoded in base64.

</div>

<div>

## Examples

<div>

**Example 24.223. Simple Example**

<div>

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

<div>

## See Also

<a href="fn_encode_base64.html" class="link" title="encode_base64"><code
class="function">encode_base64 </code></a>

<a href="fn_md5.html" class="link" title="md5"><code
class="function">md5 </code></a>

<a href="fn_serialize.html" class="link" title="serialize"><code
class="function">serialize </code></a>

</div>

</div>
