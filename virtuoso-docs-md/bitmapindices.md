<div>

<div>

<div>

<div>

## 9.31. Bitmap Indices

</div>

</div>

</div>

A bitmap index is a special type of index that is tailored for being
efficient for key columns with relatively few distinct values, i.e. low
cardinality key columns. A bitmap index is created with the normal
create index statement by putting the bitmap keyword in front of index,
as follows:

``` programlisting
create table customer (c_id int primary key, c_state char (2), c_gender char (1), .... );

create bitmap index c_gender on customer (c_gender);
create bitmap index c_state on customer (c_state);
```

Bitmap indices offer space savings of up to 1000 x in some cases and
specially for large tables the savings in I/O can be very significant.

A bitmap index can only be used on tables with an integer primary key or
in other situations where the last effective key part of the index is an
integer. This is understandable since a bitmap index uses a bitmap for
representing the values of the last key part, thus having one bitmap for
each distinct combination of leading key parts. In the above example,
the customer table has an integer c_id column as primary key and a
character for the customer's gender and a 2 character field for the
state where the customer is located. Thus, to count all the male
customers in Massachusetts, one will take the males bitmap and the MA
bitmap and perform a bitwise AND of the two. This will have a 1 bit
corresponding to the c_id of each male customer in Massachusetts.

We also note that in order to do the count, the customer table itself
does not even have to be referenced, as the bitmaps hold all the
information. Even if the table did have to be referenced, for example
for adding up the outstanding credit of all male customers in
Massachusetts, the bitwise AND could be done first and only the relevant
rows would have to be retrieved from the table itself.

Virtuoso's implementation of bitmap indices is designed to work
efficiently even when the leading key parts have relatively high
cardinality, i.e. many distinct values, causing there to be a large
number of mostly empty bitmaps. Of course, if each bitmap has only one
bit set, for example if every customer is in a different state, there is
no benefit to bitmap indices. On the other hand, there is also almost no
penalty, only 6 bytes more per index entry than for a regular index.
Therefore, for any non-unique key where bitmap indices are applicable,
even if there are only a few repeated values, bitmap indices are a safe
choice. If there are at least 2 times more rows than distinct values of
the keys, space savings are certain.

A bitmap index may have any number of key parts of any type, provided
that the last effective part is an integer or and IRI id. The last key
parts of an index are those primary key parts that do not occur
elsewhere in the key. Thus, if the primary key is a single integer,
bitmap indices are always applicable. However, supposing the primary key
were an integer plus a string, it would be possible to make a bitmap
index where the string were first, followed by the integer. This would
make sense and save space if the string were not unique by itself. As
another example, the RDF_QUAD system table, the default location of the
Virtuoso RDF triple store, has the columns P, G, O and S, where all are
IRI ID's, except for O which is ANY. Thus, The primary key is the
concatenation of all columns, by default in the order GSPO. There is
another key in the order PGOS which can be implemented as a bitmap index
because S is an IRI ID, hence integer-like for purposes of bitmap
indices.

<div>

<div>

<div>

<div>

### 9.31.1. Bitmap Indices and Transactions

</div>

</div>

</div>

The minimum locking unit is the row. In the case of a bitmap index, one
row holds a bitmap which most often refers to many rows. Locking is
therefore less granular than with regular indices. Thus, if multiple
threads insert rows with bitmap indices, more waits may occur than if
the index were not bitmapped. A single row of a bitmap index references
maximally 8192 other rows, most often however the count is much less.

In all other respects, locking and transactional behavior are identical
with other indices.

</div>

</div>
