<div id="xpf_or" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

or — Returns true if a value of some argument is true, otherwise returns
false.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_or" class="funcsynopsis">

|                        |                      |
|------------------------|----------------------|
| `boolean `**`or`**` (` | `val1 ` boolean ,    |
|                        | `val2 ` boolean ,    |
|                        | `... ` ,             |
|                        | `valN ` boolean `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_or" class="refsect1">

## Description

This function calculates values of its arguments, from left to right. If
the value of calculated parameter is true, the function returns true
immediately, without calculating of the remaining parameters. If the
list of arguments ends without any true value calculated, the function
returns false (Thus it returns true when called without arguments).

The name of this function is the same as name of "or" XPATH and XQUERY
operator. Thus it must be surrounded by double quotes when used in XPATH
or XQUERY expressions. Moreover, this function is not a part of XPATH
standard, so it cannot be used if portability is important.

</div>

<div id="xpf_params_or" class="refsect1">

## Parameters

<div id="id128453" class="refsect2">

### valI

Value of boolean expression argument

</div>

</div>

<div id="xpf_ret_or" class="refsect1">

## Return Types

boolean

</div>

<div id="xpf_examples_or" class="refsect1">

## Examples

<div id="xpf_ex_and_01" class="example">

**Example 24.608. Control over sequence of search operations**

<div class="example-contents">

If two conditions must be checked, where one is simple and another is
hard to calculate, then "and" may be used to calculate second condition
only if first is false, to reduce average time of processing

``` screen
"or" ( empty(authors),
  document(concat('http://www.lib20.org/findxml.cgi?isbn=',@isbn))/status[@outofprint='YES'] )
```

</div>

</div>

  

</div>

<div id="xpf_seealso_or" class="refsect1">

## See Also

<a href="xpf_not.html" class="link" title="not">not</a>
<a href="xpf_and.html" class="link" title="and">and</a>
<a href="xpf_some.html" class="link" title="some">some</a>

</div>

</div>
