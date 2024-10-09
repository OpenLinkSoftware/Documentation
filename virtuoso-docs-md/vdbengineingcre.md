<div>

<div>

<div>

<div>

### 8.4.4. Creating EDM in Visual Studio 2008

</div>

</div>

</div>

The following steps can be used to create an Entity Data Model (EDM) for
the Ingres Tutorial database:

<div>

1.  Launch the Visual Studio 2008 SP1 IDE.

    <div>

    <div>

    **Figure 8.158. Visual Studio 2008 SP1 IDE**

    <div>

    <div>

    ![Visual Studio 2008 SP1 IDE](images/ui/dora1.png)

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

    <div>

    <div>

    **Figure 8.159. Web Application**

    <div>

    <div>

    ![Web Application](images/ui/epro2.png)

    </div>

    </div>

    </div>

      

    </div>

3.  When the New Project window appears, choose either

    <span class="emphasis">*Visual Basic*</span>

    or

    <span class="emphasis">*Visual C#*</span>

    as your programming language.

4.  Within the language category, click on

    <span class="emphasis">*Web*</span>

    and select

    <span class="emphasis">*ASP.NET Web Application*</span>

    from the right-hand panel.

5.  Choose a name for the project, for example

    <span class="emphasis">*VirtuosoDataService*</span>

    , and click

    <span class="emphasis">*OK*</span>

    .

    <div>

    <div>

    **Figure 8.160. name for the project**

    <div>

    <div>

    ![name for the project](images/ui/eora2.png)

    </div>

    </div>

    </div>

      

    </div>

6.  This will create a new project called

    <span class="emphasis">*VirtuosoDataService*</span>

    .

    <div>

    <div>

    **Figure 8.161. create a new project**

    <div>

    <div>

    ![create a new project](images/ui/eora3.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Select the Project -\> Add New Item menu option.

    <div>

    <div>

    **Figure 8.162. VirtuosoDataService**

    <div>

    <div>

    ![VirtuosoDataService](images/ui/einf4.png)

    </div>

    </div>

    </div>

      

    </div>

8.  The

    <span class="emphasis">*Add New Item*</span>

    dialog will appear. Choose the

    <span class="emphasis">*ADO.NET Entity Data Model*</span>

    template. Give it the name

    <span class="emphasis">*Virtuoso.edmx*</span>

    and click

    <span class="emphasis">*Add*</span>

    to start the creation of the ADO.Net Entity Data Model.

    <div>

    <div>

    **Figure 8.163. Add New Item**

    <div>

    <div>

    ![Add New Item](images/ui/eora5.png)

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

    <div>

    <div>

    **Figure 8.164. Choose Model Contents**

    <div>

    <div>

    ![Choose Model Contents](images/ui/eora6.png)

    </div>

    </div>

    </div>

      

    </div>

10. In the

    <span class="emphasis">*Entity Data Model Wizard*</span>

    dialog

    <span class="emphasis">*Choose your Data Connection*</span>

    page, select the

    <span class="emphasis">*New Connection button*</span>

    <div>

    <div>

    **Figure 8.165. Entity Data Model Wizard**

    <div>

    <div>

    ![Entity Data Model Wizard](images/ui/dora8.png)

    </div>

    </div>

    </div>

      

    </div>

11. In the

    <span class="emphasis">*Choose Data Source*</span>

    dialog, select the OpenLink

    <span class="emphasis">*Virtuoso Data Source*</span>

    from the list and click

    <span class="emphasis">*Continue*</span>

    .

    <div>

    <div>

    **Figure 8.166. Choose Data Source**

    <div>

    <div>

    ![Choose Data Source](images/ui/dora9.png)

    </div>

    </div>

    </div>

      

    </div>

12. In the

    <span class="emphasis">*Add Connection*</span>

    dialog, specify the

    <span class="emphasis">*hostname, portno, username and
    password*</span>

    for the target Virtuoso Server and check the Save Password check
    box.

    <div>

    <div>

    **Figure 8.167. Connection Properties**

    <div>

    <div>

    ![Connection Properties](images/ui/dora10.png)

    </div>

    </div>

    </div>

      

    </div>

13. Select the

    <span class="emphasis">*Select Database From List*</span>

    radio button and choose the

    <span class="emphasis">*TUT*</span>

    database from the drop down list.

    <div>

    <div>

    **Figure 8.168. Add conneciton**

    <div>

    <div>

    ![Add conneciton](images/ui/eora10i.png)

    </div>

    </div>

    </div>

      

    </div>

14. Press the

    <span class="emphasis">*Test Connection*</span>

    dialog to verify that the database is accessible.

    <div>

    <div>

    **Figure 8.169. Test Connection**

    <div>

    <div>

    ![Test Connection](images/ui/dora12.png)

    </div>

    </div>

    </div>

      

    </div>

15. Click OK to add the connection.

    <div>

    <div>

    **Figure 8.170. Test Connection**

    <div>

    <div>

    ![Test Connection](images/ui/dora12i.png)

    </div>

    </div>

    </div>

      

    </div>

16. Set the

    <span class="emphasis">*entity connect string*</span>

    name to

    <span class="emphasis">*VirtuosoEntities*</span>

    (note this name as it is required in the section on creating and
    ADO.Net Data Service) and click

    <span class="emphasis">*Next*</span>

    .

    <div>

    <div>

    **Figure 8.171. entity connect string**

    <div>

    <div>

    ![entity connect string](images/ui/eora12i.png)

    </div>

    </div>

    </div>

      

    </div>

17. In the

    <span class="emphasis">*Choose your Database Objects*</span>

    page, tick the

    <span class="emphasis">*Tables*</span>

    check box to select all tables in the TUT catalog for addition to
    the Entity Data Model. Set the

    <span class="emphasis">*Model Namespace*</span>

    to

    <span class="emphasis">*VirtuosoModel*</span>

    and click

    <span class="emphasis">*Finish*</span>

    .

    <div>

    <div>

    **Figure 8.172. Database Objects**

    <div>

    <div>

    ![Database Objects](images/ui/eora13i.png)

    </div>

    </div>

    </div>

      

    </div>

18. The

    <span class="emphasis">*Virtuoso.edmx*</span>

    EDM will be created with the tables and relationships displayed in
    the Visual Studio IDE

    <div>

    <div>

    **Figure 8.173. Virtuoso.edmx**

    <div>

    <div>

    ![Virtuoso.edmx](images/ui/eora14i.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

Creation for the Entity Data Model for the Ingres Tutorial database is
now complete.

</div>
