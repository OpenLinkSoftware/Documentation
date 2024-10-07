<div id="fn_exec_metadata" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

exec_metadata — Compiles a SQL statement and returns the metadata

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_exec_metadata" class="funcsynopsis">

|                            |                             |
|----------------------------|-----------------------------|
| ` `**`exec_metadata`**` (` | in `str ` varchar ,         |
|                            | out `state ` varchar ,      |
|                            | out `message ` varchar ,    |
|                            | out `metadata ` vector `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_exec_metadata" class="refsect1">

## Description

This function provides dynamic SQL capabilities in Virtuoso PL. The
first argument is an arbitrary SQL statement, which may contain
parameter placeholders. The function returns as output parameters a SQL
state, error message, column metadata if the statement is a select.

</div>

<div id="params_exec_metadata" class="refsect1">

## Parameters

<div id="id88104" class="refsect2">

### *`str `*

A <span class="type">varchar </span> containing arbitrary SQL using ?'s
for parameter markers.

</div>

<div id="id88109" class="refsect2">

### state

An output parameter of type <span class="type">varchar </span> set to
the 5 character SQL state if the exec resulted an error. Not set if an
error is not present.

</div>

<div id="id88113" class="refsect2">

### message

An output parameter of type <span class="type">varchar </span> set to
SQL error message associated with the error. Not set if an error is not
present.

</div>

<div id="id88117" class="refsect2">

### metadata

An output parameter of type <span class="type">vector </span> returning
the metadata of the statement and its result.

<div id="id88121" class="table">

**Table 24.29. The stmt_meta array**

<div class="table-contents">

| Element | Name        | Description                                                                                                        |
|---------|-------------|--------------------------------------------------------------------------------------------------------------------|
| 0       | COLS        | An array containing description of each column in the result set (see table below for contents)                    |
| 1       | STMT_SELECT | An <span class="type">integer </span> 1 indicates that the statement is a select, otherwise it is a DML statement. |
| 2..     | N/A         | Trailing elements may appear, but they should not be used                                                          |

</div>

</div>

  

<div id="id88143" class="table">

**Table 24.30. Columns array of metadata**

<div class="table-contents">

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

<div id="errors_exec_metadata" class="refsect1">

## Errors

The function will generate a SQL 22023 error value if a supplied
parameter is not of the type expected.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                   |
|:--------------------------:|:------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                         |
|                            | <a href="errors.html" class="link"                                
                              title="23.2. Error Codes Reference">List of SQL 22023 errors.</a>  |

</div>

</div>

<div id="examples_exec_metadata" class="refsect1">

## Examples

<div id="ex_exec_metadata" class="example">

**Example 24.105. Simple Use**

<div class="example-contents">

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

<div id="seealso_exec_metadata" class="refsect1">

## See Also

<a href="fn_exec.html" class="link" title="exec"><code
class="function">exec() </code></a>

<a href="fn_exec_next.html" class="link" title="exec_next"><code
class="function">exec_next() </code></a>

<a href="fn_exec_close.html" class="link" title="close"><code
class="function">exec_close() </code></a>

</div>

</div>
