<div id="vdbenginemsqluedm" class="section">

<div class="titlepage">

<div>

<div>

### 8.8.5. Using EDM to create Entity Framework based applications

</div>

</div>

</div>

Now that a Microsoft Entity Data Model has been created for the
Northwind database, Entity Framework applications can be created to make
use of it.

<div id="vdbenginemsqluedmentf" class="section">

<div class="titlepage">

<div>

<div>

#### Entity Frameworks based ADO.NET Data Service

</div>

</div>

</div>

An ADO.Net Data Service for the MySQL tables can be created using the
Entity Data Model created in the
<a href="vdbenginemsqlcrvs.html" class="link"
title="8.8.4. Creating EDM in Visual Studio 2008">Creating EDM in Visual
Studio 2008 section</a> .

<div class="orderedlist">

1.  Open the

    <span class="emphasis">*VirtuosoDataService*</span>

    project created in the <a href="vdbenginemsqlcrvs.html" class="link"
    title="8.8.4. Creating EDM in Visual Studio 2008">Creating EDM in Visual
    Studio 2008 section</a> .

2.  Select the Project -\> Add New Item menu option.

    <div class="figure-float">

    <div id="fmsora1" class="figure">

    **Figure 8.420. VirtuosoDataService**

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

    , and click

    <span class="emphasis">*Add*</span>

    to create the ADO.Net Data Service.

    <div class="figure-float">

    <div id="fmsora2" class="figure">

    **Figure 8.421. Add New Item**

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

    in the

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
        public class Northwind: DataService<VirtuosoDemoEntities>
        {
            public static void InitializeService(IDataServiceConfiguration  config)
            {
                config.SetEntitySetAccessRule("*", EntitySetRights.All);
            }
        }
    }
    ```

    <div class="figure-float">

    <div id="fmsora3" class="figure">

    **Figure 8.422. Virtuoso.svc.cs**

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
    run the Data Services server inside and load a Web browser page
    displaying the list of available tables/entities for the mysql
    Northwind database catalog.

    <div class="figure-float">

    <div id="fmsora4" class="figure">

    **Figure 8.423. Data Service test**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Service test](images/ui/fmsora4.png)

    </div>

    </div>

    </div>

      

    </div>

6.  To access a specific entity instance like the Customers table ALFKI
    record, use this convention:
    http://host/vdir/Virtuoso.svc/Customers('ALFKI') .

    <div class="figure-float">

    <div id="fmsora5" class="figure">

    **Figure 8.424. Customers**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Customers](images/ui/fmsora5.png)

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

<div id="vdbenginemsqluedmvs" class="section">

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

    <div id="mqdora1" class="figure">

    **Figure 8.425. Visual Studio 2008 SP1 IDE**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Visual Studio 2008 SP1 IDE](images/ui/dora1.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Create a <span class="emphasis">*Web Application*</span> project by
    going to the <span class="emphasis">*File*</span> menu in Visual
    Studio and choosing <span class="emphasis">*New Project*</span> .

    <div class="figure-float">

    <div id="epro2_13" class="figure">

    **Figure 8.426. Web Application**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Web Application](images/ui/epro2.png)

    </div>

    </div>

    </div>

      

    </div>

3.  When the New Project window appears, choose either

    <span class="emphasis">*Visual Basic* </span> or
    <span class="emphasis">*Visual C#*</span> as your programming
    language.

4.  Within the language category, click on
    <span class="emphasis">*Windows*</span> and select
    <span class="emphasis">*Windows Form Application*</span> from the
    right-hand panel.

5.  Choose a name for the project, for example
    <span class="emphasis">*VirtWindowsFormApplication*</span> , and
    click <span class="emphasis">*OK*</span> .

    <div class="figure-float">

    <div id="mqdora2" class="figure">

    **Figure 8.427. Web Application**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Web Application](images/ui/dora2.png)

    </div>

    </div>

    </div>

      

    </div>

6.  In the <span class="emphasis">*Toolbox*</span> , expand
    <span class="emphasis">*Data Controls*</span> , and drag the
    <span class="emphasis">*DataGridView*</span> control onto the form.

    <div class="figure-float">

    <div id="mqdora3" class="figure">

    **Figure 8.428. Toolbox**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Toolbox](images/ui/dora3.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Click on the little <span class="emphasis">*arrow*</span> in the top
    right of the <span class="emphasis">*DataGridView*</span> control.
    This loads the <span class="emphasis">*DataGridView Task*</span>
    menu.

    <div class="figure-float">

    <div id="mqdora4" class="figure">

    **Figure 8.429. DataGridView Task**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGridView Task](images/ui/dora4.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Click on the <span class="emphasis">*Choose Data Source*</span> list
    box.

    <div class="figure-float">

    <div id="mqdora5" class="figure">

    **Figure 8.430. Choose Data Source**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Choose Data Source](images/ui/dora5.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Click on the <span class="emphasis">*Add Project Data Source*</span>
    link to connect to a data source.

    <div class="figure-float">

    <div id="mqdora6" class="figure">

    **Figure 8.431. Add Project Data Source**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Add Project Data Source](images/ui/dora6.png)

    </div>

    </div>

    </div>

      

    </div>

10. In the <span class="emphasis">*Data Source Configuration
    Wizard*</span> dialog <span class="emphasis">*Choose Data Source
    Type*</span> page select the
    <span class="emphasis">*Database*</span> data source type and click
    <span class="emphasis">*Next*</span> .

    <div class="figure-float">

    <div id="mqdora7" class="figure">

    **Figure 8.432. Data Source Type**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Type](images/ui/dora7.png)

    </div>

    </div>

    </div>

      

    </div>

11. In the <span class="emphasis">*Data Source Configuration
    Wizard*</span> dialog <span class="emphasis">*Choose your Data
    Connection*</span> page, select the <span class="emphasis">*New
    Connection*</span> button

    <div class="figure-float">

    <div id="mqdora8" class="figure">

    **Figure 8.433. Data Source Configuration Wizard**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Configuration Wizard](images/ui/dora8.png)

    </div>

    </div>

    </div>

      

    </div>

12. In the <span class="emphasis">*Choose Data Source*</span> dialog,
    select the OpenLink <span class="emphasis">*Virtuoso Data
    Source*</span> from the list and click
    <span class="emphasis">*Continue*</span> .

    <div class="figure-float">

    <div id="mqdora9" class="figure">

    **Figure 8.434. Data Source**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source](images/ui/dora9.png)

    </div>

    </div>

    </div>

      

    </div>

13. In the <span class="emphasis">*Add Connection*</span> dialog,
    specify the <span class="emphasis">*hostname, portno, username and
    password*</span> for the target Virtuoso Server and check the Save
    Password check box.

    <div class="figure-float">

    <div id="mqdora10" class="figure">

    **Figure 8.435. Connection Properties**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Connection Properties](images/ui/dora10.png)

    </div>

    </div>

    </div>

      

    </div>

14. Select the <span class="emphasis">*Select Database From List*</span>
    radio button and choose the <span class="emphasis">*mysql*</span>
    database from the drop down list.

    <div class="figure-float">

    <div id="mqdora11" class="figure">

    **Figure 8.436. Add connection**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Add connection](images/ui/mqdora11.png)

    </div>

    </div>

    </div>

      

    </div>

15. Press the <span class="emphasis">*Test Connection*</span> dialog to
    verify that the database is accessible.

    <div class="figure-float">

    <div id="mqdora12" class="figure">

    **Figure 8.437. Test Connection**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Test Connection](images/ui/dora12.png)

    </div>

    </div>

    </div>

      

    </div>

16. Click OK to add the connection.

    <div class="figure-float">

    <div id="mqdora12_01" class="figure">

    **Figure 8.438. Test Connection**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Test Connection](images/ui/mqdora12.png)

    </div>

    </div>

    </div>

      

    </div>

17. Leave the default connect string
    name<span class="emphasis">*mysqlConnectionString*</span> and click
    <span class="emphasis">*Next*</span> .

    <div class="figure-float">

    <div id="mqdora13" class="figure">

    **Figure 8.439. mysqlConnectionString**

    <div class="figure-contents">

    <div class="mediaobject">

    ![mysqlConnectionString](images/ui/mqdora13.png)

    </div>

    </div>

    </div>

      

    </div>

18. From the list of available tables returned for the mysql database,
    select the <span class="emphasis">*Shippers*</span> table to be
    associated with the <span class="emphasis">*DataGridView*</span>
    control.

    <div class="figure-float">

    <div id="mqdora14" class="figure">

    **Figure 8.440. mysql database**

    <div class="figure-contents">

    <div class="mediaobject">

    ![mysql database](images/ui/mqdora14.png)

    </div>

    </div>

    </div>

      

    </div>

19. The columns names of the select table will be displayed in the
    DataGridView.

    <div class="figure-float">

    <div id="mqdora15" class="figure">

    **Figure 8.441. DataGridView**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGridView](images/ui/mqdora15.png)

    </div>

    </div>

    </div>

      

    </div>

20. Resize the Form and DataGridView to allow all columns to be visible,
    if possible.

    <div class="figure-float">

    <div id="mqdora16" class="figure">

    **Figure 8.442. Resize the Form and DataGridView**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Resize the Form and DataGridView](images/ui/mqdora16.png)

    </div>

    </div>

    </div>

      

    </div>

21. To test the application, simply hit
    <span class="emphasis">*Ctrl+F5*</span> within Visual Studio or
    select <span class="emphasis">*Start Debugging*</span> from the
    <span class="emphasis">*Debug*</span> menu.

    <div class="figure-float">

    <div id="mqdora17" class="figure">

    **Figure 8.443. Start Debugging**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Start Debugging](images/ui/dora17.png)

    </div>

    </div>

    </div>

      

    </div>

22. The data from the <span class="emphasis">*Shippers*</span> table
    will be displayed in the <span class="emphasis">*DataGrid*</span> .

    <div class="figure-float">

    <div id="mqdora18" class="figure">

    **Figure 8.444. DataGrid**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGrid](images/ui/mqdora18.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

The task is now complete.

</div>

</div>
