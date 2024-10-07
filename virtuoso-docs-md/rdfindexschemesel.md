<div id="rdfindexschemesel" class="section">

<div class="titlepage">

<div>

<div>

### 16.17.3. Index Scheme Selection

</div>

</div>

</div>

The indexes in place on the `RDF_QUAD table` can greatly affect the
performance of SPARQL queries, as can be determined by running the
`STATISTICS` command on the table as follows:

``` programlisting
SQL> STATISTICS DB.DBA.RDF_QUAD;
Showing SQLStatistics of table(s) 'DB.DBA.RDF_QUAD'
TABLE_QUALIFIER  TABLE_OWNER      TABLE_NAME       NON_UNIQUE  INDEX_QUALIFIER  INDEX_NAME       TYPE        SEQ_IN_INDEX  COLUMN_NAME      COLLATION  CARDINALITY  PAGES       FILTER_CONDITION
VARCHAR          VARCHAR          VARCHAR          SMALLINT    VARCHAR          VARCHAR          SMALLINT    SMALLINT    VARCHAR          VARCHAR  INTEGER     INTEGER     VARCHAR
_______________________________________________________________________________

DB               DBA              RDF_QUAD         NULL        NULL             NULL             0           NULL        NULL             NULL     NULL        NULL        NULL
DB               DBA              RDF_QUAD         0           DB               RDF_QUAD         3           1           P                NULL     NULL        NULL        NULL
DB               DBA              RDF_QUAD         0           DB               RDF_QUAD         3           2           S                NULL     NULL        NULL        NULL
DB               DBA              RDF_QUAD         0           DB               RDF_QUAD         3           3           O                NULL     NULL        NULL        NULL
DB               DBA              RDF_QUAD         0           DB               RDF_QUAD         3           4           G                NULL     NULL        NULL        NULL
DB               DBA              RDF_QUAD         1           DB               RDF_QUAD_GS      3           1           G                NULL     NULL        NULL        NULL
DB               DBA              RDF_QUAD         1           DB               RDF_QUAD_GS      3           2           S                NULL     NULL        NULL        NULL
DB               DBA              RDF_QUAD         1           DB               RDF_QUAD_OP      3           1           O                NULL     NULL        NULL        NULL
DB               DBA              RDF_QUAD         1           DB               RDF_QUAD_OP      3           2           P                NULL     NULL        NULL        NULL
DB               DBA              RDF_QUAD         1           DB               RDF_QUAD_POGS    3           1           P                NULL     NULL        NULL        NULL
DB               DBA              RDF_QUAD         1           DB               RDF_QUAD_POGS    3           2           O                NULL     NULL        NULL        NULL
DB               DBA              RDF_QUAD         1           DB               RDF_QUAD_POGS    3           3           G                NULL     NULL        NULL        NULL
DB               DBA              RDF_QUAD         1           DB               RDF_QUAD_POGS    3           4           S                NULL     NULL        NULL        NULL
DB               DBA              RDF_QUAD         1           DB               RDF_QUAD_SP      3           1           S                NULL     NULL        NULL        NULL
DB               DBA              RDF_QUAD         1           DB               RDF_QUAD_SP      3           2           P                NULL     NULL        NULL        NULL

15 Rows. -- 24 msec.
SQL>
```

With only one index (`OGPS` ) created by default, if the graph is always
given, as with one or more `FROM` or `FROM NAMED` clauses, and there are
no patterns where only graph and predicate are given, then the default
indices should be sufficient. If predicate and graph are given but
subject is not, then it is sometimes useful to add:

``` programlisting
CREATE BITMAP INDEX RDF_QUAD_PGOS
  ON DB.DBA.RDF_QUAD (G, P, O, S)
  PARTITION (O VARCHAR (-1, 0hexffff));
```

Note: If the server version is pre-5.0.7, leave out the partitioning
clause.

Making the `PGOS` index can help in some cases even if it is not readily
apparent from the queries that one is needed. This is so, for example,
if the predicate by itself is selective; i.e., there is a predicate that
occurs in only a few triples.

There is one known application scenario that requires a small alteration
to the default index scheme. If the application has a large number of
small graphs, e.g. millions of graphs of tens or hundreds of triples
each, and it commonly happens that large numbers of graphs contain
exactly the same triple, for example the same triple is found in 100000
or one million graphs, then some operations will become inefficient with
the default index scheme. In specific, dropping a graph may have to scan
through large amounts of data in order to find the right quad to delete
from the set of quads that differ only in the graph.

This will affect a graph replace and a graph drop or generally any
deletion that falls on a quad of the described sort. If this is the
situation in the application, then dropping the `RDF_QUAD_GS` distinct
projection and replacing it with a covering index that starts with `G`
is appropriate:

``` programlisting
Drop index RDF_QUAD_GS;
Create column index RDF_QUAD_GPSO on RDF_QUAD (G, P, S, O) partition (S int (0hexffff00);
```

The partition clause only affects cluster settings and is ignored in the
single server case. Partitioning on `S` is usually better than on `O`
since the distribution of `S` is generally less skewed than that of `O`
. That is, there usually are some very common `O` values (e.g. class
"thing"). This will increase space consumption by maybe 25% compared to
the default scheme.

</div>
