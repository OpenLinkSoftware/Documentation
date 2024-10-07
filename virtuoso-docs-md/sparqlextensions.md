<div id="sparqlextensions" class="section">

<div class="titlepage">

<div>

<div>

## 16.3. Extensions

</div>

</div>

</div>

<div id="rdfsparqlrulefulltext" class="section">

<div class="titlepage">

<div>

<div>

### 16.3.1. Using Full Text Search in SPARQL

</div>

</div>

</div>

Virtuoso's triple store supports optional full text indexing of RDF
object values since version 5.0. It is possible to declare that objects
of triples with a given predicate or graph get indexed. The graphs and
triples may be enumerated or a wildcard may be used.

The triples for which a full text index entry exists can be found using
the <span class="emphasis">*bif:contains*</span> or related filters and
predicates.

For example, the query:

``` programlisting
SQL>SELECT *
FROM <people>
WHERE
  {
    ?s foaf:Name ?name . ?name bif:contains "'rich*'".
  }
```

would match all subjects whose <span class="emphasis">*foaf:Name*</span>
contain a word Rich. This would match Richard, Richie etc.

Note that words and phrases should be enclosed in quotes if they contain
spaces or other non-alphanumeric chars.

If the <span class="emphasis">*bif:contains*</span> or related predicate
is applied to an object that is not a string or is not the object of an
indexed triple, no match will be found.

The syntax for text patterns is identical to the syntax for the SQL
contains predicate.

The SPARQL/SQL optimizer determines whether the text pattern will be
used to drive the query or whether it will filter results after other
conditions are applied first. In contrast to
<span class="emphasis">*bif:contains*</span> , regexp matching never
drives the query or makes use of an index, thus in practice regexps are
checked after other conditions.

<div id="rdfsparqlrulespecifywhatindex" class="section">

<div class="titlepage">

<div>

<div>

#### Specifying What to Index

</div>

</div>

</div>

Whether the object of a given triple is indexed in the text index
depends on indexing rules. If at least one indexing rule matches the
triple, the object gets indexed if the object is a string. An indexing
rule specifies a graph and a predicate. Either may be an IRI or NULL, in
which case it matches all IRI's.

Rules also have a 'reason', which can be used to group rules into
application-specific sets. A triple will stop being indexed only after
all rules mandating its indexing are removed. When an application
requires indexing a certain set of triples, rules are added for that
purpose. These rules are tagged with the name of the application as
their reason. When an application no longer requires indexing, the rules
belonging to this application can be removed. This will not turn off
indexing if another application still needs certain triples to stay
indexed.

Indexing is enabled/disabled for specific graph/predicate combinations
with:

``` programlisting
create function DB.DBA.RDF_OBJ_FT_RULE_ADD
  (in rule_g varchar, in rule_p varchar, in reason varchar) returns integer
```

``` programlisting
create function DB.DBA.RDF_OBJ_FT_RULE_DEL
  (in rule_g varchar, in rule_p varchar, in reason varchar) returns integer
```

<span class="emphasis">*Example:*</span> The first function adds a rule.
The first two arguments are the text representation of the IRI's for the
graph and predicate. If NULL is given then all graph's or predicates
match. Specifying both as NULL means that all string valued objects will
be added to a text index.

<span class="emphasis">*Example:*</span>

``` programlisting
DB.DBA.RDF_OBJ_FT_RULE_ADD (null, null, 'All');
```

The second function reverses the effect of the first. Only a rule that
has actually been added can be deleted. Thus one cannot say that all
except a certain enumerated set should be indexed.

``` programlisting
DB.DBA.RDF_OBJ_FT_RULE_DEL (null, null, 'All');
```

The reason argument is an arbitrary string identifying the application
that needs this rule. Two applications can add the same rule. Removing
one of them will still keep the rule in effect. If an object is indexed
by more than one rule, the index data remain free from duplicates,
neither index size nor speed is affected.

If <span class="emphasis">*DB.DBA.RDF_OBJ_FT_RULE_ADD*</span> detects
that <span class="emphasis">*DB.DBA.RDF_QUAD*</span> contains quads
whose graphs and/or predicates match to the new rule but which have not
been indexed before then these quads are indexed automatically. However
the function <span class="emphasis">*DB.DBA.RDF_OBJ_FT_RULE_DEL*</span>
does not remove indexing data about related objects. Thus the presence
of indexing data about an object does not imply that it is necessarily
used in some quad that matches to some rule.

The above functions return one if the rule is added or deleted and zero
if the call was redundant (the rule has been added before or there's no
rule to delete).

<div id="rdfsparqlrulespecifywhatindexexample" class="section">

<div class="titlepage">

<div>

<div>

##### Example

</div>

</div>

</div>

``` programlisting

-- We load Tim Berners-Lee's FOAF file into a graph called 'people'.

SQL>DB.DBA.RDF_LOAD_RDFXML (http_get ('http://www.w3.org/People/Berners-Lee/card#i'), 'no', 'http://www.w3.org/people#');
Done. -- 172 msec.

-- We check how many triples we got.

SQL>SPARQL SELECT COUNT (*) FROM <http://www.w3.org/people#> WHERE {?s ?p ?o};
callret-0
INTEGER
 266
No. of rows in result: 1

-- We check the GRAPH: <http://www.w3.org/people#> for objects like "Tim":

SQL>SPARQL
SELECT *
FROM <http://www.w3.org/people#>
WHERE
  {
    ?s ?p ?o . FILTER (?o LIKE '%Tim%')
  };
s                                               p                                           o
VARCHAR                                         VARCHAR                                     VARCHAR
_______________________________________________________________________________

http://www.w3.org/People/Berners-Lee/card#i     http://xmlns.com/foaf/0.1/name              Timothy Berners-Lee
http://www.w3.org/People/Berners-Lee/card#i     http://xmlns.com/foaf/0.1/nick              TimBL
http://www.w3.org/People/Berners-Lee/card#i     http://www.w3.org/2002/07/owl#sameAs        http://www4.wiwiss.fu-berlin.de/bookmashup/persons/Tim+Berners-Lee
http://www.w3.org/People/Berners-Lee/card#i     http://xmlns.com/foaf/0.1/knows             http://dbpedia.org/resource/Tim_Bray
http://www.w3.org/People/Berners-Lee/card#i     http://www.w3.org/2000/01/rdf-schema#label  Tim Berners-Lee
http://www.w3.org/People/Berners-Lee/card#i     http://xmlns.com/foaf/0.1/givenname         Timothy
http://dbpedia.org/resource/Tim_Bray            http://xmlns.com/foaf/0.1/name              Tim Bray
no                                              http://purl.org/dc/elements/1.1/title       Tim Berners-Lee's FOAF file

8 Rows. -- 230 msec.

-- We specify that all string objects in the graph 'people' should be text indexed.

SQL>DB.DBA.RDF_OBJ_FT_RULE_ADD('http://www.w3.org/people#', null, 'people');
Done. -- 130 msec.

-- We update the text index.

SQL>DB.DBA.VT_INC_INDEX_DB_DBA_RDF_OBJ ();
Done. -- 140 msec.

-- See impact of the index  by querying the subjects and predicates
-- of all triples in the GRAPH: <http://www.w3.org/people#>,
-- where the object is a string which contains a word beginning with "TIM".

SQL>SPARQL SELECT * FROM <http://www.w3.org/people#> WHERE { ?s ?p ?o . ?o bif:contains '"Timo*"'};
s                                               p                                     o
VARCHAR                                         VARCHAR                               VARCHAR
_______________________________________________________________________________

 http://www.w3.org/People/Berners-Lee/card#i    http://xmlns.com/foaf/0.1/name        Timothy Berners-Lee
 http://www.w3.org/People/Berners-Lee/card#i    http://xmlns.com/foaf/0.1/givenname   Timothy

2 Rows. -- 2 msec.
```

The query below is identical with that above but uses a different
syntax. The filter syntax is more flexible in that it allows passing
extra options to the <span class="emphasis">*contains*</span> predicate.
These may be useful in the future.

``` programlisting
SQL>SPARQL SELECT * FROM <people> WHERE { ?s ?p ?o . FILTER (bif:contains(?o,  '"Timo*"')) };
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                                                                                                                                                                                  |
|:----------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                                                                                                                                            |
|                              | It is advisable to upgrade to the latest version of Virtuoso before adding free-text rules for the first time. This is especially the case if large amounts of text are to be indexed. The reason is that the free-text index on RDF may be changed in future versions and automatic upgrading of an existing index data into the new format may take much more time than indexing from scratch. |

</div>

The table <span class="emphasis">*DB.DBA.RDF_OBJ_FT_RULES*</span> stores
list of free-text index configuration rules.

``` programlisting
create table DB.DBA.RDF_OBJ_FT_RULES (
  ROFR_G varchar not null,       -- specific graph IRI or NULL for "all graphs"
  ROFR_P varchar not null,       -- specific predicate IRI or NULL for "all predicates"
  ROFR_REASON varchar not null,  -- identification string of a creator, preferably human-readable
  primary key (ROFR_G, ROFR_P, ROFR_REASON) );
```

Applications may read from this table but they should not write to it
directly. Duplications in the rules do not affect the speed of free-text
index operations because the content of the table is cached in memory in
a special form. Unlike the use of configuration functions, directly
writing to the table will not update the in-memory cache.

The table is convenient to search for rules added by a given
application. If a unique identification string is used during
installation of an application when rules are added then it's easy to
remove those rules as part of any uninstall routine.

</div>

</div>

<div id="rdfsparqlruletimeindexing" class="section">

<div class="titlepage">

<div>

<div>

#### Time of Indexing

</div>

</div>

</div>

The triple store's text index is in manual batch mode by default. This
means that changes in triples are periodically reflected in the text
index but are not maintained in strict synchrony. This is much more
efficient than keeping the indices in constant synchrony. This setting
may be altered with the
<span class="emphasis">*db.dba.vt_batch_update*</span> stored procedure.

To force synchronization of the RDF text index, use:

``` programlisting
DB.DBA.VT_INC_INDEX_DB_DBA_RDF_OBJ ();
```

To set the text index to follow the triples in real time, use:

``` programlisting
DB.DBA.VT_BATCH_UPDATE ('DB.DBA.RDF_OBJ', 'OFF', null);
```

To set the text index to be updated every 10 minutes, use:

``` programlisting
DB.DBA.VT_BATCH_UPDATE ('DB.DBA.RDF_OBJ', 'ON', 10);
```

To make the update always manual, specify NULL as the last argument
above.

One problem related to free-text indexing of
<span class="emphasis">*DB.DBA.RDF_QUAD*</span> is that some
applications (e.g. those that import billions of triples) may set off
triggers. This will make free-text index data incomplete. Calling
procedure <span class="emphasis">*DB.DBA.RDF_OBJ_FT_RECOVER ()*</span>
will insert all missing free-text index items by dropping and
re-inserting every existing free-text index rule.

</div>

<div id="rdfviewsandfreetext" class="section">

<div class="titlepage">

<div>

<div>

#### Free-Text Indexes on Linked Data Views

</div>

</div>

</div>

If an <span class="emphasis">*O*</span> field of a quad map pattern gets
its value from a database column that has a free text index then this
index can be used in SPARQL for efficient text searching. As a variation
of this facility, the free-text index of another table may be used.

If a statement of a quad map pattern declaration starts with a
declaration of table aliases, the table alias declaration may include
the name of a table column that should have a text index. For example,
consider the possibility of using a free-text index on the content of
DAV resources stored in the DAV system tables of Virtuoso:

``` programlisting
prefix mydav: <...>
create quad storage mydav:metadata
FROM WS.WS.SYS_DAV_RES as dav_resource text literal RES_CONTENT
...
  {
    ...
    mydav:resource-iri (dav_resource.RES_FULL_PATH)
        a mydav:resource ;
        mydav:resource-content dav_resource.RES_CONTENT ;
        mydav:resource-mime-type dav_resource.RESTYPE ;
    ...
  }
```

The clause <span class="emphasis">*text literal RES_CONTENT*</span>
grants the SPARQL compiler permission to use a free-text index for
objects that are literals composed from column
<span class="emphasis">*dav_resource.RES_CONTENT*</span> . This clause
also allows choosing between <span class="emphasis">*text
literal*</span> (supports only the
<span class="emphasis">*contains()*</span> predicate) and
<span class="emphasis">*text xml literal*</span> (supports both
<span class="emphasis">*contains()*</span> and
<span class="emphasis">*xcontains()*</span> ) text indexes. It is
important to understand that the free-text index will produce results
using raw relational data. If a literal class transformation changes the
text stored in the column then these changes are ignored by free-text
search. e.g. if a transformation concatenates a word to the value of the
column, but the free-text search will not find this word.

The free-text index may be used in a more sophisticated way. Consider a
built-in table <span class="emphasis">*DB.DBA.RDF_QUAD*</span> that does
not have a free-text index. Moreover, the table does not contain the
full values of all objects; the <span class="emphasis">*O*</span> column
contains "short enough" values inlined, but long and special values are
represented by links to the
<span class="emphasis">*DB.DBA.RDF_OBJ*</span> table. The RDF_OBJ table,
however, has free-text index that can be used. The full declaration of
the built-in default mapping for default storage could be written this
way:

``` programlisting
-- Important! Do not try to execute on live system
-- without first changing the quad storage and quad map pattern names!

SPARQL
create virtrdf:DefaultQuadMap as
graph rdfdf:default-iid-nonblank (DB.DBA.RDF_QUAD.G)
subject rdfdf:default-iid (DB.DBA.RDF_QUAD.S)
predicate rdfdf:default-iid-nonblank (DB.DBA.RDF_QUAD.P)
object rdfdf:default (DB.DBA.RDF_QUAD.O)

create quad storage virtrdf:DefaultQuadStorage
FROM DB.DBA.RDF_QUAD as physical_quad
FROM DB.DBA.RDF_OBJ as physical_obj text xml literal RO_DIGEST of (physical_quad.O)
WHERE (^{physical_quad.}^.O = ^{physical_obj.}^.RO_DIGEST)
  {
    create virtrdf:DefaultQuadMap as
      graph rdfdf:default-iid-nonblank (physical_quad.G)
      subject rdfdf:default-iid (physical_quad.S)
      predicate rdfdf:default-iid-nonblank (physical_quad.P)
      object rdfdf:default (physical_quad.O) .
  }
;
```

The reference to the free-text index is extended by clause
<span class="emphasis"> *of (physical_quad.O)*</span> . This means that
the free-text on
<span class="emphasis">*DB.DBA.RDF_OBJ.RO_DIGEST*</span> will be used
when the object value comes from
<span class="emphasis">*physical_quad.O*</span> as if
<span class="emphasis">*physical_quad.O*</span> were indexed itself. If
a SPARQL query invokes
<span class="emphasis">*virtrdf:DefaultQuadMap*</span> but contains no
free-text criteria then only
<span class="emphasis">*DB.DBA.RDF_QUAD*</span> appears in the final SQL
statement and no join with
<span class="emphasis">*DB.DBA.RDF_OBJ*</span> is made. Adding a
free-text predicate will add
<span class="emphasis">*DB.DBA.RDF_OBJ*</span> to the list of source
tables and a join condition for
<span class="emphasis">*DB.DBA.RDF_QUAD.O*</span> and
<span class="emphasis">*DB.DBA.RDF_OBJ.RO_DIGEST*</span> ; and it will
add <span class="emphasis">*contains (RO_DIGEST, ...)*</span> predicate,
rather than <span class="emphasis">*contains (O, ...)*</span> . As a
result, "you pay only for what you use": adding free-text index to the
declaration does not add tables to the query unless the index is
actually used.

Boolean functions `bif:contains` and `bif:xcontains` are used for
objects that come from Linked Data Views as well as for regular
"physical" triples. Every function takes two arguments and returns a
boolean value. The first argument is an local variable. The argument
variable should be used as an object field in the group pattern where
the filter condition is placed. Moreover, the occurrence of the variable
in an object field should be placed
<span class="emphasis">*before*</span> the filter. If there are many
occurrences of the variable in object fields then the free-text search
is associated with the rightmost occurrence that is still to the left of
the filter. The triple pattern that contains the rightmost occurrence is
called the "intake" of the free-text search. When the SPARQL compiler
chooses the appropriate quad map patterns that may generate data
matching the intake triple pattern, it skips quad map patterns that have
no declared free-text indexes, because nothing can be found by free-text
search in data that have no free-text index. Every quad map pattern that
has a free-text pattern will ultimately produce an invocation of the SQL
<a href="queryingftcols.html#containspredicate" class="link"
title="20.3.1. CONTAINS predicate">contains</a> or
<a href="xcontainspredicate.html" class="link"
title="15.4.6. XCONTAINS predicate">xcontains</a> predicate, so the
final result of a free-text search may be a union of free-text searches
from different quad map patterns.

The described logic is important only in very complicated cases, whereas
simple queries are self-evident:

``` programlisting
SELECT * FROM <my-dav-graph>
WHERE {
    ?resource a mydav:resource ;
        mydav:resource-content ?text .
    FILTER (bif:contains (?text, "hello and world")) }
```

or, more succinctly,

``` programlisting
SELECT * FROM <my-dav-graph>
WHERE {
    ?resource a mydav:resource ;
        mydav:resource-content ?text .
    ?text bif:contains "hello and world" . }
```

</div>

<div id="rdfsparqlrulescoreexmp" class="section">

<div class="titlepage">

<div>

<div>

#### Example Using Score

</div>

</div>

</div>

``` programlisting
SQL>
SPARQL
SELECT *
WHERE
  {
    ?s ?p ?o .
    ?o bif:contains 'NEW AND YORK'
    OPTION (score ?sc) .
  }
ORDER BY DESC (?sc)
LIMIT 10

s                                                                        p                                               o                                                sc
ANY                                                                      ANY                                             ANY                                              ANY
______________________________________________________________________________________________________________________________________________________________________________

http://dbpedia.org/resource/New_York%2C_New_York_%28disambiguation%29    http://www.w3.org/2000/01/rdf-schema#comment    New York, New York, New York kentini........     88
http://dbpedia.org/resource/New_York%2C_New_York_%28disambiguation%29    http://dbpedia.org/property/abstract            New York, New York, New York kentinin re....     88
http://newyorkjobs.wordpress.com/2006/07/10/new-york-jobs-71006          http://purl.org/dc/elements/1.1/description     York Marketing Jobs New York Retail Jobs....     84
http://dbpedia.org/resource/Global_Communication                     http://dbpedia.org/property/contenu             A - New York, New York (Headfuq Mix) B1 ....     84
http://dbpedia.org/resource/New_York_%28disambiguation%29            http://www.w3.org/2000/01/rdf-schema#comment    New York a^?? New York amerikai vA~?ros ....     76
http://dbpedia.org/resource/New_York_%28disambiguation%29            http://dbpedia.org/property/abstract            New York a^?? New York amerikai vA~?ros ....     76
http://dbpedia.org/resource/New_York_%28disambiguation%29            http://www.w3.org/2000/01/rdf-schema#comment    New York ima lahko naslednje pomene: New ...     74
http://dbpedia.org/resource/New_York_%28disambiguation%29            http://dbpedia.org/property/abstract            New York ima lahko naslednje pomene: New ...     74
http://dbpedia.org/resource/New_York_College                             http://www.w3.org/2000/01/rdf-schema#comment    There are several colleges of New York t ...     72
http://dbpedia.org/resource/New_York_College                             http://dbpedia.org/property/abstract            There are several colleges of New York t ...     72
No. of rows in result: 10
```

</div>

</div>

</div>
