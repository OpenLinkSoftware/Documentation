<div id="fn_nntp_post" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

nntp_post — Post message to NNTP server

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_nntp_post" class="funcsynopsis">

|                             |                         |
|-----------------------------|-------------------------|
| `array `**`nntp_post`**` (` | in `server ` varchar ,  |
|                             | in `body ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_nntp_post" class="refsect1">

## Description

`Nntp_post ` is used to post a message to the server running the Network
News Transfer Protocol as defined in the rfc977.

</div>

<div id="params_nntp_post" class="refsect1">

## Parameters

<div id="id97390" class="refsect2">

### server

The host to connect with. IP address or hostname:port. There is no
default for port, so to connect to the standard port for NNTP, use
\<hostname/IP address\>:119

</div>

<div id="id97393" class="refsect2">

### body

The body <span class="type">string </span> The structure of the message
must comply with RFC 850 (Standard for Interchange of USENET Messages).

</div>

</div>

<div id="ret_05" class="refsect1">

## Return Types

1 on success or error

</div>

<div id="errors_nntp_post" class="refsect1">

## Errors

<div id="id97402" class="table">

**Table 24.60. Errors signalled by**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                  |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------|
| <span class="errorcode">2E000 </span> | <span class="errorcode">NN011 </span> | <span class="errortext">Invalid address for News Server at \[host\] </span> |
| <span class="errorcode">08001 </span> | <span class="errorcode">NN012 </span> | <span class="errortext">Unable to Contact News Server at \[host\] </span>   |
| <span class="errorcode">08006 </span> | <span class="errorcode">NN013 </span> | <span class="errortext">Misc. error in connection in nntp_post </span>      |

</div>

</div>

  

</div>

<div id="examples_nntp_post" class="refsect1">

## Examples

<div id="ex_nntp_post_1" class="example">

**Example 24.226. Post message to remote NNTP**

<div class="example-contents">

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
