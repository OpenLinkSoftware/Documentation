<div id="fn_rexecute" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

rexecute — execute a SQL statement on a remote DSN

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rexecute" class="funcsynopsis">

|                       |                                |
|-----------------------|--------------------------------|
| ` `**`rexecute`**` (` | in `dsn ` varchar ,            |
|                       | in `sql_stmt ` varchar ,       |
|                       | out `sql_state ` varchar ,     |
|                       | out `error_message ` varchar , |
|                       | in `in_params ` vector ,       |
|                       | out `num_cols ` integer ,      |
|                       | out `stmt_meta ` vector ,      |
|                       | out `result_set ` vector ,     |
|                       | out `cursor_handle ` long `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rexecute" class="refsect1">

## Description

This function can be used to execute SQL on a remote data source
directly.

The *`result_set`* parameter is useful for obtaining a result-set
quickly and easily. However, if the result-set is going to be large,
this comes at a cost in terms of time and resources, particularly
memory, since Virtuoso will have to obtain all results from the
statement and build the result-set arrays in memory before returning
back to the caller.

A more efficient way is to obtain a cursor handle and iterate through
the result set one row at a time:

|                                                                                                                     |
|---------------------------------------------------------------------------------------------------------------------|
| Use `rexecute() ` to get the cursor handle.                                                                         |
| Iterate over the results with `rnext() `                                                                            |
| If `rmoreresults() ` does not return an error or `SQL_NO_DATA_FOUND ` continue the loop with `rnext() ` , otherwise |
| close the cursor with `rclose() `                                                                                   |

To keep Virtuoso from obtaining the whole result set from the remote,
pass NULL as the *`result_set`* parameter when calling rexecute.

`Rexecute()` supports IN parameters and can also support INOUT and OUT
parameters. If INOUT and OUT parameters are to be used then cursors
should not be used with this function (as the values of output
parameters in ODBC are not guaranteed to be set before SQLMoreResults()
returns SQL_NO_DATA_FOUND). `Rexecute` supports INOUT and OUT parameters
by extending the *`in_params`* vector and requiring it to be a PL
variable so values can be set back to it.

Unless explicitly granted, only the DBA group is permitted to use the
`rexecute()` to maintain security. Caution is required here since any
user granted use of `rexecute()` has full control of the remote data
source set-up by the DBA, however limited to the overall abilities of
the remote user on the remote data source. Users can be granted and
denied access to this function using the following commands:

``` programlisting
GRANT REXECUTE ON '<attached_dsn_name>' TO <user_name>
REVOKE REXECUTE ON '<attached_dsn_name>' FROM <user_name>
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                  |
|:----------------------------:|:---------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                            |
|                              | <a href="fn_rstmtexec.html" class="link" title="rstmtexec"><code                 
                                class="function">rstmtexec() </code></a> provides a short-hand to this function.  |

</div>

</div>

<div id="params_rexecute" class="refsect1">

## Parameters

<div id="id108649" class="refsect2">

### dsn

The data source where the SQL statement should be executed. You must
make sure that you have already defined the data source using the
` `<a href="fn_vd_remote_data_source.html" class="link"
title="vd_remote_data_source"><code
class="function">vd_remote_data_source</code></a>` ` function or by
attaching tables from it.

</div>

<div id="id108654" class="refsect2">

### sql_stmt

the SQL statement to execute.

</div>

<div id="id108657" class="refsect2">

### sql_state

A <span class="type">varchar </span> containing the SQL State returned
from the remote data source.

</div>

<div id="id108661" class="refsect2">

### error_message

A <span class="type">varchar </span> containing any error message
returned from the remote.

</div>

<div id="id108665" class="refsect2">

### in_params

A <span class="type">vector </span> of parameters to the statement if
the executed statement has parameters. IN input parameters are specified
as literals whereas OUT and INOUT parameters are specified as vectors of
3 elements for OUT and 4 elements for INOUT as follows:

|                                                                   |
|-------------------------------------------------------------------|
| \[0\] - the type of the parameter ('OUT' or 'INOUT')              |
| \[1\] - the datatype that the parameter is bound to on the remote |
| \[2\] - the buffer length for the output parameter                |
| \[3\] - (INOUT only) the input value of the parameter             |

Non-vector parameters in the in_params parameter of rexecute are
considered IN parameters, so the rexecute remains backwards compatible.

</div>

<div id="id108675" class="refsect2">

### num_cols

Number of columns in the result set if the statement returned one.

</div>

<div id="id108678" class="refsect2">

### stmt_meta

A <span class="type">vector </span> containing result metadata, etc.

<div id="id108682" class="table">

**Table 24.77. The stmt_meta array**

<div class="table-contents">

| Element | Name      | Description                                                                                     |
|---------|-----------|-------------------------------------------------------------------------------------------------|
| 0       | COLS      | An array containing description of each column in the result set (see table below for contents) |
| 1       | RES_AVAIL | An <span class="type">integer </span> 1 indicates that results are available.                   |
| 2       | N/A       | Not used                                                                                        |
| 3       | N/A       | Not used                                                                                        |

</div>

</div>

  

<div id="id108708" class="table">

**Table 24.78. Columns array of stmt_meta**

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

<div id="id108745" class="refsect2">

### result_set

A <span class="type">vector </span> of vectors containing each row in
the result set.

</div>

<div id="id108749" class="refsect2">

### cursor_handle

The cursor handle ( <span class="type">long </span> ).

</div>

</div>

<div id="examples_rexecute" class="refsect1">

## Examples

<div id="ex_rexecute_1" class="example">

**Example 24.359. Remote execute example 1**

<div class="example-contents">

Remote execute, retrieving the whole result from remote at once.

``` screen
create procedure
test_rexecute_1 (in remote_dsn varchar)
{
  declare stmt varchar;
  declare mdta_out any;
  declare res_vec_out, param_vec any;
  declare sql_state, err_msg varchar;
  declare inx integer;
  declare num_cols_out integer;

  declare Company, Contact varchar;
  result_names (Company, Contact);

  stmt := 'SELECT CompanyName, ContactName FROM \
             Demo.Demo.Customers WHERE CompanyName BETWEEN ? and ?';
  sql_state := '00000';
  param_vec := vector ('A', 'B');

  rexecute (remote_dsn, stmt, sql_state, err_msg, param_vec,
        num_cols_out, mdta_out, res_vec_out, NULL);

  if (sql_state <> '00000')  -- See if we got an error
    {
      signal ('ZILCH',
          concat ('Remote execution returned ',
              sql_state, ' ', err_msg));
    }

  -- now iterate through result set stored in res_vec_out

  inx := 0;
  while (inx < length (res_vec_out))
    {
      result (aref (aref (res_vec_out, inx), 0),
          aref (aref (res_vec_out, inx), 1));
      inx := inx + 1;
    }

  end_result ();
}

SQL> test_rexecute_1 ('Local Virtuoso Demo');
Company                   Contact
VARCHAR                   VARCHAR
_______________________________________________________________________________

Alfreds Futterkiste       Maria Anders
Ana Trujillo Emparedados y helados  Ana Trujillo
Antonio Moreno Taquería   Antonio Moreno
Around the Horn           Thomas Hardy

4 Rows. -- 4 msec.
```

</div>

</div>

  

<div id="ex_rexecute_1_01" class="example">

**Example 24.360. Remote execute example 2**

<div class="example-contents">

Remote execute, retrieving the result using returned cursor handle.

``` screen
create procedure
test_rexecute_2 (in remote_dsn varchar, in max_results integer)
{
  declare stmt varchar;
  declare mdta_out any;
  declare res_vec_out, param_vec any;
  declare sql_state, err_msg varchar;
  declare inx integer;
  declare num_cols_out integer;
  declare cursor_out any;

  declare Company, Contact varchar;
  result_names (Company, Contact);

  stmt := 'SELECT CompanyName, ContactName FROM \
             Demo.Demo.Customers WHERE CompanyName BETWEEN ? and ?';
  sql_state := '00000';
  param_vec := vector ('A', 'Z');

  rexecute (remote_dsn, stmt, sql_state, err_msg, param_vec,
        num_cols_out, mdta_out, NULL, cursor_out);

  if (sql_state <> '00000')  -- See if we got an error
    {
      signal ('ZILCH',
          concat ('Remote execution returned ',
              sql_state, ' ', err_msg));
    }

  -- now iterate through result set with cursor

  while (0 = rnext (cursor_out, res_vec_out) and inx < max_results)
    {
      result (aref (res_vec_out, 0), aref (res_vec_out, 1));
      inx := inx + 1;
    }

  rclose (cursor_out);
  end_result ();
}

SQL> test_rexecute_2 ('Local Virtuoso Demo', 10);
Company                   Contact
VARCHAR                   VARCHAR
_______________________________________________________________________________

Alfreds Futterkiste       Maria Anders
Ana Trujillo Emparedados y helados  Ana Trujillo
Antonio Moreno Taquería   Antonio Moreno
Around the Horn           Thomas Hardy
B's Beverages             Victoria Ashworth
Berglunds snabbköp        Christina Berglund
Blauer See Delikatessen   Hanna Moos
Blondel père et fils      Frédérique Citeaux
Bon app'                  Laurence Lebihan
Bottom-Dollar Markets     Elizabeth Lincoln

10 Rows. -- 19 msec.
```

</div>

</div>

  

<div id="ex_rexecute_4" class="example">

**Example 24.361. Remote execute example 3**

<div class="example-contents">

Remote DBMS native SQL execution

``` screen
create procedure test_rexecute_3 (in remote_dsn varchar, in max_results integer)
{
    declare res_vec_out, param_vec, mdta_out, cursor_out any;
    declare url, stmt, sql_state, err_msg varchar;
    declare num_cols_out, inx, _id integer;

    result_names(_id,url);

    stmt := 'select id from mysql_pk';

    sql_state := '00000';
    param_vec := vector ('');

    rexecute (remote_dsn, stmt, sql_state, err_msg, param_vec, num_cols_out, mdta_out, NULL, cursor_out);

    _id := '';

    if (sql_state <> '00000')  -- See if we got an error
    {
      signal ('ZILCH',concat ('Remote execution returned ', sql_state, ' ', err_msg));
    }

    -- now iterate through result set stored in cursor_out
    inx := 0;
    while (0 = rnext (cursor_out, res_vec_out) and inx < max_results)
    {
      _id := aref (res_vec_out, 0);
      {
        whenever not found goto znext;
        select url into url from rdfstore_mysql where id = _id;
      }

       result(_id, url);

       if (0 = mod (inx, 5000))
       {
         log_message(sprintf ('%d rows copied, stay patient (id: %d)', inx, _id));
       }

        znext:;
        inx := inx + 1;
    }

  rclose (cursor_out);
  end_result ();
};
```

</div>

</div>

  

<div id="ex_rexecute_2" class="example">

**Example 24.362. Remote procedures with OUT params.**

<div class="example-contents">

The following example demonstrates the use of OUT params using a sample
remote procedure stored in another Virtuoso server, although this can be
any database of course, and a local procedure that uses the `rexecute()`
to execute it.

``` screen
--On remote virtuoso:
create procedure FUNCRET (in data varchar) returns varchar { return concat (data, 'Out'); };

--On local virtuoso:
create procedure call_FUNCRET (in data varchar, in DSN varchar) returns integer
{
   declare params any;
   params := vector (
              vector ('out', 'varchar', 50), -- an OUT VARCHAR parameter for the result
                                             -- 50 here means receive no more than 50 bytes of
                                             -- the output value
              data                           -- the IN parameters are passed as usual
             );
   rexecute (DSN, '{?=call FUNCRET(?)}',
            null, null,
            params); -- params should be a PL variable, as it will hold the substituted
                     -- output values for the OUT and INOUT parameters upon return.
   -- retrieve the output value of the first parameter (i.e.
   -- the function return value) and return it:
   return params[0];
};
```

This should return as follows:

``` screen
select call_FUNCRET ('abc', 'Local Virtuoso Demo');
---------------------------
abcOut
```

</div>

</div>

  

<div id="ex_rexecute_3" class="example">

**Example 24.363. Remote procedures with INOUT params.**

<div class="example-contents">

As well as OUT parameters INOUT parameters can be used. Consider the
following variation of the above example:

``` screen
--On remote Virtuoso:
create procedure INOUT_PROC (inout DATA varchar)
{
   DATA := concat (DATA, 'InOut');
};

--On local Virtuoso:
create procedure call_INOUT_PROC (in DATA varchar, in DSN varchar) returns varchar
{
  declare params any;
  params := (
          vector ('inout', 'VARCHAR', 50, DATA) -- note we pass 4 element array for INOUT,
                                                -- as we need the input value for the parameter
             );
  rexecute (DSN, '{call INOUT_PROC (?)}',
                null, null,
                params);
  return params[0];
};
```

This, when called returns:

``` screen
select call_INOUT_PROC ('abc', 'Local Virtuoso Demo');
----------------------
abcInOut
```

</div>

</div>

  

</div>

<div id="seealso_rexecute" class="refsect1">

## See Also

<a href="fn_rstmtexec.html" class="link" title="rstmtexec"><code
class="function">rstmtexec() </code></a> ,
<a href="fn_rnext.html" class="link" title="rnext"><code
class="function">rnext()</code></a> ,
<a href="fn_rmoreresults.html" class="link" title="rmoreresults"><code
class="function">rmoreresults()</code></a> ,
<a href="fn_rclose.html" class="link" title="rclose"><code
class="function">rclose()</code></a>

</div>

</div>
