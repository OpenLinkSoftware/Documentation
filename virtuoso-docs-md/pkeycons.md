<div>

<div>

<div>

<div>

### 9.8.5. PRIMARY KEY Constraint

</div>

</div>

</div>

This declares a column combination that will uniquely identify each row
in the table. This automatically defines an index on these columns and
clusters the physical rows of the table together with the index entry
for this primary key index. Always specify a primary key if there is a
uniquely identifying column combination on the table. This is the case
for any normalized database. Hence virtually all tables should have the
primary key constraint. This is substantially more efficient than
defining the primary key as a unique index with CREATE INDEX. The
primary key constraint exists for the purpose of guaranteeing uniqueness
of a row and hence should be respected. A unique index is not a primary
key and should never substitute one.

<div>

**Example 9.18. Primary Key using Constraint**

<div>

This example shows how to create a table with a primary key defined in
full as a named primary key table constraint

``` programlisting
CREATE TABLE demo_table (
  id INTEGER NOT NULL,
  txtdata VARCHAR(20),
  CONSTRAINT demo_table_pk PRIMARY KEY (id)
  )
;
```

</div>

</div>

  

PRIMARY KEY is a shorthand for the PRIMARY KEY (column) table constraint
which is specified in the column definition. SQL-89 required that you
specify NOT NULL PRIMARY KEY but SQL-92 does not because primary keys
columns do not permit NULL values. This means that no members of a
combination of columns that constitute a primary key can have a NULL
value.

<div>

**Example 9.19. Primary Key shorthand**

<div>

This example shows how to create a table with a primary key defined
using shorthand:

``` programlisting
CREATE TABLE demo_table (
  id INTEGER NOT NULL PRIMARY KEY,
  txtdata VARCHAR(20),
  )
;
```

Or shorter still:

``` programlisting
CREATE TABLE demo_table (
  id INTEGER PRIMARY KEY,
  txtdata VARCHAR(20),
  )
;
```

</div>

</div>

  

If a table definition has no PRIMARY KEY clause, Virtuoso will generate
a default primary key column called "\_IDN".

<div>

|                                        |                                                                                                                                  |
|:--------------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------|
| ![\[Important\]](images/important.png) | Important                                                                                                                        |
|                                        | Always declare a primary key using the primary key table constraint. This is always more efficient than the default primary key. |

</div>

You could allow Virtuoso to generate the primary key if you simply want
an IDENTITY primary key column, however this is considered lazy and, of
course, not portable. If you already have a column or combination of
columns that could be a candidate for a primary key, taking the default
primary key from Virtuoso will reduce the overall efficiency because an
extra column will be used per row that would be redundant to the data
itself.

<div>

**Example 9.20. Default Virtuoso Primary Key**

<div>

In the absence of a PRIMARY KEY definition:

``` programlisting
CREATE TABLE SAMPLE (
  THING VARCHAR
  )
;
```

will be expanded into:

``` programlisting
CREATE TABLE SAMPLE (
  THING VARCHAR,
  _IDN INTEGER IDENTITY,
    PRIMARY KEY (_IDN)
  )
;
```

</div>

</div>

  

Tables with generated default primary keys will appear as if they have
no primary key defined. The default primary key (\_IDN) column will not
appear in the ODBC catalog calls `SQLColumns()` , `SQLStatistics()` ,
`SQLPrimaryKeys()` , `SQLColumnPrivileges()` . The column can be
explicitly referenced in SQL statements just as any other. The SQL
"SELECT \* ..." statement will omit the \_IDN column. The "INSERT INTO
TABLE VALUES (.)" statement does not expect a value for the \_IDN
column. `SQLSpecialColumns()` with the *`SQL_BEST_ROWID`* option is the
only catalog call that will return the \_IDN column.

The PRIMARY KEY option may not coexist with UNDER in a CREATE TABLE
statement because a subtable always inherits the supertable's primary
key.

<div>

|                            |                                                                              |
|:--------------------------:|:-----------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                    |
|                            | <a href="createindex.html" class="link"                                      
                              title="9.10. CREATE INDEX Statement">CREATE INDEX</a> for the index options.  |

</div>

</div>
