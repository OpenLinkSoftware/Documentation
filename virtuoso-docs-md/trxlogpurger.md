<div>

<div>

<div>

<div>

### 13.3.7. Purging replication logs

</div>

</div>

</div>

Every replication account has an associated sequence which holds
replication account level (basically, transaction number). Each
subscriber also maintains a sequence where it stores its replication
account level.

When subscriber issues a sync request for an account it submits its
replication account level so publisher can find a point in time from
where it should start to submit replication logs to publisher.

Replication account level can roll over REPL_WRAPAROUND (0x7fffffff)
to 1. Old replication logs need to be purged to allow this to work
correctly. Procedure <a href="fn_repl_purge.html" class="link"
title="repl_purge">repl_purge()</a> purges replication logs for a
specified account.

Columns needed to store purger configuration in SYS_REPL_ACCOUNTS table
are:

|                                        |
|----------------------------------------|
| P_MONTH integer (month, nullable)      |
| P_DAY integer (day of month, nullable) |
| P_TIME time (time, nullable)           |

If P_TIME is NULL log purger will not be scheduled to run at all. If
P_TIME is not NULL there can be the following combinations of P_MONTH,
P_DAY and P_WDAY ('\*' means NULL value, 'x' means any value):

<div>

**Table 13.2. Purger config settings**

<div>

|                                          |                                        |                                         |                                                 |
|------------------------------------------|----------------------------------------|-----------------------------------------|-------------------------------------------------|
| <span class="emphasis">*P_MONTH* </span> | <span class="emphasis">*P_DAY* </span> | <span class="emphasis">*P_WDAY* </span> | <span class="emphasis">*meaning* </span>        |
| month                                    | day                                    | x                                       | purger is run yearly on specified month and day |
| month                                    | \*                                     | x                                       | purger is run yearly on 1st of month            |
| \*                                       | day                                    | x                                       | purger is run monthly on specified day of month |
| \*                                       | \*                                     | wday                                    | purger is run weekly on specified day of week   |
| \*                                       | \*                                     | \*                                      | purger is run daily                             |

</div>

</div>

  

An entry to call purger is inserted (or updated) into
SYS_SCHEDULED_EVENT after each modification of purger settings for an
account (from Admin UI) or after each successful run of repl_purge() for
this account.

</div>
