<div id="installvsentgenmodel" class="section">

<div class="titlepage">

<div>

<div>

### 2.7.3. Generating the School Entity Data Mode

</div>

</div>

</div>

<span class="emphasis">*Add the ADO.NET Entity Data Model item
template*</span>

<div class="orderedlist">

1.  Select the CourseManager project in Solution Explorer, right-click,
    point to Add, and then click New Item.

2.  Select ADO.NET Entity Data Model in the Templates pane.

3.  Type School.edmx for the model name and click Add. The opening page
    of the Entity Data Model Wizard is displayed.

    <div class="figure-float">

    <div id="uado8" class="figure">

    **Figure 2.103. School.edmx**

    <div class="figure-contents">

    <div class="mediaobject">

    ![School.edmx](images/ui/uado8.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

<span class="emphasis">*Generate the EDM*</span>

<div class="orderedlist">

1.  Select

    <span class="emphasis">*Generate from database*</span>

    in the

    <span class="emphasis">*Choose Model Contents dialog box*</span>

    . Then click

    <span class="emphasis">*Next*</span>

    .

    <div class="figure-float">

    <div id="uado9" class="figure">

    **Figure 2.104. Model Contents**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Model Contents](images/ui/uado9.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Click the

    <span class="emphasis">*New Connection*</span>

    button.

    <div class="figure-float">

    <div id="uado10" class="figure">

    **Figure 2.105. New Connection**

    <div class="figure-contents">

    <div class="mediaobject">

    ![New Connection](images/ui/uado10.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Choose the OpenLink

    <span class="emphasis">*Virtuoso Data Source*</span>

    and click

    <span class="emphasis">*Continue*</span>

    .

    <div class="figure-float">

    <div id="uado11" class="figure">

    **Figure 2.106. Virtuoso Data Source**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Virtuoso Data Source](images/ui/uado11.png)

    </div>

    </div>

    </div>

      

    </div>

4.  In the

    <span class="emphasis">*Connection Properties*</span>

    dialog specify the

    <span class="emphasis">*hostname, portno, username and
    password*</span>

    for the target Virtuoso Server and click the

    <span class="emphasis">*Advanced*</span>

    button.

    <div class="figure-float">

    <div id="uado12" class="figure">

    **Figure 2.107. Connection Properties**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Connection Properties](images/ui/uado12.png)

    </div>

    </div>

    </div>

      

    </div>

5.  In the

    <span class="emphasis">*Advanced Properties*</span>

    dialog set the

    <span class="emphasis">*Database parameter*</span>

    to

    <span class="emphasis">*School*</span>

    and click OK.

    <div class="figure-float">

    <div id="uado13" class="figure">

    **Figure 2.108. Advanced Properties**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Advanced Properties](images/ui/uado13.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Press the

    <span class="emphasis">*Test Connection*</span>

    dialog to verify the database is accessible.

    <div class="figure-float">

    <div id="uado14" class="figure">

    **Figure 2.109. Test Connection**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Test Connection](images/ui/uado14.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Set the

    <span class="emphasis">*entity connect string name*</span>

    to

    <span class="emphasis">*SchoolEntities*</span>

    and click

    <span class="emphasis">*Next*</span>

    .

    <div class="figure-float">

    <div id="uado15" class="figure">

    **Figure 2.110. entity connect string name**

    <div class="figure-contents">

    <div class="mediaobject">

    ![entity connect string name](images/ui/uado15.png)

    </div>

    </div>

    </div>

      

    </div>

8.  In the

    <span class="emphasis">*Choose your Database Objects*</span>

    page select the

    <span class="emphasis">*Tables*</span>

    check box to select all table in the

    <span class="emphasis">*School database*</span>

    for addition to the EDM, set the

    <span class="emphasis">*Model Namespace*</span>

    to

    <span class="emphasis">*SchoolModel*</span>

    and click

    <span class="emphasis">*Finish*</span>

    .

    <div class="figure-float">

    <div id="uado16" class="figure">

    **Figure 2.111. Database Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Database Objects](images/ui/uado16.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

<span class="emphasis">*View the EDM in the ADO.NET Entity Data Model
Designer*</span>

<div class="orderedlist">

1.  In the

    <span class="emphasis">*Solution Explorer*</span>

    , double-click the

    <span class="emphasis">*School.edmx*</span>

    file. This displays the School model in the ADO.NET Entity Data
    Model Designer window.

    <div class="figure-float">

    <div id="uado17" class="figure">

    **Figure 2.112. Solution Explorer**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Solution Explorer](images/ui/uado17.png)

    </div>

    </div>

    </div>

      

    </div>

2.  From the

    <span class="emphasis">*View*</span>

    menu, select

    <span class="emphasis">*Other Windows*</span>

    , and then click

    <span class="emphasis">*Model Browser*</span>

    to display the

    <span class="emphasis">*Entity Model Browser*</span>

    window.

3.  Expand the

    <span class="emphasis">*SchoolModel*</span>

    and

    <span class="emphasis">*SchoolModel.Store*</span>

    nodes to view conceptual and store definitions, respectively.

    <div class="figure-float">

    <div id="uado20" class="figure">

    **Figure 2.113. SchoolModel**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SchoolModel](images/ui/uado20.png)

    </div>

    </div>

    </div>

      

    </div>

4.  From the

    <span class="emphasis">*View menu*</span>

    , select

    <span class="emphasis">*Other Windows*</span>

    , click

    <span class="emphasis">*Mapping Details*</span>

    , and then click an entity (Person for example) or association in
    the Entity Designer.

5.  This displays the Entity Mapping Details window with information
    about the object-relational mapping for the selected object.

    <div class="figure-float">

    <div id="uado21" class="figure">

    **Figure 2.114. View menu**

    <div class="figure-contents">

    <div class="mediaobject">

    ![View menu](images/ui/uado21.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>
