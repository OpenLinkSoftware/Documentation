<div>

<div>

<div>

<div>

### 15.3.6. XQUERY and XML view

</div>

</div>

</div>

Similarly to XPATH, XQUERY may also be used as a query language for XML
views. Virtuoso offers a special case of FLWR expression for this
purpose. It is possible to use the
<a href="xpf_xmlview.html" class="link" title="xmlview"><code
class="function">xmlview()</code></a> function in FOR clause expressions
for querying XML views. This function is similar to document () in the
sense that it sets the source of the path to be the logical root of the
referenced XML view. The XML view must be a constant known at compile
time. A SQL query against the appropriate tables of the XML view is
internally constructed and evaluated at run time, producing XML
fragments from the selected rows. At no point will non-selected parts of
the evaluation of the XML view be physically created. The path
expression following from
<a href="xpf_xmlview.html" class="link" title="xmlview"><code
class="function">xmlview()</code></a> may contain filters involving
XQuery variables bound in the scope of the path expression, thus
allowing joining SQL data to XQuery variable values.

The XQUERY string

``` programlisting
for $cat in xmlview("cat")/category return {$cat}
```

in the query

``` programlisting
select xquery_eval(' {for $cat in xmlview("cat")/category return <q>{$cat}</q>}',
                     xtree_doc('<dummy_tag/>'));
```

is equivalent to the XPATH query string

``` programlisting
XPATH [__view "cat"]/category
```

described above.

The expression xmlview("viewname")/path is not a valid top level SQL
statement, but may be used by xquery_eval() function. The path statement
is translated into SQL query in the context of the "viewname" (i.e. the
necessary table names are taken from "viewname" XML view), so that only
the desired relational data will be queried. Functionality of this kind
of SQL queries is similar to functionality of the SQL fetch statement,
i.e. such a query provides iteration over the result set of a cursor.
The query is executed once for each row in the query expression's result
set. Thus using the CREATE XML VIEW statement and a XQUERY FOR clause
expression with
<a href="xpf_xmlview.html" class="link" title="xmlview"><code
class="function">xmlview()</code></a> function allows you to query the
database and to return the results in the form of an XML document and to
avoid redundant data access. This kind of queries also allows computing
joins between two or more documents and restructuring data.

<div>

|                              |                                                                                                                 |
|:----------------------------:|:----------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                                                                            |
|                              | The \<dummy_tag/\> tag is not used and it is necessary only as an arbitrary argument for xtree_doc() functions. |

</div>

<div>

**Example 15.8. Example 1**

<div>

``` programlisting
create xml view "product" as
{
  "Demo"."demo"."Products" p as "product"
      ("ProductID", "ProductName" as "product_name","UnitPrice" as "price",
      "SupplierID","CategoryID")
    {
      "Demo"."demo"."Suppliers" s as "supplier" ("SupplierID","CompanyName")
    on (s."SupplierID" = p."SupplierID")
       ,
      "Demo"."demo"."Categories" c as "category" ("Description")
    on (c."CategoryID" = p."CategoryID")

    }
}
```

</div>

</div>

  

This declares a two level hierarchy with a product node for each product
and a supplier child node and a category child node of the product.

The following query will return the XML document in which each category
node will contain all suppliers supplying products of the given
category.

``` programlisting
select xquery_eval('
  <document>
    {
      for $cat in xmlview("cat")/category
      return (
        <category description={$cat/@description}>
          {
            distinct (
              for $prod in xmlview("product")/product
              where $cat/@CategoryID=$prod/category/@CategoryID
              return $prod/supplier )
          }
        </category> )
    }
  </document>
  ',
  xtree_doc('<dummy_tag/>')
  );
```

returns the XML document in which each category node contains all
suppliers supplying products of the given category.

<div>

**Example 15.9. Example 2**

<div>

Let a document named suppliers.xml contains supplier elements; each
supplier element in turn contains supplier_id and supplier_name
subelements. The following query

``` programlisting
select xquery_eval('
  <supplier_product>
    {
      for $supp in document("suppliers.xml")/supplier
      return (
        <supplier>{$supp/supplier_name }
          <product_name>
            {
              for $prod in xmlview("product")/product
              where string($supp/supplier_id)=$prod/supplier/@SupplierID
              return string($prod/@product_name)
            }
          </product_name>
        </supplier>)
    }
  </supplier_product>',
  xtree_doc('<dummy_tag/>')
  );
```

returns the XML document that contains supplier elements; each supplier
element in turn contains supplier_name and product_name elements.

</div>

</div>

  

The previous query and the following one show that it is possible to use
variables in a XPATH expression following
<a href="xpf_xmlview.html" class="link" title="xmlview"><code
class="function">xmlview()</code></a> functions.

<div>

**Example 15.10. Example 3**

<div>

The query

``` programlisting
select xquery_eval('
  <document>
    {
      distinct(
        let $ex:= "Ex%"
        for $prod in xmlview("product")//supplier[@CompanyName like $ex]
        return <supp_id>{$prod/@SupplierID}</supp_id>)
    }
  </document>',
  xtree_doc('<dummy_tag/>'));
```

is equivalent to

``` programlisting
select xquery_eval('
  <document>
    {
      distinct(
        for $prod in xmlview("product")//supplier [@CompanyName like "Ex%"]
        return <supp_id>{$prod/@SupplierID}</supp_id>)
    }
  </document>',
  xtree_doc('<dummy_tag/>'));
```

and selects all suppliers having attribute "CompanyName" starting with
"Ex".

</div>

</div>

  

<div>

<div>

<div>

<div>

#### Optimization in the queries with xmlview() function

</div>

</div>

</div>

At least two methods may be used to accelerate the execution of queries
with xmlview() function. The first method assumes that a path statement
following xmlview() function should contain maximum conditions to reduce
the result set. For example, the query

``` programlisting
select xquery_eval('<w>
  {
    for $prod in xmlview("product")/product[@ProductID="1"]
    return <q>{$prod}</q>
  }</w>',
  xtree_doc('<dummy_tag/>'));
```

will be executed faster than

``` programlisting
select xquery_eval('<w>
  {
    for $prod in xmlview("product")/product where $prod[@ProductID="1"]
    return <q>{$prod}</q>
  }</w>',
  xtree_doc('<dummy_tag/>'));
```

due to the SQL query produced from the path expression
'product\[@ProductID="1"\]' reduces the result set in comparison with
the SQL query produced from the path expression 'product' in the second
query.

If we execute a join of two (or more) XML views (or XML document and XML
view), i.e. the query consists of the nested loops, the second method
proposes to carry out a piece of query of the nested loop which is
independent of the outer loop outside the outer loop and uses LET clause
for it. For example, the query

``` programlisting
select xquery_eval('<document>
  {
    let $prod_set:=(for $prod in xmlview("product")/product return $prod)
    for $cat in xmlview("cat")/category
    return (<category description={$cat/@description}$gt;
      {distinct(for $prod in $prod_set
                where $cat/@CategoryID=$prod/category/@CategoryID
                return $prod/supplier)}</category>)}</document>',
   xtree_doc('<dummy_tag/>'));
```

is equivalent to the query in the example 1, but it is about 5 times
faster than original one. This method is especially useful for full
joins. In this case we do not have a full join and this query may be
optimized without the use of temporary result sets if the 'where' clause
is replaced with proper filter:

``` programlisting
select xquery_eval('<document>
  {
    for $cat in xmlview("cat")/category
    let $catID := $cat/@CategoryID
    return (<category description={$cat/@description}$gt;
      {distinct(
        for $supp in xmlview("product")/product[category/@CategoryID=$catID]/supplier
        return $supp)
      }</category>)
  }
  </document<',
  xtree_doc('<dummy_tag/>'));
```

This variant requires no memory for storing \$prod_set and it never
fetches redundant fields from "Demo"."demo"."Products" table but it
heavily needs index for "Demo"."demo"."Products" on "CategoryID" field.
If such index is built the last variant is about 10 times faster than
the query in example 1. Similarly, the query in example 2 may be
optimized as follows:

``` programlisting
select xquery_eval('
  <supplier_product>
   {
     for $supp in document("suppliers.xml")/supplier
     let $supp_id:=string($supp/@supplier_id)
     return (
      <supplier>{$supp/supplier_name}
        <product_name>
          {
            for $prod in xmlview("product")/product[supplier/@SupplierID=$supp_id]
            return string($prod/@product_name)
          }
        </product_name>
      </supplier>)
   }
  </supplier_product>',
  xtree_doc('<dummy_tag/>')
  );
```

and it speeds up the operation by more than 15 times.

</div>

<div>

<div>

<div>

<div>

#### Restrictions in XPATH expressions following the xmlview() function

</div>

</div>

</div>

Virtuoso does not support certain kinds of XPATH expressions applied to
the xmlview() function.

1\. A path expression must not contain any functions, because it is
impossible to translate most of the functions to SQL queries.

2\. A path expression must not contain numeric XQUERY variables in the
arithmetic expressions. Let a document named products.xml contains
product elements; each product element has numeric attribute
ProductPrice. A run time error occurs if the following query would be
used

``` programlisting
select xquery_eval('
  <document>
   {
     for $prod_doc in document("products.xml")/products/product/@ProductPrice
       for $prod_view in xmlview("product")/product[@price>$prod_doc+1]
     return <q>{$prod_doc, $prod_view/@product_name}</q>
   }
   </document>',
   xtree_doc('<dummy_tag/>'));
```

because the type of \$prod_doc is considered as string. As it is
mentioned in the previous restriction the using a function in a path
expression (e.g.
xmlview("product")/product\[@price\>number(\$prod_doc)+1\]) is not
allowed. The correct query is as follows:

``` programlisting
select xquery_eval('
  <document>
    {
      for $prod_doc in document("products.xml")/products/product/@ProductPrice
        let $prod_doc2:=number($prod_doc)
        for $prod_view in xmlview("product")/product[@price>$prod_doc2+1]
      return <q>{$prod_doc, $prod_view/@product_name}</q>
    }
  </document>',
  xtree_doc('<dummy_tag/>'));
```

3\. A path expression must not contain XQUERY variables with the
following paths. The following query will not be executed

``` programlisting
select xquery_eval('
  <document>
    {
      for $cat in xmlview("cat")/category,
          $prod in xmlview("product")/product[@CategoryID=$cat/@CategoryID]
      return <q>{$prod/supplier}</q>
    }
  </document>',
  xtree_doc('<dummy_tag/>'));
```

The correct query may be given as

``` programlisting
select xquery_eval('
  <document>
    {
      for $cat in xmlview("cat")/category
      let $cat_id:=$cat/@CategoryID
      for $prod in xmlview("product")/product[@CategoryID=$cat_id]
      return <q>{$prod/supplier}</q>
    }
  </document>',
  xtree_doc('<dummy_tag/>'));
```

4\. Virtuoso does not support a selection of n-th element in a path
expression. The following query will not be executed

``` programlisting
select xquery_eval('
  <document>
    {
      for $cat in xmlview("cat")//product[1] return <q>{$cat}</q>
    }
  </document>',
  xtree_doc('<dummy_tag/>'));
```

5\. Virtuoso does not support a dereference (=\>) in a path expression.

6\. It is not recommended to use the long varchar, long varbinary and
long nvarchar data types with the logical and boolean operations in a
filter of the path expression. For example, the execution of the
following query

``` programlisting
select xquery_eval('
  <document>
    {
      for $prod in
        xmlview("product")/product[@SupplierID<5]/category[@Description like "Sw%"]
      return <q>{$prod}</q>
    }
  </document>',
  xtree_doc('<dummy_tag/>'));
```

may return an error, because the field "Description" has LONG VARCHAR
type in the table "demo"."Categories".

</div>

</div>
