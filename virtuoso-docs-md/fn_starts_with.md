<div id="fn_starts_with" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

starts_with — Checks whether string X begins with Y

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_starts_with" class="funcsynopsis">

|                          |                       |
|--------------------------|-----------------------|
| ` `**`starts_with`**` (` | in `str ` string ,    |
|                          | in `sub ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_starts_with" class="refsect1">

## Description

`starts_with ` checks whether string X begins with Y, ignoring
occurencies of Y in other places. Returns 1 or 0.

</div>

<div id="params_starts_with" class="refsect1">

## Parameters

<div id="id113203" class="refsect2">

### str

String to search from.

</div>

<div id="id113206" class="refsect2">

### sub

Substring to search for.

</div>

</div>

<div id="ret_starts_with" class="refsect1">

## Return Types

1 if found, 0 if not found.

</div>

<div id="examples_starts_with" class="refsect1">

## Examples

<div id="ex_starts_with" class="example">

**Example 24.416. Simple example**

<div class="example-contents">

``` programlisting
SQL> select starts_with('AbracadabrA','Abr');
starts_with
INTEGER
_______________________________________________________________________________

1

1 Rows. -- 0 msec.
```

</div>

</div>

  

</div>

<div id="seealso_starts_with" class="refsect1">

## See Also

<a href="fn_strcasestr.html" class="link" title="strcasestr"><code
class="function">strcasestr </code></a> .

<a href="fn_strcontains.html" class="link" title="strcontains"><code
class="function">strcontains </code></a> .

<a href="fn_ends_with.html" class="link" title="ends_with"><code
class="function">end_with </code></a> .

</div>

</div>
