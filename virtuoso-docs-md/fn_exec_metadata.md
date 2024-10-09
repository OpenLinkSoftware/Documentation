<div>

<div>

</div>

<div>

## Name

exec_metadata — Compiles a SQL statement and returns the metadata

</div>

<div>

## Synopsis

<div>

|                            |                             |
|----------------------------|-----------------------------|
| ` `**`exec_metadata`**` (` | in `str ` varchar ,         |
|                            | out `state ` varchar ,      |
|                            | out `message ` varchar ,    |
|                            | out `metadata ` vector `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function provides dynamic SQL capabilities in Virtuoso PL. The
first argument is an arbitrary SQL statement, which may contain
parameter placeholders. The function returns as output parameters a SQL
state, error message, column metadata if the statement is a select.

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

### metadata

An output parameter of type <span class="type">vector </span> returning
the metadata of the statement and its result.

<div>

**Table 24.28. The stmt_meta array**

<div>

| Element | Name        | Description                                                                                                        |
|---------|-------------|--------------------------------------------------------------------------------------------------------------------|
| 0       | COLS        | An array containing description of each column in the result set (see table below for contents)                    |
| 1       | STMT_SELECT | An <span class="type">integer </span> 1 indicates that the statement is a select, otherwise it is a DML statement. |
| 2..     | N/A         | Trailing elements may appear, but they should not be used                                                          |

</div>

</div>

  

<div>

**Table 24.29. Columns array of metadata**

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

</div>

<div>

## Errors

The function will generate a SQL 22023 error value if a supplied
parameter is not of the type expected.

<div>

|                            |                                                                   |
|:--------------------------:|:------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                         |
|                            | <a href="errors.html" class="link"                                
                              title="23.2. Error Codes Reference">List of SQL 22023 errors.</a>  |

</div>

</div>

<div>

## Examples

<div>

**Example 24.105. Simple Use**

<div>

``` screen
create procedure get_meta (in str varchar)
{
  declare state, message, mdta any;
  state := '00000';
  exec_metadata (str, state, message, mdta);
  if (state <> '00000')
    signal (state, message);
  return mdta;
}
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_exec.html" class="link" title="exec"><code
class="function">exec() </code></a>

<a href="fn_exec_next.html" class="link" title="exec_next"><code
class="function">exec_next() </code></a>

<a href="fn_exec_close.html" class="link" title="close"><code
class="function">exec_close() </code></a>

</div>

</div>
