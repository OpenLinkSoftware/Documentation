<div>

<div>

<div>

<div>

### 8.12.5. Using EDM to create Entity Framework based applications

</div>

</div>

</div>

Now that a Microsoft Entity Data Model has been created for the Firebird
employee database, Entity Framework applications can be created to make
use of it.

<div>

<div>

<div>

<div>

#### Entity Frameworks based ADO.NET Data Service

</div>

</div>

</div>

An ADO.Net Data Service for the Firebird tables can be created using the
Entity Data Model created in the
<a href="vdbenginefirebdcrvs.html" class="link"
title="8.12.4. Creating EDM in Visual Studio 2008">Creating EDM in
Visual Studio 2008 section</a> .

<div>

1.  Open the

    <span class="emphasis">*employee*</span>

    project created in the
    <a href="vdbenginefirebdcrvs.html" class="link"
    title="8.12.4. Creating EDM in Visual Studio 2008">Creating EDM in
    Visual Studio 2008 section</a> .

2.  Right click on the employee project name in the Solution Explorer
    pane, then select the Project -\> Add New Item menu option.

    <div>

    <div>

    **Figure 8.620. employee**

    <div>

    <div>

    ![employee](images/ui/fbfora1.png)

    </div>

    </div>

    </div>

      

    </div>

3.  The

    <span class="emphasis">*Add New Item*</span>

    dialog will appear. Choose the

    <span class="emphasis">*ADO.NET Data Service template*</span>

    . Give it the name

    <span class="emphasis">*WebDataService1.svc*</span>

    , and click

    <span class="emphasis">*Add*</span>

    to create the ADO.Net Data Service.

    <div>

    <div>

    **Figure 8.621. Add New Item**

    <div>

    <div>

    ![Add New Item](images/ui/fbfora2.png)

    </div>

    </div>

    </div>

      

    </div>

4.  In the newly created

    <span class="emphasis">*WebDataService1.svc.cs*</span>

    Data Service file, add the data source class name of

    <span class="emphasis">*employeeEntities*</span>

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
        public class Northwind : DataService<employeeEntities>
        {
            public static void InitializeService(IDataServiceConfiguration  config)
            {
                config.SetEntitySetAccessRule("*", EntitySetRights.All);
            }
        }
    }
    ```

    <div>

    <div>

    **Figure 8.622. WebDataService1.svc.cs**

    <div>

    <div>

    ![WebDataService1.svc.cs](images/ui/fbfora3.png)

    </div>

    </div>

    </div>

      

    </div>

5.  To test the Data Service, simply hit

    <span class="emphasis">*Ctrl+F5*</span>

    within Visual Studio. This will start the development web server,
    run the Data Services server inside and load a Web browser page
    displaying the list of available tables/entities for the employee
    database catalog.

    <div>

    <div>

    **Figure 8.623. Data Service test**

    <div>

    <div>

    ![Data Service test](images/ui/fbfora4.png)

    </div>

    </div>

    </div>

      

    </div>

6.  To access a specific entity instance like the

    <span class="emphasis">*EMPLOYEE*</span>

    table employee number

    <span class="emphasis">*2*</span>

    record, use this convention
    http://host/vdir/WebDataService1.svc/EMPLOYEE(2) .

    <div>

    <div>

    **Figure 8.624. EMPLOYEES**

    <div>

    <div>

    ![EMPLOYEES](images/ui/fbfora5.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

<span class="emphasis">*Notes:*</span>

<div>

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

<div>

<div>

<div>

<div>

#### Visual Studio Windows DataGrid Form Application

</div>

</div>

</div>

This section details the steps required to create a simple Visual Studio
2008 Windows Form application, with associated DataGridView control for
displaying data in selected tables from the target database.

<div>

1.  Launch the Visual Studio 2008 SP1 IDE.

    <div>

    <div>

    **Figure 8.625. Visual Studio 2008 SP1 IDE**

    <div>

    <div>

    ![Visual Studio 2008 SP1 IDE](images/ui/dora1.png)

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

    <div>

    <div>

    **Figure 8.626. Web Application**

    <div>

    <div>

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

    <span class="emphasis">*VirtuosoDataGridApp*</span>

    , and click

    <span class="emphasis">*OK*</span>

    .

    <div>

    <div>

    **Figure 8.627. Web Application**

    <div>

    <div>

    ![Web Application](images/ui/fbdora2.png)

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

    <div>

    <div>

    **Figure 8.628. Toolbox**

    <div>

    <div>

    ![Toolbox](images/ui/dora3.png)

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

    <div>

    <div>

    **Figure 8.629. DataGridView Task**

    <div>

    <div>

    ![DataGridView Task](images/ui/dora4.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Click on the

    <span class="emphasis">*Choose Data Source*</span>

    list box.

    <div>

    <div>

    **Figure 8.630. Choose Data Source**

    <div>

    <div>

    ![Choose Data Source](images/ui/dora5.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Click on the

    <span class="emphasis">*Add Project Data Source*</span>

    link to connect to a data source.

    <div>

    <div>

    **Figure 8.631. Add Project Data Source**

    <div>

    <div>

    ![Add Project Data Source](images/ui/dora6.png)

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

    <div>

    <div>

    **Figure 8.632. Data Source Type**

    <div>

    <div>

    ![Data Source Type](images/ui/dora7.png)

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

    <div>

    <div>

    **Figure 8.633. Data Source Configuration Wizard**

    <div>

    <div>

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

    <div>

    <div>

    **Figure 8.634. Data Source**

    <div>

    <div>

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

    <div>

    <div>

    **Figure 8.635. Connection Properties**

    <div>

    <div>

    ![Connection Properties](images/ui/dora10.png)

    </div>

    </div>

    </div>

      

    </div>

14. Select the

    <span class="emphasis">*Select Database From List*</span>

    radio button and choose the

    <span class="emphasis">*employee*</span>

    database from the drop down list.

    <div>

    <div>

    **Figure 8.636. Add connection**

    <div>

    <div>

    ![Add connection](images/ui/fbdora11.png)

    </div>

    </div>

    </div>

      

    </div>

15. Click OK to add the connection.

16. Press the

    <span class="emphasis">*Test Connection*</span>

    dialog to verify that the database is accessible.

    <div>

    <div>

    **Figure 8.637. Test Connection**

    <div>

    <div>

    ![Test Connection](images/ui/dora12.png)

    </div>

    </div>

    </div>

      

    </div>

17. Leave the default connect string

    <span class="emphasis">*employeeConnectionString*</span>

    and click

    <span class="emphasis">*Next*</span>

    <div>

    <div>

    **Figure 8.638. employeeConnectionString**

    <div>

    <div>

    ![employeeConnectionString](images/ui/dora13.png)

    </div>

    </div>

    </div>

      

    </div>

18. From the list of available tables returned for the employee
    database, select the

    <span class="emphasis">*COUNTRY*</span>

    table to be associated with the

    <span class="emphasis">*DataGridView*</span>

    control.

    <div>

    <div>

    **Figure 8.639. employee database**

    <div>

    <div>

    ![employee database](images/ui/fbdora14.png)

    </div>

    </div>

    </div>

      

    </div>

19. A DataSet for the employee database object is created

    <div>

    <div>

    **Figure 8.640. DataSet**

    <div>

    <div>

    ![DataSet](images/ui/fbdora15.png)

    </div>

    </div>

    </div>

      

    </div>

20. From the drop down list box next to the COUNTRY table ensure the
    DataGridView item is selected

    <div>

    <div>

    **Figure 8.641. DataGridView**

    <div>

    <div>

    ![DataGridView](images/ui/fbdora16.png)

    </div>

    </div>

    </div>

      

    </div>

21. Drag the COUNTRY DataSet item onto the Form to create a scrollable
    and editable association of the COUNTRY table object with the Data
    Grid View automatically.

    <div>

    <div>

    **Figure 8.642. association**

    <div>

    <div>

    ![association](images/ui/fbdora17.png)

    </div>

    </div>

    </div>

      

    </div>

22. To test the application, simply hit

    <span class="emphasis">*Ctrl+F5*</span>

    within Visual Studio or select

    <span class="emphasis">*Start Debugging*</span>

    from the

    <span class="emphasis">*Debug*</span>

    menu.

    <div>

    <div>

    **Figure 8.643. Start Debugging**

    <div>

    <div>

    ![Start Debugging](images/ui/dora17.png)

    </div>

    </div>

    </div>

      

    </div>

23. The data from the

    <span class="emphasis">*COUNTRY*</span>

    table will be displayed in the

    <span class="emphasis">*DataGrid*</span>

    .

    <div>

    <div>

    **Figure 8.644. DataGrid**

    <div>

    <div>

    ![DataGrid](images/ui/fbdora18.png)

    </div>

    </div>

    </div>

      

    </div>

24. A new row can be inserted (updated or deleted) as indicated for the
    new "1111" record inserted below and the Save button clicked to save
    the change to the database.

    <div>

    <div>

    **Figure 8.645. new row**

    <div>

    <div>

    ![new row](images/ui/fbdora19.png)

    </div>

    </div>

    </div>

      

    </div>

25. The Virtuoso Interactive SQL tab of the Conductor can be used to run
    the query select \* from "employee"."fire"."COUNTRY"

    <div>

    <div>

    **Figure 8.646. Interactive SQL**

    <div>

    <div>

    ![Interactive SQL](images/ui/fbdora20.png)

    </div>

    </div>

    </div>

      

    </div>

26. To verify the change has been successfully made in the database.

    <div>

    <div>

    **Figure 8.647. verify**

    <div>

    <div>

    ![verify](images/ui/fbdora21.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

The task is now complete.

</div>

</div>
