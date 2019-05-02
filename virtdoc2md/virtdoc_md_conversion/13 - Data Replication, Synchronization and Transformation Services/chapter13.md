# Data Replication, Synchronization and Transformation Services

<!--- TOC: Start --->

#### Contents

  * [Introduction](#id1-introduction)
    * [Snapshot replication](#id2-snapshot-replication)
    * [Transactional replication](#id3-transactional-replication)
  * [Snapshot Replication](#id4-snapshot-replication)
    * [Non incremental snapshot replication](#id5-non-incremental-snapshot-replication)
    * [Incremental snapshot replication](#id6-incremental-snapshot-replication)
    * [Command reference](#id7-command-reference)
    * [Bi-Directional Snapshot Replication](#id8-bi-directional-snapshot-replication)
    * [Registry variables](#id9-registry-variables)
    * [Heterogeneous snapshot replication](#id10-heterogeneous-snapshot-replication)
    * [Data type mappings](#id11-data-type-mappings)
    * [Objects created by incremental snapshot replication](#id12-objects-created-by-incremental-snapshot-replication)
    * [Objects created by bi-directional snapshot replication](#id13-objects-created-by-bi-directional-snapshot-replication)
    * [Replication system tables](#id14-replication-system-tables)
    * [Table snapshot logs](#id15-table-snapshot-logs)
  * [Transactional Replication](#id16-transactional-replication)
    * [Publishable Items](#id17-publishable-items)
    * [Errors in Replication](#id18-errors-in-replication)
    * [Publisher Transactional Replication Functions](#id19-publisher-transactional-replication-functions)
    * [Subscriber Functions](#id20-subscriber-functions)
    * [Common Status Functions](#id21-common-status-functions)
    * [Bi-Directional Transactional Replication](#id22-bi-directional-transactional-replication)
    * [Purging replication logs](#id23-purging-replication-logs)
    * [Objects created by transactional replication](#id24-objects-created-by-transactional-replication)
  * [Virtuoso scheduler](#id25-virtuoso-scheduler)
    * [SYS\_SCHEDULED\_EVENT](#id26-sys_scheduled_event)
  * [Transactional Replication Example](#id27-transactional-replication-example)
    * [Transactional Replication Objects Example](#id28-transactional-replication-objects-example)
  * [Replication Logger Sample](#id29-replication-logger-sample)
    * [Configuration of the Sample](#id30-configuration-of-the-sample)
    * [Synchronization](#id31-synchronization)
    * [Running the Sample](#id32-running-the-sample)
    * [Notes on the Sample's Dynamics](#id33-notes-on-the-samples-dynamics)

<!--- TOC: End --->
<a id="id1-introduction"></a>
# Introduction

Virtuoso provides several replication methods:

<a id="id2-snapshot-replication"></a>
## Snapshot replication

Virtuoso provides the following flavors of snapshot replication:

Non-incremental snapshot replicationNon-incremental snapshot replication
is useful when the data is changed infrequently or when data is modified
in large portions at a time.

Incremental snapshot replication Incremental snapshot replication is
useful when the data is changed frequently and implements incremental
updates using a snapshot log.

Bi-directional snapshot replication Bi-directional snapshot replication
allows data to be modified on both publisher and subscribers. This is
useful read-write access to the replicas is needed.

> **Note**
> 
> Snapshot replication can be used in heterogeneous environments to set
> up replication between non-Virtuoso databases.

<a id="id3-transactional-replication"></a>
## Transactional replication

Transactional replication allows subscribers to receive data in
near-real time. ACID properties of transactions are maintained in
transactional replication as well. Virtuoso implements the following
flavors of transactional replication: Ordinary transactional
replicationOrdinary transactional replication flavor implements one-way
data replication and is useful when data can be modified on only one
server with other servers participating in replication providing
read-only data access., Bi-directional transactional replication
Bi-directional transactional replication is useful when there is a
requirement to allow data updates on multiple servers.

<a id="id4-snapshot-replication"></a>
# Snapshot Replication

<a id="id5-non-incremental-snapshot-replication"></a>
## Non incremental snapshot replication

The Virtuoso Server periodically evaluates a query and inserts the
result into a table, replacing the content. The source and target can be
anywhere but typically will be on different databases of which at least
one is remote.

This makes a two party distributed transaction. Only one of the
transaction branches is writing, hence this goes with a one phase
commit.

> **Note**
> 
> This can be used to replicate between two non-Virtuoso databases.

The prerequisite of this mode of replication is that all tables exist.
The schema is never replicated.

<a id="id6-incremental-snapshot-replication"></a>
## Incremental snapshot replication

A table can be replicated from a generic, possibly non-Virtuoso source
in an incremental fashion if the data source meets certain criteria:

The data should come from a single table.

The source table should have an explicit primary key.

There source query should have the form

    SELECT fields FROM source_table WHERE scalar_conditions

A snapshot log on the source table should exist.

There should be insert, delete and update triggers on the source table
to update the snapshot log.

The incremental update is done in the following way:

All the changed records with a snaptime greater or equal from
REPL\_START\_TIME(SN\_LAST\_TS) are processed. If the record to insert
already exists, then it is updated. If the record to update does not
exist in the destination table, then it is inserted. This contributes
for conflict resolving.

<a id="id7-command-reference"></a>
## Command reference

### CREATE SNAPSHOT LOG FOR source\_table

    CREATE SNAPSHOT LOG FOR source_table

    repl_create_snapshot_log(in source_table varchar)

Creates a snapshot log of a native (non VDB) table and the appropriate
log update triggers.

Note that when replicating data from a remote Virtuoso a snapshot log
table can be created on the remote virtuoso and then the source and log
tables can be attached into the local Virtuoso. However the snapshot log
table and the update triggers should be created manually on a
non-Virtuoso data source.

Examples (based on Virtuoso demo database):

    create snapshot log for Orders;

### DROP SNAPSHOT LOG FOR source\_table

    DROP SNAPSHOT LOG FOR source_table

    repl_drop_snapshot_log(in source_table varchar)

Drops a snapshot log of a table and the log update triggers.

This results in 4 SQL commands :

    drop trigger xxx_I_log;
    drop trigger xxx_U_log;
    drop trigger xxx_D_log;
    drop table RLOG_xxx;

where xxx is the source table name (fully qualified - DB.DBA.Orders
becomes DB\_DBA\_Orders).

Examples (based on Virtuoso demo database):

    drop snapshot log for Orders;

### PURGE SNAPSHOT LOG FOR source\_table

    PURGE SNAPSHOT LOG FOR source_table

    repl_purge_snapshot_log(in source_table varchar)

There can be old snapshot log rows which have been replayed in all the
snapshots of a given source table. These rows are no longer needed and
can be purged from the snapshot log for faster operation.

This command checks if there are any rows in SYS\_REPLICATION referring
to that source table and if there are, then it deletes all the rows in
the log table with SNAPTIME earlier then
REPL\_START\_TIME(MIN(SN\_LAST\_TS)).

If there are no rows in SYS\_SNAPSHOT it assumes that the log is used
for "pull" replication and does not do anything.

Examples (based on Virtuoso demo database):

    purge snapshot log for Orders;

### CREATE NONINCREMENTAL SNAPSHOT

    CREATE NONINCREMENTAL SNAPSHOT dest_table as 'query_def'

    repl_create_snapshot(in query_def varchar, in dest_table varchar)

Creates a non-incremental snapshot log of the data returned by the query
query\_def.

The server first checks for the existence of a table with the same name.
If it does not exist, then a table with a layout to accommodate the
resultset produced by query\_def is created.

Then a entry containing query\_def and tablename is added to
SYS\_SNAPSHOT and the destination table is filled in with an insert into
tablename query\_def.

Examples (based on Virtuoso demo database):

    create nonincremental snapshot sub_orders as
            'select * from Orders where OrderID < 5'

### CREATE INCREMENTAL SNAPSHOT

    CREATE SNAPSHOT dest_table FROM source_table [ 'source_column_list' ]
            [ WHERE 'condition' ]

    repl_create_inc_snapshot(
        in source_column_list varchar,
        in source_table varchar,
        in condition varchar,
        in dest_table varchar)

Creates a incremental snapshot log using source query like that :

    SELECT source_table_pk_cols, source_column_list FROM source_table WHERE condition

If the dest table already exists, then it's column count is checked to
be greater than the primary key parts count of the source table.

If the source\_column\_list is omitted, then the destination table is
created to have the same columns as the source table.

Examples (based on Virtuoso demo database):

    CREATE SNAPSHOT sub_orders FROM Orders WHERE 'OrderID < 5'

### UPDATE SNAPSHOT

    UPDATE SNAPSHOT snapshot_table_name [ AS NONINCREMENTAL ]

    repl_refresh_inc_snapshot(
        in snapshot_table_name varchar)

    repl_refresh_noninc_snapshot(
        in snapshot_table_name varchar)

Without the optional argument updates the snapshot according to it's
type. If an incremental snapshot needs to be updated as a
nonincremental, then the full form should be used.

Examples (based on Virtuoso demo database):

    UPDATE SNAPSHOT sub_orders

### DROP SNAPSHOT

    DROP SNAPSHOT snapshot_table_name [ WITH DELETE ]

    repl_drop_snapshot(
        in snapshot_table_name varchar,
        in delete integer)

Removes a snapshot definition from SYS\_SNAPSHOT and optionally drops
the snapshot destination table.

Examples (based on Virtuoso demo database):

    DROP SNAPSHOT sub_orders WITH DELETE

<a id="id8-bi-directional-snapshot-replication"></a>
## Bi-Directional Snapshot Replication

Bi-directional snapshot replication allows you to set up snapshot
replication between multiple servers where updates can be performed on
all servers. Bidirectional snapshot replication uses the
publisher-subscriber model where each table or DAV collection has only
one publisher and when an update is performed on subscriber it goes to
publisher first, and then to all other subscribers. Conflict resolution
may need to take place on the publisher when data coming from a
subscriber is processed. Bi-directional snapshot replication uses
snapshot logs on publisher and subscribers to track changes in published
table and its replicas.

It is assumed that all tables published using bi-directional snapshot
replication have primary keys columns that are never modified.

To perform conflict resolution a ROWGUID column is added to every
published table. This column should never be modified manually. All
INSERT statements should specify exact column-select-lists that do not
include the ROWGUID column. Likewise the ROWGUID column should never
feature in any UPDATE statements.

Each server participating in bi-directional snapshot replication must
have unique name (replication name). For Virtuoso servers replication
name is assigned to the server in its virtuoso.ini file in the DBName
setting. For other RDBMS servers replication name is the name of
instance or the name of database. Replication name of remote server can
be obtained using `REPL_SERVER_NAME()` (after this server is defined,
see below).

`REPL_CREATE_SNAPSHOT_PUB()` function should be used to create
bi-directional snapshot publication.

To create subscription for the publication, replication subscriber
server should be defined first using `REPL_SNP_SERVER()` function. The
name of the server can be obtained later using `REPL_SERVER_NAME()`
function. After this `REPL_CREATE_SNAPSHOT_SUB()` function should be
used to create a subscription (and create replicated table on subscriber
if table replication takes place).

To load initial data on subscriber `REPL_INIT_SNAPSHOT()` should be used
after subscription is created. Loading initial data can take some time
so `REPL_INIT_SNAPSHOT()` performs commits after every 100 rows are
copied from source table to the table on subscriber to prevent running
out of transaction log or deadlocks. It is possible to specify an
alternative value for number of rows per transaction (last parameter of
`REPL_INIT_SNAPSHOT()` function). In DAV case commits are performed per
copied resource.

`REPL_UPDATE_SNAPSHOT()` should be called periodically after initial
data is loaded on subscriber to sync published items (tables or DAV
collections) on publisher and subscribers. This function reads snapshot
logs attached from subscribers and replays them with possible conflict
resolution. After all snapshot logs from subscribers are processed an
updating procedure reads snapshot log on publisher and replays it on all
subscribers.

> **Note**
> 
> Please note that all operations in bi-directional snapshot replication
> (publication, subscription, doing initial copy, syncing) should be
> performed on publisher.

This example demonstrates creating bi-directional snapshot publication
of table 'Demo.demo.Shippers'.

    SQL> REPL_CREATE_SNAPSHOT_PUB ('Demo.demo.Shippers', 2);

This example demonstrates creating bi-directional snapshot subscription
for table 'Demo.demo.Shippers' and loading initial data on subscriber
with DSN 'localhost:1121'.

    SQL> REPL_SNP_SERVER ('localhost:1121', 'dba', 'dba');
    SQL> REPL_CREATE_SNAPSHOT_SUB (REPL_SERVER_NAME ('localhost:1121'), 'Demo.demo.Shippers', 2);
    SQL> REPL_INIT_SNAPSHOT (REPL_SERVER_NAME ('localhost:1121'), 'Demo.demo.Shippers', 2);

This example demonstrates syncing bi-directional snapshot publication of
table 'Demo.demo.Shippers'.

    SQL> REPL_UPDATE_SNAPSHOT ('Demo.demo.Shippers', 2);

> **Tip**
> 
> The following functions are used for creating, dropping and updating
> publications and subscriptions to them:
> 
> [`REPL_CREATE_SNAPSHOT_SUB()`](#fn_repl_create_snapshot_sub)
> 
> [`REPL_CREATE_SNAPSHOT_PUB()`](#fn_repl_create_snapshot_pub)
> 
> [`REPL_DROP_SNAPSHOT_SUB()`](#fn_repl_drop_snapshot_sub)
> 
> [`REPL_DROP_SNAPSHOT_PUB()`](#fn_repl_drop_snapshot_pub)
> 
> [`REPL_INIT_SNAPSHOT()`](#fn_repl_init_snapshot)
> 
> [`REPL_UPDATE_SNAPSHOT()`](#fn_repl_update_snapshot)
> 
> [`REPL_SNP_SERVER()`](#fn_repl_snp_server)
> 
> [`REPL_SERVER_NAME()`](#fn_repl_server_name)

### Conflict Resolution

Since every table can have only one publisher, conflicts can only occur
on the publisher when modifications from a subscriber are attempted.
When DML operations originating on a subscriber are being replayed on
the publisher, three types of conflicts can arise:

1.  **uniqueness conflict (insert conflict).**
    
    occurs when the row with some primary key \<PK\> already exists in
    publisher's table.

2.  **update conflict.**
    
    occurs when UPDATE modifies a row which has already been modified on
    publisher (by the publisher or another subscriber)

3.  **delete conflict.**
    
    occurs when DELETE deletes a row that does not exist on publisher
    anymore.

Delete conflicts when UPDATE modifies a row that does not exist on
publisher can't be detected in snapshot replication case.

Every table has a number of conflict resolvers which are used for
conflict resolution which are enlisted in the `DB.DBA.SYS_SNAPSHOT_CR`
system table. Each conflict resolver has a type, one of ('I', 'U', or
'D'), and an order. Conflict resolvers are applied in ascending order.

The conflict resolver is a Virtuoso/PL procedure that receives a
conflicting row from a subscriber and some other arguments. The conflict
resolver can modify the row, which is passed as an 'inout' argument. The
conflict resolver should return an integer value, which will be used for
conflict resolution.

Conflict resolvers of different types have different signatures:

'I' - Insert conflict resolvers

(\<ALLCOLS\>, inout \_origin varchar)

'U' - Update conflict resolvers

(\<ALLCOLS\>, inout \_origin varchar)

'D' - Deletion conflict resolvers

(\<PK\>, inout \_origin varchar)

where

\<ALLCOLS\> are the new values of all columns (including the ROWGUID
column), \<PK\> are the values of primary key columns, and \_origin is
transaction originator.

Conflict resolvers can return the following integer values; The conflict
resolver types concerned for each are listed in parentheses:

  - **0 - un-decide (I, U, D).**
    
    next conflict resolver will be fired.

  - **1 - subscriber wins (I, U, D).**
    
    DML operation will be applied with \<ALLCOLS\> All the subscribers
    except originator will receive modifications (originator already has
    them).

  - **2 - subscriber wins, change origin (I, U).**
    
    DML operation will be applied with \<ALLCOLS\> and origin of
    transaction will be changed to publisher's server name. All the
    subscribers (including originator) will receive modifications. This
    return value is useful when conflict resolver changed some of the
    columns of the row that were passed in. Although all parameters of
    conflict resolver are inout only changing of \<ALLCOLS\> (non-PK
    columns) parameters makes sense.

  - **3 - publisher wins (U).**
    
    DML operation will be applied with \<ALLCOLS\> taken from
    publisher's table. All the subscribers will receive modifications.

  - **4 - reserved.**

  - **5 - ignore (D).**
    
    DML operation is ignored.

Conflict resolution stops when some conflict resolver returns a non-zero
value meaning that it has made a decision.

Suppose we have the following table:

    create table items(
      item_id integer primary key,
    
      name varchar,
      price decimal
    );

"Publisher wins" 'I' conflict resolver will look like:

    create procedure items_cr(
        inout _item_id integer,
        inout _name varchar,
        inout _price decimal,
        inout _origin varchar)
      returns integer
    {
      return 3;
    }

The conflict resolver that will make a decision based on the minimal
price column will look like:

    create procedure items_cr(
        inout _item_id integer,
        inout _name varchar,
        inout _price decimal,
        inout _rowguid varchar,
        inout _origin varchar)
      returns integer
    {
      declare p decimal;
      -- get current price value
      select price into p from items where item_id = _item_id;
      if (p < _price)
        return 3;           -- publisher wins
      else if (p > _price)
        return 1;           -- subscriber wins
      return 0;         -- can't decide
    }

The conflict resolver that will change the price to the minimal value
will look like:

    create procedure items_cr(
        inout _item_id integer,
        inout _name varchar,
        inout _price decimal,
        inout _rowguid varchar,
        inout _origin varchar)
      returns integer
    {
      declare p decimal;
      -- get current price value
      select price into p from items where item_id = _item_id;
      if (p < _price)
        {
          _price := p;
          return 2;         -- publisher wins, change origin
        }
      return 1;         -- subscriber wins
    }

Conflict resolution occurs differently for each kind of DML operation:

  - **INSERT.**
    
    When INSERT of some row with primary key \<PK\> is replayed, the row
    in the publisher's table with such \<PK\> is looked-up. If the row
    does not exist then there is no conflict, conflict resolution stops
    and the INSERT is replayed. If the row exists then we have a
    "uniqueness conflict". In this case 'I' conflict resolvers are
    fired-up. If none of the 'I' conflict resolvers were able to make a
    decision (return non-zero value) the default action is 'publisher
    wins'.

  - **UPDATE.**
    
    When there is an UPDATE of some row with primary key \<PK\> is
    replayed, the row (and its ROWGUID) in publisher's table with such
    \<PK\> is looked-up. If the row does not exist then we have a
    "delete conflict", 'D' conflict resolvers are fired up. If none of
    the 'D' conflict resolvers were able to make a decision the default
    action will be to 'ignore'. If the row exists in the publisher's
    table and its ROWGUID is the same as that from the subscriber then
    there is no conflict. Conflict resolution stops and the UPDATE is
    replayed. If the row exists and its ROWGUID differs from the one
    that came from subscriber then we have an "update conflict". In this
    case the 'U' conflict resolvers are fired-up. If none of the 'U'
    conflict resolvers were able to make a decision (return non-zero
    value) the default action will be 'publisher wins'.

  - **DELETE.**
    
    When DELETE operation of some row with primary key \<PK\> is
    replayed, the row in the publisher's table with such \<PK\> is
    looked-up. If the row does not exist or if the row exists but its
    ROWGUID differs from the one that came from subscriber then we have
    "delete conflict". The 'D' conflict resolvers are fired-up. If none
    of the 'D' conflict resolvers were able to make a decision then the
    default action will be taken to 'ignore'. Otherwise it is assumed
    that there is no conflict and DELETE statement is replayed.

### Conflict Resolution in WebDAV

Conflict resolvers in DAV are found based on the collection. The closest
collection that specifies resolvers will be the one providing the
resolver set. Resolvers from any enclosing collection will not be
invoked.

There is special subcollection in each replicated collection named
'\_SYS\_REPL\_BACKUP'. This subcollection is never replicated and is
used to store backup copies of resources that lose conflict resolution.

If a resource is locked during an update it will be stored in temporary
location. Conflict resolution will take place after the lock is
released. If the update was performed on the publisher then no conflict
resolution will be performed on the subscribers and the resource from
temporary location will simply replace an existing resource after the
lock is released.

Default conflict resolution is 'publisher wins'.

Delete conflicts are not handled when replicating DAV because updates
are the same as inserts -- if the resource that was updated does not
exist it will be created. INSERT or uniqueness conflict for the same
reasons.

Subcollections are not considered in conflict resolution. Subcollections
are always created as needed during an update. This means that if a
resource is updated locally but collection that holds this resource does
not exist on remote peer it will be created.

### Automatically Generated Conflict Resolvers

Simple table conflict resolvers can be generated automatically by
calling the `REPL_ADD_SNAPSHOT_CR()` function. DAV conflict resolvers be
generated by calling `REPL_ADD_DAV_CR()` function.

> **Tip**
> 
> [`REPL_ADD_DAV_CR()`](#fn_repl_add_dav_cr)
> 
> [`REPL_ADD_SNAPSHOT_CR()`](#fn_repl_add_snapshot_cr)

The generated procedures can be modified afterwards. In particular it is
possible to change the notification e-mail address by setting the
\_notify\_email parameter, and the notification text by setting the
\_notify\_text parameter.

The default behaviour for generated procedures is 'pub\_wins', making a
backup and notifying the owner by e-mail.

<a id="id9-registry-variables"></a>
## Registry variables

1.  *snp\_repl\_tolerance\_offset* (default 15) In incremental and
    bi-directional snapshot time stamp of last replayed snapshot log
    entry (LAST\_TS) is kept in system tables. LAST\_TS is used to
    determine the starting point of the next update. This value can't be
    used as is for the following reasons:
    
    Local time may be adjusted occasionally on the servers which
    participate in replication.
    
    Virtuoso snapshot replication triggers use
    
    now()
    
    function to get snapshot log entry time stamp. If transaction is
    started before updating snapshot log and ended after updating
    snapshot log is finished, data modifications made in this
    transaction will be missed.
    
    In order to resolve the issues mentioned above Virtuoso reads
    snapshot logs starting from LAST\_TS minus some tolerance offset.
    The value of tolerance offset (in minutes) is kept in
    "snp\_repl\_tolerance\_offset" registry variable. For the reasons
    mentioned above tolerance offset should be longer than length of any
    transaction which modifies published tables.

2.  *snp\_repl\_purge\_offset* (default 30) In order to prevent snapshot
    log entries to be replayed more than once Virtuoso keeps log of
    replayed snapshot log entries (rplog). Rplog entries need to be
    purged periodically. Virtuoso automatically schedules rplog purger
    when snapshot log for some table is created. All the records in
    rplog with time stamp less than MIN(LAST\_TS) minus some offset are
    purged. The value of purge offset (in minutes) is kept in
    "snp\_repl\_purge\_offset" registry variable. Normally, purge offset
    should be greater than tolerance offset.

<a id="id10-heterogeneous-snapshot-replication"></a>
## Heterogeneous snapshot replication

Virtuoso allows incremental and bi-directional snapshot replication
flavors to be used with non-Virtuoso databases.

The following databases are supported in incremental snapshot
replication: SQL Server 2000 and later, Oracle 8i and later, IBM DB2 8.1
and later, Informix IDS 9.40 and later

The following databases are supported in bi-directional snapshot
replication: SQL Server 2000 and later, Oracle 8i and later, IBM DB2 8.1
and later

DBMS-specific notes:

1.  *SQL Server 2000 and later* Bi-directional snapshot triggers for SQL
    Server require "nested triggers" server option to be "On" (which is
    "On" by default).

2.  *Oracle 8i*
    
    1.  Oracle 8i does not have support for "localtimestamp" data type
        out of box. Required functionality can be enabled by editing
        $ORACLE\_HOME/rdbms/admin/standard.sql script. The following
        statement
        
            pragma new_names('8.1.6',
                             dbtimezone, sessiontimezone, localtimestamp,
                             localtime, to_local_tz, to_db_tz,
                             cube, rollup, grouping, "TIMESTAMP WITH LOCAL TIME ZONE");
        
        should be changed to
        
            --pragma new_names('8.1.6',
            --                 dbtimezone, sessiontimezone, localtimestamp,
            --                 localtime, to_local_tz, to_db_tz,
            --                 cube, rollup, grouping, "TIMESTAMP WITH LOCAL TIME ZONE");
        
        After $ORACLE\_HOME/rdbms/admin/standard.sql is edited it should
        be executed with SYS user privileges:
        
            $sqlplus SYS/CHANGE_ON_INSTALL @$ORACLE_HOME/rdbms/admin/standard.sql
        
        where "CHANGE\_ON\_INSTALL" is password for user SYS.Oracle 9i
        and later has this type in the default installation and this
        step is not necessary.
    
    2.  ODBC driver from Oracle 8.1.6 (and earlier versions) is known to
        be buggy and may cause Virtuoso server to crash when snapshot
        replication with Oracle database is set up. ODBC driver from
        Oracle 8.1.7 and later is recommended.
    
    3.  Oracle ODBC driver uses Oracle NLS settings by default for
        determining decimal separator. If decimal separator in the
        locale is not '.' (period) there will be interoperability errors
        with Virtuoso. Oracle ODBC driver can be forced to use US
        Settings for numerics: open Oracle ODBC driver configuration
        dialog, select "Application" tab and set "Numeric Settings" to
        "Use US Settings".

3.  *DB2 8.1 ESE*
    
    1.  FixPak 3 is recommended because ODBC driver from earlier DB2 8
        versions may cause Virtuoso server to crash when BLOB columns
        exist in replicated tables.
    
    2.  DB2 CLI/ODBC driver uses default locale's decimal separator. If
        decimal separator in the locale is not '.' (period) Virtuoso
        fails to parse numeric values. The default behavior of the DB2
        CLI/ODBC driver can be modified by specifying PATCH2 CLI/ODBC
        configuration keyword in the db2cli.ini initialization file. Add
        the following line to your DSN config in db2cli.ini:
        
            PATCH2=15
        
        This will force DB2 CLI/ODBC driver to always use period ('.')
        as decimal separator.

4.  *Informix IDS 9.40* Informix IDS can't report current time in UTC.
    This may cause snapshot replication to fail when timezone change
    occurs. In order to set up snapshot replication with Informix server
    properly any of the following steps must be taken:
    
    Informix server must be run in UTC time zone.
    
    "snp\_repl\_time\_offset" registry variable should be set to value
    greater than 60.
    
    The second method may cause additional system load on updates and
    will cause transactions to be replayed out of order when timezone
    change occurs.

<a id="id11-data-type-mappings"></a>
## Data type mappings

Heterogeneous replication requires data type mapping to be performed
when Virtuoso table is created on replica.

|                       |                 |                  |                               |                              |
| --------------------- | --------------- | ---------------- | ----------------------------- | ---------------------------- |
| *Virtuoso*            | *SQL Server*    | *Oracle*         | *DB2*                         | *Informix*                   |
| *varchar*             | varchar(8000)   | VARCHAR2(4000)   | VARCHAR(32000)                | VARCHAR(254)                 |
| *varchar(n)*          | varchar(n)      | VARCHAR2(n)      | VARCHAR(n)                    | VARCHAR(n)                   |
| *integer*             | int             | INTEGER          | INTEGER                       | INTEGER                      |
| *smallint*            | smallint        | SMALLINT         | SMALLINT                      | SMALLINT                     |
| *real*                | real            | FLOAT            | REAL                          | SMALLFLOAT                   |
| *double precision*    | float           | DOUBLE PRECISION | DOUBLE                        | FLOAT                        |
| *numeric*             | numeric(38, 15) | NUMERIC(38, 15)  | NUMERIC(32, 15)               | DECIMAL(31, 15)              |
| *numeric(p, s)*       | numeric(p, s)   | NUMERIC(p, s)    | NUMERIC(p, s)                 | DECIMAL(p, s)                |
| *date*                | datetime        | DATE             | DATE                          | DATE                         |
| *time*                | datetime        | DATE             | TIME                          | DATETIME HOUR TO SECOND      |
| *datetime, timestamp* | datetime        | DATE             | TIMESTAMP                     | DATETIME YEAR TO FRACTION(5) |
| *varbinary*           | varbinary(8000) | RAW(2000)        | VARCHAR(32000) FOR BIT DATA   | BYTE                         |
| *varbinary(n)*        | varbinary(n)    | RAW(n)           | VARCHAR(n) FOR BIT DATA       | BYTE                         |
| *long varbinary*      | image           | BLOB             | BLOB                          | BYTE                         |
| *long varchar*        | text            | CLOB             | CLOB                          | TEXT                         |
| *nvarchar*            | nvarchar(4000)  | NVARCHAR2(4000)  | VARCHAR(32000) FOR MIXED DATA | NVARCHAR(254)                |
| *nvarchar(n)*         | nvarchar(n)     | NVARCHAR2(n)     | VARCHAR(n) FOR MIXED DATA     | NVARCHAR(n)                  |
| *long nvarchar*       | ntext           | NCLOB            | DBCLOB                        | TEXT                         |

Data type mappings

<a id="id12-objects-created-by-incremental-snapshot-replication"></a>
## Objects created by incremental snapshot replication

Table "DB.DBA.RPLOG\_\<name\>" (replay log) is created in Virtuoso
database for replayed snapshot log entries.

Table "RLOG\_\<name\>" (snapshot log) is created in the source DSN. This
table is attached as "\<qual\>"."\<dsn\>"."RLOG\_\<name\>" if source
table is an attached table. Other objects created by incremental
snapshot replication in the source DSN are:

Virtuoso

Triggers "\<qual\>\_\<owner\>\_\<name\>\_I\_log",
"\<qual\>\_\<owner\>\_\<name\>\_U\_log" and
"\<qual\>\_\<owner\>\_\<name\>\_D\_log" on replicated table.

SQL Server

Triggers "\<name\>\_I\_log", "\<name\>\_U\_log" and "\<name\>\_D\_log"
on replicated table.

Oracle

Triggers "\<name\>\_I\_log", "\<name\>\_U\_log" and "\<name\>\_D\_log"
on replicated table. Function OPL\_GETUTCDATE().

DB2

Triggers "\<name\>\_I", "\<name\>\_U" and "\<name\>\_D" on replicated
table. Sequence opl\_seq\_rowguid.

Informix

Triggers "\<name\>\_I\_log", "\<name\>\_U\_log" and "\<name\>\_D\_log"
on replicated table. Sequence opl\_seq\_rowguid. Stored procedures
"\<name\>\_R\_proc" and "\<name\>\_U\_proc".

<a id="id13-objects-created-by-bi-directional-snapshot-replication"></a>
## Objects created by bi-directional snapshot replication

Table "DB"."DBA"."RPLOG\_\<name\>" (replay log) is created in Virtuoso
database for replayed snapshot log entries.

Table "RLOG\_\<name\>" (snapshot log) is created on the publisher and on
subscribers. "RLOG\_\<name\>" table and replicated table itself are
attached from subscribers as "\<qual\>"."\<dsn\>"."RLOG\_\<name\>" and
"\<qual\>"."\<dsn\>"."\<name\>" respectively. Other objects created by
bi-directional snapshot replication on the publisher and on subscribers
are:

Virtuoso

Triggers "\<qual\>\_\<owner\>\_\<name\>\_I\_log",
"\<qual\>\_\<owner\>\_\<name\>\_U\_log" and
"\<qual\>\_\<owner\>\_\<name\>\_D\_log" on replicated table.

SQL Server

Triggers "\<name\>\_I\_log", "\<name\>\_U\_log" and "\<name\>\_D\_log"
on replicated table.

Oracle

Triggers "\<name\>\_I\_log", "\<name\>\_IR\_log", "\<name\>\_U\_log",
"\<name\>\_UR\_log", "\<name\>\_UD\_log", "\<name\>\_UDR\_log", and
"\<name\>\_D\_log" on replicated table. Function OPL\_GETUTCDATE().
Global temporary table "DLOG\_\<name\>".

DB2

Triggers "\<name\>\_I", "\<name\>\_U", "\<name\>\_UD" and "\<name\>\_D"
on replicated table. Sequence opl\_seq\_rowguid.

<a id="id14-replication-system-tables"></a>
## Replication system tables

### SYS\_SNAPSHOT

    CREATE TABLE SYS_SNAPSHOT (
        SN_NAME VARCHAR(255),
        SN_QUERY    VARCHAR(1024),
        SN_LAST_TS  VARBINARY(30),
        SN_IS_INCREMENTAL   INTEGER,
        SN_SOURCE_TABLE VARCHAR(255),
        PRIMARY KEY (SN_NAME))

This table describes all defined snapshot replication relations.
SN\_NAME is the snapshot's name (destination table name). SN\_QUERY is
the query to get the data from. SN\_LAST\_TS is the time of the last
update reflected for incremental snapshots (from the snapshot log's
SNAPTIME). SN\_IS\_INCREMENTAL is null for nonincremental snapshots and
non-null for the incremental ones. SN\_SOURCE\_TABLE is the source table
for the incremental snapshots, NULL otherwise.

This implies that an incremental snapshot can be updated in two ways -
incrementally and nonincrementally as the nonincremental definition is a
subset of the incremental definition.

### SYS\_SNAPSHOT\_LOG

    CREATE TABLE SYS_SNAPSHOT_LOG (
        SNL_SOURCE  varchar (320) NOT NULL,
        SNL_RLOG    varchar (320) NOT NULL,
        SNL_RPLOG   varchar (320) NOT NULL,
        primary key (SNL_SOURCE)
    )

This table describes all defined snapshot replication relation logs.
SNL\_SOURCE is the base table for which a snapshot log is defined.
SNL\_RLOG is the name of the RLOG snapshot log auxiliary table.
SNL\_RPLOG is the name of the RPLOG snapshot log auxiliary table.

<a id="id15-table-snapshot-logs"></a>
## Table snapshot logs

In order to be able to create incremental snapshots on a table there
should be a snapshot log table defined in the following fashion:

    create table RLOG_sourcetable (
    RLOG_sourcetable_primarykey_parts,
    ...
    SNAPTIME DATETIME,
    DMLTYPE  CHAR(1),
    RLOG_ROWGUID VARCHAR(255),
    PRIMARY KEY (RLOG_*));

The name of the snapshot log table is constructed from the name of the
source table by prefixing it with RLOG\_ .

Snapshot log table contains all the primary key parts of the source
table prefixed with RLOG\_ .

Snapshot log table contains at most one row per updated source table row
with the update time and update type in DMLTYPE (I - for insert, U - for
update, D - for delete).

Snapshot log table contains RLOG\_ROWGUID column which uniquely
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

where xxx is the source table name, RLOG\_xxx is the snapshot log table
name, xxx\_pk is a comma separated list of the source table's primary
key parts. The names of the triggers are constructed from the fully
qualified name (DB.DBA.Orders makes DB\_DBA\_Orders\_I\_log).

Table snapshot logs and triggers are created automatically for Virtuoso
and databases listed in [Heterogeneous Snapshot Replication](#snpheter)
section.

<a id="id16-transactional-replication"></a>
# Transactional Replication

The unit of replication is a publication. A publication is an ordered
sequence of transaction entries. One database transaction can add data
to zero or more publications. The data contributed to a publication by a
transaction is appended to the publication at the time of commit.
Because commits are serialized database wide, items in a publication
have a well defined order.

Each transaction entry in a publication has a unique sequence number
within the publication. Each subscriber of a publication has a level of
synchronization, which is the serial number of the last transaction from
the publication which this subscriber has processed.

Each publication has exactly one publisher and zero or more subscribers.
Any multi-master merge replication schemes will be based on this notion,
with data to be merged back into the original source regarded as a
separate publication and the merge regarded as a process between
publications.

In order to publish data for replication by others a server must have a
unique name within the group of servers participating in the
replication. This server name is assigned to the server in its
virtuoso.ini file in the DBName setting.

To publish data the publishing server initializes a publication with the
repl\_publish function, where it names the publication and assigns a log
file name for it. The server can then start adding transactions to the
publication, which can happen either under application control or
implicitly.

> **Tip**
> 
> See the [repl\_text](#transreplpublishfunctions) function.

To subscribe to publications a server must also have a distinct DBName.
It identifies the publishing server by associating a host name and port
number to its logical name with the repl\_server function. It can then
call `repl_subscribe()` . Replication feeds from publisher are replayed
by 'dba' user by default. The default can be changed (see
[repl\_subscribe()](#fn_repl_subscribe) function). for each of the
publications it subscribes to. A publication is uniquely identified on
the subscriber with the publishing server name and the publication name.
Note that several servers in a network may publish like named
publications and these will be logically distinct, having each their own
distinct publisher.

A subscriber may or may not be connected to the publisher at any point
in time. If a subscriber is connected to the publisher it may either be
'in sync' or syncing'. In the syncing state it is receiving transaction
entries with numbers consecutive from its sync level up until the last
committed serial number committed on the server.

At the start of the sync communication the subscriber indicates the
level of the last successfully processed transaction in the publication.
The sync exchange terminates when the subscriber reaches the last
committed item on the publication. At this point the subscriber is said
to be 'in sync'. The connection to the publisher is then maintained by
default and is used to send sync information as it becomes available.
This means that once an entry is appended to the publication by a
committing a transaction it is sent to the 'in sync' subscribers without
separate request.

The publisher can terminate the replication feed by unilateral decision.
It will do it if the sending of the message times out for too long or if
the queue of 'to be sent' replication records exceeds a settable
threshold. This essentially happens with communication failures or if
the subscriber continuously processes the feed at a speed lower than the
feed production speed of the publisher. A disconnected subscriber can
reconnect at will, in which case it enters the 'syncing' state and will
receive transactions from the point where the feed was cut.

A subscriber can disconnect from the publisher at any time without ill
effect.

A table

    SYS_REPL_ACCOUNTS (
        SERVER varchar,
        ACCOUNT varchar,
    
        NTH integer,
        LEVEL integer,
        IS_MANDATORY integer,
        IS_UPDATEABLE integer,
        SYNC_USER varchar,
    
        P_MONTH integer,
        P_DAY integer,
        P_WDAY integer,
        P_TIME time,
    
        primary key (SERVER, ACCOUNT))

is used to store information about published accounts and accounts this
server is subscribed to.

A table

    SYS_REPL_SUBSCRIBERS (
        RS_SERVER varchar,
        RS_ACCOUNT varchar,
        RS_SUBSCRIBER varchar not null,
    
        RS_LEVEL integer NOT NULL,
        RS_VALID integer NOT NULL,
    
        primary key (RS_SERVER, RS_ACCOUNT, RS_SUBSCRIBER))

is used to store subscribers' status (pushback accounts for updateable
subscriptions are there too). Subscribers for an account are added to
this table automatically on each request to sync an account from
subscriber or manually from Admin UI.

SYS\_REPL\_SUBSCRIBERS.RS\_VALID column is be used to designate
subscribers whose replication account level is valid (lags not more than
REPL\_MAX\_DELTA behind the publisher's level).

RS\_VALID state of subscriber is checked and updated on every sync
request from subscriber. If subscriber is found to be invalid all
further sync requests from it are ignored. Such subscriber need to be
reinitialized manually and marked as valid using Admin UI.

<a id="id17-publishable-items"></a>
## Publishable Items

Tables, stored procedures and DAV collections may be added to a
transactional publication. When a table is added, triggers are created
for capturing changes to the table. When a procedure is added, all calls
to this procedure will be recorded in the publication's log and the same
procedure will be called on the subscriber. When a procedure is
published in this manner, actions performed inside the procedure are not
themselves recorded even if they touch on items that are part of a
publication. It is assumed that the procedure on the subscriber will
produce the equivalent effect. When a DAV collection is published,
operations on direct and indirect members of the collection are logged
into the publication's log. When this is replayed on the subscriber, the
operations are repeated on like-named DAV resources, creating
collections and resources as needed.

When a table or procedure is added to a publication, the creating
statement is added also, so that the subscribers come to create the
table or procedure before receiving any replication operations on said
table or procedure. Also when the table or procedure is altered, the
altering statements are added to the publication so s to be reflected on
all subscribers. This can be overridden for procedures, since in some
cases it is desirable to have a different definition on the subscriber.
Table constraints are also replicated, except for foreign key
constraints with tables outside the publication, since these would not
be meaningful on the subscriber, as there is no knowledge on what tables
may exist there outside of the ones in the publication. Changes to
schema on subscribers are never replicated to the publisher, even if we
had bidirectional replication. Identity and timestamp columns are
replicated so that the values on the subscriber are assigned by the
publisher.

When a procedure is published, it is possible to specify whether the
definitions, calls or both are replicated. Usually specifying both calls
and definition is reasonable, sometimes only calls are to be replicated
if the procedure intentionally has a different definition in the
subscriber. This is useful for example when the subscriber gathers
statistics or maintains a data warehouse where the storage schema is not
identical with that of the publisher. Only procedures with input
parameters can be replicated. The rationale is that replication is a one
way stream and no return values, result sets or output parameters can be
captured by either publisher or subscriber. Procedure calls cannot be
replicated bidirectionally, these go from publisher to subscriber
exclusively.

Even though replication can carry schema changes, it is in no way a
means of keeping software installations in sync. Many schema elements
such as triggers are not covered and a software upgrade is more complex
than can be represented by replication alone.

<a id="id18-errors-in-replication"></a>
## Errors in Replication

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

<a id="id19-publisher-transactional-replication-functions"></a>
## Publisher Transactional Replication Functions

The most generic form of the replication element is a stored procedure
call. This associates a procedure name and set of parameters to a
publication inside a transaction. When the transaction commits, all the
publication entries are appended to the publication, forming a
replication entry with its unique number.

These functions are available to the publishing Virtuoso server:

  - [`repl_publish()`](#fn_repl_publish)

  - [`repl_unpublish()`](#fn_repl_unpublish)

  - [`repl_pub_add()`](#fn_repl_pub_add)

  - [`repl_pub_remove()`](#fn_repl_pub_remove)

  - [`repl_pub_init_image()`](#fn_repl_pub_init_image)

  - [`repl_new_log()`](#fn_repl_new_log)

  - [`repl_text()`](#fn_repl_text)

  - [`repl_grant()`](#fn_repl_grant)

  - [`repl_revoke()`](#fn_repl_revoke)

<a id="id20-subscriber-functions"></a>
## Subscriber Functions

These are the functions that are available to the subscribing Virtuoso
server:

  - [`repl_server()`](#fn_repl_server)

  - [`repl_subscribe()`](#fn_repl_subscribe)

  - [`repl_unsubscribe()`](#fn_repl_unsubscribe)

  - [`repl_init_copy()`](#fn_repl_init_copy)

  - [`repl_sync()`](#fn_repl_sync)

  - [`repl_sync_all()`](#fn_repl_sync_all)

  - [`repl_sched_init()`](#fn_repl_sched_init)

  - [`sub_schedule()`](#fn_sub_schedule)

  - [`repl_disconnect()`](#fn_repl_disconnect)

  - [`repl_this_server()`](#fn_repl_this_server)

  - [`repl_purge()`](#fn_repl_purge)

<a id="id21-common-status-functions"></a>
## Common Status Functions

  - [`repl_stat()`](#fn_repl_stat)

  - [`repl_status()`](#fn_repl_status)

The status () function shows a replication status summary. The same data
can be obtained with the repl\_stat and repl\_status procedures.

<a id="id22-bi-directional-transactional-replication"></a>
## Bi-Directional Transactional Replication

Virtuoso supports bi-directional transactional replication via a
mechanism of updateable subscriptions. The following rules and
conditions must be observed:

Every table has only one publisher.

Only direct subscribers are considered.

Only replication of tables is allowed.

It is assumed that all the tables within a publication have primary keys
and that the primary key columns are never modified.

Every transaction has an origin, i.e. the originating server on which
the transaction was performed.

Modifications to a subscriber come from publisher only using the
ordinary transactional replication technique: the subscriber initiates
an update and pulls (requests) replication logs from publisher. The
publisher sends the replication log from the replication log files and
then places the subscriber into "synced" (or "online") mode. In this
mode the replication logs are sent to subscriber immediately after each
COMMIT.

Data flow from a subscriber to the publisher is very similar: the
subscriber initiates the update and pushes replication logs to the
publisher. After all replication log data has been sent to the publisher
it is put into "synced" mode and will receive modifications immediately
after each COMMIT on subscriber.

### Creating Publications for Updateable Subscriptions

In order to create a publication that allows transaction-based
replication and updateable subscriptions use the `repl_publish()` with a
non-zero third argument. Replication feeds from subscribers can be
replayed by user different from 'dba' user.

    repl_publish('foo', 'foo.log', 1, 'demo');

This will create updateable publication 'foo'. Replication feeds from
subscribers will be replayed as user 'demo'.

### Adding Tables to a Publication

When a table is added to an updateable publication a new 'ROWGUID
varchar' column is automatically added to the table. This column will be
used for conflict resolution (described later). If the table already has
column with such a name, an existing column will be used (with checking
for appropriate data type and width). ROWGUID columns hold globally
unique identifiers of a row and are modified after each UPDATE of a row.
ROWGUID column values are OSF DCE 1.1 compliant Universally Unique
Identifiers (UUID).

ROWGUID columns are used for conflict resolution for
INSERT/UPDATE/DELETE DML operations. Basically, if a ROWGUID column that
came from a subscriber does not differ from the ROWGUID column of the
publisher's table then it is assumed that there is no conflict,
otherwise conflict resolution must take place.

### Conflict Resolution

Since every table may have only one publisher, conflicts resolution will
always take place on the publisher.

Assume some DML operation that occurred on a subscriber is being
replayed on publisher. There may be three types of conflicts:

1.  **uniqueness conflict (insert conflict).**
    
    occurs when the row with some primary key \<PK\> already exists in
    publisher's table.

2.  **update conflict.**
    
    occurs when an UPDATE modifies a row which has already been modified
    on publisher (by the publisher or another subscriber).

3.  **delete conflict.**
    
    occurs when an UPDATE modifies a row or a DELETE removes a row that
    does not exist on publisher anymore.

Every table has a number of conflict resolvers that are used for
conflict resolution. These are stored in DB.DBA.SYS\_REPL\_CR system
table. Each conflict resolver has a type ('I', 'U', or 'D') and an
order. Conflict resolvers are applied in ascending order.

The conflict resolver is a Virtuoso/PL procedure that receives a
conflicting row from a subscriber and some other arguments. The conflict
resolver can modify the row, which is passed as an 'inout' argument. The
conflict resolver should return an integer value, which will be used for
conflict resolution.

Conflict resolvers of different types have different signatures:

'I' - Insert conflict resolvers

(\<ALLCOLS\>, inout \_origin varchar)

'U' - Update conflict resolvers

(\<ALLCOLS\>, , \<ALLOLDCOLS\>, inout \_origin varchar)

'D' - Deletion conflict resolvers

(\<ALLOLDCOLS\>, inout \_origin varchar)

where

\<ALLCOLS\> are new values of all columns including the ROWGUID column,
\<ALLOLDCOLS\> are old values of all columns, and \_origin is
transaction originator.

Conflict resolvers can return the following integer values; The conflict
resolver types concerned for each are listed in parentheses:

  - **0 - can't decide (I, U, D).**
    
    next conflict resolver will be fired.

  - **1 - subscriber wins (I, U, D).**
    
    DML operation will be applied with \<ALLCOLS\> All the subscribers
    except originator will receive modifications (originator already has
    them).

  - **2 - subscriber wins, change origin (I, U).**
    
    DML operation will be applied with \<ALLCOLS\> and origin of
    transaction will be changed to publisher's server name. All the
    subscribers (including originator) will receive modifications. This
    return value is useful when conflict resolver changed some of the
    columns of the row that were passed in. Although all parameters of
    conflict resolver are inout only changing of \<ALLCOLS\> (non-PK
    columns) parameters makes sense.

  - **3 - publisher wins (U).**
    
    DML operation will be applied with \<ALLCOLS\> taken from
    publisher's table. All the subscribers will receive modifications.

  - **4 - reserved.**

  - **5 - ignore (D).**
    
    DML operation is ignored.

Conflict resolution stops when conflict resolvers return a non-zero
value meaning that it has made a decision.

Suppose we have the following table:

    create table items(
      item_id integer primary key,
    
      name varchar,
      price decimal
    );

"Publisher wins" 'I' conflict resolver will look like:

    create procedure items_cr(
        inout _item_id integer,
        inout _name varchar,
        inout _price decimal,
        inout _origin varchar)
      returns integer
    {
      return 3;
    }

The conflict resolver that will make a decision based on the minimal
price column will look like:

    create procedure items_cr(
        inout _item_id integer,
        inout _name varchar,
        inout _price decimal,
        inout _rowguid varchar,
        inout _old_item_id integer,
        inout _old_name varchar,
        inout _old_price decimal,
        inout _old_rowguid varchar,
        inout _origin varchar)
      returns integer
    {
      declare p decimal;
      -- get current price value
      select price into p from items where item_id = _item_id;
      if (p < _price)
        return 3;           -- publisher wins
      else if (p > _price)
        return 1;           -- subscriber wins
      return 0;         -- can't decide
    }

Conflict resolver that will change the price to the minimal value will
look like:

    create procedure items_cr(
        inout _item_id integer,
        inout _name varchar,
        inout _price decimal,
        inout _rowguid varchar,
        inout _old_item_id integer,
        inout _old_name varchar,
        inout _old_price decimal,
        inout _old_rowguid varchar,
        inout _origin varchar)
      returns integer
    {
      declare p decimal;
      -- get current price value
      select price into p from items where item_id = _item_id;
      if (p < _price)
        {
          _price := p;
          return 2;         -- publisher wins, change origin
        }
      return 1;         -- subscriber wins
    }

Conflict resolution occurs differently for each kind of DML operation:

  - **INSERT.**
    
    When INSERT of some row with primary key \<PK\> is replayed, the row
    in the publisher's table with such \<PK\> is looked-up. If the row
    does not exist then there is no conflict, conflict resolution stops
    and the INSERT is replayed. If the row exists then we have a
    "uniqueness conflict". In this case 'I' conflict resolvers are
    fired-up. If none of the 'I' conflict resolvers were able to make a
    decision (return non-zero value) the default action is 'publisher
    wins'.

  - **UPDATE.**
    
    When there is an UPDATE of some row with primary key \<PK\> is
    replayed, the row (and its ROWGUID) in publisher's table with such
    \<PK\> is looked-up. If the row does not exist then we have a
    "delete conflict", 'D' conflict resolvers are fired up. If none of
    the 'D' conflict resolvers were able to make a decision the default
    action will be to 'ignore'. If the row exists in the publisher's
    table and its ROWGUID is the same as that from the subscriber then
    there is no conflict. Conflict resolution stops and the UPDATE is
    replayed. If the row exists and its ROWGUID differs from the one
    that came from subscriber then we have an "update conflict". In this
    case the 'U' conflict resolvers are fired-up. If none of the 'U'
    conflict resolvers were able to make a decision (return non-zero
    value) the default action will be 'publisher wins'.

  - **DELETE.**
    
    When DELETE of some row with primary key \<PK\> is replayed, the row
    in the publisher's table with such \<PK\> is looked-up. If the row
    does not exist or if the row exists but its ROWGUID differs from the
    one that came from subscriber then we have "delete conflict". The
    'D' conflict resolvers are fired-up. If none of the 'D' conflict
    resolvers were able to make a decision then the default action will
    be taken to 'ignore'. Otherwise it is assumed that there is no
    conflict and DELETE statement is replayed.

### Automatically Generated Conflict Resolvers

Simple conflict resolvers can be generated automatically. This can be
done by calling REPL\_ADD\_CR function.

> **Tip**
> 
> [`REPL_ADD_CR()`](#fn_repl_add_cr)

### Replication Log Data

Replication log data is different for each kind of DML operation:

  - **INSERT.**
    
    (stmt, \<ALLCOLS\>)

  - **UPDATE.**
    
    (stmt, \<ALLCOLS\>, \<OLDPK\>, \<ALLOLDCOLS\>, ncols)

  - **DELETE.**
    
    (stmt, \<OLDPK\>, \<ALLOLDCOLS\>, ncols)

where

stmt is DML statement (varchar), \<ALLCOLS\> is new values of all
columns, \<OLDPK\> is primary key, specifying a row for which (UPDATE or
DELETE) DML statement is executed, \<ALLOLDCOLS\> is old values of all
columns, ncols is number of columns in table (integer).

The format of the log replication data is the same as in simple
transactional replication with addition of \<ALLOLDCOLS\> and ncols for
logging UPDATE and DELETE statements.

<a id="id23-purging-replication-logs"></a>
## Purging replication logs

Every replication account has an associated sequence which holds
replication account level (basically, transaction number). Each
subscriber also maintains a sequence where it stores its replication
account level.

When subscriber issues a sync request for an account it submits its
replication account level so publisher can find a point in time from
where it should start to submit replication logs to publisher.

Replication account level can roll over REPL\_WRAPAROUND (0x7fffffff) to
1. Old replication logs need to be purged to allow this to work
correctly. Procedure [repl\_purge()](#fn_repl_purge) purges replication
logs for a specified account.

Columns needed to store purger configuration in SYS\_REPL\_ACCOUNTS
table are: P\_MONTH integer (month, nullable), P\_DAY integer (day of
month, nullable), P\_TIME time (time, nullable)

If P\_TIME is NULL log purger will not be scheduled to run at all. If
P\_TIME is not NULL there can be the following combinations of P\_MONTH,
P\_DAY and P\_WDAY ('\*' means NULL value, 'x' means any value):

|            |          |           |                                                 |
| ---------- | -------- | --------- | ----------------------------------------------- |
| *P\_MONTH* | *P\_DAY* | *P\_WDAY* | *meaning*                                       |
| month      | day      | x         | purger is run yearly on specified month and day |
| month      | \*       | x         | purger is run yearly on 1st of month            |
| \*         | day      | x         | purger is run monthly on specified day of month |
| \*         | \*       | wday      | purger is run weekly on specified day of week   |
| \*         | \*       | \*        | purger is run daily                             |

Purger config settings

An entry to call purger is inserted (or updated) into
SYS\_SCHEDULED\_EVENT after each modification of purger settings for an
account (from Admin UI) or after each successful run of repl\_purge()
for this account.

<a id="id24-objects-created-by-transactional-replication"></a>
## Objects created by transactional replication

Virtuoso creates triggers "\<name\>\_I", "\<name\>\_U" and "\<name\>\_D"
for every published table. On subscriber
"DB"."DBA"."SYS\_REPL\_ACCOUNTS" table and "DB"."DBA"."TP\_ITEM" view
are attached from publisher as "DB"."\<dsn\>"."SYS\_REPL\_ACCCOUNTS" and
"DB"."\<dsn\>"."TP\_ITEM" respectively.

If publication is updateable Virtuoso additionally creates the following
objects: "\<qual\>"."\<owner\>"."replcr\_\<name\>\_I",
"\<qual\>"."\<owner\>"."replcr\_\<name\>\_U" and
"\<qual\>"."\<owner\>"."replcr\_\<name\>\_D" procedures for every
published table. These procedures are used for conflict resolution.,
Triggers "\<name\>\_I", "\<name\>\_U" and "\<name\>\_D" for every
subscribed table.

<a id="id25-virtuoso-scheduler"></a>
# Virtuoso scheduler

Virtuoso scheduler allows an arbitrary SQL command to be run at certain
intervals.

The scheduler process wakes up every n minutes, scans the
SYS\_SCHEDULED\_EVENT table and executes each command which applies to
the current time. Note that overdue commands are executed only once.

There is a virtuoso.ini parameter "SchedulerInterval" under
[Parameters](#ini_parameters) section which defines the scheduler
wake-up interval. Set this to 0 (the default) to disable the scheduler.

<a id="id26-sys_scheduled_event"></a>
## SYS\_SCHEDULED\_EVENT

    CREATE TABLE SYS_SCHEDULED_EVENT(
        SE_NAME     varchar,
        SE_START        datetime,
        SE_SQL      varchar,
        SE_LAST_COMPLETED   datetime,
        SE_INTERVAL     integer,
        PRIMARY KEY(SE_NAME));

This table describes each scheduled SQL command. SE\_NAME is the name of
the scheduled event. SE\_START is the first schedule execution time.
SE\_SQL is the text of the SQL command to be executed.
SE\_LAST\_COMPLETED is the last time when the SQL command was executed
successfully. SE\_INTERVAL is the interval between the runs of the SQL
command in minutes.

Defining a new scheduled event means adding a row to the
SYS\_SCHEDULED\_EVENT with an insert statement like this:

    INSERT INTO SYS_SCHEDULED_EVENT (SE_NAME, SE_SQL, SE_START, SE_INTERVAL)
            VALUES (.....)

<a id="id27-transactional-replication-example"></a>
# Transactional Replication Example

    -- ================================
    -- ON PUBLISHER SIDE (named 'rep1')
    -- ================================
    set DSN=1111;
    reconnect;
    -- Create test tables & fill with data
    create table DB.DBA.TEST (id integer, name varchar, tm datetime,
        content long varchar, primary key (id, name));
    create table "ab ""cd" ("id key" integer, "ef ""gh" varchar, primary key ("id key"));
    insert into DB.DBA.TEST values (1, 'a', now(), 'xxx');
    insert into DB.DBA.TEST values (1, 'b', now(), 'xxx');
    insert into DB.DBA.TEST values (1, 'c', now(), 'xxx');
    insert into DB.DBA.TEST values (1, 'd', now(), 'xxx');
    insert into "ab ""cd" values (1,'1');
    -- Public one account named 'dav'
    REPL_PUBLISH ('dav', 'dav.log');
    -- Add an existing collection '/DAV/repl' into the 'dav' publication
    REPL_PUB_ADD ('dav', '/DAV/repl/', 1, 0, null);
    -- Public second account named 'tbl' for tables'
    REPL_PUBLISH ('tbl', 'tbl.log');
    -- Add 'TEST' table into the 'tbl' publication account
    REPL_PUB_ADD ('tbl', 'DB.DBA.TEST', 2, 0, null);
    -- Add 'ab "cd' table into the 'tbl' publication account
    REPL_PUB_ADD ('tbl', 'DB.DBA.ab "cd', 2, 0, null);

    -- ================================
    -- ON SUBSCRIBER SIDE (named 'rep2')
    -- ================================
    set DSN=1112;
    reconnect;
    -- Add publication server named 'rep1' with DSN '1111' placed
    -- on 'localhost' machine and using port '1111'
    REPL_SERVER ('rep1', '1111', 'localhost:1111');
    -- Add subscription for 'dav' publication account
    REPL_SUBSCRIBE ('rep1', 'dav', null, null, 'dba', 'dba');
    -- Perform initial copy of publication 'dav' data
    DB..REPL_INIT_COPY ('rep1', 'dav');
    -- Add subscription for 'tbl' publication
    REPL_SUBSCRIBE ('rep1', 'tbl', null, null, 'dba', 'dba');
    -- Perform initial copy of publication 'tbl' data
    DB..REPL_INIT_COPY ('rep1', 'tbl');
    
    -- Now we look at copied data (should return 4)
    select count(*) from TEST;
    -- And second table (should return 1)
    select count(*) from "ab ""cd";
    
    -- Turn subscription in 'SYNC'
    SYNC_REPL();

    -- ================================
    -- ON PUBLISHER SIDE (named 'rep1')
    -- ================================
    set DSN=1111;
    reconnect;
    -- Insert an additional data
    insert into DB.DBA.TEST values (7,'a',now(), repeat('x',1000000));
    insert into "ab ""cd" values (2,'2');
    insert into "ab ""cd" values (3,'3');
    insert into "ab ""cd" values (4,'4');
    delete from "ab ""cd" where "id key" = 4;
    update "ab ""cd" set "ef ""gh" = '4' where "id key" = 3;

    -- ================================
    -- ON SUBSCRIBER SIDE (named 'rep2')
    -- ================================
    set DSN=1112;
    reconnect;
    -- make a procedure to check status of subscription
    create procedure WAIT_FOR_SYNC (in srv varchar, in acct varchar)
    {
      declare level, stat integer;
      stat := 0;
      while (level < 6)
        {
          repl_status (srv, acct, level, stat);
          if (stat = 3)
        SYNC_REPL ();
        }
    };
    -- run it till subscription got the right level of synchronization
    WAIT_FOR_SYNC ('rep1', 'tbl');
    
    -- Check the data (should return 5)
    select count (*) from DB.DBA.TEST;
    -- Check the data (should return 3)
    select count(*) from "ab ""cd";
    
    -- Check the new data entered on publisher (will return 4)
    select "ef ""gh" from "ab ""cd" where "id key" = 3;
    
    -- Check the old data deleted from publisher (will return 0)
    select count(*) from "ab ""cd" where "id key" = 4;

    -- ================================
    -- ON PUBLISHER SIDE (named 'rep1')
    -- ================================
    set DSN=1111;
    reconnect;
    -- Create an table to use for procedure calls
    create table p_test (id integer, dt varchar, primary key (id));
    insert into  p_test values (1, '1');
    insert into  p_test values (2, '2');
    insert into  p_test values (3, '3');
    insert into  p_test values (4, '4');
    insert into  p_test values (5, '5');
    -- And an procedure which inserts records in p_test table
    create procedure t_proc (in i integer)
    {
      declare d varchar;
      select dt into d from p_test where id = i;
      d := concat (d, d);
      update p_test set dt = d where id = i;
    };
    
    -- Make an account named 'proc' for procedure replication
    REPL_PUBLISH ('proc', 'proc.log');
    -- Add 't_proc' procedure into 'proc' publication
    REPL_PUB_ADD ('proc', 'DB.DBA.t_proc', 3, 0, 3);

    -- ================================
    -- ON SUBSCRIBER SIDE (named 'rep2')
    -- ================================
    set DSN=1112;
    reconnect;
    -- crate the same table on subscriber
    create table p_test (id integer, dt varchar, primary key (id));
    -- insert an data into it
    insert into  p_test values (1, '1');
    insert into  p_test values (2, '2');
    insert into  p_test values (3, '3');
    insert into  p_test values (4, '4');
    insert into  p_test values (5, '5');
    -- Add subscription for 't_proc' publication
    REPL_SUBSCRIBE ('rep1', 'proc', null, null, 'dba', 'dba');
    -- Perform initial copy of procedure definition
    DB..REPL_INIT_COPY ('rep1', 'proc');
    -- Turn all subscriptions in 'SYNC' state
    SYNC_REPL();

    -- ================================
    -- ON PUBLISHER SIDE (named 'rep1')
    -- ================================
    set DSN=1111;
    reconnect;
    -- call 5 times 't_proc'
    t_proc(1);
    t_proc(2);
    t_proc(3);
    t_proc(4);
    t_proc(5);

    -- ================================
    -- ON SUBSCRIBER SIDE (named 'rep2')
    -- ================================
    set DSN=1112;
    reconnect;
    -- create an procedure to check synchronization level
    create procedure WAIT_FOR_SYNC (in srv varchar, in acct varchar, in n integer)
    {
      declare level, stat integer;
      stat := 0;
      while (level < n)
        {
          repl_status (srv, acct, level, stat);
        }
    };
    -- and run it till level set to 5
    WAIT_FOR_SYNC ('rep1', 'proc', 5);
    
    -- check local data (should return 5)
    select count(*) from p_test where length (dt) = 2;

    -- ================================
    -- ON PUBLISHER SIDE (named 'rep1')
    -- ================================
    set DSN=1111;
    reconnect;
    -- modify procedure to insert 123 new records
    create procedure t_proc (in i integer)
    {
      declare d varchar;
      declare n integer;
      n := 128;
      while (n > 5)
        {
          insert into p_test (id, dt) values (n, cast (n as varchar));
          n := n - 1;
        }
    };
    -- and call it once
    t_proc (1);

    -- ================================
    -- ON SUBSCRIBER SIDE (named 'rep2')
    -- ================================
    set DSN=1112;
    reconnect;
    -- and run check routine till level set to 7
    WAIT_FOR_SYNC ('rep1', 'proc', 7);
    -- check  local data (should return 128, old 5 + 123 new records)
    select count(*) from p_test;

<a id="id28-transactional-replication-objects-example"></a>
## Transactional Replication Objects Example

Preconditions

publisher named 'rep' with replication address 'localhost:1111'

subscriber named 'sub'

on subscriber should be defined DSN for rep named '1111'

**On publisher side.**

Creating publication

    SQL> REPL_PUBLISH ('pub', 'pub.log');
    
    -- Add row in SYS_REPL_ACCOUNTS table
    SQL> select SERVER, ACCOUNT from SYS_REPL_ACCOUNTS
        where ACCOUNT = 'pub';
    
    SERVER ACCOUNT
    --------------
    rep    pub

started new replication log file in server working directory named
'pub.log', add entry in repl.cfg in server working directory

    SQL> REPL_PUB_ADD ('pub', 'DB.DBA.TEST', 2, 0, null);

    SQL> select * from SYS_TP_ITEM;
    
    TI_SERVER TI_ACCT TI_TYPE TI_ITEM     TI_OPTIONS TI_IS_COPY
    ___________________________________________________________
    rep       pub     2       DB.DBA.TEST NULL       0

Adding items to the publication

Add row in SYS\_TP\_ITEM

**On Subscriber Side.**

Adding a new publisher

    SQL> REPL_SERVER ('rep', '1111', 'localhost:1111');
    
    -- Add row in SYS_SERVERS
    
    SQL> select * from SYS_SERVERS;
    
    SERVER                    DB_ADDRESS                REPL_ADDRESS
    ----------------------------------------------------------------
    rep                       1111                      localhost:1111

``` 
   SQL> REPL_SUBSCRIBE ('rep', 'pub', 'dav', 'dav_group', 'uid_for_rep', 'uid_pwd_for_rep');
```

'publication and subscription servers have identical names.' if
subscriber and publisher have the same names., 'Publishing server must
be declared with REPL\_SERVER before subscribing' if publisher 'rep' is
not defined from previous step., 'The subscription 'pub' already exist'
if on subscriber 'sub' already exists subscription 'pub', 'User name and
password should be supplied when subscribe to new publisher' if
'uid\_for\_rep' or 'uid\_pwd\_for\_rep' not supplied, 'The table
'DB.DBA.TEST' already exists' if on subscriber 'sub' already exist table
in subscription., 'The WebDAV collection '/DAV/rep/' already exists' if
on 'sub' already exist WebDAV collection in subscription., a VDB error
message if subscriber 'sub' cannot perform attaching TI\_ITEM view from
publisher 'pub'

    SQL> select * from SYS_TP_ITEM where TI_ACCT = 'pub'
    
    TI_SERVER TI_ACCT TI_TYPE TI_ITEM    TI_OPTIONS TI_IS_COPY TI_DAV_USER TI_DAV_GROUP
    ____________________________________________________________________________________
    rep       pub     2       DB.DBA.TEST NULL       0           dav       dav_group
    
    SQL> select SERVER, ACCOUNT from SYS_REPL_ACCOUNTS where ACCOUNT = 'pub';
    
    SERVER ACCOUNT
    --------------
    rep    pub

Making a subscription

This may signal an SQL error if a precondition is not met.

Add row in SYS\_TP\_ITEM and row in SYS\_REPL\_ACCOUNTS

<a id="id29-replication-logger-sample"></a>
# Replication Logger Sample

The logger directory in the samples in the distribution contains a
simple load balancing sample. It implements a simplified web site hit
log where there is a count of hits maintained per user name and origin
IP of each hit.

Thus the transaction being replicated between the servers consists of
incrementing an IP's hit count and then incrementing a user's hit count.
If either IP or user do not have a count, a row is added with a count of
1. The transaction is then logged for replication, so that all servers
get all hits, no matter which of the replicating servers processes the
hit.

    create table wl_ip_cnt (ic_ip varchar, ic_cnt integer,
           primary key (ic_ip));

    create table wl_user (wu_user varchar, wu_cnt integer,
           primary key (wu_user));

    create procedure wl_hit_repl (in ip varchar, in usr varchar)
    {
      set isolation = 'serializable';
      update wl_ip_cnt set ic_cnt = ic_cnt + 1 where ic_ip = ip;
      if (0 = row_count ())
        insert into wl_ip_cnt (ic_ip, ic_cnt) values (ip, 1);
      update wl_user set wu_cnt = wu_cnt + 1 where wu_user = usr;
      if (0 = row_count ())
        insert into wl_user (wu_user, wu_cnt) values (usr, 1);
    }

    create procedure wl_hit (in ip varchar, in usr varchar)
    {
      wl_hit_repl (ip, usr);
      repl_text ('hits', 'wl_hit_repl (?, ?)', ip, usr);
    }

The application client calls wl\_hit on one of the mutually replicating
servers to log an event. The event's trace will then be propagated to
all other servers. The wl\_hit\_repl function does the actual work. The
top level function calls this plus logs the call with its arguments on
the local server's hits publication for distribution to other servers.

<a id="id30-configuration-of-the-sample"></a>
## Configuration of the Sample

The following sequence of calls can be used to define a network of four
servers, each replicating every other server. For the sake of example,
they are all on localhost and listen at ports 2001 through 2004.

    repl_server ('log1', 'localhost:2001');
    repl_server ('log2', 'localhost:2002');
    repl_server ('log3', 'localhost:2003');
    repl_server ('log4', 'localhost:2004');

    repl_publish ('hits', 'hits.log');

    repl_subscribe ('log1', 'hits');
    repl_subscribe ('log2', 'hits');
    repl_subscribe ('log3', 'hits');
    repl_subscribe ('log4', 'hits');

First all the servers are identified. Next the local server declares
that it has a publication 'hits'. Next it subscribes to the hits
publications of all other servers. In the process it also subscribes to
itself, which signals an error and has no other effect.

In this way all servers share one configuration. Each server knows which
of the servers it is based on the DBName setting in its virtuoso.ini
file.

<a id="id31-synchronization"></a>
## Synchronization

    create procedure log_sync ()
    {
      for select SERVER, ACCOUNT from SYS_REPL_ACCOUNTS do
        {
          if (SERVER <> repl_this_server ())
        {
          declare err, msg varchar;
          err := '00000';
          exec ('repl_sync (?, ?, ?, ?)', err, msg, vector (SERVER, ACCOUNT, 'dba', 'dba'), 0);
        }
        }
    }

This procedure will go through all subscriptions and request sync for
each. Note that the repl\_sync function is called inside exec to catch
any possible exceptions, as servers may not be available etc. For the
sake of simplicity this supplies the literal default dba login 'dba',
'dba' as authentication.

The replication sample schedules a call to this function to be made
every minute as a background job. if all replication servers are on line
and in sync or syncing the function will return without delay or effect.
Otherwise it will keep trying until it gets a connection.

<a id="id32-running-the-sample"></a>
## Running the Sample

The logger directory contains various scripts for starting and stopping
servers etc.

*log\_init.sh* - Creates the databases with tables and procedures loaded
in the l1, l2, l3 and l4 subdirectories.

*log\_start.sh* - starts the 4 servers and leaves them running in the
background.

*log\_shut.sh* - Shuts down the 4 test servers.

*hits.sh* \<hist-per-hour\> \<no-of-hits\>

Starts the hits program on each of the 4 servers. The first command line
argument gives the test transaction rate for each client and the next
gives the duration as a transaction count.

    hits <dsn> <uid> <pwd> <hits-per-hour> <no-of-hits>

The hits executable repeatedly calls wl\_hit with random arguments and
collects statistics on call times. If calls complete at a rate faster
than the requested rate this periodically sleeps to keep the rate close
to the requested rate. It prints statistics every 1000 hits.

<a id="id33-notes-on-the-samples-dynamics"></a>
## Notes on the Sample's Dynamics

When the network initially starts all the publications are at level 0
and in sync. When transactions are fed into the network at a
sufficiently slow rate all the servers get to process all transactions
in real time. Note that the structure is such that every server does
everybody else's work in addition to its own. Thus the insertion rate of
the network can't be expected to be higher than that of an individual
server. However read load can be spread across servers, so that this
type of configuration is effective for balancing query load but not for
balancing update load.

As we increase the transaction rate at each server we reach a point at
which the queue of locally committed but un-replicated transactions
grows faster than the other servers will absorb the feed. The servers
will each eventually disconnect all synced replication to stop the queue
from growing. Once the queue that no longer grows goes empty the
subscribers get disconnected. At this point all servers only process
their own load without any other distraction.

Next each server will notice that it is disconnected from the network
and will attempt a resync as a result of the periodic scheduled call to
log\_sync. Each server will then re-establish a connection to every
other server and start resyncing. This will lead to the network being
again in sync if the per server transaction rate slows down sufficiently
to allow replicators to catch up. If this does not happen the syncing
can stay in progress indefinitely, until it either reaches sync or is
terminated.

Typically a server's capacity for processing local transactions is
greater than its capacity for replaying replication feed. This is
because one thread is responsible for all replay activity while many
threads can process local transactions.

The net result of this scheduling policy is that even a heavily
replicated network will scale to high peak loads and will automatically
return to sync state as soon as the peak is over. If guaranteed
transaction level synchronicity must be maintained between servers then
the application should not be written using transactional replication
but rather with distributed transactions, where each commit makes sure
the transaction is fully processed on each participant before returning
to the client. This is however up to several times slower and will stop
the entire network if a single node fails.
