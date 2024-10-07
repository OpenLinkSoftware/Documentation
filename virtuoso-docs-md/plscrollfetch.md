<div id="plscrollfetch" class="section">

<div class="titlepage">

<div>

<div>

### 11.18.3. Fetching Data From a Scrollable Cursor

</div>

</div>

</div>

The FETCH on a scrollable cursor allows specification of a direction. If
there is no more data in the specified fetch direction this causes the
NOT FOUND exception to be raised, as with the forward-only cursors. In
addition to that if the row on which the cursor is about to position has
been deleted and the isolation level & cursor type allows detecting
that, then the exception SQLSTATE 'HY109' (Row deleted) is raised.

Positioning on a bookmark is done the following way:

A bookmark value should be retrieved using the
<a href="fn_bookmark.html" class="link" title="bookmark">bookmark()
function</a> . The value returned by that function can be stored, copied
and retrieved. This value can also survive a cursor close and reopen,
even between transactions. How the cursor will behave if a bookmark from
a cursor with different select statement or scroll type is used for
positioning is undefined and should be avoided. On some occasions it may
signal an error, on others it will position on a wrong or non-existing
row. As a general rule bookmark values should be used only on the cursor
from which they are generated.

The cursor should be in opened state. Now a FETCH .. BOOKMARK bm_value
INTO ... can be issued with the bookmark variable.

Bookmarks can serve for persisting the cursor position in an VSP
context. One can imagine a VSP page which on it's first go will execute
a cursor and will show the first so-many rows. Then it can retrieve the
bookmark value of the last displayed row, persist it somehow (for
example as an HTTP session variable), then close the cursor and exit. On
each subsequent hit it will open again the same cursor, position on the
bookmark persisted and return the next, previous, first or last so-many
rows.

</div>
