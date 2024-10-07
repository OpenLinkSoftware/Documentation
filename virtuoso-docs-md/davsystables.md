<div id="davsystables" class="section">

<div class="titlepage">

<div>

<div>

### 23.6.8. Web Server & DAV System Tables

</div>

</div>

</div>

All Web Server and DAV related tables and procedures are held in the WS
catalogue. This reference section illustrates their structure.

<div id="davcollections" class="section">

<div class="titlepage">

<div>

<div>

#### Collections (folders)

</div>

</div>

</div>

``` programlisting
create table WS.WS.SYS_DAV_COL (
  COL_ID    integer,  -- unique collection id
  COL_NAME  char(256),-- collection name
  COL_OWNER     integer,  -- collection owner id (FK SYS_DAV_USER (U_ID))
  COL_GROUP     integer,  -- collection owner group id (FK SYS_DAV_GROUP (G_ID))
  COL_PARENT    integer,  -- parent collection id (FK SYS_DAV_COL (COL_ID))
  COL_CR_TIME   datetime, -- creation time
  COL_MOD_TIME  datetime, -- modification time
  COL_PERMS     char(9),  -- collection access permissions (like UNIX ugo style)
  primary key (COL_NAME, COL_PARENT)
)
;
```

</div>

<div id="davgroups" class="section">

<div class="titlepage">

<div>

<div>

#### Groups

</div>

</div>

</div>

</div>

<div id="davlocks" class="section">

<div class="titlepage">

<div>

<div>

#### Locks

</div>

</div>

</div>

``` programlisting
create table WS.WS.SYS_DAV_LOCK (
  LOCK_TYPE     char (1),     -- type of the lock (R (read) or W (write))
  LOCK_SCOPE    char (1),     -- lock scope (X (exclusive) or S (shared))
  LOCK_TOKEN    char(256),    -- unique lock token
  LOCK_PARENT_TYPE  char (1), -- lock parent type (R (resource), C (collection))
  LOCK_PARENT_ID  integer,    -- lock parent (resource/collection)
                              -- id (FK SYS_DAV_COL (COL_ID) or SYS_DAV_RES (RES_ID))
  LOCK_TIME     datetime,     -- lock creation time
  LOCK_TIMEOUT  integer,      -- lock time-out
  LOCK_OWNER    integer,      -- lock owner id (FK SYS_DAV_USER (U_ID))
  LOCK_OWNER_INFO varchar,    -- lock owner info (if WebDAV client sent
                              -- additional info eq. e-mail etc.)
  primary key (LOCK_PARENT_TYPE, LOCK_PARENT_ID)
)
;
```

</div>

<div id="davproperties" class="section">

<div class="titlepage">

<div>

<div>

#### Properties

</div>

</div>

</div>

``` programlisting
create table WS.WS.SYS_DAV_PROP (
  PROP_ID      integer,   -- unique property id
  PROP_NAME    char(256), -- property name
  PROP_TYPE    char (1),  -- property parent type (R (resource), C (collection))
  PROP_PARENT_ID integer, -- parent resource/collection id (FK SYS_DAV_COL (COL_ID)
                          -- or SYS_DAV_RES (RES_ID))
  PROP_VALUE   varchar,   -- value of the property (plain text or serialized XML entity)
  primary key (PROP_NAME, PROP_TYPE, PROP_PARENT_ID)
)
;
```

</div>

<div id="davresources" class="section">

<div class="titlepage">

<div>

<div>

#### Resources (documents)

</div>

</div>

</div>

``` programlisting
create table WS.WS.SYS_DAV_RES (
  RES_ID        integer,    -- unique resource id
  RES_NAME  char(256),-- resource name
  RES_OWNER     integer,    -- resource owner id (FK SYS_DAV_USER (U_ID))
  RES_GROUP     integer,    -- resource owner group id (FK SYS_DAV_GROUP (G_ID))
  RES_COL   integer,    -- parent collection id (FK SYS_DAV_COL (COL_ID))
  RES_CONTENT   long varchar IDENTIFIED BY RES_FULL_PATH,
            -- resource content
  RES_TYPE  varchar,    -- resource MIME type (eq. text/plain etc.)
  RES_CR_TIME   datetime,   -- creation time
  RES_MOD_TIME  datetime,   -- modification time
  RES_PERMS     char (9),   -- resource access permissions (like UNIX ugo style)
  RES_FULL_PATH     varchar,    -- resource full path (eq. /DAV/docs/name.txt)
  primary key (RES_COL, RES_NAME)
)
;
```

</div>

<div id="davrestypes" class="section">

<div class="titlepage">

<div>

<div>

#### Resource Types (MIME types)

</div>

</div>

</div>

``` programlisting
create table WS.WS.SYS_DAV_RES_TYPES (
  T_EXT     varchar,    -- extension
  T_TYPE        varchar,    -- associated MIME type
  T_DESCRIPTION varchar,    -- optional description
  primary key (T_EXT)
)
;
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                            |
|:----------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                      |
|                              | The Resource Types table is also used by the HTTP server for determining the appropriate 'Content-Type' header for any deliverable, either from WebDAV or the file system. |

</div>

</div>

<div id="davhttppath" class="section">

<div class="titlepage">

<div>

<div>

#### HTTP Virtual Directory Mappings

</div>

</div>

</div>

``` programlisting
create table DB.DBA.HTTP_PATH (
  HP_HOST             varchar not null, -- mapping Host in HTTP header note: *ini*
  HP_LISTEN_HOST      varchar not null, -- IP address & port for
                                        -- mapping listening session
  HP_LPATH            varchar not null, -- logical path
  HP_PPATH            varchar not null, -- physical path
  HP_STORE_AS_DAV     integer not null, -- flag for webDAV storage
  HP_DIR_BROWSEABLE   integer not null, -- directory listing allowed
  HP_DEFAULT          varchar,  -- default page
  HP_SECURITY         varchar,  -- which method allowed all/https/digest (NULL/SSL/DIGEST)
  HP_REALM            varchar,  -- authentication realm
  HP_AUTH_FUNC        varchar,  -- which function authenticate this directory
  HP_POSTPROCESS_FUNC varchar,  -- function call after request
  HP_RUN_VSP_AS       varchar,  -- uid for VSPs REFERENCES SYS_USERS (U_NAME)
                                --   ON DELETE SET NULL
  HP_RUN_SOAP_AS      varchar,  -- uid for SOAP REFERENCES SYS_USERS (U_NAME)
                                --   ON DELETE SET NULL
  HP_PERSIST_SES_VARS integer,  -- have a persistent session variables
  HP_SOAP_OPTIONS     varchar,  -- SOAP options
  HP_AUTH_OPTIONS     varchar,  -- options for authentication hook function
  primary key (HP_LISTEN_HOST, HP_HOST, HP_LPATH)
)
;
```

</div>

<div id="tables.db.dba.http_acl" class="section">

<div class="titlepage">

<div>

<div>

#### HTTP Access Control List

</div>

</div>

</div>

``` programlisting
create table HTTP_ACL (
HA_LIST     varchar not null,       -- ACL name
HA_ORDER    integer not null,       -- Position  in the list
HA_OBJECT   integer not NULL default -1,    -- Object ID (applicable to news groups also)
HA_CLIENT_IP    varchar not NULL,       -- *PATTERN*
HA_FLAG     integer not NULL default 1, -- Allow/Deny flag, 0 - allow, 1 - deny
HA_RW       integer default 0,      -- Read/Write flag, 0 - read,  1 - post
HA_DEST_IP  varchar default '*',        -- Destination IP/Host (applicable to the proxy also)
PRIMARY KEY (HA_LIST, HA_ORDER, HA_CLIENT_IP, HA_FLAG)
);
```

</div>

</div>
