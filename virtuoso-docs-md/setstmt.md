<div>

<div>

<div>

<div>

## 9.24. SET Statement

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 9.24.1. ISOLATION

</div>

</div>

</div>

This allows setting a transaction isolation in a stored procedure or
trigger body. The values are:

|              |
|--------------|
| uncommitted  |
| committed    |
| repeatable   |
| serializable |

These are case insensitive strings.

This takes effect dynamically until replaced by another SET ISOLATION
setting. The effect never persists over the return of the containing
procedure or trigger. The effect does extend into procedures or triggers
called from after executing the SET ISOLATION statement.

<div>

**Example 9.41. Setting the isolation level**

<div>

``` programlisting
set isolation='serializable';
```

</div>

</div>

  

The initial isolation comes from the SQL_TXN_ISOLATION statement option
in the ODBC API (SQLSetConnectOption). The default isolation is
repeatable read.

</div>

</div>
