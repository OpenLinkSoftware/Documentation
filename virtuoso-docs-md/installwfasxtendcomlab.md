<div id="installwfasxtendcomlab" class="section">

<div class="titlepage">

<div>

<div>

### 2.9.3. Extending RDFDemo to Allow Dereferencing of External IRIs

</div>

</div>

</div>

This section will guide you through extending the application created in
<a href="installwfasgetstart.html" class="link"
title="2.9.2. Creating the Application">Creating a Windows Forms
Application To Access RDF Data Using The Virtuoso ADO.Net Provider</a>
so that it will dereference external IRIs.

<span class="emphasis">*Pre-requisites*</span>

<div class="orderedlist">

1.  A working copy of the RDFDemo application created in
    <a href="installwfasgetstart.html" class="link"
    title="2.9.2. Creating the Application">Creating a Windows Forms
    Application To Access RDF Data Using The Virtuoso ADO.Net Provider.</a>

</div>

<div id="installwfasxtendcomlabextappl" class="section">

<div class="titlepage">

<div>

<div>

#### Extending the Application

</div>

</div>

</div>

In RDFDemo when the sparql endpoint is queried to get the description of
the selected item it executes a query that is restricted to the local
Northwind dataset. The query is something like

``` programlisting
SPARQL
PREFIX nwind: <http://demo.openlinksw.com/schemas/northwind#>
SELECT DISTINCT  ?s
FROM <http://demo.openlinksw.com/Northwind>
WHERE {?s a nwind:Customer}
```

If you examine the ExtendedStringHandler class you will see that the
dataset clause, from \<http://example.com/Northwind\>, is hard coded.
This means that when when the selected IRI is a link to an external data
store, such as dbpedia, there is no matching data and an error is
displayed. If the application is to be able to dereference external IRIs
then the hard coded dataset clause needs to be removed and then we can
use a Virtuoso extension to SPARQL, get:soft, that tells Virtuoso that
it needs to go and look elsewhere for the graph. However, this will
result in a loss of performance when exploring the local Northwind
dataset. To minimize the impact on performance we will first query the
local Northwind dataset and if there are no matching triples returned
then we will use a more generic query that will look elsewhere for
matching data.

<span class="emphasis">*Step 1 - Add the alternative query to the
ExtendedString Class.*</span>

<div class="itemizedlist">

- Open the RDFDemo project in Visual Studio

- Open the ExtendedStringHandler class.

- Remove DescribeCommand by removing the line

  ``` programlisting
  StringBuilder DescribeCommand;
  ```

  and substitute the following:

  ``` programlisting
  StringBuilder DescribeCommandSimple, DescribeCommandGeneral;
  ```

- In the ExtendedStringHandler constructor the sparql query that was
  DescribeCommand becomes DescribeCommandSimple and we define a new
  query for DescribeCommandGeneral.

  ``` programlisting
  DescribeCommandSimple = new StringBuilder("sparql select * from <http://demo.openlinksw.com/Northwind> where {<" + iri.ToString() + "> ?p ?o}");       // Replace demo.openlinksw.com with your  URIQA DefaultHost setting
  DescribeCommandGeneral = new StringBuilder("sparql define get:soft " + '"'.ToString() + "soft" + '"'.ToString() + " select * from <" + iri.ToString() + "> where { <" + iri.ToString() + "> ?p ?o }");
  ```

- The single describeCommand property needs to be replaced with the two
  new properties, DescribeCommandSimple and DescribeCommandGeneral

  ``` programlisting
  public string describeCommandSimpleText
  {
      get
      {
          return DescribeCommandSimple.ToString();
      }
  }
  public string describeCommandGeneralText
  {
      get
      {
          return DescribeCommandGeneral.ToString();
      }
  }
  ```

- Finally, the getDescribeData method needs changing to:

  ``` programlisting
  public void getDescribeData()
  {
      VirtuosoCommand myCommand = new VirtuosoCommand(this.describeCommandSimpleText, this.ParentConnection);
      VirtuosoDataAdapter myAdapter = new VirtuosoDataAdapter();
      myAdapter.SelectCommand = myCommand;
      myAdapter.Fill(describeDataSet.DataTable1);
      // Tried the simple version if fails to get the data try
      // to look elsewhere.
      if (describeDataSet.DataTable1.Rows.Count == 0)
      {
          myCommand.CommandText = describeCommandGeneralText;
          myAdapter.Fill(describeDataSet.DataTable1);
      }
  }
  ```

</div>

<span class="emphasis">*Step 2 - Build and Run the Application*</span>

You will see the same starting form:

<div class="figure-float">

<div id="sparqlwinf11" class="figure">

**Figure 2.146. Build and Run the Application**

<div class="figure-contents">

<div class="mediaobject">

![Build and Run the Application](images/ui/sparqlwinf11.png)

</div>

</div>

</div>

  

</div>

Select a Customer and then select the link to the City in dbpedia. This
will now open up another window displaying information about the city
from dbpedia. Be patient as it may take a little while to open.

<div class="figure-float">

<div id="sparqlwinf12" class="figure">

**Figure 2.147. Customer**

<div class="figure-contents">

<div class="mediaobject">

![Customer](images/ui/sparqlwinf12.png)

</div>

</div>

</div>

  

</div>

<span class="emphasis">*Step 3 - Changing the Form Title*</span>

Notice that in displayData method that we look for a
http://www.w3.org/1999/02/22-rdf-syntax-ns#type and create a title for
the form from it.

``` programlisting
foreach (DataRow row in table1.Rows)
  if (row[0].ToString() == "http://www.w3.org/1999/02/22-rdf-syntax-ns#type")
  {
      StringBuilder title = new StringBuilder(row[1].ToString() + " details");
      label1.Text = title.ToString();
      break;
  }
```

This worked well for the Northwind subjects but less well now we are
getting data from other graphs. To change the title of the forms used to
display the data:

<div class="itemizedlist">

- Add an new member variable to hold the IRI that we exploring to the
  bock of member variables

  ``` programlisting
  StringBuilder DescribeCommandSimple, DescribeCommandGeneral;
  VirtuosoConnection ParentConnection;
  List<Label> labelList = new List<Label>();
  List<TextBox> textBoxList = new List<TextBox>();
  DescribeDataSet describeDataSet = new DescribeDataSet();
  Boolean isIRI = false;
  SqlExtendedString ParentIRI;
  ```

- Assign a value to ParentIRI in the constructor:

  ``` programlisting
  public ExtendedStringHandler(SqlExtendedString iri, VirtuosoConnection parentConnection)
    {
        ParentConnection = parentConnection;
        if (iri.IriType == SqlExtendedStringType.IRI)
        {
            ParentIRI = iri;
            isIRI = true;
            DescribeCommandSimple = new StringBuilder("sparql select * from <http://demo.openlinksw.com/Northwind> where {<" + iri.ToString() + "> ?p ?o}");      // Replace demo.openlinksw.com with your  URIQA DefaultHost setting
            DescribeCommandGeneral = new StringBuilder("sparql define get:soft " + '"'.ToString() + "soft" + '"'.ToString() + " select * from <" + iri.ToString() + "> where { <" + iri.ToString() + "> ?p ?o }");
        }
    }
  ```

- Remove the existing foreach block that sets the form title and replace
  with the following lines:

  ``` programlisting
  StringBuilder title = new StringBuilder(ParentIRI.ToString() + " details");
  label1.Text = title.ToString();
  ```

- Build and run the application.

  <div class="figure-float">

  <div id="sparqlwinf13" class="figure">

  **Figure 2.148. Build and run the application**

  <div class="figure-contents">

  <div class="mediaobject">

  ![Build and run the application](images/ui/sparqlwinf13.png)

  </div>

  </div>

  </div>

    

  </div>

</div>

<span class="emphasis">*Next Steps*</span>

The application now allows you to explore data and follow links from
your locally held data into the external web of data. Looking at the
data displayed in the form it would be nice to make the labels for the
properties more compact. The label
http://dbpedia.org/property/population is a very precise definition but
for our purposes it would be clearer to label the property just
population. In the next step will be to modify the application so that
it displays more readable labels.

</div>

</div>
