<div id="xpf_substring_before" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

substring-before — Returns the substring of the first argument string
that precedes the first occurrence of the second argument string in the
first argument string.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_substring_before" class="funcsynopsis">

|                                     |                         |
|-------------------------------------|-------------------------|
| `string `**`substring-before`**` (` | `source_strg ` string , |
|                                     | `sub_strg ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_substring_before" class="refsect1">

## Description

If the *`source_strg`* does not contain *`sub_strg`* , the function
returns the empty string. Otherwise, it finds the first occurrence of
*`sub_strg`* and returns the pert of *`source_strg`* that precedes the
occurrence. If any argument is not a string, it is converted to string
using rules for string() XPATH function.

</div>

<div id="xpf_params_substring_before" class="refsect1">

## Parameters

<div id="id129320" class="refsect2">

### source_strg

String where the search is performed

</div>

<div id="id129323" class="refsect2">

### sub_strg

String to search

</div>

</div>

<div id="xpf_ret_substring_before" class="refsect1">

## Return Types

String

</div>

<div id="xpf_examples_substring_before" class="refsect1">

## Examples

<div id="xpf_ex_substring_before" class="example">

**Example 24.625. **

<div class="example-contents">

Extract year ("1999" substring) from ISO date string

``` screen
substring-before('1999-12-31','-')
```

</div>

</div>

  

</div>

<div id="xpf_seealso_substring_before" class="refsect1">

## See Also

<a href="xpf_string.html" class="link" title="string">string()</a>
<a href="xpf_substring.html" class="link"
title="substring">substring()</a>
<a href="xpf_substring_after.html" class="link"
title="substring-after">substring-after()</a>

</div>

</div>
