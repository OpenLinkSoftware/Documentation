<div>

<div>

</div>

<div>

## Name

exec — dynamic execution of SQL returning state and result set

</div>

<div>

## Synopsis

<div>

|                   |                                |
|-------------------|--------------------------------|
| ` `**`exec`**` (` | in `str ` varchar ,            |
|                   | out `state ` varchar ,         |
|                   | out `message ` varchar ,       |
|                   | in `params ` any ,             |
|                   | in `maxrows ` integer ,        |
|                   | out `metadata ` vector ,       |
|                   | out `rows ` vector ,           |
|                   | out `cursor_handle ` long `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function provides dynamic SQL capabilities in Virtuoso PL. The
first argument is an arbitrary SQL statement, which may contain
parameter placeholders. The function returns as output parameters a SQL
state, error message, column metadata and result set rows if the
statement is a select.

A stored procedure can be invoked by exec but a procedure's result set
will not be received in the rows output parameter but rather sent to the
client.

</div>

<div>

## Parameters

<div>

### *`str `*

A <span class="type">varchar </span> containing arbitrary SQL using ?'s
for parameter markers.

</div>

<div>

### state

An output parameter of type <span class="type">varchar </span> set to
the 5 character SQL state if the exec resulted an error. Not set if an
error is not present.

</div>

<div>

### message

An output parameter of type <span class="type">varchar </span> set to
SQL error message associated with the error. Not set if an error is not
present.

</div>

<div>

### params

A <span class="type">vector </span> containing the parameters for the
SQL being executed. Element 0 corresponding to first ?, etc.

</div>

<div>

### maxrows

The <span class="type">integer </span> maximum number of rows to
retrieve in case of a statement returning a result set.

</div>

<div>

### metadata

An output parameter of type <span class="type">vector </span> returning
the metadata of the statement and its result.

<div>

**Table 24.26. The stmt_meta array**

<div>

| Element | Name        | Description                                                                                                        |
|---------|-------------|--------------------------------------------------------------------------------------------------------------------|
| 0       | COLS        | An array containing description of each column in the result set (see table below for contents)                    |
| 1       | STMT_SELECT | An <span class="type">integer </span> 1 indicates that the statement is a select, otherwise it is a DML statement. |
| 2..     | N/A         | Trailing elements may appear, but they should not be used                                                          |

</div>

</div>

  

<div>

**Table 24.27. Columns array of metadata**

<div>

| Element | Name       | Description                                                                               |
|---------|------------|-------------------------------------------------------------------------------------------|
| 0       | name       | Column name                                                                               |
| 1       | type       | Column type as an internal type code corresponding, but not equal to ODBC SQL type codes. |
| 2       | scale      | column scale                                                                              |
| 3       | precision  | column precision                                                                          |
| 4       | nullable   | indicates nullable column                                                                 |
| 5       | updatable  | indicates updatable column                                                                |
| 6       | searchable | indicates searchable column                                                               |

</div>

</div>

  

</div>

<div>

### rows

An output array with one element per result row containing an array with
the leftmost column as element 0 and so forth.

</div>

<div>

### cursor_handle

The cursor handle for use with related functions.

</div>

</div>

<div>

## Examples

<div>

**Example 24.102. Procedure Example**

<div>

This stored procedure returns 1 if a given table is empty. An error such
as a timeout or deadlock would be reported back to the caller as an
exception. Exec always returns, no matter the type of exception. Thus it
is also useful as a universal error catcher.

``` screen
create procedure tb_is_empty (in tb varchar)
{
  declare state, msg, descs, rows any;
  state := '00000';
  exec (sprintf ('select 1 from %s', tb), state,
    msg, vector (), 1, descs, rows);

  if (state <> '00000')
    signal (state, msg);

  if (length (rows) = 0)
    return 1;

  else
    return 0;
}
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_rexecute.html" class="link" title="rexecute"><code
class="function">rexecute() </code></a>

<a href="fn_exec_next.html" class="link" title="exec_next"><code
class="function">exec_next() </code></a>

<a href="fn_exec_close.html" class="link" title="close"><code
class="function">exec_close() </code></a>

</div>

</div>
