<div>

<div>

<div>

<div>

## 9.9. DROP TABLE Statement

</div>

</div>

</div>

``` programlisting
drop_table
    : DROP TABLE q_table_name
    ;
```

This statement drops a table. This requires dba privileges or ownership
of the table. Any subtables are automatically dropped. Supertables are
not affected.

</div>
