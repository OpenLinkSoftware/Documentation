<div>

<div>

<div>

<div>

### 13.2.10. Replication system tables

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### SYS_SNAPSHOT

</div>

</div>

</div>

``` programlisting
CREATE TABLE SYS_SNAPSHOT (
    SN_NAME VARCHAR(255),
    SN_QUERY    VARCHAR(1024),
    SN_LAST_TS  VARBINARY(30),
    SN_IS_INCREMENTAL   INTEGER,
    SN_SOURCE_TABLE VARCHAR(255),
    PRIMARY KEY (SN_NAME))
```

This table describes all defined snapshot replication relations. SN_NAME
is the snapshot's name (destination table name). SN_QUERY is the query
to get the data from. SN_LAST_TS is the time of the last update
reflected for incremental snapshots (from the snapshot log's SNAPTIME).
SN_IS_INCREMENTAL is null for nonincremental snapshots and non-null for
the incremental ones. SN_SOURCE_TABLE is the source table for the
incremental snapshots, NULL otherwise.

This implies that an incremental snapshot can be updated in two ways -
incrementally and nonincrementally as the nonincremental definition is a
subset of the incremental definition.

</div>

<div>

<div>

<div>

<div>

#### SYS_SNAPSHOT_LOG

</div>

</div>

</div>

``` programlisting
CREATE TABLE SYS_SNAPSHOT_LOG (
    SNL_SOURCE  varchar (320) NOT NULL,
    SNL_RLOG    varchar (320) NOT NULL,
    SNL_RPLOG   varchar (320) NOT NULL,
    primary key (SNL_SOURCE)
)
```

This table describes all defined snapshot replication relation logs.
SNL_SOURCE is the base table for which a snapshot log is defined.
SNL_RLOG is the name of the RLOG snapshot log auxiliary table. SNL_RPLOG
is the name of the RPLOG snapshot log auxiliary table.

</div>

</div>
