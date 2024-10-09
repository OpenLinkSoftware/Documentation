<div>

<div>

<div>

<div>

### 2.9.5. Modifying the Northwind Ontology to Add Labels

</div>

</div>

</div>

This section will guide you through modifying the Northwind Ontology
created when you installed the <a
href="http://download.openlinksw.com/packages/5.0/virtuoso/demo_dav.vad"
class="ulink" target="_top">demo database VAD package</a> so that each
resources is identified by an
http://www.w3.org/2000/01/rdf-schema#label. This will improve the
readability of the information displayed by the application created in
<a href="installwfasxtendcomplab.html" class="link"
title="2.9.4. Extending RDFDemo to Display More Compact Labels">Extending
RDFDemo to Display More Compact Labels</a> .

<span class="emphasis">*Pre-requisites*</span>

<div>

1.  A working copy of the RDFDemo application created in
    <a href="installwfasxtendcomplab.html" class="link"
    title="2.9.4. Extending RDFDemo to Display More Compact Labels">Extending
    RDFDemo to Display More Compact Labels</a>

</div>

<div>

<div>

<div>

<div>

#### Editing the Ontology

</div>

</div>

</div>

<span class="emphasis">*Get a Working Copy of the Northwind
Ontology*</span>

The the file describing the Northwind Ontology, nw.owl, is installed in
the DAV when the demo vad is loaded. To get a working copy open the
Virtuoso Conductor and log in as dba. Select WebDAV Browser in the
navigation panel on the left. This will open a window that allows you to
browse the WebDAV Repository. The Northwind Ontology file can be found
in DAV/VAD/demo/sql. Take a copy of the file.

<span class="emphasis">*Editing nw.owl*</span>

In the first instance is edited nw.owl so that the property name
consistently begin with a lower case letter. This matches the results
for describing resources held in the Northwind database. Also are added
missing properties so that there should be a label in all cases.

<span class="emphasis">*Registering the Changes in Virtuoso*</span>

There are two methods for registering the changes in Virtuoso:

<div>

1.  Method I:

    <div>

    - Copy the edited version of nw.owl back into the DAV.

    - In isql, load the script load_ontology_dav.sql and execute it. The
      new version of nw.owl will then be used

    </div>

2.  <div>

    - Ensure that your new version of nw.owl is in a folder accessible
      by Virtuoso. You may need to edit your virtuoso.ini file and
      restart the server.

    - In isql, load the script load_ontology_file.sql and edit it so
      that it has the full path to the new version of nw.owl

    - Run the script. The new version of nw.owl will then be used.

    </div>

</div>

Modify RDFDemo so that it looks for the graph used to describe the
Northwind data and searches that graph for the predicate details:

<div>

1.  Add a new member variable to the ExtendedStringHandler class to hold
    the graphs that we need to search for the predicate information.

    ``` programlisting
    StringBuilder DescribeCommandSimple, DescribeCommandGeneral;
    VirtuosoConnection ParentConnection;
    List<Label> labelList = new List<Label>();
    List<TextBox> textBoxList = new List<TextBox>();
    List<String> graphList = new List<String>();
    DescribeDataSet describeDataSet = new DescribeDataSet();
    Boolean isIRI = false;
    SqlExtendedString ParentIRI;
    ```

2.  In displayData, after we have set the title of the form, add the
    following block of code:

    ``` programlisting
    // Later we will want to get property labels and for that
     // we will need the graph where the resource is defined.
    foreach (DataRow row in table1.Rows)
         if (row[0].ToString() == "http://www.openarchives.org/ore/terms/isDescribedBy"
        && row[1].ToString() != ParentIRI.ToString())
         {
             String graph = row[1].ToString();
             graphList.Add(graph);
         }
    ```

3.  Replace the existing getLabelText method with an extended version

    ``` programlisting
     private string getLabelText(Object label)
      {
          string labelText = label.ToString();
          if (label is SqlExtendedString)
          {
              Boolean foundLabel = false;
              SqlExtendedString se = (SqlExtendedString)label;
              VirtuosoDataAdapter getLabelAdapter = new VirtuosoDataAdapter();
              DataSet getLabelDataSet = new DataSet();

              //Try finding it in resources graph first
              foreach (String graph in graphList)
              {
                  StringBuilder getLabelCommandText = new StringBuilder("sparql select * from <" + graph + "> where {<" + se.ToString() + "> ?p ?o}");
                  VirtuosoCommand getLabelCommand = new VirtuosoCommand(getLabelCommandText.ToString(), ParentConnection);
                  getLabelAdapter.SelectCommand = getLabelCommand;

                  try
                  {
                      getLabelAdapter.Fill(getLabelDataSet);
                      foreach (DataRow getLabelRow in getLabelDataSet.Tables[0].Rows)
                      {
                          if (getLabelRow[0].ToString() == "http://www.w3.org/2000/01/rdf-schema#label")
                          {
                              labelText = getLabelRow[1].ToString();
                              foundLabel = true;
                              break;
                          }
                      }
                  }
                  catch
                  {
                  }
                  if (foundLabel)
                      break;
              }
              // If we still have no label try the predicate itself as the graph
              if (!foundLabel)
              {
                  StringBuilder getLabelCommandText = new StringBuilder("sparql define get:soft \"soft\" select * from <" + se.ToString() + "> where {<" + se.ToString() + "> ?p ?o}");
                  VirtuosoCommand getLabelCommand = new VirtuosoCommand(getLabelCommandText.ToString(), ParentConnection);
                  getLabelAdapter.SelectCommand = getLabelCommand;
                  try
                  {
                      getLabelAdapter.Fill(getLabelDataSet);
                      foreach (DataRow getLabelRow in getLabelDataSet.Tables[0].Rows)
                      {
                          if (getLabelRow[0].ToString() == "http://www.w3.org/2000/01/rdf-schema#label")
                          {
                              labelText = getLabelRow[1].ToString();
                              break;
                          }
                      }
                  }
                  catch
                  {
                  }
              }
          }
          return labelText;
      }
    ```

    This extended method first checks the graphs in the graph list for
    the predicate information then if no label has been found tries the
    predicate itself as the graph.

4.  Build and run, the Northwind resources should now be correctly and
    concisely labeled

    <div>

    <div>

    **Figure 2.150. Northwind resources**

    <div>

    <div>

    ![Northwind resources](images/ui/sparqlwinf15.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

<span class="emphasis">*Improving The Appearance of the Form*</span>

The following changes are not strictly necessary but improve the
appearance of the form:

<div>

- Line up the right hand edge of the labels with the text boxes by
  setting TextAlign to MiddleRight and reduce the width of the labels.

  ``` programlisting
  propertyLabel.Text = getLabelText(row[0]);
  propertyLabel.AutoEllipsis = true;
  propertyLabel.AutoSize = false;
  propertyLabel.Width = 130;
  propertyLabel.TextAlign = ContentAlignment.MiddleRight;
  ```

- Make the form narrower:

  ``` programlisting
  describeForm.Width = 660;
  ```

- Alter the positioning of the labels and TextBoxes on the form:

  ``` programlisting
  textBoxList[i].Click += new EventHandler(this.iri_Click);
  labelList[i].Location = new Point(10, i * 22 + 50);
  textBoxList[i].Location = new Point(150, i * 22 + 50);
  describeForm.Controls.Add(labelList[i]);
  describeForm.Controls.Add(textBoxList[i]);
  ```

  <div>

  <div>

  **Figure 2.151. Alter the positioning**

  <div>

  <div>

  ![Alter the positioning](images/ui/sparqlwinf16.png)

  </div>

  </div>

  </div>

    

  </div>

</div>

<span class="emphasis">*Next Steps*</span>

The image below shows some of the information about an employee in the
Northwind dataset.

<div>

<div>

**Figure 2.152. employee**

<div>

<div>

![employee](images/ui/sparqlwinf17.png)

</div>

</div>

</div>

  

</div>

In the next step we will extend the application so the images and web
pages can be viewed and long text fields are displayed in full.

</div>

</div>
