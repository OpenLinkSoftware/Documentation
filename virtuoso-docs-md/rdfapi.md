<div>

<div>

<div>

<div>

### 16.2.6. API Functions

</div>

</div>

</div>

SPARQL can be used inline wherever SQL can be used. The only API
functions that one needs to know are the ones for loading RDF data into
the store. Dynamic SQL client applications can issue SPARQL queries
against Virtuoso through the regular SQL client API, ODBC, JDBC or any
other supported API, simply by prefixing the SPARQL query with the
SPARQL keyword. Parameters work just as with dynamic SQL. Stored
procedures can have SPARQL expressions inline and can declare cursors
over SPARQL result sets.

Value conversions between SQL and SPARQL are most often automatic and
invisible. In some cases one needs to be aware of the different SPARQL
value representations (valmodes). SPARQL offers declarations for
specifying whether returned graphs are to be serialized as XML or
Turtle, or whether these will be hash tables of triples. See
<a href="fn_dict_new.html" class="link" title="dict_new"><code
class="function">dict_new()</code></a> and related functions for a
description of the hash table SQL data type. The use of dict's is
convenient for further programmatic processing of graphs.

RDF-related procedures use Virtuoso/PL vectors and dictionaries to
represent RDF triples and sets of triples.

<span class="emphasis">*Valmode*</span> means the "format of values
returned by an expression", i.e. 'short', 'long' or 'SQL value'.

<span class="emphasis">*Triple vector*</span> is a vector (array) of S,
P and O, where all values are in 'long' formats, i.e. IRI_ID's for IRI
values, numbers or datetimes for corresponding XMLSchema types, special
"RDF box" objects if O is neither string nor IRI.

<span class="emphasis">*Dictionary of triples*</span> or
<span class="emphasis">*Hash table of triples*</span> is an dictionary
object made by the SQL function <span class="emphasis">*dict_new
()*</span> whose keys are triple vectors and values are not specified;
this is a good storage format for an unordered set of distinct triples.

<span class="emphasis">*Dictionary of blank node names*</span> is a
dictionary used for tricky processing of a number of TURTLE or RDF /XML
descriptions of subgraphs that come from a common graph. Imagine a
situation where different descriptions actually refer to the same blank
nodes of the original graph and, moreover, the application that
generates these descriptions always generates the same blank node id
string for the same node. A reader of descriptions can correctly join
described subgraphs into one big subgraph by filling in a dictionary
that contains blank node id strings as keys and IRI_ID's assigned to
those strings as dependent data. The sharing of the same node dictionary
by all readers of an application will ensure that no blank node is
duplicated.

<div>

<div>

<div>

<div>

#### Data Import

</div>

</div>

</div>

<div>

<div>

<div>

<div>

##### Using TTLP

</div>

</div>

</div>

DB.DBA.TTLP() parses TTL (TURTLE or N3 resource) and places its triples
into DB.DBA.RDF_QUAD.

``` programlisting
create procedure DB.DBA.TTLP (
    in strg any,       -- text of the resource
    in base varchar,   -- base IRI to resolve relative IRIs to absolute
    in graph varchar, -- target graph IRI, parsed triples will appear in that graph.
    in flags int)   -- bitmask of flags that permit some sorts of syntax errors in resource, use 0.
```

For loading a file of any great length, it is more practical to use the
file_to_string_output function.

It is important the file be accessible to the Virtuoso server. You need
to have set properly set the <span class="emphasis">*DirsAllowed*</span>
parameter value in the section \[Parameters\] of the Virtuoso database
INI file. For example on Windows it could be:

``` programlisting
virtuoso.ini file:
[Parameters]
...
DirsAllowed =  .\tmp
...
```

So, in the example, the file you want to import from, should be in the
tmp folder or in a subfolder. Note that this example folder is a
subfolder of the Virtuoso Server working directory.

``` programlisting
SQL> DB.DBA.TTLP (file_to_string_output ('.\tmp\data.ttl'), '', 'http://my_graph', 0);
```

</div>

<div>

<div>

<div>

<div>

##### Using TTLP_MT

</div>

</div>

</div>

The DB.DBA.TTLP_MT() procedure is like DB.DBA.TTLP() but loads the file
on multiple threads, using parallel I/O and multiprocessing if
available. The function does not leave a transaction log. Hence, after a
successful load, one should execute the checkpoint statement to make
sure that a server restart does not wipe out the results.

``` programlisting
create procedure DB.DBA.TTLP_MT (
    in strg any,       -- text of the resource
    in base varchar,   -- base IRI to resolve relative IRIs to absolute
    in graph varchar,  -- target graph IRI, parsed triples will appear in that graph.
    in flags int) -- flags, use 0
```

</div>

<div>

<div>

<div>

<div>

##### Using RDF_LOAD_RDFXML_MT

</div>

</div>

</div>

For loading large resources when transactional integrity is not
important (loading of a single resource may take more than one
transaction) you can use also the
<span class="emphasis">*DB.DBA.RDF_LOAD_RDFXML_MT()*</span> procedure:

``` programlisting
create procedure DB.DBA.RDF_LOAD_RDFXML_MT (
    in strg varchar,  -- text of the resource
    in base varchar,  -- base IRI to resolve relative IRIs to absolute
    in graph varchar) -- target graph IRI, parsed triples will appear in that graph.
```

The following example demonstrates importing data from the RDF resource
with URI: http://www.w3.org/People/Berners-Lee/card

``` programlisting
SQL>create procedure MY_LOAD_FILE (in full_uri varchar, in in_resultset integer := 0)
{
  declare REPORT varchar;
  declare graph_uri, dattext varchar;
  declare app_env any;
  app_env := null;
  whenever sqlstate '*' goto err_rep;
  if (not in_resultset)
    result_names (REPORT);
  dattext := cast (XML_URI_GET_AND_CACHE (full_uri) as varchar);
  MY_SPARQL_REPORT (sprintf ('Downloading %s: %d bytes',
      full_uri, length (dattext) ) );
  graph_uri := full_uri;
  DELETE FROM RDF_QUAD WHERE G = DB.DBA.RDF_MAKE_IID_OF_QNAME (graph_uri);
  DB.DBA.RDF_LOAD_RDFXML_MT (dattext, full_uri, graph_uri);
  return graph_uri;
err_rep:
  result (sprintf ('%s: %s', __SQL_STATE, __SQL_MESSAGE));
  return graph_uri;
}
;

Done. -- 0 msec.

SQL>create procedure MY_SPARQL_REPORT(in strg varchar)
{
  if (__tag(strg) <> 182)
    strg := cast (strg as varchar) || sprintf (' -- not a string, tag=%d', __tag(strg));
  strg := replace (strg, 'SPARQL_DAV_DATA_URI()', '\044{SPARQL_DAV_DATA_URI()}');
  strg := replace (strg, 'SPARQL_DAV_DATA_PATH()', '\044{SPARQL_DAV_DATA_PATH()}');
  strg := replace (strg, 'SPARQL_FILE_DATA_ROOT()', '\044{SPARQL_FILE_DATA_ROOT()}');
  result (strg);
}
;

Done. -- 0 msec.

SQL> MY_LOAD_FILE('http://www.w3.org/People/Berners-Lee/card');
REPORT
VARCHAR
_______________________________________________________________________________

Downloading http://www.w3.org/People/Berners-Lee/card: 17773 bytes

1 Rows. -- 4046 msec.

SQL>SPARQL
SELECT *
FROM <http://www.w3.org/People/Berners-Lee/card>
WHERE {?s ?p ?o} ;

s                                             p                                               o
VARCHAR                                       VARCHAR                                         VARCHAR
__________________________________________________________________________________________________________

http://bblfish.net/people/henry/card#me       http://xmlns.com/foaf/0.1/name                  Henry Story
http://www.w3.org/People/Berners-Lee/card#i   http://www.w3.org/1999/02/22-rdf-syntax-ns#type http://xmlns.com/foaf/0.1/Person
http://www.w3.org/People/Berners-Lee/card#i   http://www.w3.org/1999/02/22-rdf-syntax-ns#type http://www.w3.org/2000/10/swap/pim/contact#Male
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/nick                  TimBL
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/nick                  timbl
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/mbox                  mailto:timbl@w3.org
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/mbox_sha1sum          965c47c5a70db7407210cef6e4e6f5374a525c5c
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/knows                 http://bblfish.net/people/henry/card#me
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/knows                 http://hometown.aol.com/chbussler/foaf/chbussler.foaf#me
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/knows                 http://danbri.org/foaf#danbri
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/knows                 http://norman.walsh.name/knows/who#norman-walsh
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/knows                 http://www.aaronsw.com/about.xrdf#aaronsw
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/knows                 http://www.ivan-herman.net/foaf.rdf#me
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/knows                 http://www.w3.org/People/Berners-Lee/card#amy
http://www.w3.org/People/Berners-Lee/card#i   http://xmlns.com/foaf/0.1/knows                 http://dig.csail.mit.edu/People/RRS
..........
```

</div>

<div>

<div>

<div>

<div>

##### Using RDF_TTL2HASH

</div>

</div>

</div>

The DB.DBA.RDF_TTL2HASH() does not load TTL content, instead it returns
a dictionary of triples in 'long valmode'.

``` programlisting
create function DB.DBA.RDF_TTL2HASH (
    in strg any,
    in base varchar,
    in graph varchar ) returns any
```

Parameter <span class="emphasis">*flags*</span> is useful when the
syntax of the resource is TURTLE-like, but not correct TURTLE. By
default, use zero value. Add 1 to let string literals contain
end-of-line characters. Add 2 to suppress error messages on blank node
verbs. Add 4 to allow variables instead of blank nodes. Add 8 to
silently skip triples with literal subjects.

</div>

<div>

<div>

<div>

<div>

##### Using RDF_LOAD_RDFXML

</div>

</div>

</div>

The DB.DBA.RDF_LOAD_RDFXML() procedure parses RDF/XML and places its
triples into DB.DBA.RDF_QUAD.

``` programlisting
create procedure DB.DBA.RDF_LOAD_RDFXML (
    in strg any,           -- text of and XML document
    in base_iri varchar,   -- base IRI to resolve relative IRIs
    in graph_iri varchar ) -- the IRI of destination graph
```

See <a href="sparqlextensions.html#rdfsparqlrulespecifywhatindexexample"
class="link" title="Example">example</a> .

</div>

<div>

<div>

<div>

<div>

##### Using RDF_QUAD_URI, RDF_QUAD_URI_L and RDF_QUAD_URI_L_TYPED

</div>

</div>

</div>

To insert a single quad into DB.DBA.RDF_QUAD() table, use one of these
procedures:

``` programlisting
-- Simple insertion of a quad where the object is a node
create procedure DB.DBA.RDF_QUAD_URI (
  in g_uri varchar, in s_uri varchar, in p_uri varchar,
  in o_uri varchar ) -- IRI string or IRI_ID

-- Simple insertion of a quad where the object is a literal value in 'SQL valmode'
create procedure DB.DBA.RDF_QUAD_URI_L (
  in g_uri varchar, in s_uri varchar, in p_uri varchar,
  in o_lit any ) -- string, number or datetime, NULL is not allowed

create procedure DB.DBA.RDF_QUAD_URI_L_TYPED (
  in g_uri varchar, in s_uri varchar, in p_uri varchar,
  in o_lit any,     -- string value of the literal
  in dt any,        -- datatype as IRI string or IRI_ID, can be NULL
  in lang varchar ) -- language as string or NULL
```

Arguments g_uri, s_uri and p_uri of these three functions should be IRI
strings or IRI_IDs. All string arguments should be in UTF-8 encoding,
otherwise they will be stored but are not queryable via SPARQL.

</div>

</div>

<div>

<div>

<div>

<div>

#### Data Export

</div>

</div>

</div>

These two procedures serialize a vector of triples into a session, in
TURTLE or RDF/XML syntax. In their current versions, every triple is
printed in a separate top-level record (say, in an rdf:Description tag),
without any pretty-printing or nesting optimization.

``` programlisting
create procedure DB.DBA.RDF_TRIPLES_TO_TTL (
    inout triples any, -- vector of triples in 'long valmode'.
    inout ses any )    -- an output stream in server default encoding

create procedure DB.DBA.RDF_TRIPLES_TO_RDF_XML_TEXT (
    inout triples any,          -- vector of triples in 'long valmode'.
    in print_top_level integer, -- zero if only rdf:Description tags should be written,
                                -- non-zero if the rdf:RDF top-level element should also be written
    inout ses any )             -- an output stream in server default encoding
```

</div>

<div>

<div>

<div>

<div>

#### Data query

</div>

</div>

</div>

``` programlisting
-- Local execution of SPARQL via SPARQL protocol, produces a result set of SQL values.
create procedure DB.DBA.SPARQL_EVAL (
    in query varchar,      -- text of SPARQL query to execute
    in dflt_graph varchar, -- default graph IRI, if not NULL then this overrides what's specified in query
    in maxrows integer )   -- limit on numbers of rows that should be returned.

-- Similar to SPARQL_EVAL, but returns a vector of vectors of SQL values.
create function DB.DBA.SPARQL_EVAL_TO_ARRAY (
    in query varchar,      -- text of SPARQL query to execute
    in dflt_graph varchar, -- default graph IRI, if not NULL then this overrides what's specified in query
    in maxrows integer )   -- limit on numbers of rows that should be returned.
returns any
```

``` programlisting
-- Remote execution of SPARQL via SPARQL protocol, produces a result set of SQL values.
create procedure DB.DBA.SPARQL_REXEC (
    in service varchar,    -- service URI to call via HTTP
    in query varchar,      -- text of SPARQL query to execute
    in dflt_graph varchar, -- default graph IRI, if not NULL then this overrides what's specified in query
    in named_graphs any,   -- vector of named graph IRIs, if not NULL then this overrides what's specified in query
    in req_hdr any,        -- additional HTTP header lines that should be passed to the service; 'Host: ...' is most popular.
    in maxrows integer,    -- limit on numbers of rows that should be returned.
    in bnode_dict any )    -- dictionary of bnode ID references.

-- Similar to SPARQL_REXEC (), but returns a vector of vectors of SQL values.
-- All arguments are the same.
create function DB.DBA.SPARQL_REXEC_TO_ARRAY (
    in service varchar, in query varchar, in dflt_graph varchar, in named_graphs any,
    in req_hdr any, in maxrows integer, in bnode_dict any)
returns any

-- Similar to SPARQL_REXEC (), but fills in output parameters with metadata (like exec metadata) and a vector of vector
s of 'long valmode' values.
-- First seven arguments are the same.
create procedure DB.DBA.SPARQL_REXEC_WITH_META (
    in service varchar, in query varchar, in dflt_graph varchar, in named_graphs any,
    in req_hdr any, in maxrows integer, in bnode_dict any,
    out metadata any,  -- metadata like exec () returns.
    out resultset any) -- results as 'long valmode' value.
```

If the query is a CONSTRUCT or DESCRIBE then the result set consists of
a single row and column, the value inside is a dictionary of triples in
'long valmode'.

</div>

</div>
