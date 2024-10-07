<div id="xpf_let" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

let — Creates temporary variables and calculates an expression that uses
these variables

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_let" class="funcsynopsis">

|                     |                         |
|---------------------|-------------------------|
| `any `**`let`**` (` | `var1name ` string ,    |
|                     | `var1value ` sequence , |
|                     | `var2name ` string ,    |
|                     | `var2value ` sequence , |
|                     | `... ` ,                |
|                     | `varNname ` string ,    |
|                     | `varNvalue ` sequence , |
|                     | `retval ` any `)`;      |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_let" class="refsect1">

## Description

For every pair of arguments, the function calculates values of these
arguments and then creates a new temporary local variable whose name is
the string value of the first argument in pair and the value assigned is
the value of the second argument in pair. Obviously, the argument for
variable name is usually a constant string of alphanumeric characters.
The expression for a value of variable number I may refer to variables
created during steps 1 to I-1. When all pairs of arguments are turned
into temporary variables, the last argument is calculated and its value
is returned as the value of the whole expression.

Temporary variables are destroyed on return.

This function is used in the implementation of "LET" control operator in
XQUERY, so you will probably use that operator in XQUERY expressions,
not the function. This function may be useful in XPATH expressions and
in XSLT stylesheets. It is not a part of library of standard XQUERY 1.0
functions.

</div>

<div id="xpf_params_let" class="refsect1">

## Parameters

<div id="id127989" class="refsect2">

### varIname

Expression for the name for the I-th temporary variable

</div>

<div id="id127992" class="refsect2">

### varIvalue

Expression for the value for the I-th temporary variable

</div>

<div id="id127995" class="refsect2">

### retval

Expression for the value to be returned

</div>

</div>

<div id="xpf_ret_let" class="refsect1">

## Return Types

Any, depending on the type of *`retval `* expression.

</div>

<div id="xpf_errors_let" class="refsect1">

## Errors

<div id="id128004" class="table">

**Table 24.147. Errors signalled by let()**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                                      | Description                                                                                                                              |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">42000 </span> | <span class="errorcode">XPF02 </span> | <span class="errortext">Wrong number of arguments for XPATH function let(), maybe internal XQuery error </span> | The function should have odd number of arguments: even number of arguments that describe variables plus one for the returned expression. |

</div>

</div>

  

</div>

<div id="xpf_examples_let" class="refsect1">

## Examples

<div id="xpf_ex_let" class="example">

**Example 24.598. **

<div class="example-contents">

These two expressions are equivalent, but first may be used in any XPATH
while second is written in XQUERY syntax

``` screen
let('baseprice', /item/price, 'discount', 0.20, $baseprice * (1.0 - $discount))
LET  $baseprice := /item/price, $discount := 0.20 RETURN $baseprice * (1.0 - $discount)
```

</div>

</div>

  

</div>

<div id="xpf_seealso_let" class="refsect1">

## See Also

<a href="xpf_for.html" class="link" title="for">for()</a>

</div>

</div>
