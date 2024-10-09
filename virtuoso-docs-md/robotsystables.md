<div>

<div>

<div>

<div>

### 23.6.7. Web Robot System Tables

</div>

</div>

</div>

**Target sites table. **

``` programlisting
create table WS.WS.VFS_SITE (
  VS_DESCR   varchar,   -- Human readable description
  VS_HOST    varchar,   -- target hostname (eq. www.foo.com)
  VS_URL     varchar,   -- target path (eq. /cgi-bin/ or /)
  VS_INX     char(5),   -- not used
  VS_OWN     integer,   -- ID of the local WebDAV owner
  VS_ROOT    varchar,   -- target WebDAV collection
  VS_NEWER   datetime,  -- Update the link if newer than
  VS_DEL     char(3),   -- Delete local copy if delete on remote detected flag
  VS_FOLLOW  varchar,   -- follow list (list of masks to allow following the links)
  VS_NFOLLOW varchar,   -- the do not follow list
  VS_SRC     char(3),   -- do get of the images - flag
  VS_OPTIONS varchar,   -- username/password credentials for
                        --  authorization on target site
  VS_METHOD  varchar,   -- use HTTP or HTTP/WebDAV to retrieve the target site
  VS_OTHER   char(10),  -- go to other sites flag
  primary key (VS_HOST, VS_ROOT)
)
;
```

**The queues table. **

``` programlisting
create table WS.WS.VFS_QUEUE (
  VQ_HOST    varchar,  -- target host
  VQ_TS      datetime, -- when added to the queue
  VQ_URL     varchar,  -- path on target
  VQ_ROOT    varchar,  -- the WebDAV local collection
  VQ_STAT    char (15),-- status of the entry
  VQ_OTHER   varchar,  -- flag for other site generated link
  primary key (VQ_HOST, VQ_URL, VQ_ROOT)
)
;
```

**The retrieved URLs table. **

``` programlisting
create table WS.WS.VFS_URL (
  VU_HOST     varchar,  -- target host
  VU_URL      varchar,  -- path on target
  VU_ROOT     varchar,  -- the local WebDAV collection containing
                        -- content of the retrieved link
  VU_CHKSUM   varchar,  -- checksum
  VU_ETAG     varchar,  -- Etag from target
  VU_CPTIME   datetime, -- when is copied
  VU_OTHER    varchar,  -- is the link retrieved from foreign site
  primary key (VU_HOST, VU_URL, VU_ROOT)
)
;
```

</div>
