<div>

<div>

</div>

<div>

## Name

xenc_get_key_identifier — Determine a key identifier

</div>

<div>

## Synopsis

<div>

|                                             |                             |
|---------------------------------------------|-----------------------------|
| `varchar `**`xenc_get_key_identifier`**` (` | in `key_name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns key identifier.

</div>

<div>

## Parameters

<div>

### key_name

Name of the key

</div>

</div>

<div>

## Return Types

The function returns a base64 encoded string containing the key
identifier. If key identifier is not available (the key have no
identifier or key does not exists a NULL will be returned).

</div>

<div>

## Examples

<div>

**Example 24.463. Determine the key identifier**

<div>

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

<div>

## See Also

<a href="fn_xenc_get_key_algo.html" class="link"
title="xenc_get_key_algo"><code
class="function">xenc_get_key_algo() </code></a>

<a href="fn_get_certificate_info.html" class="link"
title="get_certificate_info"><code
class="function">get_certificate_info() </code></a>

</div>

</div>
