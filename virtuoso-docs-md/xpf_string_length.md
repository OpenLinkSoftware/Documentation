<div id="xpf_string_length" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

string-length — Returns the number of characters in the string.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_string_length" class="funcsynopsis">

|                                   |                     |
|-----------------------------------|---------------------|
| `integer `**`string-length`**` (` | `strg ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_string_length" class="refsect1">

## Description

The string-length() XPATH function returns the number of characters in
the string. If the argument is omitted, it defaults to the context node
converted to a string, in other words the string-value of the context
node.

</div>

<div id="xpf_params_string_length" class="refsect1">

## Parameters

<div id="id129166" class="refsect2">

### strg

The string whose length must be measured.

</div>

</div>

<div id="xpf_ret_string_length" class="refsect1">

## Return Types

Integer

</div>

<div id="xpf_examples_string_length" class="refsect1">

## Examples

<div id="xpf_ex_string_length" class="example">

**Example 24.622. **

<div class="example-contents">

The following expressions returns 5.

``` screen
string-length('ABCDE')
```

</div>

</div>

  

</div>

<div id="xpf_seealso_string_length" class="refsect1">

## See Also

<a href="xpf_string.html" class="link" title="string">xpf_string()</a>

</div>

</div>
