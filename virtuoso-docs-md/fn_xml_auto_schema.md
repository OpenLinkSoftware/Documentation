<div id="fn_xml_auto_schema" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xml_auto_schema — returns an XML schema for the result of an SQL query
with a FOR XML clause

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xml_auto_schema" class="funcsynopsis">

|                                     |                                 |
|-------------------------------------|---------------------------------|
| `varchar `**`xml_auto_schema`**` (` | in `query ` varchar ,           |
|                                     | in `root_element ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xml_auto_schema" class="refsect1">

## Description

This function returns an XML schema for the results of an SQL query with
a FOR XML clause. The returned schema will apply to the output generated
by `xml_auto()` with the query in question after wrapping it in the
specified root element.

</div>

<div id="params_xml_auto_schema" class="refsect1">

## Parameters

<div id="id122838" class="refsect2">

### query

SQL query

</div>

<div id="id122841" class="refsect2">

### root_element

name of root element container

</div>

</div>

<div id="ret_xml_auto_schema" class="refsect1">

## Return Types

varchar result containing the schema of the XML document.

</div>

<div id="errors_xml_auto_schema" class="refsect1">

## Errors

If the *`query `* argument is not a valid SQL statement, i.e. SQL
compiler signals an error message, the function resignals the error.

</div>

<div id="examples_xml_auto_schema" class="refsect1">

## Examples

<div id="ex_xml_auto_achema" class="example">

**Example 24.509. Simple Schema Generation**

<div class="example-contents">

``` programlisting
SQL> select xml_auto_schema ('  select "category"."CategoryID", "CategoryName",
        "ProductName", "ProductID"
    from "Demo".."Categories" "category", "Demo".."Products" as "product"
    where "product"."CategoryID" = "category"."CategoryID"
    for xml auto element', 'root');
 callret
VARCHAR
_______________________________________________________________________________

<xsd:schema xmlns:xsd="http://www.w3.org/1999/XMLSchema">

 <xsd:annotation>
  <xsd:documentation>
   Schema for output of the following SQL statement:
   <[CDATA[  select "category"."CategoryID",
     "CategoryName", "ProductName", "ProductID"
     from "Demo".."Categories" "category",
     "Demo".."Products" as "product"
     where "product"."CategoryID" = "category"."CategoryID"
     for xml auto element]]>
  </xsd:documentation>
 </xsd:annotation>

 <xsd:element name="root" type="root__Type"/>

 <xsd:complexType name="root__Type">
  <xsd:element name="category" type="category_Type"
  minOccurs="0" maxOccurs="unbounded"/>
 </xsd:complexType>

 <xsd:complexType name="category_Type">
  <xsd:element name="CategoryID" type="xsd:int" precision="10"/>
  <xsd:element name="CategoryName" type="xsd:string" maxLength="15"/>
  <xsd:element name="product" type="product_Type" minOccurs="0" maxOccurs="unbounded"/>
 </xsd:complexType>

 <xsd:complexType name="product_Type">
  <xsd:element name="ProductName" type="xsd:string" maxLength="40"/>
  <xsd:element name="ProductID" type="xsd:int" precision="10"/>
 </xsd:complexType>

</xsd:schema>

1 Rows. -- 5 msec.
```

</div>

</div>

  

</div>

<div id="seealso_xml_auto_schema" class="refsect1">

## See Also

<a href="fn_xml_auto.html" class="link" title="xml_auto"><code
class="function">xml_auto() </code></a>

<a href="fn_xml_auto_dtd.html" class="link" title="xml_auto_dtd"><code
class="function">xml_auto_dtd() </code></a>

</div>

</div>
