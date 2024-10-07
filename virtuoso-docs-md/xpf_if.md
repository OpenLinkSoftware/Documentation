<div id="xpf_if" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

if — If the boolean value is true then calculates one expression,
otherwise calculates another expression.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_if" class="funcsynopsis">

|                    |                         |
|--------------------|-------------------------|
| `any `**`if`**` (` | `test ` boolean ,       |
|                    | `then_branch ` any ,    |
|                    | `else_branch ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_if" class="refsect1">

## Description

This function calculates the value of *`test`* argument. If the value is
true, the function calculates the *`then_branch`* expression and returns
its value. If the value is false, the function calculates the
*`else_branch`* expression and returns its value.

Note that unlike other programming languages, *`else_branch`* is
required argument, not optional.

This function is used in the implementation of "IF" control operator in
XQUERY, so you will probably use that operator in XQUERY expressions,
not the function. This function may be useful in XPATH expressions and
in XSLT stylesheets. It is not a part of library of standard XQUERY 1.0
functions.

</div>

<div id="xpf_params_if" class="refsect1">

## Parameters

<div id="id127656" class="refsect2">

### test

Boolean value used to choose an expression to execute

</div>

<div id="id127659" class="refsect2">

### then_branch

Expression which is calculated if *`test `* argument is true

</div>

<div id="id127663" class="refsect2">

### else_branch

Expression which is calculated if *`test `* argument is false

</div>

</div>

<div id="xpf_ret_if" class="refsect1">

## Return Types

Any

</div>

<div id="xpf_examples_if" class="refsect1">

## Examples

<div id="xpf_ex_if" class="example">

**Example 24.593. **

<div class="example-contents">

These two expressions are equivalent, but first may be used in any XPATH
while second is written in XQUERY syntax:

``` screen
if (2 * 2 = 4, 'I think so', 'Unbelievable!')
IF 2 * 2 = 4 THEN 'I think so' ELSE 'Unbelievable!'
```

</div>

</div>

  

</div>

<div id="xpf_seealso_if" class="refsect1">

## See Also

<a href="xpf_and.html" class="link" title="and">and()</a>
<a href="xpf_or.html" class="link" title="or">or()</a>

</div>

</div>
