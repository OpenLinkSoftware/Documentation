<div id="rdfperfrdfscheme" class="section">

<div class="titlepage">

<div>

<div>

### 16.17.2. RDF Index Scheme

</div>

</div>

</div>

Starting with version 6.00.3126, the default RDF index scheme consists
of 2 full indices over RDF quads plus 3 partial indices. This index
scheme is generally adapted to all kinds of workloads, regardless of
whether queries generally specify a graph. As indicated the default
index scheme in Virtuoso is almost always applicable as is, whether one
has a RDF database with very large numbers of small graphs or just one
or a few large graphs. With Virtuoso 7 the indices are column-wise by
default, which results in them to consuming usually about 1/3 of the
space the equivalent row-wise structures would consume.

Alternate indexing schemes are possible but will not be generally
needed. For upgrading old databases with a different index scheme see
the corresponding documentation.

The index scheme consists of the following indices:

<div class="itemizedlist">

- <span class="emphasis">*PSOG*</span>

  \- primary key

- <span class="emphasis">*POGS*</span>

  \- bitmap index for lookups on object value.

- <span class="emphasis">*SP*</span>

  \- partial index for cases where only S is specified.

- <span class="emphasis">*OP*</span>

  \- partial index for cases where only O is specified.

- <span class="emphasis">*GS*</span>

  \- partial index for cases where only G is specified.

</div>

This index scheme is created by the following statements:

``` programlisting
CREATE TABLE DB.DBA.RDF_QUAD (
  G IRI_ID_8,
  S IRI_ID_8,
  P IRI_ID_8,
  O ANY,
  PRIMARY KEY (P, S, O, G)
  )
ALTER INDEX RDF_QUAD ON DB.DBA.RDF_QUAD
  PARTITION (S INT (0hexffff00));

CREATE DISTINCT NO PRIMARY KEY REF BITMAP INDEX RDF_QUAD_SP
  ON RDF_QUAD (S, P)
  PARTITION (S INT (0hexffff00));

CREATE BITMAP INDEX RDF_QUAD_POGS
  ON RDF_QUAD (P, O, G, S)
  PARTITION (O VARCHAR (-1, 0hexffff));

CREATE DISTINCT NO PRIMARY KEY REF BITMAP INDEX RDF_QUAD_GS
  ON RDF_QUAD (G, S)
  PARTITION (S INT (0hexffff00));

CREATE DISTINCT NO PRIMARY KEY REF INDEX RDF_QUAD_OP
  ON RDF_QUAD (O, P)
  PARTITION (O VARCHAR (-1, 0hexffff));
```

The idea is to favor queries where the predicate is specified in triple
patterns. The entire quad can be efficiently accessed when `P` and at
least one of `S` and `O` are known. This has the advantage of clustering
data by the predicate which improves working set. A page read from disk
will only have entries pertaining to the same predicate; chances of
accessing other entries of the page are thus higher than if the page
held values for arbitrary predicates. For less frequent cases where only
`S` is known, as in `DESCRIBE` , the distinct `P` s of the `S` are found
in the `SP` index. These `SP` pairs are then used for accessing the
`PSOG` index to get the `O` and `G` . For cases where only the `G` is
known, as when dropping a graph, the distinct `S` s of the `G` are found
in the `GS` index. The `P` s of the `S` are then found in the `SP`
index. After this, the whole quad is found in the `PSOG` index.

The `SP` , `OP` , and `GS` indices do not store duplicates. If an `S`
has many values of the `P` , there is only one entry. Entries are not
deleted from `SP` , `OP` , or `GS` . This does not lead to erroneous
results since a full index (that is, either `POSG` or `PSOG` ) is always
consulted in order to know if a quad actually exists. When updating
data, most often a graph is entirely dropped and a substantially similar
graph inserted in its place. The `SP` , `OP` , and `GS` indices get to
stay relatively unaffected.

Still, over time, especially if there are frequent updates and values do
not repeat between consecutive states, the `SP` , `OP` , and `GS`
indices will get polluted, which may affect performance. Dropping and
recreating the index will remedy this situation.

In cases where this is not practical, the index scheme should only have
full indices; i.e., each key holds all columns of the primary key of the
quad. This will be the case if the `DISTINCT NO PRIMARY KEY REF` options
are not specified in the `CREATE INDEX` statement. In such cases, all
indices remain in strict sync across deletes.

Many RDF workloads have bulk-load and read-intensive access patterns
with few deletes. The default index scheme is optimized for these. With
these situations, this scheme offers significant space savings,
resulting in better working set. Typically, this layout takes 60-70% of
the space of a layout with 4 full indices.

</div>
