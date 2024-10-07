<div id="appspecificdocid" class="section">

<div class="titlepage">

<div>

<div>

### 20.2.2. Choosing An Application Specific Document ID

</div>

</div>

</div>

The free text index conceptually works by making an index entry for each
distinct word of each indexed column value which references back to the
row containing the data being indexed. Therefore the table must have a
unique ID that will be stored in conjunction with each distinct word in
the indexed column in the text index. For space efficiency this should
be as short as possible. If nothing else is specified the
<a href="creatingtxtidxs.html#createtxtidxstmt" class="link"
shape="rect" title="20.2.1. The CREATE TEXT INDEX statement">CREATE TEXT
INDEX</a> statement makes such a unique column and fills it
automatically from a sequence producing unique numbers. If a single part
integer primary key exists then this key is used as the free text index
document ID. Note However that the values \<= 0 are prohibited. This is
however not always optimal, hence the application may specify what
column is used to identify the row for text indexing. Such a unique
column is referred to as the <span class="emphasis">*Free Text Document
ID*</span> .

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

<div class="itemizedlist">

- To retrieve the n latest, one just takes the n first hits produced by
  the contains search, no sorting required.

- To get the next n hits, one repeats the search but now specifying that
  the start ID is the ID of the last row of the previous set. No sorting
  and no scrollable cursors are required and the first hits can be
  returned before generating all hits. This is specially useful if the
  search criteria match many articles.

</div>

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

</div>
