<div>

<div>

<div>

<div>

### 2.12.2. Creating the Application

</div>

</div>

</div>

<span class="emphasis">*Step 1 - Create the Visual Studio
Projects.*</span>

<div>

1.  Open

    <span class="emphasis">*Visual Studio*</span>

    and create a new

    <span class="emphasis">*Silverlight Application*</span>

    project. Call the project DemoApplication.

2.  In the New Silverlight Application dialog ensure that

    <span class="emphasis">*Enable .NET RIA Services*</span>

    is checked. Click the

    <span class="emphasis">*OK*</span>

    button.

    <div>

    <div>

    **Figure 2.171. .NET RIA Services Application**

    <div>

    <div>

    ![.NET RIA Services Application](images/ui/ria1.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

At this point a skeleton solution is created that consists of a client
project called DemoApplication and a server project called
DemoApplication.Web. This application will use data from the Virtuoso
database. We add the data and its schema to the application by adding an
ADO.NET entity data model to the server project.

<span class="emphasis">*Step 2 - Add the Data Model*</span>

<div>

1.  Right click the server project in the

    <span class="emphasis">*Solution Explorer*</span>

    and

    <span class="emphasis">*Add New Item*</span>

    . In the dialog box select

    <span class="emphasis">*ADO.NET Entity Data Model*</span>

    and call it demo.edmx. Click the

    <span class="emphasis">*Add*</span>

    button. This will open the

    <span class="emphasis">*Entity Data Model Wizard*</span>

    .

2.  Choose

    <span class="emphasis">*Generate From Database*</span>

    and click

    <span class="emphasis">*Next*</span>

    .

3.  Set up a connection to the Demo database on your local Virtuoso
    Server, select

    <span class="emphasis">*Yes, include the sensitive data in the
    connection string*</span>

    and set the name of the entities to DemoEntities. Click

    <span class="emphasis">*Next*</span>

    .

4.  On the

    <span class="emphasis">*Choose Your Database Objects*</span>

    page expand

    <span class="emphasis">*Tables*</span>

    and select Employees. Check that the Model Namespace is DemoModel
    and click

    <span class="emphasis">*Finish*</span>

    .

</div>

<div>

<div>

**Figure 2.172. .NET RIA Services Application**

<div>

<div>

![.NET RIA Services Application](images/ui/ria2.png)

</div>

</div>

</div>

  

</div>

We want to make the entities in the model available to both the client
and server parts of the solution. To do this we need to add a
DomainService to the solution. However, to make the entities from the
data model available to the domain service we must first build the
solution.

<span class="emphasis">*Step 3 - Add a Domain Service.*</span>

<div>

1.  First build the solution.

2.  Right click the server project in the

    <span class="emphasis">*Solution Explorer*</span>

    and

    <span class="emphasis">*Add New Item*</span>

    . In the dialog box choose

    <span class="emphasis">*Domain Service Class*</span>

    from the Templates pane and call it EmployeeService.cs. Click

    <span class="emphasis">*Add*</span>

    . This will open the

    <span class="emphasis">*Add New Domain Service Class*</span>

    dialog.

3.  The entities from the model we have just added to the project are
    listed under

    <span class="emphasis">*Entities*</span>

    . Tick the box next to Employees. and click OK.

</div>

<div>

<div>

**Figure 2.173. .NET RIA Services Application**

<div>

<div>

![.NET RIA Services Application](images/ui/ria3.png)

</div>

</div>

</div>

  

</div>

This will create the DomainService class and generated code in both the
client and server parts of the application. The Silverlight client can
now interact with the data through the DomainContext class in the client
project. At this point you need to build the solution again.

<span class="emphasis">*Step 4 - Display The Data*</span>

<div>

1.  From the

    <span class="emphasis">*Silverlight XAML Controls*</span>

    in the

    <span class="emphasis">*Toolbox*</span>

    drag a

    <span class="emphasis">*DataGrid*</span>

    between the \<Grid\> \</Grid\> tags on MainPage.xaml in the client.
    Call the grid EmployeeGrid.

    ``` programlisting
    <data:DataGrid Name="EmployeeGrid"></data:DataGrid>
    ```

2.  Instantiate the DomainContext to get the list of employees and add
    them to the grid by adding code to MainPage.xaml.cs so it looks like
    this:

    ``` programlisting
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Net;
    using System.Windows;
    using System.Windows.Controls;
    using System.Windows.Documents;
    using System.Windows.Input;
    using System.Windows.Media;
    using System.Windows.Media.Animation;
    using System.Windows.Shapes;
    using DemoApplication.Web;
    using System.Windows.Ria.Data;

    namespace DemoApplication
    {
        public partial class MainPage : UserControl
        {
            private EmployeeContext _employeeContext = new EmployeeContext();
            public MainPage()
            {
                InitializeComponent();
                LoadOperation<Employees> LoadOp =
                    this._employeeContext.Load(this._employeeContext.GetEmployeesQuery());
                this.EmployeeGrid.ItemsSource = LoadOp.Entities;
            }
        }
    }
    ```

3.  Build and run the application. Internet Explorer will be launched
    and you will see the data displayed on the page as a grid.

</div>

<div>

<div>

**Figure 2.174. .NET RIA Services Application**

<div>

<div>

![.NET RIA Services Application](images/ui/ria4.png)

</div>

</div>

</div>

  

</div>

</div>
