<div id="rdfrdfviewgnrwizzard" class="section">

<div class="titlepage">

<div>

<div>

### 16.6.3. Manual Linked Data Generation & Deployment using the Conductor's HTML-based wizard

</div>

</div>

</div>

The following step-by guide will lead you through manually publishing
ODBC- or JDBC-accessible RDBMS data in RDF Linked Data form, using the
Conductor's HTML-based wizard:

<div class="orderedlist">

1.  Go to http://\<cname\>:port/conductor

2.  Log in as user dba (or another user with DBA privileges)

3.  Follow menu path Linked Data -\> Views

    <div class="figure-float">

    <div id="rd1_01" class="figure">

    **Figure 16.55. Linked Data Views**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Linked Data Views](images/ui/rd1.png)

    </div>

    </div>

    </div>

      

    </div>

4.  In the form presented, perform the following steps:

    <div class="orderedlist">

    1.  Select the Database Name Qualifier (e.g., "Demo") that exposes
        the Tables / Views for this exercise

    2.  Enter the Base URL to which your URL rewrite rules will be bound
        (e.g. http://\<cname\>:8890/Demo)

    3.  Select specific Tables containing the data to be published
        (e.g., Demo.demo.Orders and Demo.demo.Products)

    4.  Click the "Generate via Wizard" button

        <div class="figure-float">

        <div id="rd2_01" class="figure">

        **Figure 16.56. Generate via Wizard**

        <div class="figure-contents">

        <div class="mediaobject">

        ![Generate via Wizard](images/ui/rd2.png)

        </div>

        </div>

        </div>

          

        </div>

    </div>

5.  At this point, you are presented with the option to edit your column
    selection. Select the "Edit" link, for example, for table
    Demo.demo.Products.

    <div class="figure-float">

    <div id="rd3" class="figure">

    **Figure 16.57. Column Selection**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Column Selection](images/ui/rd3.png)

    </div>

    </div>

    </div>

      

    </div>

6.  For images or other binary data in MIME formats to be revealed as
    anything other than generic "binary objects", you must map large
    varbinary types to the appropriate MIME types like image/gif. To do
    so, select the Edit link for Binding/MIME Type of the relevant table
    columns. You can:

    <div class="orderedlist">

    1.  Leave the Binding/MIME Type literal; or

    2.  Set to skip, such that the column will not be used in RDF
        generation; or

    3.  Select the binary object value in order for the column to be
        referenced as binary.

    </div>

    <div class="figure-float">

    <div id="rd14" class="figure">

    **Figure 16.58. Binding/MIME Types**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Binding/MIME Types](images/ui/rd14.png)

    </div>

    </div>

    </div>

      

    </div>

7.  After finishing with your changes click the Save button, or cancel
    the changes and go back by clicking the Cancel button.

8.  Make sure you click the "Next" button.

9.  At this point, the Linked Data View Definition form will let you
    Select Generation Targets options:

    <div class="orderedlist">

    1.  Data Source Ontology Mappings

    2.  Instance Data View Mappings

    3.  VoID statistic

    </div>

    <div class="figure-float">

    <div id="rd15" class="figure">

    **Figure 16.59. Generation Targets options**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Generation Targets options](images/ui/rd15.png)

    </div>

    </div>

    </div>

      

    </div>

10. Make sure you click the "Next" button.

11. Based on your selections in the prior form, the Linked Data View
    Definition Deployment Options form will be offered:

    <div class="orderedlist">

    1.  Data Source Ontology Rules

    2.  Instance Data Rules

    </div>

    <div class="figure-float">

    <div id="rd4" class="figure">

    **Figure 16.60. Generation Targets options**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Generation Targets options](images/ui/rd4.png)

    </div>

    </div>

    </div>

      

    </div>

12. Select the desired option(s) and click the "Prepare to Execute"
    button which unveils a generated Instance Data and/or Ontology form.

    <div class="figure-float">

    <div id="rd5" class="figure">

    **Figure 16.61. Instance Data and/or Ontology**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Instance Data and/or Ontology](images/ui/rd5.png)

    </div>

    </div>

    </div>

      

    </div>

13. Click the Execute button and Virtuoso will:

    <div class="orderedlist">

    1.  Apply the generated declarations (instance data and ontology) to
        your Virtuoso instance

    2.  Publish / Deploy declarations that expose the Wizard-generated
        Rewrite Rules and associated endpoints.

        <div class="figure-float">

        <div id="rd6" class="figure">

        **Figure 16.62. Publishing / Deployment declarations**

        <div class="figure-contents">

        <div class="mediaobject">

        ![Publishing / Deployment declarations](images/ui/rd6.png)

        </div>

        </div>

        </div>

          

        </div>

    </div>

14. Optionally, you can also perform one of the following tasks:

    <div class="orderedlist">

    1.  Save Data Mappings: when clicked, offers to save the generated
        Definitions to local file system

    2.  Save Ontology Mappings: when clicked, offers to save the
        generated Ontology to local file system

    3.  Export as WebDAV resource: exports the selected objects/items as
        a WebDAV resource:

        <div class="orderedlist">

        1.  Click "Browse"

        2.  Enter a WebDAV resource and click the "Select" button.

        </div>

        <div class="figure-float">

        <div id="rd7" class="figure">

        **Figure 16.63. WebDAV resource**

        <div class="figure-contents">

        <div class="mediaobject">

        ![WebDAV resource](images/ui/rd7.png)

        </div>

        </div>

        </div>

          

        </div>

    </div>

    Note, the WebDAV resource path value will be shown in the WebDAV
    location field.

15. Then click the "Save Data Mappings" or "Save Ontology Mappings"
    button, to complete the option task of saving your generated (or
    edited) view declarations.

    <div class="figure-float">

    <div id="rd8" class="figure">

    **Figure 16.64. WebDAV resource**

    <div class="figure-contents">

    <div class="mediaobject">

    ![WebDAV resource](images/ui/rd8.png)

    </div>

    </div>

    </div>

      

    </div>

16. Error messages will be presented if the Wizard encounters problems.
    If there are no error messages, your Linked Data View declarations
    and Linked Data publishing activities will have completed
    successfully.

    <div class="figure-float">

    <div id="rd9" class="figure">

    **Figure 16.65. Linked Data View declarations and Linked Data
    publishing activities Finish**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Linked Data View declarations and Linked Data publishing
    activities Finish](images/ui/rd9.png)

    </div>

    </div>

    </div>

      

    </div>

17. Click on Cancel to return to the initial Linked Data View Generation
    form.

</div>

</div>
