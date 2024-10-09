<div>

<div>

<div>

<div>

### 16.2.2. Query Constructs

</div>

</div>

</div>

Starting from Version 5.0, Virtuoso supports filtering RDF objects
triples by a given predicate.

<div>

<div>

<div>

<div>

#### Examples

</div>

</div>

</div>

The boolean functions bif:contains, bif:xcontains, bif:xpath_contains
and bif:xquery_contains can be used for objects that come from Linked
Data Views as well as for regular "physical" triples. Each of these
functions takes two arguments and returns a boolean value. The first
argument is a local variable which should also be used as an object
field in the group pattern where the filter condition is placed.

In order to execute the examples below please run these commands:

``` programlisting
SQL>SPARQL CLEAR GRAPH <http://MyTest.com>;
DB.DBA.RDF_QUAD_URI_L ('http://MyTest.com', 'sxml1', 'p_all1', xtree_doc ('<Hello>world</Hello>'));
DB.DBA.RDF_QUAD_URI_L ('http://MyTest.com', 'sxml2', 'p_all2', xtree_doc ('<Hello2>world</Hello2>'));
DB.DBA.RDF_QUAD_URI_L ('http://MyTest.com', 'nonxml1', 'p_all3', 'Hello world');
VT_INC_INDEX_DB_DBA_RDF_OBJ();
DB.DBA.RDF_OBJ_FT_RULE_ADD ('http://MyTest.com', null, 'My test RDF Data');
```

<span class="emphasis">*bif:contains*</span>

``` programlisting
SQL>SPARQL
SELECT *
FROM <http://MyTest.com>
WHERE { ?s ?p ?o . ?o bif:contains "world" };

s             p         o
VARCHAR       VARCHAR   VARCHAR
_______________________________________________________________________________

sxml1         p_all1    <Hello>world</Hello>
nonxml1       p_all3    Hello world
sxml2         p_all2    <Hello2>world</Hello2>

3 Rows. -- 20 msec.
```

<span class="emphasis">*bif:xcontains*</span>

``` programlisting
SQL>SPARQL
SELECT *
FROM <http://MyTest.com>
WHERE { ?s ?p ?o . ?o bif:xcontains "//Hello[text-contains (., 'world')]" };
s                  p          o
VARCHAR            VARCHAR    VARCHAR
_______________________________________________________________________________

sxml1              p_all      <Hello>world</Hello>

1 Rows. -- 10 msec.
```

<span class="emphasis">*bif:xpath_contains*</span>

``` programlisting
SQL>SPARQL
SELECT *
FROM <http://MyTest.com>
WHERE { ?s ?p ?o . ?o bif:xpath_contains "//*" };

s             p         o
VARCHAR       VARCHAR   VARCHAR
_______________________________________________________________________________

sxml1         p_all1    <Hello>world</Hello>
sxml2         p_all2    <Hello2>world</Hello2>

2 Rows. -- 20 msec.
```

<span class="emphasis">*bif:xquery_contains*</span>

``` programlisting
SQL>SPARQL
SELECT *
FROM <http://MyTest.com>
WHERE { ?s ?p ?o . ?o bif:xquery_contains "//Hello2 , world" };

s             p         o
VARCHAR       VARCHAR   VARCHAR
_______________________________________________________________________________

sxml2         p_all2    <Hello2>world</Hello2>

1 Rows. -- 20 msec.
```

</div>

</div>
