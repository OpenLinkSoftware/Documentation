<div id="xmlviews1" class="section">

<div class="titlepage">

<div>

<div>

### 15.3.3. XML Views - Representing SQL Data as Dynamic and Persistent XML

</div>

</div>

</div>

The XML view mechanism allows generating XML content from relational
data and to query relational data as if it were XML without first
converting it to XML.

<div id="createxmlview" class="section">

<div class="titlepage">

<div>

<div>

#### CREATE XML VIEW statement

</div>

</div>

</div>

``` programlisting
<xml view> ::=
     CREATE XML VIEW <name> as [ <namespaces_def> ] <element list> <opt_public>

<xml view> ::=
     CREATE XML VIEW <name> as [ <namespaces_def> ] <query spec> [ELEMENT] <opt_public>

<namespaces_def> ::= '[' <id_namespace> '='( name | <path string> ) [ ...]  ']'

<element list> ::= <element> [, ...]*

<element> ::=
     <table> <correlation name> AS [ <id_namespace> ':' ] <element> <columns>
     [ ON '('  <search condition> ')']
    [primary key '(' column_commalist ')' ]
    [ELEMENT]
     [ '{' <element list>'}' ]

<opt_public> ::=  PUBLIC <path string> OWNER <DAV owner name> [PERSISTENT] [INTERVAL <minutes>]

<columns> ::= '(' <column> [, ...] ')'

<column> ::=   <column name> | <column name> AS [ <id_namespace> ':' ] <attribute name>

<id_namespace> :: = identifier
```

The XML view declaration establishes a 'virtual document' a context
within which XML hierarchy relationships can be translated into
arbitrary joins. The virtual document can be then materialized into an
actual set of persistent XML elements or used to generate SQL from
XPATH.

Each table in the declaration generates an element into the result
document. SQL views can be used as tables to accommodate for hidden
joins, sub-queries, ordering and aggregates. If a view is used, which by
nature has no primary key, the primary key clause should be used to
define a uniquely identifying set of view columns.

The only restriction on the XML view declaration is that each branch has
a fixed depth.

The structure of joins used to make the text can be specified in two
ways: As a SQL query specification, that is a SELECT from a list of
tables with a WHERE clause specifying the joins, or as a tree of join
elements. The first form is called automatic and the second is called
explicit. The automatic form allows generating a tree with as many
levels as there are tables in the join, with elements derived from the
rows at each level occupying each level of the hierarchy

With both forms the columns of the tables are mapped into either
attributes or child elements of the element representing each row. In
the explicit mode, the attribute / element choice can be made for each
table, in the automatic mode for the entire view. The explicit mode also
allows specifying a different element / attribute name whereas the
automatic mode takes the name from the column name. Even if the columns
are presented as child elements in the output text, they should be
referenced as attributes in XPATH queries evaluated in the context of
the view.

An XML namespaces can be used in XML view with two restrictions - all
namespace names must be different and the first three letters of
namespace name must not be 'xml', except for default namespace with name
'xmlns'.

</div>

<div id="explicitxmlviews" class="section">

<div class="titlepage">

<div>

<div>

#### Explicit XML Views

</div>

</div>

</div>

In the explicit form each level of the hierarchy is declared as a list
of child elements. Each such element maps one table or view into an
entity according to a join condition. The join conditions can reference
columns from the associated table and columns from tables in parent
elements. The join condition can also have scalar filtering conditions.
A top element's join condition may only specify scalar conditions.

Each set of sibling child nodes is delimited by braces {}. The top level
of the view typically consists of one element in the outermost braces.
This element has itself a child list delimited by braces. Each such list
can have more than one different element.

Each element specifies:

<div class="itemizedlist">

- SQL table

- Correlation name for use in subsequent joins for this table

- XML element name to use for delimiting a row of this table

- List of columns, with optional XML element or attribute names

- join condition - will relate rows of this table to rows of the table
  in the enclosing element. If this element is at the top level, this
  can only consist of scalar conditions

- Optional PRIMARY KEY clause, needed if the table in this element is a
  view, does not have a primary key or if a non-primary key unique
  identity is desired

- Optional ELEMENT flag

- Optional list of child elements, delimited by braces

</div>

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                     |
|:----------------------------:|:----------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                               |
|                              | A correlation name is mandatory for all the tables. |

</div>

The column list can mention a single column or a single column renamed
into an XML attribute of a different name. If a column of a table is
referenced in a subsequent join condition it must appear in the output
columns list. Expressions are not directly allowed but a view with
expression columns can be used.

The opt_public clause, when present, offers a shorthand for calling
xml_view_publish at the same time as making the definition. This makes a
DAV resource reflecting the contents of the view. The contents may
either be generated on demand or persisted as a DAV accessible XML
document. In the latter case the document may be regenerated at a fixed
interval. The interval is expressed in minutes.

The path is expressed as an absolute path from the root collection of
the DAV server.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                       |
|:----------------------------:|:--------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                 |
|                              | This root collection may be mapped into various places in the web server's URL space. |

</div>

``` programlisting
create xml view xx ... public '/xx.xml' owner 'dav' persistent interval 1;
```

is equivalent to:

``` programlisting
create xml view xx ...;
xml_view_publish (xx, /xx.xml', 'dav', 1, 1);
```

A DAV resource created in this manner can be deleted as any DAV
resource. The XML view itself is not affected but a possibly existing
refresh job will be automatically deleted.

One XML view can be published several times with different names and
owners. There may also exist persistent and non-persistent publications
of the same view.

The CREATE XML VIEW statement defines stored procedures for generating
an XML text fragment corresponding to each element declared in the view.

The names of the procedures are composed as follows:

``` programlisting
create procedure http_view_<view name>
    (inout output_mode)
```

``` programlisting
create procedure http_<view name>_<element name>_<correlation name>
    (in pk1 any, ..., in output_mode integer)
```

An http output procedure is created for each \<element\> in the create
xml view declaration. It takes the primary key columns of the table in
question in key order plus a mode flag. It then outputs the
serialization of the specified element and any child elements. For an
output mode of 0 the result goes directly to an HTTP client. For an
output_mode of 1 the procedure returns the serialization as a string.
Note that for this to work the tables in question must be real tables
and the join conditions must only reference the next higher table in the
create xml view tree. Further, the primary key columns of each table
should be mentioned in the columns list for that table along with any
foreign keys referenced in subsequent join conditions.

<div id="vht01" class="example">

**Example 15.4. Examples**

<div class="example-contents">

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

This declares a two level hierarchy with a category node for each
category and a product child node for each product in the category.

``` programlisting
create xml view "cats_e" as
  select "category"."CategoryID", "CategoryName",
    "ProductName", "ProductID"
    from "Demo".."Categories" "category", "Demo".."Products" as "product"
    where "product"."CategoryID" = "category"."CategoryID" element;
```

Here is a similar example, this time using the element option.

</div>

</div>

  

The procedures are

``` programlisting
xmlg_cat
http_cat_category_C (in categoryid any, in _out integer);
http_cat_product_P (in productid any, in _out integer);
```

In the following example the function returns the selected items as an
XML fragment. Consecutive elements are separated by new-lines for
readability.

<div id="vht02" class="example">

**Example 15.5. Example**

<div class="example-contents">

``` programlisting
SQL> call "http_cat_category_C" (1, 1);

1 sets? Done. -- 5 msec.
RESULT=
<category CategoryID="1" description="Soft drinks, coffees, teas, beers, and ales" >
<product ProductName="Chai" ></product>
<product ProductName="Chang" ></product>
<product ProductName="Guarana Fantastica" ></product>
<product ProductName="Sasquatch Ale" ></product>
<product ProductName="Steeleye Stout" ></product>
<product ProductName="Côte de Blaye" ></product>
<product ProductName="Chartreuse verte" ></product>
<product ProductName="Ipoh Coffee" ></product>
<product ProductName="Laughing Lumberjack Lager" ></product>
<product ProductName="Outback Lager" ></product>
<product ProductName="Rhönbrooou Klosterbier" ></product>
<product ProductName="Lakkalikööri" ></product>
</category>
```

</div>

</div>

  

The below example shows how to use a SQL view for hiding a join. The
below view generates for each table a set of column children and a set
of index children, which in turn have column children.

``` programlisting
create view KEY_COLS as select KP_KEY_ID, KP_NTH, C.*
    from SYS_KEY_PARTS, SYS_COLS C where COL_ID = KP_COL;

create xml view "schema" as
{
  DB.DBA.SYS_KEYS k as "table" ("KEY_TABLE" as "name",
    KEY_ID as "key_id", KEY_TABLE as "table")
    on (k.KEY_IS_MAIN = 1 and k.KEY_MIGRATE_TO is null)
    { DB.DBA.KEY_COLS  c as "column" (COLUMN as name)
        on (k.KEY_ID = c.KP_KEY_ID)
        primary key (COL_ID),
    DB.DBA.SYS_KEYS i as "index" (KEY_NAME
      as "name", KEY_ID as "key_id", KEY_N_SIGNIFICANT as "n_parts")
      on (i.KEY_TABLE = k.KEY_TABLE and i.KEY_IS_MAIN = 0 and i.KEY_MIGRATE_TO is null)
      {
        DB.DBA.KEY_COLS ic as "column" (COLUMN as "name")
          on (ic.KP_NTH < i.KEY_N_SIGNIFICANT and ic.KP_KEY_ID = i.KEY_ID)
          primary key (COL_ID)
          }
    }
};
```

The following query will return the subtree describing the Customers
table in the demo database:

``` programlisting
XPATH [__view 'schema']
    /table[@name = 'Demo.demo.Customers'];

<table name="0" key_id="1011" table="Demo.demo.Customers" >
<column name="CustomerID" ></column>
<column name="CompanyName" ></column>
<column name="ContactName" ></column>
<column name="ContactTitle" ></column>
<column name="Address" ></column>
<column name="City" ></column>
<column name="Region" ></column>
<column name="PostalCode" ></column>
<column name="Country" ></column>
<column name="Phone" ></column>
<column name="Fax" ></column>
<index name="City" key_id="1012" n_parts="2" >
<column name="City" ></column>
<column name="CustomerID" ></column>
</index>
<index name="CompanyName2" key_id="1013" n_parts="2" >
<column name="CompanyName" ></column>
<column name="CustomerID" ></column>
</index>
<index name="PostalCode2" key_id="1014" n_parts="2" >
<column name="PostalCode" ></column>
<column name="CustomerID" ></column>
</index>
<index name="Region" key_id="1015" n_parts="2" >
<column name="Region" ></column>
<column name="CustomerID" ></column>
</index>
</table>
```

</div>

<div id="xmlviewfromselect" class="section">

<div class="titlepage">

<div>

<div>

#### Automatic XML Views - Creating XML Views from SELECT Statements

</div>

</div>

</div>

The automatic form of CREATE XML VIEW will take a select statement and
infer a hierarchy from it, based on the order of tables in the from
clause. The parent table should be to the left of its children. This is
practical if the tables form a hierarchy in application terms, like
orders and order lines or departments and employees. This notation
allows arbitrary depth but all siblings at the same level will be of the
same type. Elements of child rows will be child elements of the element
of their parent row, where the join condition identifies the child rows
for one parent row.

The columns in the selection will appear as attributes or child elements
of the rows selected. The names of the attributes will be the names of
the columns. The names of the siblings will be the names of the tables
in the from clause, without qualifiers or owners. Expressions should not
appear in the selection. If the use of expressions is required then you
may create a SQL view first to facilitate this.

The ELEMENT keyword may be present at the end of the select, before the
publishing keywords. This will cause all columns to be represented as
child elements of the element corresponding to the row. Note that even
if the element switch is present, the values will appear like attributes
in an XPATH query inside the view.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                                                                                                                                                                 |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                                                                                                                                                                                                                                                                                                                                            |
|                              | SQL views or derived tables may not appear directly in the select. The reason for this is that a procedure is generated for each level of the generated XML tree and that this must take unique identifying column values for the element in question. If one desires to use a view, the explicit form should be used, with the primary key option specified where appropriate. |

</div>

<div id="addtxt4xmlview" class="section">

<div class="titlepage">

<div>

<div>

##### Add to text for explicit XML views

</div>

</div>

</div>

Each set of sibling child nodes is delimited by braces {}. The top level
of the view typically consists of one element in the outermost braces.
This element has itself a child list delimited by braces. Each such list
can have more than one different element.

Each element specifies:

<div class="itemizedlist">

- SQL table

- Correlation name for use in subsequent joins for this table

- XML element name to use for delimiting a row of this table

- List of columns, with optional XML element or attribute names

- join condition - will relate rows of this table to rows of the table
  in the enclosing element. If this element is at the top level, this
  can only consist of scalar conditions

- Optional PRIMARY KEY clause, needed if the table in this element is a
  view, does not have a primary key or if a non-primary key unique
  identity is desired

- Optional ELEMENT flag

- Optional list of child elements, delimited by braces

</div>

<div id="id45893" class="example">

**Example 15.6. Add to examples:**

<div class="example-contents">

``` programlisting
create xml view "cats_e" as
  select "category"."CategoryID", "CategoryName",
    "ProductName", "ProductID"
    from "Demo".."Categories" "category", "Demo".."Products" as "product"
    where "product"."CategoryID" = "category"."CategoryID" element;

Add to text: after 'free text and xml'
```

</div>

</div>

  

</div>

</div>

<div id="xmlviewpublish" class="section">

<div class="titlepage">

<div>

<div>

#### xml_view_publish

</div>

</div>

</div>

``` programlisting
DB.DBA.xml_view_publish (in view_name varchar, in dav_path varchar,
    in dav_owner varchar, in is_persistent integer, in refresh_interval integer)
```

This presents an XML view as a DAV resource. The view name is the name
in the create xml view statement, note that this is case sensitive and
is never converted since it is a string, not an identifier. The path
must be absolute and is interpreted as relative from the DAV root
collection. The DAV user is the owner of the resource. If is_persistent
is non-zero the resource will be materialized from the view's
description. The refresh interval is only applicable if the resource is
materialized. If so, this is an interval in minutes. A value of 0 means
no automatic refresh.

The reverse operation of xml_view_publish is deleting the DAV resource.
xml_view_publish may be called several times to alter the owner or
refresh interval.

</div>

</div>
