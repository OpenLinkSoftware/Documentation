<div id="xpf_ends_with" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

ends-with — Returns true if the first argument string ends with the
second argument string, and otherwise returns false.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_ends_with" class="funcsynopsis">

|                               |                       |
|-------------------------------|-----------------------|
| `boolean `**`ends-with`**` (` | `strg ` string ,      |
|                               | `suffix ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_ends_with" class="refsect1">

## Description

For two given strings, this function checks if the first string ends
with characters of second string. If any argument is not a string, it is
converted to string using rules from string() XPATH function. Thus if
the second argument has no string value, the function returns true,
because it will be converted to an empty string first.

Unlike start-with() XPATH function, this function is not described in
XPATH 1.0 standard. To write portable XPATH expression, use substring().

</div>

<div id="xpf_params_ends_with" class="refsect1">

## Parameters

<div id="id127113" class="refsect2">

### strg

String whose first characters must be compared

</div>

<div id="id127116" class="refsect2">

### prefix

String whose characters must be compared with first characters of
*`strg `*

</div>

</div>

<div id="xpf_ret_ends_with" class="refsect1">

## Return Types

Boolean

</div>

<div id="xpf_examples_ends_with" class="refsect1">

## Examples

<div id="xpf_ex_ends_with" class="example">

**Example 24.584. **

<div class="example-contents">

``` screen
ends-with('OpenLink Virtuoso', 'Virtuoso')
```

</div>

</div>

  

</div>

<div id="xpf_seealso_ends_with" class="refsect1">

## See Also

<a href="xpf_string.html" class="link" title="string">string()</a>
<a href="xpf_contains.html" class="link" title="contains">contains()</a>
<a href="xpf_starts_with.html" class="link"
title="starts-with">starts-with()</a>

</div>

</div>
