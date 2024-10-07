<div id="fn_repl_subscribe" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

REPL_SUBSCRIBE — add a subscription

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_repl_subscribe" class="funcsynopsis">

|                             |                                      |
|-----------------------------|--------------------------------------|
| ` `**`REPL_SUBSCRIBE`**` (` | in `server_name ` varchar ,          |
|                             | in `publication ` varchar ,          |
|                             | in `dav_user ` varchar ,             |
|                             | in `dav_group ` varchar ,            |
|                             | in `replication_user ` varchar ,     |
|                             | in `replication_password ` varchar , |
|                             | in `sync_user ` varchar `)`;         |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_repl_subscribe" class="refsect1">

## Description

This function is used to subscribe to an existing publication, and to
specify the local WebDAV owner for replicated WebDAV content. Before
making a subscription the `repl_server()` function must be called in
order to define the publishing server. After making a subscription it
becomes off-line awaiting synchronization from a scheduled task or call
to the `repl_sync()` function. Also the initial data of the subscription
will be not loaded until `repl_init_copy()` is called or the initial
image has been loaded.

</div>

<div id="params_repl_subscribe" class="refsect1">

## Parameters

<div id="id106490" class="refsect2">

### server_name

target publisher server name.

</div>

<div id="id106493" class="refsect2">

### publication

publication account name.

</div>

<div id="id106496" class="refsect2">

### dav_user

A valid local WebDAV user account name that will own local copy. If this
is null 'REPLICATION' user account will be created that will be disabled
by default.

</div>

<div id="id106499" class="refsect2">

### dav_group

A valid local WebDAV group name to own the local copy.

</div>

<div id="id106502" class="refsect2">

### replication_user

Is used for authentication on the publisher. This should be a valid DB
account on publisher.

</div>

<div id="id106505" class="refsect2">

### replication_password

Is used for authentication on the publisher. This should be valid
password for *`replication_user `* on publisher.

</div>

<div id="id106509" class="refsect2">

### sync_user

A local DB account used to replay replication feeds.

</div>

</div>

<div id="examples_repl_subscribe" class="refsect1">

## Example

<div id="ex_repl_subscribe_1" class="example">

**Example 24.333. Subscribing to a publication**

<div class="example-contents">

This example shows making a subscription to the 'table_publication'
published on a 'demo-srv' server. The WebDAV items will belong to the
WebDAV administrator.

``` screen
SQL> DB.DBA.REPL_SUBSCRIBE ('demo-srv','demo-publication', 'dav', 'dav', 'demo', 'demo');
```

</div>

</div>

  

</div>

<div id="seealso_repl_subscribe" class="refsect1">

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

<a href="fn_repl_server.html" class="link" title="REPL_SERVER"><code
class="function">repl_server() </code></a>

<a href="fn_repl_server_rename.html" class="link"
title="repl_server_rename"><code
class="function">repl_server_rename() </code></a>

<a href="fn_repl_stat.html" class="link" title="REPL_STAT"><code
class="function">repl_stat() </code></a>

<a href="fn_repl_status.html" class="link" title="repl_status"><code
class="function">repl_status() </code></a>

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
