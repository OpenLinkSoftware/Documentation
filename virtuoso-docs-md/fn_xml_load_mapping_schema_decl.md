<div id="fn_xml_load_mapping_schema_decl" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xml_load_mapping_schema_decl — creates a xml view from mapping schema.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xml_load_mapping_schema_decl" class="funcsynopsis">

|                                           |                                     |
|-------------------------------------------|-------------------------------------|
| ` `**`xml_load_mapping_schema_decl`**` (` | in `base_uri ` varchar ,            |
|                                           | in `mapping_schema_file ` varchar , |
|                                           | in `content_encoding ` varchar ,    |
|                                           | in `content_language ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_66" class="refsect1">

## Description

`xml_load_mapping_schema_decl ` takes a file containing mapping schema
and creates a xml view.

</div>

<div id="params_31" class="refsect1">

## Parameters

<div id="id123107" class="refsect2">

### base_uri

in HTML parser mode change all absolute references to relative from
given base_uri (http://\<host\>:\<port\>/\<path\>)

</div>

<div id="id123110" class="refsect2">

### mapping_schema_file

well formed XML document containing a mapping schema

</div>

<div id="id123113" class="refsect2">

### content_encoding

string with content encoding type of \<document\>; valid are 'ASCII',
'ISO', 'UTF8', 'ISO8859-1', 'LATIN-1' etc., defaults are 'UTF-8' for XML
mode and 'LATIN-1' for HTML mode

</div>

<div id="id123116" class="refsect2">

### content_language

string with language tag of content of \<document\>; valid names are
listed in IETF RFC 1766, default is 'x-any' (it means 'mix of words from
various human languages)

</div>

</div>

<div id="examples_15_01" class="refsect1">

## 

<div id="ex_xml_load_mapping_schema_decl" class="example">

**Example 24.514. Creating a xml view from a mapping schema**

<div class="example-contents">

The xml view created by

``` programlisting
 xml_load_mapping_schema_decl (
    'http://localhost.localdomain/xmlrepository',
    'catmp.xsd', 'UTF-8', 'x-any');
```

from the file catmp.xsd containing the following mapping schema

``` programlisting
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema"
            xmlns:sql="urn:schemas-microsoft-com:mapping-schema">
<xsd:annotation>
  <xsd:appinfo>
    <sql:relationship name="CategoryProduct"
          parent="Demo.demo.Categories"
          parent-key="CategoryID"
          child="Demo.demo.Products"
          child-key="CategoryID" />
  </xsd:appinfo>
</xsd:annotation>

  <xsd:element name="category" sql:relation="Demo.demo.Categories" type="CategoryType" />
   <xsd:complexType name="CategoryType" >
     <xsd:sequence>
        <xsd:element name="product"
                     sql:relation="Demo.demo.Products"
                     sql:relationship="CategoryProduct" >
           <xsd:complexType>
              <xsd:attribute name="ProductName" type="xsd:string" />
           </xsd:complexType>
        </xsd:element>
     </xsd:sequence>
        <xsd:attribute name="CategoryID"  type="xsd:integer" />
        <xsd:attribute name="description"  sql:field="Description"  type="xsd:string" />
    </xsd:complexType>
</xsd:schema>
```

is identical to xml view created by

``` programlisting
create xml view "cat" as
{
  "Demo"."demo"."Categories" "C" as "category"
    ("CategoryID", "Description" as "description")
    {
      "Demo"."demo"."Products" "P" as "product"  ("ProductName")
    on ("P"."CategoryID" = "C"."CategoryID")
    }
}
```

</div>

</div>

  

</div>

<div id="seealso_40" class="refsect1">

## See Also

<a href="fn_xml_load_schema_decl.html" class="link"
title="xml_load_schema_decl"><code
class="function">xml_load_schema_decl() </code></a>

<a href="fn_xml_create_tables_from_mapping_schema_decl.html"
class="link" title="xml_create_tables_from_mapping_schema_decl"><code
class="function">xml_load_schema_decl() </code></a>

<a href="fn_xml_view_schema.html" class="link"
title="xml_view_schema"><code
class="function">xml_view_schema() </code></a>

</div>

</div>
