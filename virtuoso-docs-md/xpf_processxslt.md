<div>

<div>

</div>

<div>

## Name

processXSLT — Applies stylesheet to given XML entity and returns the
result.

</div>

<div>

## Synopsis

<div>

|                                |                            |
|--------------------------------|----------------------------|
| `entity `**`processXSLT`**` (` | `stylesheet_uri ` string , |
|                                | `source ` entity ,         |
|                                | `param1_name ` string ,    |
|                                | `param1_value ` any ... ,  |
|                                | `paramN_name` string,      |
|                                | `paramN_value` any`)`;     |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function takes the URI of a stylesheet and an XML entity and
produces an XML entity representing the transformation result of the
given entity with the given stylesheet. The result tree is separate from
the argument tree and the only reference to it is the returned entity.
Errors occurring in the transformation will be signalled as SQL states,
with XML or XSLT specific conditions beginning with XS or XP.

The stylesheet is applied to the value of *`source`* parameter.
Obviously, *`source`* must be an entity. If *`source`* is not specified
then the stylesheet is applied to the current entity.

Parameters can be passed to the stylesheet by specifying additional
arguments to `processXSLT()` . The values can be referenced from inside
XPath expressions in the stylesheet. The names of parameters should
appear in argument list without the leading '\$' sign. Unlike
<a href="fn_xslt.html" class="link" title="xslt"><code
class="function">xslt()</code></a> function, parameter can not be
ignored depending on the type of its value. If the same name appears
more than once in the vector, the last name/value pair is used and all
preceding pairs with this name are silently ignored. Obviously, names
should be strings that are valid XPath variable names.

The function uses the cache of compiled stylesheets, see description of
<a href="fn_xslt.html" class="link" title="xslt"><code
class="function">xslt()</code></a> Virtuoso/PL function for more
details.

For compatibility, the `processXSLT()` function can also be called as
`http://schemas.oracle.com/xpath/extension:processXSLT()` .

</div>

<div>

## Parameters

<div>

### stylesheet_uri

URI pointing to the location of an XSL stylesheet. It can be absolute or
relative. A relative <span class="emphasis">*stylesheet_uri*</span>
should be resolved before use, this requires base URI information. The
base URI can be declared explicitly with the "\_\_base_uri" parameter in
XPATH or "declare base-uri" setter in XQuery. If not declared but the
expression is a part of some stylesheet or XQuery module then the URI of
module is used as a base URI. A run-time error is signalled if the URI
is relative and the expression does not contain explicit declaration and
the expression is neither in a stylesheet nor in a module.

</div>

<div>

### source

XML entity that is the source of XSL transformation. If the function is
called with only one argument then the context node is used as a source.

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

The function returns an XML entity that is the root entity of the
resulting document of an XSL transformation.

</div>

<div>

## Examples

<div>

**Example 24.612. XSLT inside XQuery expression**

<div>

The query composes a single document that contain a list of labels for
parcels. Depending on destination country and the state value of the
parcel, the query applies one of three stylesheets that make a label
from the address data; the query makes a label from every item of
sequence \$orders.

``` screen
<parcel-labels>
for $order in $orders let $customer := $customers/customer [ @CustId = $order/@CustId ] return
  if ($customer/address/@Country = "US")
    if ($order/sum >= 50.0)
      processXSLT ("file://registered-parcel.xsl", $customer/address, "value", $order/sum)
    else
      processXSLT ("file://plain-parcel.xsl", $customer/address)
  else
    processXSLT ("file://foreign-parcel.xsl", $customer/address, "value", $order/sum)
</parcel-labels>
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xslt.html" class="link" title="xslt"><code
class="function">xslt() </code></a>

<a href="xpf_processxquery.html" class="link"
title="processXQuery"><code class="function">processXQuery() </code></a>

<a href="xpf_processxsql.html" class="link" title="processXSQL"><code
class="function">processXSQL() </code></a>

</div>

</div>
