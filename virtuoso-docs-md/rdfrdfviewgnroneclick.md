<div id="rdfrdfviewgnroneclick" class="section">

<div class="titlepage">

<div>

<div>

### 16.6.2. One Click Linked Data Generation & Deployment

</div>

</div>

</div>

The following steps provide a one-click guide for publishing ODBC- or
JDBC-accessible RDBMS data in RDF Linked Data form, using the "Generate
& Publish" Conductor feature.

<div class="orderedlist">

1.  Go to http://\<cname\>:port/conductor ;

2.  Log in as user dba (or another user with DBA privileges);

3.  Follow menu path Linked Data -\> Views;

    <div class="figure-float">

    <div id="rd1" class="figure">

    **Figure 16.52. Linked Data Views**

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

    3.  Select specific Tables containing the data to be published (e.g.
        Demo.demo.Orders and Demo.demo.Products)

    4.  Click the "Generate & Publish" button

    </div>

    <div class="figure-float">

    <div id="rd2" class="figure">

    **Figure 16.53. Linked Data Views Generate and Publish**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Linked Data Views Generate and Publish](images/ui/rd2.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Virtuoso will perform the entire process of ontology generation,
    instance data generation, and linked data deployment (re-write rules
    generation and application).

6.  Error messages will be presented if the Wizard encounters problems.
    If there are no error messages, your Linked Data View declarations
    and Linked Data publishing activities will have completed
    successfully.

    <div class="figure-float">

    <div id="rd13" class="figure">

    **Figure 16.54. Linked Data View declarations and Linked Data
    publishing activities**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Linked Data View declarations and Linked Data publishing
    activities](images/ui/rd13.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Optionally, you could also perform one of the following tasks:

    <div class="orderedlist">

    1.  Save Data Mappings: when clicked, offers to save the generated
        Definitions to local file system

    2.  Save Ontology Mappings: when clicked, offers to save the
        generated Ontology to local file system

    3.  Click on the "Cancel" should you want to return to the initial
        Linked Data View Generation form.

    </div>

</div>

</div>
