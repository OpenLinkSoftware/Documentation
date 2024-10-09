<div>

<div>

<div>

<div>

### 13.2.4. Bi-Directional Snapshot Replication

</div>

</div>

</div>

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

<div>

|                              |                                                                                                                                                                   |
|:----------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                             |
|                              | Please note that all operations in bi-directional snapshot replication (publication, subscription, doing initial copy, syncing) should be performed on publisher. |

</div>

<div>

**Example 13.1. Creating bi-directional snapshot publication**

<div>

This example demonstrates creating bi-directional snapshot publication
of table 'Demo.demo.Shippers'.

``` screen
SQL> REPL_CREATE_SNAPSHOT_PUB ('Demo.demo.Shippers', 2);
```

</div>

</div>

  

<div>

**Example 13.2. Creating bi-directional snapshot subscription**

<div>

This example demonstrates creating bi-directional snapshot subscription
for table 'Demo.demo.Shippers' and loading initial data on subscriber
with DSN 'localhost:1121'.

``` screen
SQL> REPL_SNP_SERVER ('localhost:1121', 'dba', 'dba');
SQL> REPL_CREATE_SNAPSHOT_SUB (REPL_SERVER_NAME ('localhost:1121'), 'Demo.demo.Shippers', 2);
SQL> REPL_INIT_SNAPSHOT (REPL_SERVER_NAME ('localhost:1121'), 'Demo.demo.Shippers', 2);
```

</div>

</div>

  

<div>

**Example 13.3. Syncing bi-directional snapshot publication**

<div>

This example demonstrates syncing bi-directional snapshot publication of
table 'Demo.demo.Shippers'.

``` screen
SQL> REPL_UPDATE_SNAPSHOT ('Demo.demo.Shippers', 2);
```

</div>

</div>

  

<div>

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p>The following
functions are used for creating, dropping and updating publications and
subscriptions to them:</p>
<p><a href="fn_repl_create_snapshot_sub.html" class="link"
title="REPL_CREATE_SNAPSHOT_SUB"><code
class="function">REPL_CREATE_SNAPSHOT_SUB()</code></a></p>
<p><a href="fn_repl_create_snapshot_pub.html" class="link"
title="REPL_CREATE_SNAPSHOT_PUB"><code
class="function">REPL_CREATE_SNAPSHOT_PUB()</code></a></p>
<p><a href="fn_repl_drop_snapshot_sub.html" class="link"
title="REPL_DROP_SNAPSHOT_SUB"><code
class="function">REPL_DROP_SNAPSHOT_SUB()</code></a></p>
<p><a href="fn_repl_drop_snapshot_pub.html" class="link"
title="REPL_DROP_SNAPSHOT_PUB"><code
class="function">REPL_DROP_SNAPSHOT_PUB()</code></a></p>
<p><a href="fn_repl_init_snapshot.html" class="link"
title="REPL_INIT_SNAPSHOT"><code
class="function">REPL_INIT_SNAPSHOT()</code></a></p>
<p><a href="fn_repl_update_snapshot.html" class="link"
title="REPL_UPDATE_SNAPSHOT"><code
class="function">REPL_UPDATE_SNAPSHOT()</code></a></p>
<p><a href="fn_repl_snp_server.html" class="link"
title="REPL_SNP_SERVER"><code
class="function">REPL_SNP_SERVER()</code></a></p>
<p><a href="fn_repl_server_name.html" class="link"
title="REPL_SERVER_NAME"><code
class="function">REPL_SERVER_NAME()</code></a></p></td>
</tr>
</tbody>
</table>

</div>

<div>

<div>

<div>

<div>

#### Conflict Resolution

</div>

</div>

</div>

Since every table can have only one publisher, conflicts can only occur
on the publisher when modifications from a subscriber are attempted.
When DML operations originating on a subscriber are being replayed on
the publisher, three types of conflicts can arise:

<div>

1.  **uniqueness conflict (insert conflict). ** occurs when the row with
    some primary key \<PK\> already exists in publisher's table.

2.  **update conflict. ** occurs when UPDATE modifies a row which has
    already been modified on publisher (by the publisher or another
    subscriber)

3.  **delete conflict. ** occurs when DELETE deletes a row that does not
    exist on publisher anymore.

</div>

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

|                                                                                                       |
|-------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*'I' - Insert conflict resolvers*</span> (\<ALLCOLS\>, inout \_origin varchar) |
| <span class="emphasis">*'U' - Update conflict resolvers*</span> (\<ALLCOLS\>, inout \_origin varchar) |
| <span class="emphasis">*'D' - Deletion conflict resolvers*</span> (\<PK\>, inout \_origin varchar)    |

where

\<ALLCOLS\> are the new values of all columns (including the ROWGUID
column), \<PK\> are the values of primary key columns, and \_origin is
transaction originator.

Conflict resolvers can return the following integer values; The conflict
resolver types concerned for each are listed in parentheses:

<div>

- **0 - un-decide (I, U, D). ** next conflict resolver will be fired.

- **1 - subscriber wins (I, U, D). ** DML operation will be applied with
  \<ALLCOLS\> All the subscribers except originator will receive
  modifications (originator already has them).

- **2 - subscriber wins, change origin (I, U). ** DML operation will be
  applied with \<ALLCOLS\> and origin of transaction will be changed to
  publisher's server name. All the subscribers (including originator)
  will receive modifications. This return value is useful when conflict
  resolver changed some of the columns of the row that were passed in.
  Although all parameters of conflict resolver are inout only changing
  of \<ALLCOLS\> (non-PK columns) parameters makes sense.

- **3 - publisher wins (U). ** DML operation will be applied with
  \<ALLCOLS\> taken from publisher's table. All the subscribers will
  receive modifications.

- **4 - reserved. **

- **5 - ignore (D). ** DML operation is ignored.

</div>

Conflict resolution stops when some conflict resolver returns a non-zero
value meaning that it has made a decision.

<div>

**Example 13.4. Conflict Resolution**

<div>

Suppose we have the following table:

``` programlisting
create table items(
  item_id integer primary key,

  name varchar,
  price decimal
);
```

"Publisher wins" 'I' conflict resolver will look like:

``` programlisting
create procedure items_cr(
    inout _item_id integer,
    inout _name varchar,
    inout _price decimal,
    inout _origin varchar)
  returns integer
{
  return 3;
}
```

The conflict resolver that will make a decision based on the minimal
price column will look like:

``` programlisting
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
```

The conflict resolver that will change the price to the minimal value
will look like:

``` programlisting
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
```

</div>

</div>

  

Conflict resolution occurs differently for each kind of DML operation:

<div>

- **INSERT. ** When INSERT of some row with primary key \<PK\> is
  replayed, the row in the publisher's table with such \<PK\> is
  looked-up. If the row does not exist then there is no conflict,
  conflict resolution stops and the INSERT is replayed. If the row
  exists then we have a "uniqueness conflict". In this case 'I' conflict
  resolvers are fired-up. If none of the 'I' conflict resolvers were
  able to make a decision (return non-zero value) the default action is
  'publisher wins'.

- **UPDATE. ** When there is an UPDATE of some row with primary key
  \<PK\> is replayed, the row (and its ROWGUID) in publisher's table
  with such \<PK\> is looked-up. If the row does not exist then we have
  a "delete conflict", 'D' conflict resolvers are fired up. If none of
  the 'D' conflict resolvers were able to make a decision the default
  action will be to 'ignore'. If the row exists in the publisher's table
  and its ROWGUID is the same as that from the subscriber then there is
  no conflict. Conflict resolution stops and the UPDATE is replayed. If
  the row exists and its ROWGUID differs from the one that came from
  subscriber then we have an "update conflict". In this case the 'U'
  conflict resolvers are fired-up. If none of the 'U' conflict resolvers
  were able to make a decision (return non-zero value) the default
  action will be 'publisher wins'.

- **DELETE. ** When DELETE operation of some row with primary key \<PK\>
  is replayed, the row in the publisher's table with such \<PK\> is
  looked-up. If the row does not exist or if the row exists but its
  ROWGUID differs from the one that came from subscriber then we have
  "delete conflict". The 'D' conflict resolvers are fired-up. If none of
  the 'D' conflict resolvers were able to make a decision then the
  default action will be taken to 'ignore'. Otherwise it is assumed that
  there is no conflict and DELETE statement is replayed.

</div>

</div>

<div>

<div>

<div>

<div>

#### Conflict Resolution in WebDAV

</div>

</div>

</div>

Conflict resolvers in DAV are found based on the collection. The closest
collection that specifies resolvers will be the one providing the
resolver set. Resolvers from any enclosing collection will not be
invoked.

There is special subcollection in each replicated collection named
'\_SYS_REPL_BACKUP'. This subcollection is never replicated and is used
to store backup copies of resources that lose conflict resolution.

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

</div>

<div>

<div>

<div>

<div>

#### Automatically Generated Conflict Resolvers

</div>

</div>

</div>

Simple table conflict resolvers can be generated automatically by
calling the `REPL_ADD_SNAPSHOT_CR()` function. DAV conflict resolvers be
generated by calling `REPL_ADD_DAV_CR()` function.

<div>

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p><a
href="fn_repl_add_dav_cr.html" class="link"
title="REPL_ADD_DAV_CR"><code
class="function">REPL_ADD_DAV_CR()</code></a></p>
<p><a href="fn_repl_add_snapshot_cr.html" class="link"
title="REPL_ADD_SNAPSHOT_CR"><code
class="function">REPL_ADD_SNAPSHOT_CR()</code></a></p></td>
</tr>
</tbody>
</table>

</div>

The generated procedures can be modified afterwards. In particular it is
possible to change the notification e-mail address by setting the
\_notify_email parameter, and the notification text by setting the
\_notify_text parameter.

The default behaviour for generated procedures is 'pub_wins', making a
backup and notifying the owner by e-mail.

</div>

</div>
