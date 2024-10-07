<div id="fn_xml_view_schema" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xml_view_schema — returns an XML schema for the output of given XML VIEW

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xml_view_schema" class="funcsynopsis">

|                                     |                                 |
|-------------------------------------|---------------------------------|
| `varchar `**`xml_view_schema`**` (` | in `query ` varchar ,           |
|                                     | in `root_element ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_74" class="refsect1">

## Description

This function return an XML schema for the output of given XML VIEW. The
returned schema will be valid if the HTTP\_... output of view wrapped
into the specified root element.

</div>

<div id="params_38" class="refsect1">

## Parameters

<div id="id123830" class="refsect2">

### query

a string which contains a name of XML view

</div>

<div id="id123833" class="refsect2">

### root_element

a string containing the element name in which the XML schema would be
wrapped

</div>

</div>

<div id="ret_12_01" class="refsect1">

## Return Types

XML Schema

</div>

<div id="errors_xml_view_schema" class="refsect1">

## Errors

<div id="id123841" class="table">

**Table 24.133. Errors signalled by**

<div class="table-contents">

| SQLState                              | Error Code                      | Error Text                                                | Description |
|---------------------------------------|---------------------------------|-----------------------------------------------------------|-------------|
| <span class="errorcode">42000 </span> | <span class="errorcode"></span> | <span class="errortext">No XML view \[view_name\] </span> |             |

</div>

</div>

  

</div>

<div id="examples_20_01" class="refsect1">

## Examples

<div id="ex_xml_view_schema" class="example">

**Example 24.524. Creating an XML Schema**

<div class="example-contents">

``` programlisting

SQL> select xml_view_schema ('cat', 'root');
callret
VARCHAR
_______________________________________________________________________________

<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">

 <xsd:annotation>
  <xsd:documentation>
    Schema of XML view 'cat'
  </xsd:documentation>
 </xsd:annotation>

 <xsd:element name="root" type="root__Type"/>

 <xsd:complexType name="root__Type">
  <xsd:element name="category" type="root_category_Type" minOccurs="0" maxOccurs="unbounded"/>
 </xsd:complexType>

 <xsd:complexType name="root_category_Type">
  <xsd:attribute name="CategoryID" type="xsd:string"/>

<!-- <xsd:attribute name="CategoryID" type="xsd:int"/> -->

  <xsd:attribute name="description" type="xsd:string"/>
  <xsd:element name="product" type="category_product_Type" minOccurs="0" maxOccurs="unbounded"/>
 </xsd:complexType>

 <xsd:complexType name="category_product_Type">
  <xsd:attribute name="ProductName" type="xsd:string"/>
 </xsd:complexType>
</xsd:schema>

1 Rows. -- 9 msec.
```

</div>

</div>

  

</div>

<div id="seealso_47" class="refsect1">

## See Also

<a href="fn_xml_view_dtd.html" class="link"
title="xml_view_dtd">xml_view_dtd()</a>

<a href="fn_xml_validate_dtd.html" class="link"
title="xml_validate_dtd">xml_validate_dtd()</a>

<a href="fn_xml_persistent.html" class="link"
title="xml_persistent">xml_persistent()</a>

</div>

</div>
