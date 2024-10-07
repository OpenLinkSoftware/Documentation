<div id="xpf_every" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

every — Returns true if all items of given sequence matches given
criterion.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_every" class="funcsynopsis">

|                           |                           |
|---------------------------|---------------------------|
| `boolean `**`every`**` (` | `varname ` string ,       |
|                           | `test_set ` sequence ,    |
|                           | `test_expn ` boolean `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_every" class="refsect1">

## Description

The function creates a temporary local variable, whose name is specified
by *`varname`* argument. Then, for every item of *`test_set`* sequence
it calculates the *`test_expn`* boolean expression having set the
created variable to that "current" item. If the value of expression is
false, the function immediately returns false without processing the
rest of *`test_set`* sequence. If all items of the sequence are probed
without getting false, true is returned. (So if the sequence is empty,
the function returns true).

In any case, temporary variable is destroyed on return.

This function is used in the implementation of "EVERY" logical operator
in XQUERY, so you will probably use that operator in XQUERY expressions,
not the function. This function may be useful in XPATH expressions and
in XSLT stylesheets. It is not a part of library of standard XQUERY 1.0
functions.

</div>

<div id="xpf_params_every" class="refsect1">

## Parameters

<div id="id127163" class="refsect2">

### varname

Name of temporary variable

</div>

<div id="id127166" class="refsect2">

### test_set

Sequence of items; these items will be tested by *`test_expn `*

</div>

<div id="id127170" class="refsect2">

### test_expn

Boolean expression which should be calculated for items of *`test_set `*
.

</div>

</div>

<div id="xpf_ret_every" class="refsect1">

## Return Types

Boolean

</div>

<div id="xpf_examples_every" class="refsect1">

## Examples

<div id="xpf_ex_every" class="example">

**Example 24.585. **

<div class="example-contents">

This expression returns true if all reports have positive incomes
recorded.

``` screen
every('income_value', /report/income, $income_value > 0)
```

</div>

</div>

  

</div>

<div id="xpf_seealso_every" class="refsect1">

## See Also

<a href="xpf_some.html" class="link" title="some">some()</a>

</div>

</div>
