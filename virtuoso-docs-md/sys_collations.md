<div>

<div>

<div>

<div>

### 23.6.5. Collations System Table

</div>

</div>

</div>

The SYS_COLLATIONS system table holds the data for all the defined
collations. It has the following structure:

``` programlisting
CREATE TABLE SYS_COLLATIONS (
    COLL_NAME VARCHAR,
    COLL_TABLE LONG VARBINARY,
    COLL_IS_WIDE INTEGER);
```

COLL_NAME is the fully qualified name of the collation (it's identifier)

COLL_TABLE holds the collation table (256 bytes or 65536 wide chars)

COLL_IS_WIDE show the collation's type (0 for CHAR and 1 for NCHAR).
Note that a 8bit collation cannot be used by a NCHAR data and vice
versa.

Collation can be deleted by deleting its row from SYS_COLLATIONS.

<div>

|                              |                                                                                                                |
|:----------------------------:|:---------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                                                                           |
|                              | The collation will still be available until the server is restarted, as it's definition is cached into memory. |

</div>

</div>
