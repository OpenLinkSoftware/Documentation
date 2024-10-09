<div>

<div>

<div>

<div>

### 16.5.5. Translation Of SPARQL Triple Patterns To Quad Map Patterns

</div>

</div>

</div>

When a SPARQL query is compiled into SQL using a quad storage, every
triple pattern should become a subquery that retrieves data from
relational tables. This subquery is an <span class="emphasis">*UNION
ALL*</span> of joins generated from appropriate quad map patterns. The
complete SQL query is composed from these basic subqueries. Thus the
first operation of the SQL generation for a triple pattern is searching
for quad map patterns that may in principle produce triples that match
the triple pattern.

The more restrictions contained in the triple pattern the fewer quad map
patterns will be used. A triple pattern <span class="emphasis">*graph ?g
{ ?s ?p ?o }*</span> is common enough to invoke all data transformations
of the storage. A triple pattern <span class="emphasis">*graph \<g\> {
?s \<p\> \<o\> }*</span> will usually intersect with the range of only
one quad map. Sometimes it is possible to prove that the storage can not
contain any data that matches the given triple pattern, hence zero
number of members of <span class="emphasis">*UNION ALL*</span> will
result in constantly empty result-set.

The search for quad maps for a given pair of triple pattern and quad map
storage is quite simple. The storage is treated as a tree of map
patterns where quad map patterns are leafs, grouping patterns are inner
nodes and the whole storage is also treated as a grouping pattern that
specify no fields and contains all top-level map patterns of the
storage.

The tree is traversed from the root, left to right, non-leaf vertex are
checked before their children. The check of a vertex consists of up to
four field checks, for G, S, P and O. Every field check compares the
field definition in the vertex and the corresponding field in the triple
pattern, G and G, S and S and so on. Note that a non-leaf vertex defines
less than four of its fields, e.g., the root vertex does not define any
of its fields and top-level <span class="emphasis">*graph map { ...
}*</span> defines only graph. Checks are performed only for defined
fields and return one of three values: "failed", "passed", "full match",
according to the following rules:

<div>

**Table 16.8. Matching Triple Field and Vertex Field**

<div>

| Field of vertex          | Field in triple pattern                  | Result     |
|--------------------------|------------------------------------------|------------|
| constant                 | same constant                            | full match |
| constant                 | different constant                       | failed     |
| constant                 | variable of same type                    | passed     |
| constant                 | variable of different type               | failed     |
| quad map value           | constant of same type                    | full match |
| quad map value           | constant of different type               | failed     |
| quad map value of type X | variable, X or subtype of X              | full match |
| quad map value of type X | variable, supertype of X                 | passed     |
| quad map value of type X | variable, type does not intersect with X | failed     |

</div>

</div>

  

If any of the checks fails, the vertex and all its children are excluded
from the rest of processing. Otherwise, if all four fields are defined
for the quad map pattern, the map is added to the list of matching map
patterns. The difference between "passed" and "full match" is
significant only if the map is declared with
<span class="emphasis">*option (exclusive)*</span> If all performed
checks return "full match" and <span class="emphasis">*option
(exclusive)*</span> is set then the traverse of the tree is stopped as
soon as all children of the vertex are traversed. The most typical use
of this option is when the application developer is sure that all
triples of a graph belong to his application and they come from his own
quad map patterns, not from
<span class="emphasis">*DB.DBA.RDF_QUAD*</span> . This is to prevent the
SPARQL compiler from generating redundant subqueries accessing
<span class="emphasis">*DB.DBA.RDF_QUAD*</span> . The declaration may
look like

``` programlisting
create quad storage <mystorage>
  {
    graph <mygraph> option (exclusive) { . . . }
    create virtrdf:DefaultQuadMap
      using storage virtrdf:DefaultQuadStorage .
  }
```

Exclusive patterns make the order of declarations important, because an
exclusive declaration may "throw a shadow" on declarations after it.
Consider a database that have a special table RDF_TYPE that caches all
RDF types of all subjects in all graphs. Consider two declarations: all
triples from graph <span class="emphasis">*\<http://myhost/sys\>*</span>
and all triples with <span class="emphasis">*rdf:type*</span> predicate,
both exclusive:

``` programlisting
graph <http://myhost/sys> option (exclusive)
  {
    . . . # mapping of DB.DBA.SYS_USERS as in previous examples.
  }
graph rdfdf:default-iid-nonblank (DB.DBA.RDF_TYPE.G)
subject rdfdf:default-iid (DB.DBA.RDF_TYPE.S)
predicate rdf:type
object rdfdf:default (DB.DBA.RDF_TYPE.O)
option (exclusive)
```

The order of these declarations dictates that triple pattern

``` programlisting
graph <http://myhost/sys> {?s rdf:type ?o}
```

is compiled using only quad map patterns of the graph declaration,
ignoring second declaration (and of course ignoring default mapping
rule, if any). An explicit <span class="emphasis">*option (order
N)*</span> at the end of quad map pattern will tweak the priority. By
default, order will grow from 1000 for the first declaration in the
statement to 1999 for the last, explicit configuration is especially
useful to make order persistent to <span class="emphasis">*alter
storage*</span> statements.

The <span class="emphasis">*option (exclusive)*</span> trick is ugly,
low-level and prone to cause compilation errors after altering storage
declarations. When misused, it is as bad as "red cut" in PROLOG, but one
must use this trick to build scalable storages.

The <span class="emphasis">*option (exclusive)*</span> helps the SPARQL
compiler to prepare better SQL queries, but sometimes it is "too
exclusive". For instance, if a grouping quad map pattern specify only
quad map value for graph and no other fields then making it exclusive
prohibits the use of all declarations of the storage after that one.
Sometimes it is better to notify compiler that quads made by the given
quad map pattern are supposed to be different from all quads made by
declarations listed after the given one.

Consider an application that exports users' personal data as graphs
whose IRIs looks like
<span class="emphasis">*http://www.example.com/DAV/home/*</span>
username<span class="emphasis">*/RDF/personal/*</span> ; the application
makes a query and a triple pattern is proven to be restrictive enough to
filter out all quads that are not similar to quads generated by the
given quad map pattern (say, the graph is constant
<span class="emphasis">*http://www.example.com/DAV/home/JohnSmith/RDF/personal/*</span>
). The application do not hope to find any quads that match the pattern
but made by other applications, because graphs named like in the pattern
are supposed to be solely for this single purpose; if, say,
DB.DBA.RDF_QUAD occasionally contains some quads with graph equal to
<span class="emphasis">*http://www.example.com/DAV/home/JohnSmith/RDF/personal/*</span>
then they can be ignored.

Under this circumstances, the quad map pattern may have
<span class="emphasis">*option (soft exclusive)*</span> . That grants a
permission to the compiler to ignore rest of storage as soon as it is
proven that the triple pattern can not access quads that does not match
the pattern. So if that is proven then the pattern is exclusive and it
makes the query faster; when unsure, the compiler work like there is no
option at all.

<div>

|                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|:----------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
|                              | The <span class="emphasis">*option (exclusive)*</span> can be used as a security measure, <span class="emphasis">*option (soft exclusive)*</span> can not. Say, if an financial application exports its data as a single graph <span class="emphasis">*http://www.example.com/front-office/cash/*</span> using <span class="emphasis">*exclusive*</span> then the query that explicitly refers to that graph will never access any quads written by the attacker into DB.DBA.RDF_QUAD using same graph IRI. The use of <span class="emphasis">*soft exclusive*</span> gives no such protection. From the compiler's perspective, the <span class="emphasis">*option (soft exclusive)*</span> is a hint that may be ignored, not an unambiguous order. |

</div>

There is one exception from the rules described above. This exception is
for <span class="emphasis">*virtrdf:DefaultQuadStorage*</span> only. If
a graph variable of a quad map pattern is not bound and no source graph
specified by <span class="emphasis">*FROM*</span> clauses then quad maps
for specific constant graphs are ignored. In other words, if a default
quad storage contains quad maps for specific graphs then the query in
that storage should explicitly specify the graph in order to use a map
for graph. This rule will not work if the default quad map is removed
from the <span class="emphasis">*virtrdf:DefaultQuadStorage*</span> .
This rule relates to the default storage itself, not to the containing
patterns; copying some or all patterns into other storage will not
reproduce there this special effect.

So for example the query from below returns results when graph is
specified i.e. when no graph is referenced, then run over physical store
only is performed:

``` programlisting
SQL>SPARQL
SELECT *
WHERE
  {
    <http://localhost:8990/Demo/categories/CategoryID/1#this>  ?p ?o
  };
p        o
VARCHAR  VARCHAR
_______________________________________________________________________________

0 Rows. -- 0 msec.

SQL>SPARQL
SELECT *
WHERE
  {
    GRAPH ?g
      {
        <http://localhost:8990/Demo/categories/CategoryID/1#this>  ?p ?o
      }
  };
g                              p                                                     o
VARCHAR                        VARCHAR                                               VARCHAR
___________________________________________________________________________________________________________________________________

http://localhost:8990/Demo#    http://www.w3.org/1999/02/22-rdf-syntax-ns#type       http://localhost:8990/schemas/Demo/Categories
http://localhost:8990/Demo#    http://localhost:8990/schemas/Demo/categoryid         1
http://localhost:8990/Demo#    http://localhost:8990/schemas/Demo/categoryname       ...
...
```

</div>
