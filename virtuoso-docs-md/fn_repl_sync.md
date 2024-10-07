<div id="fn_repl_sync" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

repl_sync — starts the syncing process against an existing subscription

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_repl_sync" class="funcsynopsis">

|                        |                             |
|------------------------|-----------------------------|
| ` `**`repl_sync`**` (` | in `publisher ` varchar ,   |
|                        | in `publication ` varchar , |
|                        | in `uid ` varchar ,         |
|                        | in `password ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_repl_sync" class="refsect1">

## Description

This starts the syncing process against an existing subscription. The
function returns as soon as the request has been successfully sent. The
synchronization will take place in the background. If the syncing
process is already underway or if the subscriber is already in sync and
connected to the publisher this function has no effect. If there is no
connection to the publisher at the time of calling this function and the
connection fails and an error is immediately signalled. To initiate a
synchronization a valid SQL account must be specified. Also the account
must have rights to the publication unless publisher DBA's account is
used to connect.

</div>

<div id="params_repl_sync" class="refsect1">

## Parameters

<div id="id106608" class="refsect2">

### publisher

The server name of the publisher.

</div>

<div id="id106611" class="refsect2">

### publication

The name assigned to the publication.

</div>

<div id="id106614" class="refsect2">

### uid

SQL account with rights to the publication, or publishers DBA account
credentials will be required.

</div>

<div id="id106617" class="refsect2">

### password

SQL account password.

</div>

</div>

<div id="examples_repl_sync" class="refsect1">

## Example

<div id="ex_repl_sync" class="example">

**Example 24.334. Synchronizing a subscription**

<div class="example-contents">

The following shows requesting a sync from publisher for an existing
subscription. The account for authentication is a 'repl_user' SQL
account.

``` screen
SQL> repl_sync ('demo-srv', 'demo-publication', 'repl_user', 'repl_passwd');
```

</div>

</div>

  

</div>

<div id="seealso_repl_sync" class="refsect1">

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

<a href="fn_repl_subscribe.html" class="link"
title="REPL_SUBSCRIBE"><code
class="function">repl_subscribe() </code></a>

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
