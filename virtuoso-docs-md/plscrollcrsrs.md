<div id="plscrollcrsrs" class="section">

<div class="titlepage">

<div>

<div>

## 11.18. Virtuoso/PL Scrollable Cursors

</div>

</div>

</div>

Virtuoso/PL supports scrollable cursors, providing functionality similar
to the ODBC scrollable cursor support. Scrollable Cursor support extends
the basic (forward-only) syntax of DECLARE CURSOR and FETCH to support
the various fetch directions & cursor modes. The Virtuoso/PL scrollable
cursors always operate with a rowset size equal to 1. The keyset size
(where applicable) is as per the default.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                                                           |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                     |
|                              | If a Virtuoso/PL cursor is declared forward only it supports only FETCH .. NEXT scroll direction. The FETCH defaults its direction to NEXT (if omitted) so this is how the syntax extensions to DECLARE CURSOR & FETCH interoperate with the forward-only cursors syntax. |

</div>

<div id="plscrolldeclare" class="section">

<div class="titlepage">

<div>

<div>

### 11.18.1. Declaring a Scrollable Cursor

</div>

</div>

</div>

Virtuoso/PL cursor types are specified at declaration time. Unlike the
forward-only cursor declaration the scrollable cursor DECLARE CURSOR
causes some actions (cursor statement preparation & cursor variable
assignment). The cursor variable's value can not be copied, it should be
passed only by reference in procedure calls. Scrollable cursors have an
appropriate destructor, which will close the cursor when the cursor
variable goes out of scope. Variables in the surrounding context are
referenced similarly to the forward-only cursor.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                             |
|:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                       |
|                              | Some types of statements do not allow other cursor types than static. For example SELECT DISTINCT will always result in a static cursor, ignoring the cursor declared type. |

</div>

</div>

</div>
