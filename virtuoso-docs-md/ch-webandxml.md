<div id="ch-webandxml" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 15. XML Support

</div>

<div>

<div class="abstract">

**Abstract**

This chapter covers Virtuoso's XML, full text retrieval and related
functions.

Virtuoso provides free text indexing capabilities for textual data,
including XML data. Virtuoso supports extraction of XML documents from
SQL datasets. It also supports
<a href="fn_xpath_eval.html" class="link" title="xpath_eval">XPath</a> ,
<a href="xq.html" class="link"
title="15.8. XQuery 1.0 Support">XQuery</a> ,
<a href="xslttrans.html" class="link"
title="15.9. XSLT Transformation">XSLT</a> and XML Schema validation.

An SQL long varchar, long xml or xmltype column in a database table can
contain XML data as text or in a binary serialized format, respectively.
If a column value is a well-formed XML fragment there are special
operations that can be performed on the value. There is an SQL data type
that represents an XML entity. A string representing a well-formed XML
entity can be converted into an entity object representing the root
node. XPath expressions can then be applied to the entity in order to
retrieve other entities or sets of entities. Returning an XML entity to
a client application or printing it out on a dynamic web page will
produce the text representation of the entity, complete with start and
end tags, attributes, namespaces, and so forth.

An entity object can be stored as a value of a long varchar or varchar
column. This will produce and store the text corresponding to the
entity. Storing the same into a long xml or xmltype column will provide
a more compact representation and will guarantee well-formedness and
optionally schema validity, even if the data comes in as text.

A long varchar column can contain huge XML documents as special
"persistent XML entity" objects. XML entities of this sort consume only
a little amount of memory and load small portions of data from disk to
memory on demand; an application can handle XML documents that are order
of magnitude larger than the amount of available memory.
<a href="sqlrefxmldatatype.html" class="link"
title="9.3. XML Column Type">LONG XML</a> column type is convenient if a
column contains only valid XML documents. An application can save XML
entities to LONG XML columns and retrieve them back without calling any
type conversion functions. A special user-defined type XMLType allows
the use of an XML entity as a base for deriving user-defined types from
it.

The `xpath_contains` SQL predicate can be used to test whether a column
value matches a given XPath expression. If the XPath expression
specifies a node set and that set is non-empty for a given column value,
it is possible to bind a result variable to each element of the set. In
this way a single row of data in a table can produce multiple rows in an
SQL result set, one for each entity selected by the XPath predicate.

If there is a free text index on a column it is possible to define that
the content be checked for well-formedness. In this case both
<a href="queryingftcols.html#containspredicate" class="link"
title="20.3.1. CONTAINS predicate"><code
class="function">contains</code></a> and `xpath_contains` predicates can
be applied to the same column in the same query. You should create a
free text index on your XML data if you expect any content-based
searches. The free text index will recognize specific features of XML
and allow their use in searches.

The <a href="xcontainspredicate.html" class="link"
title="15.4.6. XCONTAINS predicate"><code
class="function">xcontains</code></a> SQL predicate is a combination of
XPath and free text, making automatic use of the free text index for
evaluating an XPath expression. This predicate also allows you to test
text values of entities for complex free text conditions such as
proximity.

There is a user interface for using this feature on DAV resources. The
use of the `xpath_contains` predicate is not limited to DAV resources
though. The use of XPath with XML values is independent of free text
indexing and of XML views.

Virtuoso offers functions for XPath processing of well-formed XML
strings in SQL. Together with the Virtuoso free text support, these
functions offer a powerful free-form and structured content retrieval
system. You can search for XPath matches in any XML-populated column.
One practical example would be the RES_CONTENT column of the
WS.WS.SYS_DAV_RES table, which contains the contents of documents stored
in the WebDAV repository. As with the sample database, which contains
the XML sources for this documentation, you may store XML documents
directly in the WebDAV repository.

An SQL statement can return complex XML documents based on relational
data. Virtuoso supports both Microsoft's "FOR XML" syntax and the
standard set of SQLX XML composing functions like
<a href="fn_xmlelement.html" class="link" title="XMLELEMENT"><code
class="function">XMLELEMENT</code></a> and
<a href="fn_xmlagg.html" class="link" title="XMLAGG"><code
class="function">XMLAGG</code></a> . Very complicated processing can be
done in a single statement that combines XML composing functions,
<a href="fn_xquery_eval.html" class="link" title="xquery_eval"><code
class="function">xquery_eval</code></a> and
<a href="fn_xslt.html" class="link" title="xslt"><code
class="function">xslt</code></a> .

Virtuoso/PL routines can modify XML entities in DOM style (functions
like <a href="fn_xmlappendchildren.html" class="link"
title="XMLAppendChildren"><code
class="function">XMLAppendChildren</code></a> and
<a href="fn_xmlreplace.html" class="link" title="XMLReplace"><code
class="function">XMLReplace</code></a> ). Doing local changes this way
can be simpler than via XSLT or XQuery; DOM modifications also help
speed-critical applications to avoid unnecessary copying of data.

Virtuoso's XML parser can read XML documents of any complexity. It can
validate source documents against DTD and XML schema, load compound
documents or their fragments, recover from errors in ill-formed HTML
documents like popular browsers can.

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

<span class="section">15.1. [Rendering SQL Queries as XML (FOR XML
Clause)](ch-webandxml.html#forxmlforsql)</span>

<span class="section">15.1.1. [FOR XML EXPLICIT
Mode](ch-webandxml.html#forxmlexplicmode)</span>

<span class="section">15.1.2. [Examples of FOR
XML](ch-webandxml.html#examplesofforxml)</span>

<span class="section">15.1.3.
[Functions](ch-webandxml.html#forxmlfunc)</span>

<span class="section">15.1.4. [FOR XML
Syntax](ch-webandxml.html#forxmlsyntax)</span>

<span class="section">15.2. [XML Composing Functions in SQL Statements
(SQLX)](composingxmlinsql.html)</span>

<span class="section">15.3. [Virtuoso XML
Services](xmlservices.html)</span>

<span class="section">15.3.1. [XPATH Implementation and
SQL](xmlservices.html#xpath_sql)</span>

<span class="section">15.3.2. [XPATH Query
Options](xpathopts.html)</span>

<span class="section">15.3.3. [XML Views - Representing SQL Data as
Dynamic and Persistent XML](xmlviews1.html)</span>

<span class="section">15.3.4. [External Entity References in Stored
XML](xmlviewextentref.html)</span>

<span class="section">15.3.5. [Using XPATH in SQL Queries and
Procedures](xpproc.html)</span>

<span class="section">15.3.6. [XQUERY and XML
view](xquery_sql.html)</span>

<span class="section">15.3.7. [Mapping Schemas as XML
Views](mapping_schemas.html)</span>

<span class="section">15.3.8. [Differences Between SQLX, FOR XML and XML
Views](view4xmldifferences.html)</span>

<span class="section">15.4. [Querying Stored XML
Data](queryingxmldata.html)</span>

<span class="section">15.4.1. [XPATH_CONTAINS SQL
Predicate](queryingxmldata.html#xpathcontainssqlpred)</span>

<span class="section">15.4.2. [Using
xpath_eval()](qryusingxpath_eval.html)</span>

<span class="section">15.4.3. [External Entity References in Stored
XML](wxmlextentrefinxml.html)</span>

<span class="section">15.4.4. [XML Schema & DTD
Functions](wamlschmdtdfuncs.html)</span>

<span class="section">15.4.5. [Using XML and Free
Text](usingxmlfreetext.html)</span>

<span class="section">15.4.6. [XCONTAINS
predicate](xcontainspredicate.html)</span>

<span class="section">15.4.7. [text-contains XPath
Predicate](textcontainsxpath.html)</span>

<span class="section">15.4.8. [XML Free Text Indexing
Rules](xmlfreetextrules.html)</span>

<span class="section">15.4.9. [XML Processing & Free Text Encoding
Issues](xmlencoding.html)</span>

<span class="section">15.5. [Using UpdateGrams to Modify
Data](updategrams.html)</span>

<span class="section">15.5.1. [Updategrams
Basics](updategrams.html#updategrambasics)</span>

<span class="section">15.5.2. [Elements
Description](elementsdesc.html)</span>

<span class="section">15.5.3. [Determining
Actions](determiningactions.html)</span>

<span class="section">15.5.4. [Using Input
Parameters](usinginparams.html)</span>

<span class="section">15.5.5. [Examples](examples.html)</span>

<span class="section">15.6. [XML Templates](xmltemplates.html)</span>

<span class="section">15.6.1.
[Syntax](xmltemplates.html#xmltemplatesyntax)</span>

<span class="section">15.6.2. [Saving SQL Queries to XML
Template](saveqrytoxmltemplatessql.html)</span>

<span class="section">15.6.3. [Saving XQUERY Queries to XML
Template](saveqrytoxmltemplatessql_01.html)</span>

<span class="section">15.6.4. [Saving XPATH Queries to XML
Template](saveqrytoxmltemplatessql_02.html)</span>

<span class="section">15.6.5. [Programmatic
Examples](xmltemplatesexamples.html)</span>

<span class="section">15.7. [XML DTD and XML
Schemas](xmlschema.html)</span>

<span class="section">15.7.1. [XML Document Type Definition
(DTD)](xmlschema.html#dtd_intro)</span>

<span class="section">15.7.2. [Configuration Options of the DTD
Validator](dtd_config.html)</span>

<span class="section">15.7.3. [XML Schema Definition
Language](xsd_interface.html)</span>

<span class="section">15.7.4. [XML Schema
Functions](xsd_interface_01.html)</span>

<span class="section">15.7.5. [XML Schema &
SOAP](xmlschemaandsoap.html)</span>

<span class="section">15.8. [XQuery 1.0 Support](xq.html)</span>

<span class="section">15.8.1. [Types of XQuery
Expressions](xq.html#xq_supported_expns)</span>

<span class="section">15.8.2. [Details of XQuery
Syntax](xq_supported_syntax.html)</span>

<span class="section">15.8.3. [Pre-compilation of XPath and XQuery
Expressions](xq_precompilation.html)</span>

<span class="section">15.9. [XSLT Transformation](xslttrans.html)</span>

<span class="section">15.9.1.
[Namespaces](xslttrans.html#namespaces)</span>

<span class="section">15.9.2. [The *`<xsl:output>`*
Tag](xsloutputelt.html)</span>

<span class="section">15.9.3. [External Parameters in XSLT
Stylesheets](xsltextparams.html)</span>

<span class="section">15.9.4. [Functions](xsltfunctions.html)</span>

<span class="section">15.9.5. [XSLT Examples](xsltexamples.html)</span>

<span class="section">15.9.6. [XPath Function Extensions for
XSLT](userdefxpathfunc4xsl.html)</span>

<span class="section">15.9.7. [Status Of XSLT And XPath
Implementation](xsltsupport.html)</span>

<span class="section">15.10. [XMLType](xmltype.html)</span>

<span class="section">15.11. [Changing XML entities in DOM
style](xmldom.html)</span>

<span class="section">15.11.1. [Composing Document Fragments From DOM
Function Arguments](xmldom.html#xmldomtypecasting)</span>

</div>

<div id="forxmlforsql" class="section">

<div class="titlepage">

<div>

<div>

## 15.1. Rendering SQL Queries as XML (FOR XML Clause)

</div>

</div>

</div>

Virtuoso extends SQL-92 with the FOR XML clause that allows any SQL
result set to be turned into XML according to some simple rules. The
notation and functionality are similar to those offered by Microsoft SQL
Server and IIS.

The FOR XML clause has 3 variants:

**RAW. ** Make an XML entity from each row of the result set; do not
attempt to construct hierarchies. Each row's data is enclosed in a
\<ROW/\> element and each column is either an attribute or child
element.

**AUTO. ** A hierarchy is constructed with one level for each table of
the join for which at least one column is selected. The table whose
column is first mentioned in the selection will be the topmost element,
the next table its child, etc. Each level of the tree will consist of
one type of element. A parent element will have multiple children if
consecutive rows do not differ in the column values coming from the
parent element. When a table's column values differ from the previous
row, the element and all children thereof are closed and a new element
is started, with children filled out from other columns of the result
set.

**EXPLICIT. ** This mode gives more control on the resulting tree's
structure while requiring a more elaborate query structure. In this
mode, the query will be a UNION ALL of many joins and each row will
specify exactly one element. Which type of element this is and where in
the tree it will be placed are determined by the values of the first two
columns, TAG and PARENT.

In all modes, columns may either be attributes or sub-elements. The
<span class="emphasis">*ELEMENT*</span> keyword after the FOR XML clause
forces all columns to be rendered as sub-elements; attribute are the
default.

In all modes except explicit, the names of elements are the unprefixed
table names and the names of attributes are the columns' names in the
result set. If tables have correlation names the correlation names are
used in the output instead of the table names. Expressions are allowed
in the selections but these should be named using AS. In AUTO mode
Virtuoso assumes expressions belong to the topmost element.

The FOR XML clause is generally allowed in SELECT statements in place of
the FOR UPDATE clause. However it only has an effect when the statement
is executed through the
<a href="fn_xml_auto.html" class="link" title="xml_auto"><code
class="function">xml_auto()</code></a> function.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                                                                                                                                                                                    |
|:--------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                                                                                                                                                                                          |
|                            | The <a href="admui.xmlservices.html#sqlxmlstmts" class="link"                                                                                                                                                                                                      
                              title="SQL-XML Statements">SQL-XML Statements</a> page described in the Visual Server Administration Interface section provides a fast graphical way of supplying an SQL statement to Virtuoso and saving the view as a resource accessible from the WebDAV store.  |

</div>

<div id="forxmlexplicmode" class="section">

<div class="titlepage">

<div>

<div>

### 15.1.1. FOR XML EXPLICIT Mode

</div>

</div>

</div>

This mode gives the developer the most control over the generated result
tree but requires a verbose query formulation. Each row must begin with
two integer columns, the first identifying the element represented by
the row and the second the parent element type of this element.
Consider:

``` programlisting
select 1 as tag, null as parent,
       "CategoryID" as [category!1!cid],
       "CategoryName" as [category!1!name],
       NULL as [product!2!pid],
       NULL as [product!2!name!element]
from "Demo".."Categories"
union all
select 2, 1, "category" ."CategoryID", NULL, "ProductID", "ProductName"
    from "Demo".."Categories" "category", "Demo".."Products" as "product"
    where "product"."CategoryID" = "category"."CategoryID"
order by [category!1!cid], 5
for xml explicit;
```

This query makes a two level tree where Categories have Product
children. The selection in the first UNION term specifies the element
types in the result set. The two first columns, TAG and PARENT are
required in all EXPLICIT queries. Subsequent columns have an extended AS
declaration that specifies which element they belong to, what that
element is called in XML and what the column will be called. A row where
TAG has a value of 1 will pick the columns which has \[xxx!1!yyy\] as
their alias; rows with a TAG of 2 will pick columns with an alias with
\[xxx!2!yyy\] and so on.

If consecutive rows have a different TAG but the same PARENT, these will
be siblings of different types. This possibility does not exist with the
other FOR XML modes.

If the PARENT is 0 or NULL, then any previously open elements in the
result are closed and the element of the row becomes a top-level
element. When PARENT refers to the TAG of a presently open element in
the set, all children of that element are closed and the row's element
is inserted as the next child of the last element with the TAG equal to
the new row's PARENT. All open tags are closed at the end of the result
set.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                                                                                  |
|:----------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                                                                                                                                                                                                                                                             |
|                              | Since each level of the tree is generated by a different term in the UNION ALL, an ORDER BY will invariably be needed to group the children after their parents. If the parent rows have NULLs in place of the child row's key values, the parent gets sorted first because NULL collates first. |

</div>

</div>

<div id="examplesofforxml" class="section">

<div class="titlepage">

<div>

<div>

### 15.1.2. Examples of FOR XML

</div>

</div>

</div>

This section gives one example of each mode of FOR XML combined with the
`xml_auto()` function to help us display the results simply. First we
create a procedure that enables us to supply SQL and return XML using
the `xml_auto()` function.

``` programlisting
create procedure xmla (in q varchar)
{
  declare st any;
  st := string_output ();
  xml_auto (q, vector (), st);
  result_names (q);
  result (string_output_string (st));
}
```

Now we can apply this to a couple of examples:

<div id="id45610" class="example">

**Example 15.1. XML RAW**

<div class="example-contents">

``` programlisting
xmla ('select "category"."CategoryID", "CategoryName",
    "ProductName", "ProductID"
    from "Demo".."Categories" "category", "Demo".."Products" as "product"
    where "product"."CategoryID" = "category"."CategoryID" FOR XML RAW');
```

``` screen
<ROW CategoryID="1" CategoryName="Beverages" ProductName="Chai" ProductID="1">
</ROW>
<ROW CategoryID="1" CategoryName="Beverages" ProductName="Chang" ProductID="2">
</ROW>
<ROW CategoryID="1" CategoryName="Beverages" ProductName="Guaraná Fantástica" ProductID="24">
</ROW>
<ROW CategoryID="1" CategoryName="Beverages" ProductName="Sasquatch Ale" ProductID="34">
</ROW>
<ROW CategoryID="1" CategoryName="Beverages" ProductName="Steeleye Stout" ProductID="35">
</ROW>
<ROW CategoryID="1" CategoryName="Beverages" ProductName="Côte de Blaye" ProductID="38">
</ROW>
<ROW CategoryID="1" CategoryName="Beverages" ProductName="Chartreuse verte" ProductID="39">
</ROW>
<ROW CategoryID="1" CategoryName="Beverages" ProductName="Ipoh Coffee" ProductID="43">
</ROW>
<ROW CategoryID="1" CategoryName="Beverages" ProductName="Laughing Lumberjack Lager" ProductID="67">
</ROW>
.....
```

</div>

</div>

  

As we can see, RAW mode produces a simple row-by-row account of the data
encased within the \<ROW.../\> tags. This is the simplest mode.

<div id="id45615" class="example">

**Example 15.2. XML AUTO**

<div class="example-contents">

``` programlisting
xmla ('select "category"."CategoryID", "CategoryName",
    "ProductName", "ProductID"
    from "Demo".."Categories" "category", "Demo".."Products" as "product"
    where "product"."CategoryID" = "category"."CategoryID" FOR XML AUTO ELEMENT');
```

``` screen
<category>
 <CategoryID>1</CategoryID> <CategoryName>Beverages</CategoryName><product>
 <ProductName>Chai</ProductName> <ProductID>1</ProductID></product>
<product>
 <ProductName>Chang</ProductName> <ProductID>2</ProductID></product>
<product>
 <ProductName>Guaraná Fantástica</ProductName> <ProductID>24</ProductID></product>
<product>
 <ProductName>Sasquatch Ale</ProductName> <ProductID>34</ProductID></product>
<product>
 <ProductName>Steeleye Stout</ProductName> <ProductID>35</ProductID></product>
<product>
 <ProductName>Côte de Blaye</ProductName> <ProductID>38</ProductID></product>
<product>
 <ProductName>Chartreuse verte</ProductName> <ProductID>39</ProductID></product>
<product>
 <ProductName>Ipoh Coffee</ProductName> <ProductID>43</ProductID></product>
<product>
 <ProductName>Laughing Lumberjack Lager</ProductName> <ProductID>67</ProductID></product>
<product>
.....
```

</div>

</div>

  

In contrast to RAW mode, AUTO produces results that are more tree-like.
Only one category element is used for each category, and that contains
all the children of the category.

<div id="id45620" class="example">

**Example 15.3. XML EXPLICIT**

<div class="example-contents">

``` programlisting
xmla ('
select 1 as tag, null as parent,
       "CategoryID" as [category!1!cid],
       "CategoryName" as [category!1!name],
       NULL as [product!2!pid],
       NULL as [product!2!name!element]
from "Demo".."Categories"
union all
select 2, 1, "category" ."CategoryID", NULL, "ProductID", "ProductName"
    from "Demo".."Categories" "category", "Demo".."Products" as "product"
    where "product"."CategoryID" = "category"."CategoryID"
order by [category!1!cid], 5
FOR XML EXPLICIT');
```

``` screen
<CATEGORY CID="1" NAME="Beverages">
<PRODUCT PID="1">
 <NAME>Chai</NAME></PRODUCT>
<PRODUCT PID="2">
 <NAME>Chang</NAME></PRODUCT>
<PRODUCT PID="24">
 <NAME>Guaraná Fantástica</NAME></PRODUCT>
<PRODUCT PID="34">
 <NAME>Sasquatch Ale</NAME></PRODUCT>
<PRODUCT PID="35">
 <NAME>Steeleye Stout</NAME></PRODUCT>
<PRODUCT PID="38">
 <NAME>Côte de Blaye</NAME></PRODUCT>
<PRODUCT PID="39">
 <NAME>Chartreuse verte</NAME></PRODUCT>
<PRODUCT PID="43">
 <NAME>Ipoh Coffee</NAME></PRODUCT>
<PRODUCT PID="67">
 <NAME>Laughing Lumberjack Lager</NAME></PRODUCT>
<PRODUCT PID="70">
 <NAME>Outback Lager</NAME></PRODUCT>
<PRODUCT PID="75">
 <NAME>Rhönbräu Klosterbier</NAME></PRODUCT>
<PRODUCT PID="76">
 <NAME>Lakkalikööri</NAME></PRODUCT>
</CATEGORY>
<CATEGORY CID="2" NAME="Condiments">
<PRODUCT PID="3">
.....
```

</div>

</div>

  

In this example, we specify precisely the tree structure we wish, and
construct the EXPLICIT query to produce that tree. Many times
programmers know what the resulting XML should look like but do not know
how to get exactly what they want. FOR XML EXPLICIT can be very useful
in these cases.

</div>

<div id="forxmlfunc" class="section">

<div class="titlepage">

<div>

<div>

### 15.1.3. Functions

</div>

</div>

</div>

<a href="fn_xml_auto.html" class="link" title="xml_auto"><code
class="function">xml_auto()</code></a>

</div>

<div id="forxmlsyntax" class="section">

<div class="titlepage">

<div>

<div>

### 15.1.4. FOR XML Syntax

</div>

</div>

</div>

``` programlisting
for__xml ::= FOR XML <mode> [ ELEMENT ]

<mode> ::= RAW | AUTO | EXPLICIT

<explicit column> ::=  scalar_exp AS '[' <element> '!' <tag no> '!'
                   <column name> [ '!' <option> ] ']'

<tag no> ::= INTNUM

<column name> ::= IDENTIFIER

<element> ::= IDENTIFIER

<option> ::= IDENTIFIER
```

The \<explicit column\> should be used in the selection list of the
first term of the UNION ALL construct in a FOR XML EXPLICIT query.
Virtuoso provides this functionality separately from any Web server
context, although these are principally expected to be used inside VSP
pages.

The text of \<option\> part of the \<explicit column\> is ignored but if
it is present then the value is placed into a sub-element of the element
for the row, not into an attribute.

</div>

</div>

</div>
