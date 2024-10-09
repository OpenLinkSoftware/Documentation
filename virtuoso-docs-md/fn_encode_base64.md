<div>

<div>

</div>

<div>

## Name

encode_base64 , decode_base64 — base64-encode/decode a string

</div>

<div>

## Synopsis

<div>

|                            |                        |
|----------------------------|------------------------|
| ` `**`encode_base64`**` (` | in `str ` varchar `)`; |

<div>

 

</div>

</div>

<div>

|                            |                        |
|----------------------------|------------------------|
| ` `**`decode_base64`**` (` | in `str ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

These functions convert strings from/to base64-encoding.

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

`encode_base64 ` returns a <span class="type">varchar </span> containing
base64-encoded data. `decode_base64` returns a
<span class="type">varchar </span> containing the result of the
base64-decoding.

</div>

<div>

## Examples

<div>

**Example 24.99. Simple Example**

<div>

Base64-encode a string

``` screen
SQL> select encode_base64('Rutabaga');
callret
VARCHAR
_______________________________________________________________________________

UnV0YWJhZ2E=

1 Rows. -- 25 msec.
```

</div>

</div>

  

<div>

**Example 24.100. Web example**

<div>

Using encode-base64 with serialize to persist complex data

``` screen
declare n any; n := vector ('a', 3.14157, 4711, 'Hic Iacet Corpus.');
http (sprintf ('<input type="hidden" name="saved" value="%s">', encode_base64 (serialize (n))));
```

To retrieve this data in VSP context when handling a form submit:

``` screen
declare n any; n := deserialize (decode_base64 (get_keyword ('saved', params, '')));
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_serialize.html" class="link" title="serialize"><code
class="function">serialize </code></a>

</div>

</div>
