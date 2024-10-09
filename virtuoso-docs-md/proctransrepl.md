<div>

<div>

<div>

<div>

## 13.3. Transactional Replication

</div>

</div>

</div>

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
repl_publish function, where it names the publication and assigns a log
file name for it. The server can then start adding transactions to the
publication, which can happen either under application control or
implicitly.

<div>

|                            |                                                                                       |
|:--------------------------:|:--------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | Tip                                                                                   |
|                            | See the <a href="transreplpublishfunctions.html" class="link"                         
                              title="13.3.3. Publisher Transactional Replication Functions">repl_text</a> function.  |

</div>

To subscribe to publications a server must also have a distinct DBName.
It identifies the publishing server by associating a host name and port
number to its logical name with the repl_server function. It can then
call `repl_subscribe()` . Replication feeds from publisher are replayed
by 'dba' user by default. The default can be changed (see
<a href="fn_repl_subscribe.html" class="link"
title="REPL_SUBSCRIBE">repl_subscribe()</a> function). for each of the
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

``` programlisting
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
```

is used to store information about published accounts and accounts this
server is subscribed to.

A table

``` programlisting
SYS_REPL_SUBSCRIBERS (
    RS_SERVER varchar,
    RS_ACCOUNT varchar,
    RS_SUBSCRIBER varchar not null,

    RS_LEVEL integer NOT NULL,
    RS_VALID integer NOT NULL,

    primary key (RS_SERVER, RS_ACCOUNT, RS_SUBSCRIBER))
```

is used to store subscribers' status (pushback accounts for updateable
subscriptions are there too). Subscribers for an account are added to
this table automatically on each request to sync an account from
subscriber or manually from Admin UI.

SYS_REPL_SUBSCRIBERS.RS_VALID column is be used to designate subscribers
whose replication account level is valid (lags not more than
REPL_MAX_DELTA behind the publisher's level).

RS_VALID state of subscriber is checked and updated on every sync
request from subscriber. If subscriber is found to be invalid all
further sync requests from it are ignored. Such subscriber need to be
reinitialized manually and marked as valid using Admin UI.

<div>

<div>

<div>

<div>

### 13.3.1. Publishable Items

</div>

</div>

</div>

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

</div>

</div>
