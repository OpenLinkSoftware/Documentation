<div>

<div>

</div>

<div>

## Name

processXQuery — Calls an XQuery module from XPath expression, e.g. from
some XSLT or BPEL code.

</div>

<div>

## Synopsis

<div>

|                               |                           |
|-------------------------------|---------------------------|
| `any `**`processXQuery`**` (` | `module_uri ` string ,    |
|                               | `context ` entity ,       |
|                               | `index ` integer ,        |
|                               | `param1_name ` string ,   |
|                               | `param1_value ` any ... , |
|                               | `paramN_name` string,     |
|                               | `paramN_value` any`)`;    |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function takes a URI of an XQuery module and an XML entity and
calls the module with the entity as a context. Depending on value of
*`index`* parameter, either the result of the module is returned 'as is'
or the sequence of results is returned.

Parameters can be passed to the module by specifying additional
arguments to `processXQuery()` . The names of parameters should appear
in argument list without the leading '\$' sign. Unlike
<a href="fn_xquery_eval.html" class="link" title="xquery_eval"><code
class="function">xquery_eval()</code></a> function, parameter can not be
ignored depending on the type of its value. If the same name appears
more than once in the vector, the last name/value pair is used and all
preceding pairs with this name are silently ignored. Obviously, names
should be strings that are valid XPath variable names.

The XQuery standard does not offer a way of calling of a module from
other XQuery expression. The reason is that there's no need for such
calling if the code is designed properly. If an expression is re-used in
various places then it should be turned into a function and placed into
an XQuery library module; one should import the module and call the
function instead of calling a non-library module. It is possible to use
`processXQuery()` in XQuery expressions but it is much better to use
library modules instead, and to use `processXQuery()` only for tricks in
XPATH expressions.

For compatibility, the `processXQuery()` function can also be called as
`http://schemas.oracle.com/xpath/extension:processXQuery()` .

</div>

<div>

## Parameters

<div>

### module_uri

URI pointing to the location of an XQuery module. It can be absolute or
relative. A relative <span class="emphasis">*module_uri*</span> should
be resolved before use, this requires base URI information. Base URI can
be declared explicitly by "\_\_base_uri" parameter in XPATH or "declare
base-uri" setter in XQuery. If not declared but the expression is a part
of some stylesheet or XQuery module then the URI of module is used as a
base URI. A run-time error is signalled if the URI is relative and the
expression does not contain explicit declaration and the expression is
neither in a stylesheet nor in a module.

</div>

<div>

### index

Result index. If omitted a value of 1 is assumed, meaning only the first
result is returned. If a value of 0 is supplied then a (flatten)
sequence of all results is returned. (Note that if a non-zero value is
specified then the returned value still can be a sequence).

</div>

<div>

### context

XML entity that is the context node of module call. If the function is
called with only one argument then the current context node of the
`processXQuery()` call is used as a context of module call. (In any
case, context size and context position of module call are always set to
1 and not inherited from call of `processXQuery()` .)

</div>

<div>

### paramI_name

Name of parameter to be passed to the XSLT engine for use in the
transformation.

</div>

<div>

### paramI_value

Value of parameter with name specified by *`paramI_name `* .

</div>

</div>

<div>

## Return Types

The type of return value depends on type of value returned by module.

</div>

<div>

## Examples

<div>

**Example 24.611. Call of XQuery in XSLT**

<div>

Sample templates put the result of the call of module "mymodule.xq" for
context node into the resulting document. This assumes that both the
stylesheet and XQuery module "mymodule.xq" reside in the same directory
so relative a URI "mymodule.xq" can be resolved using the URI of the
stylesheet as base URI.

``` screen

  <xsl:template match="myelement">
  <xsl:copy-of select="processXQuery('mymodule.xq')"/>
</xsl:template>
      
```

This is equivalent with the following template:

``` screen

  <xsl:template match="myelement">
  <xsl:copy-of select="processXQuery('mymodule.xq', current(), 1)"/>
</xsl:template>
      
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xquery_eval.html" class="link" title="xquery_eval"><code
class="function">xquery_eval() </code></a>

<a href="xpf_processxslt.html" class="link" title="processXSLT"><code
class="function">processXSLT() </code></a>

<a href="xpf_processxsql.html" class="link" title="processXSQL"><code
class="function">processXSQL() </code></a>

</div>

</div>
