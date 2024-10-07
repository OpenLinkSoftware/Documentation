<div id="fn_nntp_auth_post" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

nntp_auth_post — Post message to NNTP server with authorization

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_nntp_auth_post" class="funcsynopsis">

|                                  |                          |
|----------------------------------|--------------------------|
| `array `**`nntp_auth_post`**` (` | in `server ` varchar ,   |
|                                  | in `user ` varchar ,     |
|                                  | in `password ` varchar , |
|                                  | in `body ` varchar `)`;  |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_nntp_auth_post" class="refsect1">

## Description

`Nntp_auth_post ` is used to post a message to the server require
authorization.

</div>

<div id="params_nntp_auth_post" class="refsect1">

## Parameters

<div id="id97191" class="refsect2">

### server

The host to connect with. IP address or hostname:port. There is no
default for port, so to connect to the standard port for NNTP, use
\<hostname/IP address\>:119

</div>

<div id="id97194" class="refsect2">

### user

The username.

</div>

<div id="id97197" class="refsect2">

### password

The user password.

</div>

<div id="id97200" class="refsect2">

### body

The body <span class="type">string </span> The structure of the message
must comply with RFC 850 (Standard for Interchange of USENET Messages).

</div>

</div>

<div id="ret_03" class="refsect1">

## Return Types

1 on success or error

</div>

<div id="errors_nntp_auth_post" class="refsect1">

## Errors

<div id="id97209" class="table">

**Table 24.58. Errors signalled by**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                  | Description |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------|-------------|
| <span class="errorcode">2E000 </span> | <span class="errorcode">NN015 </span> | <span class="errortext">Invalid address for News Server at \[host\] </span> |             |
| <span class="errorcode">08001 </span> | <span class="errorcode">NN016 </span> | <span class="errortext">Unable to Contact News Server at \[host\] </span>   |             |
| <span class="errorcode">08006 </span> | <span class="errorcode">NN017 </span> | <span class="errortext">Misc. error in connection in nntp_auth_post </span> |             |

</div>

</div>

  

</div>

</div>
