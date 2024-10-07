<div id="virtuosofaq11" class="section">

<div class="titlepage">

<div>

<div>

### 1.4.11. How many triples can a single server handle?

</div>

</div>

</div>

With free-form data and text indexing enabled, 500M triples per 16G RAM
can be a ballpark guideline. If the triples are very short and
repetitive, like the LUBM test data, then 16G per one billion triples is
a possibility. Much depends on the expected query load. If queries are
simple lookups, then less memory per billion triples is needed. If
queries will be complex (analytics, join sequences, and aggregations all
over the data set), then relatively more RAM is necessary for good
performance.

The count of quads has little impact on performance as long as the
working set fits in memory. If the working set is in memory, there may
be 15-20% difference between a million and a billion triples. If the
database must frequently go to disk, this degrades performance since one
can easily do 2000 random accesses in memory in the time it takes to do
one random access from disk. But working-set characteristics depend
entirely on the application.

Whether the quads in a store all belong to one graph or any number of
graphs makes no difference. There are Virtuoso instances in regular
online use with hundreds of millions of triples, such as DBpedia and the
<a href="http://neurocommons.org/page/Main_Page" class="ulink"
target="_top">Neurocommons</a> databases.

</div>
