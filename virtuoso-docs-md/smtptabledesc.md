<div id="smtptabledesc" class="section">

<div class="titlepage">

<div>

<div>

### 23.6.9. Mail Table Description

</div>

</div>

</div>

``` programlisting
- - Message queue
create table MAIL_MESSAGE_QUEUE (
    MQ_ID       varchar,    - - FK MAIL_MESSAGE (MM_ID)
    MQ_RECIEVER     varchar,    - - foreign mail exchanger
    primary key (MQ_ID))
;

create index MAIL_MSG_Q_REC on MAIL_MESSAGE_QUEUE (MQ_RECIEVER)
;

-- Mail Table
create table DB.DBA.MAIL_MESSAGE (
    MM_ID       integer,        -- Unique id of message (per user)
    MM_OWN  varchar (128),  -- Local WebDAV account (recipient, mail box owner) name,
                    FK references WS.WS.SYS_DAV_USER (U_NAME)
    MM_FLD  varchar (128), -- Message Folder (initial 'Inbox')
    MM_FROM varchar (512),      -- From: RFC822 header field
    MM_TO       varchar (512),      -- To: RFC822 header field
    MM_CC       varchar (512),      -- Cc: RFC822 header field
    MM_BCC  varchar (512),  -- Bcc: RFC822 header field
    MM_SUBJ varchar (512),  -- Subject of the message
    MM_REC_DATE varchar (50),   -- Date of arrival
    MM_SND_TIME varchar (50),   -- Date of posting
    MM_IS_READED    integer,        -- Read flag (0/1 not read, 1 - read)
    MM_BODY long varchar,   -- Message content (including message header)
    primary key (MM_OWN, MM_FLD, MM_ID)
)
;
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                              |
|:----------------------------:|:-----------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                        |
|                              | MM_FROM, MM_TO, MM_CC, MM_BCC, MM_SUBJ, MM_SND_TIME exists only if there exists corresponding RFC822 headers in mail message |

</div>

``` programlisting
-- Temporary message MIME parts table (for message composition)
create table DB.DBA.MAIL_PARTS (
    MP_ID   integer,        -- Unique id per user (order of parts)
    MP_PART     long varbinary, -- Message MIME part body
    MP_ATTRS    long varbinary, -- Message MIME part attributes
    MP_OWN  varchar (128),  -- WebDAV user name - FK REFERENCES WS.WS.SYS_DAV_USER (U_NAME)
    primary key (MP_OWN, MP_ID)
)
;

- - Local mail users
(this table will be needed only in case of different DB, DAV and MAIL users)
create table MAIL_USERS (
    MU_NAME varchar,
    MU_PWD  varchar,
    primary key (MU_NAME))
;

- - Allowed relay domains
(only in case of allowed relaying)
create table MAIL_RELAY (
    MR_ALLOWED  varchar;
    primary key (MR_ALLOWED))
;
```

</div>
