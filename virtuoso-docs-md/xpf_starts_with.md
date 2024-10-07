<div id="xpf_starts_with" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

starts-with — Returns true if the first argument string starts with the
second argument string, and otherwise returns false.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_starts_with" class="funcsynopsis">

|                                 |                       |
|---------------------------------|-----------------------|
| `boolean `**`starts-with`**` (` | `strg ` string ,      |
|                                 | `prefix ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_starts_with" class="refsect1">

## Description

For two given strings, this function checks if the first string starts
with characters of second string. If any argument is not a string, it is
converted to string using rules for string() XPATH function. Thus if the
second argument has no string value, the function returns true, because
it will be converted to an empty string first.

</div>

<div id="xpf_params_starts_with" class="refsect1">

## Parameters

<div id="id129062" class="refsect2">

### strg

String whose first characters must be compared

</div>

<div id="id129065" class="refsect2">

### prefix

String whose characters must be compared with first characters of
*`strg `*

</div>

</div>

<div id="xpf_ret_starts_with" class="refsect1">

## Return Types

Boolean

</div>

<div id="xpf_examples_starts_with" class="refsect1">

## Examples

<div id="xpf_ex_starts_with" class="example">

**Example 24.620. **

<div class="example-contents">

``` screen
starts-with('OpenLink Virtuoso', 'OpenLink')
```

</div>

</div>

  

</div>

<div id="xpf_seealso_starts_with" class="refsect1">

## See Also

<a href="xpf_string.html" class="link" title="string">string()</a>
<a href="xpf_contains.html" class="link" title="contains">contains()</a>
<a href="xpf_ends_with.html" class="link"
title="ends-with">ends-with()</a>

</div>

</div>
