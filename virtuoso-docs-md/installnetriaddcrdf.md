<div>

<div>

<div>

<div>

### 2.12.3. Displaying RDF Data

</div>

</div>

</div>

One advantage of using Virtuoso as the data store is the seamless way in
which we can use this use this application to display dereferencable
IRIs and explore RDF linked data.

The Virtuoso SPASQL interface allows RDF data in the Virtuoso Quad store
to be queried using SPARQL from any SQL interface by simply prefixing
the SPARQL query with the keyword SPARQL. We will use the SPASQL
interface to create a view containing the IRIs of the Employees in the
the Demo RDF data in Virtuoso.

<span class="emphasis">*Step 1 - Create the View in Virtuoso*</span>

<div>

1.  Open the Virtuoso Conductor.

2.  In isql execute the following statement. Remember to use the
    appropriate hostname and port number of your Virtuoso installation,
    typically example.com for a default installation or whatever the
    <a href="ch-server.html#ini_uriqa" class="link" title="[URIQA]">URIQA
    DefaultHost</a> Virtuoso configuration parameter was set to when the
    demo database VAD package was installed.

    ``` programlisting
    CREATE VIEW Demo.demo.sparqlview as
    SPARQL
    PREFIX nwind: <http://demo.openlinksw.com/schemas/northwind#>
    SELECT DISTINCT  ?s
    FROM <http://demo.openlinksw.com/Northwind>
    WHERE
      {
        ?s a nwind:Employee
      }
    ```

</div>

<span class="emphasis">*Step 2 - Modify the Solution To use the
View*</span>

<div>

1.  Delete the existing Employee model and add a new one that comprises
    this new view.

    <div>

    <div>

    **Figure 2.175. .NET RIA Services Application**

    <div>

    <div>

    ![.NET RIA Services Application](images/ui/ria5.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Delete the DomainService. Build the solution and add a new
    DomainService called EmployeeService. Select the sparqlview entity.
    Build the solution.

    <div>

    <div>

    **Figure 2.176. .NET RIA Services Application**

    <div>

    <div>

    ![.NET RIA Services Application](images/ui/ria6.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Modify the code in mainpage.xaml.cs so it uses the sparqview entity.
    It should look like this:

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
                LoadOperation<sparqlview> LoadOp =
                    this._employeeContext.Load(this._employeeContext.GetSparqlviewQuery());
                this.EmployeeGrid.ItemsSource = LoadOp.Entities;
            }
        }
    }
    ```

4.  Build and run the application. You will see a list of IRIs that
    identify the Northwind employees.

    <div>

    <div>

    **Figure 2.177. .NET RIA Services Application**

    <div>

    <div>

    ![.NET RIA Services Application](images/ui/ria7.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

To realize the power of linked data we would now liked to begin
exploring this data by clicking on these IRIs.

<span class="emphasis">*Step 3 - Make Hyperlinks From IRIs*</span>

<div>

1.  Modify the DataGrid in MainPage.xaml to bind the IRI in each cell of
    the grid to a Hyperlink button. We set the AutoGenerateColumns
    property of the DataGrid to False then add our own Template for the
    column. MainPage.xaml should look like this:

    ``` programlisting
    <UserControl xmlns:data="clr-namespace:System.Windows.Controls;assembly=System.Windows.Controls.Data"  x:Class="DemoApplication.MainPage"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        mc:Ignorable="d" d:DesignWidth="640" d:DesignHeight="480">
      <Grid x:Name="LayoutRoot">
          <data:DataGrid Name="EmployeeGrid" AutoGenerateColumns="False">
                <data:DataGrid.Columns>
                    <data:DataGridTemplateColumn Header="Employee">
                        <data:DataGridTemplateColumn.CellTemplate>
                            <DataTemplate>
                                <StackPanel x:Name="DisplayEmployeeData"
                                            Orientation="Horizontal"
                                            VerticalAlignment="Bottom"
                                            Margin="5" >
                                    <HyperlinkButton Content ="{Binding s}"
                                                     NavigateUri="{Binding s}"
                                                     Margin="5,0,0,0"
                                                     VerticalAlignment="Bottom"
                                                     HorizontalAlignment="Left"
                                                     FontSize="12">
                                    </HyperlinkButton>
                                </StackPanel>
                            </DataTemplate>
                        </data:DataGridTemplateColumn.CellTemplate>
                    </data:DataGridTemplateColumn>
                </data:DataGrid.Columns>
            </data:DataGrid>
        </Grid>
    </UserControl>
    ```

2.  If we build and run the project now each IRI in the list appears as
    a hyperlink.

    <div>

    <div>

    **Figure 2.178. .NET RIA Services Application**

    <div>

    <div>

    ![.NET RIA Services Application](images/ui/ria8.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Clicking on each of the links takes you to a new document that
    contains further links to information about each Employee. The Demo
    dataset can be explored further by following the dereferenceable
    IRIs in the description pages.

    <div>

    <div>

    **Figure 2.179. .NET RIA Services Application**

    <div>

    <div>

    ![.NET RIA Services Application](images/ui/ria9.png)

    </div>

    </div>

    </div>

      

    </div>

    <div>

    <div>

    **Figure 2.180. .NET RIA Services Application**

    <div>

    <div>

    ![.NET RIA Services Application](images/ui/ria10.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>
