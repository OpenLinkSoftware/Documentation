<div id="fn_nntp_auth_get" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

nntp_auth_get — returns information about an NNTP server with
authorization

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_nntp_auth_get" class="funcsynopsis">

|                                 |                                 |
|---------------------------------|---------------------------------|
| `array `**`nntp_auth_get`**` (` | in `server ` varchar ,          |
|                                 | in `user ` varchar ,            |
|                                 | in `password ` varchar ,        |
|                                 | in `command ` varchar ,         |
|                                 | in `group ` varchar ,           |
|                                 | in `first_message ` integer ,   |
|                                 | in `last_message ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_nntp_auth_get" class="refsect1">

## Description

The `nntp_auth_get() ` is used to retrieve messages from a server
requiring authorization. See nntp_get for more information.

</div>

<div id="params_nntp_auth_get" class="refsect1">

## Parameters

<div id="id97085" class="refsect2">

### server

The host to connect with. IP address or hostname:port. There is no
default for port, so to connect to the standard port for NNTP, use
\<hostname/IP address\>:119

</div>

<div id="id97088" class="refsect2">

### user

The username.

</div>

<div id="id97091" class="refsect2">

### password

The user password.

</div>

<div id="id97094" class="refsect2">

### command

Command <span class="type">string </span> . Valid values are:

|         |
|---------|
| article |
| body    |
| head    |
| stat    |
| list    |
| group   |
| xover   |

</div>

<div id="id97106" class="refsect2">

### group

A <span class="type">string </span> containing name of the news group.

</div>

</div>

<div id="ret_02" class="refsect1">

## Return Types

A vector of vectors the content depends of command.

</div>

<div id="errors_nntp_auth_get" class="refsect1">

## Errors

<div id="id97115" class="table">

**Table 24.57. Errors signalled by nntp_auth_get**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                  | Description |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------|-------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">NN008 </span> | <span class="errortext">the command is not recognized </span>               |             |
| <span class="errorcode">2E000 </span> | <span class="errorcode">NN002 </span> | <span class="errortext">Invalid address for News Server at \[host\] </span> |             |
| <span class="errorcode">08001 </span> | <span class="errorcode">NN003 </span> | <span class="errortext">Unable to Contact News Server at \[host\] </span>   |             |
| <span class="errorcode">08006 </span> | <span class="errorcode">NN004 </span> | <span class="errortext">Lost connection with NNTP server </span>            |             |
| <span class="errorcode">08006 </span> | <span class="errorcode">NN008 </span> | <span class="errortext">Misc. error in connection in nntp_auth_get </span>  |             |

</div>

</div>

  

</div>

</div>
