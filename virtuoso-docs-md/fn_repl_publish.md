<div id="fn_repl_publish" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

REPL_PUBLISH — create publication on publisher

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_repl_publish" class="funcsynopsis">

|                           |                               |
|---------------------------|-------------------------------|
| ` `**`REPL_PUBLISH`**` (` | in `publication ` varchar ,   |
|                           | in `log_path ` varchar ,      |
|                           | in `is_updateable ` integer , |
|                           | in `sync_user ` varchar `)`;  |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_repl_publish" class="refsect1">

## Description

This function starts a publication and associates a file system file to
it. The file will be used to log transaction records associated to the
publication. The server will periodically start new files, so that
replication log files do not grow indefinitely. New files will go to the
same directory as the initial one and will have names suffixed with the
date and time of their creation.

</div>

<div id="params_repl_publish" class="refsect1">

## Parameters

<div id="id105415" class="refsect2">

### publication

Publication name. It must not contain spaces or special symbols.

</div>

<div id="id105418" class="refsect2">

### log_path

Full path and filename to the file where transactions to this account
will be stored.

</div>

<div id="id105421" class="refsect2">

### is_updateable

If this parameter is specified and it is non-zero an updateable
publication is created.

</div>

<div id="id105424" class="refsect2">

### sync_user

Local DB account used to replay replication feeds from subscribers (when
publication is updateable).

</div>

</div>

<div id="examples_repl_publish" class="refsect1">

## Example

<div id="ex_repl_publish_1" class="example">

**Example 24.323. Creating an updateable publication**

<div class="example-contents">

This will create an updateable publication'demo-publication' with log
'demo-publication.log'. Replication feeds from subscribers will be
replayed by used 'demo'.

``` screen
SQL> DB.DBA.REPL_PUBLISH ('demo-publication', 'demo-publication.log', 1, 'demo');
```

</div>

</div>

  

</div>

<div id="seealso_repl_publish" class="refsect1">

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
