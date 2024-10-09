<div>

<div>

</div>

<div>

## Name

XMLCONCAT — Creates a forest of elements by concatenating a list of XML
values

</div>

<div>

## Synopsis

<div>

|                        |                             |
|------------------------|-----------------------------|
| ` `**`XMLCONCAT`**` (` | `value_expr1 ` varchar ,    |
|                        | `value_expr2 ` varchar ,    |
|                        | `... ` ,                    |
|                        | `value_exprN ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`XMLCONCAT ` accepts a list of XML value expressions as its arguments,
and produces a forest of elements by concatenating the XML values that
are returned from the same row to make one value. `XMLCONCAT` works like
`XMLFOREST` , except that `XMLCONCAT` parameters is a list of XML
elements. Null expressions are dropped from the result. If all the value
expressions are null, then the function returns NULL.

</div>

<div>

## Parameters

<div>

### value_expr1

a vector returned by `XMLELEMENT ` , `XMLFOREST ` , or `XMLCONCAT`
functions, or an entity object returned by corresponding functions (e.g.
`xtree_doc` , `xquery_eval` or `path_eval` ). In the latter case the
entity object must not be an attribute.

</div>

</div>

<div>

## Errors

<div>

**Table 24.126. Errors signalled by `XMLCONCAT `**

<div>

| SQLState                              | Error Code                            | Error Text                                                      | Description                                                           |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------|-----------------------------------------------------------------------|
| <span class="errorcode">22003 </span> | <span class="errorcode">SR355 </span> | <span class="errortext">Too few arguments for XMLCONCAT </span> | There must be at least one argument                                   |
| <span class="errorcode">22003 </span> | <span class="errorcode">SR359 </span> | Invalid argument type NVARCHAR (225) for arg N to XMLCONCAT     | The entity object returned by `xpath_eval ` must not be an attribute  |
| <span class="errorcode">22003 </span> | <span class="errorcode">SR360 </span> | XMLCONCAT doesn't concatenate attributes                        | The entity object returned by `xquery_eval ` must not be an attribute |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.499. XMLCONCAT() with two parameters**

<div>

The following example produces an XML elements for the 'FName', 'LName',
'country' and 'nationality', concatenates the result, and creates a
one-column result set:

``` screen
select XMLCONCAT (
        XMLELEMENT ('FName', "FirstName"),
        XMLELEMENT ('LName', "LastName"),
        xquery_eval('//country', xtree_doc('<a><country>USA</country></a>')),
        xpath_eval('//nationality', xtree_doc('<a><nationality>RUSSIAN</nationality></a>')))
from "Demo"."demo"."Employees";

callret
VARCHAR
_______________________________________________________________________________
<FName>Nancy</FName><LName>Davolio</LName><country>USA</country><nationality>RUSSIAN</nationality>
<FName>Andrew</FName><LName>Fuller</LName><country>USA</country><nationality>RUSSIAN</nationality>

. . .

<FName>Anne</FName><LName>Dodsworth</LName><country>USA</country><nationality>RUSSIAN</nationality>
9 Rows.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xmlagg.html" class="link" title="XMLAGG">XMLAGG()</a>

<a href="fn_xmlattributes.html" class="link"
title="XMLATTRIBUTES">XMLATTRIBUTES()</a>

<a href="fn_xmlelement.html" class="link"
title="XMLELEMENT">XMLELEMENT()</a>

<a href="fn_xmlforest.html" class="link"
title="XMLFOREST">XMLFOREST()</a>

</div>

</div>
