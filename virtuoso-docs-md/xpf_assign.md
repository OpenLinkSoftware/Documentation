<div>

<div>

</div>

<div>

## Name

assign — Creates a local variable and assign a value to it.

</div>

<div>

## Synopsis

<div>

|                         |                       |
|-------------------------|-----------------------|
| `null `**`assign`**` (` | `var_name ` string ,  |
|                         | `var_value ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function calculates the first argument, *`var_name`* , and converts
it to the string, if needed. Then it checks if there is a local variable
or parameter with such name. If not found, it checks if there is a
global variable or parameter with such name. If nothing found in both
cases, a new local variable is created with this name. The the value of
found or created variable is changed to the value of the second
argument, *`var_value`* .

The value of the variable may be accessed like the value of any variable
created by \<xsl:variable\> XSL element or FLWR operator of XQUERY. The
same \$name should be used to get the value.

In XSLT, common rules for local variables are used for variables created
by assign() function.

This function is not a part of XPATH 1.0 or XQUERY 1.0 libraries of
standard functions. It may produce strange results if used in XQUERY
expressions in order to change the value of local variable created by
FLWR expression. It may cause infinite loop if used in XSLT expressions
in order to change the value of a variable used in currently executed
\<xsl:apply-templates\> instruction. For both safety and portability, it
is much better to use \<xsl:variable\> and \<xsl:param\> XSL elements in
stylesheets or LET operator in XQUERY expressions. In addition, let()
function is not portable, but it may be used in XPATH or XSLT without
the risk of undesired effects.

</div>

<div>

## Parameters

<div>

### var_name

The name of variable which must be found or created.

</div>

<div>

### var_value

The value which should be assigned to the variable.

</div>

</div>

<div>

## Return Types

Null

</div>

<div>

## Examples

<div>

**Example 24.564. **

<div>

Increment local variable \$counter by 1.

``` screen
    assign('counter', $counter+1);
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_let.html" class="link" title="let">let()</a>

</div>

</div>
