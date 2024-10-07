<div id="vdbenginedb2uedm" class="section">

<div class="titlepage">

<div>

<div>

### 8.6.5. Using EDM to create Entity Framework based applications

</div>

</div>

</div>

Now that a Microsoft Entity Data Model has been created for the DB2
Samplef database, Entity Framework applications can be created to make
use of it.

<div id="vdbenginedb2uedmentf" class="section">

<div class="titlepage">

<div>

<div>

#### Entity Frameworks based ADO.NET Data Service

</div>

</div>

</div>

An ADO.Net Data Service for the DB2 tables can be created using the
Entity Data Model created in the
<a href="vdbenginedb2crvs.html" class="link"
title="8.6.4. Creating EDM in Visual Studio 2008">Creating EDM in Visual
Studio 2008 section</a> .

<div class="orderedlist">

1.  Open the

    <span class="emphasis">*VirtuosoDataService*</span>

    project created in the <a href="vdbenginedb2crvs.html" class="link"
    title="8.6.4. Creating EDM in Visual Studio 2008">Creating EDM in Visual
    Studio 2008 section</a> .

2.  Select the Project -\> Add New Item menu option.

    <div class="figure-float">

    <div id="fora1_02" class="figure">

    **Figure 8.301. VirtuosoDataService**

    <div class="figure-contents">

    <div class="mediaobject">

    ![VirtuosoDataService](images/ui/einf4.png)

    </div>

    </div>

    </div>

      

    </div>

3.  The

    <span class="emphasis">*Add New Item*</span>

    dialog will appear. Choose the

    <span class="emphasis">*ADO.NET Data Service template*</span>

    . Give it the name

    <span class="emphasis">*Virtuoso.svc*</span>

    and click

    <span class="emphasis">*Add*</span>

    to create the ADO.Net Data Service.

    <div class="figure-float">

    <div id="fora2_02" class="figure">

    **Figure 8.302. Add New Item**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Add New Item](images/ui/fora2.png)

    </div>

    </div>

    </div>

      

    </div>

4.  In the newly created

    <span class="emphasis">*Virtuoso.svc.cs*</span>

    Data Service file, add the data source class name of

    <span class="emphasis">*VirtuosoEntities*</span>

    (note this is the name set in the Creating EDM in Visual Studio 2008
    section) as the

    <span class="emphasis">*DataService*</span>

    name. Enable the access to the Data Service by adding the entry

    <span class="emphasis">*config.SetEntitySetAccessRule("\*",
    EntitySetRights.All);*</span>

    to the

    <span class="emphasis">*InitializeService*</span>

    method.

    ``` programlisting
    // C#

    using System;
    using System.Web;
    using System.Collections.Generic;
    using System.ServiceModel.Web;
    using System.Linq;
    using System.Data.Services;

    namespace SimpleDataService
    {
        public class Northwind : DataService<VirtuosoDemoEntities>
        {
            public static void InitializeService(IDataServiceConfiguration  config)
            {
                config.SetEntitySetAccessRule("*", EntitySetRights.All);
            }
        }
    }
    ```

    <div class="figure-float">

    <div id="fora3_02" class="figure">

    **Figure 8.303. Virtuoso.svc.cs**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Virtuoso.svc.cs](images/ui/fora3.png)

    </div>

    </div>

    </div>

      

    </div>

5.  To test the Data Service, simply hit

    <span class="emphasis">*Ctrl+F5*</span>

    within Visual Studio. This will start the development web server,
    run the Data Services server inside, and load a Web browser page
    displaying the list of available tables/entities for the SAMPLE
    database catalog.

    <div class="figure-float">

    <div id="fbora4" class="figure">

    **Figure 8.304. Data Service test**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Service test](images/ui/fbora4.png)

    </div>

    </div>

    </div>

      

    </div>

6.  To access a specific entity instance like the

    <span class="emphasis">*EMPLOYEES*</span>

    table employee number

    <span class="emphasis">*000010*</span>

    record, use this convention
    http://host/vdir/Virtuoso.svc/EMPLOYEES("000010") .

    <div class="figure-float">

    <div id="fbora5" class="figure">

    **Figure 8.305. EMPLOYEES**

    <div class="figure-contents">

    <div class="mediaobject">

    ![EMPLOYEES](images/ui/fbora5.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

<span class="emphasis">*Notes:*</span>

<div class="orderedlist">

1.  <span class="emphasis">*Important*</span>

    \- To view

    <span class="emphasis">*Atom*</span>

    (the default format returned by an ADO.NET Data Service) in Internet
    Explorer, you must first ensure that

    <span class="emphasis">*Feed Reading View*</span>

    is turned

    <span class="emphasis">*off*</span>

    . This can be done on the

    <span class="emphasis">*Content tab*</span>

    of

    <span class="emphasis">*Tools in Internet Options*</span>

    .

2.  If a Data Services entity instance URI page fails to load you can
    turn

    <span class="emphasis">*Verbose*</span>

    errors on by adding

    <span class="emphasis">*config.UseVerboseErrors = true;*</span>

    in the

    <span class="emphasis">*virtuoso.svc.cs InitializeService*</span>

    method to obtain more detailed information from the server as to why
    the page failed to load:

    ``` programlisting
    public static void InitializeService(IDataServiceConfiguration config)

    {

    config.UseVerboseErrors = true;

    config.SetEntitySetAccessRule("*", EntitySetRights.All);

    }
    ```

</div>

</div>

<div id="vdbenginedb2uedmvs" class="section">

<div class="titlepage">

<div>

<div>

#### Visual Studio Windows DataGrid Form Application

</div>

</div>

</div>

This section details the steps required to create a simple Visual Studio
2008 Windows Form application, with associated DataGridView control for
displaying data in selected tables from the target database.

<div class="orderedlist">

1.  Launch the Visual Studio 2008 SP1 IDE.

    <div class="figure-float">

    <div id="dbgrid1" class="figure">

    **Figure 8.306. Visual Studio 2008 SP1 IDE**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Visual Studio 2008 SP1 IDE](images/ui/dbgrid1.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Create a

    <span class="emphasis">*Web Application*</span>

    project by going to the

    <span class="emphasis">*File*</span>

    menu in Visual Studio and choosing

    <span class="emphasis">*New Project*</span>

    .

    <div class="figure-float">

    <div id="epro2_09" class="figure">

    **Figure 8.307. Web Application**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Web Application](images/ui/epro2.png)

    </div>

    </div>

    </div>

      

    </div>

3.  When the New Project window appears, choose either

    <span class="emphasis">*Visual Basic*</span>

    or

    <span class="emphasis">*Visual C#*</span>

    as your programming language.

4.  Within the language category, click on

    <span class="emphasis">*Windows*</span>

    and select

    <span class="emphasis">*Windows Form Application*</span>

    from the right-hand panel.

5.  Choose a name for the project, for example

    <span class="emphasis">*VirtWindowsFormApplication*</span>

    , and click

    <span class="emphasis">*OK*</span>

    .

    <div class="figure-float">

    <div id="dbgrid2" class="figure">

    **Figure 8.308. Web Application**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Web Application](images/ui/dbgrid2.png)

    </div>

    </div>

    </div>

      

    </div>

6.  In the

    <span class="emphasis">*Toolbox*</span>

    , expand

    <span class="emphasis">*Data Controls*</span>

    , and drag the

    <span class="emphasis">*DataGridView*</span>

    control onto the form.

    <div class="figure-float">

    <div id="dbgrid3" class="figure">

    **Figure 8.309. Toolbox**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Toolbox](images/ui/dbgrid3.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Click on the little

    <span class="emphasis">*arrow*</span>

    in the top right of the

    <span class="emphasis">*DataGridView*</span>

    control. This loads the

    <span class="emphasis">*DataGridView Task*</span>

    menu.

    <div class="figure-float">

    <div id="dbgrid4" class="figure">

    **Figure 8.310. DataGridView Task**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGridView Task](images/ui/dbgrid4.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Click on the

    <span class="emphasis">*Choose Data Source*</span>

    list box.

    <div class="figure-float">

    <div id="dbgrid5" class="figure">

    **Figure 8.311. Choose Data Source**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Choose Data Source](images/ui/dbgrid5.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Click on the

    <span class="emphasis">*Add Project Data Source*</span>

    link to connect to a data source.

    <div class="figure-float">

    <div id="dbgrid6" class="figure">

    **Figure 8.312. Add Project Data Source**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Add Project Data Source](images/ui/dbgrid6.png)

    </div>

    </div>

    </div>

      

    </div>

10. In the

    <span class="emphasis">*Data Source Configuration Wizard*</span>

    dialog

    <span class="emphasis">*Choose Data Source Type*</span>

    page select the

    <span class="emphasis">*Database*</span>

    data source type and click

    <span class="emphasis">*Next*</span>

    .

    <div class="figure-float">

    <div id="dbgrid7" class="figure">

    **Figure 8.313. Data Source Type**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Type](images/ui/dbgrid7.png)

    </div>

    </div>

    </div>

      

    </div>

11. In the

    <span class="emphasis">*Data Source Configuration Wizard*</span>

    dialog

    <span class="emphasis">*Choose your Data Connection*</span>

    page, select the

    <span class="emphasis">*New Connection*</span>

    button

    <div class="figure-float">

    <div id="dbgrid8" class="figure">

    **Figure 8.314. Data Source Configuration Wizard**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Configuration Wizard](images/ui/dora8.png)

    </div>

    </div>

    </div>

      

    </div>

12. In the

    <span class="emphasis">*Choose Data Source*</span>

    dialog, select the OpenLink

    <span class="emphasis">*Virtuoso Data Source*</span>

    from the list and click

    <span class="emphasis">*Continue*</span>

    .

    <div class="figure-float">

    <div id="dbgrid9" class="figure">

    **Figure 8.315. Data Source**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source](images/ui/dora9.png)

    </div>

    </div>

    </div>

      

    </div>

13. In the

    <span class="emphasis">*Add Connection*</span>

    dialog, specify the

    <span class="emphasis">*hostname, portno, username and
    password*</span>

    for the target Virtuoso Server and check the Save Password check
    box.

    <div class="figure-float">

    <div id="dbgrid10" class="figure">

    **Figure 8.316. Connection Properties**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Connection Properties](images/ui/dbgrid10.png)

    </div>

    </div>

    </div>

      

    </div>

14. Select the

    <span class="emphasis">*Select Database From List*</span>

    radio button and choose the

    <span class="emphasis">*SAMPLE*</span>

    database from the drop down list.

    <div class="figure-float">

    <div id="dbgrid11" class="figure">

    **Figure 8.317. Add connection**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Add connection](images/ui/dbgrid11.png)

    </div>

    </div>

    </div>

      

    </div>

15. Press the

    <span class="emphasis">*Test Connection*</span>

    dialog to verify that the database is accessible.

    <div class="figure-float">

    <div id="dbgrid12" class="figure">

    **Figure 8.318. Test Connection**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Test Connection](images/ui/dora12.png)

    </div>

    </div>

    </div>

      

    </div>

16. Leave the default connect string

    <span class="emphasis">*SAMPLEConnectionString*</span>

    and click

    <span class="emphasis">*Next*</span>

    <div class="figure-float">

    <div id="dbgrid13" class="figure">

    **Figure 8.319. SAMPLEConnectionString**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SAMPLEConnectionString](images/ui/dbgrid13.png)

    </div>

    </div>

    </div>

      

    </div>

17. From the list of available tables returned for the SAMPLE database
    select the

    <span class="emphasis">*DEPARTMENT* </span>

    table to be associated with the

    <span class="emphasis">*DataGridView*</span>

    control

    <div class="figure-float">

    <div id="dbgrid14" class="figure">

    **Figure 8.320. SAMPLE database**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SAMPLE database](images/ui/dbgrid14.png)

    </div>

    </div>

    </div>

      

    </div>

18. The columns names of the select table will be displayed in the
    DataGridView

    <div class="figure-float">

    <div id="dbgrid15" class="figure">

    **Figure 8.321. DataGridView**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGridView](images/ui/dbgrid15.png)

    </div>

    </div>

    </div>

      

    </div>

19. Resize the Form and DataGridView to allow all columns to be visible,
    if possible.

    <div class="figure-float">

    <div id="dbgrid16" class="figure">

    **Figure 8.322. Resize the Form and DataGridView**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Resize the Form and DataGridView](images/ui/dbgrid16.png)

    </div>

    </div>

    </div>

      

    </div>

20. To test the application, simply hit

    <span class="emphasis">*Ctrl+F5*</span>

    within Visual Studio or select

    <span class="emphasis">*Start Debugging*</span>

    from the

    <span class="emphasis">*Debug*</span>

    menu.

    <div class="figure-float">

    <div id="dbgrid17" class="figure">

    **Figure 8.323. Start Debugging**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Start Debugging](images/ui/mqdora17.png)

    </div>

    </div>

    </div>

      

    </div>

21. The data from the

    <span class="emphasis">*DEPARTMENT* </span>

    table will be displayed in the

    <span class="emphasis">*DataGrid*</span>

    .

    <div class="figure-float">

    <div id="dbgrid18" class="figure">

    **Figure 8.324. DataGrid**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGrid](images/ui/dbgrid18.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

The task is now complete.

</div>

</div>
