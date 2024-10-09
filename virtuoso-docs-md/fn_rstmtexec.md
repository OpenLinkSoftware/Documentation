<div>

<div>

</div>

<div>

## Name

rstmtexec — execute a SQL statement on a remote DSN, provides a result
set where applicable.

</div>

<div>

## Synopsis

<div>

|                        |                                |
|------------------------|--------------------------------|
| ` `**`rstmtexec`**` (` | in `dsn ` varchar ,            |
|                        | in `stmt ` varchar ,           |
|                        | in `max_rows ` integer ,       |
|                        | in `params_array ` vector `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function can be used to execute SQL on a remote data source
directly. It returns a result set where one is expected.

This function is wrapper for the `rexecute()` provided for convenience
as a shortcut.

Unless explicitly granted, only the DBA group is permitted to use the
`rstmtexec()` to maintain security. Caution is required here since any
user granted use of `rstmtexec()` has full control of the remote data
source set-up by the DBA, albeit limited to the overall abilities of the
remote user on the remote data source. Users can be granted and denied
access to this function using the following commands:

``` programlisting
GRANT REXECUTE ON '<attached_dsn_name>' TO <user_name>
REVOKE REXECUTE ON '<attached_dsn_name>' FROM <user_name>
```

This command directly affects the grant to the `rexecute()` function,
which is the underlying mechanism for providing this function.

</div>

<div>

## Parameters

<div>

### dsn

The data source where the SQL statement should be executed. You must
make sure that you have already defined the data source using the
` `<a href="fn_vd_remote_data_source.html" class="link"
title="vd_remote_data_source"><code
class="function">vd_remote_data_source</code></a>` ` function or by
attaching tables from it.

</div>

<div>

### stmt

the SQL statement to execute on the remote data source *`dsn `* .

</div>

<div>

### max_rows

This controls the number of rows to be returned as follows:

|                                     |
|-------------------------------------|
| negative - return no rows           |
| zero (0) - all rows (default)       |
| positive - specified number of rows |

</div>

<div>

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

Non-vector parameters in the in_params parameter of rstmtexec are
considered IN parameters, so the rstmtexec remains backwards compatible.

</div>

</div>

<div>

## Return Values

This function returns a result set.

</div>

<div>

## See Also

<a href="fn_rexecute.html" class="link" title="rexecute"><code
class="function">rexecute() </code></a> ,
<a href="fn_rnext.html" class="link" title="rnext"><code
class="function">rnext()</code></a> ,
<a href="fn_rmoreresults.html" class="link" title="rmoreresults"><code
class="function">rmoreresults()</code></a> ,
<a href="fn_rclose.html" class="link" title="rclose"><code
class="function">rclose()</code></a>

</div>

</div>
