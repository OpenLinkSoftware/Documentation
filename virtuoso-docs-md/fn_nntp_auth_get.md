<div>

<div>

</div>

<div>

## Name

nntp_auth_get — returns information about an NNTP server with
authorization

</div>

<div>

## Synopsis

<div>

|                                 |                                 |
|---------------------------------|---------------------------------|
| `array `**`nntp_auth_get`**` (` | in `server ` varchar ,          |
|                                 | in `user ` varchar ,            |
|                                 | in `password ` varchar ,        |
|                                 | in `command ` varchar ,         |
|                                 | in `group ` varchar ,           |
|                                 | in `first_message ` integer ,   |
|                                 | in `last_message ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The `nntp_auth_get() ` is used to retrieve messages from a server
requiring authorization. See nntp_get for more information.

</div>

<div>

## Parameters

<div>

### server

The host to connect with. IP address or hostname:port. There is no
default for port, so to connect to the standard port for NNTP, use
\<hostname/IP address\>:119

</div>

<div>

### user

The username.

</div>

<div>

### password

The user password.

</div>

<div>

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

<div>

### group

A <span class="type">string </span> containing name of the news group.

</div>

</div>

<div>

## Return Types

A vector of vectors the content depends of command.

</div>

<div>

## Errors

<div>

**Table 24.56. Errors signalled by nntp_auth_get**

<div>

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
