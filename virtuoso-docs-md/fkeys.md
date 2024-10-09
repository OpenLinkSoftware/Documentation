<div>

<div>

<div>

<div>

### 9.8.7. FOREIGN KEY Constraint

</div>

</div>

</div>

A FOREIGN KEY is a column of combination of columns used to retrieve a
related row from a related table. These reference constraints are
automatically enforced, unless explicitly disabled. This declaration can
be accessed by client applications using the `SQLForeignKeys()` ODBC
function. This is used by some tools to display dependencies between
tables. Foreign keys are there to maintain referential integrity within
the database. This constraint will ensure that rows in one table will
have corresponding rows in another table, so that your orders are not
made for products that do not exist, for example.

Forward references are not permitted in FOREIGN KEY. Also a table
referenced in a foreign key constraint of another table cannot be
dropped. It is usual to list the columns in the referenced table
corresponding to the columns in the referencing table, however, this
list can be omitted, in which case the set of primary key columns of the
referenced table is used automatically by default. The referenced and
referencing column lists must be of equal length. To declare two
mutually referencing tables, ALTER TABLE must be used after both tables
are defined.

Foreign key constraints are enforced by default. It is sometimes
practical to disable constraint checks for performance or for
convenience when importing data or making bulk updates. To disable or
enable checking for foreign key constraints you can use the
<a href="fn_fk_check_input_values.html" class="link"
title="fk_check_input_values"><code
class="function">fk_check_input_values()</code></a> function. This
function changes the foreign key checking behavior globally across the
database so it is very important to remember to enable foreign key
constraint checking again afterwards.

Columns can be defined as having foreign keys and a default value,
however, the default value must not violate the constraint at the time
of insert or update as this will be rejected in the normal way.

<div>

**Example 9.22. Creating tables with foreign key constraints**

<div>

First the Primary key table must be defined before it can be referenced:

``` programlisting
CREATE TABLE T1 (
  Id INTEGER NOT NULL PRIMARY KEY,
  Dt VARCHAR
  )
;
```

Now the foreign key table can be created referencing the table above:

``` programlisting
CREATE TABLE T2 (
  Act INTEGER NOT NULL,  -- will refer to Id in T1
  Retr DATETIME,
  Description VARCHAR,
  CONSTRAINT FK1 FOREIGN KEY (Act) REFERENCES T1 (Id) -- the fk constraint
  )
;
```

The statement above creates the foreign key constraint in separate line
of the create table statement. This can be also be written in short form
with the column definition it applies to:

``` programlisting
CREATE TABLE T2 (
  Act INTEGER NOT NULL REFERENCES T1 (Id),  -- refer to Id in T1
  Retr DATETIME,
  Description VARCHAR
  )
;
```

</div>

</div>

  

<div>

**Example 9.23. Assumed Foreign Key Columns**

<div>

This CREATE TABLE statement was used for creating part of Demo database.
This statement does not describe the columns to be used as foreign keys
on the referred tables. Since the referred tables in each case have a
single Primary Key (Orders.OrderID and Products.ProductID) they need not
be mentioned and will be assumed when this statement is processed.

``` programlisting
CREATE TABLE Order_Details(
  OrderID INTEGER,
  ProductID INTEGER,
  UnitPrice DOUBLE PRECISION,
  Quantity SMALLINT,
  Discount REAL,
  PRIMARY KEY (OrderID, ProductID),
  FOREIGN KEY (OrderID) REFERENCES Orders,
  FOREIGN KEY (ProductID) REFERENCES Products
  )
;
```

</div>

</div>

  

<div>

<div>

<div>

<div>

#### Foreign Key Constraint Actions

</div>

</div>

</div>

Foreign key constraint actions allow the user to define what action data
should take when the data they are related to by way of a foreign key is
updated or deleted. The two activities that can be programmed are:

|           |
|-----------|
| ON DELETE |
| ON UPDATE |

The actions available for both types of activity are:

|                                                                                      |
|--------------------------------------------------------------------------------------|
| CASCADE - automatically perform the same action on the referenced data.              |
| SET NULL - set the referenced data to NULL.                                          |
| SET DEFAULT - sets the referenced data to whatever was defined as its default value. |
| NO ACTION - to not perform any action at all.                                        |

<div>

**Example 9.24. Foreign Key Constraint Actions**

<div>

Now, the foreign key table defined again, but this time with referential
rules which control how data is managed when rows are updated or deleted
in the primary key table:

``` programlisting
CREATE TABLE T3 (
  Act INTEGER NOT NULL DEFAULT 99,  -- will refer to Id in T1
  Retr DATETIME,
  Description VARCHAR,
  CONSTRAINT Fk1 FOREIGN KEY (Act) REFERENCES T1 (Id)
    ON UPDATE CASCADE ON DELETE SET DEFAULT
  )
;
```

</div>

</div>

  

</div>

</div>
