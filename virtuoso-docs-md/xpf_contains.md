<div id="xpf_contains" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

contains — Returns true if the first argument string contains the second
argument string, and otherwise returns false.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_contains" class="funcsynopsis">

|                              |                       |
|------------------------------|-----------------------|
| `boolean `**`contains`**` (` | `haystack ` string ,  |
|                              | `needle ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_contains" class="refsect1">

## Description

For two given strings, this function checks if the first string contains
the second string. If any argument is not a string, it is converted to
string using rules from string() XPATH function. Thus if the second
argument has no string value, the function returns true, because it will
be converted to an empty string first.

</div>

<div id="xpf_params_contains" class="refsect1">

## Parameters

<div id="id126385" class="refsect2">

### haystack

String where the search is performed

</div>

<div id="id126388" class="refsect2">

### needle

String to search

</div>

</div>

<div id="xpf_ret_contains" class="refsect1">

## Return Types

Boolean

</div>

<div id="xpf_examples_contains" class="refsect1">

## Examples

<div id="xpf_ex_contains" class="example">

**Example 24.572. **

<div class="example-contents">

``` screen
contains ('OpenLink Virtuoso', 'Link')
```

</div>

</div>

  

</div>

<div id="xpf_seealso_contains" class="refsect1">

## See Also

<a href="xpf_string.html" class="link" title="string">string()</a>
<a href="xpf_starts_with.html" class="link"
title="starts-with">starts-with()</a>
<a href="xpf_ends_with.html" class="link"
title="ends-with">ends-with()</a>

</div>

</div>
