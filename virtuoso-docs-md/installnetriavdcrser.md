<div>

<div>

<div>

<div>

### 2.13.2. Creating the Application

</div>

</div>

</div>

<span class="emphasis">*Step 1 - Add A New Domain Service Class*</span>

The EmployeeService Domain Service Class was only used to display data
so was created read only. In this example we need to be able to update
the data so we need to remove the read only Domain Service Class and
create a new on.

<div>

1.  In the

    <span class="emphasis">*Server Explorer*</span>

    right click EmployeeService and select

    <span class="emphasis">*Delete*</span>

2.  Right click the server project and

    <span class="emphasis">*Add New Item*</span>

    . In the dialog box choose Domain Service Class from the Templates
    pane and again call it EmployeeService.cs. Click Add.

3.  Select the Employees entity and tick

    <span class="emphasis">*Enable editing*</span>

    . Also tick

    <span class="emphasis">*Generated associated classes for
    metadata*</span>

    .

    <div>

    <div>

    **Figure 2.181. .NET RIA Services Application**

    <div>

    <div>

    ![.NET RIA Services Application](images/ui/riad1.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Update MainPage.xaml.cs to use EmployeeService2 the new domain
    service rather than EmployeeContext.

</div>

We want to create a master detail style page. To do this we will use the
DomainDataSourceComponent from the Silverlight Components. But first we
will add a pager so only 5 records are displayed at a time.

<span class="emphasis">*Step 2 - Add a DataPager*</span>

<div>

1.  Add two new namespaces to MainPage.xaml

    ``` programlisting
    xmlns:riaControls="clr-namespace:System.Windows.Controls;assembly=System.Windows.Ria.Controls"
    xmlns:ds="clr-namespace:DemoApplication.Web"
    ```

2.  Use a DomainDataSource to provide the data to fill the grid. Add the
    following to MainPage.xaml before the DataGrid.

    ``` programlisting
    <riaControls:DomainDataSource x:Name="EmployeeDataSource"
                                  QueryName="GetEmployeesQuery"
                                  LoadSize="10"
                                  AutoLoad="True">
        <riaControls:DomainDataSource.DomainContext>
            <ds:EmployeeService2/>
        </riaControls:DomainDataSource.DomainContext>
    </riaControls:DomainDataSource>
    ```

3.  Update the MainPage.xaml.cs code behind file. Using the
    DomainDataSource means you no longer need to instantiate the context
    and load the grid in MainPage.xaml.cs so it becomes:

    ``` programlisting
    public partial class MainPage : UserControl
    {
        public MainPage()
        {
            InitializeComponent();
        }
    }
    ```

4.  Set the binding source of the DataGrid to the DomainDataSource

    ``` programlisting
    <data:DataGrid MinHeight="100"  IsReadOnly="True" ItemsSource="{Binding Data, ElementName=EmployeeDataSource}" x:Name="DataGrid1"></data:DataGrid> />
    ```

5.  Drag a DataPager form the tool box onto MainPage.xaml just after the
    DataGrid.

6.  Add a page size and binding element to the DataPager.

    ``` programlisting
    <data:DataPager PageSize="5" Source="{Binding Data, ElementName=employeeDataSource}"
                          Margin="0,-1,0,0"></data:DataPager>
    ```

7.  Build and run the application. The data should be displayed 5 rows
    at a time.

    <div>

    <div>

    **Figure 2.182. .NET RIA Services Application**

    <div>

    <div>

    ![.NET RIA Services Application](images/ui/riad2.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

We now need to add a DataForm to display the details.

<span class="emphasis">*Step 3 - Add a DataForm*</span>

<div>

1.  Add the following namespace to MainPage.xaml

    ``` programlisting
    xmlns:dataForm="clr-namespace:System.Windows.Controls;assembly=System.Windows.Controls.Data.DataForm.Toolkit"
    ```

2.  Add the form to MainPage.xaml

    ``` programlisting
    <dataForm:DataForm x:Name="dataForm1" Header="Employee Information"  AutoGenerateFields="False" AutoEdit="False" AutoCommit="False" CurrentItem="{Binding SelectedItem, ElementName=DataGrid1}" Margin="0,12,0,0">
       <dataForm:DataForm.EditTemplate>
           <DataTemplate>
               <StackPanel>
                   <dataForm:DataField Label="Employee ID">
                       <TextBox Text="{Binding EmployeeID, Mode=TwoWay}" />
                   </dataForm:DataField>
                   <dataForm:DataField Label="First Name">
                       <TextBox Text="{Binding FirstName, Mode=TwoWay}" />
                   </dataForm:DataField>
                   <dataForm:DataField Label="Last Name">
                       <TextBox Text="{Binding LastName, Mode=TwoWay}" />
                   </dataForm:DataField>
                   <dataForm:DataField Label="Courtesy Title">
                       <TextBox Text="{Binding TitleOfCourtesy, Mode=TwoWay}" />
                   </dataForm:DataField>
                   <dataForm:DataField Label="Hire Date">
                       <TextBox Text="{Binding HireDate, Mode=TwoWay}" />
                   </dataForm:DataField>
                   <dataForm:DataField Label="Title">
                       <TextBox Text="{Binding Title, Mode=TwoWay}"  />
                   </dataForm:DataField>
                   <dataForm:DataField Label="Reports To">
                       <TextBox Text="{Binding ReportsTo, Mode=TwoWay}"  />
                   </dataForm:DataField>
                   <dataForm:DataField Label="Region">
                       <TextBox Text="{Binding Region, Mode=TwoWay}"  />
                   </dataForm:DataField>
                   <dataForm:DataField Label="Address">
                       <TextBox Text="{Binding Address, Mode=TwoWay}"  />
                   </dataForm:DataField>
                   <dataForm:DataField Label="City">
                       <TextBox Text="{Binding City, Mode=TwoWay}"  />
                   </dataForm:DataField>
                   <dataForm:DataField Label="Country Code">
                       <TextBox Text="{Binding CountryCode, Mode=TwoWay}"  />
                   </dataForm:DataField>
                   <dataForm:DataField Label="Postal Code">
                       <TextBox Text="{Binding PostalCode, Mode=TwoWay}"  />
                   </dataForm:DataField>
                       </StackPanel>
           </DataTemplate>
       </dataForm:DataForm.EditTemplate>
     </dataForm:DataForm>
    ```

3.  Surround the DomainDataSource, DataGrid and DataForm with

    ``` programlisting
            <ScrollViewer BorderThickness="0"  VerticalScrollBarVisibility="Auto" Padding="12,0,12,0" Margin="-2">
                <StackPanel Margin="0,12,0,12" Orientation="Vertical" >
    .
    .
    .
                </StackPanel>
            </ScrollViewer>
    ```

4.  Build and run the application. As each employee is selected the data
    form fill with their details

    <div>

    <div>

    **Figure 2.183. .NET RIA Services Application**

    <div>

    <div>

    ![.NET RIA Services Application](images/ui/riad3.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

By clicking on the pencil symbol in the top right hand corner the data
in the form can be edited but it is not propagated back to the database.

</div>
