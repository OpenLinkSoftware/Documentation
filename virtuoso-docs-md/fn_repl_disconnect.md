<div id="fn_repl_disconnect" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

repl_disconnect — terminates communication with a replication publisher

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_repl_disconnect" class="funcsynopsis">

|                              |                              |
|------------------------------|------------------------------|
| ` `**`repl_disconnect`**` (` | in `publisher ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_repl_disconnect" class="refsect1">

## Description

This terminates any communication with the publisher. Any pending
synchronization communication is disconnected and all subscribed
publications are marked as 'OFF'. The effect is reversed on a
subscription by subscription basis by calling repl_sync for each.

</div>

<div id="params_repl_disconnect" class="refsect1">

## Parameters

<div id="id105014" class="refsect2">

### publisher

Publisher's name.

</div>

</div>

<div id="examples_repl_disconnect" class="refsect1">

## Example

<div id="ex_repl_disconnect_1" class="example">

**Example 24.319. Disconnecting from publisher server 'demo-srv'.**

<div class="example-contents">

This is to disconnect from the publisher server 'demo-srv', the all
subscriptions to this server will be disconnected.

``` screen
SQL> repl_disconnect ('demo-srv');
```

</div>

</div>

  

</div>

<div id="seealso_repl_disconnect" class="refsect1">

## See Also

<a href="fn_sub_schedule.html" class="link" title="sub_schedule"><code
class="function">sub_schedule() </code></a>

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
