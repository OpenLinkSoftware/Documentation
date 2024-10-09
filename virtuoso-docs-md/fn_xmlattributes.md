<div>

<div>

</div>

<div>

## Name

XMLATTRIBUTES — Creates a list of attributes and their values

</div>

<div>

## Synopsis

<div>

|                            |                                          |
|----------------------------|------------------------------------------|
| ` `**`XMLATTRIBUTES`**` (` | `string_expr1 [AS alias1] ` varchar ,    |
|                            | `string_expr2 [AS alias2] ` varchar ,    |
|                            | `... ` ,                                 |
|                            | `string_exprN [AS aliasN] ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function creates a vector that may be used only as argument of
`XMLELEMENT` function. The vector has an even number of elements, each
odd element is a name of an attribute, an even element is its value. If
the attribute value is NULL, then no attribute and no value is created.
If none of the attribute is created, then the function returns NULL. If
string_expr is a column name, then you can omit the AS clause, and
Virtuoso uses the partially escaped form of the column name as the
attribute name.

</div>

<div>

## Parameters

<div>

### String_exprI \[AS aliasI\]

string value; AS clause is mandatory if it is not a column name but an
expression of some other sort.

</div>

</div>

<div>

## Examples

<div>

**Example 24.496. XMLATTRIBUTES() with two parameters**

<div>

The following example produces an 'EmpName' elements with two attributes
(if value of the column 'Region' is not NULL) or with one attribute (if
value of the column 'Region' is NULL)

``` screen
select XMLELEMENT ("EmpName",
                    XMLATTRIBUTES ("FirstName" || ' ' || "LastName" as "Name", "Region" ))
  from "Demo"."demo"."Employees";
callret
VARCHAR
_______________________________________________________________________________
<EmpName Name="Nancy Davolio" Region="WA" />
<EmpName Name="Andrew Fuller" Region="WA" />
<EmpName Name="Janet Leverling" Region="WA" />
<EmpName Name="Margaret Peacock" Region="WA" />
<EmpName Name="Steven Buchanan" />
<EmpName Name="Michael Suyama" />
<EmpName Name="Robert King" />
<EmpName Name="Laura Callahan" Region="WA" />
<EmpName Name="Anne Dodsworth" />

9 Rows. 
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xmlelement.html" class="link"
title="XMLELEMENT">XMLELEMENT()</a>

<a href="fn_xmlforest.html" class="link"
title="XMLFOREST">XMLFOREST()</a>

<a href="fn_xmlagg.html" class="link" title="XMLAGG">XMLAGG()</a>

<a href="fn_xmlconcat.html" class="link"
title="XMLCONCAT">XMLCONCAT()</a>

</div>

</div>
