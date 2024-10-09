<div>

<div>

</div>

<div>

## Name

repl_server_rename — rename the publishing server instance

</div>

<div>

## Synopsis

<div>

|                                 |                             |
|---------------------------------|-----------------------------|
| ` `**`repl_server_rename`**` (` | in `old_name ` varchar ,    |
|                                 | in `new_name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is useful to rename the publishing servers data (that
stored in to the replication tables) after renaming the server in
virtuoso.ini file. The call of the procedure will associate the all data
belong to the old server name to the current server name. It will also
set the appropriate transaction levels. In case of duplicate
publications (publications with the same name exists in old and new
server definitions) it will reject the operation.

</div>

<div>

## Parameters

<div>

### old_name

The old name of the publishing server.

</div>

<div>

### new_name

The new name of the publishing server (must be the same as ServerName
from Replication section of INI file).

</div>

</div>

<div>

## Example

<div>

**Example 24.330. Renaming of the existing publisher server**

<div>

An existing publisher 'demo-pub' server is renamed to the 'working-pub'.
In order to update the subscriber descriptions we MUST issue the
following:

``` screen
SQL> DB.DBA.REPL_SERVER_RENAME ('demo-pub', 'working-pub');
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

<a href="fn_repl_server.html" class="link" title="REPL_SERVER"><code
class="function">repl_server() </code></a>

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
