<div>

<div>

<div>

<div>

## 9.12. ALTER TABLE Statement

</div>

</div>

</div>

``` programlisting
add_column:
            ALTER TABLE q_table_name ADD opt_col_add_column add_col_column_def_list
          | ALTER TABLE q_table_name DROP opt_col_add_column add_col_column_list
          | ALTER TABLE q_table_name MODIFY opt_col_add_column column_def

add_col_column_def_list: column_def
                       | add_col_column_def_list &apos;,&apos; column_def

add_col_column_list: column
                   | add_col_column_list &apos;,&apos; column

table_rename:
            ALTER TABLE q_table_name RENAME new_table_name

alter_constraint:
            ALTER TABLE q_table_name constraint_op opt_table_constraint_def

constraint_op: ADD
             | DROP
             | MODIFY

opt_drop_behavior: /* empty */
                 | CASCADE
                 | RESTRICT

opt_table_constraint_def: CONSTRAINT identifier opt_drop_behavior
                        | table_constraint_def

view_query_spec: query_exp
               | query_no_from_spec

alter_table
    : ALTER TABLE q_table_name ADD opt_col_add_column add_col_column_def_list

    | ALTER TABLE q_table_name DROP opt_col_add_column add_col_column_list

    | ALTER TABLE q_table_name MODIFY opt_col_add_column column_def

    | ALTER TABLE q_table_name RENAME new_table_name

    | ALTER TABLE <table> ADD | DROP | MODIFY <constraint> [<constraint-name>]

<constraint> ::=
    : PRIMARY KEY '(' <column list> ')'
    | FOREIGN KEY '(' <column list> ')' <references>
    | CHECK ( search-condition )

<references> ::=
   REFERENCES <table> ['(' <column list> ')' ] <OPTIONS>

<OPTIONS>  ::=
   [ON UPDATE OPT_ACTION] [ON DELETE OPT_ACTION]
```

The ALTER TABLE statement adds or drops columns and renames tables.

Adding or dropping a column of a table will create a new version of the
table's schema entry. The rows of the altered table will be changed to
conform to the new definition when next updated. All newly inserted rows
will be in the new row layout. This means that ALTER TABLE itself
executes in fixed time without locking the table. The time to update the
actual data will be spread over subsequent updates.

An added column will have a NULL value on those rows where the new
column has not been set. A possible default will only apply to newly
inserted rows.

When dropping a column one can execute a statement of the form UPDATE
\<table\> SET \<key\> = \<key\> to force the physical change, causing
space associated with the dropped column to be freed.

The column_def in the ADD clause may specify any column options, except
PRIMARY KEY.

If the table name is not fully qualified it is completed as in any table
reference. The new name in the RENAME clause is defaulted to the current
qualifier and user account, as in a CREATE TABLE.

A primary key may only be modified, never dropped or added. Tables
always have exactly one primary key.

The first unique index of an empty table becomes the primary key. This
may thereafter not be dropped.

The primary key of an attached table may not be changed.

Foreign keys can be added. Dropping a foreign key will drop all foreign
keys between the foreign key and primary key tables.

ALTER TABLE cannot be applied to an attached table.

<div>

**Example 9.27. ALTER TABLE Examples**

<div>

``` programlisting
ALTER TABLE DISTRICT
    add D_SALES_MGR integer not null references EMPLOYEES (E_ID);

ALTER TABLE idt MODIFY PRIMARY KEY (K1, K2);

ALTER TABLE idt ADD FOREIGN KEY (d) REFERENCES idt (d);

ALTER TABLE idt ADD FOREIGN KEY (k2, k1) REFERENCES idt;

ALTER TABLE idt DROP FOREIGN KEY (d) REFERENCES idt (d);
```

</div>

</div>

  

<div>

<div>

<div>

<div>

### 9.12.1. Adding a CHECK Constraint

</div>

</div>

</div>

A CHECK constraint can be added to a table after it has been created and
populated providing that none of the tables contents would violate the
constraint.

<div>

**Example 9.28. Adding a CHECK constraint to an existing table.**

<div>

``` programlisting
CREATE TABLE test_add_check (
  name VARCHAR,
  age INTEGER
  )
;

ALTER TABLE test_add_check ADD CONSTRAINT chkage CHECK (age > 18);
```

</div>

</div>

  

<div>

|                            |                                                                |
|:--------------------------:|:---------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                      |
|                            | <a href="sqlrefcreattablecheck.html" class="link" shape="rect" 
                              title="9.8.8. The CHECK Constraint">The CHECK constraint</a>    |

</div>

</div>

</div>
