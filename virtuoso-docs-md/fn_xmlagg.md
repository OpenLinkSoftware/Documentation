<div id="fn_xmlagg" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

XMLAGG — Produces a forest of elements from a collection of XML values

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xmlagg" class="funcsynopsis">

|                           |                              |
|---------------------------|------------------------------|
| `vector `**`XMLAGG`**` (` | `value_expression ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xmlagg" class="refsect1">

## Description

`XMLAGG ` is aggregate function that produces a forest of XML elements
from the given list of xml elements. It concatenates the values returned
from one column of multiple rows, unlike `XMLCONCAT` , which
concatenates the values returned from multiple columns in the same row.

The order of element in the result of `XMLAGG` is defined by the order
of retrieval of the source data rows. It is important to remember that
the order of rows in an SQL resultset defined only if there's an
explicit ORDER BY clause. Hence if the order of elements in the
resulting forest is important then XMLAGG should be applied to data that
comes from inner SELECT statement that has an ORDER BY clause, not e.g.
from a table reference.

Note that `XMLAGG` is actually declared as `DB.DBA.XMLAGG` but it is not
important for plain use: for compatibility with other systems, any call
of `XMLAGG` in any SQl statement is always replaced with the call of
`DB.DBA.XMLAGG ` , no matter which qualifier and user name are in use.

</div>

<div id="params_xmlagg" class="refsect1">

## Parameters

<div id="id121949" class="refsect2">

### value_expression

the result of one of the following functions `XMLAGG ` , `XMLCONCAT ` ,
`XMLELEMENT ` , or `XMLFOREST ` .

</div>

</div>

<div id="ret_xmlagg" class="refsect1">

## Return Types

The aggregate returns a vector that is a suitable input for functions
`XMLELEMENT ` , `XMLCONCAT ` and `xml_tree_doc ` .

</div>

<div id="examples_xmlagg" class="refsect1">

## Examples

<div id="ex_xmlagg_1" class="example">

**Example 24.494. XMLAGG() enclosed in XMLELEMENT()**

<div class="example-contents">

The following example produces an 'Emp' element with attribute 'Title'
and a list of all employees having the title 'Sales Representative' as
element content.

``` programlisting
select XMLELEMENT ('Emp', XMLATTRIBUTES ('Sales Representative' as "Title"),
       XMLAGG (XMLELEMENT ('Name', "FirstName", ' ', "LastName")))
  from "Demo"."demo"."Employees"
 where "Title" = 'Sales Representative';

callret
VARCHAR
_______________________________________________________________________________

<Emp Title="Sales Representative">
  <Name>Nancy Davolio</Name>
  <Name>Janet Leverling</Name>
  <Name>Margaret Peacock</Name>
  <Name>Michael Suyama</Name>
  <Name>Robert King</Name>
  <Name>Anne Dodsworth</Name>
</Emp>

1 Rows.
```

</div>

</div>

  

<div id="ex_xmlagg_2" class="example">

**Example 24.495. XMLAGG() that produces a sorted document**

<div class="example-contents">

The result of the previous example contains an unsorted list of names.
This is because data rows were retrieved from "Demo"."demo"."Employees"
in primary key order, and this order has nothing common with fields
"FirstName" and "LastName". To produce the sorted result, the query
should contain ORDER BY in a subquery. These two variants will work
identically if "FirstName" never contains whitespaces or nonprintable
control characters, but the last one is formally more correct.

``` programlisting
select XMLELEMENT ('Emp', XMLATTRIBUTES ('Sales Representative' as "Title"),
       XMLAGG (XMLELEMENT ('Name', "FirstName", ' ', "LastName")))
 from
    (select "FirstName", "LastName"
     from "Demo"."demo"."Employees"
     where "Title"= 'Sales Representative'
     order by 1, 2) as subq;

callret
VARCHAR
_______________________________________________________________________________

<Emp Title="Sales Representative">
  <Name>Anne Dodsworth</Name>
  <Name>Janet Leverling</Name>
  <Name>Margaret Peacock</Name>
  <Name>Michael Suyama</Name>
  <Name>Nancy Davolio</Name>
  <Name>Robert King</Name>
</Emp>

1 Rows.

select XMLELEMENT ('Emp', XMLATTRIBUTES ('Sales Representative' as "Title"),
       XMLAGG (XMLELEMENT ('Name', full_name)))
  from
    (select concat ("FirstName", ' ', "LastName") as full_name
     from "Demo"."demo"."Employees"
     where "Title"= 'Sales Representative'
     order by 1) as subq;

callret
VARCHAR
_______________________________________________________________________________

<Emp Title="Sales Representative">
  <Name>Anne Dodsworth</Name>
  <Name>Janet Leverling</Name>
  <Name>Margaret Peacock</Name>
  <Name>Michael Suyama</Name>
  <Name>Nancy Davolio</Name>
  <Name>Robert King</Name>
</Emp>

1 Rows.
```

</div>

</div>

  

</div>

<div id="seealso_xmlagg" class="refsect1">

## See Also

<a href="fn_xmlelement.html" class="link"
title="XMLELEMENT">XMLELEMENT()</a>

<a href="fn_xmlattributes.html" class="link"
title="XMLATTRIBUTES">XMLATTRIBUTES()</a>

<a href="fn_xmlforest.html" class="link"
title="XMLFOREST">XMLFOREST()</a>

<a href="fn_xmlconcat.html" class="link"
title="XMLCONCAT">XMLCONCAT()</a>

</div>

</div>
