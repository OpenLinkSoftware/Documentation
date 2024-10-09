<div>

<div>

<div>

<div>

### 20.4.2. Created Database Objects

</div>

</div>

</div>

Text trigger hits table. Text trigger stores hits on documents matching
a condition within this table.

``` programlisting
<table_name>_<data_column>_HIT (
  TTH_U_ID INTEGER,   -- references User table TTU_U_ID
  TTH_D_ID ANY,       -- references matching document id
  TTH_T_ID INTEGER,   -- references matching query TT_ID
  TTH_TITLE VARCHAR,  -- user application specific
  TTH_URL VARCHAR,    -- user application specific
  TTH_TS TIMESTAMP,   -- time of registering a hit
  TTH_NOTIFY VARCHAR, -- e-mail address for notification
  PRIMARY KEY (TTH_U_ID, TTH_TS, TTH_D_ID, TTH_T_ID)
)
```

Text trigger queries table, where the query definition procedure stores
the user specific queries.

``` programlisting
<table_name>_<data_column>_QUERY (
  TT_WORD VARCHAR,  -- the most effective word for searching
  TT_ID INTEGER,    -- id of query
  TT_QUERY VARCHAR, -- text of the query, in case of XPATH query this
                -- column contains a serialized value
  TT_CD VARCHAR,    -- user data
  TT_COMMENT VARCHAR, -- Human readable label with general purpose
  TT_XPATH VARCHAR,   -- text of XPATH query
  TT_PREDICATE VARCHAR, -- Virtuoso/PL function hook
  PRIMARY KEY (TT_WORD, TT_ID)
)
```

One query can add one or more rows to the queries table.

Text trigger users table, in it query definition procedure add a
reference between query and user.

``` programlisting
<table_name>_<data_column>_USER (
  TTU_T_ID INTEGER, -- references text query TT_ID
  TTU_U_ID INTEGER, -- references application specific users table ID
  TTU_NOTIFY VARCHAR, -- e-mail address list for notification
  TTU_COMMENT VARCHAR, -- Human readable label of query definition.
  PRIMARY KEY (TTU_T_ID, TTU_U_ID)
)
```

<div>

|                              |                                                                                                                                                               |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                         |
|                              | In the case of e-mail notification to the main addresses the string passed as address list must be in the following format: '\<u1@foo.com\>, \<u2@foo.bar\>'. |

</div>

Procedures that are used for adding text queries.

``` programlisting
TT_QUERY_<table_name> (in query_text varchar, in user_id integer,
  in label varchar, in notification_address varchar)
```

Used for adding XPATH queries.

``` programlisting
TT_XPATH_QUERY_<table_name> (in xpath_query_text varchar , in user_id integer,
in label varchar, in notification_address varchar)
```

Used to send notifications to the users. This procedure is usually
called by the server event scheduler.

``` programlisting
TT_NOTIFY_<table_name> ();
```

</div>
