<div>

<div>

<div>

<div>

### 9.24.2. LOCK_ESCALATION_PCT

</div>

</div>

</div>

This controls the escalation from row locking to page locking. A set of
row locks can be converted into one page lock if: (a) All the row locks
on the page belong to the same transaction, or, (b) No other transaction
waits for any of these locks. The value of this parameter is the
percentage of rows on a page that must be held by the transaction before
the locking goes to page level. The default is 50, meaning that for a
page of 120 rows the 61st row lock will escalate the lock if all the
previous locks belong to the same transaction and there is no wait
pending on any. A value of -1 means that locking is always at page level
if there is more than one lock on the page. A value in excess of 100
causes lock escalation to be turned off. The effect of this setting is
global and persists until the server is restarted. This setting does not
affect the semantic of locking.

</div>
