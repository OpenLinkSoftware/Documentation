<div id="derivedtables" class="section">

<div class="titlepage">

<div>

<div>

### 9.19.7. Derived Tables

</div>

</div>

</div>

A SELECT expression may be used in the place of a table in a FROM
clause. This provides control over where DISTINCT and ORDER BY
operations are evaluated.

``` programlisting
select ProductName, UnitsInStock
    from (select distinct ProductID from Order_Details) O,
        Products where Products.ProductID = O.ProductID;
```

This retrieves the name and quantity of products that have been ordered.

An equivalent phrasing would be

``` programlisting
select distinct ProductName, UnitsInStock
   from Order_Details O, Products where Products.ProductID = O.ProductID;
```

The difference is that the latter retrieves a Products row for each
order line whereas as the first retrieves a products row for each
distinct product in the order lines. The first is therefore faster to
evaluate. Also note that the rows in the DISTINCT buffer in the first
example only consist of the product id whereas they are much longer in
the second example.

Note that a correlation name is required for derived tables since the
derived table is as such anonymous.

</div>
