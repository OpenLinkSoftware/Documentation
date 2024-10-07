<div id="fn_rstmtexec" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

rstmtexec — execute a SQL statement on a remote DSN, provides a result
set where applicable.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rstmtexec" class="funcsynopsis">

|                        |                                |
|------------------------|--------------------------------|
| ` `**`rstmtexec`**` (` | in `dsn ` varchar ,            |
|                        | in `stmt ` varchar ,           |
|                        | in `max_rows ` integer ,       |
|                        | in `params_array ` vector `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rstmtexec" class="refsect1">

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

<div id="params_rstmtexec" class="refsect1">

## Parameters

<div id="id108824" class="refsect2">

### dsn

The data source where the SQL statement should be executed. You must
make sure that you have already defined the data source using the
` `<a href="fn_vd_remote_data_source.html" class="link"
title="vd_remote_data_source"><code
class="function">vd_remote_data_source</code></a>` ` function or by
attaching tables from it.

</div>

<div id="id108829" class="refsect2">

### stmt

the SQL statement to execute on the remote data source *`dsn `* .

</div>

<div id="id108833" class="refsect2">

### max_rows

This controls the number of rows to be returned as follows:

|                                     |
|-------------------------------------|
| negative - return no rows           |
| zero (0) - all rows (default)       |
| positive - specified number of rows |

</div>

<div id="id108840" class="refsect2">

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

<div id="ret_rstmtexec" class="refsect1">

## Return Values

This function returns a result set.

</div>

<div id="seealso_rexecute_01" class="refsect1">

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
