<div id="installcrbrappl" class="section">

<div class="titlepage">

<div>

<div>

### 2.10.3. Creating the Browser Application

</div>

</div>

</div>

<span class="emphasis">*Step 1 - Create the Visual Studio
Project.*</span>

<div class="orderedlist">

1.  Open

    <span class="emphasis">*Visual Studio*</span>

    and create a new

    <span class="emphasis">*ASP.NET Web Application*</span>

    called RDFWebApp.

    <div class="figure-float">

    <div id="sparqlwinf28" class="figure">

    **Figure 2.163. New Web Application**

    <div class="figure-contents">

    <div class="mediaobject">

    ![New Web Application](images/ui/sparqlwinf28.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Create client side entities with datasvcutil.exe

    <div class="itemizedlist">

    - Open a command prompt.

    - Navigate to \*C:\WINDOWS\Microsoft.NET\Framework\v3.5\*.

    - Generate the client classes using the following command:

      ``` programlisting
      datasvcutil.exe /uri:http://example.com/WebDataService1.svc /out:DemoEntities.cs
      ```

      Note the address of the service - you may need to change the port
      number to match the one seen in the address at the end of Step 4
      in Creating the Web Service.

    </div>

3.  Add the classes to RDFWebApp.

    <div class="itemizedlist">

    - Right click RDFWebApp

    - Choose to add an existing item and add
      c:\WINDOWS\Microsoft.NET\Framework\v3.5\DemoEntities.cs.

    </div>

4.  Add a reference to System.Data.Services.Client to the project.

</div>

<span class="emphasis">*Step 2 - Display the contents of sparqlview as a
table on the page*</span>

To display the RDF data on the web page we create a table with a row for
each item in sparqlview. We then use each IRI from sparqlview to create
a hyperlink. The hyperlinks are displayed in the table cells. To do this
add the following block of code to the page_load method in
Default.aspx.cs.

``` programlisting
 DemoModel.DemoEntities svc = new DemoModel.DemoEntities(new Uri("http://example.com/WebDataService1.svc"));

  var query = svc.sparqlview;
  Table iriTable = new Table();
  this.Controls.Add(iriTable);

  foreach (DemoModel.sparqlview sv in query)
  {
      TableRow tRow = new TableRow();
      iriTable.Rows.Add(tRow);
      TableCell tCell = new TableCell();
      tRow.Cells.Add(tCell);
      HyperLink h = new HyperLink();
      h.Text = sv.s;
      h.NavigateUrl = sv.s;
      tCell.Controls.Add(h);
  }
```

Note the address of the service in the first line - you may need to
change the port number to match the one seen in the address at the end
of Step 4 in Creating the Web Service.

Compile and run RDFWebApp (ensuring that the service created above is
still running). This will launch a browser and display the IRIs from
sparqlview as a list of hyperlinks.

<div class="figure-float">

<div id="sparqlwinf29" class="figure">

**Figure 2.164. list of hyperlinks**

<div class="figure-contents">

<div class="mediaobject">

![list of hyperlinks](images/ui/sparqlwinf29.png)

</div>

</div>

</div>

  

</div>

With the <a
href="http://s3.amazonaws.com/opldownload/uda/vad-packages/6.3/virtuoso/cartridges_dav.vad"
class="ulink" target="_top">Cartridges VAD package</a> installed in
Virtuoso, clicking on these links will take you to a description page of
the referenced resource. The description page is created using <a
href="http://virtuoso.openlinksw.com/Whitepapers/html/vdld_html/VirtDeployingLinkedDataGuide_Glossary.html#mozTocId13075"
class="ulink" target="_top">description.vsp</a> .

<div class="figure-float">

<div id="sparqlwinf30" class="figure">

**Figure 2.165. Description page**

<div class="figure-contents">

<div class="mediaobject">

![Description page](images/ui/sparqlwinf30.png)

</div>

</div>

</div>

  

</div>

</div>
