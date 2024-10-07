<div id="fn_strcasestr" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

strcasestr — case-insensitive substring search

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_strcasestr" class="funcsynopsis">

|                         |                       |
|-------------------------|-----------------------|
| ` `**`strcasestr`**` (` | in `str ` string ,    |
|                         | in `sub ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_strcasestr" class="refsect1">

## Description

`strcasestr ` performs a case-insensitive substring search, returning a
zero-based index pointing to beginning of first occurrence of *`sub`* or
NULL if not found.

</div>

<div id="params_strcasestr" class="refsect1">

## Parameters

<div id="id112177" class="refsect2">

### str

String to search from.

</div>

<div id="id112180" class="refsect2">

### sub

Substring to search for.

</div>

</div>

<div id="ret_strcasestr" class="refsect1">

## Return Types

An <span class="type">integer </span> zero-based index to first
occurrence of *`sub`* .

</div>

<div id="examples_strcasestr" class="refsect1">

## Examples

<div id="ex_strstr" class="example">

**Example 24.405. Sample example**

<div class="example-contents">

``` screen
strstr('AbracadabrA','abrA')
    -> 7 (Found from the eighth character onwards)
strcasestr('AbracadabrA','abrA')
    -> 0 (Found from the beginning of string)
```

</div>

</div>

  

</div>

<div id="seealso_strcasestr" class="refsect1">

## See Also

<a href="fn_strstr.html" class="link" title="strstr"><code
class="function">strstr </code></a> .

</div>

</div>
