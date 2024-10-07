<div id="snlog" class="section">

<div class="titlepage">

<div>

<div>

### 13.2.11. Table snapshot logs

</div>

</div>

</div>

In order to be able to create incremental snapshots on a table there
should be a snapshot log table defined in the following fashion:

``` programlisting
create table RLOG_sourcetable (
RLOG_sourcetable_primarykey_parts,
...
SNAPTIME DATETIME,
DMLTYPE  CHAR(1),
RLOG_ROWGUID VARCHAR(255),
PRIMARY KEY (RLOG_*));
```

The name of the snapshot log table is constructed from the name of the
source table by prefixing it with RLOG\_ .

Snapshot log table contains all the primary key parts of the source
table prefixed with RLOG\_ .

Snapshot log table contains at most one row per updated source table row
with the update time and update type in DMLTYPE (I - for insert, U - for
update, D - for delete).

Snapshot log table contains RLOG_ROWGUID column which uniquely
identifies this snapshow log row.

An updating procedure for incremental snapshot or bi-directional
snapshot (table case) reads records from snapshot log table, ordered by
SNAPTIME. Commits are performed each time an updating procedure notices
that SNAPTIME has changed. In Virtuoso case (when native table is
snapshot-replicated) all snapshot log records with equal SNAPTIME belong
to the same transaction and all such records constitute almost a
transaction (it is not exactly a transaction because only the last DML
operation for each primary key in the source table is recorded in
snapshot log table). So in Virtuoso case an updating procedure commits
almost per transaction on source table. Snapshot log records are not
transaction-bound in heterogeneous case however. Nevertheless, the
technique used to determine when to commit described above prevents
running out of transaction log or deadlocks even in heterogeneous case.

Replay log is created on the server which performs sync (server on which
snapshot log was create in ordinary case, publisher in bi-directional
snapshot case) to handle correct snapshot log replaying. Replay log is
purged periodically using `REPL_PURGE_RPLOGS()` function in ordinary
case and `REPL_PURGE_URPLOGS()` in bi-directional case. The calls to
this functions are automatically scheduled when snapshot log or
bi-directional snapshot publication is created and there is no need to
call them manually.

There should be triggers on the source table to update the log like
that:

``` programlisting
create trigger xxx_I_log after insert on xxx
{
  insert replacing RLOG_xxx values (xxx_pk, now(), 'I', uuid());
};

create trigger xxx_D_log after delete on xxx
{
  insert replacing RLOG_xxx values (xxx_pk, now(), 'D', uuid());
};

create trigger xxx_U_log after update on xxx
{
  if (OLD.xxx_pk differs from NEW.xxx_pk)
    {
      insert replacing RLOG_xxx values (OLD.xxx_pk, now(), 'D', uuid());
      insert replacing RLOG_xxx values (NEW.xxx_pk, now(), 'I', uuid());
    }
  else
    insert replacing RLOG_xxx values (xxx_pk, now(), 'U', uuid());
};
```

where xxx is the source table name, RLOG_xxx is the snapshot log table
name, xxx_pk is a comma separated list of the source table's primary key
parts. The names of the triggers are constructed from the fully
qualified name (DB.DBA.Orders makes DB_DBA_Orders_I_log).

Table snapshot logs and triggers are created automatically for Virtuoso
and databases listed in <a href="snpheter.html" class="link"
title="13.2.6. Heterogeneous snapshot replication">Heterogeneous
Snapshot Replication</a> section.

</div>
