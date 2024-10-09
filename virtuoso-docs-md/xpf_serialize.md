<div>

<div>

</div>

<div>

## Name

serialize — Serializes a value of its argument following the rules of
the host RDBMS.

</div>

<div>

## Synopsis

<div>

|                              |                 |
|------------------------------|-----------------|
| `string `**`serialize`**` (` | `obj ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The serialize() function converts an object to a string as follows:

<div>

- An empty sequence is converted to an empty string.

- A nonempty node-set is converted to a string by serialization of its
  first node.

- A non-attribute XML entity is serialized as if it is serialized by
  http() function. In other words, the result is a plain text of XML
  syntax. For an attribute XML entity, the value of attribute is
  returned.

- Values of other types are converted into strings as cast(... as
  varchar) do this in Virtuoso/PL, exactly.

</div>

If the argument is omitted, context node is converted instead as if it
is a node-set of one element.

</div>

<div>

## Parameters

<div>

### obj

Value to be converted into the string

</div>

</div>

<div>

## Return Types

String

</div>

<div>

## Errors

</div>

<div>

## Examples

<div>

**Example 24.617. **

<div>

``` screen
string(//title)
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_format_number.html" class="link"
title="format-number">format_number()</a>

<a href="xpf_serialize.html" class="link"
title="serialize">serialize()</a>

<a href="xpf_concat.html" class="link" title="concat">concat()</a>

</div>

</div>
