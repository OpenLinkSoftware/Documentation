<div id="fn_attach_from_csv" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

attach_from_csv — Attaches CSV files as virtual tables in Virtuoso.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_attach_from_csv" class="funcsynopsis">

|                              |                                            |
|------------------------------|--------------------------------------------|
| ` `**`attach_from_csv`**` (` | in `tb ` varchar ,                         |
|                              | in `fname ` any ,                          |
|                              | in `delimiter ` varchar (default '') ,     |
|                              | in `newline ` varchar (default '\n') ,     |
|                              | in `esc ` varchar (default null) ,         |
|                              | in `skip_rows ` int (default 1) ,          |
|                              | in `pkey_columns ` any (default null) `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_attach_from_csv" class="refsect1">

## Description

This function attaches CSV files as virtual tables in Virtuoso, enabling
them to be queried as if local to the Virtuoso database schema.

</div>

<div id="params_attach_from_csv" class="refsect1">

## Parameters

<div id="id89606" class="refsect2">

### tb

Name of the Virtuoso SQL table to be associated with the attached CSV
file

</div>

<div id="id89609" class="refsect2">

### fname

Name of the CSV file, which must be situated in a file system location
within the scope of 'DirsAllowed' INI setting, in one of the following
forms:

<div class="itemizedlist">

- 'contacts.csv' -- relative path, here assuming a file in the 'pwd' of
  the Virtuoso instance

- '/tmp/contacts.csv' -- absolute path, here assuming a file located in
  the '/tmp' folder/directory

- 'file:contacts.csv' or 'file:/tmp/contacts.csv' -- these common forms
  of incorrect file: scheme URIs are treated as simple (absolute or
  relative) paths

- 'file:///tmp/contacts.csv' -- absolute path, using file: scheme URI
  based identification (implementation in progress)

</div>

</div>

<div id="id89621" class="refsect2">

### delimiter

Specifies a single character to be treated as the field delimiter.

</div>

<div id="id89624" class="refsect2">

### newline

Specifies a single character to be treated as newline.

</div>

<div id="id89627" class="refsect2">

### esc

Specifies a single character to be treated as escape.

</div>

<div id="id89630" class="refsect2">

### skip_rows

Specifies a number of rows to be ignored as instance data. Default is
'1', this typically being the CSV header row.

</div>

<div id="id89633" class="refsect2">

### pkey_columns

Specifies which ordinal column(s) of the CSV to use as the primary key
of the virtual table.

<div class="orderedlist">

1.  By default, this parameter value is null, and the virtual table will
    have no primary key.

2.  For a simple primary key, based on a single CSV column, this
    parameter should be set to that column's ordinal value (first column
    = 1, second column = 2, etc.).

3.  For a compound primary key, comprised of multiple CSV columns, this
    parameter should be set to a vector. For example, for a primary key
    comprised of ordinal columns 1 and 3, the parameter value should be
    vector(1,3) .

</div>

</div>

</div>

<div id="errors_attach_from_csv" class="refsect1">

## Errors

Issues associated with CSV file structure, in regards to virtual table
creation suitability, will be reported back as errors.

</div>

<div id="examples_attach_from_csv" class="refsect1">

## Examples

<div id="ex_attach_from_csv_1" class="example">

**Example 24.125. Simplified CSV File Attachment**

<div class="example-contents">

This example demonstrates how to directly attach external CSV file to
Virtuoso that functions like any other internal TABLE:

<div class="orderedlist">

1.  Create CSV file named `contacts1.csv `:

    ``` programlisting
    $ cat > contacts1.csv
    Id,Fname,Sname,Age
    0,John,Smith,48
    1,Anna,Clarks,62
    2,Rojer,Danrette,27
    3,Kate,Sigton,56
    4,Tim,Craft,41
    ```

2.  Place the created `contacts1.csv` file within scope of `DirsAllowed`
    INI setting.

3.  Call the attach_from_csv function from iSQL or Virtuoso Conductor UI
    ( http://host:port/conductor ) . Note: As the pkey_columns parameter
    value is not specified, by default the virtual table will have no
    Primary Key:

    ``` programlisting
    SQL> attach_from_csv ('csv.tutorials.contacts1', 'file:contacts1.csv', ',', '\n', null, 1);
    Done. -- 109 msec.
    ```

4.  Check the inserted data in the csv.tutorials.contacts1 table:

    ``` programlisting
    SQL> SELECT * FROM csv.tutorials.contacts1 ;
    Id          Fname         Sname       Age
    INTEGER     VARCHAR       VARCHAR     INTEGER
    _____________________________________________________

    0           John          Smith       48
    1           Anna          Clarks      62
    2           Rojer         Danrette    27
    3           Kate          Sigton      56
    4           Tim           Craft       41

    5 Rows. -- 78 msec.
    ```

5.  Check the Primary Key columns:

    ``` programlisting
    SQL> primarykeys csv.tutorials.contacts1;
    Showing SQLPrimaryKeys of tables like 'csv.tutorials.contacts1', tabletype/colname like 'NULL'
    TABLE_QUALIFIER  TABLE_OWNER  TABLE_NAME   COLUMN_NAME   KEY_SEQ   PK_NAME  ROOT_QUALIFIER  ROOT_OWNER  ROOT_NAME
    VARCHAR          VARCHAR      VARCHAR      VARCHAR       SMALLINT  VARCHAR  VARCHAR         VARCHAR     VARCHAR
    __________________________________________________________________________________________________________________

    0 Rows. -- 47 msec.
    ```

</div>

</div>

</div>

  

<div id="ex_attach_from_csv_2" class="example">

**Example 24.126. Simplified CSV File Attachment with Compound Key
Generation**

<div class="example-contents">

In this example a CSV File System is not only attached to Virtuoso, but
as part of the process a Primary Key is generated using the first and
second ordinal columns from the CSV file content:

<div class="orderedlist">

1.  Create CSV file named `contacts2.csv`:

    ``` programlisting
    $ cat > contacts2.csv
    Fname,Sname,Age
    John,Smith,48
    Anna,Clarks,62
    Rojer,Danrette,27
    Kate,Sigton,56
    Tim,Craft,41
    ```

2.  Place the created `contacts2.csv` file within scope of `DirsAllowed`
    INI setting.

3.  Call the attach_from_csv function from iSQL or Virtuoso Conductor UI
    ( http://host:port/conductor ):

    ``` programlisting
    SQL> attach_from_csv ('csv.tutorials.contacts2', 'file:contacts2.csv', ',', '\n', null, 1, vector(1,2));
    Done. -- 109 msec.
    ```

4.  Check the inserted data in the csv.tutorials.contacts2 table:

    ``` programlisting
    SQL> SELECT * FROM csv.tutorials.contacts2 ;
    Fname         Sname       Age
    VARCHAR       VARCHAR     INTEGER
    _____________________________________________________

    John          Smith       48
    Anna          Clarks      62
    Rojer         Danrette    27
    Kate          Sigton      56
    Tim           Craft       41

    5 Rows. -- 78 msec.
    ```

5.  Check the Primary Key columns:

    ``` programlisting
    SQL> primarykeys csv.tutorials.contacts2;
    Showing SQLPrimaryKeys of tables like 'csv.tutorials.contacts2', tabletype/colname like 'NULL'
    TABLE_QUALIFIER  TABLE_OWNER  TABLE_NAME               COLUMN_NAME  KEY_SEQ   PK_NAME                  ROOT_QUALIFIER  ROOT_OWNER  ROOT_NAME
    VARCHAR          VARCHAR      VARCHAR                  VARCHAR      SMALLINT  VARCHAR                  VARCHAR         VARCHAR     VARCHAR
    ____________________________________________________________________________________________________________________________________________

    DB               DBA          csv.tutorials.contacts2  Fname        1         csv.tutorials.contacts2  DB              DBA         csv.tutorials.contacts2
    DB               DBA          csv.tutorials.contacts2  Sname        2         csv.tutorials.contacts2  DB              DBA         csv.tutorials.contacts2

    2 Rows. -- 32 msec.
    ```

</div>

</div>

</div>

  

<div id="ex_attach_from_csv_3" class="example">

**Example 24.127. Simplified CSV File Attachment with Composite Key
Generation**

<div class="example-contents">

In this example a CSV File System is not only attached to Virtuoso, but
as part of the process a Primary Key is generated using the second
(`CompanyID` ), third (`Fname` ) and forth (`Sname` ) ordinal columns.
In this example the CompanyID column (which uniquely identifies a
company) is combined with the `Fname` and `Sname` columns to create a
primary key for each contact:

<div class="orderedlist">

1.  Create CSV file named `contacts3.csv`:

    ``` programlisting
    $ cat > contacts3.csv
    CompanyName,CompanyID,Fname,Sname,Age
    MLogistic,12,John,Smith,48
    ZiAirLines,13,Anna,Clarks,62
    MLogistic,12,Rojer,Danrette,27
    MLogistic,12,Kate,Sigton,56
    ZiAirLines,13,Tim,Craft,41
    ```

2.  Place the created `contacts3.csv` file within scope of `DirsAllowed`
    INI setting.

3.  Call the attach_from_csv function from iSQL or Virtuoso Conductor UI
    ( http://host:port/conductor ):

    ``` programlisting
    SQL> attach_from_csv ('csv.tutorials.contacts3', 'file:contacts3.csv', ',', '\n', null, 1, vector (2,3,4));
    Done. -- 109 msec.
    ```

4.  Check the inserted data in the csv.tutorials.contacts3 table:

    ``` programlisting
    SQL> SELECT * FROM csv.tutorials.contacts3 ;
    CompanyName     CompanyID   Fname     Sname       Age
    VARCHAR           INTEGER     VARCHAR   VARCHAR     INTEGER
    ___________________________________________________________

    MLogistic       12          John      Smith       48
    ZiAirLines      13          Anna      Clarks      62
    MLogistic       12          Rojer     Danrette    27
    MLogistic       12          Kate      Sigton      56
    ZiAirLines      13          Tim       Craft       41

    5 Rows. -- 78 msec.
    ```

5.  Check the Primary Key columns:

    ``` programlisting
    SQL> primarykeys csv.tutorials.contacts3;
    Showing SQLPrimaryKeys of tables like 'csv.tutorials.contacts3', tabletype/colname like 'NULL'
    TABLE_QUALIFIER  TABLE_OWNER  TABLE_NAME               COLUMN_NAME  KEY_SEQ    PK_NAME                  ROOT_QUALIFIER   ROOT_OWNER  ROOT_NAME
    VARCHAR          VARCHAR      VARCHAR                  VARCHAR      SMALLINT   VARCHAR                  VARCHAR          VARCHAR     VARCHAR
    ___________________________________________________________________________________________________________________________________

    DB               DBA          csv.tutorials.contacts3  CompanyID    1          csv.tutorials.contacts3  DB               DBA         csv.tutorials.contacts3
    DB               DBA          csv.tutorials.contacts3  Fname        2          csv.tutorials.contacts3  DB               DBA         csv.tutorials.contacts3
    DB               DBA          csv.tutorials.contacts3  Sname        3          csv.tutorials.contacts3  DB               DBA         csv.tutorials.contacts3

    3 Rows. -- 47 msec.
    ```

</div>

</div>

</div>

  

</div>

<div id="seealso_attach_from_csv" class="refsect1">

## See Also

<a href="fn_get_csv_row.html" class="link" title="get_csv_row"><code
class="function">get_csv_row </code></a>

<a href="fn_csv_load_file.html" class="link" title="csv_load_file"><code
class="function">csv_load_file </code></a>

<a href="fn_csv_parse.html" class="link" title="csv_parse"><code
class="function">csv_parse </code></a>

<a href="fn_csv_cols_def.html" class="link" title="csv_cols_def"><code
class="function">csv_cols_def </code></a>

<a href="fn_csv_table_def.html" class="link" title="csv_table_def"><code
class="function">csv_table_def </code></a>

</div>

</div>
