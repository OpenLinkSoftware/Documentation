<div id="xpf_normalize_space" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

normalize-space — Returns the argument string with whitespace
normalized.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_normalize_space" class="funcsynopsis">

|                                    |                     |
|------------------------------------|---------------------|
| `string `**`normalize-space`**` (` | `strg ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_normalize_space" class="refsect1">

## Description

The function returns the argument string with whitespace normalized by
stripping leading and trailing whitespace and replacing sequences of
whitespace characters by a single space. Whitespace characters are the
same as those allowed by the S production in XML, i.e. space (#x20),
carriage returns (#xD), line feeds (#xA), and tabs (#x9). If the
argument is omitted, it defaults to the context node converted to a
string, in other words the string-value of the context node.

</div>

<div id="xpf_params_normalize_space" class="refsect1">

## Parameters

<div id="id128330" class="refsect2">

### strg

A string to be normalized

</div>

</div>

<div id="xpf_ret_normalize_space" class="refsect1">

## Return Types

</div>

<div id="xpf_examples_normalize_space" class="refsect1">

## Examples

<div id="xpf_ex_normalize_space" class="example">

**Example 24.605. **

<div class="example-contents">

``` screen
normalize-space('    too     many   spaces    ')
```

</div>

</div>

  

</div>

<div id="xpf_seealso_normalize_space" class="refsect1">

## See Also

<a href="xpf_translate.html" class="link"
title="translate">translate()</a>
<a href="xpf_replace.html" class="link" title="replace">replace()</a>

</div>

</div>
