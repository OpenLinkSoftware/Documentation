<div id="createindex" class="section">

<div class="titlepage">

<div>

<div>

## 9.10. CREATE INDEX Statement

</div>

</div>

</div>

``` programlisting
index_column_commalist
    : column opt_asc_desc
    | index_column_commalist ',' column opt_asc_desc
    ;

index_option
    : CLUSTERED
    | UNIQUE
    ;

index_option_list
    : index_option
    | index_option_list index_option
    ;

opt_index_option_list
    : /* empty */
    | index_option_list
    ;

create_index_def
    : CREATE opt_index_option_list INDEX index
        ON new_table_name '(' index_column_commalist ')'
    ;
```

This creates an index on a table. Index names must be unique across a
qualifier. The ascending / descending column attributes are recognized
for compatibility but do not have any effect. The index is defined and
populated at the execution of the statement. Pre-existing stored
procedures and prepared statements will make use of the new index when
appropriate.

The UNIQUE attribute enforces uniqueness of the specified columns across
the table and subtables where the index is visible.

The CLUSTERED attribute is not recommended. It will cause keys to be
unprefixed by key id, thus causing the key entries to be intermixed with
entries of other CLUSTERED indices with adjacent values of key parts.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                 |
|:--------------------------:|:--------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See:                                                                            |
|                            | See the <a href="webdavadmin.html#freetext" class="link" title="Free Text">Free 
                              Text</a> section on creating free text indices.                                  |

</div>

</div>
