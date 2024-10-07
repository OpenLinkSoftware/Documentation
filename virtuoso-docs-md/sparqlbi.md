<div id="sparqlbi" class="section">

<div class="titlepage">

<div>

<div>

### 16.3.3. Business Intelligence Extensions for SPARQL

</div>

</div>

</div>

Virtuoso extends SPARQL with expressions in results, subqueries,
aggregates and grouping. These extensions allow a straightforward
translation of arbitrary SQL queries to SPARQL. This extension is called
"SPARQL BI", because the primary objective is to match needs of Business
Intelligence. The extended features apply equally to querying physical
quads or relational tables mapped through Linked Data Views.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
|:----------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
|                              | In this section, many examples use the TPC-H namespace. You may test them on your local demo database. They use data from the TPC-H dataset that is mapped into a graph with an IRI of the form http://example.com/tpch. When testing, you should replace the fake host name "example.com" with the host name of your own installation verbatim, that is as specified in the "DefaultHost" parameter in the \[URIQA\] section of the Virtuoso configuration file. |

</div>

<div id="rdfsparqlaggregate" class="section">

<div class="titlepage">

<div>

<div>

#### Aggregates in SPARQL

</div>

</div>

</div>

Virtuoso extends SPARQL with SQL like aggregate and "group by"
functionality. This functionality is also available by embedding SPARQL
text inside SQL, but the SPARQL extension syntax has the benefit of also
working over the SPARQL protocol and of looking more SPARQL-like.

The supported aggregates are <span class="emphasis">*COUNT*</span> ,
<span class="emphasis">*MIN*</span> ,
<span class="emphasis">*MAX*</span> ,
<span class="emphasis">*AVG*</span> and
<span class="emphasis">*SUM*</span> . These can take an optional
<span class="emphasis">*DISTINCT*</span> keyword. These are permitted
only in the selection part of a select query. If a selection list
consists of a mix of variables and aggregates, the non-aggregate
selected items are considered to be grouping columns and a
<span class="emphasis">*GROUP BY*</span> over them is implicitly added
at the end of the generated SQL query. Virtuoso also supports explicit
syntax for <span class="emphasis">*GROUP BY*</span> ,
<span class="emphasis">*ORDER BY*</span> ,
<span class="emphasis">*LIMIT*</span> and
<span class="emphasis">*OFFSET*</span> . There is no explicit syntax for
<span class="emphasis">*HAVING*</span> in Virtuoso SPARQL.

If a selection consists of aggregates exclusively, the result set has
one row with the values of the aggregates. If there are aggregates and
variables in the selection, the result set has as many rows as there are
distinct combinations of the variables; the aggregates are then
calculated over each such distinct combination, as if there were a SQL
GROUP BY over all non-aggregates. The implicit grouping pays attention
to all subexpressions in the return list; say, if a result column
expression is `(?x * max (?y))` then `?y` is aggregated and `?x` is not
so it is grouped by ?x. This also means that if a result column
expression is `(bif:year (?shipdate))` then a group is made for each
distinct `?shipdate` , i.e. up to 366 groups for each distinct year. If
you need one group per year, write explicit
`GROUP BY (bif:year (?shipdate))` .

With the count aggregate the argument may be either
<span class="emphasis">*\**</span> , meaning counting all rows, or a
variable name, meaning counting all the rows where this variable is
bound. If there is no implicit <span class="emphasis">*GROUP BY*</span>
, there can be an optional <span class="emphasis">*DISTINCT*</span>
keyword before the variable that is the argument of an aggregate.

There is a special syntax for counting distinct combinations of selected
variables. This is:

``` programlisting
SELECT COUNT DISTINCT ?v1 ... ?vn
  FROM ....
```

User-defined aggregate functions are not supported in current version of
the SPARQL compiler.

<div id="rdfsparqlaggregatepathexpressions" class="section">

<div class="titlepage">

<div>

<div>

##### Path Expressions

</div>

</div>

</div>

Virtuoso has support for paths consisting of dereferencing properties in
SPARQL. Virtuoso allows simple paths in expressions and has a separate
feature for transitivity:

<div class="itemizedlist">

- S+\>P: for "one or many values of P of S"

- S\*\>P: for "zero or many values of P of S", so \*\> may form a LEFT
  OUTER JOIN whereas +\> forms an INNER JOIN.

- S\|\>P: is reserved for potential "single value of P of S or an error
  if there are many values"

</div>

If this property is set (for example by an Linked Data View) then +\>
should be used.

<span class="emphasis">*Simple Example*</span>

``` programlisting
SELECT ?f+>foaf:name ?f|>foaf:mbox WHERE { ?x foaf:name "Alice" . ?x foaf:knows ?f . FILTER (?f+>foaf:name = "John") }
```

means:

``` programlisting
SELECT ?fname ?mbox
WHERE
  {
    ?x foaf:knows ?f .
    ?x foaf:knows ?f .
    OPTIONAL {?f foaf:mbox ?mbox} .
    ?f foaf:name ?fname .
    ?x foaf:name "Alice" .
    ?x foaf:knows ?f2 .
    ?f2 foaf:name "John" .
  }
```

<span class="emphasis">*Other Examples*</span>

``` programlisting
SPARQL
DEFINE sql:signal-void-variables 1
PREFIX tpcd: <http://www.openlinksw.com/schemas/tpcd#>
PREFIX oplsioc: <http://www.openlinksw.com/schemas/oplsioc#>
PREFIX sioc: <http://rdfs.org/sioc/ns#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
SELECT
  ?l+>tpcd:returnflag,
  ?l+>tpcd:linestatus,
  sum(?l+>tpcd:linequantity) as ?sum_qty,
  sum(?l+>tpcd:lineextendedprice) as ?sum_base_price,
  sum(?l+>tpcd:lineextendedprice*(1 - ?l+>tpcd:linediscount)) as ?sum_disc_price,
  sum(?l+>tpcd:lineextendedprice*(1 - ?l+>tpcd:linediscount)*(1+?l+>tpcd:linetax)) as ?sum_charge,
  avg(?l+>tpcd:linequantity) as ?avg_qty,
  avg(?l+>tpcd:lineextendedprice) as ?avg_price,
  avg(?l+>tpcd:linediscount) as ?avg_disc,
  count(1) as ?count_order
FROM <http://example.com/tpcd>
WHERE {
    ?l a tpcd:lineitem .
    FILTER (?l+>tpcd:shipdate <= bif:dateadd ("day", -90, '1998-12-01'^^xsd:date)) }
ORDER BY ?l+>tpcd:returnflag ?l+>tpcd:linestatus
```

``` programlisting
SPARQL
DEFINE sql:signal-void-variables 1
PREFIX tpcd: <http://www.openlinksw.com/schemas/tpcd#>
SELECT
  ?supp+>tpcd:acctbal,
  ?supp+>tpcd:name,
  ?supp+>tpcd:has_nation+>tpcd:name as ?nation_name,
  ?part+>tpcd:partkey,
  ?part+>tpcd:mfgr,
  ?supp+>tpcd:address,
  ?supp+>tpcd:phone,
  ?supp+>tpcd:comment
FROM <http://example.com/tpcd>
WHERE {
  ?ps a tpcd:partsupp; tpcd:has_supplier ?supp; tpcd:has_part ?part .
  ?supp+>tpcd:has_nation+>tpcd:has_region tpcd:name 'EUROPE' .
  ?part tpcd:size 15 .
  ?ps tpcd:supplycost ?minsc .
  { SELECT ?part min(?ps+>tpcd:supplycost) as ?minsc
    WHERE {
        ?ps a tpcd:partsupp; tpcd:has_part ?part; tpcd:has_supplier ?ms .
        ?ms+>tpcd:has_nation+>tpcd:has_region tpcd:name 'EUROPE' .
      } }
    FILTER (?part+>tpcd:type like '%BRASS') }
ORDER BY
  desc (?supp+>tpcd:acctbal)
  ?supp+>tpcd:has_nation+>tpcd:name
  ?supp+>tpcd:name
  ?part+>tpcd:partkey
```

</div>

<div id="rdfsparqlaggregateexamples" class="section">

<div class="titlepage">

<div>

<div>

##### Examples

</div>

</div>

</div>

<div id="rdfsparqlaggregateexamples1" class="section">

<div class="titlepage">

<div>

<div>

###### Example for count of physical triples in http://mygraph.com

</div>

</div>

</div>

``` programlisting
SPARQL
SELECT COUNT (*)
  FROM <http://mygraph.com>
 WHERE {?s ?p ?o}
```

<span class="emphasis">*Example for count of O's for each distinct
P*</span>

``` programlisting
SPARQL define input:inference "http://mygraph.com"
SELECT ?p COUNT (?o)
  FROM <http://mygraph.com>
 WHERE {?s ?p ?o}
```

</div>

<div id="rdfsparqlaggregateexamples2" class="section">

<div class="titlepage">

<div>

<div>

###### Example for count of triples, including inferred triples and the count of distinct O values

</div>

</div>

</div>

``` programlisting
SPARQL define input:inference "http://mygraph.com"
SELECT COUNT (?p) COUNT (?o) COUNT (DISTINCT ?o)
 FROM <http://mygraph.com>
WHERE {?s ?p ?o}
```

</div>

<div id="rdfsparqlaggregateexamples3" class="section">

<div class="titlepage">

<div>

<div>

###### Example for get number of distinct bindings of ?s ?p ?o

</div>

</div>

</div>

``` programlisting
SPARQL define input:inference "http://mygraph.com"
SELECT count distinct ?s ?p ?o
  FROM <http://mygraph.com>
 WHERE {?s ?p ?o}
```

</div>

<div id="rdfsparqlaggregateexamples4" class="section">

<div class="titlepage">

<div>

<div>

###### Example for get counts and total prices of ordered items, grouped by item status

</div>

</div>

</div>

``` programlisting
SPARQL
prefix tpch: <http://www.openlinksw.com/schemas/tpch#>
SELECT ?status count(*) sum(?extendedprice)
FROM <http://localhost.localdomain:8310/tpch>
WHERE {
    ?l a tpch:lineitem ;
      tpch:lineextendedprice ?extendedprice ;
      tpch:linestatus ?status .
  }
```

</div>

<div id="rdfsparqlaggregateexamples5" class="section">

<div class="titlepage">

<div>

<div>

###### Example for get counts and total prices of ordered items, grouped by item status

</div>

</div>

</div>

<span class="emphasis">*Example: A dataset of people, some
duplicated*</span>

Suppose there is a dataset with many people, some of them sharing the
same name. To list them we would, ideally, execute the query:

``` programlisting
SPARQL
SELECT DISTINCT
 (?name) ?person ?mail
 WHERE {
   ?person rdf:type foaf:Person .
   ?person foaf:name ?name .
   ?person foaf:mbox_sha1sum ?mail
 }
```

Unfortunately, the facility to apply DISTINCT to a part of the result
set row (i.e. to ?name) does not currently exist. (Although the above
form is permitted, it's interpreted as being identical to 'SELECT
DISTINCT ?name, ?person, ?mail WHERE ...') If there's demand for such a
feature then we may introduce an aggregate called, say, SPECIMEN, that
will return the very first of the aggregated values. e.g.:

``` programlisting
SPARQL
SELECT ?name (specimen(?person)) (specimen(?mail))
WHERE
  {
    ?person rdf:type foaf:Person .
    ?person foaf:name ?name .
    ?person foaf:mbox_sha1sum ?mail
  }
```

As a workaround to this limitation, the MIN aggregate can be used,
provided duplicates are few and there's no requirement that ?person
should correspond to ?mail (i.e. the result should contain some person
node and some mail node but they don't have to be connected by
foaf:mbox_sha1sum):

``` programlisting
SPARQL
SELECT ?name (min(?person)) (min(?mail))
WHERE
  {
    ?person rdf:type foaf:Person .
    ?person foaf:name ?name .
    ?person foaf:mbox_sha1sum ?mail
  }
```

Otherwise, a complicated query is needed:

``` programlisting
SPARQL
SELECT
 ?name
 ((SELECT (min (?person3))
     WHERE {
         ?person3 rdf:type foaf:Person .
         ?person3 foaf:name ?name .
         ?person3 foaf:mbox_sha1sum ?mail } )) as ?person
 ?mail
 WHERE {
     { SELECT distinct ?name
       WHERE {
           ?person1 rdf:type foaf:Person .
           ?person1 foaf:name ?name .
           ?person1 foaf:mbox_sha1sum ?mail1 } }
     { SELECT ?name (min(?mail2)) as ?mail
       WHERE {
           ?person2 rdf:type foaf:Person .
           ?person2 foaf:name ?name .
           ?person2 foaf:mbox_sha1sum ?mail2 } }
 }
```

</div>

<div id="rdfsparqlaggregateexamples6" class="section">

<div class="titlepage">

<div>

<div>

###### Example quering dbpedia

</div>

</div>

</div>

The following example demonstrate how to query dbpedia. Suppose there is
local onotlogy, which has a datatype property hasLocation with a string
containing city names. The query below finds which of those cities are
in dbpedia:

``` programlisting
SPARQL
PREFIX dbpprop: <http://dbpedia.org/property/>
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX vocab:<http://myexample.com/localOntology.rdf>
PREFIX dbpedia: <http://dbpedia.org/>
PREFIX dbpres: <http://dbpedia.org/resource/>
SELECT ?city
WHERE
  {
    ?sub :location ?city .
    FILTER(bif:exists(( ASK { ?subdb a dbo:City . ?subdb dbpprop:officialName ?city })))
  }
```

</div>

<div id="rdfsparqlaggregateexamples7" class="section">

<div class="titlepage">

<div>

<div>

###### Example for MAX with HAVING and GROUP BY

</div>

</div>

</div>

``` programlisting
## Example "Find which town or city in
## the UK has the largest proportion of students.

PREFIX dbpedia-owl: <http://dbpedia.org/ontology/>
PREFIX dbpedia-owl-uni: <http://dbpedia.org/ontology/University/>
PREFIX dbpedia-owl-inst: <http://dbpedia.org/ontology/EducationalInstitution/>

SELECT ?town COUNT(?uni)
       ?pgrad ?ugrad
       MAX(?population)
       ( ((?pgrad+?ugrad)/ MAX(?population))*100 ) AS ?percentage
WHERE
  {
    ?uni dbpedia-owl-inst:country dbpedia:United_Kingdom ;
                         dbpedia-owl-uni:postgrad ?pgrad ;
                        dbpedia-owl-uni:undergrad ?ugrad ;
                             dbpedia-owl-inst:city ?town .
    OPTIONAL
        {
          ?town dbpedia-owl:populationTotal ?population .
          FILTER (?population > 0 )
        }
  }
GROUP BY ?town ?pgrad ?ugrad
HAVING ( ( ( (?pgrad+?ugrad)/ MAX(?population) )*100 ) > 0 )
ORDER BY DESC 6
```

</div>

<div id="rdfsparqlaggregateexamples8" class="section">

<div class="titlepage">

<div>

<div>

###### Example Aggregating Distance Values Over Years

</div>

</div>

</div>

The following example demonstrate how to aggregate Distance Values Over
Years:

First we insert some data in a graph with name for ex.
\<urn:dates:distances\>:

``` programlisting
SQL> SPARQL INSERT INTO GRAPH <urn:dates:distances>
  {
    <:a1> <http://purl.org/dc/elements/1.1/date> <2010-12-23T00:00:00> .
    <:a1> <http://linkedgeodata.org/vocabulary#distance> <0.955218675> .
    <:a2> <http://purl.org/dc/elements/1.1/date> <2010-12-24T00:00:00> .
    <:a2> <http://linkedgeodata.org/vocabulary#distance> <0.798155989> .
    <:a3> <http://purl.org/dc/elements/1.1/date> <2010-12-25T00:00:00> .
    <:a3> <http://linkedgeodata.org/vocabulary#distance> <0.064686628> .
    <:a4> <http://purl.org/dc/elements/1.1/date> <2010-12-26T00:00:00> .
    <:a4> <http://linkedgeodata.org/vocabulary#distance> <0.279800332> .
    <:a5> <http://purl.org/dc/elements/1.1/date> <2010-12-27T00:00:00> .
    <:a5> <http://linkedgeodata.org/vocabulary#distance> <0.651255995> .
    <:a6> <http://purl.org/dc/elements/1.1/date> <2010-12-28T00:00:00> .
    <:a6> <http://linkedgeodata.org/vocabulary#distance> <0.094410557> .
    <:a7> <http://purl.org/dc/elements/1.1/date> <2010-12-29T00:00:00> .
    <:a7> <http://linkedgeodata.org/vocabulary#distance> <0.43461913> .
    <:a8> <http://purl.org/dc/elements/1.1/date> <2010-12-30T00:00:00> .
    <:a8> <http://linkedgeodata.org/vocabulary#distance> <0.264862918> .
    <:a9> <http://purl.org/dc/elements/1.1/date> <2010-12-31T00:00:00> .
    <:a9> <http://linkedgeodata.org/vocabulary#distance> <0.770588658> .
    <:a10> <http://purl.org/dc/elements/1.1/date> <2011-01-01T00:00:00> .
    <:a10> <http://linkedgeodata.org/vocabulary#distance> <0.900997627> .
    <:a11> <http://purl.org/dc/elements/1.1/date> <2011-01-02T00:00:00> .
    <:a11> <http://linkedgeodata.org/vocabulary#distance> <0.324972375> .
    <:a12> <http://purl.org/dc/elements/1.1/date> <2011-01-03T00:00:00> .
    <:a12> <http://linkedgeodata.org/vocabulary#distance> <0.937221226> .
    <:a13> <http://purl.org/dc/elements/1.1/date> <2011-01-04T00:00:00> .
    <:a13> <http://linkedgeodata.org/vocabulary#distance> <0.269511925> .
    <:a14> <http://purl.org/dc/elements/1.1/date> <2011-01-05T00:00:00> .
    <:a14> <http://linkedgeodata.org/vocabulary#distance> <0.726014538> .
    <:a15> <http://purl.org/dc/elements/1.1/date> <2011-01-06T00:00:00> .
    <:a15> <http://linkedgeodata.org/vocabulary#distance> <0.843581439> .
    <:a16> <http://purl.org/dc/elements/1.1/date> <2011-01-07T00:00:00> .
    <:a16> <http://linkedgeodata.org/vocabulary#distance> <0.835685559> .
    <:a17> <http://purl.org/dc/elements/1.1/date> <2011-01-08T00:00:00> .
    <:a17> <http://linkedgeodata.org/vocabulary#distance> <0.673213742> .
    <:a18> <http://purl.org/dc/elements/1.1/date> <2011-01-09T00:00:00> .
    <:a18> <http://linkedgeodata.org/vocabulary#distance> <0.055026879> .
    <:a19> <http://purl.org/dc/elements/1.1/date> <2011-01-10T00:00:00> .
    <:a19> <http://linkedgeodata.org/vocabulary#distance> <0.987475424> .
    <:a20> <http://purl.org/dc/elements/1.1/date> <2011-01-11T00:00:00> .
    <:a20> <http://linkedgeodata.org/vocabulary#distance> <0.167315598> .
    <:a21> <http://purl.org/dc/elements/1.1/date> <2011-01-12T00:00:00> .
    <:a21> <http://linkedgeodata.org/vocabulary#distance> <0.545317103> .
    <:a22> <http://purl.org/dc/elements/1.1/date> <2011-01-13T00:00:00> .
    <:a22> <http://linkedgeodata.org/vocabulary#distance> <0.75137005> .
    <:a23> <http://purl.org/dc/elements/1.1/date> <2011-01-14T00:00:00> .
    <:a23> <http://linkedgeodata.org/vocabulary#distance> <0.123649985> .
    <:a24> <http://purl.org/dc/elements/1.1/date> <2011-01-15T00:00:00> .
    <:a24> <http://linkedgeodata.org/vocabulary#distance> <0.750214251> .
  };
callret-0
VARCHAR
_______________________________________________________________________________

Insert into <urn:dates:distances>, 48 (or less) triples -- done

1 Rows. -- 94 msec.
```

Then we execute the following query:

``` programlisting
SQL> SPARQL
PREFIX dst: <http://linkedgeodata.org/vocabulary#>
PREFIX dc: <http://purl.org/dc/elements/1.1/>
SELECT (bif:year( bif:stringdate(?sdate)) AS ?syear) (bif:sum( bif:number(?dist)) AS ?distance)
FROM <urn:dates:distances>
WHERE
  {
    ?row dc:date ?sdate .
    ?row dst:distance ?dist
  }
GROUP BY (bif:year(bif:stringdate(?sdate)))
ORDER BY ASC(bif:year(bif:stringdate(?sdate)));

syear                                distance
VARCHAR                              VARCHAR
________________________________________________

2010                                 4.313598882
2011                                 8.891567721

2 Rows. -- 31 msec.
```

</div>

</div>

<div id="rdfsparqlaggregatenote" class="section">

<div class="titlepage">

<div>

<div>

##### Note on Aggregates and Inference

</div>

</div>

</div>

Inferencing is added to a SPARQL query only for those variables whose
value is actually used. Thus,

``` programlisting
SELECT COUNT (*)
 FROM <http://mygraph.com>
WHERE {?s ?p ?o}
```

will not return inferred values since s, p, and o are not actually used.
In contrast,

``` programlisting
SPARQL
SELECT COUNT (?s) COUNT (?p) COUNT (?o)
 FROM <http://mygraph.com>
WHERE {?s ?p ?o}
```

will also return all the inferred triples.

Note: This difference in behaviour may lead to confusion and will,
therefore, likely be altered in the future.

</div>

</div>

<div id="rdfsparqlarrowop" class="section">

<div class="titlepage">

<div>

<div>

#### Pointer Operator (<span class="emphasis">*+\>*</span> and <span class="emphasis">*\*\>*</span> )

</div>

</div>

</div>

When expressions occur in result sets, many variables are often
introduced only for the purpose of passing a value from a triple pattern
to the result expression. This is inconvenient because many triple
patterns are trivial. The presence of large numbers of variable names
masks "interesting" variables that are used in more than once in pattern
and which establish logical relationships between different parts of the
query. As a solution we introduce pointer operators.

The <span class="emphasis">*+\>*</span> (pointer) operator allows
referring to a property value without naming it as a variable and
explicitly writing a triple pattern. We can shorten the example above
to:

``` programlisting
SPARQL
prefix tpch: <http://www.openlinksw.com/schemas/tpch#>
SELECT ?l+>tpch:linestatus count(*) sum(?l+>tpch:lineextendedprice)
FROM <http://localhost.localdomain:8310/tpch>
WHERE { ?l a tpch:lineitem }
```

The <span class="emphasis">*?subject+\>propertyname*</span> notation is
equivalent to having a triple pattern <span class="emphasis">*?subject
propertyname ?aux_var*</span> binding an auxiliary variable to the
mentioned property of the subject, within the group pattern enclosing
the reference. For a SELECT, the enclosing group pattern is considered
to be the top level pattern of the where clause or, in the event of a
union, the top level of each term of the union. Each distinct pointer
adds exactly one triple pattern to the enclosing group pattern. Multiple
uses of <span class="emphasis">*+\>*</span> with the same arguments do
not each add a triple pattern. (Having multiple copies of an identical
pattern might lead to changes in cardinality if multiple input graphs
were being considered. If a lineitem had multiple discounts or extended
prices, then we would get the cartesian product of both.)

If a property referenced via <span class="emphasis">*+\>*</span> is
absent, the variable on the left side of the operator is not bound in
the enclosing group pattern because it should be bound in all triple
patterns where it appears as a field, including implicitly added
patterns.

The <span class="emphasis">*?subject\*\>propertyname*</span> notation is
introduced in order to access optional property values. It adds an
OPTIONAL group <span class="emphasis">*OPTIONAL { ?subject propertyname
?aux_var }*</span> , not a plain triple pattern, so the binding of
?subject is not changed even if the object variable is not bound. If the
property is set for all subjects in question then the results of
<span class="emphasis">*\*\>*</span> and
<span class="emphasis">*+\>*</span> are the same. All other things being
equal, the <span class="emphasis">*+\>*</span> operator produces better
SQL code than <span class="emphasis">*\*\>*</span> so use
<span class="emphasis">*\*\>*</span> only when it is really needed.

</div>

<div id="rdfsparqlnesting" class="section">

<div class="titlepage">

<div>

<div>

#### Subqueries in SPARQL

</div>

</div>

</div>

Pure SPARQL does not allow binding a value that is not retrieved through
a triple pattern. We lift this restriction by allowing expressions in
the result set and providing names for result columns. We also allow a
SPARQL SELECT statement to appear in another SPARQL statement in any
place where a group pattern may appear. The names of the result columns
form the names of the variables bound, using values from the returned
rows. This resembles derived tables in SQL.

For instance, the following statement finds the prices of the 1000 order
lines with the biggest discounts:

``` programlisting
SPARQL
define sql:signal-void-variables 1
prefix tpch: <http://www.openlinksw.com/schemas/tpch#>
SELECT ?line ?discount (?extendedprice * (1 - ?discount)) as ?finalprice
FROM <http://localhost.localdomain:8310/tpch>
WHERE
  {
    ?line a tpch:lineitem ;
    tpch:lineextendedprice ?extendedprice ;
    tpch:linediscount ?discount .
  }
ORDER BY DESC (?extendedprice * ?discount)
LIMIT 1000
```

After ensuring that this query works correctly, we can use it to answer
more complex questions. Imagine that we want to find out how big the
customers are who have received the biggest discounts.

``` programlisting
SPARQL
define sql:signal-void-variables 1
prefix tpch: <http://www.openlinksw.com/schemas/tpch#>
SELECT ?cust sum(?extendedprice2 * (1 - ?discount2)) max (?bigdiscount)
FROM <http://localhost.localdomain:8310/tpch>
WHERE
  {
    {
      SELECT ?line (?extendedprice * ?discount) as ?bigdiscount
      WHERE {
        ?line a tpch:lineitem ;
          tpch:lineextendedprice ?extendedprice ;
          tpch:linediscount ?discount . }
      ORDER BY DESC (?extendedprice * ?discount)
      LIMIT 1000
    }
    ?line tpch:has_order ?order .
    ?order tpch:has_customer ?cust .
    ?cust tpch:customer_of ?order2 .
    ?order2 tpch:order_of ?line2 .
    ?line2 tpch:lineextendedprice ?extendedprice2 ;
      tpch:linediscount ?discount2 .
  }
ORDER BY (SUM(?extendedprice2 * (1 - ?discount2)) / MAX (?bigdiscount))
```

The inner select finds the 1000 biggest (in absolute value) discounts
and their order lines. For each line we find orders of it, and the
customer. For each customer found, we find all the orders he made and
all the lines of each of the orders (variable ?line2).

Note that the inner select does not contain FROM clauses. It is not
required because the inner select inherits the access permissions of all
the outer queries. It is also important to note that the internal
variable bindings of the subquery are not visible in the outer query;
only the result set variables are bound. Similarly, variables bound in
the outer query are not accessible to the subquery.

Note also the declaration <span class="emphasis">*define
sql:signal-void-variables 1*</span> that forces the SPARQL compiler to
signal errors if some variables cannot be bound due to misspelt names or
attempts to make joins across disjoint domains. These diagnostics are
especially important when the query is long.

</div>

<div id="rdfsparqlbackq" class="section">

<div class="titlepage">

<div>

<div>

#### Expressions in Triple Patterns

</div>

</div>

</div>

In addition to expressions in filters and result sets, Virtuoso allows
the use of expressions in triples of a CONSTRUCT pattern or WHERE
pattern - an expression can be used instead of a constant or a variable
name for a subject, predicate or object. When used in this context, the
expression is surrounded by backquotes.

<span class="emphasis">*Example: With a WHERE Clause:*</span>

The following example returns all the distinct 'fragment' parts of all
subjects in all graphs that have some predicate whose value is equal to
2+2.

``` programlisting
SQL>SPARQL SELECT distinct (bif:subseq (?s, bif:strchr (?s, '#')))
   WHERE {
     graph ?g {
       ?s ?p `2+2` .
       FILTER (! bif:isnull (bif:strchr (?s, '#') ) )
     } };

callret
VARCHAR
----------
#four
```

Inside a WHERE part, every expression in a triple pattern is replaced
with new variable and a filter expression is added to the enclosing
group. The new filter is an equality of the new variable and the
expression. Hence the sample above is identical to:

``` programlisting
SPARQL
SELECT distinct (bif:subseq (?s, bif:strchr (?s, '#')))
   WHERE {
     graph ?g {
       ?s ?p ?newvariable .
       FILTER (! bif:isnull (bif:strchr (?s, '#') ) )
       FILTER (?newvariable = (2+2)) .
     } }
```

<span class="emphasis">*Example: With CONSTRUCT*</span>

``` programlisting
CONSTRUCT {
  <http://bio2rdf.org/interpro:IPR000181>
<http://bio2rdf.org/ns/bio2rdf#hasLinkCount>
`(SELECT (count(?s)) as ?countS
   WHERE { ?s ?p <http://bio2rdf.org/interpro:IPR000181> })` }
WHERE { ?s1 ?p1 ?o1 } limit 1
```

The result should be:

``` programlisting
<http://bio2rdf.org/interpro:IPR000181> <http://bio2rdf.org/ns/bio2rdf#hasLinkCount> "0"^^<http://www.w3.org/2001/XMLSchema#integer> .
```

<span class="emphasis">*Example: Inserting into a graph using an
expression*</span>

``` programlisting
SQL>SPARQL insert into graph <http://MyNewGraph.com/> {
<http://bio2rdf.org/interpro:IPR000181>
<http://bio2rdf.org/ns/bio2rdf#hasLinkCount>
  `(SELECT (count(?s)) as ?countS
    WHERE { ?s ?p <http://bio2rdf.org/interpro:IPR000181> })` }
 WHERE { ?s1 ?p1 ?o1 } limit 1  ;

callret-0
VARCHAR
_______________________________________________________________________________

Insert into <http://MyNewGraph.com/>, 1 triples -- done

1 Rows. -- 30 msec.
```

</div>

</div>
