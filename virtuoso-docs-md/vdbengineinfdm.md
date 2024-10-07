<div id="vdbengineinfdm" class="section">

<div class="titlepage">

<div>

<div>

### 8.5.5. Using EDM to create Entity Framework based applications

</div>

</div>

</div>

Now that a Microsoft Entity Data Model has been created for the Informix
stores_demo database, Entity Framework applications can be created to
make use of it.

<div id="vdbengineinfdmf" class="section">

<div class="titlepage">

<div>

<div>

#### Entity Frameworks based finf

</div>

</div>

</div>

An ADO.Net Data Service for the Informix tables can be created using the
Entity Data Model created in the
<a href="vdbengineinfcre.html" class="link"
title="8.5.4. Creating EDM in Visual Studio 2008">Creating EDM in Visual
Studio 2008 section</a> .

<div class="orderedlist">

1.  Open the

    <span class="emphasis">*stores_demo*</span>

    project created in the <a href="vdbengineinfcre.html" class="link"
    title="8.5.4. Creating EDM in Visual Studio 2008">Creating EDM in Visual
    Studio 2008 section</a> .

2.  Select the Project -\> Add New Item menu option.

    <div class="figure-float">

    <div id="finf1" class="figure">

    **Figure 8.242. VirtuosoDataService**

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

    <span class="emphasis">*WebDataService.svc*</span>

    and click

    <span class="emphasis">*Add*</span>

    to create the ADO.Net Data Service.

    <div class="figure-float">

    <div id="finf2" class="figure">

    **Figure 8.243. Add New Item**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Add New Item](images/ui/finf2.png)

    </div>

    </div>

    </div>

      

    </div>

4.  In the newly created

    <span class="emphasis">*WebDataService1.svc.cs*</span>

    Data Service file, add the data source class name of

    <span class="emphasis">*stores_demoEntities*</span>

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
        public class Northwind : DataService<stores_demoDemoEntities>
        {
            public static void InitializeService(IDataServiceConfiguration  config)
            {
                config.SetEntitySetAccessRule("*", EntitySetRights.All);
            }
        }
    }
    ```

    <div class="figure-float">

    <div id="finf3" class="figure">

    **Figure 8.244. WebDataService1.svc.cs**

    <div class="figure-contents">

    <div class="mediaobject">

    ![WebDataService1.svc.cs](images/ui/finf3.png)

    </div>

    </div>

    </div>

      

    </div>

5.  To test the Data Service, simply hit

    <span class="emphasis">*Ctrl+F5*</span>

    within Visual Studio. This will start the development web server,
    run the Data Services server inside, and load a Web browser page
    displaying the list of available tables/entities for the stores_demo
    database catalog.

    <div class="figure-float">

    <div id="finf4" class="figure">

    **Figure 8.245. Data Service test**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Service test](images/ui/finf4.png)

    </div>

    </div>

    </div>

      

    </div>

6.  To access a specific entity instance like the

    <span class="emphasis">*CUSTOMERS*</span>

    table customer number

    <span class="emphasis">*101*</span>

    record, use this convention
    http://host/vdir/WebDataService1.svc/customer(101).

    <div class="figure-float">

    <div id="finf5" class="figure">

    **Figure 8.246. custmers**

    <div class="figure-contents">

    <div class="mediaobject">

    ![custmers](images/ui/finf5.png)

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

<div id="vdbengineinfdmvs" class="section">

<div class="titlepage">

<div>

<div>

#### Visual Studio Windows DataGrid Form Application

</div>

</div>

</div>

This sectiond details the steps required to create a simple Visual
Studio 2008 Windows Form application, with associated DataGridView
control for displaying data in selected tables from the target database.

<div class="orderedlist">

1.  Launch the Visual Studio 2008 SP1 IDE.

    <div class="figure-float">

    <div id="dora1_02" class="figure">

    **Figure 8.247. Visual Studio 2008 SP1 IDE**

    <div class="figure-contents">

    <div class="mediaobject">

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

    <div class="figure-float">

    <div id="epro2_07" class="figure">

    **Figure 8.248. Web Application**

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

    <div id="dora2_02" class="figure">

    **Figure 8.249. Web Application**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Web Application](images/ui/dora2.png)

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

    <div id="dora3_02" class="figure">

    **Figure 8.250. Toolbox**

    <div class="figure-contents">

    <div class="mediaobject">

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

    <div class="figure-float">

    <div id="dora4_02" class="figure">

    **Figure 8.251. DataGridView Task**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGridView Task](images/ui/dora4.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Click on the

    <span class="emphasis">*Choose Data Source*</span>

    list box.

    <div class="figure-float">

    <div id="dora5_02" class="figure">

    **Figure 8.252. Choose Data Source**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Choose Data Source](images/ui/dora5.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Click on the

    <span class="emphasis">*Add Project Data Source*</span>

    link to connect to a data source.

    <div class="figure-float">

    <div id="dora6_02" class="figure">

    **Figure 8.253. Add Project Data Source**

    <div class="figure-contents">

    <div class="mediaobject">

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

    <div class="figure-float">

    <div id="dora7_02" class="figure">

    **Figure 8.254. Data Source Type**

    <div class="figure-contents">

    <div class="mediaobject">

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

    <div class="figure-float">

    <div id="dora8_02" class="figure">

    **Figure 8.255. Data Source Configuration Wizard**

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

    <div id="dora9_02" class="figure">

    **Figure 8.256. Data Source**

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

    for the target Virtuoso Server and check the

    <span class="emphasis">*Save Password*</span>

    check box.

    <div class="figure-float">

    <div id="dora10_05" class="figure">

    **Figure 8.257. Connection Properties**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Connection Properties](images/ui/dora10.png)

    </div>

    </div>

    </div>

      

    </div>

14. Select the Select Database From List radio button and choose the

    <span class="emphasis">*stores_demo*</span>

    from the drop down list.

    <div class="figure-float">

    <div id="dora11in" class="figure">

    **Figure 8.258. Add connection**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Add connection](images/ui/dora11in.png)

    </div>

    </div>

    </div>

      

    </div>

15. Press the

    <span class="emphasis">*Test Connection*</span>

    dialog to verify that the database is accessible.

    <div class="figure-float">

    <div id="dora12_02" class="figure">

    **Figure 8.259. Test Connection**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Test Connection](images/ui/dora12.png)

    </div>

    </div>

    </div>

      

    </div>

16. Leave the default connect string

    <span class="emphasis">*stores_demoConnectionString*</span>

    and click

    <span class="emphasis">*Next*</span>

    <div class="figure-float">

    <div id="dora13in" class="figure">

    **Figure 8.260. stores_demoConnectionString**

    <div class="figure-contents">

    <div class="mediaobject">

    ![stores_demoConnectionString](images/ui/dora13in.png)

    </div>

    </div>

    </div>

      

    </div>

17. From the list of available tables returned for the stores_demo
    database, select the

    <span class="emphasis">*msgs*</span>

    table to be associated with the

    <span class="emphasis">*DataGridView*</span>

    control.

    <div class="figure-float">

    <div id="dora14in" class="figure">

    **Figure 8.261. stores_demo database**

    <div class="figure-contents">

    <div class="mediaobject">

    ![stores_demo database](images/ui/dora14in.png)

    </div>

    </div>

    </div>

      

    </div>

18. The columns names of the select table will be displayed in the
    DataGridView.

    <div class="figure-float">

    <div id="dora15in" class="figure">

    **Figure 8.262. DataGridView**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGridView](images/ui/dora15in.png)

    </div>

    </div>

    </div>

      

    </div>

19. Resize the Form and DataGridView to allow all columns to be visible,
    if possible.

    <div class="figure-float">

    <div id="dora16in" class="figure">

    **Figure 8.263. Resize the Form and DataGridView**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Resize the Form and DataGridView](images/ui/dora16in.png)

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

    <div id="dora17_02" class="figure">

    **Figure 8.264. Start Debugging**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Start Debugging](images/ui/dora17.png)

    </div>

    </div>

    </div>

      

    </div>

21. To make the DataGridView updateable, you will need to manually add
    some code to the project along with a suitable control to invoke the
    code. Drag a Button control onto the form.

    <div class="figure-float">

    <div id="dora19in" class="figure">

    **Figure 8.265. DataGrid**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGrid](images/ui/dora19in.png)

    </div>

    </div>

    </div>

      

    </div>

22. Right click on the Button and select Properties.

    <div class="figure-float">

    <div id="dora20in" class="figure">

    **Figure 8.266. DataGrid**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGrid](images/ui/dora20in.png)

    </div>

    </div>

    </div>

      

    </div>

23. In the Properties view, edit the buttons Text property to read Save
    Changes and its (Name) property to read saveChanges.

    <div class="figure-float">

    <div id="dora21in" class="figure">

    **Figure 8.267. DataGrid**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGrid](images/ui/dora21in.png)

    </div>

    </div>

    </div>

      

    </div>

24. The button will now update to reflect these changes.

    NOTE: You will need to resize the button to make the new text
    visible.

    <div class="figure-float">

    <div id="dora22in" class="figure">

    **Figure 8.268. DataGrid**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGrid](images/ui/dora22in.png)

    </div>

    </div>

    </div>

      

    </div>

25. Double click the new button to generate the required event handler.
    It should take you directly to the area of code that will execute
    when the button is clicked.

    <div class="figure-float">

    <div id="dora23in" class="figure">

    **Figure 8.269. DataGrid**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGrid](images/ui/dora23in.png)

    </div>

    </div>

    </div>

      

    </div>

26. Edit the saveChanges_Click event handler code to include the
    following line.

    ``` programlisting
    private void saveChanges_Click(object sender, EventArgs e)
    {
      this.msgsTableAdapter.Update(this.stores_demoDataSet.msgs);
    }
    ```

    <div class="figure-float">

    <div id="dora24in" class="figure">

    **Figure 8.270. DataGrid**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGrid](images/ui/dora24in.png)

    </div>

    </div>

    </div>

      

    </div>

27. Now test the application again by hitting Ctrl+F5.

    Scroll to the empty row, at the bottom, and enter data for a new
    row. Then, select Save Changes which will write the new row back to
    the database.

    Updates and deletes can be performed similarly.

    <div class="figure-float">

    <div id="dora25in" class="figure">

    **Figure 8.271. DataGrid**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGrid](images/ui/dora25in.png)

    </div>

    </div>

    </div>

      

    </div>

28. You can use Interactive ISQL to test that the changes that have been
    written. Interactive ISQL Interface is detailed in the
    <a href="vdbengineinflink.html" class="link"
    title="8.5.3. Linking Informix tables into OpenLink Virtuoso">Linking
    Informix tables</a> section.

    <div class="figure-float">

    <div id="dora26in" class="figure">

    **Figure 8.272. DataGrid**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGrid](images/ui/dora26in.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

The task is now complete.

</div>

</div>
