<div id="fn_repl_unsubscribe" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

REPL_UNSUBSCRIBE — drop subscription

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_repl_unsubscribe" class="funcsynopsis">

|                               |                             |
|-------------------------------|-----------------------------|
| ` `**`REPL_UNSUBSCRIBE`**` (` | in `server_name ` varchar , |
|                               | in `publication ` varchar , |
|                               | in `item ` varchar `)`;     |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_repl_unsubscribe" class="refsect1">

## Description

This function is used to stop receiving a replication messages from a
publisher server for a item or whole subscription. It will be invoked
automatically when a publication is dropped. The subscriber can also
invoke this function to stop receiving replication messages. The
existing items can be dropped or not depending on the copy mode flag.
The description entries for that subscription will be removed. There is
no "undo" ability. To temporally halt the replication messages you can
use repl_disconnect().

</div>

<div id="params_" class="refsect1">

## Parameters

<div id="id107092" class="refsect2">

### server_name

Name of the target publishing server.

</div>

<div id="id107095" class="refsect2">

### publication

The name of the publication.

</div>

<div id="id107098" class="refsect2">

### item

The item to removed. NULL can be supplied to remove all items.

</div>

</div>

<div id="examples_repl_unsubscribe" class="refsect1">

## Example

<div id="ex_repl_unsubscribe_1" class="example">

**Example 24.339. Unsubscribing from a publication.**

<div class="example-contents">

This is to stop replication on subscription 'demo-publication' from
publisher server 'demo-srv'.

``` screen
SQL> DB.DBA.REPL_UNSUBSCRIBE ('demo-srv', 'demo-publication', NULL);
```

</div>

</div>

  

</div>

<div id="seealso_repl_unsubscribe" class="refsect1">

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

</div>

</div>
