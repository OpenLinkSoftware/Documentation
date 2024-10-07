<div id="newssrvtables" class="section">

<div class="titlepage">

<div>

<div>

### 23.6.10. NNTP Server Tables

</div>

</div>

</div>

The server uses the following tables:

``` programlisting
create table NEWS_MESSAGES (
  NM_ID         varchar (128) not null, -- Message-ID (unique)
  NM_REF        varchar (128),          -- References
  NM_GROUP      varchar (128) not null, -- Newsgroups ID
  NM_NUM_GROUP  integer not null,       -- ID unique for group
  NM_READED     integer,                -- How many times this message is read
  NM_OWN        varchar (128),          -- Local sender (if sender is non
                                           local should be null)
  NM_REC_DATE   datetime,               -- Receiving date
  NM_STAT       integer,                -- Post from the local user
  NM_HEAD       long varchar,           -- Message header
  NM_BODY       long varchar,           -- Message content
  primary key (NM_ID))
```

``` programlisting
create table NEWS_GROUPS (
  NG_GROUP      integer identity,  -- Newsgroups ID
  NG_NAME       varchar (128) NOT NULL, -- Local name
  NG_DESC       varchar (128), -- Comment
  NG_SERVER     varchar (128), -- Server
  NG_SERV_PORT  integer,       -- Server port
  NG_OUT_GROUP  varchar (128), -- Out name
  NG_POST       integer,       -- Flag 0/1 posting allowed
  NG_UP_TIME    datetime,      -- Last Update
  NG_CREAT      datetime,      -- When group is created (attached)
  NG_UP_INT     integer,       -- Update interval (min)
  NG_CLEAR_INT  integer,       -- Drop interval for messages
  NG_LIFE_READ  integer,       -- Flag 0/1 read messages exist longer
  NG_STAT       integer,       -- Flag 0/3 Result from last update.
              0 - Unsuccessful
              1 - Successful
              3 - Successful  but does not get all available messages.

  NG_AUTO       integer,       -- Flag 0/1 Auto download.
  NG_PASS       integer,       -- Download messages for one pass.
  NG_UP_MESS    integer,       -- Messages from last update.
  NG_NUM        integer,       -- Estimated number of articles in group
  NG_FIRST      integer,       -- First article number in the group
  NG_LAST       integer,       -- Last article number in the group

  primary key (NG_GROUP))
```

``` programlisting
create table NEWS_ACL (
  NA_GROUP  integer not NULL, -- News Group number, referencing
                                 NEWS_GROUPS (NG_GROUP)
  NA_IP     varchar not NULL, -- Client IP (the mask is %)
  NA_A_D    integer not NULL, -- flag  0 - allow, 1 - deny (action)
  NA_RW     integer not NULL, -- flag  0 - read,  1 - post (reading
                              or posting action is allowed/disallowed)
  PRIMARY KEY (NA_GROUP, NA_IP, NA_A_D, NA_RW));
```

</div>
