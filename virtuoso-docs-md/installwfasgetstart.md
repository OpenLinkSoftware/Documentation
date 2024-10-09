<div>

<div>

<div>

<div>

### 2.9.2. Creating the Application

</div>

</div>

</div>

<span class="emphasis">*Step 1 - Create a view of the RDF data.*</span>

We want to be able to access the RDF data in Visual Studio and the
easiest way to do this is to create a view of the data that we are
interested in and bind that view to a DataSet. This can be considered as
using server side
<a href="rdfsparql.html" class="link" title="16.2. SPARQL">SPARQL</a> .
Virtuoso supports an <a href="rdfsparqlinline.html" class="link"
title="16.2.5. SPARQL Inline in SQL">extension to standard SQL that
allows</a> execution of SPARQL. If a SQL query begins with the keyword
SPARQL then the rest of the query is interpreted by as SPARQL. If a
SPARQL query is used as the definition of a view then that view can be
manipulated using SQL like any other view. In this way the result set
from a SPARQL query can be easily accessed from Visual Studio using
ADO.Net and the Entity Framework.

To create a view of the customers in the Northwind first open the
Virtuoso Conductor and log in as dba. Then open iSQL from the menu on
the left and execute the following statement.

``` programlisting

CREATE VIEW Demo.demo.sparqlview as
SPARQL
PREFIX nwind: <http://demo.openlinksw.com/schemas/northwind#>
SELECT DISTINCT  ?s
FROM <http://demo.openlinksw.com/Northwind>
WHERE {?s a nwind:Customer}
```

<span class="emphasis">*Note:*</span> If the view is added to the Visual
Studio project as user "demo" (or any other than "dba'), then it must be
ensured that the "SPARQL_SELECT" and "SPARQL_SPONGE" roles are assigned
to this user, which can be done via the Virtuoso Conductor in the
"System Admin" -\> "User Accounts" tab.

<div>

<div>

**Figure 2.136. SPARQL_SPONGE**

<div>

<div>

![SPARQL_SPONGE](images/ui/sparqlwinf1.png)

</div>

</div>

</div>

  

</div>

<span class="emphasis">*Step 2 - Create a simple grid form in Visual
Studio*</span>

<div>

1.  Open

    <span class="emphasis">*Visual Studio*</span>

    and create a new

    <span class="emphasis">*Windows Forms Application*</span>

    called RDFDemo.

2.  In the

    <span class="emphasis">*Form Designer*</span>

    drag a

    <span class="emphasis">*DataGridView*</span>

    on to the form.

3.  Click the

    <span class="emphasis">*Choose Data Source*</span>

    drop down and select

    <span class="emphasis">*Add Project Data Source*</span>

    .

    <div>

    <div>

    **Figure 2.137. Data Source**

    <div>

    <div>

    ![Data Source](images/ui/sparqlwinf2.png)

    </div>

    </div>

    </div>

      

    </div>

4.  In the

    <span class="emphasis">*Data Source Configuration Wizard*</span>

    choose Database and then set up a connection to the demo database on
    your local Virtuoso server.

5.  On the

    <span class="emphasis">*Choose Your Data Objects*</span>

    page expand the

    <span class="emphasis">*Views*</span>

    and select sparqlview.

    <div>

    <div>

    **Figure 2.138. Data Source Configuration Wizard**

    <div>

    <div>

    ![Data Source Configuration Wizard](images/ui/sparqlwinf3.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Click

    <span class="emphasis">*Finish*</span>

    .

7.  In the

    <span class="emphasis">*Form Designer*</span>

    select dataGridView1 and change the

    <span class="emphasis">*AutoSizeColumnsMode*</span>

    to AllCellsExceptHeader.

8.  Select the

    <span class="emphasis">*DefaultCellStyle*</span>

    and click on the ellipsis. This will open the

    <span class="emphasis">*CellStyleBuilder*</span>

    . Change the

    <span class="emphasis">*ForeColor*</span>

    to Blue.

    <div>

    <div>

    **Figure 2.139. CellStyleBuilder**

    <div>

    <div>

    ![CellStyleBuilder](images/ui/sparqlwinf4.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Expand

    <span class="emphasis">*Font*</span>

    and change

    <span class="emphasis">*Underline*</span>

    to True. Click

    <span class="emphasis">*OK*</span>

    .

</div>

<span class="emphasis">*Step 3 - Change the mapping of the
DataSet.*</span>

In the Solution Explorer you will now have a DataSet called
DemoDataSet.xsd. If you double click on this it opens the DataSet
Designer. Select the column called s in the sparqlview table and in the
Properties pane change the DataType from System.String to System.Object.

The data returned by a SPARQL query can either be an
<a href="ch-rdfandsparql.html#rdfiriidtype" class="link"
title="16.1.1. IRI_ID Type">IRI</a> or a literal value. In order to
distinguish between the two the Virtuoso ADO.Net provider defines an
additional data type, SQLExtendedString. By setting the column type to
System.Object we can cast the fetched data back to SQLExtendedString and
find out if an individual value is an IRI or a literal and handle it
appropriately.

<span class="emphasis">*Step 4 - Create the on_click event handler for
the cells in the DataGridView.*</span>

Return to the <span class="emphasis">*Form Designer*</span> and double
click on the cell of the <span class="emphasis">*DataGridView*</span> .
This creates the
<span class="emphasis">*dataGridView1_CellContentClick*</span> method in
Form1.cs. This is the method that handles clicking on IRI objects in the
grid.

Paste in the following block of code into the body of the
<span class="emphasis">*dataGridView1_CellContentClick*</span> method.

``` programlisting
int column = e.ColumnIndex;
 object o = dataGridView1.Rows[e.RowIndex].Cells[e.ColumnIndex].Value;
 Type t = dataGridView1.Rows[e.RowIndex].Cells[e.ColumnIndex].ValueType;

 if (o is SqlExtendedString)
 {
     SqlExtendedString se = (SqlExtendedString) o;
     ExtendedStringHandler seHandler = new ExtendedStringHandler(se, this.sparqlviewTableAdapter.Connection);
     seHandler.displayData();
 }
 else if (o is SqlRdfBox)
 {
     //doesn't do anything at the moment
 }
```

As we are using the SQLExtendedString extension from the Virtuoso
ADO.Net provider you will also need to add

``` programlisting
using OpenLink.Data.Virtuoso;
```

at the top of the file.

<span class="emphasis">*Step 5 - Create a class to handle exploring the
RDF data.*</span>

<div>

- Add a new C# class to the project called ExtendedStringHandler, by
  Right clicking on RDFDemo in the

  <span class="emphasis">*Solution Explorer*</span>

  and

  <span class="emphasis">*Add*</span>

  a

  <span class="emphasis">*Class*</span>

  .

- Add the following using statements to the top of the file

  ``` programlisting
  using OpenLink.Data.Virtuoso;
  using System.Data;
  using System.Windows.Forms;
  using System.Drawing;
  using System.Data.Mapping;
  using System.Data.Common;
  ```

- Paste the following block of code into the class definition.

  ``` programlisting
  StringBuilder DescribeCommand;
  VirtuosoConnection ParentConnection;
  List<Label> labelList = new List<Label>();
  List<TextBox> textBoxList = new List<TextBox>();
  DescribeDataSet describeDataSet = new DescribeDataSet();
  Boolean isIRI = false;

  public ExtendedStringHandler(SqlExtendedString iri, VirtuosoConnection parentConnection)
   {
       ParentConnection = parentConnection;
       if (iri.IriType == SqlExtendedStringType.IRI)
       {
           isIRI = true;
           DescribeCommand = new StringBuilder("sparql select * from <http://demo.openlinksw.com/Northwind> where {<" + iri.ToString() + "> ?p ?o}");      // Replace demo.openlinksw.com with your  URIQA DefaultHost setting
       }
   }

   public string describeCommandText
   {
       get
       {
           return DescribeCommand.ToString();
       }
   }

   public void getDescribeData()
   {
        VirtuosoCommand myCommand = new VirtuosoCommand(this.describeCommandText, this.ParentConnection);
       VirtuosoDataAdapter myAdapter = new VirtuosoDataAdapter();
       myAdapter.SelectCommand = myCommand;
       myAdapter.Fill(describeDataSet.DataTable1);
   }

   public void displayData()
   {
       if (isIRI)
       {
           getDescribeData();
           Form describeForm = new Form();
           describeForm.AutoScroll = true;
           describeForm.Width = 840;

           Label label1 = new Label();
           label1.AutoSize = true;
           label1.Font = new Font(label1.Font.FontFamily, label1.Font.Size + 3.0F, label1.Font.Style | FontStyle.Bold, label1.Font.Unit);
           describeForm.Controls.Add(label1);

           DataTable table1 = describeDataSet.Tables[0];
           if (table1.Rows.Count == 0)
               label1.Text = "No Details Available";
           else
           {
               foreach (DataRow row in table1.Rows)
                   if (row[0].ToString() == "http://www.w3.org/1999/02/22-rdf-syntax-ns#type")
                   {
                       StringBuilder title = new StringBuilder(row[1].ToString() + " details");
                       label1.Text = title.ToString();
                       break;
                   }

               foreach (DataRow row in table1.Rows)
               {
                   Label propertyLabel = new Label();
                   TextBox valueBox = new TextBox();
                   valueBox.Width = 400;

                   object property = row[0];
                   object value = row[1];

                   if (value is SqlExtendedString)
                   {
                       valueBox.ForeColor = Color.Blue;
                       valueBox.Font = new Font(valueBox.Font.FontFamily, valueBox.Font.Size, valueBox.Font.Style | FontStyle.Underline, valueBox.Font.Unit);
                   }
                   propertyLabel.Text = row[0].ToString();
                   propertyLabel.AutoEllipsis = true;
                   propertyLabel.AutoSize = false;
                   propertyLabel.Width = propertyLabel.PreferredWidth > 380 ? 380 : propertyLabel.PreferredWidth;

                   Binding bind = new Binding("Text", row[1], "");
                   valueBox.DataBindings.Add(bind);

                   labelList.Add(propertyLabel);
                   textBoxList.Add(valueBox);
               }

               for (int i = 0; i < table1.Rows.Count; i++)
               {
                   textBoxList[i].Click += new EventHandler(this.iri_Click);
                   labelList[i].Location = new Point(10, i * 20 + 50);
                   textBoxList[i].Location = new Point(400, i * 20 + 50);
                   describeForm.Controls.Add(labelList[i]);
                   describeForm.Controls.Add(textBoxList[i]);
               }

               describeForm.Height = labelList.Count * 20 + 100 > 500 ? 500 : labelList.Count * 20 + 100;
           }
           describeForm.ShowDialog();
       }
       else
       {
           Form blankForm = new Form();
           Label label1 = new Label();
           label1.Text = "Blank Node";
           label1.Font = new Font(label1.Font.FontFamily, label1.Font.Size + 3.0F, label1.Font.Style | FontStyle.Bold, label1.Font.Unit);
           blankForm.ShowDialog();
       }
   }

   public void iri_Click(object sender, EventArgs e)
   {
       int boxNum = 0;

       for (int i = 0; i < textBoxList.Count; i++)
       {
           if (sender == textBoxList[i])
           {
               boxNum = i;
               break;
           }
       }

      Object o = describeDataSet.DataTable1.Rows[boxNum][1];
       if (o is SqlExtendedString)
       {
           SqlExtendedString se = (SqlExtendedString)o;
           ExtendedStringHandler seHandler = new ExtendedStringHandler(se, ParentConnection);
           seHandler.displayData();
       }
       else if (o is SqlRdfBox)
       {
          //doesn't do anything at the moment
      }
   }
  ```

</div>

The ExtendedStringHandler class creates a new SPARQL query based on the
IRI that was clicked. This query is executed against Virtuoso using the
ADO.Net connection in the same way that any SQL statement would be
executed across an ADO.Net connection. This can be considered as Client
Side SPARQL. The result set from the query describes the selected object
and is returned as an ADO.Net DataAdapter. The DataAdapter is used to
fill a DataTable which is displayed on a new form. We now need to add
the new DataSet to the project and define the DataTable that will hold
the query results.

<span class="emphasis">*Step 6 - Add a new DataSet to hold the query
results.*</span>

<div>

1.  Right click RDFDemo in the

    <span class="emphasis">*Solution Explorer*</span>

    and add a new

    <span class="emphasis">*DataSet*</span>

    . Call the new

    <span class="emphasis">*DataSet*</span>

    DescribeDataSet.

    <div>

    <div>

    **Figure 2.140. Add a new DataSet**

    <div>

    <div>

    ![Add a new DataSet](images/ui/sparqlwinf5.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Double click on DescribeDataSet in the

    <span class="emphasis">*Solution Explorer*</span>

    to open the

    <span class="emphasis">*DataSet*</span>

    Designer and drag a

    <span class="emphasis">*DataTable*</span>

    from the

    <span class="emphasis">*Toolbox*</span>

    into it.

3.  Add two columns, p and o, to the

    <span class="emphasis">*DataTable*</span>

    and set the

    <span class="emphasis">*DataType*</span>

    of each column to System.Object.

    <div>

    <div>

    **Figure 2.141. Add two columns**

    <div>

    <div>

    ![Add two columns](images/ui/sparqlwinf6.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

<span class="emphasis">*Step 7 - Build and run the application.*</span>

You should see a form displaying all the Northwind customers, like this.

<div>

<div>

**Figure 2.142. Northwind customers**

<div>

<div>

![Northwind customers](images/ui/sparqlwinf7.png)

</div>

</div>

</div>

  

</div>

When any customer is clicked it opens a new form showing customer
details.

<div>

<div>

**Figure 2.143. Customer details**

<div>

<div>

![Customer details](images/ui/sparqlwinf8.png)

</div>

</div>

</div>

  

</div>

Clicking on the links in the new form allows you to drill down further
to get order, product, location details etc.

<div>

<div>

**Figure 2.144. Order, product, location details**

<div>

<div>

![Order, product, location details](images/ui/sparqlwinf9.png)

</div>

</div>

</div>

  

</div>

and

<div>

<div>

**Figure 2.145. Order, product, location details**

<div>

<div>

![Order, product, location details](images/ui/sparqlwinf10.png)

</div>

</div>

</div>

  

</div>

<span class="emphasis">*Next Steps*</span>

You will notice if you keep clicking on the links that this application
will only display data that is held in the Northwind graph. Clicking on
an external link, for example the link to Berlin in dbpedia,
http://dbpedia.org/resource/Berlin, results in a empty window and an
error message. The next step is to extend this application so that it
can handle dereferencing external IRIs.

</div>
