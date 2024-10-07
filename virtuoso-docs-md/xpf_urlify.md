<div id="xpf_urlify" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

urlify — Converts its argument to a string and returns it in URL
encoding.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_urlify" class="funcsynopsis">

|                           |                    |
|---------------------------|--------------------|
| `string `**`urlify`**` (` | `obj ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_urlify" class="refsect1">

## Description

The urlify() function encodes its argument string according to URI rules
(i.e. whitespaces are replaced with plus signs and all special
characters are replaced with '%XX' notation. This is especially useful
for stylesheets that compose dynamic HTML documents with calculateable
values of attributes like \<A HREF=...\>.

</div>

<div id="xpf_params_urlify" class="refsect1">

## Parameters

<div id="id129778" class="refsect2">

### obj

Value to be formatted as URI

</div>

</div>

<div id="xpf_ret_urlify" class="refsect1">

## Return Types

String

</div>

<div id="xpf_seealso_urlify" class="refsect1">

## See Also

<a href="xpf_string.html" class="link" title="string">string()</a>

<a href="xpf_format_number.html" class="link"
title="format-number">format_number()</a>

<a href="xpf_serialize.html" class="link"
title="serialize">serialize()</a>

<a href="xpf_concat.html" class="link" title="concat">concat()</a>

</div>

</div>
