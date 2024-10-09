<div>

<div>

<div>

<div>

### 9.33.3. Advertisers and Advertisement Rules

</div>

</div>

</div>

Phrase sets are sufficient for many purposes but advertisement-specific
applications need more built-in functionality for maximum speed. This
functionality can be reused by any application that adds hyperlinks to
texts depending on content of the text.

Consider advertisers that want to show links to their resources near
phrases they choose as relevant, and one phrase can be chosen by many
advertisers. To make the processing easier, there exists special support
for phrase sets that store lists of links for phrases.

An advertiser is some very abstract "source" of annotation phrases. The
exact nature of an advertiser is application-specific, but each
advertiser has an identifiable account. All accounts are in one table:

``` programlisting
create table DB.DBA.SYS_ANN_AD_ACCOUNT (
  AAA_ID integer not null primary key,
  AAA_NAME varchar(255) unique,     -- unique name for use in API/UI
  AAA_OWNER_UID integer,        -- references SYS_USERS (U_ID), NULL if the record writable for any reader
  AAA_READER_GID integer,       -- references SYS_USERS (U_ID), NULL if the record is readable for public
  AAA_DETAILS long xml,         -- any details, e.g., in RDF
  AAA_APP_ENV any
  )
;
```

Advertisement links are stored in a separate table:

``` programlisting
create table DB.DBA.SYS_ANN_LINK (
  AL_ID integer primary key,
  AL_OWNER_UID integer,         -- references SYS_USERS (U_ID), NULL if the record writable for any reader; always readable for public
  AL_URI varchar,           -- URI template for A HREF
  AL_TEXT varchar,          -- text template for body of <A>
  AL_NOTE varchar,          -- text after the link (or around it)
  AL_TAGS any,              -- tags to add or remove
  AL_CALLBACK varchar,
  AL_APP_ENV any
  )
;
```

Advertisers, links and phrases are linked together by advertisement
rules. Each rule says that if a given phrase is found in some text then
a given link should be shown and a specified advertiser's account should
be charged.

``` programlisting
create table DB.DBA.SYS_ANN_AD_RULE (
  AAR_AAA_ID integer not null,      -- advertiser who pays for the ad
  AAR_APS_ID integer not null,      -- phrase set
  AAR_AP_CHKSUM integer not null,   -- phrase check-sum
  AAR_TEXT varchar not null,        -- original text
  AAR_AL_ID integer not null,       -- references SYS_ANN_LINK (AL_ID)
  AAR_APP_ENV any,
  primary key (AAR_AAA_ID, AAR_APS_ID, AAR_AP_CHKSUM, AAR_TEXT, AAR_AL_ID)
  )
;
```

When an annotation phrase is stored in its phrase set via advertisement
API, its application-specific data is always a vector, and vector's
length is divisible by three. When a new ad rule is added to the vector,
it gets three new items: value of AL_ID of a link, value of advertiser's
AAA_ID and AAR_APP_ENV of the ad rule.

Anyone can describe a link but can not edit other's descriptions:

``` programlisting
create function DB.DBA.ANN_LINK_ADD (
  in _owner_uid integer,
  in _uri varchar,      -- value for AL_URI
  in _text varchar,     -- value for AL_TEXT
  in _note varchar,     -- value for AL_NOTE
  in _tags any,         -- value for AL_TAGS
  in _callback varchar,
  in _app_env any) returns integer
```

So one user may create links in favor of other user even without
permission, but can not edit other's links. To edit or delete, one
should be an owner and pass authentication:

``` programlisting
create function DB.DBA.ANN_LINK_MODIFY (
  in _id integer,
  in _owner_uid integer,
  in _uri varchar,
  in _text varchar,
  in _note varchar,
  in _tags any,
  in _callback varchar,
  in _app_env any,
  in auth_uname varchar,
  in auth_pwd varchar) returns integer

create function DB.DBA.ANN_LINK_DEL (
  in _id integer,
  in auth_uname varchar,
  in auth_pwd varchar) returns integer
```

A link can not be dropped even by its owner if it is used by some
advertiser.

``` programlisting
create function DB.DBA.ANN_AD_RULE_ADD (
  in aaa_name varchar,      -- Advertiser's name (or its integer AAA_ID key), to store as AAR_AAA_ID
  in aps_name varchar,      -- Name of a phrase set (or its integer APS_ID key), to store as AAR_APS_ID
  in _text varchar,     -- Text of the phrase, will be stored as AAR_TEXT and duplicated in an AP_TEXT if the phrase is new
  in _al_id integer,        -- ID of a link (AL_ID in DB.DBA.SYS_ANN_LINK), to store as AAR_AL_ID
  in _app_env any,      -- Application-specific data, will be stored in AAR_APP_ENV and become a part of AP_LINK_DATA of the phrase
  in _lang_name varchar,    -- Language name, for verification only; an error will be signalled if the value of argument is not equal to language name of the phrase set
  in auth_uname varchar,
  in auth_pwd varchar) returns integer
```

Application-specific data should be short, because for any given phrase,
sum of data from all advertisers should not exceed 2 kilobytes.
Fortunately, most of needed data are in DB.DBA.SYS_ANN_LINK row already
so AAR_APP_ENV is frequently a NULL.

``` programlisting
create function DB.DBA.ANN_AD_RULE_DEL (
  in aaa_name varchar,
  in aps_name varchar,
  in _text varchar,
  in _al_id integer,
  in _lang_name varchar,
  in auth_uname varchar,
  in auth_pwd varchar) returns integer
```

If a phrase set is edited by DB.DBA.ANN_AD_RULE_ADD /
DB.DBA.ANN_AD_RULE_DEL and by ap_add_phrases() then errors are almost
guaranteed (and not detected or recovered automatically in current
version). The function ap_build_match_list() works fine with mix of
phrase sets managed by both methods because it is not sensitive to the
format of data in phrases.

</div>
