<div id="fn_nntp_get" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

nntp_get — Returns information about an NNTP server.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_nntp_get_01" class="funcsynopsis">

|                            |                                 |
|----------------------------|---------------------------------|
| `array `**`nntp_get`**` (` | in `server ` varchar ,          |
|                            | in `command ` varchar ,         |
|                            | in `group ` varchar ,           |
|                            | in `first_message ` integer ,   |
|                            | in `last_message ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_nntp_get_01" class="refsect1">

## Description

`nntp_get() ` is used to retrieve messages from a server running the
Network News Transfer Protocol (NNTP) as defined in
<a href="http://www.rfc-editor.org/rfc/rfc977.txt" class="ulink"
target="_top">RFC977</a> . It returns an array whose structure depends
on the *`command`* parameter, thus:

|                                                                                                                                                                                                                           |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*list*</span> : an array of vectors, each of which contain the name of the news group, the first message number, the last message number, and a single character 'y' or 'n' as a flag for posting. |
| <span class="emphasis">*group*</span> : a vector of three elements: total number of messages in the group, the number of the first message, and the number of the last message.                                           |
| <span class="emphasis">*stat*</span> : an array of vectors, each of which contains the number of the message and the message id.                                                                                          |
| <span class="emphasis">*article, body, head*</span> : an array of vectors each containing the message number and the requested part of the message.                                                                       |

</div>

<div id="params_nntp_get_01" class="refsect1">

## Parameters

<div id="id97282" class="refsect2">

### server

The IP address or \<hostname:port\> of the host with which to connect.
There is no default for *`port`* , so to connect to the standard port
for NNTP, use \<hostname/IP address\>:119.

</div>

<div id="id97286" class="refsect2">

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

<div id="id97298" class="refsect2">

### group

A <span class="type">string </span> containing the name of the
newsgroup.

</div>

</div>

<div id="ret_04" class="refsect1">

## Return Types

A vector of vectors the content of which depends on the *`command `*
parameter.

</div>

<div id="errors_nntp_get_01" class="refsect1">

## Errors

<div id="id97308" class="table">

**Table 24.59. Errors signalled by**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                  |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">NN006 </span> | <span class="errortext">the command is not recognized </span>               |
| <span class="errorcode">22023 </span> | <span class="errorcode">NN001 </span> | <span class="errortext">Large ID in nntp_id_get </span>                     |
| <span class="errorcode">2E000 </span> | <span class="errorcode">NN002 </span> | <span class="errortext">Invalid address for News Server at \[host\] </span> |
| <span class="errorcode">08001 </span> | <span class="errorcode">NN003 </span> | <span class="errortext">Unable to Contact News Server at \[host\] </span>   |
| <span class="errorcode">08006 </span> | <span class="errorcode">NN004 </span> | <span class="errortext">Lost connection with NNTP server </span>            |
| <span class="errorcode">08006 </span> | <span class="errorcode">NN005 </span> | <span class="errortext">Misc. error in connection in nntp_get </span>       |

</div>

</div>

  

</div>

<div id="examples_nntp_get_01" class="refsect1">

## Examples

<div id="ex_nntp_get_1_01" class="example">

**Example 24.225. Get remote messages**

<div class="example-contents">

This example retrieves messages from a remote NNTP server and stores
them in a table.

``` screen
create table my_news (m_id integer, m_group varchar, m_text long varchar, 
  primary key (m_id, m_group));

create procedure get_my_news (in server varchar, in grp varchar)
{
   declare res, ent any;
   declare i, l integer;
   res := nntp_get (server, 'article', grp, 0, 1000);
   i := 0; l := length (res);
   while (i < l)
     {
     ent := res [i];
       insert replacing my_news (m_id, m_group, m_text) 
       values (ent[0], grp, ent[1]);
     i := i + 1;
     }
}
  
```

Here is a test run. We extract the article subject with the
`mail_header()` function.

``` screen
SQL> get_my_news ('news.techno-link.com:119', 'comp.lang.java.api');

SQL> select m_id, mail_header (m_text, 'Subject') from my_news;
m_id              callret
INTEGER NOT NULL  VARCHAR
_______________________________________________________________________________

2                 New java method modifier "partial":  not quite abstract, not quite concrete
3                 Senior Design Project Ideas
4                 java & dummy terminals
5                 Re: What is the equivalent of WORD in Java
6                 Re: What is the equivalent of WORD in Java
  
```

</div>

</div>

  

</div>

</div>
