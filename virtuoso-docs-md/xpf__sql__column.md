<div id="xpf__sql__column" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sql:column — Returns the value of a column from SQL result-set.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn__sql__column" class="funcsynopsis">

|                            |                                      |
|----------------------------|--------------------------------------|
| `any `**`sql:column`**` (` | constant `column_name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc__sql__column" class="refsect1">

## Description

This is actually not a function but a special macro that is converted to
a reference to a global parameter.

</div>

<div id="xpf_params__sql__column" class="refsect1">

## Parameters

<div id="id125915" class="refsect2">

### column_name

A string constant (literal, not an expression) that is a column name in
plain SQL syntax. It can be a column name (and it can be qualified to
specify a table name or an alias name). It can be a name of a
Virtuoso/PL variable.

The string should not contain quotes around parts of the column name.

</div>

</div>

<div id="xpf_ret__sql__column" class="refsect1">

## Return Types

The value of the sql:column() invocation is the value of some SQL column
or variable. If the type of the value is not supported by XQuery
interpreter then it will be converted according to generic rules for
XQuery parameters.

</div>

<div id="xpf_examples__sql__column" class="refsect1">

## Examples

<div id="xpf_ex__sql__column" class="example">

**Example 24.561. Various invocations of sql:column**

<div class="example-contents">

These two statements will produce identical results:

``` screen
```

</div>

</div>

  

</div>

<div id="xpf_seealso__sql__column" class="refsect1">

## See Also

<a href="xq_precompilation.html" class="link"
title="15.8.3. Pre-compilation of XPath and XQuery Expressions">Pre-compilation
of XPath and XQuery Expressions</a>

</div>

</div>
