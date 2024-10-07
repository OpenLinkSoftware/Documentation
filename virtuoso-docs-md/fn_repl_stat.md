<div id="fn_repl_stat" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

REPL_STAT — retrieve status of all subscriptions and publications

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_repl_stat" class="funcsynopsis">

|                        |      |
|------------------------|------|
| ` `**`REPL_STAT`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_repl_stat" class="refsect1">

## Description

Retrieves status of all subscriptions and publications. This function is
for interactive use (via ISQL tool).

</div>

<div id="examples_repl_stat" class="refsect1">

## Example

<div id="ex_repl_stat_1" class="example">

**Example 24.331. Retrieving of the replication status**

<div class="example-contents">

This is to show status of the subscriptions. The server shows the name
of publisher, account is a name of the publication account, level is a
current level of the publication and stat is a current status of the
publication/subscription. Note that status for local publications are
shown always as OFF, it is to show only subscription status.

``` screen
SQL> DB.DBA.REPL_STAT ();
server                    account                   level       stat
VARCHAR                   VARCHAR                   INTEGER     INTEGER
_______________________________________________________________________________

my-rep                    my-rep                    0           OFF
demo-rep1         demo_tb           3       IN SYNC
```

</div>

</div>

  

</div>

<div id="seealso_repl_stat" class="refsect1">

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
