<div id="updatestmt" class="section">

<div class="titlepage">

<div>

<div>

## 9.18. UPDATE Statement

</div>

</div>

</div>

Existing rows (or records) are changed in the database using the UPDATE
statement.

NULL values can be utilized using the `NULL` keyword without any quotes.
Since NULL is a special keyword you do not need to enclose it in single
quotes, doing so will cause it be read as a string-literal.

The update statement is made up by selecting the table to update, the
search condition that identifies which rows you want to update, and the
`column=value` of each column you wish to change.

<div id="ex_updatestatement" class="example">

**Example 9.30. Basic Update Statement**

<div class="example-contents">

A table can be updated using:

``` screen
update demo.dba.employees e
  set username = 'thing'
  where email_address = 'thing@thingdom.com'
  ;
```

</div>

</div>

  

<div id="ex_updatestatementfrom" class="example">

**Example 9.31. Update from Select**

<div class="example-contents">

It is possible to update one table based on a select from another table.
Ensure that the selection is properly conditioned to update.

``` screen
update demo.dba.employees e
    set username = (select U_NAME from DB.DBA.SYS_USERS u where u.U_EMAIL = e.email_address)
    ;
```

</div>

</div>

  

</div>
