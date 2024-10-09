<div>

<div>

</div>

<div>

## Name

xml_view_schema — returns an XML schema for the output of given XML VIEW

</div>

<div>

## Synopsis

<div>

|                                     |                                 |
|-------------------------------------|---------------------------------|
| `varchar `**`xml_view_schema`**` (` | in `query ` varchar ,           |
|                                     | in `root_element ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function return an XML schema for the output of given XML VIEW. The
returned schema will be valid if the HTTP\_... output of view wrapped
into the specified root element.

</div>

<div>

## Parameters

<div>

### query

a string which contains a name of XML view

</div>

<div>

### root_element

a string containing the element name in which the XML schema would be
wrapped

</div>

</div>

<div>

## Return Types

XML Schema

</div>

<div>

## Errors

<div>

**Table 24.132. Errors signalled by**

<div>

| SQLState                              | Error Code                      | Error Text                                                | Description |
|---------------------------------------|---------------------------------|-----------------------------------------------------------|-------------|
| <span class="errorcode">42000 </span> | <span class="errorcode"></span> | <span class="errortext">No XML view \[view_name\] </span> |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.524. Creating an XML Schema**

<div>

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

<div>

## See Also

<a href="fn_xml_view_dtd.html" class="link"
title="xml_view_dtd">xml_view_dtd()</a>

<a href="fn_xml_validate_dtd.html" class="link"
title="xml_validate_dtd">xml_validate_dtd()</a>

<a href="fn_xml_persistent.html" class="link"
title="xml_persistent">xml_persistent()</a>

</div>

</div>
