<div>

<div>

</div>

<div>

## Name

xenc_get_key_algo — Determine XML signature algorithm of a key

</div>

<div>

## Synopsis

<div>

|                                       |                             |
|---------------------------------------|-----------------------------|
| `varchar `**`xenc_get_key_algo`**` (` | in `key_name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function is used to determine signing algorithm supported by given
key.

</div>

<div>

## Parameters

<div>

### key_name

Name of a key from user's space.

</div>

</div>

<div>

## Return Types

The function returns string containing algorithm identifier value as
described in <a href="http://www.w3.org/TR/xmldsig-core/" class="ulink"
target="_top">http://www.w3.org/TR/xmldsig-core</a> .

</div>

<div>

## Examples

<div>

**Example 24.462. Determine signing algorithm of a key**

<div>

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

<div>

## See Also

<a href="fn_dsig_template_ext.html" class="link"
title="dsig_template_ext"><code
class="function">dsig_template_ext() </code></a>

<a href="fn_xenc_get_key_identifier.html" class="link"
title="xenc_get_key_identifier"><code
class="function">xenc_get_key_identifier() </code></a>

</div>

</div>
