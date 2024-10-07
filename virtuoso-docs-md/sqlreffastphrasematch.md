<div id="sqlreffastphrasematch" class="section">

<div class="titlepage">

<div>

<div>

## 9.33. Fast Phrase Match Processor

</div>

</div>

</div>

An "annotation phrase" is a keyword or key phrase associated with some
application specific data and a uniform "annotation phrase set" may map
dictionary words to their descriptions or ICAO codes to airport names
and co-ordinates or geographical names to maps or Wikipedia topics to
links to Wikipedia pages. An application may need to scan a given text
and find all occurrences of phrases from given phrase set, for various
purposes, e.g., to improve the resource with additional hyperlinks, to
replace technical codes with user-friendly names, or to suggest
appropriate tags and keywords. Virtuoso has built-in phrase match
processor that is fast enough to deal with long documents and big phrase
sets in interactive applications.

<div id="sqlreffastphrasematchscl" class="section">

<div class="titlepage">

<div>

<div>

### 9.33.1. Phrases, Phrase Sets and Phrase Classes

</div>

</div>

</div>

An annotation phrase is a pair of a key (a string that is supposed to be
a word or phrase of some natural language) and a value (of any type if
its serialization is shorter than 2 kilobytes or a string shorter than
10 megabytes). The key phrase will be divided into words and normalized
by language-specific functions used by free text search; after
normalization it should contain from one to four words. The associated
value may be very long in principle, but it will add noticeable
overheads related to memory allocation and copying so it is recommended
to keep it short if performance is somehow important. It is usual to
make the value as short as an ID in some external "detailed" table, not
only for speed but to support multiple synonyms for one thing or names
of a thing in different languages.

Annotation phrases are grouped in "phrase sets" and every "phrase set"
belongs to some "phrase class".

Phrase classes are enumerated in a DB.DBA.SYS_ANN_PHRASE_CLASS table.

``` programlisting
create table DB.DBA.SYS_ANN_PHRASE_CLASS
(
  APC_ID integer not null primary key,
  APC_NAME varchar(255) unique,     -- unique name for use in API/UI
  APC_OWNER_UID integer,        -- references SYS_USERS (U_ID), NULL if the record writable for any reader
  APC_READER_GID integer,       -- references SYS_USERS (U_ID), NULL if the record is readable for public
  APC_CALLBACK varchar,
  APC_APP_ENV any
  )
;
```

Phrase sets and phrase classes may contain confidential information.
E.g., a phrase set may be used to check that a given outgoing document
does not mention titles of confidential projects or names of persons
that should act anonymously for public. So any application may specify
access restrictions when a phrase class is created. The application
usually sets APC_CALLBACK to name of some of its functions (but it may
be any string) and APC_APP_ENV to value of any type (application may
pass it to the APC_CALLBACK function as one of arguments). Phrase match
processor only keeps these data in memory, unchanged, and returns to the
application as a part of text processing report, so they can be used for
any purpose.

Phrase class describes an access to some application-specific callback,
but it does not mention any phrases at all. Individual phrases are
grouped into phrase sets. Each phrase set belongs to exactly one phrase
class and is restricted to one language handler. It does not necessarily
mean that it should consist of phrases of one natural language, because
many language handlers support mix of languages, but it may apply some
restrictions.

Phrase sets are enumerated in a DB.DBA.SYS_ANN_PHRASE_SET table.

``` programlisting
create table DB.DBA.SYS_ANN_PHRASE_SET
(
  APS_ID integer not null primary key,
  APS_NAME varchar(255) unique,     -- unique name for use in API/UI
  APS_OWNER_UID integer,        -- references SYS_USERS (U_ID), NULL if the record writable for any reader
  APS_READER_GID integer,       -- references SYS_USERS (U_ID), NULL if the record is readable for public
  APS_APC_ID integer not null,      -- references SYS_ANN_PHRASE_CLASS (APC_ID)
  APS_LANG_NAME varchar not null,   -- name of language handler that is used to split texts of phrases
  APS_APP_ENV any,
  APS_SIZE any,             -- approximate number of phrases inserted in the set (actual or estimate for future)
  APS_LOAD_AT_BOOT integer not null -- flags whether phrases should be loaded at boot time.
  )
;
```

APS_APP_ENV can be of any type (application may pass it to the
APC_CALLBACK function as one of arguments). Like APC_APP_ENV, phrase
match processor only keeps it in memory and returns in a text processing
report.

The APS_SIZE tweaks the amount of memory consumed by a phrase set when
it's loaded. The average "price" of placing a phrase to a set is 2 bytes
per phrase. Memory amounts are less than a kilobyte while APS_SIZE is
below 256, less than 64 kilobytes while APS_SIZE grow up to 32 thousands
of phrases and reaches its maximum of 64 megabytes when APS_SIZE reaches
its practical limit of 32 million phrases. Only rough similarity to the
actual number of inserts is needed, say, same order of magnitude. The
exaggerated value of APS_SIZE will allocate a bit more memory and may
slightly improve the speed. It is not practical to set APS_SIZE much
smaller than it should be because it will cause frequent table lookups
and disk buffers in use will overweight any memory savings in the phrase
match processor. If there are numerous phrase sets that are used only
occasionally, do not decrease APS_SIZE, instead set APS_LOAD_AT_BOOT to
zero for them.

Note that if phrase set is edited intensively during server run then the
number of inserted phrases is important, an effect of phrase removal is
visible only after server restart. E.g. if a phrase set is frequently
cleaned and refilled with new phrases then it is much better to delete
an obsolete set and create a new one.

Individual annotation phrases are stored in a table
DB.DBA.SYS_ANN_PHRASE, that should not be modified by applications
directly by data manipulation statements. The content of the table is
used to build special search structures in memory and SQL operations
like INSERT and DELETE can not keep in-memory structures in sync with
the content of the table. DBA may read the table but should not update;
in case of occasional update all phrase sets that contain edited phrases
may become unusable until server restart.

``` programlisting
create table DB.DBA.SYS_ANN_PHRASE
(
  AP_APS_ID integer not null,       -- references SYS_ANN_PHRASE_SET (APS_ID),
  AP_CHKSUM integer,            -- phrase check-sum
  AP_TEXT varchar,          -- original text
  AP_LINK_DATA any,         -- Associated data about links etc.
  AP_LINK_DATA_LONG long varchar,   -- Same as AP_LINK_DATA but for long content, one of two is always NULL
  primary key (AP_APS_ID, AP_CHKSUM, AP_TEXT)
  )
;
```

The "almost direct" way of writing to the table is via BIF
<a href="fn_ann_phrase_class_add.html" class="link"
title="DB.DBA.ANN_PHRASE_CLASS_ADD"><code
class="function">ap_add_phrases</code></a> . It gets two arguments, the
integer ID of annotation phrase set and a vector of descriptions of
phrases that should be edited in that phrase set. Every item of vector
of descriptions is in turn vector of one or two values; first value is
the text of the phrase, second value is associated application specific
data, the absence of second value indicates that the phrase should be
removed. If same text of phrase appears in the vector of description
more than once, and associated data differ then any version of data can
be stored for future use; it is the roll of dice because the vector is
reordered for faster processing.

</div>

</div>
