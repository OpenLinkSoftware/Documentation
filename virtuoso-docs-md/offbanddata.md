<div>

<div>

<div>

<div>

### 20.2.8. Using Offband Data for Faster Filtering

</div>

</div>

</div>

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

``` programlisting
select id from article where contains (description, 'sample')
    and author_name = 'John Pumpkin';
    
```

This can be alternately written as

``` programlisting
select id from article
    where contains (description, 'sample', offband, author_name)
    and author_name = 'John Pumpkin';
    
```

In the latter case the author_name will be retrieved from the text
index, saving 2 random accesses, one to the index on dtid and the other
to the table itself per each free text hit.

The notation is different because the semantic is slightly different.
The author_name in the latter case is the name at the time of indexing
the article and in the latter case it is the name at the time of
evaluating the query. There can be a difference if the index is
maintained with a delay. For most applications this is however
irrelevant. offband data should not be used for often changing,
transactional data.

Now consider

``` programlisting
select * from (select top 10  dtid from article
    where contains (description, 'sample', offband, author_name)
    order by author_name) a, article b where a.dtid = b.dtid;
    
```

The derived table select the 10 first articles matching the text
condition in order of author_name. This does not itself access the
article table at all. The outer select will then select the full row for
these 10 articles. This is possible since the inner select only
references dtid, which is the free text index document id and
author_name which is declared an offband column in the text index.

This does less disk access than

``` programlisting
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

</div>
