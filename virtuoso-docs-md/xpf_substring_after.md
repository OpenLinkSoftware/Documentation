<div id="xpf_substring_after" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

substring-after — Returns the substring of the first argument string
that follows the first occurrence of the second argument string in the
first argument string.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_substring_after" class="funcsynopsis">

|                                    |                         |
|------------------------------------|-------------------------|
| `string `**`substring-after`**` (` | `source_strg ` string , |
|                                    | `sub_strg ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_substring_after" class="refsect1">

## Description

If the *`source_strg`* does not contain *`sub_strg`* , the function
returns the empty string. Otherwise, it finds the first occurrence of
*`sub_strg`* and returns the pert of *`source_strg`* that follows the
occurrence. If any argument is not a string, it is converted to string
using rules for string() XPATH function.

</div>

<div id="xpf_params_substring_after" class="refsect1">

## Parameters

<div id="id129274" class="refsect2">

### source_strg

String where the search is performed

</div>

<div id="id129277" class="refsect2">

### sub_strg

String to search

</div>

</div>

<div id="xpf_ret_substring_after" class="refsect1">

## Return Types

String

</div>

<div id="xpf_examples_substring_after" class="refsect1">

## Examples

<div id="xpf_ex_substring_after" class="example">

**Example 24.624. **

<div class="example-contents">

Extract time and timezone ("23:59:59 GMT" substring) from timestamp

``` screen
substring-after('1999-12-31 23:59:59 GMT',' ')
```

</div>

</div>

  

</div>

<div id="xpf_seealso_substring_after" class="refsect1">

## See Also

<a href="xpf_string.html" class="link" title="string">string()</a>
<a href="xpf_substring.html" class="link"
title="substring">substring()</a>
<a href="xpf_substring_after.html" class="link"
title="substring-after">substring-after()</a>

</div>

</div>
