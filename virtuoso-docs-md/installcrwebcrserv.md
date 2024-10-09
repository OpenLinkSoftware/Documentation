<div>

<div>

<div>

<div>

### 2.10.2. Creating the Web Service

</div>

</div>

</div>

<span class="emphasis">*Step 1 - Create a view of the RDF data*</span>

To create a view of the customers in the Northwind first open the
Virtuoso Conductor and log in as dba. Then open iSQL from the menu on
the left and execute the following statement.

``` programlisting
create view Demo.demo.sparqlview as
sparql
select distinct ?s  from <http://example.com/Northwind>
where {?s a <http://demo.openlinksw.com/schemas/northwind#Customer>}
```

Note:

<div>

- If the view is added to the Visual Studio project as user "demo" (or
  any other than "dba'), then it must be ensured that the
  "SPARQL_SELECT" and "SPARQL_SPONGE" roles are assigned to this user,
  which can be done via the Virtuoso Conductor in the "System Admin" -\>
  "User Accounts" tab.

- Execute permissions will also need to be granted to the following
  procedure:

  ``` programlisting
  grant execute on DB.DBA.RDF_MAKE_LONG_OF_SQLVAL to "demo"
  ```

</div>

<div>

<div>

**Figure 2.160. create a view**

<div>

<div>

![create a view](images/ui/sparqlwinf25.png)

</div>

</div>

</div>

  

</div>

<span class="emphasis">*Step 2 - Create the Visual Studio Project and
Add the Model*</span>

<div>

1.  Open

    <span class="emphasis">*Visual Studio*</span>

    and create a new

    <span class="emphasis">*ASP .NET Web Application* </span>

    called RDFWebDemo.

    <div>

    <div>

    **Figure 2.161. create new application**

    <div>

    <div>

    ![create new application](images/ui/sparqlwinf26.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Right click RDFWebDemo in the

    <span class="emphasis">*Solution Explorer*</span>

    and add a new

    <span class="emphasis">*ADO.NET Entity Data Model*</span>

    called Model1.edmx. This will open the Entity Data Model Wizard.

3.  Choose

    <span class="emphasis">*Generate From Database*</span>

    and click

    <span class="emphasis">*Next*</span>

    .

4.  Set up a connection to the Demo database on your local Virtuoso
    Server, select

    <span class="emphasis">*Yes, include the sensitive data in the
    connection string*</span>

    and set the name of the entities to DemoEntities. Click

    <span class="emphasis">*Next*</span>

    .

5.  On the

    <span class="emphasis">*Choose Your Database Objects*</span>

    page expand

    <span class="emphasis">*Views*</span>

    and select sparqlview. Check that the Model Namespace is DemoModel
    and click Finish.

    <div>

    <div>

    **Figure 2.162. Model Namespace**

    <div>

    <div>

    ![Model Namespace](images/ui/sparqlwinf27.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

<span class="emphasis">*Step 3 - Add the Web Service*</span>

<div>

1.  Right click RDFWebDemo in the

    <span class="emphasis">*Solution Explorer*</span>

    and add a new

    <span class="emphasis">*ADO.NET Data Service*</span>

    called WebDataService1.svc. Click

    <span class="emphasis">*Add*</span>

    .

2.  In the class definition of WebDataService1 in the newly created file
    WebDataService1.svc.cs replace /\* TODO: put your data source class
    name here \*/ with the name of our model, DemoEntities.

    ``` programlisting
    public class WebDataService1 : DataService<DemoEntities>
    ```

3.  In the InitializeService method add the line:

    ``` programlisting
    config.SetEntitySetAccessRule("*", EntitySetRights.All);
    ```

    The method should look like this:

    ``` programlisting
     public static void InitializeService(IDataServiceConfiguration config)
       {
           // TODO: set rules to indicate which entity sets and service operations are visible, updatable, etc.
           // Examples:
           // config.SetEntitySetAccessRule("MyEntityset", EntitySetRights.AllRead);
           // config.SetServiceOperationAccessRule("MyServiceOperation", ServiceOperationRights.All);

           config.SetEntitySetAccessRule("*", EntitySetRights.All);
       }
    ```

</div>

<span class="emphasis">*Step 4 - Compile and Run*</span>

Hit <span class="emphasis">*F5*</span> to compile and run the service.
Select <span class="emphasis">*OK*</span> when prompted to enable
debugging. The default browser will be launched showing a page like:

``` programlisting
  <?xml version="1.0" encoding="utf-8" standalone="yes" ?>
- <service xml:base="http://example.com/WebDataService1.svc/" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:app="http://www.w3.org/2007/app" xmlns="http://www.w3.org/2007/app">
- <workspace>
  <atom:title>Default</atom:title>
- <collection href="sparqlview">
  <atom:title>sparqlview</atom:title>
  </collection>
  </workspace>
  </service>
```

The service is now running.

Note the address on which the service is made available. You will need
to know this when creating the app to consume the service. Look in the
Address Bar of the browser. It will be something like:
http://example.com/WebDataService1.svc/

</div>
