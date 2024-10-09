<div>

<div>

</div>

<div>

## Name

vd_remote_table — declares an existing table as resident on a DSN
previously declared with vd_remote_data_source

</div>

<div>

## Synopsis

<div>

|                              |                                |
|------------------------------|--------------------------------|
| ` `**`vd_remote_table`**` (` | in `dsn ` varchar ,            |
|                              | in `local_name ` varchar ,     |
|                              | in `remote_name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Declares an existing table as resident on a data source previously
declared with vd_remote_data_source().

This function declares the table local_name as table remote_name on the
dsn. The tables names should be full, names with qualifier and owner.
The names are case sensitive and must be in the exact case where they
appear in the local and remote schemas.

If remote_name is NULL, the effect of a possible previous
vd_remote_table is reversed. The table is thereafter treated as a local
table, except in procedures and statements compiled when the remote
declaration was in effect.

</div>

<div>

## Parameters

<div>

### dsn

The name of the remote datasource previously connected using
vd_remote_data_source()

</div>

<div>

### local_name

Fully qualified name of a local table.

</div>

<div>

### remote_name

Fully qualified name of the remote table.

</div>

</div>

<div>

## See Also

<a href="fn_vd_remote_data_source.html" class="link"
title="vd_remote_data_source">vd_remote_data_source()</a>

<a href="ch-server.html#mansetrds" class="link"
title="Manually Setting Up A Remote Data Source">Manually Setting Up A
Remote Data Source</a>

</div>

</div>
