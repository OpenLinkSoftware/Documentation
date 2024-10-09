<div>

<div>

</div>

<div>

## Name

nntp_auth_post — Post message to NNTP server with authorization

</div>

<div>

## Synopsis

<div>

|                                  |                          |
|----------------------------------|--------------------------|
| `array `**`nntp_auth_post`**` (` | in `server ` varchar ,   |
|                                  | in `user ` varchar ,     |
|                                  | in `password ` varchar , |
|                                  | in `body ` varchar `)`;  |

<div>

 

</div>

</div>

</div>

<div>

## Description

`Nntp_auth_post ` is used to post a message to the server require
authorization.

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

### body

The body <span class="type">string </span> The structure of the message
must comply with RFC 850 (Standard for Interchange of USENET Messages).

</div>

</div>

<div>

## Return Types

1 on success or error

</div>

<div>

## Errors

<div>

**Table 24.57. Errors signalled by**

<div>

| SQLState                              | Error Code                            | Error Text                                                                  | Description |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------|-------------|
| <span class="errorcode">2E000 </span> | <span class="errorcode">NN015 </span> | <span class="errortext">Invalid address for News Server at \[host\] </span> |             |
| <span class="errorcode">08001 </span> | <span class="errorcode">NN016 </span> | <span class="errortext">Unable to Contact News Server at \[host\] </span>   |             |
| <span class="errorcode">08006 </span> | <span class="errorcode">NN017 </span> | <span class="errortext">Misc. error in connection in nntp_auth_post </span> |             |

</div>

</div>

  

</div>

</div>
