<div id="under" class="section">

<div class="titlepage">

<div>

<div>

### 9.8.6. UNDER

</div>

</div>

</div>

This allows the user to create a table as a sub-table of an existing
table. A sub-table will inherit all columns and constraints of its
super-table, most importantly the primary key. Primary keys shall be
unique in the set of rows belonging to any direct or indirect sub-table
of one super-table. A select from a super-table will see all rows,
including those of any sub-tables, but not vice versa. Rows inserted
directly into the super-table will not be visible to sub-tables.

The primary key option may not coexist with UNDER, since a subtable
always inherits the supertable's primary key.

<div id="ex_under" class="example">

**Example 9.21. Creating sub-tables using UNDER**

<div class="example-contents">

Here a subtable will be created for the demo_table defined earlier. Both
definitions are listed for convenience. Notice that the select over the
sub-table (demo_sub_table) lists all columns whereas the select from
super-table does not, however rows inserted into the super-table,
demo_table, will not be seen in a select from the sub-table, but rows
inserted into the sub-table will be shown in a select from the
super-table.

``` programlisting
CREATE TABLE demo_table (
  id INTEGER PRIMARY KEY,
  txtdata VARCHAR(20),
  )
;

CREATE TABLE demo_sub_table (
  new_col VARCHAR(10),
  UNDER demo_table
  )
;

SQL> select * from demo_table;
id                txtdata
INTEGER NOT NULL  VARCHAR
____________________________________________________________________

0 Rows. -- 20 msec.

SQL> select * from demo_sub_table;
id                txtdata               new_col
INTEGER NOT NULL  VARCHAR               VARCHAR
____________________________________________________________________

0 Rows. -- 10 msec.
```

</div>

</div>

  

</div>
