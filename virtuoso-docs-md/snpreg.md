<div id="snpreg" class="section">

<div class="titlepage">

<div>

<div>

### 13.2.5. Registry variables

</div>

</div>

</div>

<div class="orderedlist">

1.  <span class="emphasis">*snp_repl_tolerance_offset*</span>
    (default 15) In incremental and bi-directional snapshot time stamp
    of last replayed snapshot log entry (LAST_TS) is kept in system
    tables. LAST_TS is used to determine the starting point of the next
    update. This value can't be used as is for the following reasons:

    |                                                                                                                                                                                                                                                                         |
    |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | Local time may be adjusted occasionally on the servers which participate in replication.                                                                                                                                                                                |
    | Virtuoso snapshot replication triggers use `now()` function to get snapshot log entry time stamp. If transaction is started before updating snapshot log and ended after updating snapshot log is finished, data modifications made in this transaction will be missed. |

    In order to resolve the issues mentioned above Virtuoso reads
    snapshot logs starting from LAST_TS minus some tolerance offset. The
    value of tolerance offset (in minutes) is kept in
    "snp_repl_tolerance_offset" registry variable. For the reasons
    mentioned above tolerance offset should be longer than length of any
    transaction which modifies published tables.

2.  <span class="emphasis">*snp_repl_purge_offset*</span> (default 30)
    In order to prevent snapshot log entries to be replayed more than
    once Virtuoso keeps log of replayed snapshot log entries (rplog).
    Rplog entries need to be purged periodically. Virtuoso automatically
    schedules rplog purger when snapshot log for some table is created.
    All the records in rplog with time stamp less than MIN(LAST_TS)
    minus some offset are purged. The value of purge offset (in minutes)
    is kept in "snp_repl_purge_offset" registry variable. Normally,
    purge offset should be greater than tolerance offset.

</div>

</div>
