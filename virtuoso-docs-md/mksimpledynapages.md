<div id="mksimpledynapages" class="section">

<div class="titlepage">

<div>

<div>

### 14.3.8. Making Simple Dynamic Web Pages

</div>

</div>

</div>

The directory where the pages reside must be marked as executable. Use
the <a href="fn_vhost_define.html" class="link"
title="VHOST_DEFINE">vhost_define</a> function or the
<a href="admui.internetdomains.html#httpvirtualdirs" class="link"
title="HTTP Virtual Directories">Administration Interface</a> to do
this:

``` programlisting
vhost_define (lpath=>'/example_location', ppath=>'/example_location/', vsp_user=>'demo');
```

The usual way to make an Dynamic page is to make a HTML skeleton and
insert Virtuoso/PL code in appropriate places to fill in the rest
dynamically. Consider the following example as a demonstration of such
technique. Note that the example is made in four steps but in practice
this can be one.

Suppose we have a table Demo.demo.Shippers (from the Demo database of
the standard distribution). We can make a simple page for editing it.

<div class="orderedlist">

1.  **Building The HTML Skeleton. ** We define one form for editing and
    adding entries and a table for listing the existing shippers.

    ``` programlisting
    <HTML>
      <BODY>

        <!-- edit form -->

        <FORM name="ShippersForm" method="POST" action="shippers.vsp">
           <INPUT type="hidden" name="ShipperID" value="">
           <TABLE>
             <TR>
           <TD>Company Name</TD>
           <TD><input type="text" name="CompanyName" value=""><!-- CompanyName -->

    </TD>
         </TR>
             <TR>
           <TD>Phone</TD>
               <TD><INPUT type="text" name="Phone" value=""><!-- Phone number -->

    </TD>
         </TR>
             <TR><TD colspan="2"><input type="submit" name="accept" value="Accept"></TD></TR>
           </TABLE>
        </FORM>
        <!-- end of form -->

        <!-- list of entries -->

        <TABLE>
           <TR><TD>Company Name</TD><TD>Phone #</TD><TD colspan="2">Action</TD></TR>
           <!--TR><TD>CompanyName</TD><TD>Phone</TD><TD>Edit URI</TD><TD>Delete URI</TD></TR-->

        </TABLE>
        <!-- end of list -->

      </BODY>
    </HTML>
        
    ```

2.  **Filling a List of Entries. ** We have added in part 'list of
    entries' one active part (for select ...). And using \<?=...?\>
    shortcut we have made for each row in database table one row in
    table defined in step 1. Also we have added two useful links 'Edit'
    and 'Delete' with URL parameter 'EDIT' and 'DELETE' whose value is
    equal to the primary key value of the row;

    ``` programlisting
    <HTML>
      <BODY>

        <!-- edit form -->

        <FORM name="ShippersForm" method="POST" action="shippers.vsp">
           <INPUT type="hidden" name="ShipperID" value="">
           <TABLE>
             <TR>
           <TD>Company Name</TD>
           <TD><input type="text" name="CompanyName" value=""><!-- CompanyName -->

    </TD>
         </TR>
             <TR>
           <TD>Phone</TD>
               <TD><INPUT type="text" name="Phone" value=""><!-- Phone number -->

    </TD>
         </TR>
             <TR><TD colspan="2"><input type="submit" name="accept" value="Accept"></TD></TR>
           </TABLE>
        </FORM>
        <!-- end of form -->

        <!-- list of entries -->

        <TABLE>
           <TR><TD>Company Name</TD><TD>Phone #</TD><TD colspan="2">Action</TD></TR>
           <!--TR><TD>CompanyName</TD><TD>Phone</TD><TD>Edit URI</TD><TD>Delete URI</TD></TR-->

           <?vsp
             for select ShipperID, CompanyName, Phone from Demo.demo.Shippers do
              {
           ?>
           <TR>
             <TD><?=CompanyName?></TD>
         <TD><?=Phone?></TD>
         <TD><a href="shippers.vsp?EDIT=<?=ShipperID?>">Edit</a></TD>
         <TD><a href="shippers.vsp?DELETE=<?=ShipperID?>">Delete</a></TD>
           </TR>
           <?vsp
              }
           ?>
        </TABLE>
        <!-- end of list -->

      </BODY>
    </HTML>
        
    ```

3.  **Retrieving Parameters and Filling in The Form. ** We must retrieve
    the parameters 'Delete' and 'Edit' from the URL and fill in the form
    elements

    ``` programlisting
    <?vsp
    declare company_name, phone_number varchar;
    declare shipper_id, operation integer;
    declare shipper_info
      cursor for select CompanyName, Phone
        from Demo.demo.Shippers where ShipperID = shipper_id;

    company_name := '';
    phone_number := '';
    operation := 0;

    shipper_id := atoi (get_keyword ('EDIT', params, '0'));

    if (shipper_id > 0)
      {
        whenever not found goto not_found_any;
        open shipper_info (prefetch 1);
        fetch shipper_info into company_name, phone_number;
    not_found_any:
        close shipper_info;
        goto display_page;
      }

    shipper_id := atoi (get_keyword ('DELETE', params, '0'));

    if (shipper_id > 0)
      {
        delete from Demo.demo.Shippers where ShipperID = shipper_id;
        goto display_page;
      }

    display_page:

    ?>

    <HTML>
      <BODY>

        <!-- edit form -->

        <FORM name="ShippersForm" method="POST" action="shippers.vsp">
           <INPUT type="hidden" name="ShipperID" value="<?=shipper_id?>">
           <TABLE>
             <TR>
           <TD>Company Name</TD>
           <TD><input type="text" name="CompanyName" value="<?=company_name?>"</TD>
         </TR>
             <TR>
           <TD>Phone</TD>
               <TD><INPUT type="text" name="Phone" value="<?=phone_number?>"</TD>
         </TR>
             <TR><TD colspan="2"><input type="submit" name="accept" value="Accept"></TD></TR>
           </TABLE>
        </FORM>
        <!-- end of form -->

        <!-- list of entries -->

        <TABLE>
           <TR><TD>Company Name</TD><TD>Phone #</TD><TD colspan="2">Action</TD></TR>
           <!--TR><TD>CompanyName</TD><TD>Phone</TD><TD>Edit URI</TD><TD>Delete URI</TD></TR-->

           <?vsp
             for select ShipperID, CompanyName, Phone from Demo.demo.Shippers do
              {
           ?>
           <TR>
             <TD><?=CompanyName?></TD>
         <TD><?=Phone?></TD>
         <TD><a href="shippers.vsp?EDIT=<?=ShipperID?>">Edit</a></TD>
         <TD><a href="shippers.vsp?DELETE=<?=ShipperID?>">Delete</a></TD>
           </TR>
           <?vsp
              }
           ?>
        </TABLE>
        <!-- end of list -->

      </BODY>
    </HTML>
        
    ```

    We have added a section to the top of the page that we use to
    recognize what operation to perform and do the appropriate action in
    the database. In the case of editing we use the values input on the
    form.

4.  **Editing Form Logic. ** We have a logic in the same initialization
    part of the page that retrieves a 'ShipperID' parameter, so if this
    parameter exists in the params array then the operation is to
    perform an insert, otherwise we must update a record.

    ``` programlisting
    <?vsp
    declare company_name, phone_number varchar;
    declare shipper_id integer;
    declare shipper_info
      cursor for select CompanyName, Phone
        from Demo.demo.Shippers where ShipperID = shipper_id;

    company_name := '';
    phone_number := '';

    shipper_id := atoi (get_keyword ('EDIT', params, '0'));
    -- If the current operation is edit then we retrieve the Company Name and Phone
    if (shipper_id > 0)
      {
        whenever not found goto not_found_any;
        open shipper_info (prefetch 1);
        fetch shipper_info into company_name, phone_number;
    not_found_any:
        close shipper_info;
        goto display_page;
      }

    shipper_id := atoi (get_keyword ('DELETE', params, '0'));

    -- If the operation is delete then delete it (if any error
    -- occurred then HTTP server will handle it)
    if (shipper_id > 0)
      {
        delete from Demo.demo.Shippers where ShipperID = shipper_id;
        shipper_id := 0; -- reset it to prevent submission of wrong shipper id
        goto display_page;
      }

    -- If pressed button Accept then we can recognize the operation
    if ('' <> get_keyword ('accept', params, ''))
      {
        shipper_id := atoi (get_keyword ('ShipperID', params, '0'));
        company_name := get_keyword ('CompanyName', params, 'unknown');
        phone_number := get_keyword ('Phone', params, 'N/A');
        -- the old entry going edited
        if (shipper_id > 0)
            update Demo.demo.Shippers set CompanyName = company_name, Phone = phone_number
            where ShipperID = shipper_id;
        else -- this is an new entry
          {
            shipper_id := coalesce ((select max(ShipperID) from Demo.demo.Shippers), 0) + 1;
            insert into Demo.demo.Shippers (ShipperID,CompanyName,Phone)
            values (shipper_id,company_name,phone_number);
          }
        company_name := ''; -- we clear all entered data
        phone_number := '';
        shipper_id := 0; -- to prevent setting of wrong shipper id in form
      }

    display_page:

    ?>

    <HTML>
      <BODY>
        <H3>Editing a shipment companies</H3>
        <!-- edit form -->

        <FORM name="ShippersForm" method="POST" action="shippers.vsp">
           <INPUT type="hidden" name="ShipperID" value="<?=shipper_id?>">
           <TABLE>
             <TR>
           <TD>Company Name</TD>
           <TD><input type="text" name="CompanyName" value="<?=company_name?>"</TD>
         </TR>
             <TR>
           <TD>Phone</TD>
               <TD><INPUT type="text" name="Phone" value="<?=phone_number?>"</TD>
         </TR>
             <TR><TD colspan="2"><input type="submit" name="accept" value="Accept"></TD></TR>
           </TABLE>
        </FORM>
        <!-- end of form -->

        <!-- list of entries -->

        <TABLE>
           <TR><TD>Company Name</TD><TD>Phone #</TD><TD colspan="2">Action</TD></TR>
           <!--TR><TD>CompanyName</TD><TD>Phone</TD><TD>Edit URI</TD><TD>Delete URI</TD></TR-->

           <?vsp
             for select ShipperID, CompanyName, Phone from Demo.demo.Shippers do
              {
           ?>
           <TR>
             <TD><?=CompanyName?></TD>
         <TD><?=Phone?></TD>
         <TD><a href="shippers.vsp?EDIT=<?=ShipperID?>">Edit</a></TD>
         <TD><a href="shippers.vsp?DELETE=<?=ShipperID?>">Delete</a></TD>
           </TR>
           <?vsp
              }
           ?>
        </TABLE>
        <!-- end of list -->

      </BODY>
    </HTML>
        
    ```

5.  **Final Remarks. ** The page for shippers does not have any specific
    error-handling. If there are any SQL errors produced the HTTP server
    will display the error number and the server error message. For
    example, if we trying to delete an record of a predefined shippers
    we would have a foreign key violation to which the server would
    respond:

    ``` screen
    'SQL Error S1000 DELETE statement conflicted with
      COLUMN REFERENCE constraint "Orders_Shippers_ShipVia_ShipperID"'
        
    ```

    We can, however, add PL code to handle errors and display a
    different page.

</div>

</div>
