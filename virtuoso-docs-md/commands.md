<div>

<div>

<div>

<div>

### 13.2.3. Command reference

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### CREATE SNAPSHOT LOG FOR source_table

</div>

</div>

</div>

``` programlisting
CREATE SNAPSHOT LOG FOR source_table
```

``` programlisting
repl_create_snapshot_log(in source_table varchar)
```

Creates a snapshot log of a native (non VDB) table and the appropriate
log update triggers.

Note that when replicating data from a remote Virtuoso a snapshot log
table can be created on the remote virtuoso and then the source and log
tables can be attached into the local Virtuoso. However the snapshot log
table and the update triggers should be created manually on a
non-Virtuoso data source.

Examples (based on Virtuoso demo database):

``` programlisting
create snapshot log for Orders;
```

</div>

<div>

<div>

<div>

<div>

#### DROP SNAPSHOT LOG FOR source_table

</div>

</div>

</div>

``` programlisting
DROP SNAPSHOT LOG FOR source_table
```

``` programlisting
repl_drop_snapshot_log(in source_table varchar)
```

Drops a snapshot log of a table and the log update triggers.

This results in 4 SQL commands :

``` programlisting
drop trigger xxx_I_log;
drop trigger xxx_U_log;
drop trigger xxx_D_log;
drop table RLOG_xxx;
```

where xxx is the source table name (fully qualified - DB.DBA.Orders
becomes DB_DBA_Orders).

Examples (based on Virtuoso demo database):

``` programlisting
drop snapshot log for Orders;
```

</div>

<div>

<div>

<div>

<div>

#### PURGE SNAPSHOT LOG FOR source_table

</div>

</div>

</div>

``` programlisting
PURGE SNAPSHOT LOG FOR source_table
```

``` programlisting
repl_purge_snapshot_log(in source_table varchar)
```

There can be old snapshot log rows which have been replayed in all the
snapshots of a given source table. These rows are no longer needed and
can be purged from the snapshot log for faster operation.

This command checks if there are any rows in SYS_REPLICATION referring
to that source table and if there are, then it deletes all the rows in
the log table with SNAPTIME earlier then
REPL_START_TIME(MIN(SN_LAST_TS)).

If there are no rows in SYS_SNAPSHOT it assumes that the log is used for
"pull" replication and does not do anything.

Examples (based on Virtuoso demo database):

``` programlisting
purge snapshot log for Orders;
```

</div>

<div>

<div>

<div>

<div>

#### CREATE NONINCREMENTAL SNAPSHOT

</div>

</div>

</div>

``` programlisting
CREATE NONINCREMENTAL SNAPSHOT dest_table as 'query_def'
```

``` programlisting
repl_create_snapshot(in query_def varchar, in dest_table varchar)
```

Creates a non-incremental snapshot log of the data returned by the query
query_def.

The server first checks for the existence of a table with the same name.
If it does not exist, then a table with a layout to accommodate the
resultset produced by query_def is created.

Then a entry containing query_def and tablename is added to SYS_SNAPSHOT
and the destination table is filled in with an insert into tablename
query_def.

Examples (based on Virtuoso demo database):

``` programlisting
create nonincremental snapshot sub_orders as
        'select * from Orders where OrderID < 5'
```

</div>

<div>

<div>

<div>

<div>

#### CREATE INCREMENTAL SNAPSHOT

</div>

</div>

</div>

``` programlisting
CREATE SNAPSHOT dest_table FROM source_table [ 'source_column_list' ]
        [ WHERE 'condition' ]
```

``` programlisting
repl_create_inc_snapshot(
    in source_column_list varchar,
    in source_table varchar,
    in condition varchar,
    in dest_table varchar)
```

Creates a incremental snapshot log using source query like that :

``` programlisting
SELECT source_table_pk_cols, source_column_list FROM source_table WHERE condition
```

If the dest table already exists, then it's column count is checked to
be greater than the primary key parts count of the source table.

If the source_column_list is omitted, then the destination table is
created to have the same columns as the source table.

Examples (based on Virtuoso demo database):

``` programlisting
CREATE SNAPSHOT sub_orders FROM Orders WHERE 'OrderID < 5'
```

</div>

<div>

<div>

<div>

<div>

#### UPDATE SNAPSHOT

</div>

</div>

</div>

``` programlisting
UPDATE SNAPSHOT snapshot_table_name [ AS NONINCREMENTAL ]
```

``` programlisting
repl_refresh_inc_snapshot(
    in snapshot_table_name varchar)
```

``` programlisting
repl_refresh_noninc_snapshot(
    in snapshot_table_name varchar)
```

Without the optional argument updates the snapshot according to it's
type. If an incremental snapshot needs to be updated as a
nonincremental, then the full form should be used.

Examples (based on Virtuoso demo database):

``` programlisting
UPDATE SNAPSHOT sub_orders
```

</div>

<div>

<div>

<div>

<div>

#### DROP SNAPSHOT

</div>

</div>

</div>

``` programlisting
DROP SNAPSHOT snapshot_table_name [ WITH DELETE ]
```

``` programlisting
repl_drop_snapshot(
    in snapshot_table_name varchar,
    in delete integer)
```

Removes a snapshot definition from SYS_SNAPSHOT and optionally drops the
snapshot destination table.

Examples (based on Virtuoso demo database):

``` programlisting
DROP SNAPSHOT sub_orders WITH DELETE
```

</div>

</div>
