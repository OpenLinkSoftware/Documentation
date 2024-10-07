<div id="vdbenginemsqlsuedm" class="section">

<div class="titlepage">

<div>

<div>

### 8.13.5. Using EDM to create Entity Framework based applications

</div>

</div>

</div>

Now that a Microsoft Entity Data Model has been created for the
Microsoft SQL Server Northwind database, Entity Framework applications
can be created to make use of it.

<div id="vdbenginemsqlsuedmentf" class="section">

<div class="titlepage">

<div>

<div>

#### Entity Frameworks based ADO.NET Data Service

</div>

</div>

</div>

An ADO.Net Data Service for the Microsoft SQL Server tables can be
created using the Entity Data Model created in the
<a href="vdbenginemsqlscrvs.html" class="link"
title="8.13.4. Creating EDM in Visual Studio 2008">Creating EDM in
Visual Studio 2008 section</a> .

<div class="orderedlist">

1.  Open the

    <span class="emphasis">*VirtuosoDataService*</span>

    project created in the
    <a href="vdbenginemsqlscrvs.html" class="link"
    title="8.13.4. Creating EDM in Visual Studio 2008">Creating EDM in
    Visual Studio 2008 section</a> .

2.  Select the Project -\> Add New Item menu option.

    <div class="figure-float">

    <div id="meinf4" class="figure">

    **Figure 8.675. VirtuosoDataService**

    <div class="figure-contents">

    <div class="mediaobject">

    ![VirtuosoDataService](images/ui/meinf4.png)

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

    <div id="mfora2" class="figure">

    **Figure 8.676. Add New Item**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Add New Item](images/ui/mfora2.png)

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

    <div id="mfora4" class="figure">

    **Figure 8.677. Virtuoso.svc.cs**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Virtuoso.svc.cs](images/ui/mfora4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  To test the Data Service, simply hit

    <span class="emphasis">*Ctrl+F5*</span>

    within Visual Studio. This will start the development web server,
    run the Data Services server inside and load a Web browser page
    displaying the list of available tables/entities for the Northwind
    database catalog.

    <div class="figure-float">

    <div id="mfora3" class="figure">

    **Figure 8.678. Data Service test**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Service test](images/ui/mfora3.png)

    </div>

    </div>

    </div>

      

    </div>

6.  To access a specific entity instance like the

    <span class="emphasis">*Customers*</span>

    table ALFKI record, use this convention
    http://host/vdir/Virtuoso.svc/Customers('ALFKI').

    <div class="figure-float">

    <div id="mfora5" class="figure">

    **Figure 8.679. EMPLOYEES**

    <div class="figure-contents">

    <div class="mediaobject">

    ![EMPLOYEES](images/ui/mfora5.png)

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

</div>
