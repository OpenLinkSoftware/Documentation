<div id="fn_repl_status" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

repl_status — returns status of a published or subscribed publication

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_repl_status" class="funcsynopsis">

|                          |                             |
|--------------------------|-----------------------------|
| ` `**`repl_status`**` (` | in `publisher ` varchar ,   |
|                          | in `publication ` varchar , |
|                          | out `level ` integer ,      |
|                          | out `stat ` integer `)`;    |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_repl_status" class="refsect1">

## Description

Given a publisher and publication name this returns the status of the
publication on the local server.

</div>

<div id="params_repl_status" class="refsect1">

## Parameters

<div id="id106356" class="refsect2">

### publisher

Name of the publisher.

</div>

<div id="id106359" class="refsect2">

### publication

Name of the publication.

</div>

<div id="id106362" class="refsect2">

### level

If the publisher is the name of the local server this returns the next
transaction number to be assigned to a transaction as the level output
parameter.

If the publisher is other than the local server this returns the
transaction number of the last transaction of that publication that has
successfully been replicated to the local database as the level output
parameter.

</div>

<div id="id106366" class="refsect2">

### stat

The stat output parameter reflects the current state of the
subscription. If the publisher is the local server the stat is always 0.
Otherwise it has the following possible values:

|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*0 - off* </span> The subscription exists but there is no present or past activity..                                                                                                                                                                                                                                                                                                                                                                                                 |
| <span class="emphasis">*1 - syncing* </span> - A sync has successfully been requested and transactions are coming from the publisher at the present time.                                                                                                                                                                                                                                                                                                                                                   |
| <span class="emphasis">*2 - in sync*</span> - The syncing phase has terminated and and this server is in sync with the publisher. This does not mean all the publisher's published transactions have at all times been replayed but this does mean that the sync request reached the end of the replication transaction log and that the servers were in sync at that moment.                                                                                                                               |
| <span class="emphasis">*3 - disconnected by remote*</span> - The remote has disconnected this subscriber. This may be for various reasons, including that this subscriber has fallen too far behind in replaying the published transaction and has thus fallen out of sync. This state means that a resync can be retried with the `repl_sync()` function.                                                                                                                                                  |
| <span class="emphasis">*4 - disconnected locally*</span> - This state is set for forward (publisher to subscriber) accounts when the corresponding pushback account is disconnected because of replication queue overflow. This state means that a resync can be retried with the `repl_sync()` function.                                                                                                                                                                                                   |
| <span class="emphasis">*5 - waiting for local disconnect*</span> - Local disconnect is about to happen for this account. This state is set for forward (publisher to subscriber) accounts when corresponding pushback account is disconnected because of replication queue overflow. This state means that "disconnected locally" state will be set for this account when next replication message for this account arrives. This state means that a resync can be retried with the `repl_sync()` function. |

</div>

</div>

<div id="examples_repl_status" class="refsect1">

## Example

<div id="ex_repl_status_1" class="example">

**Example 24.332. Retrieving the subscription status**

<div class="example-contents">

This example shows an analogue of the REPL_STAT() function.

``` screen
create procedure MY_REPL_STAT ()
{
  declare server, account, status varchar;
  declare level, stat integer;
  status := vector ('OFF', 'SYNCING', 'IN SYNC', 'REMOTE DISCONNECTED', 'DISCONNECTED', 'TO DISCONNECT');
  result_names (server, account, level, stat);
  for select SERVER, ACCOUNT from DB.DBA.SYS_REPL_ACCOUNTS do
    {
      repl_status (SERVER, ACCOUNT, level, stat);
        result (SERVER, ACCOUNT, level, aref (status, stat));
    }
};
```

</div>

</div>

  

</div>

<div id="seealso_repl_status" class="refsect1">

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
