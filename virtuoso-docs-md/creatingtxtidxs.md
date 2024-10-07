<div id="creatingtxtidxs" class="section">

<div class="titlepage">

<div>

<div>

## 20.2. Creating Free Text Indexes

</div>

</div>

</div>

<div id="createtxtidxstmt" class="section">

<div class="titlepage">

<div>

<div>

### 20.2.1. The CREATE TEXT INDEX statement

</div>

</div>

</div>

Define and optionally initialize a text index on a column.

``` programlisting
create_freetext_index
    : CREATE TEXT [XML] INDEX ON q_table_name '(' column ')'
    [WITH KEY column]
    [NOT INSERT]
    [CLUSTERED WITH '(' column_commalist ')' ]
    [USING FUNCTION]
    [LANGUAGE STRING]
  [ENCODING STRING]
    ;
```

<span class="emphasis">*XML*</span> - The XML keyword specifies that the
data is to be indexed as XML, hence element names and attributes will be
processed separately for use with the XCONTAINS predicate.

The <span class="emphasis">*q_table_name*</span> is a qualified table
name on which the index is created. The generated procedures and
auxiliary tables will be with the owner and qualifier of this table.

The <span class="emphasis">*column*</span> must be a column of the above
table, of the VARCHAR, NVARCHAR, LONG VARCHAR, LONG NVARCHAR, LONG XML
or XMLTYPE data type. The column may additionally have the IDENTIFIED BY
option if the content is XML. This will be used to provide a base URI
for traversing relative references. The XML option for the index has to
be specified if the content is LONG XML or XMLTYPE.

<span class="emphasis">*WITH KEY column*</span> - This allows optionally
specifying a uniquely identifying column which will be used as a foreign
key for referencing the table from the text index. If this is not
specified and there is a single part integer primary key, this primary
key is used as the key. If there is no suitable primary key and the
option is not present, an integer column is added and a sequence object
is used to supply distinct values.

When specified, the column must be non-NULL and its run time value must
either be an integer or a composite (See composite data type). The
length of the values of this column is crucially important since it is
repeated for each distinct word of each row. This column is called the
free text document id column in the rest of this documentation.

<span class="emphasis">*NOT INSERT*</span> - If present, specifies that
the index is not filled when created. The VT_INDEX\_\<table\> function
is still created but not run. You can run this manually or scheduled at
an appropriate time. If batching is enabled then the index will be
filled up at that time.

<span class="emphasis">*CLUSTERED WITH*</span> - The column list must
consist of columns of the table. Their values are stored in the text
index so that the values can be more efficiently located for filtering
than if they had to be retrieved from the table itself. The combined
length of the columns should be relatively small, not much over 200
bytes for this to be effective. There is no hard upper limit but long
blobs are not advisable.

<span class="emphasis">*USING FUNCTION*</span> - This allows specifying
a hook function for indexing an unindexing a document. The index hook is
called before processing the words of the column to be indexed. This can
be used to index extra text in addition to the column value or to modify
the text before indexing. If the hook function returns 1 the column is
not additionally processed. If hook returns 0 the column is processed
normally, in addition to the words the hook may have inserted. See the
section on hook functions. The hook functions are always named
\<table\>\_\<column\>\_INDEX_HOOK and
\<table\>\_\<column\>\_UNINDEX_HOOK, in the owner and qualifier of the
table, where \<table\> is the unqualified name of the table.

<span class="emphasis">*LANGUAGE*</span> - The string literal following
this keyword may be a language name. See
<a href="ftinternationalization.html" class="link"
title="20.8. Internationalization &amp; Unicode">Internationalization</a>
for details.

<span class="emphasis">*ENCODING*</span> - The string literal following
this keyword may be an encoding name.

Creating the text index may take a long time. All this time is in
'atomic' mode, so no other database activity is allowed during it and no
log is generated. If there is an error, e.g. out of disk the created
index is dropped and the error is reported. A checkpoint should be made
after the index is complete. If the index should be created under a
different qualifier or the generated tables altered after the index is
created the NOT INSERT option should be used to delay filling the index.

The <a href="creatingtxtidxs.html#createtxtidxstmt" class="link"
title="20.2.1. The CREATE TEXT INDEX statement">CREATE TEXT INDEX</a>
statement will automatically make a unique index based on the free text
document id, if this is not the PK of the table. If one wishes to modify
this index, it can be found and dropped with DROP INDEX and
reconstructed, but make sure that the reference in SYS_VT_INDEX matches
and that the new index has the same name as the previous version.

A freshly created text index is in synchronous mode. This means that
that changes to the table are immediately reflected on the index as they
occur. This is done through a set of automatically generated triggers.
If large changes to data will be performed, the
<a href="ftperformance.html" class="link"
title="20.9. Performance">batch mode</a> is far more efficient.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                                        |
|:--------------------------:|:-----------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                                              |
|                            | Although it is recommended to use the methods described above, the <a href="fn_vt_create_text_index.html" class="link" 
                              title="vt_create_text_index">vt_create_text_index</a> function can also be used                                         |

</div>

</div>

</div>
