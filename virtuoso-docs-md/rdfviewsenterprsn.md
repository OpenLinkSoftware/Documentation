<div id="rdfviewsenterprsn" class="section">

<div class="titlepage">

<div>

<div>

### 16.8.10. SQL Server's Northwind Demo Database

</div>

</div>

</div>

``` programlisting
use DB;

DB.DBA.exec_stmt ('UPDATE WS.WS.SYS_DAV_RES set RES_TYPE=\'image/jpeg\' where RES_FULL_PATH like \'/DAV/VAD/demo/sql/CAT%\'', 0)
;

DB.DBA.exec_stmt ('UPDATE WS.WS.SYS_DAV_RES set RES_TYPE=\'image/jpeg\' where RES_FULL_PATH like \'/DAV/VAD/demo/sql/EMP%\'', 0)
;

GRANT SELECT ON "Demo"."demo"."Products" TO "SPARQL";
GRANT SELECT ON "Demo"."demo"."Suppliers" TO "SPARQL";
GRANT SELECT ON "Demo"."demo"."Shippers" TO "SPARQL";
GRANT SELECT ON "Demo"."demo"."Categories" TO "SPARQL";
GRANT SELECT ON "Demo"."demo"."Customers" TO "SPARQL";
GRANT SELECT ON "Demo"."demo"."Employees" TO "SPARQL";
GRANT SELECT ON "Demo"."demo"."Orders" TO "SPARQL";
GRANT SELECT ON "Demo"."demo"."Order_Details" TO "SPARQL";
GRANT SELECT ON "Demo"."demo"."Countries" TO "SPARQL";
GRANT SELECT ON "Demo"."demo"."Provinces" TO "SPARQL";

SPARQL drop quad map graph iri("http://^{URIQADefaultHost}^/Northwind") .
;

SPARQL drop quad map virtrdf:NorthwindDemo .
;

SPARQL
prefix northwind: <http://demo.openlinksw.com/schemas/northwind#>
drop iri class northwind:Category .
drop iri class northwind:CategoryDoc .
drop iri class northwind:Shipper .
drop iri class northwind:ShipperDoc .
drop iri class northwind:Supplier .
drop iri class northwind:SupplierDoc .
drop iri class northwind:Product .
drop iri class northwind:ProductDoc .
drop iri class northwind:Customer .
drop iri class northwind:CustomerDoc .
drop iri class northwind:Employee .
drop iri class northwind:EmployeeDoc .
drop iri class northwind:Order .
drop iri class northwind:OrderDoc .
drop iri class northwind:CustomerContact .
drop iri class northwind:CustomerContactDoc .
drop iri class northwind:OrderLine .
drop iri class northwind:OrderLineDoc .
drop iri class northwind:Province .
drop iri class northwind:ProvinceDoc .
drop iri class northwind:Country .
drop iri class northwind:CountryDoc .
drop iri class northwind:Flag .
drop iri class northwind:FlagDoc .
drop iri class northwind:dbpedia_iri2 .
drop iri class northwind:EmployeePhoto .
drop iri class northwind:CategoryPhoto .

drop iri class northwind:category_iri .
drop iri class northwind:categorydoc_iri .
drop iri class northwind:shipper_iri .
drop iri class northwind:shipperdoc_iri .
drop iri class northwind:supplier_iri .
drop iri class northwind:supplierdoc_iri .
drop iri class northwind:product_iri .
drop iri class northwind:productdoc_iri .
drop iri class northwind:customer_iri .
drop iri class northwind:customerdoc_iri .
drop iri class northwind:employee_iri .
drop iri class northwind:employeedoc_iri .
drop iri class northwind:order_iri .
drop iri class northwind:orderdoc_iri .
drop iri class northwind:customercontact_iri .
drop iri class northwind:customercontactdoc_iri .
drop iri class northwind:orderline_iri .
drop iri class northwind:orderlinedoc_iri .
drop iri class northwind:province_iri .
drop iri class northwind:provincedoc_iri .
drop iri class northwind:country_iri .
drop iri class northwind:countrydoc_iri .
drop iri class northwind:employeephoto_iri .
drop iri class northwind:categoryphoto_iri .
drop iri class northwind:flag_iri .
drop iri class northwind:flagdoc_iri .
;

SPARQL
prefix northwind: <http://demo.openlinksw.com/schemas/northwind#>

create iri class northwind:Category "http://^{URIQADefaultHost}^/Northwind/Category/%d#this" (in category_id integer not null) .
create iri class northwind:CategoryDoc "http://^{URIQADefaultHost}^/Northwind/Category/%d" (in category_id integer not null) .
create iri class northwind:Shipper "http://^{URIQADefaultHost}^/Northwind/Shipper/%d#this" (in shipper_id integer not null) .
create iri class northwind:ShipperDoc "http://^{URIQADefaultHost}^/Northwind/Shipper/%d" (in shipper_id integer not null) .
create iri class northwind:Supplier "http://^{URIQADefaultHost}^/Northwind/Supplier/%d#this" (in supplier_id integer not null) .
create iri class northwind:SupplierDoc "http://^{URIQADefaultHost}^/Northwind/Supplier/%d" (in supplier_id integer not null) .
create iri class northwind:Product   "http://^{URIQADefaultHost}^/Northwind/Product/%d#this" (in product_id integer not null) .
create iri class northwind:ProductDoc   "http://^{URIQADefaultHost}^/Northwind/Product/%d" (in product_id integer not null) .
create iri class northwind:Customer "http://^{URIQADefaultHost}^/Northwind/Customer/%U#this" (in customer_id varchar not null) .
create iri class northwind:CustomerDoc "http://^{URIQADefaultHost}^/Northwind/Customer/%U" (in customer_id varchar not null) .
create iri class northwind:Employee "http://^{URIQADefaultHost}^/Northwind/Employee/%U_%U_%d#this" (in employee_firstname varchar not null, in employee_lastname varchar not null, in employee_id integer not null) .
create iri class northwind:EmployeeDoc "http://^{URIQADefaultHost}^/Northwind/Employee/%U_%U_%d" (in employee_firstname varchar not null, in employee_lastname varchar not null, in employee_id integer not null) .
create iri class northwind:Order "http://^{URIQADefaultHost}^/Northwind/Order/%d#this" (in order_id integer not null) .
create iri class northwind:OrderDoc "http://^{URIQADefaultHost}^/Northwind/Order/%d" (in order_id integer not null) .
create iri class northwind:CustomerContact "http://^{URIQADefaultHost}^/Northwind/CustomerContact/%U#this" (in customer_id varchar not null) .
create iri class northwind:CustomerContactDoc "http://^{URIQADefaultHost}^/Northwind/CustomerContact/%U" (in customer_id varchar not null) .
create iri class northwind:OrderLine "http://^{URIQADefaultHost}^/Northwind/OrderLine/%d/%d#this" (in order_id integer not null, in product_id integer not null) .
create iri class northwind:OrderLineDoc "http://^{URIQADefaultHost}^/Northwind/OrderLine/%d/%d" (in order_id integer not null, in product_id integer not null) .
create iri class northwind:Province "http://^{URIQADefaultHost}^/Northwind/Province/%U/%U#this" (in country_name varchar not null, in province_name varchar not null) .
create iri class northwind:ProvinceDoc "http://^{URIQADefaultHost}^/Northwind/Province/%U/%U" (in country_name varchar not null, in province_name varchar not null) .
create iri class northwind:Country "http://^{URIQADefaultHost}^/Northwind/Country/%U#this" (in country_name varchar not null) .
create iri class northwind:CountryDoc "http://^{URIQADefaultHost}^/Northwind/Country/%U" (in country_name varchar not null) .
create iri class northwind:Flag "http://^{URIQADefaultHost}^%U#this" (in flag_path varchar not null) .
create iri class northwind:FlagDoc "http://^{URIQADefaultHost}^%U" (in flag_path varchar not null) .
create iri class northwind:dbpedia_iri2 "http://dbpedia.org/resource/%U" (in uname varchar not null) .
create iri class northwind:EmployeePhoto "http://^{URIQADefaultHost}^/DAV/VAD/demo/sql/EMP%d#this" (in emp_id varchar not null) .
create iri class northwind:CategoryPhoto "http://^{URIQADefaultHost}^/DAV/VAD/demo/sql/CAT%d#this" (in category_id varchar not null) .
create iri class northwind:Phone "tel:%s" (in phone_number varchar) .
create iri class northwind:Fax "fax:%s" (in fax_number varchar) .
;

SPARQL
prefix northwind: <http://demo.openlinksw.com/schemas/northwind#>
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
prefix sioc: <http://rdfs.org/sioc/ns#>
prefix foaf: <http://xmlns.com/foaf/0.1/>
prefix owl: <http://www.w3.org/2002/07/owl#>
prefix wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>

alter quad storage virtrdf:DefaultQuadStorage
FROM Demo.demo.Products as products
FROM Demo.demo.Suppliers as suppliers
FROM Demo.demo.Shippers as shippers
FROM Demo.demo.Categories as categories
FROM Demo.demo.Customers as customers
FROM Demo.demo.Employees as employees
FROM Demo.demo.Orders as orders
FROM Demo.demo.Order_Details as order_lines
FROM Demo.demo.Countries as countries
FROM Demo.demo.Provinces as provinces
where (^{suppliers.}^.Country = ^{countries.}^.Name)
where (^{customers.}^.Country = ^{countries.}^.Name)
where (^{employees.}^.Country = ^{countries.}^.Name)
where (^{orders.}^.ShipCountry = ^{countries.}^.Name)
{
        create virtrdf:NorthwindDemo as graph iri ("http://^{URIQADefaultHost}^/Northwind") option (exclusive)
        {
                northwind:CustomerContact (customers.CustomerID)
                        a foaf:Person
                                as virtrdf:CustomerContact-foaf_Person .

                northwind:CustomerContact (customers.CustomerID)
                        a northwind:CustomerContact
                                as virtrdf:CustomerContact-CustomerContact;
                        foaf:name customers.ContactName
                                as virtrdf:CustomerContact-contact_name ;
                        foaf:phone northwind:Phone (customers.Phone)
                                as virtrdf:CustomerContact-foaf_phone ;
                        northwind:is_contact_at northwind:Customer (customers.CustomerID)
                                as virtrdf:CustomerContact-is_contact_at ;
                        northwind:country northwind:Country (customers.Country)
                                as virtrdf:CustomerContact-country ;
                        rdfs:isDefinedBy northwind: .

                northwind:CustomerContactDoc (customers.CustomerID)
                        a northwind:CustomerContactDoc
                                as virtrdf:CustomerContactDoc-CustomerID ;
                        a foaf:Document
                                as virtrdf:CustomerContactDoc-foaf_DocCustomerID ;
                        foaf:primaryTopic northwind:CustomerContact (customers.CustomerID)
                                as virtrdf:CustomerContactDoc-foaf_primarytopic ;
                        rdfs:isDefinedBy northwind: .

                northwind:Country (customers.Country)
                        northwind:is_country_of
                northwind:CustomerContact (customers.CustomerID) as virtrdf:CustomerContact-is_country_of .

                northwind:Product (products.ProductID)
                        a northwind:Product
                                as virtrdf:Product-ProductID ;
                        northwind:has_category northwind:Category (products.CategoryID)
                                as virtrdf:Product-product_has_category ;
                        northwind:has_supplier northwind:Supplier (products.SupplierID)
                                as virtrdf:Product-product_has_supplier ;
                        northwind:productName products.ProductName
                                as virtrdf:Product-name_of_product ;
                        northwind:quantityPerUnit products.QuantityPerUnit
                                as virtrdf:Product-quantity_per_unit ;
                        northwind:unitPrice products.UnitPrice
                                as virtrdf:Product-unit_price ;
                        northwind:unitsInStock products.UnitsInStock
                                as virtrdf:Product-units_in_stock ;
                        northwind:unitsOnOrder products.UnitsOnOrder
                                as virtrdf:Product-units_on_order ;
                        northwind:reorderLevel products.ReorderLevel
                                as virtrdf:Product-reorder_level ;
                        northwind:discontinued products.Discontinued
                                as virtrdf:Product-discontinued ;
                        rdfs:isDefinedBy northwind: .

                northwind:ProductDoc (products.ProductID)
                        a northwind:ProductDoc
                                as virtrdf:ProductDoc-ProductID ;
                        a foaf:Document
                                as virtrdf:ProductDoc-foaf_DocProductID ;
                        foaf:primaryTopic northwind:Product (products.ProductID)
                                as virtrdf:ProductDoc-foaf_primarytopic ;
                        rdfs:isDefinedBy northwind: .

                northwind:Category (products.CategoryID)
                        northwind:category_of northwind:Product (products.ProductID) as virtrdf:Product-category_of .

                northwind:Supplier (products.SupplierID)
                        northwind:supplier_of northwind:Product (products.ProductID) as virtrdf:Product-supplier_of .

                northwind:Supplier (suppliers.SupplierID)
                        a northwind:Supplier
                                as virtrdf:Supplier-SupplierID ;
                        northwind:companyName suppliers.CompanyName
                                as virtrdf:Supplier-company_name ;
                        northwind:contactName suppliers.ContactName
                                as virtrdf:Supplier-contact_name ;
                        northwind:contactTitle suppliers.ContactTitle
                                as virtrdf:Supplier-contact_title ;
                        northwind:address suppliers.Address
                                as virtrdf:Supplier-address ;
                        northwind:city northwind:dbpedia_iri2(suppliers.City)
                                as virtrdf:Supplier-dbpediacity ;
                        northwind:region suppliers.Region
                                as virtrdf:Supplier-region ;
                        northwind:postalCode suppliers.PostalCode
                                as virtrdf:Supplier-postal_code ;
                        northwind:country northwind:Country(suppliers.Country)
                                as virtrdf:Supplier-country ;
                        northwind:phone northwind:Phone (suppliers.Phone)
                                as virtrdf:Supplier-phone ;
                        northwind:fax northwind:Fax (suppliers.Fax)
                                as virtrdf:Supplier-fax ;
                        northwind:homePage suppliers.HomePage
                                as virtrdf:Supplier-home_page ;
                        rdfs:isDefinedBy northwind: .

                northwind:SupplierDoc (suppliers.SupplierID)
                        a northwind:SupplierDoc
                                as virtrdf:SupplierDoc-SupplierID ;
                        a foaf:Document
                                as virtrdf:SupplierDoc-foaf_DocSupplierID ;
                        foaf:primaryTopic northwind:Supplier (suppliers.SupplierID)
                                as virtrdf:SupplierDoc-foaf_primarytopic ;
                        rdfs:isDefinedBy northwind: .

                northwind:Country (suppliers.Country)
                        northwind:is_country_of
                northwind:Supplier (suppliers.SupplierID) as virtrdf:Supplier-is_country_of .

                northwind:Category (categories.CategoryID)
                        a northwind:Category
                                as virtrdf:Category-CategoryID ;
                        northwind:categoryName categories.CategoryName
                                as virtrdf:Category-home_page ;
                        northwind:description categories.Description
                                as virtrdf:Category-description ;
                        foaf:img northwind:CategoryPhoto(categories.CategoryID)
                                as virtrdf:Category-categories.CategoryPhoto ;
                        rdfs:isDefinedBy northwind: .

                northwind:CategoryDoc (categories.CategoryID)
                        a northwind:CategoryDoc
                                as virtrdf:CategoryDoc-CategoryID ;
                        a foaf:Document
                                as virtrdf:CategoryDoc-foaf_DocCategoryID ;
                        foaf:primaryTopic northwind:Category (categories.CategoryID)
                                as virtrdf:CategoryDoc-foaf_primarytopic ;
                        rdfs:isDefinedBy northwind: .

                northwind:CategoryPhoto(categories.CategoryID)
                        a northwind:CategoryPhoto
                                as virtrdf:Category-categories.CategoryPhotoID ;
                        rdfs:isDefinedBy northwind: .

                northwind:Shipper (shippers.ShipperID)
                        a northwind:Shipper
                                as virtrdf:Shipper-ShipperID ;
                        northwind:companyName shippers.CompanyName
                                as virtrdf:Shipper-company_name ;
                        northwind:phone northwind:Phone (shippers.Phone)
                                as virtrdf:Shipper-phone ;
                        rdfs:isDefinedBy northwind: .

                northwind:ShipperDoc (shippers.ShipperID)
                        a northwind:ShipperDoc
                                as virtrdf:ShipperDoc-ShipperID ;
                        a foaf:Document
                                as virtrdf:ShipperDoc-foaf_DocShipperID ;
                        foaf:primaryTopic northwind:Shipper (shippers.ShipperID)
                                as virtrdf:ShipperDoc-foaf_primarytopic ;
                        rdfs:isDefinedBy northwind: .

                northwind:Customer (customers.CustomerID)
                        a  northwind:Customer
                                as virtrdf:Customer-CustomerID2 ;
                        a  foaf:Organization
                                as virtrdf:Customer-CustomerID ;
                        foaf:name customers.CompanyName
                                as virtrdf:Customer-foaf_name ;
                        northwind:companyName customers.CompanyName
                                as virtrdf:Customer-company_name ;
                        northwind:has_contact northwind:CustomerContact (customers.CustomerID)
                                as virtrdf:Customer-contact ;
                        northwind:country northwind:Country (customers.Country)
                                as virtrdf:Customer-country ;
                        northwind:contactName customers.ContactName
                                as virtrdf:Customer-contact_name ;
                        northwind:contactTitle customers.ContactTitle
                                as virtrdf:Customer-contact_title ;
                        northwind:address customers.Address
                                as virtrdf:Customer-address ;
                        northwind:city northwind:dbpedia_iri2(customers.City)
                                as virtrdf:Customer-dbpediacity ;
                        northwind:region customers.Region
                                as virtrdf:Customer-region ;
                        northwind:PostalCode customers.PostalCode
                                as virtrdf:Customer-postal_code ;
                        foaf:phone northwind:Phone (customers.Phone)
                                as virtrdf:Customer-foaf_phone ;
                        northwind:phone northwind:Phone (customers.Phone)
                                as virtrdf:Customer-phone ;
                        northwind:fax northwind:Fax (customers.Fax)
                                as virtrdf:Customer-fax ;
                        rdfs:isDefinedBy northwind: .

                northwind:CustomerDoc (customers.CustomerID)
                        a  northwind:CustomerDoc
                                as virtrdf:CustomerDoc-CustomerID2 ;
                        a  foaf:Document
                                as virtrdf:CustomerDoc-CustomerID3 ;
                        foaf:primaryTopic northwind:Customer (customers.CustomerID)
                                as virtrdf:CustomerDoc-foaf_primarytopic ;
                        rdfs:isDefinedBy northwind: .

                northwind:Country (customers.Country)
                        northwind:is_country_of
                northwind:Customer (customers.CustomerID) as virtrdf:Customer-is_country_of .

                northwind:Employee (employees.FirstName, employees.LastName, employees.EmployeeID)
                        a northwind:Employee
                                as virtrdf:Employee-EmployeeID2 ;
                        a foaf:Person
                                as virtrdf:Employee-EmployeeID ;
                        foaf:surname employees.LastName
                                as virtrdf:Employee-foaf_last_name ;
                        northwind:lastName employees.LastName
                                as virtrdf:Employee-last_name ;
                        foaf:firstName employees.FirstName
                                as virtrdf:Employee-foaf_first_name ;
                        northwind:firstName employees.FirstName
                                as virtrdf:Employee-first_name ;
                        foaf:title employees.Title
                                as virtrdf:Employee-title ;
                        northwind:titleOfCourtesy employees.TitleOfCourtesy
                                as virtrdf:Employee-title_of_courtesy ;
                        foaf:birthday employees.BirthDate
                                as virtrdf:Employee-foaf_birth_date ;
                        northwind:birthday employees.BirthDate
                                as virtrdf:Employee-birth_date ;
                        northwind:hireDate employees.HireDate
                                as virtrdf:Employee-hire_date ;
                        northwind:address employees.Address
                                as virtrdf:Employee-address ;
                        northwind:city northwind:dbpedia_iri2(employees.City)
                                as virtrdf:Employee-dbpediacity ;
                        northwind:region employees.Region
                                as virtrdf:Employee-region ;
                        northwind:postalCode employees.PostalCode
                                as virtrdf:Employee-postal_code ;
                        northwind:country northwind:Country(employees.Country)
                                as virtrdf:Employee-country ;
                        foaf:phone employees.HomePhone
                                as virtrdf:Employee-home_phone ;
                        northwind:extension employees.Extension
                                as virtrdf:Employee-extension ;
                        northwind:notes employees.Notes
                                as virtrdf:Employee-notes ;
                        northwind:reportsTo northwind:Employee(employees.FirstName, employees.LastName, employees.ReportsTo) where (^{employees.}^.ReportsTo = ^{employees.}^.EmployeeID)
                                as virtrdf:Employee-reports_to ;
                        foaf:img northwind:EmployeePhoto(employees.EmployeeID)
                                as virtrdf:Employee-employees.EmployeePhoto ;
                        rdfs:isDefinedBy northwind: .

                northwind:EmployeeDoc (employees.FirstName, employees.LastName, employees.EmployeeID)
                        a  northwind:EmployeeDoc
                                as virtrdf:EmployeeDoc-EmployeeID2 ;
                        a  foaf:Document
                                as virtrdf:EmployeeDoc-EmployeeID3 ;
                        foaf:primaryTopic northwind:Employee (employees.FirstName, employees.LastName, employees.EmployeeID)
                                as virtrdf:EmployeeDoc-foaf_primarytopic ;
                        rdfs:isDefinedBy northwind: .

                northwind:EmployeePhoto(employees.EmployeeID)
                        a northwind:EmployeePhoto
                                as virtrdf:Employee-employees.EmployeePhotoId ;
                        rdfs:isDefinedBy northwind: .

                northwind:Employee (employees.FirstName, employees.LastName, orders.EmployeeID)
                        northwind:is_salesrep_of
                northwind:Order (orders.OrderID) where (^{orders.}^.EmployeeID = ^{employees.}^.EmployeeID) as virtrdf:Order-is_salesrep_of .

                northwind:Country (employees.Country)
                        northwind:is_country_of
                northwind:Employee (employees.FirstName, employees.LastName, employees.EmployeeID) as virtrdf:Employee-is_country_of .

                northwind:Order (orders.OrderID)
                        a northwind:Order
                                as virtrdf:Order-Order ;
                        northwind:has_customer northwind:Customer (orders.CustomerID)
                                as virtrdf:Order-order_has_customer ;
                        northwind:has_salesrep northwind:Employee (employees.FirstName, employees.LastName, orders.EmployeeID) where (^{orders.}^.EmployeeID = ^{employees.}^.EmployeeID)
                                as virtrdf:Customer-has_salesrep ;
                        northwind:has_employee northwind:Employee (employees.FirstName, employees.LastName, orders.EmployeeID) where (^{orders.}^.EmployeeID = ^{employees.}^.EmployeeID)
                                as virtrdf:Order-order_has_employee ;
                        northwind:orderDate orders.OrderDate
                                as virtrdf:Order-order_date ;
                        northwind:requiredDate orders.RequiredDate
                                as virtrdf:Order-required_date ;
                        northwind:shippedDate orders.ShippedDate
                                as virtrdf:Order-shipped_date ;
                        northwind:order_ship_via northwind:Shipper (orders.ShipVia)
                                as virtrdf:Order-order_ship_via ;
                        northwind:freight orders.Freight
                                as virtrdf:Order-freight ;
                        northwind:shipName orders.ShipName
                                as virtrdf:Order-ship_name ;
                        northwind:shipAddress orders.ShipAddress
                                as virtrdf:Order-ship_address ;
                        northwind:shipCity northwind:dbpedia_iri2(orders.ShipCity)
                                as virtrdf:Order-dbpediaship_city ;
                        northwind:shipRegion orders.ShipRegion
                                as virtrdf:Order-ship_region ;
                        northwind:shipPostal_code orders.ShipPostalCode
                                as virtrdf:Order-ship_postal_code ;
                        northwind:shipCountry northwind:Country(orders.ShipCountry)
                                as virtrdf:ship_country ;
                        rdfs:isDefinedBy northwind: .

                northwind:OrderDoc (orders.OrderID)
                        a  northwind:OrderDoc
                                as virtrdf:OrderDoc-OrderID2 ;
                        a  foaf:Document
                                as virtrdf:OrderDoc-OrderID3 ;
                        foaf:primaryTopic northwind:Order (orders.OrderID)
                                as virtrdf:OrderDoc-foaf_primarytopic ;
                        rdfs:isDefinedBy northwind: .

                northwind:Country (orders.ShipCountry)
                        northwind:is_ship_country_of
                northwind:Order (orders.OrderID) as virtrdf:Order-is_country_of .

                northwind:Customer (orders.CustomerID)
                        northwind:has_order northwind:Order (orders.OrderID) as virtrdf:Order-has_order .

                northwind:Shipper (orders.ShipVia)
                        northwind:ship_order northwind:Order (orders.OrderID) as virtrdf:Order-ship_order .

                northwind:OrderLine (order_lines.OrderID, order_lines.ProductID)
                        a northwind:OrderLine
                                as virtrdf:OrderLine-OrderLines ;
                        northwind:has_order_id northwind:Order (order_lines.OrderID)
                                as virtrdf:order_lines_has_order_id ;
                        northwind:has_product_id northwind:Product (order_lines.ProductID)
                                as virtrdf:order_lines_has_product_id ;
                        northwind:unitPrice order_lines.UnitPrice
                                as virtrdf:OrderLine-unit_price ;
                        northwind:quantity order_lines.Quantity
                                as virtrdf:OrderLine-quantity ;
                        northwind:discount order_lines.Discount
                                as virtrdf:OrderLine-discount ;
                        rdfs:isDefinedBy northwind: .

                northwind:OrderLineDoc (order_lines.OrderID, order_lines.ProductID)
                        a  northwind:OrderLineDoc
                                as virtrdf:OrderLineDoc-OrderLineID2 ;
                        a  foaf:Document
                                as virtrdf:OrderLineDoc-OrderLineID3 ;
                        foaf:primaryTopic northwind:OrderLine (order_lines.OrderID, order_lines.ProductID)
                                as virtrdf:OrderLineDoc-foaf_primarytopic ;
                        rdfs:isDefinedBy northwind: .

                northwind:Order (orders.OrderID)
                        northwind:is_order_of
                northwind:OrderLine (order_lines.OrderID, order_lines.ProductID) where (^{orders.}^.OrderID = ^{order_lines.}^.OrderID) as virtrdf:Order-is_order_of .

                northwind:Product (products.ProductID)
                        northwind:is_product_of
                northwind:OrderLine (order_lines.OrderID, order_lines.ProductID) where (^{products.}^.ProductID = ^{order_lines.}^.ProductID) as virtrdf:Product-is_product_of .

                northwind:Country (countries.Name)
                        a northwind:Country
                                as virtrdf:Country-Type2 ;
                        a wgs:SpatialThing
                                as virtrdf:Country-Type ;
                        owl:sameAs northwind:dbpedia_iri2 (countries.Name) ;
                        northwind:name countries.Name
                                as virtrdf:Country-Name ;
                        northwind:code countries.Code
                                as virtrdf:Country-Code ;
                        northwind:smallFlagDAVResourceName countries.SmallFlagDAVResourceName
                                as virtrdf:Country-SmallFlagDAVResourceName ;
                        northwind:largeFlagDAVResourceName countries.LargeFlagDAVResourceName
                                as virtrdf:Country-LargeFlagDAVResourceName ;
                        northwind:smallFlagDAVResourceURI northwind:Flag(countries.SmallFlagDAVResourceURI)
                                as virtrdf:Country-SmallFlagDAVResourceURI ;
                        northwind:largeFlagDAVResourceURI northwind:Flag(countries.LargeFlagDAVResourceURI)
                                as virtrdf:Country-LargeFlagDAVResourceURI ;
                        wgs:lat countries.Lat
                                as virtrdf:Country-Lat ;
                        wgs:long countries.Lng
                                as virtrdf:Country-Lng ;
                        rdfs:isDefinedBy northwind: .

                northwind:CountryDoc (countries.Name)
                        a  northwind:CountryDoc
                                as virtrdf:CountryDoc-CountryID2 ;
                        a  foaf:Document
                                as virtrdf:CountryDoc-CountryID3 ;
                        foaf:primaryTopic northwind:Country (countries.Name)
                                as virtrdf:CountryDoc-foaf_primarytopic ;
                        rdfs:isDefinedBy northwind: .

                northwind:Country (countries.Name)
                        northwind:has_province
                northwind:Province (provinces.CountryCode, provinces.Province) where (^{provinces.}^.CountryCode = ^{countries.}^.Code) as virtrdf:Country-has_province .

                northwind:Province (provinces.CountryCode, provinces.Province)
                        a northwind:Province
                                as virtrdf:Province-Provinces ;
                        owl:sameAs northwind:dbpedia_iri2 (provinces.Province) ;
                        northwind:has_country_code provinces.CountryCode
                                as virtrdf:has_country_code ;
                        northwind:provinceName provinces.Province
                                as virtrdf:Province-ProvinceName ;
                        rdfs:isDefinedBy northwind: .

                northwind:ProvinceDoc (provinces.CountryCode, provinces.Province)
                        a  northwind:ProvinceDoc
                                as virtrdf:ProvinceDoc-ProvinceID2 ;
                        a  foaf:Document
                                as virtrdf:ProvinceDoc-ProvinceID3 ;
                        foaf:primaryTopic northwind:Province (provinces.CountryCode, provinces.Province)
                                as virtrdf:ProvinceDoc-foaf_primarytopic ;
                        rdfs:isDefinedBy northwind: .

                northwind:Province (provinces.CountryCode, provinces.Province)
                        northwind:is_province_of
                northwind:Country (countries.Name) where  (^{countries.}^.Code = ^{provinces.}^.CountryCode) as virtrdf:Province-country_of .
        }.
}.
;

delete FROM DB.DBA.URL_REWRITE_RULE_LIST where urrl_list like 'demo_nw%';
delete FROM DB.DBA.URL_REWRITE_RULE where urr_rule like 'demo_nw%';

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'demo_nw_rule2',
    1,
    '(/[^#]*)',
    vector('path'),
    1,
    '/sparql?query=DESCRIBE+%%3Chttp%%3A//^{URIQADefaultHost}^%U%%23this%%3E+%%3Chttp%%3A//^{URIQADefaultHost}^%U%%3E+FROM+%%3Chttp%%3A//^{URIQADefaultHost}^/Northwind%%3E&format=%U',
    vector('path', 'path', '*accept*'),
    null,
    '(text/rdf.n3)|(application/rdf.xml)',
    0,
    null
    );

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'demo_nw_rule1',
    1,
    '(/[^#]*)',
    vector('path'),
    1,
    '/about/html/http/^{URIQADefaultHost}^%s',
    vector('path'),
    null,
    '(text/html)|(\\*/\\*)',
    0,
    303
    );

DB.DBA.URLREWRITE_CREATE_RULELIST (
    'demo_nw_rule_list1',
    1,
    vector (
                'demo_nw_rule1',
                'demo_nw_rule2'
          ));

VHOST_REMOVE (lpath=>'/Northwind');
DB.DBA.VHOST_DEFINE (lpath=>'/Northwind', ppath=>'/DAV/home/demo/', vsp_user=>'dba', is_dav=>1,
          is_brws=>0, opts=>vector ('url_rewrite', 'demo_nw_rule_list1'));

create procedure DB.DBA.LOAD_NW_ONTOLOGY_FROM_DAV()
{
  declare content1, urihost varchar;
  SELECT cast (RES_CONTENT as varchar) into content1 FROM WS.WS.SYS_DAV_RES where RES_FULL_PATH = '/DAV/VAD/demo/sql/nw.owl';
  DB.DBA.RDF_LOAD_RDFXML (content1, 'http://demo.openlinksw.com/schemas/northwind#', 'http://demo.openlinksw.com/schemas/NorthwindOntology/1.0/');
  urihost := cfg_item_value(virtuoso_ini_path(), 'URIQA','DefaultHost');
  if (urihost = 'demo.openlinksw.com')
  {
    DB.DBA.VHOST_REMOVE (lpath=>'/schemas/northwind');
    DB.DBA.VHOST_DEFINE (lpath=>'/schemas/northwind', ppath=>'/DAV/VAD/demo/sql/nw.owl', vsp_user=>'dba', is_dav=>1, is_brws=>0);
    DB.DBA.VHOST_REMOVE (lpath=>'/schemas/northwind#');
    DB.DBA.VHOST_DEFINE (lpath=>'/schemas/northwind#', ppath=>'/DAV/VAD/demo/sql/nw.owl', vsp_user=>'dba', is_dav=>1, is_brws=>0);
  }
};

DB.DBA.LOAD_NW_ONTOLOGY_FROM_DAV();
drop procedure DB.DBA.LOAD_NW_ONTOLOGY_FROM_DAV;

DB.DBA.XML_SET_NS_DECL ('northwind', 'http://demo.openlinksw.com/schemas/northwind#', 2);
```

<span class="emphasis">*Basic Northwind Ontology*</span>

``` programlisting
<?xml version="1.0" encoding="utf-8"?>

<!--
 -
 -
 -  This file is part of the OpenLink Software Virtuoso Open-Source (VOS)
 -  project.
 -
 -  Copyright (C) 1998-2024 OpenLink Software
 -
 -  This project is free software; you can redistribute it and/or modify it
 -  under the terms of the GNU General Public License as published by the
 -  Free Software Foundation; only version 2 of the License, dated June 1991.
 -
 -  This program is distributed in the hope that it will be useful, but
 -  WITHOUT ANY WARRANTY; without even the implied warranty of
 -  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 -  General Public License for more details.
 -
 -  You should have received a copy of the GNU General Public License along
 -  with this program; if not, write to the Free Software Foundation, Inc.,
 -  51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
 -
-->

<rdf:RDF xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
         xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
         xmlns:owl ="http://www.w3.org/2002/07/owl#"
         xmlns:virtrdf="http://www.openlinksw.com/schemas/virtrdf#"
         xml:base="http://demo.openlinksw.com/schemas/northwind#">
  <owl:Ontology rdf:about="http://demo.openlinksw.com/schemas/northwind#">
        <rdfs:label>Northwind</rdfs:label>
        <rdfs:comment>Northwind database classes and properties</rdfs:comment>
        <virtrdf:catName>Northwind</virtrdf:catName>
        <virtrdf:version>1.00</virtrdf:version>
  </owl:Ontology>

  <rdfs:Class rdf:ID="Product">
    <rdfs:label>Product</rdfs:label>
  </rdfs:Class>
  <rdf:Property rdf:ID="has_category">
    <rdfs:range rdf:resource="#Category"/>
    <rdfs:domain rdf:resource="#Product"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Category</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="has_supplier">
    <rdfs:range rdf:resource="#Supplier"/>
    <rdfs:domain rdf:resource="#Product"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Supplier</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="ProductName">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Product"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>ProductName</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="QuantityPerUnit">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Product"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>QuantityPerUnit</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="UnitPrice">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#double"/>
    <rdfs:domain rdf:resource="#Product"/>
    <rdfs:domain rdf:resource="#OrderLine"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>UnitPrice</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="UnitsInStock">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#integer"/>
    <rdfs:domain rdf:resource="#Product"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>UnitsInStock</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="UnitsOnOrder">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#integer"/>
    <rdfs:domain rdf:resource="#Product"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>UnitsOnOrder</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="ReorderLevel">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#integer"/>
    <rdfs:domain rdf:resource="#Product"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>ReorderLevel</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="Discontinued">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#integer"/>
    <rdfs:domain rdf:resource="#Product"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Discontinued</rdfs:label>
  </rdf:Property>

  <rdfs:Class rdf:ID="Supplier">
    <rdfs:label>Supplier</rdfs:label>
  </rdfs:Class>
  <rdf:Property rdf:ID="CompanyName">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:subPropertyOf rdf:resource="http://xmlns.com/foaf/0.1/name"/>
    <rdfs:domain rdf:resource="#Supplier"/>
    <rdfs:domain rdf:resource="#Shipper"/>
    <rdfs:domain rdf:resource="#Customer"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>CompanyName</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="ContactName">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:subPropertyOf rdf:resource="http://xmlns.com/foaf/0.1/name"/>
    <rdfs:domain rdf:resource="#Supplier"/>
    <rdfs:domain rdf:resource="#Customer"/>
    <rdfs:domain rdf:resource="#CustomerContact"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>ContactName</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="ContactTitle">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:subPropertyOf rdf:resource="http://xmlns.com/foaf/0.1/title"/>
    <rdfs:domain rdf:resource="#Supplier"/>
    <rdfs:domain rdf:resource="#Customer"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>ContactTitle</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="Address">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Supplier"/>
    <rdfs:domain rdf:resource="#Customer"/>
    <rdfs:domain rdf:resource="#Employee"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Address</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="City">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Supplier"/>
    <rdfs:domain rdf:resource="#Customer"/>
    <rdfs:domain rdf:resource="#Employee"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>City</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="Region">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Supplier"/>
    <rdfs:domain rdf:resource="#Customer"/>
    <rdfs:domain rdf:resource="#Employee"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Region</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="PostalCode">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Supplier"/>
    <rdfs:domain rdf:resource="#Customer"/>
    <rdfs:domain rdf:resource="#Employee"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>PostalCode</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="CountryName">
    <rdfs:range rdf:resource="#Country"/>
    <rdfs:domain rdf:resource="#Supplier"/>
    <rdfs:domain rdf:resource="#Customer"/>
    <rdfs:domain rdf:resource="#CustomerContact"/>
    <rdfs:domain rdf:resource="#Employee"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Country</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="Phone">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:subPropertyOf rdf:resource="http://xmlns.com/foaf/0.1/phone"/>
    <rdfs:domain rdf:resource="#Supplier"/>
    <rdfs:domain rdf:resource="#Shipper"/>
    <rdfs:domain rdf:resource="#Customer"/>
    <rdfs:domain rdf:resource="#CustomerContact"/>
    <rdfs:domain rdf:resource="#Employee"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Phone</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="Fax">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Supplier"/>
    <rdfs:domain rdf:resource="#Customer"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Fax</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="HomePage">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Supplier"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>HomePage</rdfs:label>
  </rdf:Property>

  <rdfs:Class rdf:ID="Category">
    <rdfs:label>Category</rdfs:label>
  </rdfs:Class>
  <rdf:Property rdf:ID="CategoryName">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Category"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>CategoryName</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="Description">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Category"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Description</rdfs:label>
  </rdf:Property>

  <rdfs:Class rdf:ID="Shipper">
    <rdfs:label>Shipper</rdfs:label>
  </rdfs:Class>

  <rdfs:Class rdf:ID="CustomerContact">
    <rdfs:label>CustomerContact</rdfs:label>
    <rdfs:subClassOf rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
  </rdfs:Class>

  <rdfs:Class rdf:ID="Customer">
    <rdfs:label>Customer</rdfs:label>
    <rdfs:subClassOf rdf:resource="http://xmlns.com/foaf/0.1/Organization"/>
  </rdfs:Class>

  <rdfs:Class rdf:ID="Employee">
    <rdfs:label>Employee</rdfs:label>
    <rdfs:subClassOf rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
  </rdfs:Class>
  <rdf:Property rdf:ID="LastName">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:subPropertyOf rdf:resource="http://xmlns.com/foaf/0.1/surname"/>
    <rdfs:domain rdf:resource="#Employee"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>LastName</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="FirstName">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:subPropertyOf rdf:resource="http://xmlns.com/foaf/0.1/firstName"/>
    <rdfs:domain rdf:resource="#Employee"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>FirstName</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="Title">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:subPropertyOf rdf:resource="http://xmlns.com/foaf/0.1/title"/>
    <rdfs:domain rdf:resource="#Employee"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Title</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="TitleOfCourtesy">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Employee"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>TitleOfCourtesy</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="BirthDate">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:subPropertyOf rdf:resource="http://xmlns.com/foaf/0.1/birthday"/>
    <rdfs:domain rdf:resource="#Employee"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>BirthDate</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="HireDate">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Employee"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>HireDate</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="Extension">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Employee"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Extension</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="Notes">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Employee"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Notes</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="ReportsTo">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#integer"/>
    <rdfs:domain rdf:resource="#Employee"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>ReportsTo</rdfs:label>
  </rdf:Property>

  <rdfs:Class rdf:ID="Order">
    <rdfs:label>Order</rdfs:label>
  </rdfs:Class>
  <rdf:Property rdf:ID="has_customer">
    <rdfs:range rdf:resource="#Customer"/>
    <rdfs:domain rdf:resource="#Order"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Customer</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="has_employee">
    <rdfs:range rdf:resource="#Employee"/>
    <rdfs:domain rdf:resource="#Order"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Employee</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="OrderDate">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Order"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>OrderDate</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="RequiredDate">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Order"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>RequiredDate</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="ShippedDate">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Order"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>ShippedDate</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="order_ship_via">
    <rdfs:range rdf:resource="#Shipper"/>
    <rdfs:domain rdf:resource="#Order"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Shipper</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="Freight">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#double"/>
    <rdfs:domain rdf:resource="#Order"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Freight</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="ShipName">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Order"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>ShipName</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="ShipAddress">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Order"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>ShipAddress</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="ShipCity">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Order"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>ShipCity</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="ShipRegion">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Order"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>ShipRegion</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="ShipPostalCode">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Order"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>ShipPostalCode</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="ShipCountry">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Order"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>ShipCountry</rdfs:label>
  </rdf:Property>

  <rdfs:Class rdf:ID="OrderLine">
    <rdfs:label>OrderLine</rdfs:label>
  </rdfs:Class>
  <rdf:Property rdf:ID="has_order_id">
    <rdfs:range rdf:resource="#Order"/>
    <rdfs:domain rdf:resource="#OrderLine"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Order</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="has_product_id">
    <rdfs:range rdf:resource="#Product"/>
    <rdfs:domain rdf:resource="#OrderLine"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Product</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="Quantity">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#integer"/>
    <rdfs:domain rdf:resource="#OrderLine"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Quantity</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="Discount">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#double"/>
    <rdfs:domain rdf:resource="#OrderLine"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Discount</rdfs:label>
  </rdf:Property>

  <rdfs:Class rdf:ID="Country">
    <rdfs:label>Country</rdfs:label>
    <rdfs:subClassOf rdf:resource="http://www.w3.org/2003/01/geo/wgs84_pos#SpatialThing"/>
  </rdfs:Class>
  <rdf:Property rdf:ID="Name">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Country"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Name</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="Code">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Country"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Code</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="SmallFlagDAVResourceName">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Country"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>SmallFlagDAVResourceName</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="LargeFlagDAVResourceName">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Country"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>LargeFlagDAVResourceName</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="SmallFlagDAVResourceURI">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Country"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>SmallFlagDAVResourceURI</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="LargeFlagDAVResourceURI">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Country"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>LargeFlagDAVResourceURI</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="Lat">
    <rdfs:range rdf:resource="ttp://www.w3.org/2003/01/geo/wgs84_pos#lat"/>
    <rdfs:domain rdf:resource="#Country"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Lat</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="Lng">
    <rdfs:range rdf:resource="ttp://www.w3.org/2003/01/geo/wgs84_pos#lng"/>
    <rdfs:domain rdf:resource="#Country"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Lng</rdfs:label>
  </rdf:Property>

  <rdfs:Class rdf:ID="Province">
    <rdfs:label>Province</rdfs:label>
  </rdfs:Class>
  <rdf:Property rdf:ID="has_country_code">
    <rdfs:range rdf:resource="#Country"/>
    <rdfs:domain rdf:resource="#Provinces"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>Country Code</rdfs:label>
  </rdf:Property>
  <rdf:Property rdf:ID="ProvinceName">
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
    <rdfs:domain rdf:resource="#Province"/>
    <rdfs:cardinality>1</rdfs:cardinality>
    <rdfs:label>ProvinceName</rdfs:label>
  </rdf:Property>

</rdf:RDF>
```

</div>
