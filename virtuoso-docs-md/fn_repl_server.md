<div>

<div>

</div>

<div>

## Name

REPL_SERVER — defines a server that will participate in replication

</div>

<div>

## Synopsis

<div>

|                          |                                        |
|--------------------------|----------------------------------------|
| ` `**`REPL_SERVER`**` (` | in `server_name ` varchar ,            |
|                          | in `dsn ` varchar ,                    |
|                          | in `replication_address ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function defines a server that will participate in replication. The
name is a symbolic name that should match the name specified as the
ServerName configuration parameter in the replication section of the
virtuoso.ini file of the server being defined. The address is the
\<host:port\> where the server designated by the name is listening. The
DSN is an ODBC data source name referring to the server, so that the
subscriber can retrieve schema and other information. Note that
replication communication itself does not take place through ODBC but
that ODBC access to the publisher is required to initiate the
subscription. In order to subscribe to publications from a server the
server must first be declared with this function. If this function is
called to define the local server, i.e. the given server name is the
ServerName in the Replication section of the local ini file the function
has no effect.

</div>

<div>

## Parameters

<div>

### server_name

unique replication server name of publisher (specified in
\[Replication\] -\> \[ServerName\] section in ini file of publisher).

</div>

<div>

### dsn

data source name of publisher.

</div>

<div>

### replication_address

host:port pair of publishing server where this subscriber will connect
to.

</div>

</div>

<div>

## Example

<div>

**Example 24.329. Adding a new publisher server**

<div>

This is to define a new publisher server in the subscriber's Database.
The DSN of publisher is named 'Virtuoso 1111', so it is started on the
same machine on port 1111.

``` screen
SQL> DB.DBA.REPL_SERVER ('demo-pub', 'Virtuoso 1111', '127.0.0.1:1111');
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_sub_schedule.html" class="link" title="sub_schedule"><code
class="function">sub_schedule() </code></a>

<a href="fn_repl_disconnect.html" class="link"
title="repl_disconnect"><code
class="function">repl_disconnect() </code></a>

<a href="fn_repl_grant.html" class="link" title="REPL_GRANT"><code
class="function">repl_grant() </code></a>

<a href="fn_repl_init_copy.html" class="link"
title="REPL_INIT_COPY"><code
class="function">repl_init_copy() </code></a>

<a href="fn_repl_new_log.html" class="link" title="repl_new_log"><code
class="function">repl_new_log() </code></a>

<a href="fn_repl_pub_add.html" class="link" title="REPL_PUB_ADD"><code
class="function">repl_pub_add() </code></a>

<a href="fn_repl_pub_init_image.html" class="link"
title="REPL_PUB_INIT_IMAGE"><code
class="function">repl_pub_init_image() </code></a>

<a href="fn_repl_pub_remove.html" class="link"
title="REPL_PUB_REMOVE"><code
class="function">repl_pub_remove() </code></a>

<a href="fn_repl_publish.html" class="link" title="REPL_PUBLISH"><code
class="function">repl_publish() </code></a>

<a href="fn_repl_revoke.html" class="link" title="REPL_REVOKE"><code
class="function">repl_revoke() </code></a>

<a href="fn_repl_sched_init.html" class="link"
title="REPL_SCHED_INIT"><code
class="function">repl_sched_init() </code></a>

<a href="fn_repl_server_rename.html" class="link"
title="repl_server_rename"><code
class="function">repl_server_rename() </code></a>

<a href="fn_repl_stat.html" class="link" title="REPL_STAT"><code
class="function">repl_stat() </code></a>

<a href="fn_repl_status.html" class="link" title="repl_status"><code
class="function">repl_status() </code></a>

<a href="fn_repl_subscribe.html" class="link"
title="REPL_SUBSCRIBE"><code
class="function">repl_subscribe() </code></a>

<a href="fn_repl_sync.html" class="link" title="repl_sync"><code
class="function">repl_sync() </code></a>

<a href="fn_repl_sync_all.html" class="link" title="repl_sync_all"><code
class="function">repl_sync_all() </code></a>

<a href="fn_repl_text.html" class="link" title="repl_text"><code
class="function">repl_text() </code></a>

<a href="fn_repl_this_server.html" class="link"
title="repl_this_server"><code
class="function">repl_this_server() </code></a>

<a href="fn_repl_unpublish.html" class="link"
title="REPL_UNPUBLISH"><code
class="function">repl_unpublish() </code></a>

<a href="fn_repl_unsubscribe.html" class="link"
title="REPL_UNSUBSCRIBE"><code
class="function">repl_unsubscribe() </code></a>

</div>

</div>
