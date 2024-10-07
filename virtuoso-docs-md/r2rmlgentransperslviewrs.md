<div id="r2rmlgentransperslviewrs" class="section">

<div class="titlepage">

<div>

<div>

### 16.7.7. Generate Transient and/or Persistent Linked Data Views atop Remote Relational Data Sources Using Conductor

</div>

</div>

</div>

This section describes how you can generate R2RML Scripts from Linked
Data Views, using the Virtuoso Conductor ODBC or JDBC accessible.

<div class="orderedlist">

1.  Ensure you have installed Conductor <a
    href="http://opldownload.s3.amazonaws.com/uda/vad-packages/6.3/virtuoso/conductor_dav.vad"
    class="ulink" target="_top">conductor_dav.vad</a> VAD package with
    version 1.32.38 or higher.

2.  Go to http://\<cname\>\[:\<port\>\]/conductor.

3.  Enter dba credentials.

4.  Go to Linked Data -\> Views:

    <div class="figure-float">

    <div id="r0" class="figure">

    **Figure 16.74. Generating Transient and/or Persistent Linked Data
    Views**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Generating Transient and/or Persistent Linked Data
    Views](images/ui/r0.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Select Qualifier Demo:

    <div class="figure-float">

    <div id="r00" class="figure">

    **Figure 16.75. Generating Transient and/or Persistent Linked Data
    Views**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Generating Transient and/or Persistent Linked Data
    Views](images/ui/r00.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select table(s) by hatching the check-box to the left of the table
    name; for example, select the following tables from the Northwind
    DB: Categories, Customers, Employees, Order_Details, Orders,
    Products .

    <div class="figure-float">

    <div id="r1g" class="figure">

    **Figure 16.76. Generating Transient and/or Persistent Linked Data
    Views**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Generating Transient and/or Persistent Linked Data
    Views](images/ui/r1g.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Click Generate via Wizard:

    <div class="figure-float">

    <div id="r2g" class="figure">

    **Figure 16.77. Generating Transient and/or Persistent Linked Data
    Views**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Generating Transient and/or Persistent Linked Data
    Views](images/ui/r2g.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Click Prepare to Execute.

9.  The R2RML script for the selected table(s) will be generated and
    displayed in the R2RML Graph text-area:

    <div class="figure-float">

    <div id="r3g" class="figure">

    **Figure 16.78. Generating Transient and/or Persistent Linked Data
    Views**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Generating Transient and/or Persistent Linked Data
    Views](images/ui/r3g.png)

    </div>

    </div>

    </div>

      

    </div>

    <div class="figure-float">

    <div id="r4g" class="figure">

    **Figure 16.79. Generating Transient and/or Persistent Linked Data
    Views**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Generating Transient and/or Persistent Linked Data
    Views](images/ui/r4g.png)

    </div>

    </div>

    </div>

      

    </div>

    <div class="figure-float">

    <div id="r5g" class="figure">

    **Figure 16.80. Generating Transient and/or Persistent Linked Data
    Views**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Generating Transient and/or Persistent Linked Data
    Views](images/ui/r5g.png)

    </div>

    </div>

    </div>

      

    </div>

10. As result the following R2RML script should be generated for the
    Northwind DB collection:

    ``` programlisting
    @prefix rr: <http://www.w3.org/ns/r2rml#> .
    @prefix Demo: <http://demo.openlinksw.com/schemas/Demo/> .
    @prefix demo-stat: <http://demo.openlinksw.com/Demo/stat#> .
    @prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
    @prefix void: <http://rdfs.org/ns/void#> .
    @prefix scovo: <http://purl.org/NET/scovo#> .
    @prefix aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> .

    <#TriplesMapCategories> a rr:TriplesMap; rr:logicalTable [ rr:tableSchema "Demo" ; rr:tableOwner "demo" ; rr:tableName "Categories" ];
    rr:subjectMap [ rr:termtype "IRI"  ; rr:template "http://demo.openlinksw.com/Demo/categories/{CategoryID}"; rr:class Demo:Categories; ];
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:categoryid ] ; rr:objectMap [ rr:column "CategoryID" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:categoryname ] ; rr:objectMap [ rr:column "CategoryName" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:description ] ; rr:objectMap [ rr:column "Description" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:picture ] ; rr:objectMap [ rr:column "Picture" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:categories_of_products ] ; rr:objectMap [ rr:parentTriplesMap <#TriplesMapProducts>;  rr:joinCondition [ rr:child "CategoryID" ; rr:parent "CategoryID" ] ; ]; ] .

    <#TriplesMapCustomers> a rr:TriplesMap; rr:logicalTable [ rr:tableSchema "Demo" ; rr:tableOwner "demo" ; rr:tableName "Customers" ];
    rr:subjectMap [ rr:termtype "IRI"  ; rr:template "http://demo.openlinksw.com/Demo/customers/{CustomerID}"; rr:class Demo:Customers; ];
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:customerid ] ; rr:objectMap [ rr:column "CustomerID" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:companyname ] ; rr:objectMap [ rr:column "CompanyName" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:contactname ] ; rr:objectMap [ rr:column "ContactName" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:contacttitle ] ; rr:objectMap [ rr:column "ContactTitle" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:address ] ; rr:objectMap [ rr:column "Address" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:city ] ; rr:objectMap [ rr:column "City" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:region ] ; rr:objectMap [ rr:column "Region" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:postalcode ] ; rr:objectMap [ rr:column "PostalCode" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:country ] ; rr:objectMap [ rr:column "Country" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:countrycode ] ; rr:objectMap [ rr:column "CountryCode" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:phone ] ; rr:objectMap [ rr:column "Phone" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:fax ] ; rr:objectMap [ rr:column "Fax" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:customers_of_orders ] ; rr:objectMap [ rr:parentTriplesMap <#TriplesMapOrders>;  rr:joinCondition [ rr:child "CustomerID" ; rr:parent "CustomerID" ] ; ]; ] .

    <#TriplesMapEmployees> a rr:TriplesMap; rr:logicalTable [ rr:tableSchema "Demo" ; rr:tableOwner "demo" ; rr:tableName "Employees" ];
    rr:subjectMap [ rr:termtype "IRI"  ; rr:template "http://demo.openlinksw.com/Demo/employees/{EmployeeID}"; rr:class Demo:Employees; ];
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:employeeid ] ; rr:objectMap [ rr:column "EmployeeID" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:lastname ] ; rr:objectMap [ rr:column "LastName" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:firstname ] ; rr:objectMap [ rr:column "FirstName" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:title ] ; rr:objectMap [ rr:column "Title" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:titleofcourtesy ] ; rr:objectMap [ rr:column "TitleOfCourtesy" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:birthdate ] ; rr:objectMap [ rr:column "BirthDate" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:hiredate ] ; rr:objectMap [ rr:column "HireDate" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:address ] ; rr:objectMap [ rr:column "Address" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:city ] ; rr:objectMap [ rr:column "City" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:region ] ; rr:objectMap [ rr:column "Region" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:postalcode ] ; rr:objectMap [ rr:column "PostalCode" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:country ] ; rr:objectMap [ rr:column "Country" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:countrycode ] ; rr:objectMap [ rr:column "CountryCode" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:homephone ] ; rr:objectMap [ rr:column "HomePhone" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:extension ] ; rr:objectMap [ rr:column "Extension" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:photo ] ; rr:objectMap [ rr:column "Photo" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:notes ] ; rr:objectMap [ rr:column "Notes" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:reportsto ] ; rr:objectMap [ rr:column "ReportsTo" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:employees_of_orders ] ; rr:objectMap [ rr:parentTriplesMap <#TriplesMapOrders>;  rr:joinCondition [ rr:child "EmployeeID" ; rr:parent "EmployeeID" ] ; ]; ] .

    <#TriplesMapOrder_Details> a rr:TriplesMap; rr:logicalTable [ rr:tableSchema "Demo" ; rr:tableOwner "demo" ; rr:tableName "Order_Details" ];
    rr:subjectMap [ rr:termtype "IRI"  ; rr:template "http://demo.openlinksw.com/Demo/order_details/{OrderID}/{ProductID}"; rr:class Demo:Order_Details; ];
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:unitprice ] ; rr:objectMap [ rr:column "UnitPrice" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:quantity ] ; rr:objectMap [ rr:column "Quantity" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:discount ] ; rr:objectMap [ rr:column "Discount" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:order_details_has_orders ] ; rr:objectMap [ rr:termtype "IRI" ; rr:template "http://demo.openlinksw.com/Demo/orders/{OrderID}" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:order_details_has_products ] ; rr:objectMap [ rr:termtype "IRI" ; rr:template "http://demo.openlinksw.com/Demo/products/{ProductID}" ]; ] .

    <#TriplesMapOrders> a rr:TriplesMap; rr:logicalTable [ rr:tableSchema "Demo" ; rr:tableOwner "demo" ; rr:tableName "Orders" ];
    rr:subjectMap [ rr:termtype "IRI"  ; rr:template "http://demo.openlinksw.com/Demo/orders/{OrderID}"; rr:class Demo:Orders; ];
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:orderid ] ; rr:objectMap [ rr:column "OrderID" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:orderdate ] ; rr:objectMap [ rr:column "OrderDate" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:requireddate ] ; rr:objectMap [ rr:column "RequiredDate" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:shippeddate ] ; rr:objectMap [ rr:column "ShippedDate" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:freight ] ; rr:objectMap [ rr:column "Freight" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:shipname ] ; rr:objectMap [ rr:column "ShipName" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:shipaddress ] ; rr:objectMap [ rr:column "ShipAddress" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:shipcity ] ; rr:objectMap [ rr:column "ShipCity" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:shipregion ] ; rr:objectMap [ rr:column "ShipRegion" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:shippostalcode ] ; rr:objectMap [ rr:column "ShipPostalCode" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:shipcountry ] ; rr:objectMap [ rr:column "ShipCountry" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:shipcountrycode ] ; rr:objectMap [ rr:column "ShipCountryCode" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:rowguid ] ; rr:objectMap [ rr:column "ROWGUID" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:orders_has_customers ] ; rr:objectMap [ rr:termtype "IRI" ; rr:template "http://demo.openlinksw.com/Demo/customers/{CustomerID}" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:orders_has_employees ] ; rr:objectMap [ rr:termtype "IRI" ; rr:template "http://demo.openlinksw.com/Demo/employees/{EmployeeID}" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:orders_has_shippers ] ; rr:objectMap [ rr:termtype "IRI" ; rr:template "http://demo.openlinksw.com/Demo/shippers/{ShipVia}" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:orders_of_order_details ] ; rr:objectMap [ rr:parentTriplesMap <#TriplesMapOrder_Details>;  rr:joinCondition [ rr:child "OrderID" ; rr:parent "OrderID" ] ; ]; ] .

    <#TriplesMapProducts> a rr:TriplesMap; rr:logicalTable [ rr:tableSchema "Demo" ; rr:tableOwner "demo" ; rr:tableName "Products" ];
    rr:subjectMap [ rr:termtype "IRI"  ; rr:template "http://demo.openlinksw.com/Demo/products/{ProductID}"; rr:class Demo:Products; ];
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:productid ] ; rr:objectMap [ rr:column "ProductID" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:productname ] ; rr:objectMap [ rr:column "ProductName" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:quantityperunit ] ; rr:objectMap [ rr:column "QuantityPerUnit" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:unitprice ] ; rr:objectMap [ rr:column "UnitPrice" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:unitsinstock ] ; rr:objectMap [ rr:column "UnitsInStock" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:unitsonorder ] ; rr:objectMap [ rr:column "UnitsOnOrder" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:reorderlevel ] ; rr:objectMap [ rr:column "ReorderLevel" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:discontinued ] ; rr:objectMap [ rr:column "Discontinued" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:products_has_categories ] ; rr:objectMap [ rr:termtype "IRI" ; rr:template "http://demo.openlinksw.com/Demo/categories/{CategoryID}" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:products_has_suppliers ] ; rr:objectMap [ rr:termtype "IRI" ; rr:template "http://demo.openlinksw.com/Demo/suppliers/{SupplierID}" ]; ] ;
    rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:products_of_order_details ] ; rr:objectMap [ rr:parentTriplesMap <#TriplesMapOrder_Details>;  rr:joinCondition [ rr:child "ProductID" ; rr:parent "ProductID" ] ; ]; ] .
    ```

</div>

</div>
