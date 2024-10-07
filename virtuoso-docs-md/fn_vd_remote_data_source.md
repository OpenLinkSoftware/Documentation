<div id="fn_vd_remote_data_source" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

vd_remote_data_source — prepares a remote DSN for use

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_vd_remote_data_source" class="funcsynopsis">

|                                    |                             |
|------------------------------------|-----------------------------|
| ` `**`vd_remote_data_source`**` (` | in `dsn ` varchar ,         |
|                                    | in `connstr ` varchar ,     |
|                                    | in `user ` varchar ,        |
|                                    | in `password ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_vd_remote_data_source" class="refsect1">

## Description

A remote data source is uniquely identified by its DSN, the dsn argument
to this function. The connstr argument is presently ignored. The user
and password are the login name and password to use when communicating
with the remote data source. All Virtuoso users dealing with the remote
data source will appear as this user to the remote data source. Virtuoso
will make as many connections as there are concurrent users of the data
source. Connections are cached by Virtuoso.

The default qualifier of the user of the remote data source is usually
not relevant. This function connects to the DSN in order to retrieve
various meta data, which it stores locally. The DSN should be defined in
the server's environment and the DSN's database should be on line.

</div>

<div id="params_vd_remote_data_source" class="refsect1">

## Parameters

<div id="id117987" class="refsect2">

### dsn

The name of the remote datasource to prepare.

</div>

<div id="id117990" class="refsect2">

### connstr

Currently ignored parameter.

</div>

<div id="id117993" class="refsect2">

### user

username for the connection.

</div>

<div id="id117996" class="refsect2">

### password

password for the user.

</div>

</div>

<div id="ret_vd_remote_data_source" class="refsect1">

## Return Types

Status of the connection attempt.

</div>

<div id="errors_vd_remote_data_source" class="refsect1">

## Errors

<div id="id118004" class="table">

**Table 24.113. Errors signalled by**

<div class="table-contents">

| SQLState                        | Error Code                      | Error Text                      | Description |
|---------------------------------|---------------------------------|---------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode"></span> | <span class="errortext"></span> |             |

</div>

</div>

  

</div>

<div id="seealso_vd_remote_data_source" class="refsect1">

## See Also

<a href="fn_vd_remote_table.html" class="link"
title="vd_remote_table">vd_remote_table</a>

<a href="fn_vdd_disconnect_data_source.html" class="link"
title="vdd_disconnect_data_source">vdd_disconnect_data_source</a>

<a href="ch-server.html#mansetrds" class="link"
title="Manually Setting Up A Remote Data Source">Manually Setting Up A
Remote Data Source</a>

</div>

</div>
