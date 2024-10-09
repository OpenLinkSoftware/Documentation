<div>

<div>

<div>

<div>

### 19.8.3. Interacting with the Database

</div>

</div>

</div>

This section describes manipulating data within Virtuoso from VSP.
Unless the required tables already exist, new ones will need to be
created. This example will involve a simple table of people and a series
of pages for adding, editing, viewing, and deleting its entries.

<div>

<div>

<div>

<div>

#### Creating a Table

</div>

</div>

</div>

Tables should be created so that their entries can be uniquely
identified. This is very important so that if we need to edit or delete
one particular entry we can distinguish it from other entries. A
<span class="emphasis">*primary key*</span> is how a database enforces
unique rows, by refusing to allow duplicate data to be inserted. It is
up to the user to choose a column in the table to act as a primary key.
Sometimes one or more of the columns of data are naturally unique either
singularly or in composite; other times it is necessary to add a column
to contain unique codes for each row.

<div>

|                            |                                                        |
|:--------------------------:|:-------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                              |
|                            | <a href="pkeycons.html" class="link"                   
                              title="9.8.5. PRIMARY KEY Constraint">Primary Keys</a>  |

</div>

Here is the definition of the simple table that will be used:

``` programlisting
CREATE TABLE DB.DBA.DEMO_PEOPLE (
  EMAIL VARCHAR(255) PRIMARY KEY,
  FORENAME VARCHAR(100),
  SURNAME VARCHAR(100)
);
```

The email address has been selected as a primary key.

</div>

<div>

<div>

<div>

<div>

#### Basic Form Input Page

</div>

</div>

</div>

After the table has been created; for example via Virtuoso's iSQL
utility; it will need some data. For this we create a "New Person" page.
This page uses form inputs and some VSP code to determine whether an
insert button was pressed. If the insert button is pressed then the page
takes submitted values from the POST and uses them to construct an SQL
statement that inserts a new row into the table. This is demonstrated
below:

``` programlisting
<HTML>
  <HEAD>
    <TITLE>New Person Page</TITLE>
  </HEAD>
  <BODY>
  <?vsp

    declare _email, _forename, _surname varchar;

    _email := get_keyword('email', params, '');
    _forename := get_keyword('forename', params, '');
    _surname := get_keyword('surname', params, '');

    -- insert new person if we came from the insert button
    if ('' <> get_keyword('ins_button', params, ''))
    {
      INSERT INTO DB.DBA.DEMO_PEOPLE(EMAIL, FORENAME, SURNAME)
        VALUES(_email, _forename, _surname);
    }
  ?>
  <P>Please enter the details of new person:</P>

  <FORM METHOD="POST" ACTION="demo_people_add.vsp">
  <TABLE>
    <TR><TH>Email:</TH><TD><INPUT TYPE="TEXT" NAME="email" /></TD></TR>
    <TR><TH>Forename:</TH><TD><INPUT TYPE="TEXT" NAME="forename" /></TD></TR>
    <TR><TH>Surname:</TH><TD><INPUT TYPE="TEXT" NAME="surname" /></TD></TR>
  </TABLE>

  <INPUT TYPE="SUBMIT" NAME="ins_button" VALUE="Insert" />
  </FORM>

  </BODY>
</HTML>
```

The underscores were added to this example to keep the param variables
and page variables visibly distinguishable.

</div>

<div>

<div>

<div>

<div>

#### Displaying Table Data in a VSP Page

</div>

</div>

</div>

Now that some data exists in the table we need a way to display it. The
FOR ... DO construct is used to construct the insides of an HTML table:

``` programlisting
<HTML>
  <HEAD>
    <TITLE>The People Page</TITLE>
  </HEAD>
  <BODY>
  <P>The Peoples' Details</P>

  <TABLE>
    <TR><TH>Email</TH><TH>Forename</TH><TH>Surname</TH></TR>
  <?vsp
    FOR (SELECT EMAIL, FORENAME, SURNAME FROM DB.DBA.DEMO_PEOPLE) DO
    {
  ?>
    <TR><TD><?=EMAIL?></TD><TD><?=FORENAME?></TD><TD><?=SURNAME?></TD></TR>
  <?vsp
    }
  ?>
  </TABLE>
  </BODY>
</HTML>
```

</div>

<div>

<div>

<div>

<div>

#### Simple Form Delete Page

</div>

</div>

</div>

The page above can easily be extended to allow deletion. For each row an
'action' link is added. The action Remove link hardwires a form GET on
the URL. This is then intercepted by the IF condition looking for the
*`remove`* parameter.

``` programlisting
<HTML>
  <HEAD>
    <TITLE>The People Page With Deletion</TITLE>
  </HEAD>
  <BODY>
  <?vsp
    declare deleteme varchar;

    deleteme := get_keyword('remove', params, '');
    if ('' <> deleteme)
      DELETE FROM DB.DBA.DEMO_PEOPLE WHERE EMAIL = deleteme;
  ?>

  <FORM METHOD="POST" ACTION="demo_people_view2.vsp">
  <P>The Peoples' Details</P>

  <TABLE>
    <TR><TH>Email</TH><TH>Forename</TH><TH>Surname</TH>
      <TH>Action</TH></TR>
  <?vsp
    FOR (SELECT EMAIL, FORENAME, SURNAME FROM DB.DBA.DEMO_PEOPLE) DO
    {
  ?>
    <TR><TD><?=EMAIL?></TD><TD><?=FORENAME?></TD><TD><?=SURNAME?></TD>
      <TD><A HREF="?remove=<?=EMAIL?>">Remove</A></TD></TR>
  <?vsp
    }
  ?>
  </TABLE>
  </FORM>
  </BODY>
</HTML>
```

</div>

<div>

<div>

<div>

<div>

#### Simple Form Edit Page

</div>

</div>

</div>

The last step is to have a way to edit rows of the table. To do this, we
combine everything that we have so far and use the SQL UPDATE statement
to update the row. The EMAIL column is not made updateable since this is
the primary key.

``` programlisting
<HTML>
  <HEAD>
    <TITLE>The People Page With Deletion</TITLE>
  </HEAD>
  <BODY>
  <FORM METHOD="POST" ACTION="demo_people_view3.vsp">
  <?vsp
    declare deleteme, editme, edt_email, edt_forename, edt_surname,
            save_email, save_forename, save_surname varchar;

    deleteme := get_keyword('remove', params, '');
    if ('' <> deleteme)
      DELETE FROM DB.DBA.DEMO_PEOPLE WHERE EMAIL = deleteme;

    if ('' <> get_keyword('save_button', params, ''))
    {
      save_email := get_keyword('email', params, '');
      save_forename := get_keyword('forename', params, '');
      save_surname := get_keyword('surname', params, '');

      update DB.DBA.DEMO_PEOPLE
        SET FORENAME = save_forename, SURNAME=save_surname
        WHERE EMAIL = save_email ;
    }

    editme := get_keyword('edit', params, '');
    if ('' <> editme)
    {
      SELECT EMAIL, FORENAME, SURNAME
        INTO edt_email, edt_forename, edt_surname
        FROM DB.DBA.DEMO_PEOPLE WHERE EMAIL = editme;
  ?>
  <TABLE>
    <TR><TH>Email:</TH><TD><INPUT DISABLED TYPE="TEXT" NAME="email" VALUE="<?=edt_email?>" /></TD></TR>
    <TR><TH>Forename:</TH><TD><INPUT TYPE="TEXT" NAME="forename" VALUE="<?=edt_forename?>" /></TD></TR>
    <TR><TH>Surname:</TH><TD><INPUT TYPE="TEXT" NAME="surname" VALUE="<?=edt_surname?>" /></TD></TR>
  </TABLE>
  <INPUT TYPE="SUBMIT" NAME="save_button" VALUE="Save" />
  <?vsp
    }
  ?>

  <P>The Peoples' Details</P>

  <TABLE>
    <TR><TH>Email</TH><TH>Forename</TH><TH>Surname</TH>
      <TH>Action</TH></TR>
  <?vsp
    FOR (SELECT EMAIL, FORENAME, SURNAME FROM DB.DBA.DEMO_PEOPLE) DO
    {
  ?>
    <TR><TD><?=EMAIL?></TD><TD><?=FORENAME?></TD><TD><?=SURNAME?></TD>
      <TD><A HREF="?remove=<?=EMAIL?>">Remove</A> <A HREF="?edit=<?=EMAIL?>">Edit</A></TD></TR>
  <?vsp
    }
  ?>
  </TABLE>
  </FORM>
  </BODY>
</HTML>
```

</div>

</div>
