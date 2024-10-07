<div id="fn_ends_with" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

ends_with — Checks whether string X ends with Y

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_ends_with" class="funcsynopsis">

|                        |                       |
|------------------------|-----------------------|
| ` `**`ends_with`**` (` | in `str ` string ,    |
|                        | in `sub ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_ends_with" class="refsect1">

## Description

`ends_with ` checks whether string X ends with Y, ignoring occurencies
of Y in other places. Returns 1 or 0.

</div>

<div id="params_ends_with" class="refsect1">

## Parameters

<div id="id113250" class="refsect2">

### str

String to search from.

</div>

<div id="id113253" class="refsect2">

### sub

Substring to search for.

</div>

</div>

<div id="ret_ends_with" class="refsect1">

## Return Types

1 if found, 0 if not found.

</div>

<div id="examples_ends_with" class="refsect1">

## Examples

<div id="ex_ends_with" class="example">

**Example 24.417. Simple example**

<div class="example-contents">

``` programlisting
SQL> select ends_with('AbracadabrA','rA');
ends_with
INTEGER
_______________________________________________________________________________

1

1 Rows. -- 0 msec.
```

</div>

</div>

  

</div>

<div id="seealso_ends_with" class="refsect1">

## See Also

<a href="fn_strcasestr.html" class="link" title="strcasestr"><code
class="function">strcasestr </code></a> .

<a href="fn_strcontains.html" class="link" title="strcontains"><code
class="function">strcontains </code></a> .

<a href="fn_starts_with.html" class="link" title="starts_with"><code
class="function">starts_with </code></a> .

</div>

</div>
