<div>

<div>

<div>

<div>

### 9.8.3. IDENTITY (Auto Increment)

</div>

</div>

</div>

The IDENTITY keyword causes the columns to be automatically incremental,
meaning that each successive insert into the table will automatically
assign a value greater than any previous row of the table. These columns
are often referred to as "autoincrement columns". The assigned values
are normally consecutive integers. There may be gaps in the sequence if
some transactions that reserve a number fail to commit.

An autoincrement column may or may not be part of the primary key or of
any index.

The <a href="fn_identity_value.html" class="link"
title="identity_value"><code
class="function">identity_value()</code></a> function returns the
identity column value most recently assigned on the current connection.
This can be used inside procedures or from clients. See also the ODBC
statement option SQL_GETLASTSERIAL.

The <a href="fn_set_identity_column.html" class="link"
title="set_identity_column"><code
class="function">set_identity_column()</code></a> function allows you to
change the identity column sequence value.

The IDENTITY keyword supports the SQL 3 optional clause that allows you
to specify a starting value and/or step value in the table creation
statement. The syntax is:

``` programlisting
      IDENTITY (START WITH <N>, INCREMENT BY <Y>)
```

<div>

**Example 9.16. Using the IDENTITY declaration**

<div>

``` programlisting
CREATE TABLE DB.DBA.AI (
    AI INTEGER IDENTITY,
    XX VARCHAR,
    PRIMARY KEY (AI)
  )
;
```

Creates a table with an autoincrement primary key column AI.

``` programlisting
set_identity_column("DB"."DBA"."AI", "AI", 11);
```

will cause the next row to be inserted into AI to have the AI column
equal to 11.

</div>

</div>

  

<div>

**Example 9.17. Using the IDENTITY (START WITH) declaration**

<div>

``` programlisting
CREATE TABLE DB.DBA.AI (
    AI INTEGER IDENTITY (START WITH 100),
    XX VARCHAR,
    PRIMARY KEY (AI)
  )
;
```

Creates a table with an autoincrement primary key column AI, whose first
value will be 100 and will auto-increment from there upwards.

</div>

</div>

  

<div>

|                            |                                                     |
|:--------------------------:|:----------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also                                            |
|                            | <a href="sequenceobjects.html" class="link"         
                              title="9.16. Sequence Objects">Sequence Objects</a>  |

</div>

</div>
