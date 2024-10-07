<div id="replexamples" class="section">

<div class="titlepage">

<div>

<div>

## 13.5. Transactional Replication Example

</div>

</div>

</div>

``` programlisting
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
```

``` programlisting
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
```

``` programlisting
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
```

``` programlisting
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
```

``` programlisting
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
```

``` programlisting
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
```

``` programlisting
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
```

``` programlisting
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
```

``` programlisting
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
```

``` programlisting
-- ================================
-- ON SUBSCRIBER SIDE (named 'rep2')
-- ================================
set DSN=1112;
reconnect;
-- and run check routine till level set to 7
WAIT_FOR_SYNC ('rep1', 'proc', 7);
-- check  local data (should return 128, old 5 + 123 new records)
select count(*) from p_test;
```

<div id="objectsexample" class="section">

<div class="titlepage">

<div>

<div>

### 13.5.1. Transactional Replication Objects Example

</div>

</div>

</div>

Preconditions

|                                                                 |
|-----------------------------------------------------------------|
| publisher named 'rep' with replication address 'localhost:1111' |
| subscriber named 'sub'                                          |
| on subscriber should be defined DSN for rep named '1111'        |

**On publisher side. ** Creating publication

``` programlisting
SQL> REPL_PUBLISH ('pub', 'pub.log');

-- Add row in SYS_REPL_ACCOUNTS table
SQL> select SERVER, ACCOUNT from SYS_REPL_ACCOUNTS
    where ACCOUNT = 'pub';

SERVER ACCOUNT
--------------
rep    pub
```

|                                                                              |
|------------------------------------------------------------------------------|
| started new replication log file in server working directory named 'pub.log' |
| add entry in repl.cfg in server working directory                            |

``` programlisting
SQL> REPL_PUB_ADD ('pub', 'DB.DBA.TEST', 2, 0, null);
```

``` programlisting
SQL> select * from SYS_TP_ITEM;

TI_SERVER TI_ACCT TI_TYPE TI_ITEM     TI_OPTIONS TI_IS_COPY
___________________________________________________________
rep       pub     2       DB.DBA.TEST NULL       0
```

Adding items to the publication

Add row in SYS_TP_ITEM

**On Subscriber Side. ** Adding a new publisher

``` programlisting
SQL> REPL_SERVER ('rep', '1111', 'localhost:1111');

-- Add row in SYS_SERVERS

SQL> select * from SYS_SERVERS;

SERVER                    DB_ADDRESS                REPL_ADDRESS
----------------------------------------------------------------
rep                       1111                      localhost:1111
```

``` programlisting
   SQL> REPL_SUBSCRIBE ('rep', 'pub', 'dav', 'dav_group', 'uid_for_rep', 'uid_pwd_for_rep');
```

|                                                                                                                                |
|--------------------------------------------------------------------------------------------------------------------------------|
| 'publication and subscription servers have identical names.' if subscriber and publisher have the same names.                  |
| 'Publishing server must be declared with REPL_SERVER before subscribing' if publisher 'rep' is not defined from previous step. |
| 'The subscription 'pub' already exist' if on subscriber 'sub' already exists subscription 'pub'                                |
| 'User name and password should be supplied when subscribe to new publisher' if 'uid_for_rep' or 'uid_pwd_for_rep' not supplied |
| 'The table 'DB.DBA.TEST' already exists' if on subscriber 'sub' already exist table in subscription.                           |
| 'The WebDAV collection '/DAV/rep/' already exists' if on 'sub' already exist WebDAV collection in subscription.                |
| a VDB error message if subscriber 'sub' cannot perform attaching TI_ITEM view from publisher 'pub'                             |

``` programlisting
SQL> select * from SYS_TP_ITEM where TI_ACCT = 'pub'

TI_SERVER TI_ACCT TI_TYPE TI_ITEM    TI_OPTIONS TI_IS_COPY TI_DAV_USER TI_DAV_GROUP
____________________________________________________________________________________
rep       pub     2       DB.DBA.TEST NULL       0           dav       dav_group

SQL> select SERVER, ACCOUNT from SYS_REPL_ACCOUNTS where ACCOUNT = 'pub';

SERVER ACCOUNT
--------------
rep    pub
```

Making a subscription

This may signal an SQL error if a precondition is not met.

Add row in SYS_TP_ITEM and row in SYS_REPL_ACCOUNTS

</div>

</div>
