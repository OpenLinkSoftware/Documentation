<div>

<div>

<div>

<div>

### 2.7.4. Querying Entities and Associations

</div>

</div>

</div>

This section creates strongly-typed queries against the CLR objects that
represent entities and associations in the School model, and bind
display controls to the object collections returned from these queries.

<span class="emphasis">*Query the departments in the School
database*</span>

<div>

1.  At the beginning of the code file for the

    <span class="emphasis">*CourseViewer*</span>

    form, add the following

    <span class="emphasis">*using*</span>

    (C#) or

    <span class="emphasis">*Imports*</span>

    (Visual Basic) statements to reference the model created from the
    School database and the entity namespace.

    ``` programlisting
    Visual Basic

    Imports System.Data.Objects
    Imports System.Data.Objects.DataClasses

    C#

    using System.Data.Objects;
    using System.Data.Objects.DataClasses;
    ```

2.  At the top of the partial class definition for the

    <span class="emphasis">*CourseViewer*</span>

    form, add the following code that creates an

    <span class="emphasis">*ObjectContext*</span>

    instance.

    ``` programlisting
    Visual Basic

    ' Create an ObjectContext instance based on SchoolEntity.
    Private schoolContext As SchoolEntities

    C#

    // Create an ObjectContext instance based on SchoolEntity.
    private SchoolEntities schoolContext;
    ```

3.  In the

    <span class="emphasis">*CourseViewer*</span>

    form designer, double-click the

    <span class="emphasis">*CourseViewer*</span>

    form. This opens the code page for the form and creates the

    <span class="emphasis">*courseViewer \_Load*</span>

    event handler method.

4.  In the

    <span class="emphasis">*courseViewer \_Load*</span>

    event handler method, copy and paste the following code that defines
    the

    <span class="emphasis">*DataGridView*</span>

    , executes a query that returns a collection of departments (ordered
    by

    <span class="emphasis">*Name*</span>

    ), and binds the collection of

    <span class="emphasis">*Department*</span>

    objects to the departmentList control.

    ``` programlisting
    Visual Basic

    ' Initialize the ObjectContext.
    schoolContext = New SchoolEntities()

    ' Define a query that returns all Department objects and related
    ' Course objects, ordered by name.
    Dim departmentQuery As ObjectQuery(Of Department) = _
        schoolContext.Department.Include("Course").OrderBy("it.Name")

    Try
        ' Bind the ComboBox control to the query, which is
        ' executed during data binding.
        Me.departmentList.DisplayMember = "Name"
        Me.departmentList.DataSource = departmentQuery
    Catch ex As Exception
        MessageBox.Show(ex.Message)
    End Try

    C#

    // Initialize the ObjectContext.
    schoolContext = new SchoolEntities();

    // Define a query that returns all Department objects and related
    // Course objects, ordered by name.
    ObjectQuery<Department> departmentQuery =
        schoolContext.Department.Include("Course").OrderBy("it.Name");

    try
    {
        // Bind the ComboBox control to the query, which is
        // executed during data binding.
        this.departmentList.DisplayMember = "Name";
        this.departmentList.DataSource = departmentQuery;
    }
    catch (Exception ex)
    {
        MessageBox.Show(ex.Message);
    }
    ```

</div>

<span class="emphasis">*Display courses for the selected
department*</span>

<div>

1.  In the

    <span class="emphasis">*CourseViewer*</span>

    form designer, double-click the

    <span class="emphasis">*departmentList*</span>

    control. This creates the

    <span class="emphasis">*departmentList_SelectedIndexChanged*</span>

    event handler method.

2.  Paste the following code that loads the courses that are related to
    the selected department.

    ``` programlisting
    Visual Basic

    Try
        ' Get the object for the selected department.
        Dim department As Department = _
            CType(Me.departmentList.SelectedItem, Department)

        ' Bind the grid view to the collection of Course objects
        ' that are related to the selected Department object.
        courseGridView.DataSource = department.Course

        ' Hide the columns that are bound to the navigation properties on Course.
        courseGridView.Columns("Department").Visible = False
        courseGridView.Columns("CourseGrade").Visible = False
        courseGridView.Columns("OnlineCourse").Visible = False
        courseGridView.Columns("OnsiteCourse").Visible = False
        courseGridView.Columns("Person").Visible = False

        courseGridView.AutoResizeColumns(DataGridViewAutoSizeColumnsMode.AllCells)
    Catch ex As Exception
        MessageBox.Show(ex.Message)
    End Try

    C#

    try
    {
        // Get the object for the selected department.
        Department department =
            (Department)this.departmentList.SelectedItem;

        // Bind the grid view to the collection of Course objects
        // that are related to the selected Department object.
        courseGridView.DataSource = department.Course;

        // Hide the columns that are bound to the navigation properties on Course.
        courseGridView.Columns["Department"].Visible = false;
        courseGridView.Columns["CourseGrade"].Visible = false;
        courseGridView.Columns["OnlineCourse"].Visible = false;
        courseGridView.Columns["OnsiteCourse"].Visible = false;
        courseGridView.Columns["Person"].Visible = false;

        courseGridView.AutoResizeColumns(DataGridViewAutoSizeColumnsMode.AllCells);
    }
    catch (Exception ex)
    {
        MessageBox.Show(ex.Message);
    }
    ```

</div>

</div>
