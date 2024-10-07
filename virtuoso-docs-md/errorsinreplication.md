<div id="errorsinreplication" class="section">

<div class="titlepage">

<div>

<div>

### 13.3.2. Errors in Replication

</div>

</div>

</div>

A statement received for replication from a publisher may encounter an
error. All Such errors are logged into the subscriber's error log file.
If the error is retryable, like a deadlock, retries are made until the
operation succeeds. If Other errors are simply skipped and replication
proceeds. A replication subscription can be permanently broken and out
of sync if for example columns are dropped from the subscriber copy of
the tables or if the subscriber runs out of disk and can replay some
transactions but not all. Note that in such situations gaps may be
formed into the received transaction sequence. In such cases, it is best
to drop the subscription, drop the tables and remake the subscription.

</div>
