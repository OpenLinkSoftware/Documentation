<div id="mapping_schemas" class="section">

<div class="titlepage">

<div>

<div>

### 15.3.7. Mapping Schemas as XML Views

</div>

</div>

</div>

Virtuoso supports creating XML views by using annotated XSD schemas
referred to as mapping schemas. A file containing a mapping schema may
be loaded by calling the
<a href="fn_xml_load_mapping_schema_decl.html" class="link"
title="xml_load_mapping_schema_decl"><code
class="function">xml_load_mapping_schema_decl()</code></a> function. A
name (without extension .xsd) of the file containing a mapping schema is
considered to be the name of the xml view, defined by the given mapping
schema.

A loaded mapping schema may be queried in the same way as one would
query XML views defined using the CREATE XML VIEW statement with XPATH:

``` programlisting
XPATH [__view "xml_view_name"]/xpath_query
```

<div id="ex_loadingmapxmlsch" class="example">

**Example 15.11. Loading and Querying a Mapping Schema**

<div class="example-contents">

The XML view "Catmp" from the file "Catmp.xsd" may be loaded using the
following statement:

``` programlisting
   select  xml_load_mapping_schema_decl (
      'http://localhost.localdomain/xmlrepository/',
      'Catmp.xsd',
      'UTF-8',
      'x-any' ) ) );
```

where the contents of "Catmp.xsd" is

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

The XML view "Catmp" loaded from the file "Catmp.xsd" is similar to XML
view "cat" defined by CREATE XML VIEW in the section
<a href="xmlviews1.html#explicitxmlviews" class="link"
title="Explicit XML Views">Explicit Xml Views</a> .

The query

``` programlisting
XPATH [__view 'Catmp'] /category[@* = 1];
            
```

will now return the following result:

``` programlisting
<category CategoryID="1" description="Soft drinks, coffees, teas, beers, and ales" >
  <product ProductName="Chai" ></product>
  <product ProductName="Chang" ></product>
  <product ProductName="Guarana Fantastica" ></product>
  <product ProductName="Sasquatch Ale" ></product>
  <product ProductName="Steeleye Stout" ></product>
  <product ProductName="Cote de Blaye" ></product>
  <product ProductName="Chartreuse verte" ></product>
  <product ProductName="Ipoh Coffee" ></product>
  <product ProductName="Laughing Lumberjack Lager" ></product>
  <product ProductName="Outback Lager" ></product>
  <product ProductName="Rhonbrau Klosterbier" ></product>
  <product ProductName="Lakkalikoori" ></product>
</category>
```

</div>

</div>

  

Mapping schemas provide more flexibility than XML views defined by the
`CREATE XML VIEW` statement. In the following mapping schema a constant
element, "CustomerOrders", an element that does not map to any database
table or column but may appear in the resulting XML as a container
element of other subelements, is specified by the `sql:is-constant`
annotation.

``` programlisting
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema"
            xmlns:sql="urn:schemas-microsoft-com:mapping-schema">
<xsd:annotation>
  <xsd:appinfo>
    <sql:relationship name="CustOrders"
        parent="Demo.demo.Customers"
        parent-key="CustomerID"
        child="Demo.demo.Orders"
        child-key="CustomerID" />
  </xsd:appinfo>
</xsd:annotation>

  <xsd:element name="Customer" sql:relation="Demo.demo.Customers" >
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="CustomerOrders" sql:is-constant="1" >
          <xsd:complexType>
            <xsd:sequence>
              <xsd:element name="Order" sql:relation="Demo.demo.Orders"
                           sql:relationship="CustOrders"
                           maxOccurs="unbounded" >
                <xsd:complexType>
                   <xsd:attribute name="OrderID" type="xsd:integer" />
                   <xsd:attribute name="OrderDate" type="xsd:date" />
                   <xsd:attribute name="CustomerID" type="xsd:string" />
                </xsd:complexType>
              </xsd:element>
            </xsd:sequence>
          </xsd:complexType>
        </xsd:element>
      </xsd:sequence>
          <xsd:attribute name="CustomerID" type="xsd:string" />
    </xsd:complexType>
  </xsd:element>
</xsd:schema>
```

After loading the "Cust_constant.xsd" file containing the given mapping
schema, the xpath query:

``` programlisting
XPATH [__view 'Cust_constant'] /category[@* = 1];
            
```

will return the following result:

``` programlisting
<Customer CustomerID="ALFKI" >
  <CustomerOrders >
    <Order CustomerID="ALFKI" OrderDate="1995-09-25 00:00:00.000000" OrderID="10643" ></Order>
    <Order CustomerID="ALFKI" OrderDate="1995-11-03 00:00:00.000000" OrderID="10692" ></Order>
    <Order CustomerID="ALFKI" OrderDate="1995-11-13 00:00:00.000000" OrderID="10702" ></Order>
    <Order CustomerID="ALFKI" OrderDate="1996-02-15 00:00:00.000000" OrderID="10835" ></Order>
    <Order CustomerID="ALFKI" OrderDate="1996-04-15 00:00:00.000000" OrderID="10952" ></Order>
    <Order CustomerID="ALFKI" OrderDate="1996-05-09 00:00:00.000000" OrderID="11011" ></Order>
  </CustomerOrders>
</Customer>
    . . .
```

Virtuoso does not support all mapping schema annotations at this time.
The following are currently unsupported:

|                      |
|----------------------|
| `sql:encode`         |
| `sql:use-cdata`      |
| `sql:overflow-field` |
| `sql:inverse`        |
| `sql:hide`           |
| `sql:guid`           |
| `sql:max-depth`      |

Also, there are some restrictions to the structure of mapping schemas:

|                                                                                                                         |
|-------------------------------------------------------------------------------------------------------------------------|
| Attributes can not contain sql:relationship annotation.                                                                 |
| Subelement having no sql:is-constant annotation and not mapped to any table can not contain subelements and attributes. |
| Recursive relationships is not supported.                                                                               |

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                        |
|:----------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                  |
|                              | The XML views, defined by mapping schemas may not be queried using XQUERY. They can however be referenced with the xmlview XPATH functions in path expressions inside an XQuery query. |

</div>

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                               |
|:--------------------------:|:--------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                                     |
|                            | SQLXML 3.0 documentation: <a                                                                                  
                              href="http://msdn.microsoft.com/library/default.asp?url=/library/en-us/sqlxml3/htm/ssxsdannotations_0gqb.asp"  
                              class="ulink" target="_top">Creating XML Views by Using Annotated XSD                                          
                              Schemas.</a>                                                                                                   |

</div>

</div>
