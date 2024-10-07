<div id="xpf_some" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

some — Returns true if at least one item of given sequence matches given
criterion.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_some" class="funcsynopsis">

|                          |                           |
|--------------------------|---------------------------|
| `boolean `**`some`**` (` | `varname ` string ,       |
|                          | `test_set ` sequence ,    |
|                          | `test_expn ` boolean `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_some" class="refsect1">

## Description

The function creates a temporary local variable, whose name is specified
by *`varname`* argument. Then, for every item of *`test_set`* sequence
it calculates the *`test_expn`* boolean expression having set the
created variable to that "current" item. If the value of expression is
true, the function immediately returns true without processing the rest
of *`test_set`* sequence. If all items of the sequence are probed
without getting true, false is returned. (So if the sequence is empty,
the function returns false).

In any case, temporary variable is destroyed on return.

This function is used in the implementation of "SOME" logical operator
in XQUERY, so you will probably use that operator in XQUERY expressions,
not the function. This function may be useful in XPATH expressions and
in XSLT stylesheets. It is not a part of library of standard XQUERY 1.0
functions.

</div>

<div id="xpf_params_some" class="refsect1">

## Parameters

<div id="id129017" class="refsect2">

### varname

Name of temporary variable

</div>

<div id="id129020" class="refsect2">

### test_set

Sequence of items; these items will be tested by *`test_expn `*

</div>

<div id="id129024" class="refsect2">

### test_expn

Boolean expression which should be calculated for items of *`test_set `*
.

</div>

</div>

<div id="xpf_ret_some" class="refsect1">

## Return Types

Boolean

</div>

<div id="xpf_examples_some" class="refsect1">

## Examples

<div id="xpf_ex_some" class="example">

**Example 24.619. **

<div class="example-contents">

This expression returns true if some reports have zero incomes recorded.

``` screen
some('income_value', /report/income, $income_value = 0)
```

</div>

</div>

  

</div>

<div id="xpf_seealso_some" class="refsect1">

## See Also

<a href="xpf_every.html" class="link" title="every">every()</a>

</div>

</div>
