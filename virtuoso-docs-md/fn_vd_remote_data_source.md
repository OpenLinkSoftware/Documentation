<div>

<div>

</div>

<div>

## Name

vd_remote_data_source — prepares a remote DSN for use

</div>

<div>

## Synopsis

<div>

|                                    |                             |
|------------------------------------|-----------------------------|
| ` `**`vd_remote_data_source`**` (` | in `dsn ` varchar ,         |
|                                    | in `connstr ` varchar ,     |
|                                    | in `user ` varchar ,        |
|                                    | in `password ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

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

<div>

## Parameters

<div>

### dsn

The name of the remote datasource to prepare.

</div>

<div>

### connstr

Currently ignored parameter.

</div>

<div>

### user

username for the connection.

</div>

<div>

### password

password for the user.

</div>

</div>

<div>

## Return Types

Status of the connection attempt.

</div>

<div>

## Errors

<div>

**Table 24.112. Errors signalled by**

<div>

| SQLState                        | Error Code                      | Error Text                      | Description |
|---------------------------------|---------------------------------|---------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode"></span> | <span class="errortext"></span> |             |

</div>

</div>

  

</div>

<div>

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
