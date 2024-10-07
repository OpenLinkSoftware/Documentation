<div id="installusadocreateservice" class="section">

<div class="titlepage">

<div>

<div>

### 2.8.3. Creating a Data Service using the ADO.NET Entity Framework

</div>

</div>

</div>

ADO.NET Data Services are a specialized form of Windows Communication
Foundation services, and thus can be hosted in various environments. The
below example will create an ADO.NET Data Service which is hosted inside
an ASP.NET site. In order to create a data service, you must first
create a web project; you will then need to establish a connection with
the database that will be exposed by the service, and then create the
data service itself within the web application. Below is a step-by-step
description of this process.

The following steps can be used for creating a Data Service using the
Virtuoso ADO.Net Provider for accessing the sample Northwind Demo
database:

<div class="orderedlist">

1.  Launch the Visual Studio 2008 SP1 IDE.

    <div class="figure-float">

    <div id="ados1" class="figure">

    **Figure 2.117. Visual Studio 2008 SP1 IDE.**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Visual Studio 2008 SP1 IDE.](images/ui/dora1.png)

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

3.  When the New Project window appears, choose either

    <span class="emphasis">*Visual Basic*</span>

    or

    <span class="emphasis">*Visual C#*</span>

    as the programming language.

4.  Within the language category click on

    <span class="emphasis">*Web*</span>

    , and select

    <span class="emphasis">*ASP.NET Web Application*</span>

    from the right-hand panel.

5.  Choose a name for the project, for example

    <span class="emphasis">*VirtuosoDataService*</span>

    , and click

    <span class="emphasis">*OK*</span>

    .

    <div class="figure-float">

    <div id="ados2" class="figure">

    **Figure 2.118. Name project**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Name project](images/ui/eora2.png)

    </div>

    </div>

    </div>

      

    </div>

6.  This will create a new project called

    <span class="emphasis">*VirtuosoDataService*</span>

    .

    <div class="figure-float">

    <div id="ados3" class="figure">

    **Figure 2.119. Create project**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Create project](images/ui/eora3.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Right click on the

    <span class="emphasis">*VirtuosoDataService*</span>

    project name of the Solution Explorer pane, then select the

    <span class="emphasis">*Add -\> New Item*</span>

    menu options.

    <div class="figure-float">

    <div id="ados4" class="figure">

    **Figure 2.120. New Item**

    <div class="figure-contents">

    <div class="mediaobject">

    ![New Item](images/ui/einf4.png)

    </div>

    </div>

    </div>

      

    </div>

8.  The

    <span class="emphasis">*Add*</span>

    New Item dialog will appear, choose the

    <span class="emphasis">*ADO.NET Entity Data Model*</span>

    template, give it the name

    <span class="emphasis">*Virtuoso.edmx*</span>

    and click

    <span class="emphasis">*Add*</span>

    to start the creation of the ADO.Net Entity Data Model.

    <div class="figure-float">

    <div id="ados5" class="figure">

    **Figure 2.121. Entity Model**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Entity Model](images/ui/eora5.png)

    </div>

    </div>

    </div>

      

    </div>

9.  In the

    <span class="emphasis">*Entity Data Model Wizard*</span>

    dialog

    <span class="emphasis">*Choose Model Contents*</span>

    page select the

    <span class="emphasis">*Generate from Database*</span>

    model type and click

    <span class="emphasis">*Next*</span>

    .

    <div class="figure-float">

    <div id="ados6" class="figure">

    **Figure 2.122. Model Contents**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Model Contents](images/ui/eora6.png)

    </div>

    </div>

    </div>

      

    </div>

10. In the

    <span class="emphasis">*Entity Data Model Wizard*</span>

    dialog

    <span class="emphasis">*Choose your Data Connection*</span>

    page select the

    <span class="emphasis">*New Connection*</span>

    button

    <div class="figure-float">

    <div id="ados7" class="figure">

    **Figure 2.123. Data Connection**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Connection](images/ui/ados7.png)

    </div>

    </div>

    </div>

      

    </div>

11. In the

    <span class="emphasis">*Choose Data Source*</span>

    dialog, select the OpenLink

    <span class="emphasis">*Virtuoso Data Source*</span>

    from the list displayed and click

    <span class="emphasis">*Continue*</span>

    .

    <div class="figure-float">

    <div id="ados8" class="figure">

    **Figure 2.124. Data Source**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source](images/ui/dora9.png)

    </div>

    </div>

    </div>

      

    </div>

12. In the

    <span class="emphasis">*Add Connection*</span>

    dialog, specify the

    <span class="emphasis">*hostname, portno, username and
    password*</span>

    for the target Virtuoso Server and check the

    <span class="emphasis">*Save Password*</span>

    check box.

    <div class="figure-float">

    <div id="ados9" class="figure">

    **Figure 2.125. Connection Properties**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Connection Properties](images/ui/dora10.png)

    </div>

    </div>

    </div>

      

    </div>

13. Select the

    <span class="emphasis">*Select Database From List*</span>

    radio button and choose

    <span class="emphasis">*Demo*</span>

    from the drop down list, assuming the Virtuoso Demo Database is
    installed.

    <div class="figure-float">

    <div id="ados10" class="figure">

    **Figure 2.126. Advanced Properties**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Advanced Properties](images/ui/ados10.png)

    </div>

    </div>

    </div>

      

    </div>

14. Click the

    <span class="emphasis">*Test Connection*</span>

    button to verify the connection is successful and then click OK to
    add the connection.

    <div class="figure-float">

    <div id="ados11" class="figure">

    **Figure 2.127. Test Connection**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Test Connection](images/ui/ados11.png)

    </div>

    </div>

    </div>

      

    </div>

15. Set the

    <span class="emphasis">*entity connect string*</span>

    name to

    <span class="emphasis">*VirtuosoDemoEntities*</span>

    (note this name as it is required in step 17 below) and click

    <span class="emphasis">*Next*</span>

    .

    <div class="figure-float">

    <div id="ados12" class="figure">

    **Figure 2.128. entity connect string**

    <div class="figure-contents">

    <div class="mediaobject">

    ![entity connect string](images/ui/ados12.png)

    </div>

    </div>

    </div>

      

    </div>

16. In the

    <span class="emphasis">*Choose your Database Objects*</span>

    page select the

    <span class="emphasis">*Tables*</span>

    check box to select all tables in the Demo database for addition to
    the Entity Data Model, set the

    <span class="emphasis">*Model Namespace*</span>

    to

    <span class="emphasis">*VirtuosoDemoModel*</span>

    and click

    <span class="emphasis">*Finish*</span>

    .

    <div class="figure-float">

    <div id="ados13" class="figure">

    **Figure 2.129. Database Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Database Objects](images/ui/ados13.png)

    </div>

    </div>

    </div>

      

    </div>

17. The

    <span class="emphasis">*Virtuoso.edmx*</span>

    EDM will be created with the tables and relationships displayed in
    the Visual Studio IDE

    <div class="figure-float">

    <div id="ados14" class="figure">

    **Figure 2.130. Virtuoso.edmx**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Virtuoso.edmx](images/ui/ados14.png)

    </div>

    </div>

    </div>

      

    </div>

18. Right click on the

    <span class="emphasis">*VirtuosoDataService*</span>

    project name of the

    <span class="emphasis">*Solution Explorer pane*</span>

    , then select the

    <span class="emphasis">*Add -\> New Item*</span>

    menu options.

    <div class="figure-float">

    <div id="ados4_01" class="figure">

    **Figure 2.131. New Item**

    <div class="figure-contents">

    <div class="mediaobject">

    ![New Item](images/ui/ados4.png)

    </div>

    </div>

    </div>

      

    </div>

19. The

    <span class="emphasis">*Add New Item*</span>

    dialog will appear, choose the

    <span class="emphasis">*ADO.NET Data Service*</span>

    template, give it the name

    <span class="emphasis">*Virtuoso.svc*</span>

    and click

    <span class="emphasis">*Add*</span>

    to create the ADO.Net Data Service.

    <div class="figure-float">

    <div id="ados15" class="figure">

    **Figure 2.132. ADO.NET Data Service**

    <div class="figure-contents">

    <div class="mediaobject">

    ![ADO.NET Data Service](images/ui/ados15.png)

    </div>

    </div>

    </div>

      

    </div>

20. In the

    <span class="emphasis">*Virtuoso.svc.cs*</span>

    Data Service file created add the data source class name of

    <span class="emphasis">*VirtuosoDemoEntities*</span>

    (note this is the name set in step 12) as the

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

    <div id="ados16" class="figure">

    **Figure 2.133. Data Service**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Service](images/ui/ados16.png)

    </div>

    </div>

    </div>

      

    </div>

21. To test the Data Service, simply hit

    <span class="emphasis">*Ctrl+F5*</span>

    within Visual Studio, which will start the development web server,
    run the Data Services server inside and load a Web browser page
    displaying the list of available tables/entities of the Demo
    database.

    <div class="figure-float">

    <div id="ados17" class="figure">

    **Figure 2.134. test the Data Service**

    <div class="figure-contents">

    <div class="mediaobject">

    ![test the Data Service](images/ui/ados17.png)

    </div>

    </div>

    </div>

      

    </div>

22. To access a specific entity instance like the

    <span class="emphasis">*Customers*</span>

    table

    <span class="emphasis">*ALFKI*</span>

    record, this would be specified as
    http://host/vdir/Virtuoso.svc/Customers('ALFKI') .

    <div class="figure-float">

    <div id="ados18" class="figure">

    **Figure 2.135. Access a specific entity instance**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Access a specific entity instance](images/ui/ados18.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

<span class="emphasis">*NOTES*</span>

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

    <span class="emphasis"> *Tools in Internet Options*</span>

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
