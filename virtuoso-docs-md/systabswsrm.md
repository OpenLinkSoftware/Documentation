<div>

<div>

<div>

<div>

### 23.6.11. WS Reliable Messaging

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Receiver-Side Schema Objects

</div>

</div>

</div>

Incoming messages table used to keep successfully received messages. An
application on receiver side can access it in order to process the
messages.

``` programlisting
CREATE TABLE SYS_WSRM_IN_MESSAGE_LOG (
  IML_INDENTIFIER varchar,             -- references SYS_WSRM_IN_SEQUENCES.WIS_IDENTIFIER
  IML_MESSAGE_ID int NOT NULL,         -- unique per sequence
  IML_EXPIRE_DATE datetime,            -- when expires
  IML_RECEIVE_DATE timestamp NOT NULL ,
  IML_MESSAGE long varchar NOT NULL,   -- the message itself
  IML_STATE int,
  primary key (IML_INDENTIFIER, IML_MESSAGE_ID)
)
;
```

Incoming sequences table; used to keep the successfully established
message sequence and policy to be applied to it.

``` programlisting
CREATE TABLE SYS_WSRM_IN_SEQUENCES
    (
  WIS_IDENTIFIER varchar, -- sequence identifier
  WIS_VERSION varchar,
  WIS_DELIVERY_ASSURANCE varchar,
  WIS_SEQUENCE_EXPIRATION datetime,
  WIS_INACTIVITY_TIMEOUT integer,
  WIS_RETRANSMISSION_INTERVAL integer,
  WIS_ACKNOWLEDGEMENT_INTERVAL integer,
  primary key (WIS_IDENTIFIER)
)
;
```

</div>

<div>

<div>

<div>

<div>

#### Sender's Schema Objects

</div>

</div>

</div>

Outgoing messages log table is used to keep the outgoing messages, to
track their state. It also keeps parameter to the soap request in order
to re-send if are not already accepted.

``` programlisting
CREATE TABLE SYS_WSRM_OUT_MESSAGE_LOG (
  OML_INDENTIFIER varchar,          -- references SYS_WSRM_OUT_SEQUENCES.WOS_IDENTIFIER
  OML_MESSAGE_ID int NOT NULL,      -- unique per sequence
  OML_EXPIRE_DATE datetime,         -- when expires
  OML_SEND_DATE timestamp NOT NULL, -- when is sent
  OML_MESSAGE long varchar NOT NULL,-- soap call parameters
  OML_STATE int,
  primary key (OML_INDENTIFIER, OML_MESSAGE_ID)
)
;
```

Outgoing sequences table is used to keep parameters for outgoing message
sequences. It's used to persist their state.

``` programlisting
CREATE TABLE SYS_WSRM_OUT_SEQUENCES (
  WOS_IDENTIFIER varchar,           -- sequence identifier
  WOS_VERSION varchar,
  WOS_DELIVERY_ASSURANCE varchar,
  WOS_SEQUENCE_EXPIRATION datetime,
  WOS_INACTIVITY_TIMEOUT integer,
  WOS_RETRANSMISSION_INTERVAL integer,
  WOS_ACKNOWLEDGEMENT_INTERVAL integer,
  primary key (WOS_IDENTIFIER)
)
;
```

</div>

</div>
