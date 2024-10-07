<div id="vdbenginepredcr" class="section">

<div class="titlepage">

<div>

<div>

### 8.3.6. Using EDM to create Entity Framework based applications

</div>

</div>

</div>

Now that a Microsoft Entity Data Model has been created for the Progress
isports database, Entity Framework applications can be created to make
use of it.

<div id="vdbenginepredcrfr" class="section">

<div class="titlepage">

<div>

<div>

#### Entity Framework Data Service

</div>

</div>

</div>

An ADO.Net Data Service for the Progress tables can be created using the
Entity Data Model created in the
<a href="vdbengineprcrem.html" class="link"
title="8.3.4. Creating EDM in Visual Studio 2008">Creating EDM in Visual
Studio 2008 section</a> .

<div class="orderedlist">

1.  Open the

    <span class="emphasis">*VirtuosoDataService*</span>

    project created in the <a href="vdbengineprcrem.html" class="link"
    title="8.3.4. Creating EDM in Visual Studio 2008">Creating EDM in Visual
    Studio 2008 section</a> .

2.  Select the Project -\> Add New Item menu option.

    <div class="figure-float">

    <div id="fpro1" class="figure">

    **Figure 8.114. VirtuosoDataService**

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

    , and click

    <span class="emphasis">*Add*</span>

    to create the ADO.Net Data Service.

    <div class="figure-float">

    <div id="fpro2" class="figure">

    **Figure 8.115. Add New Item**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Add New Item](images/ui/fpro2.png)

    </div>

    </div>

    </div>

      

    </div>

4.  In the

    <span class="emphasis">*WebDataService1.svc.cs*</span>

    Data Service file created add the data source class name of

    <span class="emphasis">*isportsEntities* </span>

    (note this is the name set in the Creating EDM in Visual Studio 2008
    section) as the

    <span class="emphasis">*DataService*</span>

    name and enable the access to the Data Service by adding the entry

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

    <div id="fpro3" class="figure">

    **Figure 8.116. WebDataService1.svc.cs**

    <div class="figure-contents">

    <div class="mediaobject">

    ![WebDataService1.svc.cs](images/ui/fpro3.png)

    </div>

    </div>

    </div>

      

    </div>

5.  To test the Data Service, simply hit

    <span class="emphasis">*Ctrl+F5*</span>

    within Visual Studio. This will start the development web server,
    run the Data Services server inside and load a Web browser page
    displaying the list of available tables/entities for the isports
    database catalog.

    <div class="figure-float">

    <div id="fpro4" class="figure">

    **Figure 8.117. Data Service test**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Service test](images/ui/fpro4.png)

    </div>

    </div>

    </div>

      

    </div>

6.  To access a specific entity instance like the

    <span class="emphasis">*EMPLOYEES*</span>

    table employee number

    <span class="emphasis">*100*</span>

    record, use this convention
    http://host/vdir/Virtuoso.svc/EMPLOYEES(100) .

    <div class="figure-float">

    <div id="fpro5" class="figure">

    **Figure 8.118. EMPLOYEES**

    <div class="figure-contents">

    <div class="mediaobject">

    ![EMPLOYEES](images/ui/fpro5.png)

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

<div id="vdbenginepredcrvs" class="section">

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

    <div id="dora1_01" class="figure">

    **Figure 8.119. Visual Studio 2008 SP1 IDE**

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

    <div id="epro2_03" class="figure">

    **Figure 8.120. Web Application**

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

    <div id="dora2_01" class="figure">

    **Figure 8.121. Web Application**

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

    <div id="dora3_01" class="figure">

    **Figure 8.122. Toolbox**

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

    <div id="dora4_01" class="figure">

    **Figure 8.123. DataGridView Task**

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

    <div id="dora5_01" class="figure">

    **Figure 8.124. Choose Data Source**

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

    <div id="dora6_01" class="figure">

    **Figure 8.125. Add Project Data Source**

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

    <div id="dora7_01" class="figure">

    **Figure 8.126. Data Source Type**

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

    <div id="dora8_01" class="figure">

    **Figure 8.127. Data Source Configuration Wizard**

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

    <div id="dora9_01" class="figure">

    **Figure 8.128. Data Source**

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

    <div id="dora10_03" class="figure">

    **Figure 8.129. Connection Properties**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Connection Properties](images/ui/dora10.png)

    </div>

    </div>

    </div>

      

    </div>

14. Select the

    <span class="emphasis">*Select Database From List*</span>

    radio button and choose

    <span class="emphasis">*isports*</span>

    from the drop down list.

    <div class="figure-float">

    <div id="dora11p" class="figure">

    **Figure 8.130. Add conneciton**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Add conneciton](images/ui/dora11p.png)

    </div>

    </div>

    </div>

      

    </div>

15. Press the

    <span class="emphasis">*Test Connection*</span>

    dialog to verify that the database is accessible.

    <div class="figure-float">

    <div id="dora12_01" class="figure">

    **Figure 8.131. Test Connection**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Test Connection](images/ui/dora12.png)

    </div>

    </div>

    </div>

      

    </div>

16. Leave the default connect string

    <span class="emphasis">*isportsConnectionString*</span>

    and click

    <span class="emphasis">*Next*</span>

    <div class="figure-float">

    <div id="dora13p" class="figure">

    **Figure 8.132. isportsConnectionString**

    <div class="figure-contents">

    <div class="mediaobject">

    ![isportsConnectionString](images/ui/dora13p.png)

    </div>

    </div>

    </div>

      

    </div>

17. From the list of available tables returned for the isports database,
    select the

    <span class="emphasis">*JOBS*</span>

    table to be associated with the

    <span class="emphasis">*DataGridView*</span>

    control.

    <div class="figure-float">

    <div id="dora14p" class="figure">

    **Figure 8.133. isports database**

    <div class="figure-contents">

    <div class="mediaobject">

    ![isports database](images/ui/dora14p.png)

    </div>

    </div>

    </div>

      

    </div>

18. The columns names of the select table will be displayed in the
    DataGridView.

    <div class="figure-float">

    <div id="dora15p" class="figure">

    **Figure 8.134. DataGridView**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGridView](images/ui/dora15p.png)

    </div>

    </div>

    </div>

      

    </div>

19. Resize the Form and DataGridView to allow all columns to be visible,
    if possible.

    <div class="figure-float">

    <div id="dora16p" class="figure">

    **Figure 8.135. Resize the Form and DataGridView**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Resize the Form and DataGridView](images/ui/dora16p.png)

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

    <div id="dora17_01" class="figure">

    **Figure 8.136. Start Debugging**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Start Debugging](images/ui/dora17.png)

    </div>

    </div>

    </div>

      

    </div>

21. The data from the

    <span class="emphasis">*JOBS*</span>

    table will be displayed in the

    <span class="emphasis">*DataGrid*</span>

    .

    <div class="figure-float">

    <div id="dora18p" class="figure">

    **Figure 8.137. DataGrid**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGrid](images/ui/dora18p.png)

    </div>

    </div>

    </div>

      

    </div>

22. To make the DataGridView updateable, you will need to manually add
    some code to the project along with a suitable control to invoke the
    code. Drag a Button control onto the form.

    <div class="figure-float">

    <div id="dora19p" class="figure">

    **Figure 8.138. DataGrid**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGrid](images/ui/dora19p.png)

    </div>

    </div>

    </div>

      

    </div>

23. Right click on the Button and select Properties.

    <div class="figure-float">

    <div id="dora20p" class="figure">

    **Figure 8.139. DataGrid**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGrid](images/ui/dora20p.png)

    </div>

    </div>

    </div>

      

    </div>

24. In the Properties view, edit the buttons Text property to read Save
    Changes and its (Name) property to read saveChanges.

    <div class="figure-float">

    <div id="dora21p" class="figure">

    **Figure 8.140. DataGrid**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGrid](images/ui/dora21p.png)

    </div>

    </div>

    </div>

      

    </div>

25. The button will now update to reflect these changes.

    NOTE: You will need to resize the button to make the new text
    visible.

    <div class="figure-float">

    <div id="dora22p" class="figure">

    **Figure 8.141. DataGrid**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGrid](images/ui/dora22p.png)

    </div>

    </div>

    </div>

      

    </div>

26. Double click the new button to generate the required event handler.
    It should take you directly to the area of code that will execute
    when the button is clicked.

    <div class="figure-float">

    <div id="dora23p" class="figure">

    **Figure 8.142. DataGrid**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGrid](images/ui/dora23p.png)

    </div>

    </div>

    </div>

      

    </div>

27. Edit the saveChanges_Click event handler code to include the
    following line.

    ``` programlisting
    private void saveChanges_Click(object sender, EventArgs e)
    {
      this.msgsTableAdapter.Update(this.isportsDataSet.msgs);
    }
    ```

    <div class="figure-float">

    <div id="dora24p" class="figure">

    **Figure 8.143. DataGrid**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGrid](images/ui/dora24p.png)

    </div>

    </div>

    </div>

      

    </div>

28. Now test the application again by hitting Ctrl+F5.

    Scroll to the empty row, at the bottom, and enter data for a new row
    then select Save Changes which will write the new row back to the
    database.

    Updates and deletes can be performed similarly.

    <div class="figure-float">

    <div id="dora25p" class="figure">

    **Figure 8.144. DataGrid**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGrid](images/ui/dora25p.png)

    </div>

    </div>

    </div>

      

    </div>

29. You can use Interactive ISQL to test that the changes that have been
    written. Interactive ISQL Interface is detailed in the
    <a href="vdbengineprlnk.html" class="link"
    title="8.3.3. Linking Progress tables into Virtuoso">Linking Progress
    tables</a> section.

    <div class="figure-float">

    <div id="dora26p" class="figure">

    **Figure 8.145. DataGrid**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGrid](images/ui/dora26p.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

The task is now complete.

</div>

</div>
