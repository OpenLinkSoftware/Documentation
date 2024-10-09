<div>

<div>

</div>

<div>

## Name

urlify — Converts its argument to a string and returns it in URL
encoding.

</div>

<div>

## Synopsis

<div>

|                           |                    |
|---------------------------|--------------------|
| `string `**`urlify`**` (` | `obj ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The urlify() function encodes its argument string according to URI rules
(i.e. whitespaces are replaced with plus signs and all special
characters are replaced with '%XX' notation. This is especially useful
for stylesheets that compose dynamic HTML documents with calculateable
values of attributes like \<A HREF=...\>.

</div>

<div>

## Parameters

<div>

### obj

Value to be formatted as URI

</div>

</div>

<div>

## Return Types

String

</div>

<div>

## See Also

<a href="xpf_string.html" class="link" title="string">string()</a>

<a href="xpf_format_number.html" class="link"
title="format-number">format_number()</a>

<a href="xpf_serialize.html" class="link"
title="serialize">serialize()</a>

<a href="xpf_concat.html" class="link" title="concat">concat()</a>

</div>

</div>
