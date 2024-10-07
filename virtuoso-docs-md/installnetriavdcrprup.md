<div id="installnetriavdcrprup" class="section">

<div class="titlepage">

<div>

<div>

### 2.13.3. Propagate Updates to Virtuoso

</div>

</div>

</div>

<div class="orderedlist">

1.  Add a 'Submit' button just after the DataForm in MainPage.xaml by
    adding the following code.

    ``` programlisting
    <StackPanel Orientation="Horizontal" HorizontalAlignment="Right" Margin="0,12,0,0">
      <Button x:Name="submitButton" Width="75" Height="23"  Content="Submit"  Margin="4,0,0,0" Click="submitButton_Click"/>
    </StackPanel>
    ```

2.  Handle the button click event in MainPage.xaml.cs by adding the
    following code:

    ``` programlisting
    private void submitButton_Click(object sender, RoutedEventArgs e)
            {
                EmployeeDataSource.SubmitChanges();
            }
    ```

3.  Build and run the application. If you now edit data in the form and
    click the submit button the data in Virtuoso will be updated.

    <div class="figure-float">

    <div id="riad4" class="figure">

    **Figure 2.184. .NET RIA Services Application**

    <div class="figure-contents">

    <div class="mediaobject">

    ![.NET RIA Services Application](images/ui/riad4.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>
