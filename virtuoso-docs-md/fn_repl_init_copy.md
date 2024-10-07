<div id="fn_repl_init_copy" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

REPL_INIT_COPY — create initial subscription state

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_repl_init_copy" class="funcsynopsis">

|                             |                                |
|-----------------------------|--------------------------------|
| ` `**`REPL_INIT_COPY`**` (` | in `server_name ` varchar ,    |
|                             | in `publication ` varchar ,    |
|                             | in `errors_mode ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_repl_init_copy" class="refsect1">

## Description

This function is called on the subscriber to copy the current state of
the elements of the publication from the publishing server. Copied data
can include DAV collections, tables, procedures etc. Syncing the
subscription using repl_sync will synchronize the subscription once it
has been initialized with this function. The state copied corresponds to
the state of the published data as of the last checkpoint completed on
the publisher.

</div>

<div id="params_repl_init_copy" class="refsect1">

## Parameters

<div id="id105209" class="refsect2">

### server_name

target publisher server name.

</div>

<div id="id105212" class="refsect2">

### account

publication account name.

</div>

<div id="id105215" class="refsect2">

### errors_mode

Important: this parameter is valid only for SQL replication data (tables
and WebDAV). When set to 1, in case of errors as result of the
replication copy, these errors are return in vector; When set to 0, in
case of error, this error is return and the replication copying is
stopped.

</div>

</div>

<div id="examples_repl_init_copy" class="refsect1">

## Example

<div id="ex_repl_pub_copy_1" class="example">

**Example 24.321. Loading of the initial data on subscriber**

<div class="example-contents">

This shows setting on-line of the initial state of the subscription to
'demo_publication' from server 'demo-srv'. The data for items will be
transferred thru the VDB connection. Note that on large publications
this can take a lot of time.

``` screen
SQL> DB.DBA.REPL_INIT_COPY ('demo-srv', 'demo_publication', 1);
```

</div>

</div>

  

</div>

<div id="seealso_repl_init_copy" class="refsect1">

## See Also

<a href="fn_sub_schedule.html" class="link" title="sub_schedule"><code
class="function">sub_schedule() </code></a>

<a href="fn_repl_disconnect.html" class="link"
title="repl_disconnect"><code
class="function">repl_disconnect() </code></a>

<a href="fn_repl_grant.html" class="link" title="REPL_GRANT"><code
class="function">repl_grant() </code></a>

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

<a href="fn_repl_server.html" class="link" title="REPL_SERVER"><code
class="function">repl_server() </code></a>

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
