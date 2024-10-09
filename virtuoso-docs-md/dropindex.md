<div>

<div>

<div>

<div>

## 9.11. DROP INDEX Statement

</div>

</div>

</div>

``` programlisting
drop_index
    : DROP INDEX NAME opt_table
    ;

opt_table
    : /* empty */
    | q_table_name
    ;
```

This will drop an index, dba privileges or table ownership are required.
A table's primary key which has the same name as the table can not be
dropped.

Optionally, a table name can be given if the index name is not unique.
The table name may be qualified.

</div>
