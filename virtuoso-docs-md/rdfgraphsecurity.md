<div id="rdfgraphsecurity" class="section">

<div class="titlepage">

<div>

<div>

## 16.4. RDF Graphs Security

</div>

</div>

</div>

<div id="rdfgraphsecuritygroups" class="section">

<div class="titlepage">

<div>

<div>

### 16.4.1. RDF Graph Groups

</div>

</div>

</div>

In some cases, the data-set of a SPARQL query is not known at compile
time. It is possible to pass IRIs of source graphs via parameters, but
the method is not perfect as:

<div class="itemizedlist">

- not all protocols are suitable for parameter passing, and no one is an
  interoperable standard

- passing list of IRIs as a parameter will usually require the use of
  Virtuoso-specific functions in the text of SPARQL query, that's bad
  for some query builders.

- lack of knowledge about actual graphs may damage query optimization

</div>

It would be nice to create named lists of graphs and a clause like
"SELECT from all graph names of the specified list".
<span class="emphasis">*"Graph groups"*</span> serve for this purpose.
That is Virtuoso-specific SPARQL extension that let create a named list
of IRIs such that if name of the list is used in
<span class="emphasis">*FROM*</span> clause like
<span class="emphasis">*IRI*</span> of default graph then it is
equivalent to list of <span class="emphasis">*FROM*</span> clauses, one
clause for each item of the list.

Internally, descriptions of graph groups are kept in two tables:
<span class="emphasis">*Table of graph groups:*</span>

``` programlisting
create table DB.DBA.RDF_GRAPH_GROUP (
  RGG_IID IRI_ID not null primary key,  -- IRI ID of RGG_IRI field
  RGG_IRI varchar not null,     -- Name of the group
  RGG_MEMBER_PATTERN varchar,       -- Member IRI pattern
  RGG_COMMENT varchar           -- Comment
  )
create index RDF_GRAPH_GROUP_IRI on DB.DBA.RDF_GRAPH_GROUP (RGG_IRI)
;
```

<span class="emphasis">*Table of contents of groups:*</span>

``` programlisting
create table DB.DBA.RDF_GRAPH_GROUP_MEMBER (
  RGGM_GROUP_IID IRI_ID not null,   -- IRI_ID of the group
  RGGM_MEMBER_IID IRI_ID not null,  -- IRI_ID of the group member
  primary key (RGGM_GROUP_IID, RGGM_MEMBER_IID)
  )
;
```

Fields <span class="emphasis">*RGG_MEMBER_PATTERN*</span> and
<span class="emphasis">*RGG_COMMENT*</span> are not used by system
internals but applications may wish to write their data there for future
reference. <span class="emphasis">*RGG_COMMENT*</span> is supposed to be
human-readable description of the group and
<span class="emphasis">*RGG_MEMBER_PATTERN*</span> may be useful for
functions that automatically add IRIs of a given graph to all graph
groups such that the graph IRI string match
<span class="emphasis">*RGG_MEMBER_PATTERN*</span> regexp pattern.

A dictionary of all groups and their members is cached in memory for
fast access. Due to this reason, applications may read these tables and
modify <span class="emphasis">*RGG_MEMBER_PATTERN*</span> and
<span class="emphasis">*RGG_COMMENT*</span> if needed but not change
other fields directly. The following API procedures makes changes in a
safe way:

``` programlisting
DB.DBA.RDF_GRAPH_GROUP_CREATE (
  in group_iri varchar,
  in quiet integer,
  in member_pattern varchar := null,
  in comment varchar := null)
```

That creates a new empty graph group. An error is signaled if the group
exists already and quiet parameter is zero.

``` programlisting
DB.DBA.RDF_GRAPH_GROUP_INS (in group_iri varchar, in memb_iri varchar)
DB.DBA.RDF_GRAPH_GROUP_DEL (in group_iri varchar, in memb_iri varchar)
```

These two are to add or remove member to an existing group. Double
insert or removal of not a member will not signal errors, but missing
group will.be signaled.

``` programlisting
DB.DBA.RDF_GRAPH_GROUP_DROP (
  in group_iri varchar,
  in quiet integer)
```

That removes graph group. An error is signaled if the group did not
exist before the call and quiet parameter is zero.

Graph groups are <span class="emphasis">*"macro-expanded"*</span> only
in FROM clauses and have no effect on FROM NAMED or on GRAPH \<IRI\>
{...} . Technically, it is not prohibited to use an IRI as both plain
graph IRI and graph group IRI in one storage but this is confusing and
is not recommended.

Graph groups can not be members of other graph groups, i.e. the IRI of a
graph group can appear in the list of members of some group but it will
be treated as plain graph IRI and will not cause recursive expansion of
groups.

</div>

</div>
