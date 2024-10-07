<div id="xpf_replace" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

replace — Searches for an substring and replace its occurrences with
other substring.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_replace" class="funcsynopsis">

|                            |                             |
|----------------------------|-----------------------------|
| `string `**`replace`**` (` | `txt ` string ,             |
|                            | `search_strg ` string ,     |
|                            | `replace_strg ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_replace" class="refsect1">

## Description

The function searches for all occurrences of a *`search_strg`* in
*`txt`* and replaces every occurrence with *`replace_strg`* . An error
is signalled if *`search_strg`* is empty.

</div>

<div id="xpf_params_replace" class="refsect1">

## Parameters

<div id="id128783" class="refsect2">

### txt

Text to process.

</div>

<div id="id128786" class="refsect2">

### search_strg

Substring to search for *`txt `* .

</div>

<div id="id128790" class="refsect2">

### replace_strg

Substring to replace *`search_strg `* in *`txt `* .

</div>

</div>

<div id="xpf_ret_replace" class="refsect1">

## Return Types

String.

</div>

<div id="xpf_errors_replace" class="refsect1">

## Errors

<div id="id128800" class="table">

**Table 24.150. Errors signalled by**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                    | Description                                                                                                                        |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPF08 </span> | <span class="errortext">Empty string passed as argument 2 to XPATH function replace() </span> | It is impossible to search for an empty substring.                                                                                 |
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPF14 </span> | <span class="errortext">The result of XPATH function replace() is too long </span>            | If the function replaces short substring with longer one, the result is longer than the original string and may exceed 10Mb limit. |

</div>

</div>

  

</div>

<div id="xpf_examples_replace" class="refsect1">

## Examples

<div id="xpf_ex_replace" class="example">

**Example 24.615. **

<div class="example-contents">

Replace all occurrences of 'http://www.example.com/' with '/webrobot/'

``` screen
replace(
  '<A HREF="http://www.example.com/index.html">Home</A>',
  'http://www.example.com/', '/webrobot/' )
```

</div>

</div>

  

</div>

<div id="xpf_seealso_replace" class="refsect1">

## See Also

<a href="xpf_translate.html" class="link"
title="translate">translate</a>

</div>

</div>
