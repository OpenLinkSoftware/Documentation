<div id="fn_strstr" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

strstr — substring search

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_strstr" class="funcsynopsis">

|                     |                       |
|---------------------|-----------------------|
| ` `**`strstr`**` (` | in `str ` string ,    |
|                     | in `sub ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_strstr" class="refsect1">

## Description

`strstr ` performs a substring search, returning a zero-based index
pointing to beginning of first occurrence of *`sub`* or NULL if not
found.

</div>

<div id="params_strstr" class="refsect1">

## Parameters

<div id="id112574" class="refsect2">

### str

String to search from.

</div>

<div id="id112577" class="refsect2">

### sub

Substring to search for.

</div>

</div>

<div id="ret_strstr" class="refsect1">

## Return Types

An <span class="type">integer </span> zero-based index to first
occurrence of *`sub`* .

</div>

<div id="examples_strstr" class="refsect1">

## Examples

<div id="ex_strstr_01" class="example">

**Example 24.412. Sample example**

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

<div id="seealso_strstr" class="refsect1">

## See Also

<a href="fn_strcasestr.html" class="link" title="strcasestr"><code
class="function">strcasestr </code></a> .

</div>

</div>
