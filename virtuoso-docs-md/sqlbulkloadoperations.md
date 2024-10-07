<div id="sqlbulkloadoperations" class="section">

<div class="titlepage">

<div>

<div>

## 9.35. SQL Bulk Load, ELT, File Tables and Zero Load Operations

</div>

</div>

</div>

<div id="sqlbulkloadoperationsftable" class="section">

<div class="titlepage">

<div>

<div>

### 9.35.1. File Tables

</div>

</div>

</div>

Virtuoso supports mapping files of comma separated values as tables from
version 7.00.3206. This makes bulk load of relational data
straightforward and very fast. This also makes it possible to query data
in files without any loading into the database. The latter is specially
convenient if data is queried just once, where loading and subsequently
dropping the data would be needless overhead. Also arbitrary ETL
transformations can be expressed in SQL, reading from a file table and
inserting into a database table. This includes the whole range of SQL
functionality, including intermediate aggregations and the like.

This feature deprecates the CSV load functions in previous versions,
e.g. csv_load.

Queries can freely mix file tables and regular tables. Joins with file
tables make hash join plans where the smaller file is copied into a
memory resident hash table. For very large hash tables, partitioned hash
join can be used, thus arbitrary joining between files is possible, fast
and convenient.

A file table is declared with a regular create table statement. If the
table definition includes a primary key, the file is assumed to be
sorted as declared. In most cases a primary key should not be declared
when creating a file table. After the create table statement, the
procedure fs_set_file declares that the table is in fact a file. In a
cluster setting the file should be visible to all the server processes
via a shared file system.

For example, to bulk load the TPC-H part table:

``` programlisting
CREATE TABLE PART_F (
    P_PARTKEY     INTEGER NOT NULL,
    P_NAME        VARCHAR(55) NOT NULL,
    P_MFGR        CHAR(25) NOT NULL,
    P_BRAND       CHAR(10) NOT NULL,
    P_TYPE        VARCHAR(25) NOT NULL,
    P_SIZE        INTEGER NOT NULL,
    P_CONTAINER   CHAR(10) NOT NULL,
    P_RETAILPRICE double precision NOT NULL,
    P_COMMENT     VARCHAR(23) NOT NULL    );

ft_set_file ('PART_F', 'src/part.tbl', delimiter => '|');

-- turn off logging and set insert mode to auto committing, non-transactional
log_enable (2);

-- read the file and insert into the previously create part table
insert into part select * from part_f;
```

The ft_set_file procedure takes the table name as first argument and a
file system path relative to the server's working directory as the
second argument. Optional arguments allow specifying a delimiter,
newline character and escape character.

``` programlisting
    create procedure ft_set_file (in tb varchar, in fname varchar, in delimiter varchar, in newline varchar :=  '\n', in esc varchar := null)
```

Creating a file table requires dba group privileges and the file is
subject to the file system access limitations that apply to
file_to_string and other file system access functions.

The newline and escape characters need to be single character strings. A
newline or escape character following the escape character is added to
the parsed input without its special interpretation.

Each column in the CSV file is expected to end with the delimiter
character. A field of zero length is considered a SQL NULL value, i.e.
if two delimiters are adjacent or if a line begins with the delimiter,
the field is considered NULL. The text in the field is parsed according
to the data type declared for the column whose position in the create
table corresponds to the field position on the line. The parsing is as
by the SQL cast function from a varchar value. If the cast fails the
line is silently ignored.

When a table is declared as a file table, the file is sampled and
statistics are written into the sys_col_stat table. In this way the
system is capable of making correct query plans involving joins of file
tables. For this reason, the file should exist and have the relevant
content when the file table is created.

A file table will be read in parallel on multiple threads if a normal
table would be read in parallel in the same situation. In a single
server, the ThreadsPerQuery (enable_qp in sys_stat) setting controls the
number of threads used. In a cluster setting each elastic slice
corresponds to a fraction of the file. This is why the file is expected
to be visible from all the servers.

If a table had previous content and subsequently was declared a file
table, the previous content will no longer be visible. The file table
may cease to be a file table by the dba deleting the corresponding row
from sys_file_table and calling \_\_ddl_changed on the file table. At
this point the previous, databases resident content of the table will be
visible again. However the statistics gathered from the file will still
shadow the statistics of the table.

It is often the case that many CSV files have the same structure. For
these cases it is sufficient to create a single table and attach it to
one of the files with ft_set_file. This file will provide the
statistics. In order to read a different file, one can use the FROM
clause in the TABLE OPTION clause of in the FROM clause of a select
statement, as follows:

``` programlisting
-- get the count of well formed part rows from the part.tbl file
SELECT COUNT (*)
  FROM part_f;

-- do the same from src/part.tbl.2
SELECT COUNT (*)
  FROM part_f TABLE OPTION (FROM 'src/part.tbl.2');
```

The value of the FROM option can be an arbitrary expression, however it
must be independent of values bound by the containing statement. It may
depend on variables bound in an enclosing stored procedure or from
parameters but it cannot join to a column of another table in the same
select statement.

Arbitrary search conditions can be applied to file tables, for example:

``` programlisting
SELECT p_name, p_size, p_partkey
  FROM part_f
 WHERE p_name LIKE '%green%';
```

Joins are possible, for example:

``` programlisting
SELECT SUM (ps_availqty)
  FROM partsupp, part_f
 WHERE ps_partkey = p_partkey
   AND p_name LIKE '%green%';
```

This would join the partsupp table to the part file.

File tables are not cached by the DBMS, they are read from the OS every
time they are needed. A single query will not read the same file
multiple times, unless in the case of a partitioned (multtipass) hash
join. Nested loop joins are not applied to file tables. File tables
cannot be updated and no transaction control applies to them. Select
permissions can be granted as for any other table.

</div>

</div>
