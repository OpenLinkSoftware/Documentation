<div>

<div>

</div>

<div>

## Name

if — If the boolean value is true then calculates one expression,
otherwise calculates another expression.

</div>

<div>

## Synopsis

<div>

|                    |                         |
|--------------------|-------------------------|
| `any `**`if`**` (` | `test ` boolean ,       |
|                    | `then_branch ` any ,    |
|                    | `else_branch ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

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

<div>

## Parameters

<div>

### test

Boolean value used to choose an expression to execute

</div>

<div>

### then_branch

Expression which is calculated if *`test `* argument is true

</div>

<div>

### else_branch

Expression which is calculated if *`test `* argument is false

</div>

</div>

<div>

## Return Types

Any

</div>

<div>

## Examples

<div>

**Example 24.593. **

<div>

These two expressions are equivalent, but first may be used in any XPATH
while second is written in XQUERY syntax:

``` screen
if (2 * 2 = 4, 'I think so', 'Unbelievable!')
IF 2 * 2 = 4 THEN 'I think so' ELSE 'Unbelievable!'
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_and.html" class="link" title="and">and()</a>
<a href="xpf_or.html" class="link" title="or">or()</a>

</div>

</div>
