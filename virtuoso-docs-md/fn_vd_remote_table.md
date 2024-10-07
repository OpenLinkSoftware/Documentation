<div id="fn_vd_remote_table" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

vd_remote_table — declares an existing table as resident on a DSN
previously declared with vd_remote_data_source

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_vd_remote_table" class="funcsynopsis">

|                              |                                |
|------------------------------|--------------------------------|
| ` `**`vd_remote_table`**` (` | in `dsn ` varchar ,            |
|                              | in `local_name ` varchar ,     |
|                              | in `remote_name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_vd_remote_table" class="refsect1">

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

<div id="params_vd_remote_table" class="refsect1">

## Parameters

<div id="id118128" class="refsect2">

### dsn

The name of the remote datasource previously connected using
vd_remote_data_source()

</div>

<div id="id118131" class="refsect2">

### local_name

Fully qualified name of a local table.

</div>

<div id="id118134" class="refsect2">

### remote_name

Fully qualified name of the remote table.

</div>

</div>

<div id="seealso_vd_remote_table" class="refsect1">

## See Also

<a href="fn_vd_remote_data_source.html" class="link"
title="vd_remote_data_source">vd_remote_data_source()</a>

<a href="ch-server.html#mansetrds" class="link"
title="Manually Setting Up A Remote Data Source">Manually Setting Up A
Remote Data Source</a>

</div>

</div>
