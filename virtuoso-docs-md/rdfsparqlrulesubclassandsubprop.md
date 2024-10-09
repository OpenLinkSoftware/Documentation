<div>

<div>

<div>

<div>

### 16.14.4. Subclasses and Subproperties

</div>

</div>

</div>

Virtuoso SPARQL supports RDF Schema subclasses and subproperties.

The predicates <span class="emphasis">*rdfs:subClassOf*</span> and
<span class="emphasis">*rdfs:subPropertyOf*</span> are recognized when
they appear in graphs included in a rule set. When such a rule set is
specified as a context for a SPARQL query, the following extra triples
are generated as needed.

For every <span class="emphasis">*?s rdf:type ?class*</span> , a triple
<span class="emphasis">*?s rdf:type ?superclass*</span> is considered to
exist, such that <span class="emphasis">*?superclass*</span> is a direct
or indirect superclass of <span class="emphasis">*?class*</span> .
Direct superclasses are declared with the
<span class="emphasis">*rdfs:subClassOf*</span> predicate in the rule
set graph. Transitivity of superclasses is automatically taken into
account, meaning that if a is a superclass of b and b a superclass of c,
then a is a superclass of c also. Cyclic superclass relations are not
allowed. If such occur in the rule set data, the behavior is undefined
but will not involve unterminating recursion.

For every <span class="emphasis">*?s ?subpredicate ?o*</span> , a triple
<span class="emphasis">*?s ?superpredicate ?o*</span> is considered to
exist if the rule context declares
<span class="emphasis">*?superpredicate*</span> to be a superpredicate
of <span class="emphasis">*?predicate*</span> . This is done by having
the triple <span class="emphasis">*?subpredicate rdfs:subPropertyOf
?superpredicate*</span> as part of the graphs making up the rule
context. Transitivity is observed, thus if a is a subpredicate of b and
b a subpredicate of c, then a is also a subpredicate of c.

Two methods can be used for typical recursions, transitivity on
inference and plain transitive patterns (or subqueries).

The advantage of inference is that queries are short and one inference
rule set may be maintained for numerous queries.

If queries are about trees of classes or properties, or about
equivalences of nodes, consider using inference rule sets.

Transitive patterns are inconvenient and may easily result in queries
that runs too long or hard to debug, but they're unavoidable in
traversing social networks or plain querying of RDF lists.

So consider a rule set, a handful of nodes with classes from the rule
set and a couple of RDF Lisp-style lists defined on demo.openlinksw.com:

``` programlisting
SQL> SPARQL CLEAR GRAPH <http://example.com/2/owl>;
callret-0
VARCHAR
_______________________________________________________________________________

Clear <http://example.com/2/owl>  -- done

1 Rows. -- 0 msec.

SQL> TTLP (' @prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  .
  @prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>  .
  @prefix owl: <http://www.w3.org/2002/07/owl#>  .
  @prefix e: <http://example.com/e/>  .
  e:c1 rdfs:subClassOf e:c1or2 .
  e:c2 rdfs:subClassOf e:c1or2 .
  e:c1-10 rdfs:subClassOf e:c1 .
  e:c1-20 rdfs:subClassOf e:c1 .
  e:c2-30 rdfs:subClassOf e:c2 .
  e:c2-40 rdfs:subClassOf e:c2 .
  ', 'http://example.com/2/owl', 'http://example.com/2/owl' );

Done. -- 0 msec.
```

You can also use the SPARUL equivalent variant:

``` programlisting
SPARQL
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX e: <http://example.com/e/>

INSERT IN GRAPH <http://example.com/2/owl>
  {
    e:c1 rdfs:subClassOf e:c1or2 .
    e:c2 rdfs:subClassOf e:c1or2 .
    e:c1-10 rdfs:subClassOf e:c1 .
    e:c1-20 rdfs:subClassOf e:c1 .
    e:c2-30 rdfs:subClassOf e:c2 .
    e:c2-40 rdfs:subClassOf e:c2 .
  } ;
```

Define the inference rule:

``` programlisting
SQL> rdfs_rule_set ('http://example.com/2/owl', 'http://example.com/2/owl');

Done. -- 0 msec.

SQL> SPARQL CLEAR GRAPH <http://example.com/2/data> ;
callret-0
VARCHAR
_______________________________________________________________________________

Clear <http://example.com/2/data>  -- done

1 Rows. -- 0 msec.

SQL>  TTLP ('
  @prefix e: <http://example.com/e/>  .
  @prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  .
  @prefix owl: <http://www.w3.org/2002/07/owl#>  .
  e:s1 a e:c1 ; e:p1 "Value of p1 for s1" .
  e:s2 a e:c2 ; e:p1 "Value of p1 for s2" .
  e:s1-10 a e:c1-10 ; e:p1 "Value of p1 for s1-10" .
  e:s1-20 a e:c1-20 ; e:p1 "Value of p1 for s1-20" .
  e:s2-30 a e:c2-30 ; e:p1 "Value of p1 for s2-30" .
  e:s2-40 a e:c2-40 ; e:p1 "Value of p1 for s2-40" .
  e:lists
       rdf:_1 ( e:list1-item1 e:list1-item2 e:list1-item3 ) ;
       rdf:_2 (
           [ e:p2 "Value of p2 of item1 of list2" ; e:p3 "Value of p3 of item1 of list2" ]
           [ e:p2 "Value of p2 of item2 of list2" ; e:p3 "Value of p3 of item2 of list2" ]
           [ e:p2 "Value of p2 of item3 of list2" ; e:p3 "Value of p3 of item3 of list2" ] ) .
  ', 'http://example.com/2/data', 'http://example.com/2/data' );

Done. -- 0 msec.
```

You can also use the SPARUL equivalent variant:

``` programlisting
SPARQL
PREFIX e: <http://example.com/e/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>

INSERT IN GRAPH <http://example.com/2/data>
  {
    e:s1 a e:c1 ; e:p1 "Value of p1 for s1" .
    e:s2 a e:c2 ; e:p1 "Value of p1 for s2" .
    e:s1-10 a e:c1-10 ; e:p1 "Value of p1 for s1-10" .
    e:s1-20 a e:c1-20 ; e:p1 "Value of p1 for s1-20" .
    e:s2-30 a e:c2-30 ; e:p1 "Value of p1 for s2-30" .
    e:s2-40 a e:c2-40 ; e:p1 "Value of p1 for s2-40" .
    e:lists
      rdf:_1 ( e:list1-item1 e:list1-item2 e:list1-item3 ) ;
      rdf:_2 (
           [ e:p2 "Value of p2 of item1 of list2" ; e:p3 "Value of p3 of item1 of list2" ]
           [ e:p2 "Value of p2 of item2 of list2" ; e:p3 "Value of p3 of item2 of list2" ]
           [ e:p2 "Value of p2 of item3 of list2" ; e:p3 "Value of p3 of item3 of list2" ] )
  };
```

SPARQL DESCRIBE works fine with inference, deriving additional type
information:

``` programlisting
DEFINE input:inference <http://example.com/2/owl>
DESCRIBE <http://example.com/e/s1>
FROM <http://example.com/2/data>

fmtaggret-
LONG VARCHAR
_______________________________________________________________________________

@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  .
@prefix ns1: <http://example.com/e/>  .
ns1:s1 rdf:type ns1:c1or2 ,
ns1:c1 ;
ns1:p1 "Value of p1 for s1" .

1 Rows. -- 0 msec.
```

Example links against
<a href="http://demo.openlinksw.com/sparql" class="ulink"
target="_top">Virtuoso Demo Server SPARQL Endpoint</a> with SPARQL
Protocol URLs:

<div>

- <a
  href="http://demo.openlinksw.com/sparql?default-graph-uri=&amp;query=DEFINE+input%3Ainference+%3Chttp%3A%2F%2Fexample.com%2F2%2Fowl%3E%0D%0ADESCRIBE+%3Chttp%3A%2F%2Fexample.com%2Fe%2Fs1%3E%0D%0AFROM+%3Chttp%3A%2F%2Fexample.com%2F2%2Fdata%3E&amp;should-sponge=&amp;format=application%2Frdf%2Bxml&amp;CXML_redir_for_subjs=121&amp;CXML_redir_for_hrefs=&amp;timeout=0&amp;debug=on"
  class="ulink" target="_top">View results page</a>

- <a
  href="http://demo.openlinksw.com/sparql?default-graph-uri=&amp;qtxt=DEFINE+input%3Ainference+%3Chttp%3A%2F%2Fexample.com%2F2%2Fowl%3E%0D%0ADESCRIBE+%3Chttp%3A%2F%2Fexample.com%2Fe%2Fs1%3E%0D%0AFROM+%3Chttp%3A%2F%2Fexample.com%2F2%2Fdata%3E&amp;should-sponge=&amp;format=application%2Frdf%2Bxml&amp;CXML_redir_for_subjs=121&amp;CXML_redir_for_hrefs=&amp;timeout=0&amp;debug=on"
  class="ulink" target="_top">View editor page</a>

</div>

``` programlisting
DEFINE input:inference <http://example.com/2/owl>
DESCRIBE <http://example.com/e/s2>
FROM <http://example.com/2/data>
fmtaggret-
LONG VARCHAR
_______________________________________________________________________________

@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  .
@prefix ns1: <http://example.com/e/>  .
ns1:s2 rdf:type ns1:c1or2 ,
ns1:c2 ;
ns1:p1 "Value of p1 for s2" .

1 Rows. -- 0 msec.
```

Example links against
<a href="http://demo.openlinksw.com/sparql" class="ulink"
target="_top">Virtuoso Demo Server SPARQL Endpoint</a> with SPARQL
Protocol URLs:

<div>

- <a
  href="http://demo.openlinksw.com/sparql?default-graph-uri=&amp;query=DEFINE+input%3Ainference+%3Chttp%3A%2F%2Fexample.com%2F2%2Fowl%3E%0D%0ADESCRIBE+%3Chttp%3A%2F%2Fexample.com%2Fe%2Fs2%3E+%0D%0AFROM+%3Chttp%3A%2F%2Fexample.com%2F2%2Fdata%3E&amp;should-sponge=&amp;format=application%2Frdf%2Bxml&amp;CXML_redir_for_subjs=121&amp;CXML_redir_for_hrefs=&amp;timeout=0&amp;debug=on"
  class="ulink" target="_top">View results page</a>

- <a
  href="http://demo.openlinksw.com/sparql?default-graph-uri=&amp;qtxt=DEFINE+input%3Ainference+%3Chttp%3A%2F%2Fexample.com%2F2%2Fowl%3E%0D%0ADESCRIBE+%3Chttp%3A%2F%2Fexample.com%2Fe%2Fs2%3E+%0D%0AFROM+%3Chttp%3A%2F%2Fexample.com%2F2%2Fdata%3E&amp;should-sponge=&amp;format=application%2Frdf%2Bxml&amp;CXML_redir_for_subjs=121&amp;CXML_redir_for_hrefs=&amp;timeout=0&amp;debug=on"
  class="ulink" target="_top">View editor page</a>

</div>

Querying is simple as well:

``` programlisting
SQL>SPARQL DEFINE input:inference <http://example.com/2/owl>
PREFIX e:<http://example.com/e/>
SELECT *
FROM <http://example.com/2/data>
WHERE
  {
    ?s a e:c1or2 ;
          e:p1 ?o
  }

s                            o
VARCHAR                      VARCHAR
___________________________

http://example.com/e/s1      Value of p1 for s1
http://example.com/e/s1-10   Value of p1 for s1-10
http://example.com/e/s1-20   Value of p1 for s1-20
http://example.com/e/s2-30   Value of p1 for s2-30
http://example.com/e/s2-40   Value of p1 for s2-40
http://example.com/e/s2      Value of p1 for s2

6 Rows. -- 0 msec.
```

Example links against
<a href="http://demo.openlinksw.com/sparql" class="ulink"
target="_top">Virtuoso Demo Server SPARQL Endpoint</a> with SPARQL
Protocol URLs:

<div>

- <a
  href="http://demo.openlinksw.com/sparql?default-graph-uri=&amp;query=DEFINE+input%3Ainference+%3Chttp%3A%2F%2Fexample.com%2F2%2Fowl%3E++%0D%0APREFIX+e%3A%3Chttp%3A%2F%2Fexample.com%2Fe%2F%3E%0D%0ASELECT+*+%0D%0AFROM+%3Chttp%3A%2F%2Fexample.com%2F2%2Fdata%3E+%0D%0AWHERE+%0D%0A++%7B+%0D%0A++++%3Fs+a+e%3Ac1or2+%3B+%0D%0A++++++++++e%3Ap1+%3Fo+%0D%0A++%7D&amp;should-sponge=&amp;format=text%2Fhtml&amp;CXML_redir_for_subjs=121&amp;CXML_redir_for_hrefs=&amp;timeout=0&amp;debug=on"
  class="ulink" target="_top">View results page</a>

- <a
  href="http://demo.openlinksw.com/sparql?default-graph-uri=&amp;qtxt=DEFINE+input%3Ainference+%3Chttp%3A%2F%2Fexample.com%2F2%2Fowl%3E++%0D%0APREFIX+e%3A%3Chttp%3A%2F%2Fexample.com%2Fe%2F%3E%0D%0ASELECT+*+%0D%0AFROM+%3Chttp%3A%2F%2Fexample.com%2F2%2Fdata%3E+%0D%0AWHERE+%0D%0A++%7B+%0D%0A++++%3Fs+a+e%3Ac1or2+%3B+%0D%0A++++++++++e%3Ap1+%3Fo+%0D%0A++%7D&amp;should-sponge=&amp;format=text%2Fhtml&amp;CXML_redir_for_subjs=121&amp;CXML_redir_for_hrefs=&amp;timeout=0&amp;debug=on"
  class="ulink" target="_top">View editor page</a>

</div>

``` programlisting
SQL>SPARQL DEFINE input:inference <http://example.com/2/owl>
PREFIX e:<http://example.com/e/>
SELECT * FROM <http://example.com/2/data>
WHERE
  {
    ?s a e:c1 ;
       e:p1 ?o
  }

s                            o
VARCHAR                      VARCHAR
___________________________

http://example.com/e/s1      Value of p1 for s1
http://example.com/e/s1-10   Value of p1 for s1-10
http://example.com/e/s1-20   Value of p1 for s1-20

3 Rows. -- 0 msec.
```

Example links against
<a href="http://demo.openlinksw.com/sparql" class="ulink"
target="_top">Virtuoso Demo Server SPARQL Endpoint</a> with SPARQL
Protocol URLs:

<div>

- <a
  href="http://demo.openlinksw.com/sparql?default-graph-uri=&amp;query=DEFINE+input%3Ainference+%3Chttp%3A%2F%2Fexample.com%2F2%2Fowl%3E++%0D%0APREFIX+e%3A%3Chttp%3A%2F%2Fexample.com%2Fe%2F%3E%0D%0ASELECT+*+FROM+%3Chttp%3A%2F%2Fexample.com%2F2%2Fdata%3E++%0D%0AWHERE+%0D%0A++%7B+%0D%0A++++%3Fs+a+e%3Ac1+%3B+%0D%0A+++++++e%3Ap1+%3Fo+%0D%0A++%7D&amp;should-sponge=&amp;format=text%2Fhtml&amp;CXML_redir_for_subjs=121&amp;CXML_redir_for_hrefs=&amp;timeout=0&amp;debug=on"
  class="ulink" target="_top">View results page</a>

- <a
  href="http://demo.openlinksw.com/sparql?default-graph-uri=&amp;qtxt=DEFINE+input%3Ainference+%3Chttp%3A%2F%2Fexample.com%2F2%2Fowl%3E++%0D%0APREFIX+e%3A%3Chttp%3A%2F%2Fexample.com%2Fe%2F%3E%0D%0ASELECT+*+FROM+%3Chttp%3A%2F%2Fexample.com%2F2%2Fdata%3E++%0D%0AWHERE+%0D%0A++%7B+%0D%0A++++%3Fs+a+e%3Ac1+%3B+%0D%0A+++++++e%3Ap1+%3Fo+%0D%0A++%7D&amp;should-sponge=&amp;format=text%2Fhtml&amp;CXML_redir_for_subjs=121&amp;CXML_redir_for_hrefs=&amp;timeout=0&amp;debug=on"
  class="ulink" target="_top">View editor page</a>

</div>

However you should care about duplicates if both types and properties
are queried: the join will result in all combinations of types and
property values.

``` programlisting
SQL>SPARQL DEFINE input:inference <http://example.com/2/owl>
PREFIX e:<http://example.com/e/>
SELECT * FROM <http://example.com/2/data>
WHERE
  {
    ?s a ?t ;
     e:p1 ?o
  }

s                            t                            o
VARCHAR                      VARCHAR                      VARCHAR
___________________________

http://example.com/e/s1      http://example.com/e/c1      Value of p1 for s1
http://example.com/e/s1      http://example.com/e/c1or2   Value of p1 for s1
http://example.com/e/s1-10   http://example.com/e/c1-10   Value of p1 for s1-10
http://example.com/e/s1-10   http://example.com/e/c1      Value of p1 for s1-10
http://example.com/e/s1-10   http://example.com/e/c1or2   Value of p1 for s1-10
http://example.com/e/s1-20   http://example.com/e/c1-20   Value of p1 for s1-20
http://example.com/e/s1-20   http://example.com/e/c1      Value of p1 for s1-20
http://example.com/e/s1-20   http://example.com/e/c1or2   Value of p1 for s1-20
http://example.com/e/s2-30   http://example.com/e/c2-30   Value of p1 for s2-30
http://example.com/e/s2-30   http://example.com/e/c2      Value of p1 for s2-30
http://example.com/e/s2-30   http://example.com/e/c1or2   Value of p1 for s2-30
http://example.com/e/s2-40   http://example.com/e/c2-40   Value of p1 for s2-40
http://example.com/e/s2-40   http://example.com/e/c2      Value of p1 for s2-40
http://example.com/e/s2-40   http://example.com/e/c1or2   Value of p1 for s2-40
http://example.com/e/s2      http://example.com/e/c2      Value of p1 for s2
http://example.com/e/s2      http://example.com/e/c1or2   Value of p1 for s2

16 Rows. -- 0 msec.
```

Example links against
<a href="http://demo.openlinksw.com/sparql" class="ulink"
target="_top">Virtuoso Demo Server SPARQL Endpoint</a> with SPARQL
Protocol URLs:

<div>

- <a
  href="http://demo.openlinksw.com/sparql?default-graph-uri=&amp;query=DEFINE+input%3Ainference+%3Chttp%3A%2F%2Fexample.com%2F2%2Fowl%3E++%0D%0APREFIX+e%3A%3Chttp%3A%2F%2Fexample.com%2Fe%2F%3E%0D%0ASELECT+*+FROM+%3Chttp%3A%2F%2Fexample.com%2F2%2Fdata%3E++%0D%0AWHERE+%0D%0A++%7B+%0D%0A++++%3Fs+a+%3Ft+%3B+%0D%0A+++++e%3Ap1+%3Fo+%0D%0A++%7D&amp;should-sponge=&amp;format=text%2Fhtml&amp;CXML_redir_for_subjs=121&amp;CXML_redir_for_hrefs=&amp;timeout=0&amp;debug=on"
  class="ulink" target="_top">View results page</a>

- <a
  href="http://demo.openlinksw.com/sparql?default-graph-uri=&amp;qtxt=DEFINE+input%3Ainference+%3Chttp%3A%2F%2Fexample.com%2F2%2Fowl%3E++%0D%0APREFIX+e%3A%3Chttp%3A%2F%2Fexample.com%2Fe%2F%3E%0D%0ASELECT+*+FROM+%3Chttp%3A%2F%2Fexample.com%2F2%2Fdata%3E++%0D%0AWHERE+%0D%0A++%7B+%0D%0A++++%3Fs+a+%3Ft+%3B+%0D%0A+++++e%3Ap1+%3Fo+%0D%0A++%7D&amp;should-sponge=&amp;format=text%2Fhtml&amp;CXML_redir_for_subjs=121&amp;CXML_redir_for_hrefs=&amp;timeout=0&amp;debug=on"
  class="ulink" target="_top">View editor page</a>

</div>

Transitive queries are convenient as SPARQL 1.1 "predicate+" equivalent.
The equivalent of "predicate\*" requires the use of a union:

``` programlisting
SQL>SPARQL PREFIX e:<http://example.com/e/>
SELECT ?item
FROM <http://example.com/2/data>
WHERE
  {
    {
      ?lists rdf:_1 ?node
    }
    UNION
    {
      ?lists rdf:_1 ?l .
      ?l rdf:rest ?node option (transitive) .
    }
    ?node rdf:first ?item
  }

item
VARCHAR
_______________________________________________________________________________

http://example.com/e/list1-item1
http://example.com/e/list1-item2
http://example.com/e/list1-item3

3 Rows. -- 0 msec.
```

Example links against
<a href="http://demo.openlinksw.com/sparql" class="ulink"
target="_top">Virtuoso Demo Server SPARQL Endpoint</a> with SPARQL
Protocol URLs:

<div>

- <a
  href="http://demo.openlinksw.com/sparql?default-graph-uri=&amp;query=PREFIX+e%3A%3Chttp%3A%2F%2Fexample.com%2Fe%2F%3E%0D%0ASELECT+%3Fitem+%0D%0AFROM+%3Chttp%3A%2F%2Fexample.com%2F2%2Fdata%3E++%0D%0AWHERE+%0D%0A++%7B%0D%0A++++%7B+%0D%0A++++++%3Flists+rdf%3A_1+%3Fnode+%0D%0A++++%7D%0D%0A++++UNION%0D%0A++++%7B+%0D%0A++++++%3Flists+rdf%3A_1+%3Fl+.%0D%0A++++++%3Fl+rdf%3Arest+%3Fnode+option+%28transitive%29+.+%0D%0A++++%7D%0D%0A++++%3Fnode+rdf%3Afirst+%3Fitem+%0D%0A++%7D&amp;should-sponge=&amp;format=text%2Fhtml&amp;CXML_redir_for_subjs=121&amp;CXML_redir_for_hrefs=&amp;timeout=0&amp;debug=on"
  class="ulink" target="_top">View results page</a>

- <a
  href="http://demo.openlinksw.com/sparql?default-graph-uri=&amp;qtxt=PREFIX+e%3A%3Chttp%3A%2F%2Fexample.com%2Fe%2F%3E%0D%0ASELECT+%3Fitem+%0D%0AFROM+%3Chttp%3A%2F%2Fexample.com%2F2%2Fdata%3E++%0D%0AWHERE+%0D%0A++%7B%0D%0A++++%7B+%0D%0A++++++%3Flists+rdf%3A_1+%3Fnode+%0D%0A++++%7D%0D%0A++++UNION%0D%0A++++%7B+%0D%0A++++++%3Flists+rdf%3A_1+%3Fl+.%0D%0A++++++%3Fl+rdf%3Arest+%3Fnode+option+%28transitive%29+.+%0D%0A++++%7D%0D%0A++++%3Fnode+rdf%3Afirst+%3Fitem+%0D%0A++%7D&amp;should-sponge=&amp;format=text%2Fhtml&amp;CXML_redir_for_subjs=121&amp;CXML_redir_for_hrefs=&amp;timeout=0&amp;debug=on"
  class="ulink" target="_top">View editor page</a>

</div>

``` programlisting
SQL> SPARQL PREFIX e:<http://example.com/e/>
SELECT ?p ?o
FROM <http://example.com/2/data>
WHERE
  {
    {
      ?lists rdf:_2 ?node
    }
    UNION
    {
      ?lists rdf:_2 ?l .
      ?l rdf:rest ?node option (transitive) .
    }
    ?node rdf:first ?item .
    ?item ?p ?o
  }

p                         o
VARCHAR                   VARCHAR
________________________

http://example.com/e/p2   Value of p2 of item1 of list2
http://example.com/e/p3   Value of p3 of item1 of list2
http://example.com/e/p2   Value of p2 of item2 of list2
http://example.com/e/p3   Value of p3 of item2 of list2
http://example.com/e/p2   Value of p2 of item3 of list2
http://example.com/e/p3   Value of p3 of item3 of list2

6 Rows. -- 0 msec.
```

Example links against
<a href="http://demo.openlinksw.com/sparql" class="ulink"
target="_top">Virtuoso Demo Server SPARQL Endpoint</a> with SPARQL
Protocol URLs:

<div>

- <a
  href="http://demo.openlinksw.com/sparql?default-graph-uri=&amp;query=PREFIX+e%3A%3Chttp%3A%2F%2Fexample.com%2Fe%2F%3E%0D%0ASELECT+%3Fp+%3Fo+%0D%0AFROM+%3Chttp%3A%2F%2Fexample.com%2F2%2Fdata%3E++%0D%0AWHERE+%0D%0A++%7B%0D%0A++++%7B+%0D%0A++++++%3Flists+rdf%3A_2+%3Fnode+%0D%0A++++%7D%0D%0A++++UNION%0D%0A++++%7B+%0D%0A++++++%3Flists+rdf%3A_2+%3Fl+.%0D%0A++++++%3Fl+rdf%3Arest+%3Fnode+option+%28transitive%29+.+%0D%0A++++%7D%0D%0A++++%3Fnode+rdf%3Afirst+%3Fitem+.%0D%0A++++%3Fitem+%3Fp+%3Fo+%0D%0A++%7D&amp;should-sponge=&amp;format=text%2Fhtml&amp;CXML_redir_for_subjs=121&amp;CXML_redir_for_hrefs=&amp;timeout=0&amp;debug=on"
  class="ulink" target="_top">View results page</a>

- <a
  href="http://demo.openlinksw.com/sparql?default-graph-uri=&amp;qtxt=PREFIX+e%3A%3Chttp%3A%2F%2Fexample.com%2Fe%2F%3E%0D%0ASELECT+%3Fp+%3Fo+%0D%0AFROM+%3Chttp%3A%2F%2Fexample.com%2F2%2Fdata%3E++%0D%0AWHERE+%0D%0A++%7B%0D%0A++++%7B+%0D%0A++++++%3Flists+rdf%3A_2+%3Fnode+%0D%0A++++%7D%0D%0A++++UNION%0D%0A++++%7B+%0D%0A++++++%3Flists+rdf%3A_2+%3Fl+.%0D%0A++++++%3Fl+rdf%3Arest+%3Fnode+option+%28transitive%29+.+%0D%0A++++%7D%0D%0A++++%3Fnode+rdf%3Afirst+%3Fitem+.%0D%0A++++%3Fitem+%3Fp+%3Fo+%0D%0A++%7D&amp;should-sponge=&amp;format=text%2Fhtml&amp;CXML_redir_for_subjs=121&amp;CXML_redir_for_hrefs=&amp;timeout=0&amp;debug=on"
  class="ulink" target="_top">View editor page</a>

</div>

Note that the result set can be in order of items in the list, but it
don't have to. If the order should be preserved, then fix the direction
of transitive scan, get step number as a variable, order by that
variable.

``` programlisting
-- Line 82:
SQL> SPARQL PREFIX e:<http://example.com/e/>
SELECT ?p ?o bif:coalesce(?step_no, 0)
FROM <http://example.com/2/data>
WHERE
  {
    {
      ?lists rdf:_2 ?node
    }
    UNION
    {
      ?lists rdf:_2 ?l .
      ?l rdf:rest ?node OPTION (transitive, t_direction 1, t_step("step_no") as ?step_no) .
    }
    ?node rdf:first ?item .
    ?item ?p ?o
  }
ORDER BY ASC (?step_no)

p                         o                               callret-2
VARCHAR                   VARCHAR                         VARCHAR
________________________

http://example.com/e/p2   Value of p2 of item1 of list2   0
http://example.com/e/p3   Value of p3 of item1 of list2   0
http://example.com/e/p2   Value of p2 of item2 of list2   1
http://example.com/e/p3   Value of p3 of item2 of list2   1
http://example.com/e/p2   Value of p2 of item3 of list2   2
http://example.com/e/p3   Value of p3 of item3 of list2   2

6 Rows. -- 7 msec.
```

Example links against
<a href="http://demo.openlinksw.com/sparql" class="ulink"
target="_top">Virtuoso Demo Server SPARQL Endpoint</a> with SPARQL
Protocol URLs:

<div>

- <a
  href="http://demo.openlinksw.com/sparql?default-graph-uri=&amp;query=PREFIX+e%3A%3Chttp%3A%2F%2Fexample.com%2Fe%2F%3E%0D%0ASELECT+%3Fp+%3Fo+bif%3Acoalesce%28%3Fstep_no%2C+0%29+%0D%0AFROM+%3Chttp%3A%2F%2Fexample.com%2F2%2Fdata%3E++%0D%0AWHERE+%0D%0A++%7B%0D%0A++++%7B+%0D%0A++++++%3Flists+rdf%3A_2+%3Fnode+%0D%0A++++%7D%0D%0A++++UNION%0D%0A++++%7B+%0D%0A++++++%3Flists+rdf%3A_2+%3Fl+.%0D%0A++++++%3Fl+rdf%3Arest+%3Fnode+OPTION+%28transitive%2C+t_direction+1%2C+t_step%28%22step_no%22%29+as+%3Fstep_no%29+.+%0D%0A++++%7D%0D%0A++++%3Fnode+rdf%3Afirst+%3Fitem+.%0D%0A++++%3Fitem+%3Fp+%3Fo+%0D%0A++%7D+%0D%0AORDER+BY+ASC+%28%3Fstep_no%29%0D%0A&amp;should-sponge=&amp;format=text%2Fhtml&amp;CXML_redir_for_subjs=121&amp;CXML_redir_for_hrefs=&amp;timeout=0&amp;debug=on"
  class="ulink" target="_top">View results page</a>

- <a
  href="http://demo.openlinksw.com/sparql?default-graph-uri=&amp;qtxt=PREFIX+e%3A%3Chttp%3A%2F%2Fexample.com%2Fe%2F%3E%0D%0ASELECT+%3Fp+%3Fo+bif%3Acoalesce%28%3Fstep_no%2C+0%29+%0D%0AFROM+%3Chttp%3A%2F%2Fexample.com%2F2%2Fdata%3E++%0D%0AWHERE+%0D%0A++%7B%0D%0A++++%7B+%0D%0A++++++%3Flists+rdf%3A_2+%3Fnode+%0D%0A++++%7D%0D%0A++++UNION%0D%0A++++%7B+%0D%0A++++++%3Flists+rdf%3A_2+%3Fl+.%0D%0A++++++%3Fl+rdf%3Arest+%3Fnode+OPTION+%28transitive%2C+t_direction+1%2C+t_step%28%22step_no%22%29+as+%3Fstep_no%29+.+%0D%0A++++%7D%0D%0A++++%3Fnode+rdf%3Afirst+%3Fitem+.%0D%0A++++%3Fitem+%3Fp+%3Fo+%0D%0A++%7D+%0D%0AORDER+BY+ASC+%28%3Fstep_no%29%0D%0A&amp;should-sponge=&amp;format=text%2Fhtml&amp;CXML_redir_for_subjs=121&amp;CXML_redir_for_hrefs=&amp;timeout=0&amp;debug=on"
  class="ulink" target="_top">View editor page</a>

</div>

</div>
