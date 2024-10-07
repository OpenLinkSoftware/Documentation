<div id="fn_xmlelement" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

XMLELEMENT — Creates XML element

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xmlelement" class="funcsynopsis">

|                         |                                  |
|-------------------------|----------------------------------|
| ` `**`XMLELEMENT`**` (` | `tag_name ` varchar ,            |
|                         | `list_of_attributes ` sequence , |
|                         | `child_or_attribute1 ` any ,     |
|                         | `child_or_attribute2 ` any ,     |
|                         | `... ` ,                         |
|                         | `child_or_attributeN ` any `)`;  |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xmlelement" class="refsect1">

## Description

`XMLELEMENT ` takes an element name for identifier, an optional
collection of attributes for the element, and arguments that make up the
element's content. It returns a XML element. The second parameter may be
omitted and at that time the rest parameters may be present. If one of
the arguments is a call of the `xpath_eval` returning an attribute
value, then this value would be added to element's content (not to
element's attributes).

</div>

<div id="xmlelement" class="refsect1">

## Parameters

<div id="id122293" class="refsect2">

### tag_name

name of the element, it must be valid XML element name

</div>

<div id="id122296" class="refsect2">

### list_of_attributes

a vector returned by `XMLATTRIBUTES ` function. If the vector is NULL,
then no attribute is created.

</div>

<div id="id122300" class="refsect2">

### child_or_attributeI

a string, or name of a column, or concatenation of the names and/or
strings, or a vector returned by `XMLELEMENT` , `XMLFOREST` ,
`XMLCONCAT` , or `XMLAGG` functions, or an entity object returned by
corresponding functions (e.g. `xtree_doc` or `xquery_eval` ). If the
entity object is an attribute entity, then it is joined to the list of
the element's attributes. If a parameter is NULL, then no child element
or attribute is created for that parameter.

</div>

</div>

<div id="errors_xmlelement" class="refsect1">

## Errors

<div id="id122311" class="table">

**Table 24.128. Errors signalled by `XMLELEMENT `**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                       | Description                         |
|---------------------------------------|---------------------------------------|------------------------------------------------------------------|-------------------------------------|
| <span class="errorcode">22003 </span> | <span class="errorcode">SR354 </span> | <span class="errortext">Too few arguments for XMLELEMENT </span> | There must be at least one argument |

</div>

</div>

  

</div>

<div id="xmlelement_01" class="refsect1">

## Examples

<div id="ex_xmlelement" class="example">

**Example 24.500. XMLELEMENT() with a single argument**

<div class="example-contents">

`XMLELEMENT ` creates an 'Title' element without content.

``` screen
              select XMLELEMENT ('Title') from "Demo"."demo"."Employees";
callret
VARCHAR
_______________________________________________________________________________

<Title />
<Title />
. . .
9 Rows. -- 2 msec.
```

</div>

</div>

  

<div id="ex_xmlelement_01" class="example">

**Example 24.501. XMLELEMENT() with content**

<div class="example-contents">

The following example produces an 'Emp' element with three attributes
(the 'region' attribute is calculated by `xquery_eval` ) and five nested
subelements

``` screen
select XMLELEMENT ('Emp',
                    XMLATTRIBUTES ( "EmployeeID" AS "EmpID", "Title"),
                    XMLELEMENT ('Name', "FirstName" || ' ' || "LastName" ),
                    xquery_eval('//@region', xtree_doc ('<a region="WA"></a>')),
                    XMLFOREST ("PostalCode", "City" as "city"),
                    XMLCONCAT (XMLELEMENT ('HomePhone', "HomePhone"),
                               XMLELEMENT ('BirthDate', "BirthDate")))
  from "Demo"."demo"."Employees"
  where "EmployeeID"=1;

callret
VARCHAR
_______________________________________________________________________________

<Emp EmpID="1" Title="Sales Representative" region="WA">
  <Name>Nancy Davolio</Name>
  <city>Seattle</city>
  <PostalCode>98122</PostalCode>
  <HomePhone>(206) 555-9857</HomePhone>
  <BirthDate>1948-12-08</BirthDate>
</Emp>
```

</div>

</div>

  

<div id="ex_xmlelement_01_01" class="example">

**Example 24.502. XMLELEMENT() with the aggregate function XMLAGG()**

<div class="example-contents">

This example produces 'Emp' elements, with the list of the 'Name' of all
employees.

``` screen
select XMLELEMENT ('Emp',
                    XMLAGG (XMLELEMENT('Name', "FirstName", ' ', "LastName")))
  from "Demo"."demo"."Employees";
callret
VARCHAR
_______________________________________________________________________________

<Emp>
   <Name>Nancy Davolio</Name>
   <Name>Andrew Fuller</Name>
   <Name>Janet Leverling</Name>
   <Name>Margaret Peacock</Name>
   <Name>Steven Buchanan</Name>
   <Name>Michael Suyama</Name>
   <Name>Robert King</Name>
   <Name>Laura Callahan</Name>
   <Name>Anne Dodsworth</Name>
</Emp>
```

</div>

</div>

  

</div>

<div id="seealso_xmlelement" class="refsect1">

## See Also

<a href="fn_xmlagg.html" class="link" title="XMLAGG">XMLAGG()</a>

<a href="fn_xmlattributes.html" class="link"
title="XMLATTRIBUTES">XMLATTRIBUTE()</a>

<a href="fn_xmlconcat.html" class="link"
title="XMLCONCAT">XMLCONCAT()</a>

<a href="fn_xmlforest.html" class="link"
title="XMLFOREST">XMLFOREST()</a>

</div>

</div>
