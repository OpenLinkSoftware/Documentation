<div id="vspdbinout" class="section">

<div class="titlepage">

<div>

<div>

### 3.12.2. Manipulating Database Data in VSP

</div>

</div>

</div>

The following example demonstrates a basic page that has form based flow
control, takes input from the user to put into the database and then
displays the results. This simple example can be extended to perform
more substantial operations by adding a few more inputs, buttons and
states.

Things to look at:

|                                                                                                                                                |
|------------------------------------------------------------------------------------------------------------------------------------------------|
| get_keyword is used to extract parameters from the form that were posted last time                                                             |
| the current mode is determined by the value of the submit parameter                                                                            |
| straight HTML can be inline with VSP flow control which is how the whole page is contained in an <span class="emphasis">*if*</span> condition. |

``` programlisting
<HTML>
<HEAD></HEAD>
<BODY>
<form method="POST" action="simpletest.vsp">

<?vsp
-- assumes that you have a table db..test_table(txt varchar(2000))

-- declare variables for use
declare _mode varchar;
declare _theValue varchar;
declare _stmt varchar;

-- get the current mode and continue accordingly
_mode := get_keyword ('submit', params, 'default');

if (_mode = 'Submit')
{
  -- if a submit was detected then insert the value into the DB
  _theValue := get_keyword('myTxtBox', params, 'no comment');
  _stmt := sprintf('insert into db..test_table(txt) values(\'%s\')', _theValue);
  exec (_stmt, '', '', '', '', '', '');

?>
   <P>Thank you for your submission.</P>
<?vsp
} else {
?>
   <DIV>
   <DIV>Simple test form, enter some text and hit submit.</DIV>
   <DIV><textarea name="other" rows="3" cols="64"></textarea></DIV>
   </DIV>

   <DIV><input type="submit" name="submit" value="Submit"></DIV>

   <HR />
   <H2>Values currently in table</H2>
   <TABLE>
   <?vsp
   for (select txt from db..test_table) do
     http(sprintf('<TR><TD>%s</TD></TR>', txt));
   ?>
   </TABLE>

<?vsp
}
?>
</form>
</BODY>
</HTML>
```

You may wish to offload some of the functionality of the page to a
stored procedure and call that from that page. You may do this to
improve readability of the page or there may be a series of functions
that you repeat such as displaying a particular table in some format.

You could used a procedure as follows:

``` programlisting
create procedure table_list()
{
   http('<H2>Values currently in table</H2>');
   http('<TABLE>');
   for (select txt from db..test_table) do
      http(sprintf('<TR><TD>%s</TD></TR>', txt));
   http('</TABLE>');
};
```

You could then call this in instead of defining the query and table
layout as above.

The aspects of VSP are explained in more detail in the following
sections.

</div>
