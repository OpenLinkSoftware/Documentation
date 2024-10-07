<div id="installsilvercrser" class="section">

<div class="titlepage">

<div>

<div>

### 2.11.2. Creating the Application for Silverlight.

</div>

</div>

</div>

<div class="orderedlist">

1.  Open the ADO.Net Data Service project in

    <span class="emphasis">*Visual Studio*</span>

2.  In the

    <span class="emphasis">*Solution Explorer*</span>

    right click on the RDFWebDemo solution and add a new Project.

3.  In the

    <span class="emphasis">*Add New Project*</span>

    dialog select

    <span class="emphasis">*Silverlight Application*</span>

    and click

    <span class="emphasis">*OK*</span>

    . This will open the

    <span class="emphasis">*Add Silverlight Application*</span>

    dialog.

    <div class="figure-float">

    <div id="sparqlwinf32" class="figure">

    **Figure 2.167. Add Silverlight Application**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Add Silverlight Application](images/ui/sparqlwinf32.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select

    <span class="emphasis">*Link this Silverlight Control into an
    existing Web Site*</span>

    and make sure the Web Site selected is RDFWebDemo. Select

    <span class="emphasis">*Add a test page that references the
    application*</span>

    and

    <span class="emphasis">*Make it the start page*</span>

    .

    <div class="figure-float">

    <div id="sparqlwinf33" class="figure">

    **Figure 2.168. Add a test page**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Add a test page](images/ui/sparqlwinf33.png)

    </div>

    </div>

    </div>

      

    </div>

5.  In Solution Explorer, select RDFWebDemo, open the Project menu and
    select Properties.

6.  Select the

    <span class="emphasis">*Web*</span>

    tab, and select

    <span class="emphasis">*Specific Page*</span>

    in the

    <span class="emphasis">*Start Action*</span>

    section. Click on the ellipsis and select
    SilverlightApplication1TestPage.html as the start page.

7.  Add a reference to the data service. In the

    <span class="emphasis">*Solution Explorer*</span>

    right click on SilverlightApplication1 and select

    <span class="emphasis">*Add Service Reference*</span>

8.  In the

    <span class="emphasis">*Add Service Reference*</span>

    dialog click the

    <span class="emphasis">*Discover*</span>

    button. Your ADO.Net Data Service should appear in the Address box
    and the Services box.

9.  Select the service and click

    <span class="emphasis">*OK*</span>

    . ServiceReference1 will now be added to the ServiceReferences.

10. Open page.xaml.cs and add references to the service and to the
    System.Data.Services.Client assembly by adding the following using
    statements at the top of the file:

    ``` programlisting
    using System.Data.Services.Client;
    using SilverlightApplication1.ServiceReference1;
    ```

11. We need at create a data service context to reference the data from
    the service and to load data from the view, sparqlview, exposed by
    the service. Add the following lines to the page constructor after
    InitializeComponent()

    ``` programlisting
    DataServiceContext svcCtx = new DataServiceContext(new Uri("WebDataService1.svc", UriKind.Relative));
    svcCtx.BeginExecute<sparqlview>(new Uri("sparqlview", UriKind.Relative), loadSCallback, svcCtx);
    ```

12. Add the loadSCallback method to the page class. The method loads the
    data from sparqlview and puts it in a List. This List populates a
    list box on the page.

    ``` programlisting
    private void loadSCallback(IAsyncResult asyncResult)
    {   List<Uri> uList = new List<Uri>();
        DataServiceContext ctx = asyncResult.AsyncState as DataServiceContext;
        foreach (sparqlview sv in ctx.EndExecute<sparqlview>(asyncResult))
         uList.Add(new Uri(sv.s));
        listBox1.DataContext = uList;
    }
    ```

13. Add the list box to the page. In the

    <span class="emphasis">*Solution Explorer*</span>

    double click on page.xaml to open it in the editor. Add the
    following code between the \<grid\> and \</grid\> tags.

    ``` programlisting
    <ListBox x:Name="listBox1"
        HorizontalAlignment="Stretch"
        Margin="25,8,26,-78" Grid.RowSpan="1"
        Grid.Row="0" VerticalAlignment="Stretch"
        ItemsSource="{Binding Mode=OneWay}" >
        <ListBox.ItemTemplate>
            <DataTemplate>
                <StackPanel x:Name="DisplayListData"
                 Orientation="Horizontal"
                 VerticalAlignment="Bottom"
                 Margin="5" >
                    <HyperlinkButton
                     Content ="{Binding}"
                     NavigateUri="{Binding}"
                     Margin="5,0,0,0"
                     VerticalAlignment="Bottom"
                     HorizontalAlignment="Left"
                     FontSize="12">
                    </HyperlinkButton>
                </StackPanel>
            </DataTemplate>
        </ListBox.ItemTemplate>
    </ListBox>
    ```

14. Build the Silverlight application and launch without debugging using

    <span class="emphasis">*Ctrl F5*</span>

    . This will launch the browser and open
    SilverlightApplication1TestPage.aspx.

    <div class="figure-float">

    <div id="sparqlwinf34" class="figure">

    **Figure 2.169. SilverlightApplication1TestPage.aspx**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SilverlightApplication1TestPage.aspx](images/ui/sparqlwinf34.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

Clicking on one of the IRIs will open the page using description.vsp.

<div class="figure-float">

<div id="sparqlwinf35" class="figure">

**Figure 2.170. using description.vsp**

<div class="figure-contents">

<div class="mediaobject">

![using description.vsp](images/ui/sparqlwinf35.png)

</div>

</div>

</div>

  

</div>

</div>
