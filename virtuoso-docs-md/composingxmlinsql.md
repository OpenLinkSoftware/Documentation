<div>

<div>

<div>

<div>

## 15.2. XML Composing Functions in SQL Statements (SQLX)

</div>

</div>

</div>

The preferred means of constructing XML data from SQL is to use the
standard SQLX SQL extension.

SQLX is a collection of functions added for creating XML entities from
standard relational queries. Basically, you write a SQL statement with
calls to SQLX functions in the selection and a piece of XML is created.

There are five XML composing functions:

|                                                                                                                                                                         |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <a href="fn_xmlelement.html" class="link" title="XMLELEMENT"><code                                                                                                      
 class="function">XMLELEMENT()</code></a> creates a single XML element that can contain an arbitrary number of attributes and sub-elements.                               |
| <a href="fn_xmlattributes.html" class="link" title="XMLATTRIBUTES"><code                                                                                                
 class="function">XMLATTRIBUTES()</code></a> lists XML attributes to be placed in the XML element created by an enclosing call of `XMLELEMENT()` .                        |
| <a href="fn_xmlconcat.html" class="link" title="XMLCONCAT"><code                                                                                                        
 class="function">XMLCONCAT()</code></a> returns a forest of XML values by concatenating a list of XML values or forests.                                                 |
| <a href="fn_xmlagg.html" class="link" title="XMLAGG"><code                                                                                                              
 class="function">XMLAGG()</code></a> is an aggregate function that creates a forest of XML values by concatenating the XML values that are returned from multiple rows.  |
| <a href="fn_xmlforest.html" class="link" title="XMLFOREST"><code                                                                                                        
 class="function">XMLFOREST()</code></a> is similar to `XMLATTRIBUTES()` but returns a forest of elements instead of list of attributes.                                  |

These functions belong to the SQLX standard, an emerging SQL standard
for XML. All the functions take a variable number of arguments.

`XMLELEMENT` is used to construct XML elements from relational data. It
takes as parameters the element name, an optional collection of
attributes for the element (returned by `XMLATTRIBUTES` call), column
names, strings, `XMLELEMENT` , `XMLFOREST` , `XMLCONCAT` , and `XMLAGG`
calls, and an entity objects (returned by corresponding functions, e.g.
`xtree_doc` , `xpath_eval` , `xquery_eval` ) which will make up the
content of the element (an exception from this is an attribute entity
returned by `xquery_eval` - in this case it is joined to the list of the
element's attributes). Column names, strings and attribute entities
returned by `xpath_eval` will make up the text content of the element.
The others will make up the children of the element.

In the `XMLATTRIBUTES` clause, the value expressions are evaluated to
get the values for the attributes.

`XMLFOREST` produces a forest of XML elements from a given list of
arguments. It accepts a list of SQL value expressions as its arguments,
and produces an XML element from each value returned.

`XMLCONCAT` produces a forest of elements by concatenating a list of XML
values. XMLCONCAT accepts a list of XML value expressions as its
arguments, and produces a forest of elements by concatenating the XML
values that are returned from the same row to make one value. If an
argument of the `XMLCONCAT` is an entity object returned by
`xquery_eval` or `path_eval` , it must not be an attribute.

The following statements create the same result sets:

``` programlisting
select XMLELEMENT ('Person',
                        XMLELEMENT ('firstname', "FirstName"),
                        XMLELEMENT ('lastname', "LastName"),
                xquery_eval('//country', xtree_doc('<a><country>USA</country></a>')))
from "Demo"."demo"."Employees";

select
      XMLELEMENT ('Person',
                        XMLFOREST ("FirstName"as "firstname", "LastName" as "lastname"),
                xquery_eval('//country', xtree_doc('<a><country>USA</country></a>')))
from "Demo"."demo"."Employees";

select
      XMLELEMENT ('Person',
                             XMLCONCAT (
                                        XMLELEMENT ('firstname', "FirstName"),
                                        XMLELEMENT ('lastname', "LastName"),
                                xquery_eval('//country', xtree_doc('<a><country>USA</country></a>'))))
from "Demo"."demo"."Employees";
```

<div>

|                              |                                                         |
|:----------------------------:|:--------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                   |
|                              | The second statement is more effective than the others. |

</div>

In order to return more than one row of values, you can use `XMLAGG` .
`XMLAGG` is an aggregate function that produces a forest of XML elements
from a collection of XML elements. It concatenates the values returned
from one column of multiple rows, unlike XMLCONCAT, which concatenates
the values returned from multiple columns in the same row.

The parameters that would be used as element names (in the `XMLELEMENT`
and in the 'AS clause ' of the `XMLFOREST` and `XMLATTRIBUTES` ) must be
valid XML names. If the 'AS clause ' is absent in a list of the
parameters of the `XMLFOREST` or `XMLATTRIBUTES` , Virtuoso uses the
partially escaped form of the column name as the element or attribute
name. The partially escaped form means that SQL \<identifier\>
characters that are valid characters in a XML NAME are not changed, SQL
\<identifier\> character that is not valid XML NAME character is
replaced with "\_xHHHH\_", where HHHH is character's upper case
hexadecimal code. For example, "first_name" is replaced with
"first_x005F_name", "last name" is replaced with "last_x0020_name".

The following example creates an 'FullAddress' element with

<div>

- four attributes, three of them ('PostalCode', 'Address', 'City') are
  produced by `XMLATTRIBUTES`, and the fourth attribute - 'country' is
  calculated by `xquery_eval `

- 'Region' subelement, that is produced by `xtree_doc `

- text content, that is produced by `xpath_eval `

- 'emp' subelement with text content from the column "LastName", that is
  created by nested`XMLELEMENT`

</div>

``` programlisting
select XMLELEMENT ('FullAddress',
                        XMLATTRIBUTES ( "PostalCode", "Address", "City"),
                        xtree_doc ('<Region>WA</Region>'),
                        xquery_eval('//@country', xtree_doc('<a country="USA"/>')),
                        xpath_eval('//@Phone', xtree_doc('<a Phone="(206) 555-9857"/>')),
                        XMLELEMENT('emp', "LastName"))
from "Demo"."demo"."Employees"

----------------------------

   <FullAddress PostalCode="98122" Address="507 - 20th Ave. E. Apt. 2A" City="Seattle" country="USA">
        <Region>WA</Region>
        (206) 555-9857
        <emp>Davolio</emp>
    </FullAddress>
    <FullAddress PostalCode="98401" Address="908 W. Capital Way" City="Tacoma" country="USA">
        <Region>WA</Region>
        (206) 555-9857
        <emp>Fuller</emp>
    </FullAddress>
  . . .

 
```

<div>

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p><a
href="fn_xmlagg.html" class="link" title="XMLAGG">XMLAGG()</a></p>
<p><a href="fn_xmlattributes.html" class="link"
title="XMLATTRIBUTES">XMLATTRIBUTE()</a></p>
<p><a href="fn_xmlconcat.html" class="link"
title="XMLCONCAT">XMLCONCAT()</a></p>
<p><a href="fn_xmlelement.html" class="link"
title="XMLELEMENT">XMLELEMENT()</a></p>
<p><a href="fn_xmlforest.html" class="link"
title="XMLFOREST">XMLFOREST()</a></p></td>
</tr>
</tbody>
</table>

</div>

XML composing functions deal with arguments of arbitrary type, but the
result is always an XML entity that can contain only elements and
strings. Hence there is a set of type casting rules. These rules are
quite common for any XML DOM model, so they're similar to those listed
for <a href="xmldom.html#xmldomtypecasting" class="link"
title="15.11.1. Composing Document Fragments From DOM Function Arguments">DOM
function arguments</a> :

If an instance of XMLType is passed then its internal XML entity is
used.

If an array representation of an XML tree entity is passed then it is
used exactly like XML entity.

If an argument is NULL then it is fully ignored, as if there is no such
argument at all.

If an argument is not of a type listed above and not a string then it is
cast to a string first.

A root node of some document (or of some generic XML entity) can not
appear in the middle of the resulting tree. So if a root node is passed
then all child nodes of the root (i.e. every top-level node of the
document) will be added.

SQL/XML standards introduce a special name "forest of XML elements" for
an ordered list of XML elements, like one returned by `XMLFOREST()` . In
Virtuoso, forest can contain XML nodes of any sort, not only XML
elements, so it can also contain strings, processing instructions and
comments. Virtuoso processes any non-empty "forest" as if it were the
root node of a "generic XML entity", and items of the forest were
top-level nodes of that entity. Hence, a forest can be passed to any
function that accepts an value of type "XML entity". The only potential
problem is that this entity is well-formed if and only if the forest is
non-empty. If an empty forest is serialized to an XML text then the
result is an empty string that is not an acceptable input for an XML
parser.

It is important to remember that the XML document can not contain two
neighbour text nodes and that the text node can not be an empty string.
If two consequent strings appear in the list of values of a forest or in
the list of children of an new element then they are replaced with a
single node that is a concatenation of these string. Similarly, if an
empty string appears in the list of values of a forest or in the list of
children of an new element then it is removed from the list.

</div>
