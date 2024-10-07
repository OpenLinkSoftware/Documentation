<div id="syncmlschema" class="section">

<div class="titlepage">

<div>

<div>

### 23.6.13. SyncML Schema Objects

</div>

</div>

</div>

<div id="smlsdevices" class="section">

<div class="titlepage">

<div>

<div>

#### SyncML Devices

</div>

</div>

</div>

``` programlisting
create table SYNC_DEVICES (
  DEV_ID integer identity,
  DEV_USER_ID integer,   -- references WS.WS.SYS_DAV_USER(U_ID)
  DEV_URI varchar,
  DEV_MAN varchar,       -- manufacturer
  DEV_MOD varchar,       -- model
  DEV_OEM varchar,       -- OEM
  DEV_FWV varchar,       -- firmware version
  DEV_SWV varchar,       -- software version
  DEV_HWV varchar,       -- hardware version
  DEV_DEVID varchar,     -- device id ; must be unique
  DEV_DEVTYP varchar,    -- device type
  DEV_UTC integer,       -- requires datetime in UTC
  DEV_SUPP_LOB integer,  -- supports large objects
  DEV_SUPP_NOC integer,  -- supports "number of changes"
  primary key (DEV_URI)  -- constraint foobar unique(DEV_USER_ID, DEV_URI)
)
;
```

</div>

<div id="smlsmaps" class="section">

<div class="titlepage">

<div>

<div>

#### SyncML Maps

</div>

</div>

</div>

``` programlisting
create table SYNC_MAPS (
  MAP_DEV_ID integer, -- references SYNC_DEVICES(DEV_ID)
  MAP_COL_ID int,     -- references WS.WS.SYS_DAV_COL (COL_ID)
  MAP_LUID varchar,   -- local id (from client's view)
  MAP_GUID varchar,   -- references WS.WS.SYS_DAV_RES (RES_ID)
  primary key (MAP_DEV_ID, MAP_LUID, MAP_GUID)
)
;
```

</div>

<div id="smlssyncanchors" class="section">

<div class="titlepage">

<div>

<div>

#### SyncML Sync Anchors

</div>

</div>

</div>

``` programlisting
create table SYNC_ANCHORS (
  A_COL_ID integer,   -- references WS.WS.SYS_DAV_COL(COL_ID)
  A_DEV_ID integer,   -- references SYNC_DEVICES(DEV_ID)
  A_LAST_LOCAL datetime,    -- last local anchor
  A_LAST_REMOTE varchar,    -- last remote anchor
  A_NEXT_LOCAL datetime,    -- last local anchor
  A_NEXT_REMOTE varchar,    -- last remote anchor
  primary key (A_COL_ID, A_DEV_ID)
)
;
```

</div>

<div id="smlssynclog" class="section">

<div class="titlepage">

<div>

<div>

#### SyncML Sync Log

</div>

</div>

</div>

``` programlisting
create table SYNC_RPLOG (
  RLOG_RES_ID int,  -- references WS.WS.SYS_DAV_RES (RES_ID)
  RLOG_RES_COL int, -- references WS.WS.SYS_DAV_COL (COL_ID)
  DMLTYPE varchar,  -- IUD - insert/update/delete
  SNAPTIME datetime,    -- timestamp
  primary key (RLOG_RES_ID)
)
;
```

</div>

<div id="smlsdevicesessions" class="section">

<div class="titlepage">

<div>

<div>

#### SyncML Device's Sessions

</div>

</div>

</div>

``` programlisting
create table SYNC_SESSION
    (
    S_ID varchar,   -- session ID (unique per device)
    S_DEV varchar,  -- device URI
    S_DEV_ID int,   -- references SYNC_DEVICES(DEV_ID)
    S_UID int,  -- user ID SYS_USERS.U_ID
    S_LAST_MSG int, -- last massage no
    S_LAST_CMD int, -- last command no
    S_DATA long varbinary,  -- internal use
    S_TS timestamp,     -- last used
    S_AUTH int default 0,   -- authenticated for this session
    S_NONCE varchar default '', -- nonce value
    S_INIT int default 1,       -- init state flag
    primary key (S_ID, S_DEV)
    )
;
```

</div>

</div>
