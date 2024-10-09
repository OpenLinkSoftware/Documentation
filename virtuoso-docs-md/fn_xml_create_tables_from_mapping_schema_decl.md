<div id="fn_xml_create_tables_from_mapping_schema_decl"
class="refentry">

<div>

</div>

<div>

## Name

xml_create_tables_from_mapping_schema_decl — returns a vector containing
strings. Each string is a command to drop a table or a foreign key or to
create table.

</div>

<div>

## Synopsis

<div id="fsyn_xml_create_tables_from_mapping_schema_decl"
class="funcsynopsis">

|                                                         |                                     |
|---------------------------------------------------------|-------------------------------------|
| ` `**`xml_create_tables_from_mapping_schema_decl`**` (` | in `base_uri ` varchar ,            |
|                                                         | in `mapping_schema_file ` varchar , |
|                                                         | in `content_encoding ` varchar ,    |
|                                                         | in `content_language ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`xml_create_tables_from_mapping_schema_decl ` takes a file containing
mapping schema and returns a vector containing strings. Each string is a
command to drop a table or a foreign key or to create table. All tables
and fields are mentioned in the mapping schema. If a field type is not
defined in the mapping schema, the VARCHAR type is used.

</div>

<div>

## Parameters

<div>

### base_uri

in HTML parser mode change all absolute references to relative from
given base_uri (http://\<host\>:\<port\>/\<path\>)

</div>

<div>

### mapping_schema_file

well formed XML document containing a mapping schema

</div>

<div>

### content_encoding

string with content encoding type of \<document\>; valid are 'ASCII',
'ISO', 'UTF8', 'ISO8859-1', 'LATIN-1' etc., defaults are 'UTF-8' for XML
mode and 'LATIN-1' for HTML mode

</div>

<div>

### content_language

string with language tag of content of \<document\>; valid names are
listed in IETF RFC 1766, default is 'x-any' (it means 'mix of words from
various human languages)

</div>

</div>

<div>

## Return Types

A vector containing strings

</div>

<div>

## 

<div>

**Example 24.510. Extracting tables from mapping schema**

<div>

Let we have the following mapping schema in the catmp.xsd file

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

the \_result vector after the call

``` programlisting
_result := xml_create_tables_from_mapping_schema_decl (
  'http://localhost.localdomain/xmlrepository',
  'catmp.xsd', 'UTF-8', 'x-any');
```

will contain the following six strings

``` programlisting
drop table "Demo"."demo"."Categories",

ALTER TABLE "Demo"."demo"."Products" DROP CONSTRAINT "Demo.demo.Products_Demo.demo.Categories_FK",

drop table "Demo"."demo"."Products",

create table "Demo"."demo"."Categories"
("Description"  VARCHAR, "CategoryID" INTEGER, PRIMARY KEY ("CategoryID")),

create table "Demo"."demo"."Products" ("CategoryID"  INTEGER, "ProductName"  VARCHAR),

ALTER TABLE "Demo"."demo"."Products" ADD CONSTRAINT "Demo.demo.Products_Demo.demo.Categories_FK"
FOREIGN KEY ("CategoryID") REFERENCES "Demo"."demo"."Categories" ("CategoryID")
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xml_load_mapping_schema_decl.html" class="link"
title="xml_load_mapping_schema_decl"><code
class="function">xml_load_mapping_schema_decl() </code></a>

<a href="fn_xml_load_schema_decl.html" class="link"
title="xml_load_schema_decl"><code
class="function">xml_load_schema_decl() </code></a>

<a href="fn_xml_view_schema.html" class="link"
title="xml_view_schema"><code
class="function">xml_view_schema() </code></a>

</div>

</div>
