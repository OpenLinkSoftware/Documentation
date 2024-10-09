<div>

<div>

<div>

<div>

### 16.2.10. SPARQL DESCRIBE

</div>

</div>

</div>

The SPARQL specification does not define the precise output of DESCRIBE,
so different applications may need different results for the same
subject. Some applications need quick generation of short and incomplete
results whereas others may need detailed reports composed from multiple
sources.

The supported option values for
<span class="emphasis">*sql:describe-mode*</span> are:

<div>

- <span class="emphasis">*(default)*</span>

  -- for subject-predicate-object triples of given IRI as subject plus
  subject-predicate-object triples of given IRI as object. No
  "sql:describe-mode" or define sql:describe-mode "" will set default.

- <span class="emphasis">*SPO*</span>

  -- for subject-predicate-object triples of given IRI as subject;

- <span class="emphasis">*CBD*</span>

  -- for concise bound description of given subject (i.e., SPO + CBD of
  each blank node object found by SPO, recursively);

- <span class="emphasis">*OBJCBD*</span>

  -- like CBD but traverses from objects to subjects, not from subjects
  to objects;

- In addition, user may write his/her own "postporocessing" function
  that will get the result of describe, lists of "good" and "bad"
  graphs, name of storage, options and alter it in any way he/she
  wishes. The notation is e.g. define sql:describe-mode "SPO+XYZ",
  meaning SPO describe and call DB.DBA.SPARQL_DESC_POSTPROC_XYZ on top
  of it. See below example usage.

</div>

If define <span class="emphasis">*sql:describe-mode "xxx"*</span> is
specified then the generated SQL code will use the procedures named:

``` programlisting
DB.DBA.SPARQL_DESC_DICT_xxx (in subj_dict any, in consts any, in graphs
any, in storage_name any, in options any)
```

and

``` programlisting
DB.DBA.SPARQL_DESC_DICT_xxx_PHYSICAL (in subj_dict any, in consts any,
in graphs any, in storage_name any, in options any)
```

In a new blank database, only two such pairs of procedures are created.
Procedures <span class="emphasis">*DB.DBA.SPARQL_DESC_DICT_SPO*</span>
and <span class="emphasis">*DB.DBA.SPARQL_DESC_DICT_SPO_PHYSICAL*</span>
are for <span class="emphasis">*sql:describe-mode "SPO"*</span> . This
pair of procedures searches for all triples where the input IRIs are
used as subjects; they are faster than the default routine which
searches for all triples where the input IRIs are used as subjects or
objects. Similarly,
<span class="emphasis">*DB.DBA.SPARQL_DESC_DICT_CBD*</span> and
<span class="emphasis">*DB.DBA.SPARQL_DESC_DICT_CBD_PHYSICAL*</span> are
for <span class="emphasis">*sql:describe-mode "CBD"*</span> . CBD stands
for Concise Bounded Description of given subject (i.e., SPO + CBD of
each blank node object found by SPO, recursively).

In each pair, both procedures have the same semantics but the second one
is used if and only if the SPARQL compiler can prove that all subjects
to process are from physical storage
<span class="emphasis">*(DB.DBA.RDF_QUAD)*</span> . Thus the second
procedure will not search for subjects in Linked Data Views.

Each procedure should return a dictionary with triples as keys and
integer 1 as values. So the dictionary is filled by calls like:

``` programlisting
dict_put (resulting_dict,
          vector (subj_iri_id, pred_iri_id, obj_iri_id_or_rdf_box),
          1);
```

Procedure arguments are as follows:

<div>

- <span class="emphasis">*subj_dict*</span>

  \- a dictionary whose keys are IRI IDs and maybe values of other
  types, esp. RDF boxes. Keys are subjects to be described, so values
  other than IRI IDs should usually be ignored. Values should be
  ignored.

- <span class="emphasis">*consts*</span>

  \- a vector of IRI IDs and values of other types. The items contained
  in the vector are subjects to be described, as with the keys of
  subj_dict.

- <span class="emphasis">*graphs*</span>

  \- a vector of IRI IDs of graphs that can be used for DESCRIBE. The
  vector may contain garbage, like in the two previous cases. A NULL can
  be passed instead of a vector indicating that the source graphs are
  not specified in the source query.

- <span class="emphasis">*storage_name*</span>

  \- the value of "define input:storage" from the original SPARQL query,
  NULL if missing.

- <span class="emphasis">*options*</span>

  \- reserved for future use and can be ignored.

</div>

One should grant execute permission on both procedures to SPARQL_SELECT
before referring to them in SPARQL.

<div>

<div>

<div>

<div>

#### SPARQL DESCRIBE Examples

</div>

</div>

</div>

Assume the following statements are executed:

``` programlisting
__rdf_set_bnode_t_treshold();
SET blobs ON;
SET echo ON;

SPARQL PREFIX xmp: <http://example.com/xmp/>
CLEAR GRAPH xmp:good1;

SPARQL PREFIX xmp: <http://example.com/xmp/>
CLEAR GRAPH xmp:good2;

SPARQL PREFIX xmp: <http://example.com/xmp/>
CLEAR GRAPH xmp:bad1;

SPARQL PREFIX xmp: <http://example.com/xmp/>
CLEAR GRAPH xmp:bad2;

SPARQL PREFIX xmp: <http://example.com/xmp/>
INSERT IN xmp:good1
  {
    xmp:Top1 xmp:item xmp:TheSubject .
    xmp:TheSubject xmp:details
            xmp:ChildObject ,
            ( xmp:car xmp:cadr xmp:caddr ) .
  };

SPARQL PREFIX xmp: <http://example.com/xmp/>
INSERT IN xmp:good2
  {
    xmp:Top2 xmp:items [ rdf:_1 xmp:TheSubject ; rdf:_2 xmp:OtherSubject ] .
  };
```

<div>

<div>

<div>

<div>

##### Examples SPARQL DESCRIBE -- No Option

</div>

</div>

</div>

``` programlisting
SPARQL
DEFINE output:format "NICE_TTL"
PREFIX xmp: <http://example.com/xmp/>
DESCRIBE xmp:TheSubject FROM xmp:good1 FROM xmp:good2;

fmtaggret-NICE_TTL
LONG VARCHAR
 @prefix ns0: <http://example.com/xmp/> .
 @prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
 ns0:Top1 ns0:item ns0:TheSubject .
 ns0:TheSubject ns0:details ns0:ChildObject , [ ] .
 _:vb78520012 rdf:_1 ns0:TheSubject .
```

</div>

<div>

<div>

<div>

<div>

##### Examples SPARQL DESCRIBE Option "SPO"

</div>

</div>

</div>

<span class="emphasis">*Example 1*</span>

``` programlisting
SPARQL
DEFINE output:format "NICE_TTL"
DEFINE sql:describe-mode "SPO"
PREFIX xmp: <http://example.com/xmp/>
DESCRIBE xmp:TheSubject FROM xmp:good1 FROM xmp:good2;

fmtaggret-NICE_TTL
LONG VARCHAR
 @prefix ns0: <http://example.com/xmp/> .
 ns0:TheSubject ns0:details ns0:ChildObject , [ ] .
```

<span class="emphasis">*Example 2*</span>

``` programlisting
SQL>set blobs on;
SQL>SPARQL
define sql:describe-mode "SPO"
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX sioct: <http://rdfs.org/sioc/types#>

DESCRIBE ?forum
FROM <http://demo.openlinksw.com/dataspace>
WHERE {
  ?forum rdf:type sioct:Weblog .
}
LIMIT 1;

callret-0
LONG VARCHAR
_______________________________________________________________________________

<http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://rdfs.org/sioc/types#Weblog> ,
                <http://atomowl.org/ontologies/atomrdf#Feed> ;
        <http://rdfs.org/sioc/ns#description> "XML templates demo's Weblog" ;
        <http://rdfs.org/sioc/ns#has_space> <http://demo.openlinksw.com/dataspace/bloguser/space#this> ;
        <http://rdfs.org/sioc/ns#container_of> <http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog/20> ,
                <http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog/21> ;
        <http://rdfs.org/sioc/ns#id> "bloguser_blog" ;
        <http://xmlns.com/foaf/0.1/maker> <http://demo.openlinksw.com/dataspace/person/bloguser#this> ;
        <http://rdfs.org/sioc/ns#link> <http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog> ;
        <http://atomowl.org/ontologies/atomrdf#entry> <http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog/20> ,
                <http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog/21> ;
        <http://atomowl.org/ontologies/atomrdf#contains> <http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog/21> ,
                <http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog/20> ;
        <http://atomowl.org/ontologies/atomrdf#title> "bloguser_blog" ;
        <http://www.w3.org/2000/01/rdf-schema#label> "XML templates demo's Weblog" ;
        <http://rdfs.org/sioc/ns#scope_of> <http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog#owner> ;
        <http://rdfs.org/sioc/ns#has_owner> <http://demo.openlinksw.com/dataspace/bloguser#this> ;
        <http://www.w3.org/2000/01/rdf-schema#isDefinedBy> <http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog/sioc.rdf> ;
        <http://purl.org/dc/elements/1.1/identifier> "62"^^<http://www.w3.org/2001/XMLSchema#integer> ;
        <http://rdfs.org/sioc/services#has_service> <http://demo.openlinksw.com/RPC2> ,
                <http://demo.openlinksw.com/mt-tb> ,
                <http://demo.openlinksw.com/Atom/bloguser-blog-0> ,
                <http://demo.openlinksw.com/GData/bloguser-blog-0> .
<http://demo.openlinksw.com/RPC2> <http://rdfs.org/sioc/services#service_of> <http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog> .
<http://demo.openlinksw.com/mt-tb> <http://rdfs.org/sioc/services#service_of> <http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog> .
<http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog#owner> <http://rdfs.org/sioc/ns#has_scope> <http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog> .
<http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog/20> <http://rdfs.org/sioc/ns#has_container> <http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog> ;
        <http://atomowl.org/ontologies/atomrdf#source> <http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog> .
<http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog/21> <http://rdfs.org/sioc/ns#has_container> <http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog> ;
        <http://atomowl.org/ontologies/atomrdf#source> <http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog> .
<http://demo.openlinksw.com/dataspace/bloguser#this> <http://rdfs.org/sioc/ns#owner_of> <http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog> .
<http://demo.openlinksw.com/dataspace/bloguser/space#this> <http://rdfs.org/sioc/ns#space_of> <http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog> .
<http://demo.openlinksw.com/dataspace/person/bloguser#this> <http://xmlns.com/foaf/0.1/made> <http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog> .
<http://demo.openlinksw.com/Atom/bloguser-blog-0> <http://rdfs.org/sioc/services#service_of> <http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog> .
<http://demo.openlinksw.com/GData/bloguser-blog-0> <http://rdfs.org/sioc/services#service_of> <http://demo.openlinksw.com/dataspace/bloguser/weblog/bloguser_blog> .

1 Rows. -- 240 msec.
```

</div>

<div>

<div>

<div>

<div>

##### Examples SPARQL DESCRIBE -- Option "CBD"

</div>

</div>

</div>

<span class="emphasis">*Example 1*</span>

``` programlisting
SPARQL
DEFINE output:format "NICE_TTL"
DEFINE sql:describe-mode "CBD"
PREFIX xmp: <http://example.com/xmp/>
DESCRIBE xmp:TheSubject FROM xmp:good1 FROM xmp:good2;

Query result:
fmtaggret-NICE_TTL
LONG VARCHAR
 @prefix ns0: <http://example.com/xmp/> .
 @prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
 ns0:TheSubject ns0:details ns0:ChildObject , ( ns0:car ns0:cadr ns0:caddr ) .
```

<span class="emphasis">*Example 2*</span>

``` programlisting
SPARQL
DEFINE output:format "NICE_TTL"
DEFINE sql:describe-mode "CBD"
PREFIX xmp: <http://example.com/xmp/>
DESCRIBE xmp:TheSubject  xmp:good1 from xmp:good2;
```

<span class="emphasis">*Example 2*</span>

``` programlisting
SQL>SPARQL
DEFINE sql:describe-mode "CBD"
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
DESCRIBE ?friend
WHERE
  {
    ?s foaf:knows ?friend  .
    ?friend foaf:nick ?nick.
    filter (?s=<http://www.advogato.org/person/rmorgan/foaf.rdf#me>)
}
;

@prefix rdf:    <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix ns1:    <http://www.advogato.org/person/chrisd/foaf.rdf#> .
@prefix foaf:   <http://xmlns.com/foaf/0.1/> .
ns1:me  rdf:type    foaf:Person .
@prefix rdfs:   <http://www.w3.org/2000/01/rdf-schema#> .
ns1:me  rdfs:seeAlso    <http://www.advogato.org/person/chrisd/foaf.rdf> ;
    foaf:name   "Chris DiBona" ;
    foaf:nick   "chrisd" ;
    foaf:homepage   <http://www.dibona.com> ;
    foaf:mbox_sha1sum   "e8231d19ac0d11ccbdc565485054461e5d71f0d3" .
@prefix ns4:    <http://www.advogato.org/person/schoen/foaf.rdf#> .
ns1:me  foaf:knows  ns4:me .
@prefix ns5:    <http://www.advogato.org/person/jpick/foaf.rdf#> .
ns1:me  foaf:knows  ns5:me .
@prefix ns6:    <http://www.advogato.org/person/benson/foaf.rdf#> .
ns1:me  foaf:knows  ns6:me .
@prefix ns7:    <http://www.advogato.org/person/conrad/foaf.rdf#> .
ns1:me  foaf:knows  ns7:me .
@prefix ns8:    <http://www.advogato.org/person/starshine/foaf.rdf#> .
ns1:me  foaf:knows  ns8:me .
@prefix ns9:    <http://www.advogato.org/person/chip/foaf.rdf#> .
ns1:me  foaf:knows  ns9:me .
@prefix ns10:   <http://www.advogato.org/person/crackmonkey/foaf.rdf#> .
.....
```

</div>

<div>

<div>

<div>

<div>

##### Example SPARQL DESCRIBE -- Option "OBJCBD"

</div>

</div>

</div>

<span class="emphasis">*Example 1*</span>

``` programlisting
SPARQL
DEFINE output:format "NICE_TTL"
DEFINE sql:describe-mode "OBJCBD"
PREFIX xmp: <http://example.com/xmp/>
DESCRIBE xmp:TheSubject FROM xmp:good1 FROM xmp:good2;

Query result:
fmtaggret-NICE_TTL
LONG VARCHAR
 @prefix ns0: <http://example.com/xmp/> .
 @prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
 ns0:Top1 ns0:item ns0:TheSubject .
 ns0:Top2 ns0:items [ rdf:_1 ns0:TheSubject ] .
```

</div>

<div>

<div>

<div>

<div>

##### Example SPARQL DESCRIBE -- Custom "Post Porocessing" function

</div>

</div>

</div>

``` programlisting
create function DB.DBA.SPARQL_DESC_POSTPROC_SOURCES (inout triples any array, in good_graphs any array, in bad_graphs any array, in storage varchar, in opts any array)
{
  declare triple, val, so_dict, so_lst, addon_dict, dlst any;
  dbg_obj_princ ('DB.DBA.SPARQL_DESC_POSTPROC_SOURCES (', triples, good_graphs, bad_graphs, storage, opts, ')');
  so_dict := dict_new (dict_size (triples));
  dict_iter_rewind (triples);
  while (dict_iter_next (triples, triple, val))
    {
      declare v any;
      v := triple[0];
      dict_put (so_dict, iri_to_id_nosignal (v), 1);
      v := triple[2];
      if (isiri_id (v) or (isstring (v) and box_tag (v) = 1))
        dict_put (so_dict, iri_to_id_nosignal (v), 1);
    }
  so_lst := dict_list_keys (so_dict, 1);
  foreach (any s_itm in so_lst) do
    {
      for (sparql select distinct ?g where { graph ?g {{ `iri(?:s_itm)` ?p ?o } union { ?s ?p  `iri(?:s_itm)` }} filter (<LONG::bif:position>(?g, ?:good_graphs))}) do
        dict_put (triples, vector (s_itm, iri_to_id('Source'), "g"), 1);
    }
  return triples;
}
;

SPARQL
DEFINE output:format "NICE_TTL"
DEFINE sql:describe-mode "CBD+SOURCES"
PREFIX xmp: <http://example.com/xmp/>
DESCRIBE xmp:TheSubject FROM xmp:good1 FROM xmp:good2;

SELECT sparql_to_sql_text ('
DEFINE output:format "NICE_TTL"
DEFINE sql:describe-mode "CBD+SOURCES"
PREFIX xmp: <http://example.com/xmp/>
DESCRIBE xmp:TheSubject FROM xmp:good1 FROM xmp:good2') as x long varchar;
```

</div>

</div>

</div>
