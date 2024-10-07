<div id="rdfsparqlinline" class="section">

<div class="titlepage">

<div>

<div>

### 16.2.5. SPARQL Inline in SQL

</div>

</div>

</div>

Virtuoso extends the SQL 92 syntax with SPARQL queries and subqueries.
Instead of writing a SQL SELECT query or subquery, one can write the
SPARQL keyword and a SPARQL query after the keyword.

``` programlisting
SQL>SPARQL SELECT DISTINCT ?p WHERE { graph ?g { ?s ?p ?o } };
p
varchar
----------
http://example.org/ns#b
http://example.org/ns#d
http://xmlns.com/foaf/0.1/name
http://xmlns.com/foaf/0.1/mbox
...

SQL>SELECT distinct subseq ("p", strchr ("p", '#')) as fragment
  FROM (SPARQL SELECT DISTINCT ?p WHERE { graph ?g { ?s ?p ?o } } ) as all_predicates
  WHERE "p" like '%#%';
fragment
varchar
----------
#query
#data
#name
#comment
...
```

Note that names of variables returned from SPARQL are always
case-sensitive and no case mode rules apply to them. Depending on the
CaseMode parameter in the Virtuoso configuration file, double quotes
should be used if necessary to refer to them in surrounding SQL code.

It is possible to pass parameters to a SPARQL query via a
Virtuoso-specific syntax extension. <span class="emphasis">*??*</span>
or <span class="emphasis">*\$?*</span> indicates a positional parameter
similar to <span class="emphasis">*?*</span> in plain SQL.
<span class="emphasis">*??*</span> can be used in graph patterns or
anywhere in place of a SPARQL variable. The value of a parameter should
be passed in SQL form, i.e. this should be a number or a untyped string.
An IRI ID can be passed in all cases where an absolute IRI can, except
the obvious case of when the variable is an argument of a function that
requires string. If the parameter is used in the 'graph', 'subject' or
'object' position of the SPARQL pattern, the string parameter is
converted into an IRI automatically. In other cases an IRI string is
indistinguishable from a string literal, so it is necessary to call the
built-in SPARQL function <span class="emphasis">*iri()*</span> , e.g.
<span class="emphasis">*iri (??)*</span> . Using this notation, any
dynamic SQL client (whether ODBC, JDBC or some other) can execute
parameterized SPARQL queries, binding parameters just as with dynamic
SQL.

``` programlisting
SQL> create function param_passing_demo ()
{
  declare stat, msg varchar;
  declare mdata, rset any;
  exec ('SPARQL SELECT ?s WHERE { graph ?g { ?s ?? ?? }}',
    stat, msg,
    vector ( /* Vector of two parameters */
      'http://www.w3.org/2001/sw/DataAccess/tests/data/Sorting/sort-0#int1',
      4 ),
    10, /* Max no of rows */
    mdata, /* Variable to get metadata */
    rset ); /* Variable to get result-set */
  if (length (rset) = 0)
    signal ('23000',
      'No data found, try demo database with installed Virtuoso tutorials');
  return rset[0][0];
}

SQL> SELECT param_passing_demo ();
callret
VARCHAR
_______________________________________________________________________________

http://www.w3.org/2001/sw/DataAccess/tests/data/Sorting/sort-0#four

1 Rows. -- 00000 msec.
```

Another example:

``` programlisting
INSERT INTO GRAPH <http://example.com/Northwind>
{ `iri($?)` <http://example.com/schemas/northwind#has_province> "Valencia" };
```

An inline SPARQL query can refer to SQL variables that are in scope in
the SQL query or stored procedure containing it. Virtuoso extends the
SPARQL syntax with a special notation to this effect. A reference to SQL
variable X can be written as <span class="emphasis">*?:X*</span> or
<span class="emphasis">*\$:X*</span> . A reference to column
<span class="emphasis">*C*</span> of a table or a sub-select with alias
<span class="emphasis">*T*</span> can be written as
<span class="emphasis">*?:T.C*</span> or
<span class="emphasis">*\$:T.C*</span> . Both notations can be used in
any place where a variable name is allowed, except the 'AS' clause
described below.

A column of a result set of a SPARQL SELECT can be used in SQL code
inside a for statement just like any column from a SQL select.

SQL rules about double-quoted names are applicable to variables that are
passed to a SPARQL query or selected from one. If a variable name
contains unusual characters or should not be normalized according to SQL
conventions then the name should use double quotes for escaping. e.g.,
the notation <span class="emphasis">*?:"OrderLine"*</span> will always
refer to variable or column titled
<span class="emphasis">*OrderLine*</span> whereas
<span class="emphasis">*?:OrderLine*</span> can be converted to
<span class="emphasis">*ORDERLINE*</span> or
<span class="emphasis">*orderline*</span> .

It is safer to avoid using variable names that conflict with column
names of RDF system tables, esp. <span class="emphasis">*G*</span> ,
<span class="emphasis">*S*</span> , <span class="emphasis">*P*</span>
and <span class="emphasis">*O*</span> . These names are not reserved now
but they may cause subtle bugs when an incorrect SPARQL subquery is
compiled into SQL code that refers to identically named table columns.
Some of these names may be rejected as syntax errors by future Virtuoso
versions.

``` programlisting
SQL> create procedure sql_vars_demo ()
{
#pragma prefix sort0: <http://www.w3.org/2001/sw/DataAccess/tests/data/Sorting/sort-0#>
  declare RES varchar;
  declare obj integer;
  result_names (RES);
  obj := 4;
  for (SPARQL SELECT ?subj WHERE { graph ?g { ?subj sort0:int1 ?:obj } } ) do
    result ("subj");
}

SQL> sql_vars_demo ();
RES
VARCHAR
_______________________________________________________________________________

http://www.w3.org/2001/sw/DataAccess/tests/data/Sorting/sort-0#four

1 Rows. -- 00000 msec.
```

The example also demonstrates the Virtuoso/PL pragma line for
procedure-wide declarations of namespace prefixes. This makes the code
more readable and eliminates duplicate declarations of namespace
prefixes when the procedure contains many SPARQL fragments that refer to
a common set of namespaces.

A SPARQL ASK query can be used as an argument of the SQL EXISTS
predicate.

``` programlisting
create function sparql_ask_demo () returns varchar
{
  if (exists (sparql ask where { graph ?g { ?s ?p 4}}))
    return 'YES';
  else
    return 'NO';
}

SQL> SELECT sparql_ask_demo ();
_______________________________________________________________________________

YES
```

<div id="rdfcontrollingsparqloutputtypes" class="section">

<div class="titlepage">

<div>

<div>

#### Controlling SPARQL Output Data Types

</div>

</div>

</div>

The compilation of a SPARQL query may depend on an environment that is
usually provided by the SPARQL protocol and which includes the default
graph URI. Environment settings that come from the SPARQL protocol may
override settings in the text of a SPARQL query. To let an application
configure the environment for a query, SPARQL's syntax has been extended
with the 'define' clause:

``` programlisting
define parameter-qname parameter-value
```

Examples of supported parameters are
<span class="emphasis">*output:valmode*</span> and
<span class="emphasis">*output:format*</span>

<span class="emphasis">*output:valmode*</span> specifies which data
types (i.e. representation) should be used for values in the result set.
The default is "SQLVAL", meaning that a query returns result set values
in SQL format and behaves as a typical SQL select - IRIs and string
literals are returned as strings, making the output compatible with ODBC
and the standard SQL routines. To compose triple vectors in Virtuoso PL
code, an application may need data in long format. A valmode of "LONG"
means that IRIs are returned as IRI_IDs and string literals may be
returned as special "RDF boxes" even if they are actually plain strings.
This may cause problems if these new datatypes are not known to the data
recipient or if IRIs come from RDF Views (in which case IRI_IDs are
created on the fly and 'pollute' the database), but it can result in
fewer data conversions and thus better speed if used properly. "AUTO"
disables all types of conversion for the result set, so the latter can
comprise a mix of values across "SQLVAL" and "LONG" value modes, as well
as some internal representations. It is better to avoid using this mode
in user applications because the output may change from version to
version.

If the query contains a

``` programlisting
define output:valmode 'LONG'
```

clause then all returned values are in long format. e.g., the following
query returns IRI_ID's instead of IRI strings.

``` programlisting
SQL>SPARQL define output:valmode 'LONG' SELECT distinct ?p WHERE { graph ?g { ?s ?p ?o } };
p
----------
#i1000001
#i1000003
#i1000005
#i1000006
...
```

<span class="emphasis">*output:format*</span> instructs the SPARQL
compiler that the result of the query should be serialized into an RDF
document - that document will be returned as a single column of a single
row result set. <span class="emphasis">*output:format*</span> is
especially useful if a SPARQL CONSTRUCT or SPARQL DESCRIBE query is
executed directly via an ODBC or JDBC database connection and the client
cannot receive the resulting dictionary of triples (there's no way to
transfer such an object via ODBC). Using this option, the client can
receive the document that contains the whole result set of a SELECT or
the dictionary of triples of a CONSTRUCT/DESCRIBE, and parse it locally.

Supported values for <span class="emphasis">*output:format*</span> are
<span class="emphasis">*RDF/XML*</span> and
<span class="emphasis">*TURTLE*</span> (or
<span class="emphasis">*TTL*</span> ). If both
<span class="emphasis">*output:valmode*</span> and
<span class="emphasis">*output:format*</span> are specified,
<span class="emphasis">*output:format*</span> has higher priority,
raising an error if <span class="emphasis">*output:valmode*</span> is
set to a value other than <span class="emphasis">*LONG*</span> .

When a SPARQL query is compiled, the compiler checks whether the result
set is to be sent to a remote ODBC/JDBC client or used in some other
way. The compiler will automatically set
<span class="emphasis">*output:format*</span> to
<span class="emphasis">*TURTLE*</span> if compiling for execution by an
SQL client.

The example below demonstrates how different values of
<span class="emphasis">*output:format*</span> affect the result of
SPARQL SELECT. Note 10 rows and 4 columns in the first result, and
single LONG VARCHAR in the others. When using the ISQL client, use the
'set blobs on;' directive if fetching long texts to avoid receiving a
'data truncated' warning.

``` programlisting
SQL> SPARQL SELECT * WHERE {graph ?g { ?s ?p ?o }} limit 10;
g                                            s                    p                              o
VARCHAR                                      VARCHAR              VARCHAR                        VARCHAR
______________________________________________________________________

http://local.virt/DAV/bound/manifest.rdf     nodeID://1000000000 http://example.com/test#query http://local.virt/DAV/bound/bound1.rq
. . .
http://local.virt/DAV/examples/manifest.rdf nodeID://1000000019 http://example.com/test#query http://local.virt/DAV/examples/ex11.2.3.1_1.rq

10 Rows. -- 00000 msec.

SQL> SPARQL define output:format "TTL" SELECT * WHERE {graph ?g { ?s ?p ?o }} limit 10;
callret-0
LONG VARCHAR
_______________________________________________________________________________

@prefix :rdf <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix :rs <http://www.w3.org/2005/sparql-results#> .
@prefix :xsd <http://www.w3.org/2001/XMLSchema#> .
[ rdf:type rs:results ;
  rs:result [
      rs:binding [ rs:name "g" ; rs:value <http://local.virt/DAV/bound/manifest.rdf> ] ;
      rs:binding [ rs:name "s" ; rs:value _:nodeID1000000000 ] ;
      rs:binding [ rs:name "p" ; rs:value <http://example.com/test#query> ] ;
      rs:binding [ rs:name "o" ; rs:value <http://local.virt/DAV/bound/bound1.rq> ] ;
      ] ;

. . .

  rs:result [
      rs:binding [ rs:name "g" ; rs:value <http://local.virt/DAV/examples/manifest.rdf> ] ;
      rs:binding [ rs:name "s" ; rs:value _:nodeID1000000019 ] ;
      rs:binding [ rs:name "p" ; rs:value <http://example.com/test#query> ] ;
      rs:binding [ rs:name "o" ; rs:value <http://local.virt/DAV/examples/ex11.2.3.1_1.rq> ] ;
      ] ;
    ] .

1 Rows. -- 00000 msec.

SQL> SPARQL define output:format "RDF/XML" SELECT * WHERE {graph ?g { ?s ?p ?o }} LIMIT 10;
callret-0
LONG VARCHAR
_______________________________________________________________________________

<rdf:RDF
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:rs="http://www.w3.org/2005/sparql-results#"
  xmlns:xsd="http://www.w3.org/2001/XMLSchema#" >
   <rs:results rdf:nodeID="rset">
  <rs:result rdf:nodeID="sol206">
   <rs:binding rdf:nodeID="sol206-0" rs:name="g"><rs:value rdf:resource="http://local.virt/DAV/bound/manifest.rdf"/></rs:binding>
   <rs:binding rdf:nodeID="sol206-1" rs:name="s"><rs:value rdf:nodeID="1000000000"/></rs:binding>
   <rs:binding rdf:nodeID="sol206-2" rs:name="p"><rs:value rdf:resource="http://example.com/test#query"/></rs:binding>
   <rs:binding rdf:nodeID="sol206-3" rs:name="o"><rs:value rdf:resource="http://local.virt/DAV/bound/bound1.rq"/></rs:binding>
  </rs:result>

. . .

  <rs:result rdf:nodeID="sol5737">
   <rs:binding rdf:nodeID="sol5737-0" rs:name="g"><rs:value rdf:resource="http://local.virt/DAV/examples/manifest.rdf"/></rs:binding>
   <rs:binding rdf:nodeID="sol5737-1" rs:name="s"><rs:value rdf:nodeID="1000000019"/></rs:binding>
   <rs:binding rdf:nodeID="sol5737-2" rs:name="p"><rs:value rdf:resource="http://example.com/test#query"/></rs:binding>
   <rs:binding rdf:nodeID="sol5737-3" rs:name="o"><rs:value rdf:resource="http://local.virt/DAV/examples/ex11.2.3.1_1.rq"/></rs:binding>
  </rs:result>
 </rs:results>
</rdf:RDF>

1 Rows. -- 00000 msec.
```

SPARQL CONSTRUCT and SPARQL DESCRIBE results are serialized as one would
expect:

``` programlisting
SQL> SPARQL
define output:format "TTL"
CONSTRUCT { ?s ?p "004" }
WHERE
  {
    graph ?g { ?s ?p 4 }
  };
callret-0
LONG VARCHAR
_______________________________________________________________________________

<http://www.w3.org/2001/sw/DataAccess/tests/data/Sorting/sort-0#four> <http://www.w3.org/2001/sw/DataAccess/tests/data/Sorting/sort-0#int1> "004" .
_:b1000000913 <http://www.w3.org/2001/sw/DataAccess/tests/result-set#index> "004" .

1 Rows. -- 00000 msec.

SQL> SPARQL
define output:format "RDF/XML"
CONSTRUCT { ?s ?p "004" }
WHERE
  {
    graph ?g { ?s ?p 4 }
  };
callret-0
LONG VARCHAR
_______________________________________________________________________________

<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description about="http://www.w3.org/2001/sw/DataAccess/tests/data/Sorting/sort-0#four"><ns0pred:int1 xmlns:ns0pred="http://www.w3.org/2001/sw/DataAccess/tests/data/Sorting/sort-0#">004</ns0pred:int1></rdf:Description>
<rdf:Description rdf:nodeID="b1000000913"><ns0pred:index xmlns:ns0pred="http://www.w3.org/2001/sw/DataAccess/tests/result-set#">004</ns0pred:index></rdf:Description>
</rdf:RDF>

1 Rows. -- 00000 msec.
```

SPARQL ASK returns a non-empty result set if a match is found for the
graph pattern, an empty result set otherwise. If
<span class="emphasis">*output:format*</span> is specified then the
query makes a 'boolean result' document instead:

``` programlisting
SQL> SPARQL ASK WHERE {graph ?g { ?s ?p 4 }};
__ask_retval
INTEGER
_______________________________________________________________________________

1

1 Rows. -- 00000 msec.

SQL> SPARQL ASK WHERE {graph ?g { ?s ?p "no such" }};
__ask_retval
INTEGER
_______________________________________________________________________________

0 Rows. -- 00000 msec.

SQL> SPARQL define output:format "TTL" ASK WHERE {graph ?g { ?s ?p 4 }};
callret
VARCHAR
_______________________________________________________________________________

@prefix :rdf <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
 @prefix :rs <http://www.w3.org/2005/sparql-results#> .
[ rdf:type rs:results ; rs:boolean TRUE ]

1 Rows. -- 00000 msec.

SQL> SPARQL define output:format "RDF/XML" ASK WHERE {graph ?g { ?s ?p 4 }};
callret
VARCHAR
_______________________________________________________________________________

<rdf:RDF
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:rs="http://www.w3.org/2005/sparql-results#"
  xmlns:xsd="http://www.w3.org/2001/XMLSchema#" >
   <rs:results rdf:nodeID="rset">
    <rs:boolean rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">1</rs:boolean></results></rdf:RDF>

1 Rows. -- 00000 msec.
```

</div>

</div>
