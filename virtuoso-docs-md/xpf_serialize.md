<div id="xpf_serialize" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

serialize — Serializes a value of its argument following the rules of
the host RDBMS.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_serialize" class="funcsynopsis">

|                              |                 |
|------------------------------|-----------------|
| `string `**`serialize`**` (` | `obj ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_serialize" class="refsect1">

## Description

The serialize() function converts an object to a string as follows:

<div class="itemizedlist">

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

<div id="xpf_params_serialize" class="refsect1">

## Parameters

<div id="id128901" class="refsect2">

### obj

Value to be converted into the string

</div>

</div>

<div id="xpf_ret_serialize" class="refsect1">

## Return Types

String

</div>

<div id="xpf_errors_serialize" class="refsect1">

## Errors

</div>

<div id="xpf_examples_serialize" class="refsect1">

## Examples

<div id="xpf_ex_serialize" class="example">

**Example 24.617. **

<div class="example-contents">

``` screen
string(//title)
```

</div>

</div>

  

</div>

<div id="xpf_seealso_serialize" class="refsect1">

## See Also

<a href="xpf_format_number.html" class="link"
title="format-number">format_number()</a>

<a href="xpf_serialize.html" class="link"
title="serialize">serialize()</a>

<a href="xpf_concat.html" class="link" title="concat">concat()</a>

</div>

</div>
