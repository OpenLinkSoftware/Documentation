<div>

<div>

</div>

<div>

## Name

every — Returns true if all items of given sequence matches given
criterion.

</div>

<div>

## Synopsis

<div>

|                           |                           |
|---------------------------|---------------------------|
| `boolean `**`every`**` (` | `varname ` string ,       |
|                           | `test_set ` sequence ,    |
|                           | `test_expn ` boolean `)`; |

<div>

 

</div>

</div>

</div>

<div>

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

<div>

## Parameters

<div>

### varname

Name of temporary variable

</div>

<div>

### test_set

Sequence of items; these items will be tested by *`test_expn `*

</div>

<div>

### test_expn

Boolean expression which should be calculated for items of *`test_set `*
.

</div>

</div>

<div>

## Return Types

Boolean

</div>

<div>

## Examples

<div>

**Example 24.585. **

<div>

This expression returns true if all reports have positive incomes
recorded.

``` screen
every('income_value', /report/income, $income_value > 0)
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_some.html" class="link" title="some">some()</a>

</div>

</div>
