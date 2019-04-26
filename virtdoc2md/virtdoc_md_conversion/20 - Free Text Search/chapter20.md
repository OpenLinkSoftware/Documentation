# Free Text Search

# Basic Concepts

A text index is created with the [CREATE TEXT INDEX](#createtxtidxstmt)
statement. This creates a number of stored procedures and triggers which
will transparently manage the text index. A text index is dropped by
dropping the generated words table, called \<table\>\_\<column\>\_WORDS,
where \<table\> and \<column\> are the table and column over which the
index is made.

    CREATE TABLE FTT (ID INTEGER, FILE varchar,  DT LONG VARCHAR );
    CREATE TEXT INDEX ON FTT (DT);

This is the simplest case of making a text index. This process will add
an extra column to the table being indexed which it will use to
reference rows from the new text index. If there already exists an
integer primary key then this will be used and no new column will be
added. Such a column may not be 0 or negative.

Once the index is made the contains query can be used to retrieve rows:

    insert into ftt (id, dt) values (1, 'foo');
    select from ftt where contains (dt, 'foo');

The contains predicate is a normal SQL predicate and can be used
together with other predicates in the where clause. Contains may however
not figure inside an OR or NOT. Hence:

    select * from ftt where contains (dt, 'foo or bar ');

is OK but

    select * from ftt where contains (dt, 'foo ') or contains (dt, 'bar');

is not.

# Creating Free Text Indexes

## The CREATE TEXT INDEX statement

Define and optionally initialize a text index on a column.

    create_freetext_index
        : CREATE TEXT [XML] INDEX ON q_table_name '(' column ')'
        [WITH KEY column]
        [NOT INSERT]
        [CLUSTERED WITH '(' column_commalist ')' ]
        [USING FUNCTION]
        [LANGUAGE STRING]
      [ENCODING STRING]
        ;

*XML* - The XML keyword specifies that the data is to be indexed as XML,
hence element names and attributes will be processed separately for use
with the XCONTAINS predicate.

The *q\_table\_name* is a qualified table name on which the index is
created. The generated procedures and auxiliary tables will be with the
owner and qualifier of this table.

The *column* must be a column of the above table, of the VARCHAR,
NVARCHAR, LONG VARCHAR, LONG NVARCHAR, LONG XML or XMLTYPE data type.
The column may additionally have the IDENTIFIED BY option if the content
is XML. This will be used to provide a base URI for traversing relative
references. The XML option for the index has to be specified if the
content is LONG XML or XMLTYPE.

*WITH KEY column* - This allows optionally specifying a uniquely
identifying column which will be used as a foreign key for referencing
the table from the text index. If this is not specified and there is a
single part integer primary key, this primary key is used as the key. If
there is no suitable primary key and the option is not present, an
integer column is added and a sequence object is used to supply distinct
values.

When specified, the column must be non-NULL and its run time value must
either be an integer or a composite (See composite data type). The
length of the values of this column is crucially important since it is
repeated for each distinct word of each row. This column is called the
free text document id column in the rest of this documentation.

*NOT INSERT* - If present, specifies that the index is not filled when
created. The VT\_INDEX\_\<table\> function is still created but not run.
You can run this manually or scheduled at an appropriate time. If
batching is enabled then the index will be filled up at that time.

*CLUSTERED WITH* - The column list must consist of columns of the table.
Their values are stored in the text index so that the values can be more
efficiently located for filtering than if they had to be retrieved from
the table itself. The combined length of the columns should be
relatively small, not much over 200 bytes for this to be effective.
There is no hard upper limit but long blobs are not advisable.

*USING FUNCTION* - This allows specifying a hook function for indexing
an unindexing a document. The index hook is called before processing the
words of the column to be indexed. This can be used to index extra text
in addition to the column value or to modify the text before indexing.
If the hook function returns 1 the column is not additionally processed.
If hook returns 0 the column is processed normally, in addition to the
words the hook may have inserted. See the section on hook functions. The
hook functions are always named \<table\>\_\<column\>\_INDEX\_HOOK and
\<table\>\_\<column\>\_UNINDEX\_HOOK, in the owner and qualifier of the
table, where \<table\> is the unqualified name of the table.

*LANGUAGE* - The string literal following this keyword may be a language
name. See [Internationalization](#ftinternationalization) for details.

*ENCODING* - The string literal following this keyword may be an
encoding name.

Creating the text index may take a long time. All this time is in
'atomic' mode, so no other database activity is allowed during it and no
log is generated. If there is an error, e.g. out of disk the created
index is dropped and the error is reported. A checkpoint should be made
after the index is complete. If the index should be created under a
different qualifier or the generated tables altered after the index is
created the NOT INSERT option should be used to delay filling the index.

The [CREATE TEXT INDEX](#createtxtidxstmt) statement will automatically
make a unique index based on the free text document id, if this is not
the PK of the table. If one wishes to modify this index, it can be found
and dropped with DROP INDEX and reconstructed, but make sure that the
reference in SYS\_VT\_INDEX matches and that the new index has the same
name as the previous version.

A freshly created text index is in synchronous mode. This means that
that changes to the table are immediately reflected on the index as they
occur. This is done through a set of automatically generated triggers.
If large changes to data will be performed, the [batch
mode](#ftperformance) is far more efficient.

> **Tip**
> 
> Although it is recommended to use the methods described above, the
> [vt\_create\_text\_index](#fn_vt_create_text_index) function can also
> be used

## Choosing An Application Specific Document ID

The free text index conceptually works by making an index entry for each
distinct word of each indexed column value which references back to the
row containing the data being indexed. Therefore the table must have a
unique ID that will be stored in conjunction with each distinct word in
the indexed column in the text index. For space efficiency this should
be as short as possible. If nothing else is specified the [CREATE TEXT
INDEX](#createtxtidxstmt) statement makes such a unique column and fills
it automatically from a sequence producing unique numbers. If a single
part integer primary key exists then this key is used as the free text
index document ID. Note However that the values \<= 0 are prohibited.
This is however not always optimal, hence the application may specify
what column is used to identify the row for text indexing. Such a unique
column is referred to as the *Free Text Document ID* .

Suppose that a table contains news articles that should most frequently
be retrieved latest first, in descending order of a datetime field. This
can be achieved by just selecting the matching articles and sorting them
with a SQL ORDER BY clause but this can be very inefficient. The reason
for this is that all hits will first have to be found, then sorted and
only then can the first hit be returned to the user. Further, the sort
key will have to be retrieved from the table, causing a random access
for each text hit. The sorting can be totally avoided if the document ID
that is used to refer to the table from the index is itself ordered by
date. This has several advantages:

  - To retrieve the n latest, one just takes the n first hits produced
    by the contains search, no sorting required.

  - To get the next n hits, one repeats the search but now specifying
    that the start ID is the ID of the last row of the previous set. No
    sorting and no scrollable cursors are required and the first hits
    can be returned before generating all hits. This is specially useful
    if the search criteria match many articles.

This has a disadvantage in that a longer document ID will have to be
stored for each distinct word of each distinct article. This may result
in a 60% increase in the index size but largely offsets the penalties of
sorting. One should however exercise the utmost care in making this ID
as short as possible. The maximum length of the ID is 30 bytes, but with
this length the storage is extremely wasteful, so an ID with fields
adding up to some 10 bytes is much better.

We will note that the document ID can be an aggregate of several
scalars. In the news article example, it could be a datetime, ID number
pair. This is so because the datetime typically would not be unique and
the ID is required itself to be unique.

However, rather than storing the datetime and an integer article number,
it is advisable to compress the datetime into a number, e.g. a count of
minutes after a given date. This maintains the temporal order to within
a minute and takes less than half the space taken by the datetime with
all its fractions, time zones etc.

For handling multi-part ID's like scalars there is a special data type,
composite. Thus, if an application specific document ID is not an
integer, it must be a composite totaling less than 30 bytes of content
divided among its members.

## The composite Data Type

A composite is like a heterogeneous array, except that it is limited in
length, may be stored as a column value for a column declared as ANY,
and may be a key part in a SQL index. Thus, comparison is defined for
composites as follows:

  - Composites are equal if all parts are equal.

  - A composite is less than another if the first part of it which is
    not equal to the corresponding part of the other composite is less
    than that part.

  - If a composite has less parts than another and all of its parts are
    equal to the corresponding parts of the longer composite, then the
    shorter is considered less.

The collation of composites is just like that of strings, except that in
the place of characters, arbitrary run time typed scalars are compared.

When strings are compared inside composites, they are compared as
binary, without any specific collation. Normal numeric coercion applies
to comparison of composites. Narrow and wide strings are compared with
binary collation. If two elements are of different types, e.g. a number
and a string and are compared, the data type will decide the outcome.
For example any integer is always less than any string.

The composite SQL function makes a composite. It takes a variable number
of arguments and returns a composite. The composite\_ref function takes
a composite and a zero based index and returns the value. The serialized
length of a composite is limited to 255 characters. If a composite is
used in a free text index it is limited to 30 characters.

  - [composite()](#fn_composite)

  - [composite\_ref()](#fn_composite_ref)

> **Tip**
> 
> See the [Data Types](#datatypes) section for the storage requirement
> of each data type.

## Free Text Index Examples

    composite (1, 2) = composite (1, 2)  is true
    composite (1, 2) < composite (1, 3) is true.
    composite (1, 0) > composite (1) is true.

    composite_ref (composite (1, 2), 1) = 2

Example of a Composite Application Specific Document ID

The below code creates a table for news articles and defines a text
index with a composite document id.

    create table article(author_name varchar(255),
                 description long varchar,
                 pub_date datetime,
                 id integer,
                 title varchar(255),
                 dtid any not null,
                 primary key(id));

    create text index on article (description)
        with key dtid clustered with (pub_date, author_name);

> **Note**
> 
> The dtid must be unique, non null and must be a composite since it is
> used as a custom text index id.

Next we define a mapping between dates and integers. These will be
minutes consecutive of 1990-1-1 0:00. With 525600 minutes per 365 day
year we will not run out of values for a long time, the positive integer
limit being 2\*\*31.

``` 
create procedure date2short (in dt datetime)
{
  return (1440 * datediff ('day', {d'1990-1-1'}, dt)
    + hour (dt) * 60 + minute (dt));
}
    
```

``` 
create procedure short2date (in n integer)
{
  return (dateadd ('minute', mod (n, 1440),
    dateadd ('day', n / 1440, {d'1990-1-1'})));
}
    
```

Now we can insert an article:

    insert into article (id, drtid, description, pub_date)
        values (1, composite (date2short ({dt '2001-1-15 12:44'}), 1),
            'sample news article', {dt '2001-1-15 12:44'});

> **Note**
> 
> The composite is the date2short of the datetime and the id. The dtid
> must be specified and cannot be generated by a trigger, since the free
> text index related triggers must have access to the value.

The text index will be in synchronous mode by default so we can now
query the data:

``` 
select id from article where contains (description, 'sample');
select id from article where contains (description, 'sample', descending);
    
```

The first query will return the oldest hits first, the second the newest
first. Note that inserting in ascending order of the document ID is
incomparably more efficient than in descending order. There is no great
speed difference between reading in ascending or descending order.

If no application specific ID were specified the order would reflect the
insertion order. Note that in this example articles do not have to be
received in publication order, although insertions will naturally tend
to follow this.

Now since the ID has an application semantic, we can use it for
filtering based on date:

Consider:

    select id from article where contains (description, 'sample', descending,
        start_id, composite (date2short ({dt'2001-1-5'})));

Since the search goes in descending order of id and starts at an id
beginning with the numeric value corresponding to 2001-1-5 0:00, we may
only get hits where the id date component is less than this, newest
first.

There is no time penalty for the start\_id option. This is therefore
incomparably faster than the query:

``` 
select id from article where contains (description, 'sample', descending)
and pub_date < {dt '2001-1-5'};
    
```

> **Tip**
> 
> The reference section for [contains](#containspredicate) for a
> definition of these options.

## Pre-processing and Extending the Content Being Indexed

Let us consider the news application. Assume now a many to many
relationship between articles and numbered news channels.

``` 
create table article_channel (
    a_id integer references article,
    c_id integer,
    primary key (a_id, c_id);
    
```

Assume further that free text search criteria be combined to channel
membership tests.

This could be expressed as follows

``` 
select * from article
    where contains (description, 'sample')
    and exists
        (select 1 from article_channel
        where a_id = id and c_id = ?);
    
```

We have a random access per each hit to a table with at least the
population of the article table for each hit. The situation is yet worse
if there is an OR of multiple channel id's to which the article may
belong.

To optimize this, we may choose to add an extra word for each channel in
which the article appears. Likewise, we may add the text of the title of
the article to the text being index.

This can be done with the index hook feature.

``` 
create text index on article (description)
    with key dtid clustered with (pub_date, author_name)
    using function ;
    
```

We then define the hook functions

``` 
create procedure
    article_description_index_hook (inout vtb any, inout d_id any)
{
  for (select c_id from article_channel
    where a_id = composite_ref (d_id, 0))
  do
    {
      vt_batch_feed (vtb, sprintf ('ch%d', c_id), 0);
    }
  vt_batch_feed (vtb, coalesce ((select title from article
    where dtid = d_id), ''), 0);
  return 0;
}
    
```

This function gets all channel id's where the article appears and adds
the word ch\<nnnn\> where \<nnnnn\> is the channel id. Thus to look for
'xx' on channel 1 or 10 one can use the text expression xx and (ch1 or
ch10). Additionally, the text of the title is added to the text being
indexed. Note that the d\_id supplied is the free text document id and
that the second part of it is the article id.

To reverse the effect, the unindex function works as follows:

``` 
create procedure
    article_description_unindex_hook (inout vtb any, inout d_id any)
{
  for (select c_id from article_channel
    where a_id = composite_ref (d_id, 0))
  do
    {
      vt_batch_feed (vtb, sprintf ('ch%d', c_id), 1);
    }
  vt_batch_feed (vtb, coalesce ((select title
    from article where dtid = d_id), ''), 1);
  return 0;
}
    
```

These hooks accept 2 inout parameters, the so called vt batch and the
free text document ID of the row at hand.

The function returns 1 to indicate that it has processed all words of
the row to be indexed and 0 to indicate that it expects the default text
to be processed by the caller as normally. Returning 1 is useful for
example if extra word normalization is applied by the hook.

If the resulting index is used by `xcontains()` special predicate then
hook functions should not alter the indexing of XML documents.
`xcontains()` reads both free-text index and the actual document in
order to locate particular fragments and it may miss search hits or get
false hits if free-text index of a column does not match to the actual
content of the column. It is still safe to call `vt_batch_feed` more
than once during a single call of a hook function: first call for an
unmodified XML document in the column plus calls for additional data.

If offband columns are declared then any call of a hook function should
either return 0 or call `vt_batch_feed_offband()` before returning a
non-zero value. If this condition is violated for a document then NULL
is returned instead of correct offband value for the document without
signalling any error.

The vt batch is an opaque data structure that accumulates words that
will be added to the text index entry for a given row. The
`vt_batch_feed` function adds words to the batch, the first argument is
the vt batch, the second is the text and the third is a flag 0 for
insert and 1 for delete. The text to be associated to the d\_id in the
index is the concatenation of all the text supplied by successive calls
to `vt_batch_feed` . Word proximity is defined as if all text were a
single string in the order of calling `vt_batch_feed` .

It is possible to partially alter the rtext associated with an existing
document. This could be done when adding channels to an article which
already exists. This could be done with the procedure:

``` 
create procedure
    ch_add_article (in cid integer, in aid integer)
{
  declare vtb, _dtid, cname any;
  if (exists (select 1 from article_channel
    where c_id = cid and a_id = aid))
    return;

  insert into article_channel (c_id, a_id) values (cid, aid);
  select dtid into _dtid from article where id = aid;

  vtb := vt_batch (1);
  vt_batch_d_id (vtb, _dtid);
  vt_batch_feed (vtb, sprintf ('ch%d', cid), 0);
  vt_batch_process_db_dba_article (vtb);
}
    
```

This first checks if the article is already on the channel, and if not,
it makes a vt batch, gets the free text document id of the article,
associates it to the vt batch and then adds a single word, ch\<nnnn\>.
The vt batch is applied by calling the generated procedure
vt\_batch\_process\_\<table\>\_\<column\> with the vt batch as only
argument.

If multiple documents should be processed in one batch, it is possible
to call vt\_batch\_d\_id multiple times to feed data about multiple
documents. In this case the successive document ids must be given in
ascending order. The batch can be processed (applied to the words table)
by calling T\_BATCH\_PROCESS\_\<table\>\_\<column\>, generated by the
index creation.

The sensitive columns of the UPDATE trigger generated are the free text
document id, the CLUSTERED WITH columns and the main text column. If
more columns are needed for hook functions etc., the triggers should be
manually edited.

If an explicit integer document ID column is specified, its value may
not be 0 or negative.

> **Tip**
> 
> [vt\_batch](#fn_vt_batch) , [vt\_batch\_feed](#fn_vt_batch_feed) ,
> [vt\_batch\_feed\_offband](#fn_vt_batch_feed_offband) ,
> [vt\_batch\_d\_id](#fn_vt_batch_d_id) .

## Hit Scores

When a document satisfies a text search expression a score is computed
to reflect the closeness of the match. This is a positive integer, with
a higher value meaning a closer match. The scores are only comparable
between results of the same query against the same database. Moreover,
the scoring rules are different for different versions of Virtuoso
server, due to the progress in information retrieval theory. Thus the
only really safe thing to do with scores is to sort the list of hits by
descending score to produce more relevant hits first. In addition, the
CONTAINS predicate allows specifying a lower limit to the score of
produced hits so a smart application can reduce a number of retrieved
documents by filtering out the less relevant documents.

While the real scoring rules of the server are too sophisticated to be
listed here, the basic concept is simple: hits for restrictive terms are
most important than hits for generic terms, frequent hits in same
document are more important than occasional, hits that are probably
concentrated in same sentence are more important than hits here and
there in a long text:

The score of a single word term is proportional to the frequency of the
word in the document.

The score of a phrase is proportional to both the frequency of the
phrase in the document and the number of words in the phrase.

The score of a proximity term 'A NEAR B' depends on the distance between
A and B in words - greater distances result in smaller scores. E.g. the
score is 100 for zero distance, 80 for 5 word distance, 50 for distance
10, 20 for distance 20; then it slowly decreases to 1 for distance 100.
If the distance is 100 words or greater then the condition A NEAR B is
considered not to be satisfied. If the A-B pair occurs several times
throughout the document the scores of each pair are added. Virtuoso
searches for shortest possible pairs, so if there is more than one word
A around B then the nearest A is selected for scoring.

Score of a term like A AND B AND C... AND Z is a minimum of scores of A,
B,... Z plus some bonuses. Longer list of AND'ed terms get higher score.
A special bonus for term A AND B is added if hits of subterm A are close
to the hits of subterm B.

Score of a term like A OR B OR C... OR Z is a maximum of scores of A,
B,... Z, with some additional corrections. Longer list of OR'ed terms
get lower score. A special bonus for term A OR B is added if hits of
subterm A are close to the hits of subterm B.

Score of a term like A AND NOT B is equal to the score of subterm A. The
subterm B is used for filtering out redundant hits but it does not
affect the scoring.

The XCONTAINS predicate can also return scores. These scores are
somewhat similar to scores made by CONTAINS but rules for them are too
complicated to be explained here.

## Word Ranges

This feature allows returning the positions of matches of a query inside
the indexed text. This is done by creating a virtual column which gets
as its value an array of arrays, one array for each top level term of
the text query expression. The component arrays in turn contain word
positions, expressed as the ordinal number of the first and last word of
each match of the term in question. The ordinal numbers are counted from
0, skipping noise words.

``` 
select dbg_obj_print (r), * from ftt
    where contains (dt, 'foo', ranges, r);
    
```

Prints the array

``` 
(L(0 0 ) )
    
```

to the server standard output, indicating that the match starts and ends
at the 0'th word, inclusive.

This feature can be used to show specific portions of matching documents
in applications. This is internally used as part of the xcontains
predicate for XML text. Also see the function search\_excerpt ().

## Using Offband Data for Faster Filtering

When evaluating a select where there is a contains predicate and
filtering conditions on columns of the table on which the text index is
defined it is useful to store the most frequently used columns in the
free text index instead of the table itself.

The rationale is that in order to access the filtering data the engine
will do a merge join with the text index table instead of a nested loop
join with the actual table. Further note that if the columns to be
accessed are not in the index that begins with the free text document id
actually 2 random accesses will be needed: 1. to get the primary key
based on the document id and 2. to get the filtering criterion based on
the primary key. It is vastly more efficient to do a merge join in the
text index to get frequently needed non-text filtering or sorting keys.

If the text index is maintained in background mode the offband data will
also be maintained with a delay. This should not be a problem however
since this is no more delayed than the text data itself.

If a select with a contains does not reference any columns from the
indexed table besides the document id, then no access to the actual
table will be generated in the compiled query. Likewise, if only columns
found in the index used to link the document id to the table are
referenced, only that index will be accessed. A special case of the
latter situation is where the document id is the primary key itself.
This will speed up retrieving the row for free text hits.

Let us consider a query for getting articles where the author name is at
a specific value:

``` 
select id from article where contains (description, 'sample')
    and author_name = 'John Pumpkin';
    
```

This can be alternately written as

``` 
select id from article
    where contains (description, 'sample', offband, author_name)
    and author_name = 'John Pumpkin';
    
```

In the latter case the author\_name will be retrieved from the text
index, saving 2 random accesses, one to the index on dtid and the other
to the table itself per each free text hit.

The notation is different because the semantic is slightly different.
The author\_name in the latter case is the name at the time of indexing
the article and in the latter case it is the name at the time of
evaluating the query. There can be a difference if the index is
maintained with a delay. For most applications this is however
irrelevant. offband data should not be used for often changing,
transactional data.

Now consider

``` 
select * from (select top 10  dtid from article
    where contains (description, 'sample', offband, author_name)
    order by author_name) a, article b where a.dtid = b.dtid;
    
```

The derived table select the 10 first articles matching the text
condition in order of author\_name. This does not itself access the
article table at all. The outer select will then select the full row for
these 10 articles. This is possible since the inner select only
references dtid, which is the free text index document id and
author\_name which is declared an offband column in the text index.

This does less disk access than

``` 
select top 10 * from article
    where contains (description, sample', offband, author_name)
    order by author_name;
    
```

In this case, all matches are fetched, including the row in the article
table and all are sorted and the top 10 are returned. This differs from
the first by the fact that this accesses the article table for each of
the text hits, not only the top 10. This can easily make a 3x speed
difference when running in memory and much greater when I/O is involved,
not to mention the adverse impact of more I/O on the working set.

## Order of Hits

Rows from a select where there is a contains predicate and no exact
match of the primary key of the table are produced in the order of the
document id of the free text index if there is no ORDER BY. If there is
an ORDER BY matching an index, the query is evaluated in the order of
that index and each consecutive row in the order of the index is
compared against the free text expression. This is practically never
desirable.

If results are desired in the order of the free text document id, there
MUST BE NO ORDER BY. The DESCENDING option of contains should be used to
produce the reverse order, see contains reference section. If another
sorting order is desired, an ORDER BY can be used but to avoid using an
index the ordering columns should be expressions or ordinal numbers of
result columns.

Therefore:

    select * from article where contains (description, 'sample')
      order by id;

Will have the effect of traversing the table in the order of id and
checking each row for free text match. This is practically NEVER good.

To produce the results in order of id instead of dtid it is better to
write

    select id, * from article where contains (description, 'sample')
      order by 1;

or

    select * from article where contains (description, 'sample')
      order by id + 0;

## Noise Words

Noise words are often occurring words which can be skipped to save space
in the indexing, such as 'the', 'of', and' etc. These are ignored when
they occur in queries or documents to be indexed. The set of noise words
is configurable and is read from the noise.txt file, in the server's
working directory, at server start up. Words mentioned in that file will
be ignored for both indexing and querying.

The file noise.txt consists of control lines and text lines. A text line
is just a string of one or more words to be declared as noise. Please
keep them shorter than 1000 characters.

Control lines are those starting with "Language:" or "Encoding:" (case
is important) "Language: lang-id" tells the system to use rules for
language "lang-id" for subsequent text lines, until either another
"Language:" control line or end of file. Similarly, "Encoding: enc-id"
tells the system to use rules for encoding "enc-id". Control lines are
always in plain ASCII, no matter which encoding is active for text
lines. By default, the server default language and "UTF-8" encoding will
be used.

The simplest way of composing noise.txt is to place every word on a
separate line and save the file in UTF-8 encoding; this will work fine
for most European languages.

    AND
    OF
    THIS
    THE

Noise words seem to be case-insensitive, but this is not so. If you
enter a word on a text line, up to four noise words will be registered:

the word exactly as it was entered;

an uppercased form of this word, if it is defined for active language;

an lowercased form of this word, if it is defined for active language;

a capitalized form, with one (or more) first chars in upper case and the
rest in lower case.

An error is signalled for a free text query consisting exclusively of
noise words.

It is important to understand that changes in noise.txt may invalidate
free text indexes that were filled with the previous version of
noise.txt. For example, if a text contains a phrase 'A B C' and after
indexing the word 'B' is added to the noise.txt then 'contains'
predicate will properly search for words 'A' and 'C' but will fail to
find the phrase 'A B C' or 'A C' due to differences in counting of word
positions. The 'xcontains' predicate is even more sensitive to changes
in word positions, because any change in word counting will corrupt the
index for element names. In addition, "persistent XML" documents may
contain pre-calculated word positions for all elements and these
positions may become out of sync with positions in free text index, so
it is best not to change noise.txt if the database contains any free
text indexes on persistent XMLs.

# Querying Free Text Indexes

## CONTAINS predicate

Returns TRUE if a free text indexed column matches a text expression.

Syntax

    contains_pred:
        contains (column, expr, opt_or_value ....)
    
    opt_or_value:
          DESCENDING
          | START_ID ',' scalar_exp
          | END_ID ',' scalar_exp
          | SCORE_LIMIT ',' scalar_exp
          | RANGES ',' variable
          | OFFBAND column
    
    variable: IDENTIFIER

The *column* must refer to a column for which there exists a free text
index. The *expr* must be a narrow or wide string expression whose
syntax matches the rules in 'Text Query Syntax'. The *START\_ID* is the
first allowed document ID to be selected by the expression in its
traversal order, e.g. least or equal for ascending and greatest or equal
for descending. *END\_ID* is the last allowed ID in the traversal order.
For descending order the START\_ID must be \>= END\_ID for hits to be
able to exist. For ascending order the START\_ID must be \<= END\_ID for
hits to be able to exist.

*DESCENDING* specifies that the search will produce the hit with the
greatest ID first, as defined by integer or composite collation. RANGES
specifies that the query variable following the RANGES keyword will be
bound to the word position ranges of the hits of the expression inside
the document. The variable is in scope inside the enclosing SELECT
statement.

*SCORE\_LIMIT* specifies a minimum score that hits must have or exceed
to be considered matches of the predicate.

*OFFBAND* specifies that the following column will be retrieved from the
free text index instead of the actual table. For this to be possible the
column must have been declared as offband with the CLUSTERED WITH option
of the [CREATE TEXT INDEX](#createtxtidxstmt) statement.

> **Tip**
> 
> [`contains()`](#fn_contains)
> 
> The [XCONTAINS Predicate](#xcontainspredicate) .

## Comments

*Order* - If the select statement containing the contains predicate does
not specify an exact match of the primary key of the table having the
contains predicate, then the contains predicate will be the 'driving'
condition, meaning that rows come in ascending or descending order of
the free text document ID.

The *DESCENDING* keyword specifies the descending order of the free text
index document ID and has nothing to do with a possible ORDER BY of the
enclosing statement. Even if there is an ORDER BY in the enclosing
statement the DESCENDING keyword of contains has an effect in the
interpretation of the STRT\_ID and END\_ID contains options.

If there is a full equality match of the primary key of the table, this
will be the driving predicate and contains will only be used to check if
the text expression matches the single row identified by the full match
of the primary key.

The contains predicate may not appear outside of a select statement and
may only reference a column for which a free text index has been
declared. The first argument must be a column for which there is such an
index. The text expression may be variable and computed, although it
must be constant during the evaluation of the select statement
containing it.

The contains predicate must be a part of the top level AND of the WHERE
clause of the containing select. It may not for example be a term of an
OR predicate in the select but can be AND'ed with an OR expression.

## Text Expression Syntax

    expr ::= proximity_expr
        expr AND expr
        | expr OR expr
        | expr AND NOT  expr
        | '(' expr ')'
    
    word_expr ::=
          word
        | '"' phrase '"'
    
    proximity_expr ::=
          word_expr
        | proximity_expr NEAR word_expr
    
    word ::=
        <word char>*
    
    phrase ::=
          word
        | phrase <whitespace> word
    
    word_char ::=  alphanumeric characters, '*',  ISO Latin accented characters.

A word is a sequence of word characters. A phrase is a sequence of words
separated by white spaces and enclosed in double quotes. If a word
contains a wildcard character it must be quoted with double quotes.

> **Note**
> 
> An expression may not consist of all negative terms, e.g. (not a) and
> (not b) is not a valid expression but 'c and not a and not b' is a
> valid expression.
> 
> Note that the NEAR connective may not be used between AND'ed or OR'ed
> terms. It can be used to combine words or phrases.

    select count (*) from docs
    where contains (text, '"virtual database"')

returns the count of documents with one or more occurrences of "virtual"
immediately followed by "database".

    'performance and (tuning or optimization)'

specifies documents with performance and either 'tuning' or
optimization' in any respective positions.

    'graphics and not (graphics near user near interface)'

matches documents with the word graphics more than 100 words away from
'user' or 'interface'.

    '"sql interfac*"'

matches documents with SQL followed by a word beginning with 'interfac'.

    '"dragon*" and not "once upon a time"'

matches documents with words beginning with 'dragon' and not containing
the phrase 'once upon a time'.

# Text Triggers

The text trigger mechanism allows implementing a broad range of content
tracking functionality. The idea is storing free text or XPATH queries
in association to a text indexed column of a table. When the content of
the table changes through inserts or updates, the new data is matched
against a base of stored queries and hits are marked into a separate
table. The data being tracked may either be plain text or XML. In the
event of XML, both free text and XPATH queries can be stored.

The benefit of the text trigger system as opposed to other forms of
periodic content tracking is that the incoming data itself indexes a
base of stored queries instead of a base of stored queries repeatedly
indexing the database. This means that only the changes are compared to
the stored queries and that queries that could not even in principle
match will not be tried. This results in a qualitatively better
performance and scalability than repeatedly running a batch of queries
over updated data and thus makes possible personalized information
filtering applications that would be impractical with other approaches.

## Creating Text Triggers

The `CREATE TEXT TRIGGER` statement creates a set of tables and
procedures named after the table and column being watched. The
`TT_QUERY_<xx>` table contains the set of queries, the `TT_HIT_<xx>`
table records the matches and the TT\_USER\_\<xx\> table can be used to
map stored queries to specific users that should be notified.

Syntax:

    CREATE TEXT TRIGGER ON <table> [(<data_column>)]
    DROP TEXT TRIGGER ON <table> [(<data_column>)]

The \<data\_column\> is optional and must be a text indexed column.

The table to be watched by a text trigger should have a free text
indexed column. This may or may not be XML data.

The \<table\> must be text indexed before creating text trigger on it.

    create table ftt (id integer not null primary key, dt long varchar);
    create text xml index on ftt (dt);
    create text trigger on ftt;

Adding queries to the text trigger

    TT_QUERY_ftt ('virtuoso and server and international',
      1, 'Virtuoso international support', 'iam@foo.bar');

this adds a query which will filter only documents matching words
'virtuoso', 'server' and 'international', named 'Virtuoso international
support' of the user with Id equal to 1 with e-mail notification.

    TT_XPATH_QUERY_ftt ('/chapter[@label = ''XI'']',
      2, 'Chapter XI changes', '');

this will add an XPATH query which will filter only XML documents
matching Chapter XI, named 'Chapter XI changes' of the user with Id
equal to 2 without e-mail notification.

    insert into ftt values (1, 'virtuoso server international');
    insert into ftt values (2, 'virtuoso international');
    
    select TTH_D_ID, TTH_T_ID, TTH_U_ID, TTH_TS from ftt_dt_HIT;

will produce

    TTH_U_ID    TTH_D_ID         TTH_T_ID    TTH_TS
    _____________________________________________
    
    1           1                1           2001-01-17 12:35:30

Meaning that row from 'ftt' with id equal to 1 matches query with TT\_ID
equal to 1 defined for user with ID equal to 1. Also the hit is
registered on '2001-01-17 12:35:30'.

## Created Database Objects

Text trigger hits table. Text trigger stores hits on documents matching
a condition within this table.

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

Text trigger queries table, where the query definition procedure stores
the user specific queries.

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

One query can add one or more rows to the queries table.

Text trigger users table, in it query definition procedure add a
reference between query and user.

    <table_name>_<data_column>_USER (
      TTU_T_ID INTEGER, -- references text query TT_ID
      TTU_U_ID INTEGER, -- references application specific users table ID
      TTU_NOTIFY VARCHAR, -- e-mail address list for notification
      TTU_COMMENT VARCHAR, -- Human readable label of query definition.
      PRIMARY KEY (TTU_T_ID, TTU_U_ID)
    )

> **Note**
> 
> In the case of e-mail notification to the main addresses the string
> passed as address list must be in the following format:
> '\<u1@foo.com\>, \<u2@foo.bar\>'.

Procedures that are used for adding text queries.

    TT_QUERY_<table_name> (in query_text varchar, in user_id integer,
      in label varchar, in notification_address varchar)

Used for adding XPATH queries.

    TT_XPATH_QUERY_<table_name> (in xpath_query_text varchar , in user_id integer,
    in label varchar, in notification_address varchar)

Used to send notifications to the users. This procedure is usually
called by the server event scheduler.

    TT_NOTIFY_<table_name> ();

# Generated Tables and Internals

## Generated Tables and Procedures

vt\_create\_text\_index makes a separate table for storing the text
index information and separate procedures and triggers for maintaining
this data. These are automatically dropped if the original table is
dropped.

The updates to the indexed column are recorded in a separate update
tracking table. This table, named
VTLOG\_\<qualifier\>\_\<owner\>\_\<table\> contains a row for each row
in the indexed table that has been changed since the text index was last
updated.

The text index is stored in a table named \<table\>\_\<column\>\_WORDS.
The generated tables are made under the qualifier that is current at the
time of their creation. The owner is the creating user.

## The procedures are:

    VT_INDEX_<qualifier>_<owner>_<table>  (in flag integer)

This re-indexes the table. A flag of 0 makes the index, a flag of 1
deletes data found in the table from the index.

    VT_INC_INDEX_<qualifier>_<owner>_<table>  (in flag integer) ()

This function refreshes the index using the change tracking information
in the VTLOG\_ table.

## Tables and Procedures Created By Text Triggers

``` 
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

The TT\_USER\_\<xx\> table maps from the query to a user. The idea of
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

When a hit is noticed an entry is made into the TT\_HIT\_\<xx\> table.
One row is inserted for each unique document id, query id, user id
combination for which the document matches the query and there is a link
to a user from the query through TT\_USER\_\<xx\>. A query with no row
in TT\_USEER\_\<xx\> is an integrity error. The number of times the
pattern is found in each document or its free text hit score has no
effect on the hit insertion.

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

### Procedures

For queries definition

    tt_query_[TARGET_TABLE_NAME] (
            in [query text] varchar,        - query expression
            in [user_id] integer,       - user id references SYS_USERS or SYS_DAV_USER
            in [comment] varchar,       - description
            in [e-mail or empty] varchar)   - e-mail address for user notification

or hits registration (used inside text index procedures)

    vt_hits_[TARGET_TABLE_NAME] (inout [batch] any, inout [words array] any)

### Triggers

for hits removal after document delete occurred

    [TARGET_TABLE_NAME]_FTT_D

### Examples

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

# Removing A Text Index

A text index is dropped by dropping the words table with DROP TABLE.
This will drop all triggers, procedures and auxiliary tables. The words
table is in the qualifier and owner of the indexed table and is named
\<table\>\_\<column\>\_WORDS.

    drop table DB.DBA.XML_TEXT_XT_TEXT_WORDS;

\-- drops the text index created in the vt\_create\_text\_index example

# Removing A Text Trigger

Used to drop text trigger definition on text indexed table. The
operation also drop all tables created by create text trigger statement.

Syntax:

    DROP TEXT TRIGGER ON <table> [(<data_column>)]

    drop text trigger on ftt;

will drop the text trigger definition from table ftt.

Or using the stored procedure:

## vt\_drop\_ftt\_dedup

For detailed description and example use of the function, see
[vt\_drop\_ftt](#fn_vt_drop_ftt) in the [Functions Reference
Guide](#ch-functions).

# Internationalization & Unicode

The text being indexed and the text query expression may both be wide
strings. The word boundaries used to cut the text in words in both
queries and index maintenance may depend on a language declared for the
text index.

The default language has white space and punctuation as word delimiters
and will recognize Unicode ideographic characters as self standing. A
single non-ideographic character will always be considered noise and not
indexed.

Non-ASCII Unicode values are converted to UTF8 before being stored into
the word table as narrow strings. Narrow 8 bit strings are stored in the
words table as is.

> **Tip**
> 
> The LANGUAGE option in [CREATE TEXT INDEX](#createtxtidxstmt) .

# Performance

For indexing large volumes it is critical to run the indexing process
over large volumes of data. This is accomplished by using the batch
update mode. This is activated with the VT\_BATCH\_UPDATE procedure.

When this mode is on the index will be updated after a settable
interval, doing all the updates accumulated since the last batch in a
single go. The size of a single batch is configurable in the
virtuoso.ini file using the FreeTextBatchSize option. This is the number
of bytes of text which will be processed as one sweep over the index. A
value of 1MB is often suitable. Even All changes are processed in a
batch at the set interval. If there are more characters of text to index
/ unindex than the batch size, the operation is broken into several
transactions, each processing about FreeTextBatchSize bytes worth of
text. This improves concurrency and cuts down on locking.

The command

``` 
DB.DBA.vt_batch_update ('DB.DBA.ARTICLE', 'ON', 1);
    
```

turns on the batch mode for the article table with a 1 minute delay
between index refreshes. The table name must be fully qualified and is
case sensitive. The correct case is seen in the administration interface
tables list of the isql tables command etc.

## Restrictions

If the free text document ID is an integer, which is encouraged for
compactness, the values 0 and negative are reserved.

# Free Text Functions

## vt\_batch\_dedup

For detailed description and example use of the function, see
[vt\_batch](#fn_vt_batch) in the [Functions Reference
Guide](#ch-functions).

## vt\_batch\_d\_id\_dedup

For detailed description and example use of the function, see
[vt\_batch\_d\_id](#fn_vt_batch_d_id) in the [Functions Reference
Guide](#ch-functions).

## vt\_batch\_feed\_dedup

For detailed description and example use of the function, see
[vt\_batch\_feed](#fn_vt_batch_feed) in the [Functions Reference
Guide](#ch-functions).

## vt\_batch\_feed\_offband\_dedup

For detailed description and example use of the function, see
[vt\_batch\_feed\_offband](#fn_vt_batch_feed_offband) in the [Functions
Reference Guide](#ch-functions).

## vt\_batch\_update\_dedup

For detailed description and example use of the function, see
[vt\_batch\_update](#fn_vt_batch_update) in the [Functions Reference
Guide](#ch-functions).

## vt\_is\_noise\_dedup

For detailed description and example use of the function, see
[vt\_is\_noise](#fn_vt_is_noise) in the [Functions Reference
Guide](#ch-functions).

# 

Text index log table. In case of batch update mode this table is used to
store a log of actions over text indexed table.

    VTLOG_<table> (
      VTLOG_<document_id_col> ANY NOT NULL PRIMARY KEY,
                -- references text indexed table by document id
      SNAPTIME DATETIME,
                -- time of insert/update/delete action
      DMLTYPE VARCHAR (1),
                -- type of log 'I' 'U' 'D' for insert, update or delete
      VT_DISTINCT_WORDS LONG VARBINARY,
                -- in case of update or delete are stored words which should be deleted
      VT_OFFBAND_DATA LONG VARCHAR
                -- in case of update or delete are stored offband data should be deleted
    )

Text index batch procedure. This procedure log, process and stores
already filled \_vt\_batch, caused storing of words in index table.

    VT_BATCH_PROCESS_<table> (inout _vt_batch any)

Text trigger hook function. This function, for existing text trigger
definition, applies the filtering queries (if defined) to the \_strings,
and if the \_vt\_batch matches any of them then add new record in HITS
table (see Text trigger)

    VT_HITS_<table> (inout _vt_batch any, inout _strings any);

Text index words table. This table maintains distinct words collected
from all documents from text indexed table.

    <table>_<column>_WORDS (
      VT_WORD VARCHAR,  -- distinct word
      VT_D_ID ANY,  -- referencing the first matching
                -- document id in text indexed table
      VT_D_ID_2 ANY,  -- referencing the last matching document
                -- id in text indexed table
      VT_DATA VARCHAR,  -- string with document id's and word
                -- positions where the word is matched
      VT_LONG_DATA LONG VARCHAR, -- the same as VT_DATA but in a
                -- case of large amount of data
      PRIMARY KEY (VT_WORD, VT_D_ID)
    )

Text indexing procedure, using for clearing and creating the text index.
If flag is equal to 1 then index data will be cleared, else if equal to
0 then index data will generated. Note that for large tables generating
the index can run for a long time and the server will go into atomic
mode.

    VT_INDEX_<table> (in _flag integer)

Procedure for incremental update of text index. In case of batch mode
update this procedure must be called to process the entries in log table
and refresh text index data. Before calling this function the
contains/xcontains predicate may not match the newest inserted, updated
or deleted documents. This function is also registered for scheduled
action if the vt\_batch\_update() function is called with refresh
interval greater than zero. (See vt\_batch\_update function)

    VT_INC_INDEX_<table> ()

Text indexing and unindexing hook procedures. These are user-defined
procedure which can access additional related data and perform
preprocessing and call vt\_batch\_feed inside. These procedures receive
the free text id as argument and can use this to retrieve data related
to the row being indexed. If the text index is created with 'USING
FUNCTION' clause then internally generated procedures and functions will
include calls to these. If these procedures return 1 then the caller
will skip filling a vt\_batch, assuming the hook function already filled
it, otherwise the caller will proceed as if there had been no hook.

The difference between these two functions is that ...\_INDEX\_HOOK will
be called upon insertion of new data or after update, but
..\_UNINDEX\_HOOK will be called after delete or before update on the
text indexed table.

> **Note**
> 
> This function is USER-DEFINED, the user can create it before or after
> creating a text index.

In the second case the text index MUST be create with the 'NOT INSERT'
option. After the hook is defined, the index can be filled with with
'VT\_INDEX\_\<table\>(0)' procedure.

    <table>_<column>_INDEX_HOOK (inout _vt_batch any, inout d_id any)
    <table>_<column>_UNINDEX_HOOK (inout _vt_batch any, inout d_id any)

    create table fth (id integer not null primary key, dt varchar, c1 varchar);
    
    create procedure fth_dt_index_hook (inout vtb any, inout d_id integer)
    {
      declare data any;
      data := coalesce ((select concat (dt, ' ', c1)
        from fth where id = d_id), null);
      if (data is null)
        return 0;
      vt_batch_feed (vtb, data, 0);
      return 1;
    }
    
    create procedure fth_dt_unindex_hook (inout vtb any, inout d_id integer)
    {
      declare data any;
      data := coalesce ((select concat (dt, ' ', c1)
        from fth where id = d_id), null);
      if (data is null)
        return 0;
      vt_batch_feed (vtb, data, 1);
        return 1;
    }
    
    insert into fth values (1, 'abc', 'one');
    
    create text index on fth (dt) with key id using function;

test the text index:

    select id from fth where contains (dt, 'abc');
    select id from fth where contains (dt, 'one');

Both select statements will return 1 because the content is concatenated
with an additional column.

Note that in the case of using additional columns, they should be added
as offband data to the text index, otherwise update them will not affect
the index.

    <table>_<column>_QUERY table (see Text trigger definition)
    <table>_<column>_USER table (see Text trigger definition)
    <table>_<column>_HIT table (see Text trigger definition)
    TT_QUERY_<table>_<column> procedure (see Text trigger definition)

Table for text indexes system information

    SYS_VT_INDEX (
      VI_TABLE VARCHAR,  -- Fully qualified text indexed table name
      VI_INDEX VARCHAR,  -- Index name
      VI_COL VARCHAR,  -- Data column name
      VI_ID_COL VARCHAR,  -- Document id column name
      VI_INDEX_TABLE VARCHAR,  -- fully qualified name of table with words
                -- (See: <table>_<column>_WORDS table)
      VI_ID_IS_PK INTEGER,  -- if the document id is specified by user or
                -- used primary key then it equal to 1
      VI_ID_CONSTR VARCHAR,  -- serialized value with id column(s) names
      VI_OFFBAND_COLS VARCHAR,  -- serialized value of offband data columns names
      VI_OPTIONS VARCHAR,  -- reserved
      VI_LANGUAGE VARCHAR,  -- language which applied to the document contents
      PRIMARY KEY (VI_TABLE, VI_COL))
