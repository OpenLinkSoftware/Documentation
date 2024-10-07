<div id="examples" class="section">

<div class="titlepage">

<div>

<div>

### 15.5.5. Examples

</div>

</div>

</div>

Given the following tables:

``` programlisting
CREATE TABLE Orders (
    OrderID int identity,
    CustomerID varchar(10),
    EmpID int,
    PRIMARY KEY (OrderID));

CREATE TABLE OrderDetails (
    OrderID int,
    ProductID int,
    Quantity int);
```

A. Update Gram to Insert a Record

``` programlisting
xmlsql_update (xml_tree_doc (xml_tree (
'<ROOT xmlns:sql="urn:schemas-microsoft-com:xml-sql">
<sql:sync>
  <sql:after>
    <Orders CustomerID="TEST" EmpID="99"/>
  </sql:after>
</sql:sync>
</ROOT>')));
```

B. Updategram with an *`at-identity`* Attribute

``` programlisting
xmlsql_update (xml_tree_doc (xml_tree (
'<ROOT xmlns:sql="urn:schemas-microsoft-com:xml-sql">
<sql:sync>
  <sql:after>
    <Orders sql:at-identity="x" CustomerID="VINET" EmpID="10"/>
      <OrderDetails OrderID="x" ProductID="1" Quantity="50"/>
      <OrderDetails OrderID="x" ProductID="2" Quantity="20"/>
    <Orders sql:at-identity="x" CustomerID="HANAR" EmpID="11"/>
      <OrderDetails OrderID="x" ProductID="1" Quantity="30"/>
      <OrderDetails OrderID="x" ProductID="4" Quantity="25"/>
  </sql:after>
</sql:sync>
</ROOT>')));
```

C. Updategram to Delete a Record

``` programlisting
xmlsql_update (xml_tree_doc (xml_tree (
'<ROOT xmlns:sql="urn:schemas-microsoft-com:xml-sql">
<sql:sync>
  <sql:before>
    <Orders CustomerID="HANAR" EmpID="11"/>
  </sql:before>
</sql:sync>
</ROOT>')));
```

D. Updategram to Update a Record

``` programlisting
xmlsql_update (xml_tree_doc (xml_tree (
'<ROOT xmlns:sql="urn:schemas-microsoft-com:xml-sql">
<sql:sync>
  <sql:before>
    <Orders sql:id="1" CustomerID="VINET" EmpID="10"/>
  </sql:before>
  <sql:after>
    <Orders sql:id="1" CustomerID="VINET_NEW" EmpID="11"/>
  </sql:after>
</sql:sync>
</ROOT>')));
```

E: Using a different syntax for updategrams - entities in place of
attributes - example D can be transformed to:

``` programlisting
xmlsql_update (xml_tree_doc (xml_tree (
'<ROOT xmlns:sql="urn:schemas-microsoft-com:xml-sql">
<sql:sync>
  <sql:before>
    <Orders sql:id="1">
      <CustomerID>VINET</CustomerID>
      <EmpID>10</EmpID>
    </Orders>
  </sql:before>
  <sql:after>
    <Orders sql:id="1">
      <CustomerID>VINET_NEW</CustomerID>
      <EmpID>11</EmpID>
    </Orders>
  </sql:after>
</sql:sync>
</ROOT>')));
```

Note that two syntaxes cannot be mixed in one document.

F: Using input parameters

Assume the following table:

``` programlisting
CREATE TABLE Shippers(
  ShipperID INTEGER,
  CompanyName VARCHAR(40),
  Phone VARCHAR(24),
  PRIMARY KEY (ShipperID));

xmlsql_update (xml_tree_doc (xml_tree (
'<DocumentElement xmlns:sql="urn:schemas-microsoft-com:xml-sql">
    <sql:header>
      <sql:param name="ShipperID" default="2"/>
      <sql:param name="CompanyName" default="United Package New"/>
      <sql:param name="Phone" default="(503) 555-3199 (new)"/>
    </sql:header>
    <sql:sync>
        <sql:before>
        </sql:before>
        <sql:after>
            <Shippers sql:id="1" ShipperID="\$ShipperID"
        CompanyName="\$CompanyName" Phone="\$Phone"/>
        </sql:after>
    </sql:sync>
</DocumentElement>')),
    vector ('ShipperID','10','CompanyName','DHL','Phone','+359 32 144'));
        -- <- this is a array with input parameters
```

This will add one record to the Shippers table with the data in the
array. Note that the slash/dollar sign pair '\\' transforms to dollar
sign '\$' only

</div>
