<div>

<div>

</div>

<div>

## Name

ft_set_file — associates table with tabular data structure represented
by CSV document content with external CSV file.

</div>

<div>

## Synopsis

<div>

|                                 |                                          |
|---------------------------------|------------------------------------------|
| `varchar `**`ft_set_file`**` (` | in `tb ` varchar ,                       |
|                                 | in `fname ` varchar ,                    |
|                                 | in `delimiter ` varchar ,                |
|                                 | in `newline ` varchar (default '\n') ,   |
|                                 | in `esc ` varchar (default NULL) ,       |
|                                 | in `skip_rows ` integer (default 0) `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Associates table with tabular data structure represented by CSV document
content with external CSV file.

</div>

<div>

## Parameters

<div>

### tb

The name of the table that has tabular data structure represented by CSV
document content.

Note that there is no special object type for File Tables corresponding
to the tabular data structure represented by the CSV document content.
To create a File Table, a user must have DBA group privileges. In
addition, access to the referenced file is subject the same file system
access functions (e.g., <a href="fn_file_to_string.html" class="link"
title="file_to_string"><code class="function">file_to_string</code></a>
and `DirsAllowed` INI file settings) that govern the whole Virtuoso
instance.

The text in each field is parsed according to the data type declared for
the column whose position in the CREATE TABLE statement corresponds to
that field's position on the line. The parsing is as by the SQL CAST
function from a VARCHAR value. If the CAST fails, the line is silently
ignored.

</div>

<div>

### fname

External CSV file name

</div>

<div>

### delimiter

Delimiter to be used.

Each column in the CSV file is expected to end with the delimiter
character. A field of zero length is considered a SQL `NULL` value;
i.e., if two delimiters are adjacent, the field is considered `NULL` .
Likewise, if a line begins with the delimiter, the first field is
considered `NULL` .

</div>

<div>

### newline

Set new line encoding. By default is '\n'.

</div>

<div>

### esc

Set escape character. By default is NULL.

The newline and escape characters must be single character strings. A
newline or escape character following the escape character will be added
to the parsed input as a literal character, without its special
interpretation.

</div>

<div>

### skip_rows

Use to skip n rows from the begining. By default is 0. When set to 1 for
ex., treats the first row as header and skips it. When set to 2 skips 2
rows etc.

</div>

</div>

<div>

## Examples

<div>

**Example 24.115. Using a Table as a Placeholder for CSV Attachment**

<div>

In this example a SQL TABLE is created and then associated with an
external CSV file. This file is situated in a host operating system
location that is accessible to the Virtuoso instance using relative (to
instance .db file) or full path file name reference (constrained by
`DirsAllowed` entry in `Virtuoso INI ` ).

CSV filename: contacts.csv (which can also be referred to as
file:contacts.csv) .

File Content:

``` screen
Id,Fname,Sname,Age
0,John,Smith,48
1,Anna,Clarks,62
2,Rojer,Danrette,27
3,Kate,Sigton,56
4,Tim,Craft,41
```

CSV File to SQL Table association steps:

<div>

1.  CREATE an empty TABLE , using the SQL command:

    ``` screen
    CREATE TABLE csv.tutorial.contacts
      (
        Id INTEGER NOT NULL,
        Fname VARCHAR(20),
        Sname VARCHAR(20),
        Age INTEGER,
        CONSTRAINT demo_table_pk PRIMARY KEY (Id)
      );
    ```

    <div>

    1.  Notes:

        <div>

        1.  There is no special object type for File Tables
            corresponding to the tabular data structure represented by
            the CSV document content;

        2.  To create a File Table, a user must have DBA group
            privileges. In addition, access to the referenced file is
            subject the same file system access functions (e.g.,
            file_to_string and DirsAllowed INI file settings) that
            govern the whole Virtuoso instance.

        </div>

    </div>

2.  Use Virtuoso
    <a href="fn_ft_set_file.html" class="link" title="ft_set_file"><code
    class="function">ft_set_file</code></a> function to associate the
    above newly created internal TABLE (first procedure argument) with
    the external CSV file (second procedure argument, in the form of a
    file name relative to the Virtuoso instance); optional arguments may
    be used to specify delimiter, newline, and escape characters,
    respectively:

    ``` screen
    ft_set_file ('csv.tutorial.contacts', 'contacts.csv', ',', 1) ;
    ```

    <div>

    1.  Notes:

        <div>

        1.  The text in each field is parsed according to the data type
            declared for the column whose position in the CREATE TABLE
            statement corresponds to that field's position on the line.
            The parsing is as by the SQL CAST function from a VARCHAR
            value. If the CAST fails, the line is silently ignored.

        2.  The newline and escape characters must be single character
            strings. A newline or escape character following the escape
            character will be added to the parsed input as a literal
            character, without its special interpretation.

        3.  Each column in the CSV file is expected to end with the
            delimiter character. A field of zero length is considered a
            SQL NULL value; i.e., if two delimiters are adjacent, the
            field is considered NULL. Likewise, if a line begins with
            the delimiter, the first field is considered NULL.

        </div>

    </div>

3.  Check the inserted data in the csv.tutorial.contacts table:

    ``` screen
    SQL>SELECT * FROM csv.tutorial.contacts;

    Id                Fname     Sname       F_AGE
    INTEGER NOT NULL  VARCHAR   VARCHAR     INTEGER
    ______________________________________________________________________

    0                 John      Smith       48
    1                 Anna      Clarks      62
    2                 Rojer     Danrette    27
    3                 Kate      Sigton      56
    4                 Tim       Craft       41

    5 Rows. -- 15 msec.
    ```

</div>

</div>

</div>

  

</div>

<div>

## See Also

<a href="sqlbulkloadoperations.html" class="link"
title="9.35. SQL Bulk Load, ELT, File Tables and Zero Load Operations">File
Tables</a>

<a href="fn_file_delete.html" class="link" title="file_delete"><code
class="function">file_delete </code></a>

<a href="fn_ttlp.html" class="link" title="DB.DBA.TTLP"><code
class="function">DB.DBA.TTLP </code></a>

<a href="fn_ttlp_mt.html" class="link" title="DB.DBA.TTLP_MT"><code
class="function">DB.DBA.TTLP_MT </code></a>

<a href="fn_ttlp_mt_local_file.html" class="link"
title="DB.DBA.TTLP_MT_LOCAL_FILE"><code
class="function">DB.DBA.TTLP_MT_LOCAL_FILE </code></a>

</div>

</div>
