<div id="querytools" class="section">

<div class="titlepage">

<div>

<div>

### 6.2.7. Query Tools

</div>

</div>

</div>

<div id="sqlqueries" class="section">

<div class="titlepage">

<div>

<div>

#### Relational Data using SQL

</div>

</div>

</div>

Conductor Interactive SQL allows you to quickly and directly query
Virtuoso using SQL. It offers <span class="emphasis">*Save*</span> and
<span class="emphasis">*Load*</span> facilities which allow SQL queries
to be saved as an XML template, and read back later. With a query in the
SQL Statement box click on the <span class="emphasis">*Execute*</span>
for the results which will in the "Base" tab with option to return back
to the query area. The <span class="emphasis">*Clear*</span> clears the
SQL Statement text box.

<div class="figure-float">

<div id="id14990" class="figure">

**Figure 6.98. Querying Relational Database Using SQL**

<div class="figure-contents">

<div class="mediaobject">

![Querying Relational Database Using SQL](images/ui/qry_sql_01.png)

</div>

</div>

</div>

  

</div>

<div class="figure-float">

<div id="id14995" class="figure">

**Figure 6.99. Results**

<div class="figure-contents">

<div class="mediaobject">

![Results](images/ui/qry_sql_01a.png)

</div>

</div>

</div>

  

</div>

Specify the location for the file to be saved to by selecting the
"WebDAV source" or "Local file" check-box.

<div class="figure-float">

<div id="id15001" class="figure">

**Figure 6.100. Saving SQL in an XML Template**

<div class="figure-contents">

<div class="mediaobject">

![Saving SQL in an XML Template](images/ui/qry_sql_02.png)

</div>

</div>

</div>

  

</div>

Click the "Browse" button. As result will be opened the Virtuoso
WebDAV/File Browser where you should define the XML template based on
the SQL Query. Specify a <span class="emphasis">*Root Element*</span>
that will contain the resulting XML tree. Specify the file name and
location of the XML Template.

</div>

<div id="xqueryqueries" class="section">

<div class="titlepage">

<div>

<div>

#### XML Data Using XQuery

</div>

</div>

</div>

The Conductor Interactive XQuery facility allows you to create, execute,
save and reload queries using the evolving
<a href="http://www.w3.org/TR/xquery/" class="ulink" target="_top">W3C
XML Query (XQuery) Language</a> . Virtuoso currently supports the 1.0
version of this language.

This language uses XPath-like expressions, as well as a set of functions
and operators, to permit effective parallel searching of a set of XML
documents. Where XPath works with one XML "tree", XQuery searches a
"forest". The result is an XML document.

In order to create an XQuery you must both create the query statement -
by typing or pasting it into the text box - and specify the document
context. Since Virtuoso's XQuery implementation operates over XML data
in relational tables, this means the tables and columns that are to be
searched.

Note that the XQuery language also allows a query to specify all or part
of the document context for the query. In the example below we will see
how these can interact. The user interface form permits you to select a
table - either one of the XQuery test data tables that come with
Virtuoso, or the WS.WS.SYS_DAV_RES table, which stores Virtuoso's WebDAV
Repository content.

The form specifies a *`Key Column`* and a *`Data Column`* . For the
sample tables, the values for these are filled in for you. The *`Path`*
is prepended to any `document()` function specified in the query text to
find Key column values of XML trees against which the query is to be
run.

Once a query has been written and debugged, it can be saved by pressing
the Save button. This brings you to the form for saving a query as an
XML Template in the DAV repository.

Pressing the Execute button causes the query result (an XML tree) to be
shown on the page below the Statement type-in box.

<div id="ex_xqtool" class="example">

**Example 6.16. XQuery Test File Example**

<div class="example-contents">

In this example, we will query the table XQuery test files table, with
"name" as the key column and "text" as the data column.

The query text, shown below, is a sample query from the W3C's XML Query
Use Cases document
(<a href="http://www.w3.org/TR/xmlquery-use-cases" class="ulink"
target="_top">http://www.w3.org/TR/xmlquery-use-cases</a> ). This query
contains a document() call specifying a document named "bib.xml". In
order to have the query run properly, we first set the Path form value
to "xqdemo/". This causes the query to find all rows in the table
XQ.XQ.TEST_FILES that have the value "xqdemo/bib.xml" in their Name
column.

``` programlisting
<bib>
   {
   for $b in document("bib.xml")/bib/book
   where $b/publisher = "Addison-Wesley" and $b/@year > 1991
   return
      <book year = {$b/@year}>
         {$b/title}
      </book>
   }
</bib>
```

</div>

</div>

  

<div class="figure-float">

<div id="id15028" class="figure">

**Figure 6.101. XQuery Test File Results**

<div class="figure-contents">

<div class="mediaobject">

![XQuery Test File Results](images/ui/qry_sql_02a.png)

</div>

</div>

</div>

  

</div>

</div>

</div>
