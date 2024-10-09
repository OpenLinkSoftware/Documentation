<div>

<div>

</div>

<div>

## Name

repl_purge — purges transactional replication logs for specified account

</div>

<div>

## Synopsis

<div>

|                         |                            |
|-------------------------|----------------------------|
| ` `**`repl_purge`**` (` | in `server ` varchar ,     |
|                         | in `account ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This procedure purges transactional replication logs for specified
account. Logs whose start replication level lags more than
REPL_MAX_DELTA (1000000000) transactions behind current replication
level of a specified account are removed. After `repl_purge()` is
finished next `repl_purge()` run is scheduled using SYS_SCHEDULED_EVENT
facility.

Account sync requests from subscribers are delayed while `repl_purge() `
is running for this account.

</div>

<div>

## Parameters

<div>

### server

The server name of the publisher.

</div>

<div>

### account

The name assigned to the publication.

</div>

</div>

<div>

## Example

<div>

**Example 24.340. Purging transactional replication logs**

<div>

The following shows purging transactional replication logs for pushback
account for updateable subscription 'demopub' from 'demoserver':

``` screen
SQL> repl_purge ('demoserver', '!demopub');
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_repl_publish.html" class="link" title="REPL_PUBLISH"><code
class="function">repl_publish() </code></a>

<a href="fn_repl_subscribe.html" class="link"
title="REPL_SUBSCRIBE"><code
class="function">repl_subscribe() </code></a>

<a href="fn_repl_unpublish.html" class="link"
title="REPL_UNPUBLISH"><code
class="function">repl_unpublish() </code></a>

<a href="fn_repl_unsubscribe.html" class="link"
title="REPL_UNSUBSCRIBE"><code
class="function">repl_unsubscribe() </code></a>

</div>

</div>
