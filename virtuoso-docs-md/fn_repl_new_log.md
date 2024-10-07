<div id="fn_repl_new_log" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

repl_new_log — create new publication log

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_repl_new_log" class="funcsynopsis">

|                           |                             |
|---------------------------|-----------------------------|
| ` `**`repl_new_log`**` (` | in `publication ` varchar , |
|                           | in `file ` varchar `)`;     |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_repl_new_log" class="refsect1">

## Description

This function switches to a new file for logging data for the
publication. If the file is NULL a new file name will be generated based
on the previous file name by appending or replacing a datetime field in
the file name.

</div>

<div id="params_repl_new_log" class="refsect1">

## Parameters

<div id="id105310" class="refsect2">

### publication

publication account name.

</div>

<div id="id105313" class="refsect2">

### file

name of file to be used for publication's transactions logging, if size
exceed 1Mb limit a new file suffixed with timestamp will be opened.

</div>

</div>

<div id="examples_repl_new_log" class="refsect1">

## Example

<div id="ex_repl_new_log_1" class="example">

**Example 24.322. Opening a new replication log**

<div class="example-contents">

This command can be issued on the publisher server to swith replication
logging to the new file 'new_log_file_name.log'. In practice we make a
publication with REPL_PUBLISH() and it opens the replication log file,
so this is for maintenance only. Furthermore the replication server will
switch to a new log suffixed with timestamp when current file is greater
than 1,000,000 bytes.

``` screen
SQL> repl_new_log ('demo-publication', 'new_log_file_name.log');
```

</div>

</div>

  

</div>

<div id="seealso_repl_new_log" class="refsect1">

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

<a href="fn_repl_unsubscribe.html" class="link"
title="REPL_UNSUBSCRIBE"><code
class="function">repl_unsubscribe() </code></a>

</div>

</div>
