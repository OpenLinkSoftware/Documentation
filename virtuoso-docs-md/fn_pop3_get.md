<div>

<div>

</div>

<div>

## Name

pop3_get — get messages from a POP3 server

</div>

<div>

## Synopsis

<div>

|                            |                                     |
|----------------------------|-------------------------------------|
| `array `**`pop3_get`**` (` | in `host ` varchar ,                |
|                            | in `user ` varchar ,                |
|                            | in `password ` varchar ,            |
|                            | in `buffer_size ` integer ,         |
|                            | in `command ` varchar ,             |
|                            | in `exclude_uidl_list ` vector `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`Pop3_get ` is used to retrieve and delete messages from a server
running the Post Office Protocol version 3 as defined in rfc1725. In its
default form it returns a vector of vectors containing messages
retrieved from the POP3 server. Each vector within the vector contains a
pair of <span class="type">VARCHAR</span> UIDL and
<span class="type">VARCHAR</span> Message body, i.e. to get the message
body of the second message retrieved, one would use
`aref (aref (msg_vec, 1), 1)` . Total length of messages retrieved will
not exceed the value of *`buffer_size`* parameter in bytes.

The optional parameter *`command`* can be used to control output or
delete messages. When *`command`* is passed a
<span class="type">VARCHAR</span> 'uidl', `pop3_get` outputs single
vector containing <span class="type">VARCHAR</span> UIDLs. The
*`buffer_size`* constraint is effective here. Thus, the vector will only
contain UIDLs of messages whose total message text length does not
exceed *`buffer_size`* bytes. These message lengths are accumulated in
the order returned by the POP3 server.

Command 'delete' will cause retrieved messages to be deleted from the
server after retrieval.

</div>

<div>

## Parameters

<div>

### host

The host to connect with. IP address or hostname:port. There is no
default for port, so to connect to the standard port for POP3, use
\<hostname/IP address\>:110

</div>

<div>

### user

<span class="type">string </span> user id in remote host.

</div>

<div>

### password

<span class="type">string </span> password in remote host.

</div>

<div>

### buffer_size

<span class="type">integer </span> maximum total length of message text
for messages/uidls to be retrieved.

</div>

<div>

### command

Command <span class="type">string </span> . Valid values are empty,
'uidl' or 'delete'

</div>

<div>

### exclude_uidl_list

A <span class="type">vector </span> containing UIDLs. A message whose
UIDL appears in this list will not be retrieved or deleted.

</div>

</div>

<div>

## Return Types

A vector of vectors containing UIDL/Message text
<span class="type">strings </span> or a 'flat' vector containing UIDL
<span class="type">strings </span> .

</div>

<div>

## Errors

<div>

**Table 24.61. Errors signalled by**

<div>

| SQLState                              | Error Code                            | Error Text                                                                                  | Description |
|---------------------------------------|---------------------------------------|---------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">2E000 </span> | <span class="errorcode">PO001 </span> | <span class="errortext">Cannot resolve host in pop3_get </span>                             |             |
| <span class="errorcode">08001 </span> | <span class="errorcode">PO002 </span> | <span class="errortext">Cannot connect in pop3_get </span>                                  |             |
| <span class="errorcode">08006 </span> | <span class="errorcode">PO003 </span> | <span class="errortext">No response from remote POP3 server </span>                         |             |
| <span class="errorcode">08006 </span> | <span class="errorcode">PO004 </span> | <span class="errortext">Not valid user in remote POP3 server </span>                        |             |
| <span class="errorcode">08006 </span> | <span class="errorcode">PO005 </span> | <span class="errortext">UIDL command to remote POP3 server failed </span>                   |             |
| <span class="errorcode">08006 </span> | <span class="errorcode">PO006 </span> | <span class="errortext">Could not get output of UIDL from remote POP3 server. </span>       |             |
| <span class="errorcode">08006 </span> | <span class="errorcode">PO007 </span> | <span class="errortext">LIST command to remote POP3 server failed. </span>                  |             |
| <span class="errorcode">08006 </span> | <span class="errorcode">PO008 </span> | <span class="errortext">Could not get output of LIST from remote POP3 server. </span>       |             |
| <span class="errorcode"></span>       | <span class="errorcode">PO009 </span> | <span class="errortext"></span>                                                             |             |
| <span class="errorcode">08006 </span> | <span class="errorcode">PO010 </span> | <span class="errortext">Failed reading output of LIST command on remote POP3 server </span> |             |
| <span class="errorcode">08006 </span> | <span class="errorcode">PO011 </span> | <span class="errortext">Could not DELE messages from remote POP3 server </span>             |             |
| <span class="errorcode">08006 </span> | <span class="errorcode">PO012 </span> | <span class="errortext">Could not QUIT from remote POP3 server </span>                      |             |
| <span class="errorcode">08000 </span> | <span class="errorcode">PO013 </span> | <span class="errortext">Argument 6 to pop3_get must be a vector </span>                     |             |
| <span class="errorcode">08006 </span> | <span class="errorcode">PO014 </span> | <span class="errortext">Misc. error in connection in pop3_get </span>                       |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.244. Get messages from remote POP3**

<div>

This example retrieves messages from a remote POP3 server and stores
them in a table.

``` screen
create table MY_MSGS (MSG_ID INTEGER IDENTITY,
                      MSG_HOST VARCHAR,
                      MSG_UIDL VARCHAR,
                      MSG_TEXT LONG VARCHAR,
                      primary key (MSG_ID, MSG_HOST, MSG_UIDL));

create procedure
get_msgs (in pop_host varchar, in pop_uid varchar, in pop_pwd varchar)
{
  declare msg_vec any;
  declare inx integer;

  msg_vec := pop3_get (concat (pop_host, ':110'),
                   pop_uid,
                   pop_pwd,
                   10000000,
                   'delete');

  inx := 0;

  while (inx < length (msg_vec))
    {
      insert into MY_MSGS (MSG_HOST, MSG_UIDL, MSG_TEXT)
             values (pop_host,
             aref (aref (msg_vec, inx), 0),
             aref (aref (msg_vec, inx), 1));

      inx := inx + 1;
    }
}
```

Here is a test run. Just for the fun, let's get the message subjects,
too.

``` screen
SQL> get_msgs('pop.xs4all.nl', 'ghard', '|_337h4x0R');

SQL> select MSG_UIDL, length (MSG_TEXT), get_keyword ('Subject', aref (mime_tree (MSG_TEXT), 0)) from MY_MSGS;
MSG_UIDL          callret   callret
VARCHAR NOT NULL  INTEGER   VARCHAR
_______________________________________________________________________________

1003930514.maildrop7.14798  3482      [Fwd: Linux Expo]
1003930555.maildrop7.15349  7683      [Fwd: SOAP options example]

2 Rows. -- 8 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_mime_tree.html" class="link" title="mime_tree"><code
class="function">mime_tree </code></a> ,
<a href="http://www.ietf.org/rfc/rfc1725" class="ulink"
target="_top">RFC1725</a>

</div>

</div>
