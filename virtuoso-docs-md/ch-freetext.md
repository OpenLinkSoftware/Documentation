<div id="ch-freetext" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 20. Free Text Search

</div>

<div>

<div class="abstract">

**Abstract**

Virtuoso provides a compact and efficient free text indexing capability
for text and XML data. A free text index can be created on any character
column, including wide and long data.

The <a href="queryingftcols.html#containspredicate" class="link"
title="20.3.1. CONTAINS predicate">contains</a> SQL predicate allows
content based retrieval of textual data. This predicate takes a column
and a text expression and is true if the pattern of words in the text
expression occurs in the column value. There must exist a previously
created text index of the column. The text expression can contain single
words and phrases connected by boolean connectives or the proximity
operator. Words can contain wildcards but must begin with at least three
non-wildcard characters if a wildcard is to be used. While it is enough
to declare a free text index on a column and then just use the contains
predicate for many applications, Virtuoso offers a range of options for
tailoring how the indexing works.

If a certain application specific order of search results is desired
more frequently than others, it is possible to specify a single or
multipart key in the order of which hits will be returned from contains
searches. Both ascending and descending order of the key is supported.
To restart a search in the middle it is possible to specify a starting
and ending key value. This works if the results are generated in the
order of the <a href="appspecificdocid.html" class="link"
title="20.2.2. Choosing An Application Specific Document ID">application
specific doc ID</a> .

If non-text criteria are often used to filter or sort results of
contains searches, it is possible to cluster these non-text data inside
the free text index for faster retrieval. It is often substantially
faster to retrieve the extra data from inside the text index than to get
them from the row referenced by the text index. Such data are called
<a href="offbanddata.html" class="link"
title="20.2.8. Using Offband Data for Faster Filtering">offband data</a>
, since they are not actually text but are stored similarly to text.

It is possible to pre-process the text before it is indexed or
unindexed. This feature can be used for data normalization and/or for
adding content from other than the primary text field being indexed into
the index. One example is adding the names of all newsgroups where an
article appears to the index when indexing a news article. Thus when
retrieving articles based on text and newsgroup, group can be used to
very efficiently filter out the hits that are not in the group, even if
the text indexed does not itself contain the group name. Another
application of the same technique is adding text from multiple columns
into the same index.

If the column being indexed is XML data, this can be declared and
enforced by the text index. XML data will be indexed specially to
support efficient XPATH predicate evaluation with the
<a href="xcontainspredicate.html" class="link"
title="15.4.6. XCONTAINS predicate">xcontains</a> predicate.

<a href="txttrig.html" class="link" title="20.4. Text Triggers">Text
Triggers</a> is a feature that allows the storage of a large body of
free text queries and automatically generating hits when documents
matching the criteria are added to the index. This is useful for
personalized data feeds, user profiles, content classification etc,
which Virtuoso can send the results to in an email message. The
conditions can be either free text expressions or XPATH expressions for
XML content.

The text index can be kept synchronous with the data being indexed, so
that the index is updated in the same transaction as the data. The other
possibility is to maintain the text index asynchronously as a scheduled
task (batch mode), which can execute up to an order of magnitude faster.
The asynchronous mode of operation offers substantially higher
performance if changes of multiple entries are processed in one batch
index refresh.

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

<span class="section">20.1. [Basic
Concepts](ch-freetext.html#txtidxquickstart)</span>

<span class="section">20.2. [Creating Free Text
Indexes](creatingtxtidxs.html)</span>

<span class="section">20.2.1. [The CREATE TEXT INDEX
statement](creatingtxtidxs.html#createtxtidxstmt)</span>

<span class="section">20.2.2. [Choosing An Application Specific Document
ID](appspecificdocid.html)</span>

<span class="section">20.2.3. [The composite Data
Type](compositedatatype.html)</span>

<span class="section">20.2.4. [Free Text Index
Examples](fttexamples.html)</span>

<span class="section">20.2.5. [Pre-processing and Extending the Content
Being Indexed](preprocessingandext.html)</span>

<span class="section">20.2.6. [Hit Scores](hitscores.html)</span>

<span class="section">20.2.7. [Word Ranges](wordranges.html)</span>

<span class="section">20.2.8. [Using Offband Data for Faster
Filtering](offbanddata.html)</span>

<span class="section">20.2.9. [Order of Hits](orderofhits.html)</span>

<span class="section">20.2.10. [Noise Words](noisewords.html)</span>

<span class="section">20.3. [Querying Free Text
Indexes](queryingftcols.html)</span>

<span class="section">20.3.1. [CONTAINS
predicate](queryingftcols.html#containspredicate)</span>

<span class="section">20.3.2. [Comments](fttcomments.html)</span>

<span class="section">20.3.3. [Text Expression
Syntax](textexprsyntax.html)</span>

<span class="section">20.4. [Text Triggers](txttrig.html)</span>

<span class="section">20.4.1. [Creating Text
Triggers](txttrig.html#createtxttrg)</span>

<span class="section">20.4.2. [Created Database
Objects](createddbobjs.html)</span>

<span class="section">20.5. [Generated Tables and
Internals](tablesandinternals.html)</span>

<span class="section">20.5.1. [Generated Tables and
Procedures](tablesandinternals.html#gentabsaprocs)</span>

<span class="section">20.5.2. [The procedures are:](procs.html)</span>

<span class="section">20.5.3. [Tables and Procedures Created By Text
Triggers](fttrigtblsandprocs.html)</span>

<span class="section">20.6. [Removing A Text
Index](droptxtindex.html)</span>

<span class="section">20.7. [Removing A Text
Trigger](droptxttrig.html)</span>

<span class="section">20.7.1.
[vt_drop_ftt_dedup](droptxttrig.html#fn_vt_drop_ftt_dedup)</span>

<span class="section">20.8. [Internationalization &
Unicode](ftinternationalization.html)</span>

<span class="section">20.9. [Performance](ftperformance.html)</span>

<span class="section">20.9.1.
[Restrictions](ftperformance.html#restrictions)</span>

<span class="section">20.10. [Free Text Functions](fttfuncs.html)</span>

<span class="section">20.10.1.
[vt_batch_dedup](fttfuncs.html#fn_vt_batch_dedup)</span>

<span class="section">20.10.2.
[vt_batch_d_id_dedup](fn_vt_batch_d_id_dedup.html)</span>

<span class="section">20.10.3.
[vt_batch_feed_dedup](fn_vt_batch_feed_dedup.html)</span>

<span class="section">20.10.4.
[vt_batch_feed_offband_dedup](fn_vt_batch_feed_offband_dedup.html)</span>

<span class="section">20.10.5.
[vt_batch_update_dedup](fn_vt_batch_update_dedup.html)</span>

<span class="section">20.10.6.
[vt_is_noise_dedup](fn_vt_is_noise_dedup.html)</span>

<span class="section">20.11. [](ch20s11.html)</span>

</div>

<div id="txtidxquickstart" class="section">

<div class="titlepage">

<div>

<div>

## 20.1. Basic Concepts

</div>

</div>

</div>

A text index is created with the
<a href="creatingtxtidxs.html#createtxtidxstmt" class="link"
title="20.2.1. The CREATE TEXT INDEX statement">CREATE TEXT INDEX</a>
statement. This creates a number of stored procedures and triggers which
will transparently manage the text index. A text index is dropped by
dropping the generated words table, called \<table\>\_\<column\>\_WORDS,
where \<table\> and \<column\> are the table and column over which the
index is made.

<div id="ex_quickstartfti" class="example">

**Example 20.1. Creating a Text Index**

<div class="example-contents">

``` programlisting
CREATE TABLE FTT (ID INTEGER, FILE varchar,  DT LONG VARCHAR );
CREATE TEXT INDEX ON FTT (DT);
```

This is the simplest case of making a text index. This process will add
an extra column to the table being indexed which it will use to
reference rows from the new text index. If there already exists an
integer primary key then this will be used and no new column will be
added. Such a column may not be 0 or negative.

Once the index is made the contains query can be used to retrieve rows:

``` programlisting
insert into ftt (id, dt) values (1, 'foo');
select from ftt where contains (dt, 'foo');
```

</div>

</div>

  

The contains predicate is a normal SQL predicate and can be used
together with other predicates in the where clause. Contains may however
not figure inside an OR or NOT. Hence:

``` programlisting
select * from ftt where contains (dt, 'foo or bar ');
```

is OK but

``` programlisting
select * from ftt where contains (dt, 'foo ') or contains (dt, 'bar');
```

is not.

</div>

</div>
