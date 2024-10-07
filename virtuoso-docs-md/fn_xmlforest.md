<div id="fn_xmlforest" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

XMLFOREST — Produces a forest of XML elements

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xmlforest" class="funcsynopsis">

|                        |                                          |
|------------------------|------------------------------------------|
| ` `**`XMLFOREST`**` (` | `string_expr1 [AS alias1] ` varchar ,    |
|                        | `string_expr2 [AS alias2] ` varchar ,    |
|                        | `... ` ,                                 |
|                        | `string_exprN [AS aliasN] ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xmlforest" class="refsect1">

## Description

`XMLFOREST ` produces a forest of XML elements from the given list of
arguments. The arguments may be string expressions with optional
aliases. If string expression is a column name, then you can omit the AS
clause, and Virtuoso uses the partially escaped form of the column name
as the name of the enclosing tag. If the expression evaluates to NULL,
then no element is created for that expression. If none of the element
is created, then the function returns NULL.

</div>

<div id="xmlforest" class="refsect1">

## Parameters

<div id="id122382" class="refsect2">

### string_exprI \[AS aliasI\]

string value; AS clause is mandatory if the argument is not a column
name but an expression of some other sort.

</div>

</div>

<div id="errors_xmlforest" class="refsect1">

## Errors

<div id="id122387" class="table">

**Table 24.129. Errors signalled by `XMLFOREST `**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                    | Description                                                           |
|---------------------------------------|---------------------------------------|-------------------------------------------------------------------------------|-----------------------------------------------------------------------|
| <span class="errorcode">37000 </span> | <span class="errorcode">SQ074 </span> | <span class="errortext">The special SQL function has invalid argument </span> | An argument is neither a column name nor an expression with an alias. |

</div>

</div>

  

</div>

<div id="xmlforest_01" class="refsect1">

## Examples

<div id="ex_xmlforest" class="example">

**Example 24.503. XMLFOREST() with five parameters.**

<div class="example-contents">

The following example produces five (or four) elements ('FName',
'LName', 'str', 'Title', and 'Region' - if there is a value) from the
string expressions 'FirstName', 'LastName', 'string', 'Title', and
'Region', concatenates the elements produced for each employee, and
produces one row for each employee in the result set.

``` screen
select XMLFOREST (
  "FirstName" as "FName", "LastName" as "LName",
  'string' as "str", "Title", "Region" )
from "Demo"."demo"."Employees";
callret
VARCHAR
_______________________________________________________________________________

<FName>Nancy</FName>
<LName>Davolio</LName>
<str>string</str>
<Title>Sales Representative</Title>
<Region>WA</Region>

. . .

<FName>Anne</FName>
<LName>Dodsworth</LName>
<str>string</str>
<Title>Sales Representative</Title>

9 Rows.
       
```

The following example always produces five elements: empty 'Region'
element is created for NULL values. Note the difference in the last rows
of this and the previous query results:

``` screen
select XMLFOREST (
  "FirstName" as "FName", "LastName" as "LName",
  'string' as "str", "Title", coalesce ("Region", '') as "Region")
from "Demo"."demo"."Employees";
callret
VARCHAR
_______________________________________________________________________________

<FName>Nancy</FName>
<LName>Davolio</LName>
<str>string</str>
<Title>Sales Representative</Title>
<Region>WA</Region>

. . .

<FName>Anne</FName>
<LName>Dodsworth</LName>
<str>string</str>
<Title>Sales Representative</Title>
<Region></Region>

9 Rows.
```

</div>

</div>

  

</div>

<div id="seealso_xmlforest" class="refsect1">

## See Also

<a href="fn_xmlelement.html" class="link"
title="XMLELEMENT">XMLELEMENT()</a>

<a href="fn_xmlattributes.html" class="link"
title="XMLATTRIBUTES">XMLATTRIBUTES()</a>

<a href="fn_xmlagg.html" class="link" title="XMLAGG">XMLAGG()</a>

<a href="fn_xmlconcat.html" class="link"
title="XMLCONCAT">XMLCONCAT()</a>

</div>

</div>
