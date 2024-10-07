<div id="installvsentcreatedb" class="section">

<div class="titlepage">

<div>

<div>

### 2.7.2. Create the School database and schema

</div>

</div>

</div>

<div class="orderedlist">

1.  Download the <a
    href="http://download.openlinksw.com/packages/5.0/virtuoso/schools_db_dav.vad"
    class="ulink" target="_top">Schools Database</a> VAD
    (schools_db_dav.vad) package.

2.  Navigate to the

    <span class="emphasis">*System Admin -\> Packages*</span>

    tab of the Virtuoso Conductor.

    <div class="figure-float">

    <div id="uado1" class="figure">

    **Figure 2.95. Conductor Packages**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Conductor Packages](images/ui/uado1.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Scroll down to the

    <span class="emphasis">*Install Package*</span>

    section of the tab, use the

    <span class="emphasis">*Upload Package*</span>

    option

    <span class="emphasis">*Browse*</span>

    button to locate the schools_db_dav.vad package and click

    <span class="emphasis">*proceed*</span>

    .

    <div class="figure-float">

    <div id="uado2" class="figure">

    **Figure 2.96. Install package**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Install package](images/ui/uado2.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Click the

    <span class="emphasis">*Proceed*</span>

    button to begin the installation process.

    <div class="figure-float">

    <div id="uado3" class="figure">

    **Figure 2.97. Install package.**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Install package.](images/ui/uado3.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Once complete return to the

    <span class="emphasis">*Packages*</span>

    tab and scroll down to confirm the \*schools_db\* package is listed
    as installed.

    <div class="figure-float">

    <div id="uado4" class="figure">

    **Figure 2.98. Install package**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Install package](images/ui/uado4.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

<span class="emphasis">*Create the Course Manager application using
Visual Studio*</span>

<div class="orderedlist">

1.  Launch the Visual Studio 2008 SP1 IDE.

    <div class="figure-float">

    <div id="uados1" class="figure">

    **Figure 2.99. Visual Studio 2008 SP1 IDE**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Visual Studio 2008 SP1 IDE](images/ui/uados1.png)

    </div>

    </div>

    </div>

      

    </div>

2.  On the

    <span class="emphasis">*File menu*</span>

    click

    <span class="emphasis">*New Project*</span>

    .

3.  Choose either

    <span class="emphasis">*Visual Basic*</span>

    or

    <span class="emphasis">*Visual C#*</span>

    in the

    <span class="emphasis">*Project Types*</span>

    pane.

4.  Select

    <span class="emphasis">*Windows Forms Application*</span>

    in the

    <span class="emphasis">*Templates*</span>

    pane.

5.  Enter

    <span class="emphasis">*CourseManager*</span>

    for the project name, and then click

    <span class="emphasis">*OK*</span>

    .

    <div class="figure-float">

    <div id="uado5" class="figure">

    **Figure 2.100. Create project**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Create project](images/ui/uado5.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

<span class="emphasis">*Create the Course Viewer form*</span>

<div class="orderedlist">

1.  In the <span class="emphasis">*CourseManager*</span> project, select
    the default form (Form1).

2.  In the <span class="emphasis">*File Properties*</span> pane, change
    the File Name to <span class="emphasis">*CourseViewer.vb*</span> or
    <span class="emphasis">*CourseViewer.cs*</span> .

3.  In <span class="emphasis">*Solution Explorer*</span> , double-click
    <span class="emphasis">*CourseViewer.vb*</span> or
    <span class="emphasis">*CourseViewer.cs*</span> to open the form.

    <div class="figure-float">

    <div id="uado6" class="figure">

    **Figure 2.101. CourseViewer.vb**

    <div class="figure-contents">

    <div class="mediaobject">

    ![CourseViewer.vb](images/ui/uado6.png)

    </div>

    </div>

    </div>

      

    </div>

4.  In the <span class="emphasis">*Toolbox*</span> , expand
    <span class="emphasis">*Common Controls*</span> , drag the
    <span class="emphasis">*ComboBox*</span> control to the form, and
    change the name of the control to
    <span class="emphasis">*departmentList*</span> .

5.  In the <span class="emphasis">*Toolbox*</span> , drag the
    <span class="emphasis">*Button*</span> control to the form, change
    the <span class="emphasis">*Name*</span> of the control to
    <span class="emphasis">*closeForm*</span> , and change the
    <span class="emphasis">*Text value*</span> to
    <span class="emphasis">*Close*</span> .

6.  In the <span class="emphasis">*Toolbox*</span> , expand
    <span class="emphasis">*Data*</span> , drag the
    <span class="emphasis">*DataGridView*</span> control to the form,
    and change the <span class="emphasis">*Name*</span> of the control
    to <span class="emphasis">*courseGridView*</span> .

    <div class="figure-float">

    <div id="uado7" class="figure">

    **Figure 2.102. DataGridView**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGridView](images/ui/uado7.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Double-click the <span class="emphasis">*closeForm*</span> button
    control. This opens the code page for the form and creates the
    closeForm_Click event handler method.

8.  In the <span class="emphasis">*closeForm_Click*</span> event handler
    method, type the following code that closes the form:

    ``` programlisting
    Visual Basic

    ' Close the form.
    Me.Close()

    C#

    // Close the form.
    this.Close();
    ```

</div>

</div>
