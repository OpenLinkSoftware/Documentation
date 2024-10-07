<div id="inc" class="section">

<div class="titlepage">

<div>

<div>

### 13.2.2. Incremental snapshot replication

</div>

</div>

</div>

A table can be replicated from a generic, possibly non-Virtuoso source
in an incremental fashion if the data source meets certain criteria:

The data should come from a single table.

The source table should have an explicit primary key.

There source query should have the form

``` programlisting
SELECT fields FROM source_table WHERE scalar_conditions
```

A snapshot log on the source table should exist.

There should be insert, delete and update triggers on the source table
to update the snapshot log.

The incremental update is done in the following way:

All the changed records with a snaptime greater or equal from
REPL_START_TIME(SN_LAST_TS) are processed. If the record to insert
already exists, then it is updated. If the record to update does not
exist in the destination table, then it is inserted. This contributes
for conflict resolving.

</div>
