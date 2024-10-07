<div id="rthaspxwalk" class="section">

<div class="titlepage">

<div>

<div>

### 14.5.4. Migrating ASP.Net Applications to Virtuoso

</div>

</div>

</div>

<div id="rthaspxnew" class="section">

<div class="titlepage">

<div>

<div>

#### Creating a Simple Data Bound Application

</div>

</div>

</div>

This section will describe how to use the MS Visual Studio to create an
application using as much drag and drop as possible. We want to create a
table of data in a web page from a database.

<div class="orderedlist">

1.  **Launch Microsoft's Visual Studio. ** Once Visual Studio has been
    launch it present you with the start page that lets you create a New
    Project.

    <div id="rthvs001" class="figure">

    **Figure 14.18. Databound Examples using MS Visual Studio**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databound Examples using MS Visual Studio](images/rth/vs001.jpg)

    </div>

    </div>

    </div>

      

2.  **Create a new <span class="guimenu">Empty Web Project</span> . **
    From the templates select a new Empty Web Project found in the
    Visual Basic Projects type. You must also select a location on an
    IIS web server.

    <div id="rthvs002" class="figure">

    **Figure 14.19. Databound Examples using MS Visual Studio**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databound Examples using MS Visual Studio](images/rth/vs002.jpg)

    </div>

    </div>

    </div>

      

3.  **Wait for IIS application to be set-up. ** You will be shown a
    progress dialogue as Visual Studio contacts your web server creating
    a new web application there.

    <div id="rthvs003" class="figure">

    **Figure 14.20. Databound Examples using MS Visual Studio**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databound Examples using MS Visual Studio](images/rth/vs003.jpg)

    </div>

    </div>

    </div>

      

4.  **Add New Web Form. ** When the application-space has been
    configured on the web server you will be returned to the main Visual
    Studio windows. Now we must create our page. Right-click on the
    project name in the Solution Explorer and select Add New Web Form.

    <div id="rthvs004" class="figure">

    **Figure 14.21. Databound Examples using MS Visual Studio**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databound Examples using MS Visual Studio](images/rth/vs004.jpg)

    </div>

    </div>

    </div>

      

5.  **New Web Form. ** The <span class="guimenu">Add New Item</span>
    option will appear, automatically selecting the "Web Form" item to
    add. Supply a name for the page and click Open to begin.

    <div id="rthvs005" class="figure">

    **Figure 14.22. Databound Examples using MS Visual Studio**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databound Examples using MS Visual Studio](images/rth/vs005.jpg)

    </div>

    </div>

    </div>

      

6.  **Add a SqlDataAdapter Control. ** With the fresh "Web Form" we can
    start. From the <span class="guimenu">ToolBox </span> double-click
    on the <span class="guimenu">SqlDataAdapter</span> in the
    <span class="guimenu">Data</span> panel. This will start the
    <span class="guimenu">Data Adapter Configuration Wizard</span> .
    After reading the description on the first panel click on the Next
    button. You will be asked to choose your connection. Assuming that
    you have access to a Northwind database hosted in MS SQLServer you
    can either make use of an existing connection to it or configure a
    new one using the <span class="guibutton">New Connection</span>
    button. Pressing the <span class="guibutton">New Connection</span>
    button will present the normal OLEDB dialogues for creating a new
    datasource. Once a data connection has been selected press Next to
    continue.

    <div id="rthvs006" class="figure">

    **Figure 14.23. Databound Examples using MS Visual Studio**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databound Examples using MS Visual Studio](images/rth/vs006.jpg)

    </div>

    </div>

    </div>

      

7.  **Choose a Query Type. ** The next panel will ask how the data
    adapter should access the database. For simplicity we will stick
    with the default of Use SQL Statements. Press Next.

    <div id="rthvs007" class="figure">

    **Figure 14.24. Databound Examples using MS Visual Studio**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databound Examples using MS Visual Studio](images/rth/vs007.jpg)

    </div>

    </div>

    </div>

      

8.  **Generate SQL Statements. ** At this point you can either type a
    SQL statement if you know exactly what you are looking to get back
    from the database, or you can use the <span class="guibutton">Query
    Builder</span> to point-and-click to your data. In our case we will
    retrieve everything from the Customers table using a simple
    query:`select * from Customers` .

    <div id="rthvs008" class="figure">

    **Figure 14.25. Databound Examples using MS Visual Studio**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databound Examples using MS Visual Studio](images/rth/vs008.jpg)

    </div>

    </div>

    </div>

      

9.  **Advanced Options. ** Click on the Advanced Options button.
    Unselect the top checkbox. This will also unselect the other two
    automatically. We will not be performing any updates in this
    example. OK the advanced options, upon return to the main dialogue
    press the Next button to continue onwards.

    <div id="rthvs009" class="figure">

    **Figure 14.26. Databound Examples using MS Visual Studio**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databound Examples using MS Visual Studio](images/rth/vs009.jpg)

    </div>

    </div>

    </div>

      

10. **View Wizard Results. ** The next panel confirms all the options
    selected leaving us to simply complete the wizard.

    <div id="rthvs010" class="figure">

    **Figure 14.27. Databound Examples using MS Visual Studio**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databound Examples using MS Visual Studio](images/rth/vs010.jpg)

    </div>

    </div>

    </div>

      

11. **Back to the main window... ** When the wizard finishes and returns
    you to the main Visual Studio window you will see that two controls
    have been added to the Web Form. The connection control has been
    automatically generated to support the Data Adapter.

    <div id="rthvs011" class="figure">

    **Figure 14.28. Databound Examples using MS Visual Studio**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databound Examples using MS Visual Studio](images/rth/vs011.jpg)

    </div>

    </div>

    </div>

      

12. **Generate Dataset. ** Before we can display anything on the page we
    need to form a Dataset. Right-click on the SQLDataAdapter1 control
    you previously added and select Generate Dataset. Defaults on the
    displayed dialog are all sufficient. After verifying them click the
    OK button to generate the dataset.

    <div id="rthvs015" class="figure">

    **Figure 14.29. Databound Examples using MS Visual Studio**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databound Examples using MS Visual Studio](images/rth/vs015.jpg)

    </div>

    </div>

    </div>

      

13. **Add a DataGrid Control. ** Now we need to show the dataset that we
    are fetching from the database. We will use a simple DataGrid for
    this. Open the toolbox in the Web Forms panel and double-click on
    the DataGrid control. This add the control to the page and will
    display a table on the web page view.

    <div id="rthvs012" class="figure">

    **Figure 14.30. Databound Examples using MS Visual Studio**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databound Examples using MS Visual Studio](images/rth/vs012.jpg)

    </div>

    </div>

    </div>

      

14. **Table Properties. ** Configure the DataGrid control by
    right-clicking on the table and selecting
    <span class="guimenu">Property Builder</span> .

    <div id="rthvs013" class="figure">

    **Figure 14.31. Databound Examples using MS Visual Studio**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databound Examples using MS Visual Studio](images/rth/vs013.jpg)

    </div>

    </div>

    </div>

      

15. **DataGrid Properties. ** You can adjust most properties of the
    table such as colours, fonts, borders, etc. You can control paging
    aspects that will be taken care of automatically by the control, you
    only need specify the number of results per page. For now we only
    want to adjust the most important aspects of the table, where the
    data comes from.

    <div id="rthvs014" class="figure">

    **Figure 14.32. Databound Examples using MS Visual Studio**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databound Examples using MS Visual Studio](images/rth/vs014.jpg)

    </div>

    </div>

    </div>

      

16. **DataGrid Bindings. ** From the first
    <span class="guimenu">General</span> properties panel you must
    select the DataSource, DataMember, and select the Data key field
    (especially important for updatable tables). These properties may be
    selected via the drop-downs on the panel, allowing you to select the
    now-familiar controls configured earlier. Once configured, press the
    OK button to save the changes.

    <div id="rthvs016" class="figure">

    **Figure 14.33. Databound Examples using MS Visual Studio**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databound Examples using MS Visual Studio](images/rth/vs016.jpg)

    </div>

    </div>

    </div>

      

17. **Preview. ** Once the details have been saved the view of the table
    in the page will be updated to reflect the dataset details.

    <div id="rthvs017" class="figure">

    **Figure 14.34. Databound Examples using MS Visual Studio**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databound Examples using MS Visual Studio](images/rth/vs017.jpg)

    </div>

    </div>

    </div>

      

18. **Page Initialization. ** We are very nearly finished. The controls
    are all ready to be used, however, the final touch is to edit our
    Page_Load function. Double-click on the empty part of the web page
    view in Visual Studio and the associated `.vb` file will be opened.
    This is the file containing the actual code. You will be
    automatically placed at the Page_Load function. This is the page
    initialization section where will need to instruct the DataAdapter
    to fill with data, and then instruct the DataGrid to bind to that
    data.

    These lines of code need to be added by hand:

    ``` programlisting
    SqlDataAdapter1.Fill(DataSet11)
    DataGrid1.DataBind()
    ```

    You will find that Visual Studio will offer some assistance in the
    form of intellisense command-completion while you are typing.

    <div id="rthvs018" class="figure">

    **Figure 14.35. Databound Examples using MS Visual Studio**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databound Examples using MS Visual Studio](images/rth/vs018.jpg)

    </div>

    </div>

    </div>

      

19. **The End Result. ** Next we will set the project's initial
    start-page by right-clicking on the form name in solution explorer
    and selecting <span class="guimenu">Set as Start Page</span> option.
    Finally we can run the project using the start button at the top.
    The project will automatically be built and a browser window
    launched automatically. Admire your results. When finished, on
    closing the browser windows you will automatically return to Visual
    Studio.

    <div id="rthvs019" class="figure">

    **Figure 14.36. Databound Examples using MS Visual Studio**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databound Examples using MS Visual Studio](images/rth/vs019.jpg)

    </div>

    </div>

    </div>

      

</div>

</div>

<div id="rthaspxmigratevirt" class="section">

<div class="titlepage">

<div>

<div>

#### Migrating ASP.Net Applications to Virtuoso

</div>

</div>

</div>

The previous section showed us how to build a very basic web application
using an ASPX data-bound control. Now we will host this same application
in Virtuoso demonstrating that IIS is no longer required for ASPX
application deployment.

<div class="orderedlist">

1.  **Locating your ASPX application. ** Use explorer to locate the ASPX
    application you want to move away from IIS and re-deploy under
    Virtuoso. The previous section created the application in the IIS
    virtual directory represented by `http://ash:8888/aspxdemo1/` which
    was physically located in `c:\inetpub\wwwroot\aspxdemo1\` . We can
    simply copy this directory and place it somewhere under either the
    VSP root directory or WebDAV. We will copy the application to a
    location in WebDAV for a local Virtuoso server.

    <div id="rthmig001" class="figure">

    **Figure 14.37. Migrating ASP.Net Applications to Virtuoso**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Migrating ASP.Net Applications to Virtuoso](images/rth/mig001.jpg)

    </div>

    </div>

    </div>

      

2.  **Add a Network Place to DAV. ** From My Network Places in explorer
    or Network Neighborhood double-click on the
    <span class="guibutton">Add Network Place</span> shortcut to start
    the wizard.

    <div id="rthmig002" class="figure">

    **Figure 14.38. Migrating ASP.Net Applications to Virtuoso**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Migrating ASP.Net Applications to Virtuoso](images/rth/mig002.jpg)

    </div>

    </div>

    </div>

      

3.  **Network service provider. ** Select the default option. Click next
    to continue.

    <div id="rthmig003" class="figure">

    **Figure 14.39. Migrating ASP.Net Applications to Virtuoso**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Migrating ASP.Net Applications to Virtuoso](images/rth/mig003.jpg)

    </div>

    </div>

    </div>

      

4.  **Internet or Network Address. ** Here you specify the URL of DAV on
    the Virtuoso server. We are using Virtuoso on the local machine but
    this could be anywhere on the Internet. Click next to continue.

    <div id="rthmig004" class="figure">

    **Figure 14.40. Migrating ASP.Net Applications to Virtuoso**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Migrating ASP.Net Applications to Virtuoso](images/rth/mig004.jpg)

    </div>

    </div>

    </div>

      

5.  **Name the Network Place. ** Provide the network place with a
    meaningful name so we can easily find this location in the future.
    Click on next to continue.

    <div id="rthmig005" class="figure">

    **Figure 14.41. Migrating ASP.Net Applications to Virtuoso**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Migrating ASP.Net Applications to Virtuoso](images/rth/mig005.jpg)

    </div>

    </div>

    </div>

      

6.  **Open the Network Place. ** On the final panel of the wizard there
    is a checkbox to "Open this network place when I click Finish" that
    we will leave checked. Click Finish to continue and open the DAV
    directory.

    <div id="rthmig006" class="figure">

    **Figure 14.42. Migrating ASP.Net Applications to Virtuoso**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Migrating ASP.Net Applications to Virtuoso](images/rth/mig006.jpg)

    </div>

    </div>

    </div>

      

7.  **Connect to DAV. ** When you attempt to connect to DAV you will be
    prompted for a User name and Password. These will be whatever you
    entered during the installation, possibly both dav, in which case
    type dav in both fields and press the OK button to continue.

    <div id="rthmig007" class="figure">

    **Figure 14.43. Migrating ASP.Net Applications to Virtuoso**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Migrating ASP.Net Applications to Virtuoso](images/rth/mig007.jpg)

    </div>

    </div>

    </div>

      

8.  **Copy the ASPX application to DAV. ** Once the explorer opens up on
    the DAV network place we can copy the `aspxdemo1` application
    directory to it.

    <div id="rthmig008" class="figure">

    **Figure 14.44. Migrating ASP.Net Applications to Virtuoso**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Migrating ASP.Net Applications to Virtuoso](images/rth/mig008.jpg)

    </div>

    </div>

    </div>

      

9.  **Configure Virtual Directory. ** Now we have to configure a
    Virtuoso virtual directory. Go to Conductor / Web Application Server
    / HTTP Hosts & Directories.

    <div id="rthmig009" class="figure">

    **Figure 14.45. Migrating ASP.Net Applications to Virtuoso**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Migrating ASP.Net Applications to Virtuoso](images/rth/mig009.png)

    </div>

    </div>

    </div>

      

10. **Add Virtual Directory. ** The "folder" icon for the hosts defined
    will list all mappings currently present for the Virtuoso server.
    Click on the "New Directory" link to continue.

    <div id="rthmig010" class="figure">

    **Figure 14.46. Migrating ASP.Net Applications to Virtuoso**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Migrating ASP.Net Applications to Virtuoso](images/rth/mig010.png)

    </div>

    </div>

    </div>

      

11. **Select DAV Domain template. ** On the next page select for "Type"
    the DAV Domain template and click "Next".

    <div id="rthmig011" class="figure">

    **Figure 14.47. Migrating ASP.Net Applications to Virtuoso**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Migrating ASP.Net Applications to Virtuoso](images/rth/mig011.png)

    </div>

    </div>

    </div>

      

12. **Configure the Virtual Directory parameters. ** We must supply a
    logical path, `/aspxdemo1` , in this case. We must also supply the
    physical path that this represents, we can either type in the DAV
    location or use the Browse button to the find the directory under
    DAV. The WebDAV checkbox will correctly already be checked. For now
    we will also set to Allow Directory Browsing, and Override execution
    permissions in WebDAV. Finally we must set the VSP Execution user to
    `dba` using the drop down. To save the changes click on the "Save
    Changes" button at the bottom of the page.

    <div id="rthmig012" class="figure">

    **Figure 14.48. Migrating ASP.Net Applications to Virtuoso**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Migrating ASP.Net Applications to Virtuoso](images/rth/mig012.png)

    </div>

    </div>

    </div>

      

13. **View the ASPX page hosted in Virtuoso DAV. ** With the virtual
    directory configured we have only to test that it works as expected.
    On opening a browser at:
    `http://example.com/aspxdemo1/WebForm1.aspx` , we will see the same
    output as before.

    <div id="rthmig013" class="figure">

    **Figure 14.49. Migrating ASP.Net Applications to Virtuoso**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Migrating ASP.Net Applications to Virtuoso](images/rth/mig013.jpg)

    </div>

    </div>

    </div>

      

</div>

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Note: Note:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/note.png" alt="[Note]" /></td>
<td style="text-align: left;">Note:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p>If ASPX hosting is
attempted on a machine that never had IIS installed it is possible that
ASP.NET is not configured, although required. The Virtuoso installer
will take care of this for you in most cases but if you run into
problems you may want to confirm that ASP.NET is configured correctly.
You will have to use the regedit utility to edit the registry, changing
a search-path so System.Web.dll can find aspnet_asapi.dll. Always
exercise caution whenever editing the registry as invalid data can
prevent your machine from operating properly.</p>
<p>You will first need to find out what version of the <code
class="computeroutput">aspnet_isapi.dll</code> library you have. The
simplest way to determine this is by locating the file and
right-clicking properties on it from explorer.</p>
<p>Assuming the version is 1.0.3705.288, we should enter the following
details into the registry if the <code
class="computeroutput">HKLM\Microsoft\ASP.NET</code> key is missing (if
your version differs change it accordingly):</p>
<pre class="programlisting"><code>[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ASP.NET]
     &quot;RootVer&quot;=&quot;1.0.3705.288&quot;
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ASP.NET\1.0.3705.288]
     &quot;Path&quot;=&quot;C:\WINDOWS\Microsoft.NET\Framework\v1.0.3705&quot;
     &quot;DllFullPath&quot;=&quot;C:\WINDOWS\Microsoft.NET\Framework\v1.0.3705\aspnet_isapi.dll&quot;</code></pre></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>
