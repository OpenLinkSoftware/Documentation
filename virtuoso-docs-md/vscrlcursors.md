<div>

<div>

<div>

<div>

### 7.3.5. Virtuoso Scrollable Cursor Engine

</div>

</div>

</div>

Virtuoso implements server side scrollable cursors. ODBC 2.0, ODBC 3.5
and JDBC 2.0 API's are supported.

Cursor types include:

<div>

- **Forward only. ** This is the default, non-scrollable cursor.

- **Static. ** The cursor's evaluation is computed when the cursor
  statement is first executed. Positioned operations are possible but
  their effect will not show nor will changes be detected.

- **Keyset. ** When the cursor is opened a keyset is built. Rows within
  the keyset can be fetched and modified by positioned operations.
  Changes will show when refreshing data and changes by other
  transactions will be detected for update and delete. Inserts by the
  same or different transaction will not appear. A keyset cursor may
  have a finite keyset size. When scrolling outside of the given keyset
  the keyset will shift to cover the new rows.

- **Dynamic. ** A dynamic cursor will reflect all changes by the same
  and different transactions. The dynamic cursor's evaluation is
  constructed as needed, hence it generally has less overhead than other
  types of cursors.

- **Mixed. ** A mixed cursor is a combination of a keyset-driven cursor
  and a dynamic cursor. It is used when the result set is too large to
  reasonably generate a keyset for the entire result set. Mixed cursors
  use a keyset smaller than the entire result set but larger than the
  rowset.

  While the application is scrolling within the keyset, the behavior is
  keyset-driven. When the application scrolls beyond the keyset, the
  behavior becomes dynamic to fetch the requested rows and generate a
  new keyset. The behavior then reverts back to keyset-driven within
  that keyset, as before.

</div>

<div>

<div>

<div>

<div>

#### Forward Only Cursors

</div>

</div>

</div>

A forward only cursor is substantially more efficient than a scrollable
cursor. It however does not allow positioned operations (the WHERE
CURRENT OF SQL phrase), or SQLSetPos. The SQLExtendedFetch function is
supported but only the SQL_FETCH_NEXT fetch type is then allowed.

</div>

<div>

<div>

<div>

<div>

#### Cursor Operations

</div>

</div>

</div>

Virtuoso supports all ODBC scrollable cursor operations. These include

**SQLExtendedFetch / SQLScrollFetch fetch type. **

<div>

- SQL_FETCH_FIRST

- SQL_FETCH_LAST

- SQL_FETCH_NEXT

- SQL_FETCH_PRIOR

- SQL_FETCH_RELATIVE

- SQL_FETCH_ABSOLUTE

- SQL_FETCH_BOOKMARK

</div>

**SQLSetPos operations. **

<div>

- SQL_POSITION

- SQL_REFRESH

- SQL_ADD

- SQL_UPDATE

- SQL_DELETE

</div>

Positioned SQL statements, i.e. the WHERE CURRENT OF clause, is
supported for scrollable cursors.

</div>

<div>

<div>

<div>

<div>

#### Cursor Options

</div>

</div>

</div>

The cursor options

<div>

- SQL_CURSOR_TYPE

- SQL_CONCURRENCY

- SQL_KEYSET_SIZE

- Cursor name (SQLSetCursorName)

</div>

have to be set before a SQLPrepare or SQLExecDirect.

The SQL_ROWSET_SIZE can be varied while a cursor is open.

</div>

<div>

<div>

<div>

<div>

#### Cursors and Transactions

</div>

</div>

</div>

All forward only or scrollable cursors survive committing or rolling
back transactions. A cursor maintains its position over a transaction's
end. Hence the next fetch operation will resume from the correct place.
If a dynamic cursor's current row / rowset is deleted, the cursor will
continue from the next greater / lesser row in the order of the cursor's
ordering columns. This also applies to mixed mode (keyset with finite
keyset size) cursors scrolling outside of the keyset bounds. A forward
only cursor will retain its logical position across commit/rollback.

The SQL_CONCURRENCY values of SQL_CONCUR_READ_ONLY and SQL_CONCUR_LOCK
cause Virtuoso to lock the rows in the keyset / rowset in shared or
exclusive mode, respectively.

</div>

<div>

<div>

<div>

<div>

#### Optimistic Concurrency Control

</div>

</div>

</div>

A scrollable cursor may have a SQL_CONCURRENCY setting of
SQL_CONCUR_VALUES. This enables optimistic concurrency control. This is
a mechanism which will reflect an update or delete of a row if the row
has been modified by a third party after the time the application last
read the row.

A 'updated meanwhile' condition detected in this manner will prevent the
operation and return a SQL state of 01001 with SQL_SUCCESS_WITH_INFO
from SQLSetPos.

The updates and deletes made through SQLSetPos are still subject to
being committed or rolled back by normal transaction control. The 01001
state does not prevent the current transaction from committing.

The 01001 state is only detected if the update or delete is made by
SQLSetPos and the row at hand has been changed by any statement of any
transaction. If the update of updated operation is carried out by any
other operation than SQLSetPos of the statement that last read the value
the condition cannot be detected.

Note that the time between the last read and the SQLSetPos update can be
long and can span multiple transactions.

</div>

<div>

<div>

<div>

<div>

#### Cursor Information

</div>

</div>

</div>

<div>

**Table 7.13. Cursor Support**

<div>

|                | Static | Keyset | Dynamic |
|:---------------|--------|--------|---------|
| SQLRowCount    | x      | x      |         |
| SQL_BOOKMARK   | x      | x      | x       |
| SQL_ROW_NUMBER | x      | x      |         |
| reflect update |        | x      | x       |
| reflect delete |        |        | x       |
| reflect inx    |        |        | x       |
| Notice update  | x      | x      | x       |
| Notice delete  | x      | x      | x       |

</div>

</div>

  

SQLRowCount is set after the initial SQLExecute. This is the actual row
count or the keyset size for a mixed mode cursor. A dynamic cursor does
not know this since it builds the evaluation as needed.

All cursors support bookmarks.

The SQL_ROW_NUMBER is the ordinal number of the current row in the
cursor's evaluation. A dynamic cursor cannot know this, as the scrolling
may start from end and rows may appear on either side of the current row
while the cursor is open.

'reflect' means that the new values or added / deleted rows appear when
re-scrolling over the rows. A deletion is reflected by omitting the row.

'notice' means that the row is flagged by SQL_UPDATE, SQL_DELETED or
SQL_ADDED in the SQLExtendedFetch status array when the cursor
re-scrolls over the rows in question.

</div>

<div>

<div>

<div>

<div>

#### Cursors and Virtual Database

</div>

</div>

</div>

The cursor subsystem modifies the cursor's defining select statement to
make various backward and forward read statements, update and delete
statements etc. These transformations can be seen through the explain
function.

Since cursors are implemented by generating SQL statements these work
transparently against remote database, independently of their possible
native cursor support.

</div>

<div>

<div>

<div>

<div>

#### Cursor Special Cases

</div>

</div>

</div>

SQL SELECT statements fall in two categories: Simple, which consist of
one or more tables, an arbitrary WHERE clause and an optional ORDER BY,
and Complex, which includes all other SELECT's, e.g. ones with GROUP BY,
derived tables, full outer joins, UNION's etc.

A simple statement can easily be modified to read backwards or forwards
from a given point. Also, each result row of a simple statement has a
physical counterpart, or many physical counterparts for a join. Having a
physical counterpart makes it possible to define the meaning of a
positioned update or delete. A GROUP BY is a counter-example.

All complex SQL statements occurring as cursors are processed as static
cursors regardless of the declared cursor type.

</div>

<div>

<div>

<div>

<div>

#### Cursors and Performance

</div>

</div>

</div>

If a cursor's ordering corresponds to an ordering in an index, dynamic
cursors will generally perform best. This is understandable since the
engine can quickly locate the current row based on an index and then
just read backward or forward on that index. On the other hand, if the
result set is very sparsely spread over the table or if there is no
ordering index dynamic cursors will have a substantial penalty.

If used as a forward only cursor in a single transaction, a dynamic
cursor is only some 30% slower than a forward only cursor.

A static or keyset cursor has a relatively long execute time since the
initial execute will make the entire keyset. The initial execute of a
dynamic cursor is instantaneous since the fetch operations will do the
work as needed.

With most off the shelf applications, e.g. Microsoft ADO, static and
keyset cursors are preferable because the applications may rely on row
counts and row numbers which are not known for dynamic cursors.

Positioned operations are not affected by cursor type.

</div>

</div>
