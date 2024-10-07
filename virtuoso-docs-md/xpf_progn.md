<div id="xpf_progn" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

progn — Calculates all given expressions and returns the result produced
by the last one.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_progn" class="funcsynopsis">

|                       |                   |
|-----------------------|-------------------|
| `any `**`progn`**` (` | `expn1 ` any ,    |
|                       | `expn2 ` any ,    |
|                       | ... ,             |
|                       | `expnN ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_progn" class="refsect1">

## Description

This function calculates its first argument, then second argument and so
on. The results of these calculations are not used, except the result of
the last expression which is returned. The only useful application for
this function is calling XPath extension functions for side effects.

This function is not a part of library of standard XQuery 1.0 functions.

</div>

<div id="xpf_params_progn" class="refsect1">

## Parameters

<div id="id128735" class="refsect2">

### expn1, expn2, ... expnN

Expressions to be calculated.

</div>

</div>

<div id="xpf_ret_progn" class="refsect1">

## Return Types

Any (according to the type of *`expnN `* )

</div>

<div id="xpf_examples_progn" class="refsect1">

## Examples

<div id="xpf_ex_progn" class="example">

**Example 24.614. **

<div class="example-contents">

``` screen
[xmlns:fileio='http://www.example.com/file-io']
if (function-available ('fileio:printf'),
  progn (
    fileio:open('greeting.txt', 'wt'),
    fileio:printf('Hello %s', /userinfo/name),
    fileio:close(),
    'File greeting.txt saved' ),
  'File greeting.txt not saved' ) )
```

</div>

</div>

  

</div>

<div id="xpf_seealso_progn" class="refsect1">

## See Also

<a href="xpf_if.html" class="link" title="if">if</a>

<a href="xpf_for.html" class="link" title="for">for</a>

<a href="xpf_let.html" class="link" title="let">let</a>

</div>

</div>
