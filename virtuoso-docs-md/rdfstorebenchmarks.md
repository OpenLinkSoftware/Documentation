<div>

<div>

<div>

<div>

### 16.17.15. RDF Store Benchmarks

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Introduction

</div>

</div>

</div>

In a particular RDF Store Benchmarks there is difference if the queries
are executed with specified graph or with specified multiple graphs. As
Virtuoso is quad store, not triple store with many tables, it runs
queries inefficiently if graphs are specified and there are no
additional indexes except pre-set GSPO and OGPS. Proper use of the FROM
clause or adding indexes with graph column will contribute for better
results.

</div>

<div>

<div>

<div>

<div>

#### Using bitmap indexes

</div>

</div>

</div>

If is known in advance for the current RDF Store Benchmarks that some
users will not indicate specific graphs then should be done:

<div>

- either create indexes with graph in last position

- or load everything into single graph and specify it somewhere in
  querying application.

</div>

Both methods do not require any changes in query texts

<div>

- For users using Virtuoso 5 is strongly recommended is the usage of
  additional bitmap indexes:

  ``` programlisting
  SQL> create bitmap index RDF_QUAD_POGS on DB.DBA.RDF_QUAD (P,O,G,S);
  SQL> create bitmap index RDF_QUAD_PSOG on DB.DBA.RDF_QUAD (P,S,O,G);
  ```

- For users using Virtuoso 6 or higher, see the new layout
  <a href="rdfperfrdfscheme.html" class="link"
  title="16.17.2. RDF Index Scheme">here</a> .

</div>

You can create other indexes as well. Bitmap indexes are preferable, but
if O is the last column, then the index can not be bitmap, so it could
be, for e.g.:

``` programlisting
create index RDF_QUAD_PSGO on DB.DBA.RDF_QUAD (P, S, G, O);
```

but cannot be:

``` programlisting
create bitmap index RDF_QUAD_PSGO on DB.DBA.RDF_QUAD (P, S, G, O);
```

</div>

</div>
