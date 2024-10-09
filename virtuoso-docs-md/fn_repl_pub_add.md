<div>

<div>

</div>

<div>

## Name

REPL_PUB_ADD — add item to a publication

</div>

<div>

## Synopsis

<div>

|                           |                                                  |
|---------------------------|--------------------------------------------------|
| ` `**`REPL_PUB_ADD`**` (` | in `publication ` varchar ,                      |
|                           | in `item ` varchar ,                             |
|                           | in `type ` integer ,                             |
|                           | in `mode ` integer ,                             |
|                           | in `procedure_replication_options ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to add items to a pre-existing publication and to
set replication options for the published items. Operations concerning
the added item will henceforth be logged into the publication's log.
Performing this operation will copy the item and optionally its
definition to existing subscribers.

</div>

<div>

## Parameters

<div>

### publication

publication account name.

</div>

<div>

### item

dependent on <span class="emphasis">*type* </span> should be:

|                                                        |
|--------------------------------------------------------|
| Valid WebDAV collection full path in local repository. |
| Fully qualified table name.                            |
| Fully qualified Virtuoso/PL procedure name.            |

</div>

<div>

### type

type of item, can accept following types:

|                                      |
|--------------------------------------|
| 1 - item is a WebDAV collection.     |
| 2 - item is a database table.        |
| 3 - item is a Virtuoso/PL procedure. |

</div>

<div>

### mode

mode of remote copy:

|                                                                   |
|-------------------------------------------------------------------|
| 0 - if publication is removed leave remote copy (on subscribers). |
| 1 - if publication is removed drop remote copy (on subscribers).  |

</div>

<div>

### procedure_replication_options

valid only in case of Virtuoso/PL procedure:

|                                          |
|------------------------------------------|
| 1 - published procedure calls.           |
| 2 - published procedure definition.      |
| 3 - published both calls and definition. |

</div>

</div>

<div>

## Example

<div>

**Example 24.324. Adding a table to the publication**

<div>

This is to add a table Demo.demo.Orders (available in the demo DataBase)
to the an existing publication named table_publication. The default flag
for removal when publication is dropped is set to off. The parameter
mode is NULL as it has effect only for procedures.

``` screen
SQL> DB.DBA.REPL_PUB_ADD ('table_publication', 'Demo.demo.Orders', 2, 0, NULL);
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
