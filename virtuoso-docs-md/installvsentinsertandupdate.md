<div id="installvsentinsertandupdate" class="section">

<div class="titlepage">

<div>

<div>

### 2.7.5. Inserting and Updating Data

</div>

</div>

</div>

In this section the changes made to Course objects bound are saved to
the DataGridView control to the database and also run the completed
Course Manager application.

<span class="emphasis">*Save changes made to objects*</span>

<div class="orderedlist">

1.  In the

    <span class="emphasis">*Toolbox*</span>

    , expand

    <span class="emphasis">*Common Controls*</span>

    , drag the

    <span class="emphasis">*Button*</span>

    control to the

    <span class="emphasis">*CourseViewer*</span>

    form designer, change the

    <span class="emphasis">*name*</span>

    of the control to

    <span class="emphasis">*saveChanges*</span>

    , and change the

    <span class="emphasis">*Text*</span>

    value to

    <span class="emphasis">*Update*</span>

    .

2.  In the

    <span class="emphasis">*CourseViewer*</span>

    form designer, double-click the

    <span class="emphasis">*saveChanges*</span>

    control. This creates the

    <span class="emphasis">*saveChanges_Click*</span>

    event handler method.

3.  Paste the following code that saves object changes to the database.

    ``` programlisting
    Visual Basic

    Try
        ' Save object changes to the database, display a message,
        ' and refresh the form.
        schoolContext.SaveChanges()
        MessageBox.Show("Changes saved to the database.")
        Me.Refresh()
    Catch ex As Exception
        MessageBox.Show(ex.Message)
    End Try

    C#

    try
    {
        // Save object changes to the database, display a message,
        // and refresh the form.
        schoolContext.SaveChanges();
        MessageBox.Show("Changes saved to the database.");
        this.Refresh();
    }
    catch (Exception ex)
    {
        MessageBox.Show(ex.Message);
    }
    ```

4.  In the

    <span class="emphasis">*closeForm_Click*</span>

    event handler method, type the following code. This code disposes of
    the object context before the form is closed.

    ``` programlisting
    Visual Basic

       ' Dispose the object context.
        schoolContext.Dispose()

    C#

        // Dispose the object context.
        schoolContext.Dispose();
    ```

</div>

<span class="emphasis">*Build and run the Class Scheduling
application*</span>

<div class="orderedlist">

1.  From the

    <span class="emphasis">*Debug*</span>

    menu, select

    <span class="emphasis">*Start Debugging*</span>

    or

    <span class="emphasis">*Start Without Debugging*</span>

    , to build and run the application.

2.  When the form loads, select a department from the

    <span class="emphasis">*ComboBox*</span>

    control to display the courses that belong to that department.

    <div class="figure-float">

    <div id="uado18" class="figure">

    **Figure 2.115. ComboBox**

    <div class="figure-contents">

    <div class="mediaobject">

    ![ComboBox](images/ui/uado18.png)

    </div>

    </div>

    </div>

      

    </div>

3.  In the

    <span class="emphasis">*DataGridView*</span>

    , update course information or add a new course and then click

    <span class="emphasis">*Update*</span>

    to save changes to the database and displays a message box that
    declares the number of saved changes.

    <div class="figure-float">

    <div id="uado19" class="figure">

    **Figure 2.116. DataGridView**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGridView](images/ui/uado19.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

The process is now complete

</div>
