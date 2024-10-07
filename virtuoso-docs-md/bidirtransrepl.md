<div id="bidirtransrepl" class="section">

<div class="titlepage">

<div>

<div>

### 13.3.6. Bi-Directional Transactional Replication

</div>

</div>

</div>

Virtuoso supports bi-directional transactional replication via a
mechanism of updateable subscriptions. The following rules and
conditions must be observed:

|                                         |
|-----------------------------------------|
| Every table has only one publisher.     |
| Only direct subscribers are considered. |
| Only replication of tables is allowed.  |

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

<div id="bidirtransreplcreate" class="section">

<div class="titlepage">

<div>

<div>

#### Creating Publications for Updateable Subscriptions

</div>

</div>

</div>

In order to create a publication that allows transaction-based
replication and updateable subscriptions use the `repl_publish()` with a
non-zero third argument. Replication feeds from subscribers can be
replayed by user different from 'dba' user.

``` programlisting
repl_publish('foo', 'foo.log', 1, 'demo');
```

This will create updateable publication 'foo'. Replication feeds from
subscribers will be replayed as user 'demo'.

</div>

<div id="bidirtransrepladdtable" class="section">

<div class="titlepage">

<div>

<div>

#### Adding Tables to a Publication

</div>

</div>

</div>

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

</div>

<div id="bidirtransreplconflictres" class="section">

<div class="titlepage">

<div>

<div>

#### Conflict Resolution

</div>

</div>

</div>

Since every table may have only one publisher, conflicts resolution will
always take place on the publisher.

Assume some DML operation that occurred on a subscriber is being
replayed on publisher. There may be three types of conflicts:

<div class="orderedlist">

1.  **uniqueness conflict (insert conflict) . ** occurs when the row
    with some primary key \<PK\> already exists in publisher's table.

2.  **update conflict . ** occurs when an UPDATE modifies a row which
    has already been modified on publisher (by the publisher or another
    subscriber).

3.  **delete conflict . ** occurs when an UPDATE modifies a row or a
    DELETE removes a row that does not exist on publisher anymore.

</div>

Every table has a number of conflict resolvers that are used for
conflict resolution. These are stored in DB.DBA.SYS_REPL_CR system
table. Each conflict resolver has a type ('I', 'U', or 'D') and an
order. Conflict resolvers are applied in ascending order.

The conflict resolver is a Virtuoso/PL procedure that receives a
conflicting row from a subscriber and some other arguments. The conflict
resolver can modify the row, which is passed as an 'inout' argument. The
conflict resolver should return an integer value, which will be used for
conflict resolution.

Conflict resolvers of different types have different signatures:

|                                                                                                                          |
|--------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*'I' - Insert conflict resolvers* </span> (\<ALLCOLS\>, inout \_origin varchar)                   |
| <span class="emphasis">*'U' - Update conflict resolvers* </span> (\<ALLCOLS\>, , \<ALLOLDCOLS\>, inout \_origin varchar) |
| <span class="emphasis">*'D' - Deletion conflict resolvers* </span> (\<ALLOLDCOLS\>, inout \_origin varchar)              |

where

\<ALLCOLS\> are new values of all columns including the ROWGUID column,
\<ALLOLDCOLS\> are old values of all columns, and \_origin is
transaction originator.

Conflict resolvers can return the following integer values; The conflict
resolver types concerned for each are listed in parentheses:

<div class="itemizedlist">

- **0 - can't decide (I, U, D) . ** next conflict resolver will be
  fired.

- **1 - subscriber wins (I, U, D) . ** DML operation will be applied
  with \<ALLCOLS\> All the subscribers except originator will receive
  modifications (originator already has them).

- **2 - subscriber wins, change origin (I, U) . ** DML operation will be
  applied with \<ALLCOLS\> and origin of transaction will be changed to
  publisher's server name. All the subscribers (including originator)
  will receive modifications. This return value is useful when conflict
  resolver changed some of the columns of the row that were passed in.
  Although all parameters of conflict resolver are inout only changing
  of \<ALLCOLS\> (non-PK columns) parameters makes sense.

- **3 - publisher wins (U) . ** DML operation will be applied with
  \<ALLCOLS\> taken from publisher's table. All the subscribers will
  receive modifications.

- **4 - reserved . **

- **5 - ignore (D) . ** DML operation is ignored.

</div>

Conflict resolution stops when conflict resolvers return a non-zero
value meaning that it has made a decision.

<div id="ex_conflictreslntrans" class="example">

**Example 13.5. Conflict Resolution**

<div class="example-contents">

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
```

Conflict resolver that will change the price to the minimal value will
look like:

``` programlisting
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
```

</div>

</div>

  

Conflict resolution occurs differently for each kind of DML operation:

<div class="itemizedlist">

- **INSERT . ** When INSERT of some row with primary key \<PK\> is
  replayed, the row in the publisher's table with such \<PK\> is
  looked-up. If the row does not exist then there is no conflict,
  conflict resolution stops and the INSERT is replayed. If the row
  exists then we have a "uniqueness conflict". In this case 'I' conflict
  resolvers are fired-up. If none of the 'I' conflict resolvers were
  able to make a decision (return non-zero value) the default action is
  'publisher wins'.

- **UPDATE . ** When there is an UPDATE of some row with primary key
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

- **DELETE . ** When DELETE of some row with primary key \<PK\> is
  replayed, the row in the publisher's table with such \<PK\> is
  looked-up. If the row does not exist or if the row exists but its
  ROWGUID differs from the one that came from subscriber then we have
  "delete conflict". The 'D' conflict resolvers are fired-up. If none of
  the 'D' conflict resolvers were able to make a decision then the
  default action will be taken to 'ignore'. Otherwise it is assumed that
  there is no conflict and DELETE statement is replayed.

</div>

</div>

<div id="bidirtransreplautoconres" class="section">

<div class="titlepage">

<div>

<div>

#### Automatically Generated Conflict Resolvers

</div>

</div>

</div>

Simple conflict resolvers can be generated automatically. This can be
done by calling REPL_ADD_CR function.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                     |
|:--------------------------:|:--------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                           |
|                            | <a href="fn_repl_add_cr.html" class="link" shape="rect"             
                              title="REPL_ADD_CR"><code class="function">REPL_ADD_CR()</code></a>  |

</div>

</div>

<div id="bidirtransrepllogdata" class="section">

<div class="titlepage">

<div>

<div>

#### Replication Log Data

</div>

</div>

</div>

Replication log data is different for each kind of DML operation:

<div class="itemizedlist">

- **INSERT. ** (stmt, \<ALLCOLS\>)

- **UPDATE. ** (stmt, \<ALLCOLS\>, \<OLDPK\>, \<ALLOLDCOLS\>, ncols)

- **DELETE. ** (stmt, \<OLDPK\>, \<ALLOLDCOLS\>, ncols)

</div>

where

stmt is DML statement (varchar), \<ALLCOLS\> is new values of all
columns, \<OLDPK\> is primary key, specifying a row for which (UPDATE or
DELETE) DML statement is executed, \<ALLOLDCOLS\> is old values of all
columns, ncols is number of columns in table (integer).

The format of the log replication data is the same as in simple
transactional replication with addition of \<ALLOLDCOLS\> and ncols for
logging UPDATE and DELETE statements.

</div>

</div>
