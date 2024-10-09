<div>

<div>

<div>

<div>

### 20.5.3. Tables and Procedures Created By Text Triggers

</div>

</div>

</div>

``` programlisting
        - [TARGET_TABLE_NAME]_[DATA_COLUMN_NAME]_HIT

      columns

      TTH_D_ID         INTEGER   - document ID, references unique id of [TARGET_TABLE]
      TTH_T_ID         INTEGER   - query ID, references QUERY table
      TTH_U_ID         INTEGER   - user ID, references USER table
      TTH_TS           TIMESTAMP - date and time of retrieval
      TTH_NOTIFY       VARCHAR   - e-mail address of user for notification
      TTH_TITLE        VARCHAR   - not used (can be filled with user-defined trigger)
      TTH_URL          VARCHAR   - not used (can be filled with user-defined trigger)

        - [TARGET_TABLE_NAME]_[DATA_COLUMN_NAME]_QUERY

      columns

      TT_ID            INTEGER   - Unique ID of query
      TT_QUERY         VARCHAR   - query text
      TT_WORD          VARCHAR   - the best word for query
      TT_COMMENT       VARCHAR   - Description
      TT_CD            VARCHAR   - user data (not used)
      TT_PREDICATE     VARCHAR   - not used
      TT_XPATH         VARCHAR   - XPATH expression.  If specified,
                        the test is this XPATH predicate,
                        see separate section.

        - [TARGET_TABLE_NAME]_[DATA_COLUMN_NAME]_USER

      columns

      TTU_U_ID         INTEGER - unique user ID can reference SYS_USERS.
      TTU_T_ID         INTEGER - query ID, references QUERY table
      TTU_COMMENT      VARCHAR - Description
      TTU_NOTIFY       VARCHAR - e-mail address of user for notification
```

Note that the queries are available given a table wide query identifier
and an 'entry point' word. Such a word is a word that must occur in the
document in order for the query to have a possibility of matching the
document, The query text and other attributes are denormalized so that
the primary key is the word, id pair when the id itself is unique. Note
that in the case of an AND of words, the least frequent of the words
will be used as unique entry point of the query, so that it will not be
tried on documents that do not contain this word. However, a query with
OR'ed terms may have several such words, hence the possibility of
multiple rows in the query table for the same query.

The TT_USER\_\<xx\> table maps from the query to a user. The idea of
this is to allow a single query to have multiple users. Consider an
application which allows creating personalized information filtering
profiles. It is to be expected that multiple users would store the same
profiles. Therefore the link between the user and the query is entitized
as this table. The user specific comment and notification mode are thus
stored here, not with the query. The notification mode itself is
application dependent. The user id is an application dependent id that
can be used to reference application user entities. Some applications
may use this whereas other applications will have all queries on a
single user.

When a hit is noticed an entry is made into the TT_HIT\_\<xx\> table.
One row is inserted for each unique document id, query id, user id
combination for which the document matches the query and there is a link
to a user from the query through TT_USER\_\<xx\>. A query with no row in
TT_USEER\_\<xx\> is an integrity error. The number of times the pattern
is found in each document or its free text hit score has no effect on
the hit insertion.

One may note that defining application specific triggers on the hit
table can be used to add immediate application reactions to incoming
data.

The free text triggers are matched against the new content immediately
before the content is inserted into the free text index. Therefore the
batch mode setting affects the time of matching. In all situations, the
matching takes place after the data is inserted but before the free text
index is updated. If text index maintenance is in synchronous
(non-batched) mode, the text trigger match and hit generation is in the
same transaction as the update to the content being watched.

<div>

<div>

<div>

<div>

#### Procedures

</div>

</div>

</div>

For queries definition

``` programlisting
tt_query_[TARGET_TABLE_NAME] (
        in [query text] varchar,        - query expression
        in [user_id] integer,       - user id references SYS_USERS or SYS_DAV_USER
        in [comment] varchar,       - description
        in [e-mail or empty] varchar)   - e-mail address for user notification
```

or hits registration (used inside text index procedures)

``` programlisting
vt_hits_[TARGET_TABLE_NAME] (inout [batch] any, inout [words array] any)
```

</div>

<div>

<div>

<div>

<div>

#### Triggers

</div>

</div>

</div>

for hits removal after document delete occurred

``` programlisting
[TARGET_TABLE_NAME]_FTT_D
```

</div>

<div>

<div>

<div>

<div>

#### Examples

</div>

</div>

</div>

``` programlisting
-- create a table
create table T1 (id integer, dt varchar, primary key (id));

-- define text index
create text index on T1 (dt);

-- create text trigger
create text trigger on T1;

-- define an query
tt_query_T1 ('xyz and abc', 1, 'This is a test query', null);

-- do some inserts
insert into T1 (id, dt) values (1, 'xyz');
insert into T1 (id, dt) values (2, 'xyz abc');
insert into T1 (id, dt) values (3, 'abc');
update T1 set dt = 'xyz qwe abc' where id = 2;

select TTH_TS, dt from T1, T1_dt_HIT where id = TTH_D_ID order by TTH_TS desc;
-- produces following
TTH_TS      dt
BINARY      VARCHAR
_______________________________________________________________________________

2000-10-24 18:25:53  xyz qwe abc
2000-10-24 18:25:53  xyz qwe abc
```

</div>

</div>
