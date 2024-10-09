<div>

<div>

</div>

<div>

## Name

sql:column — Returns the value of a column from SQL result-set.

</div>

<div>

## Synopsis

<div>

|                            |                                      |
|----------------------------|--------------------------------------|
| `any `**`sql:column`**` (` | constant `column_name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This is actually not a function but a special macro that is converted to
a reference to a global parameter.

</div>

<div>

## Parameters

<div>

### column_name

A string constant (literal, not an expression) that is a column name in
plain SQL syntax. It can be a column name (and it can be qualified to
specify a table name or an alias name). It can be a name of a
Virtuoso/PL variable.

The string should not contain quotes around parts of the column name.

</div>

</div>

<div>

## Return Types

The value of the sql:column() invocation is the value of some SQL column
or variable. If the type of the value is not supported by XQuery
interpreter then it will be converted according to generic rules for
XQuery parameters.

</div>

<div>

## Examples

<div>

**Example 24.561. Various invocations of sql:column**

<div>

These two statements will produce identical results:

``` screen
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xq_precompilation.html" class="link"
title="15.8.3. Pre-compilation of XPath and XQuery Expressions">Pre-compilation
of XPath and XQuery Expressions</a>

</div>

</div>
