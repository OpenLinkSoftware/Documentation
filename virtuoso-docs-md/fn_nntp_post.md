<div>

<div>

</div>

<div>

## Name

nntp_post — Post message to NNTP server

</div>

<div>

## Synopsis

<div>

|                             |                         |
|-----------------------------|-------------------------|
| `array `**`nntp_post`**` (` | in `server ` varchar ,  |
|                             | in `body ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`Nntp_post ` is used to post a message to the server running the Network
News Transfer Protocol as defined in the rfc977.

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

**Table 24.59. Errors signalled by**

<div>

| SQLState                              | Error Code                            | Error Text                                                                  |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------|
| <span class="errorcode">2E000 </span> | <span class="errorcode">NN011 </span> | <span class="errortext">Invalid address for News Server at \[host\] </span> |
| <span class="errorcode">08001 </span> | <span class="errorcode">NN012 </span> | <span class="errortext">Unable to Contact News Server at \[host\] </span>   |
| <span class="errorcode">08006 </span> | <span class="errorcode">NN013 </span> | <span class="errortext">Misc. error in connection in nntp_post </span>      |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.226. Post message to remote NNTP**

<div>

This example post message to a remote NNTP server.

``` screen
SQL> set MACRO_SUBSTITUTION off;
SQL> select nntp_post ('news.openlinksw.co.uk:119', 
  'From: "Demo User" user@demo.com\r\nSubject: Test Virtuoso nntp_post function\r\nNewsgroups: openlink.public.test\r\n\r\nTEST IS OK.\r\n\r\n.\r\n') ;
callret
VARCHAR
_______________________________________________________________________________

1

1 Rows. -- 782 msec.
SQL> 
  
```

</div>

</div>

  

</div>

</div>
