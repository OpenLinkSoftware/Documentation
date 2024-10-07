<div id="fn_strcontains" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

strcontains — Performs substring search

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_strcontains" class="funcsynopsis">

|                          |                       |
|--------------------------|-----------------------|
| ` `**`strcontains`**` (` | in `str ` string ,    |
|                          | in `sub ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_strcontains" class="refsect1">

## Description

`strcontains ` performs a substring search, returning 1 or 0.

</div>

<div id="params_strcontains" class="refsect1">

## Parameters

<div id="id113156" class="refsect2">

### str

String to search from.

</div>

<div id="id113159" class="refsect2">

### sub

Substring to search for.

</div>

</div>

<div id="ret_strcontains" class="refsect1">

## Return Types

1 if found, 0 if not found.

</div>

<div id="examples_strcontains" class="refsect1">

## Examples

<div id="ex_strcontains" class="example">

**Example 24.415. Simple example**

<div class="example-contents">

``` programlisting
SQL> select strcontains('AbracadabrA','abrA');
strcontains
INTEGER
_______________________________________________________________________________

1

1 Rows. -- 0 msec.

SQL> select strcontains('AbracadabrA','XZ');
strcontains
INTEGER
_______________________________________________________________________________

0

1 Rows. -- 0 msec.
```

</div>

</div>

  

</div>

<div id="seealso_strcontains" class="refsect1">

## See Also

<a href="fn_strcasestr.html" class="link" title="strcasestr"><code
class="function">strcasestr </code></a> .

<a href="fn_starts_with.html" class="link" title="starts_with"><code
class="function">starts_with </code></a> .

<a href="fn_ends_with.html" class="link" title="ends_with"><code
class="function">end_with </code></a> .

</div>

</div>
