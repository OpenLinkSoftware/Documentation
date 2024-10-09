<div>

<div>

</div>

<div>

## Name

vt_create_text_index — Add text index to an existing table

</div>

<div>

## Synopsis

<div>

|                                   |                                   |
|-----------------------------------|-----------------------------------|
| ` `**`vt_create_text_index`**` (` | in `table ` varchar ,             |
|                                   | in `col ` varchar ,               |
|                                   | in `id_col ` varchar ,            |
|                                   | in `is_xml ` integer ,            |
|                                   | in `defer_generation ` integer ,  |
|                                   | in `clustered_columns ` any ,     |
|                                   | in `use_hook_function ` integer , |
|                                   | in `language_name ` varchar ,     |
|                                   | in `encoding_name ` integer ,     |
|                                   | in `silent ` integer `)`;         |

<div>

 

</div>

</div>

</div>

<div>

## Description

The vt_create_text_index procedure adds a text index to an existing
table. There can at most be one text index per table, including super
tables and subtables.

The table argument is a string naming the table. The column is the name
of the column to index. The id_col should be the name of a unique
integer row identifier column. If null, the system will either add such
a column or use an existing integer primary key if one is available. The
is_xml argument, if non-0, specifies that the values of the indexed
column should be checked for XML well formedness and that the XML
structure should be taken into account in indexing the values.

Use the CREATE TEXT INDEX statement as an alternative to the
vt_create_text_index function.

In order for a table to be referenced in a text index it must have a
uniquely identifying integer key. If the table in question has such a
key this can be used as the id column. If there is no such column this
procedure makes one. Using a previously existing identifier column saves
space and if that is the primary key of the table this also saves in
retrieval time.

If the table being indexed has a single part integer primary key
vt_create_text_index will automatically use this as the identifier. Note
that the zero and negative numbers may not be used as identifier values.

Creating the index will read through the table's contents and generate
the index. When the table is changed the index can either be updated
after each change or periodically, depending on the application needs.
The rationale for background maintenance of the text index is that it is
up to several times more efficient to maintain a text index in batches
of several changed documents than after each single document change. The
default maintenance mode is synchronous, meaning that each insert,
delete or update of the indexed column will be immediately reflected in
the index. This mode can be set using the `vt_batch_update()` procedure.
The mode should be set to batch if there are any massive operations on
the table.

It will create two additional tables:

``` screen
 <datatable>_<datacolumn>_WORDS
    
```

and

``` screen
VTLOG_<datatable_qualifieri>_<data_table_owner>_<data_table_name>
    
```

and two procedures:

``` screen
 vt_index_<datatable_qualifier>_<data_table_owner>_<data_table_name>
        (in to_delete integer)
    
```

and

``` screen
 vt_inc_index<datatable_qualifieri>_<data_table_owner>_<data_table_name> ().
```

The table \<datatable\>\_\<datafield\>\_WORDS contains the full text
index data.

The table VTLOG\_\<datatable\>\_\<datafield\> is an update tracking
table, similar to the snapshot log table but using the key column
instead of the primary key.

<div>

|                              |                                                                                                            |
|:----------------------------:|:-----------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                      |
|                              | in the transaction semantics section that there is the sync mode for the purpose of creating a text index. |

</div>

</div>

<div>

## Parameters

<div>

### table

the table containing the data to index.

</div>

<div>

### col

the column in the data table containing the data to index (a long
varchar column).

</div>

<div>

### id_col

an integer unique indexed column used by the free text index as a key.
If Virtuoso tries to choose such a column among the existing in the
table and if it doesn't find a suitable column it adds such a column
with the name \<datacolumn\>\_ID, fills that up and makes an unique
index on it.

</div>

<div>

### is_xml

if greater than 0 installs two additional triggers before insert and
before update on the data table to ensure the data being inserted into
it are valid XML documents.

</div>

<div>

### defer_generation

if nonzero then the free-text index will not be filled by actual data
immediately after the creation. It will remain empty until explicit
request for "incremental indexing".

</div>

<div>

### clustered_columns

a vector of names of "clustered columns" or NULL to not store such data
in the index.

</div>

<div>

### use_hook_function

if nonzero, two user-defined Virtuoso/PL functions will be called when
free-text data are updated, not the default system routine. These
functions are recognized by their special names:
\<datatable\>\_\<datafield\>\_INDEX_HOOK will be called to index new
documents and \<datatable\>\_\<datafield\>\_UNINDEX_HOOK will be called
to remove obsolete index information about deleted documents.

</div>

<div>

### language_name

the name of the language that is used for building the index. If the
parameter is omitted or is equal to '\*ini\*' string, indexing routines
will use the language specified in server's configuration.

</div>

<div>

### encoding_name

the name of the encoding that is used by default to index source texts.
If the parameter is omitted or is equal to '\*ini\*' string, indexing
routines will use the encoding specified by charset of the RDBMS
connection that is in use when the index is created.

</div>

<div>

### silent

Flag with values 1/0. Default is 0. When set to 0, the function signals
error if the text index exists. If set to 1, the function signals no
error if the text index exists.

</div>

</div>

<div>

## Examples

<div>

**Example 24.448. Creating A Text Index Using FT functions**

<div>

``` programlisting
create table xml_text (xt_id integer, xt_file varchar,
            xt_text long varchar, primary key (xt_id));

create index xt_file on xml_text (xt_file);

vt_create_text_index ('xml_text',
            'xt_text', null, 1);
```

-- create a text index on xt_text with XML well formedness checking on

``` programlisting
VT_INDEX_DB_DBA_XML_TEXT (0);
```

-- populate the text index based in the data in the table.

``` programlisting
VT_inc_INDEX_DB_DBA_XML_TEXT ();
```

-- refresh the index to reflect changes to the data since the last call

-- to this function or the initial call to VT_INDEX_DB_DBA_XML_TEXT.

``` programlisting
vt_batch_update ('DB.DBA.XML_TEXT', 'on', 10);
```

-- sets the index maintenance to be asynchronous, refreshed at maximum
intervals of 10 minutes or at every scheduler cycle if the latter is
longer than 10 minutes.

``` programlisting
vt_batch_update ('DB.DBA.XML_TEXT', 'off', null);
```

-- sets the index maintenance to be synchronous, within the same
transaction

-- as the operation changing the indexed data.

</div>

</div>

  

</div>

</div>
