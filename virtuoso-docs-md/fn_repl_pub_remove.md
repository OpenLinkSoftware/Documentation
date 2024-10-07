<div id="fn_repl_pub_remove" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

REPL_PUB_REMOVE — remove item from publication.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_repl_pub_remove" class="funcsynopsis">

|                              |                             |
|------------------------------|-----------------------------|
| ` `**`REPL_PUB_REMOVE`**` (` | in `publication ` varchar , |
|                              | in `item ` varchar ,        |
|                              | in `type ` integer ,        |
|                              | in `flag ` integer `)`;     |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_repl_pub_remove" class="refsect1">

## Description

This function is used to remove an item from existing publication. It's
action is performed on publisher side and depending of flag it can send
replication message to subscribers to remove this from subscription.

</div>

<div id="params_repl_pub_remove" class="refsect1">

## Parameters

<div id="id105760" class="refsect2">

### publication

publication account name.

</div>

<div id="id105763" class="refsect2">

### item

dependent on <span class="emphasis">*type* </span> should be:

|                                                        |
|--------------------------------------------------------|
| Valid WebDAV collection full path in local repository. |
| Fully qualified table name.                            |
| Fully qualified Virtuoso/PL procedure name.            |

</div>

<div id="id105771" class="refsect2">

### type

type of item, can accept following types:

|                                      |
|--------------------------------------|
| 1 - item is a WebDAV collection.     |
| 2 - item is a database table.        |
| 3 - item is a Virtuoso/PL procedure. |

</div>

<div id="id105778" class="refsect2">

### flag

Behavior on the subscriber side

|                                                                               |
|-------------------------------------------------------------------------------|
| NULL - do not send a replication message to the subscribers.                  |
| 1 - send a message to the subscribers to remove entry from local description. |

</div>

</div>

<div id="examples_repl_pub_remove" class="refsect1">

## Example

<div id="ex_repl_pub_remove_1" class="example">

**Example 24.326. Removal of an item from publication**

<div class="example-contents">

This will remove the table Demo.demo.Products from publication.
Furthermore issuing of the replication messages for this item will be
stopped and subscriber will remove this entry from local description.

``` screen
SQL> DB.DBA.REPL_PUB_REMOVE ('demo-publication', 'Demo.demo.Products', 2, 1);
```

</div>

</div>

  

</div>

<div id="seealso_repl_pub_remove" class="refsect1">

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
