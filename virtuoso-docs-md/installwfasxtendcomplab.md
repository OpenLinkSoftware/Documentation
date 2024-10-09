<div>

<div>

<div>

<div>

### 2.9.4. Extending RDFDemo to Display More Compact Labels

</div>

</div>

</div>

This section will guide you through extending the application created in
<a href="installwfasxtendcomlab.html" class="link"
title="2.9.3. Extending RDFDemo to Allow Dereferencing of External IRIs">Extending
RDFDemo to Allow Dereferencing of External IRIs</a> so that the data is
displayed in a more readable form.

<span class="emphasis">*Pre-requisites*</span>

<div>

1.  A working copy of the RDFDemo application created in
    <a href="installwfasxtendcomlab.html" class="link"
    title="2.9.3. Extending RDFDemo to Allow Dereferencing of External IRIs">Extending
    RDFDemo to Allow Dereferencing of External IRIs</a>

</div>

<div>

<div>

<div>

<div>

#### Extending the Application

</div>

</div>

</div>

The RDF demo application presents the user with a list of Customers from
the Northwind database in the form of dereferenceable IRIs. When a
customer is selected from the list the application uses a sparql query
to describe that customer and the results are displayed in a form as
rows of labels and data. The labels correspond to RDF predicates and the
data corresponds to RDF objects while the subject is the customer
initially selected. In many cases the objects are dereferencable IRIs
which are then used as the subject when the 'drilling down' into the
data. However, the predicates are also IRIs so it is possible to gain
more information about these as well.

The RDF Schema defines a property
http://www.w3.org/2000/01/rdf-schema#label that may be used to provide a
human-readable version of a resource's name. We can obtain further
details of each of the predicates in a resultset and check to see if one
of the properties is an http://www.w3.org/2000/01/rdf-schema#label. If
it is we can use the associated text as the label in our form instead of
the the predicate IRI. The benefit should be a more human readable form.

<span class="emphasis">*Step 1 - Add a New Method to Get the Label
Text*</span>

This method takes the predicate IRI and issues a sparql query to get its
description. It then cycles through the returned dataset to find a
http://www.w3.org/2000/01/rdf-schema#label. If there is one then the
associated text is returned by the method. Otherwise the method returns
the IRI string.

<div>

- Add the following method to the ExtendedStringHandlerClass

  ``` programlisting
  private string getLabelText(Object label)
    {
        string labelText = label.ToString();
        if (label is SqlExtendedString)
        {
            SqlExtendedString se = (SqlExtendedString)label;
            StringBuilder getLabelCommandText = new StringBuilder("sparql define get:soft \"soft\" select * from <" + se.ToString() + "> where {<" + se.ToString() + "> ?p ?o}");
            VirtuosoCommand getLabelCommand = new VirtuosoCommand(getLabelCommandText.ToString(), ParentConnection);
            VirtuosoDataAdapter getLabelAdapter = new VirtuosoDataAdapter();
            getLabelAdapter.SelectCommand = getLabelCommand;
            DataSet getLabelDataSet = new DataSet();
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
        return labelText;
    }
  ```

- Change the line in displayData from

  ``` programlisting
  propertyLabel.Text = row[0].ToString();
  ```

- to

  ``` programlisting
  propertyLabel.Text = getLabelText(row[0]);
  ```

</div>

<span class="emphasis">*Step 1 - Add a New Method to Get the Label
Text*</span>

When you run the application you will see that the initial form is the
same. In fact, when you select the Customer you will also see that the
customer details are also the same. It is only when you start exploring
data outside the Northwind graph that you will see the labels in the
form change.

<div>

<div>

**Figure 2.149. Northwind graph**

<div>

<div>

![Northwind graph](images/ui/sparqlwinf14.png)

</div>

</div>

</div>

  

</div>

<span class="emphasis">*Next Steps*</span>

It is clear from running the application that the Northwind ontology
does not define an http://www.w3.org/2000/01/rdf-schema#label for its
members. In order to benefit from this modified version of RDFDemo we
need to update our Northwind ontology so that
http://www.w3.org/2000/01/rdf-schema#label is defined for each resource.
The next step will be to modify our Northwind ontology.

</div>

</div>
