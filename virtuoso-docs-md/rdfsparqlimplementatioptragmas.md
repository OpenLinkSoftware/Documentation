<div id="rdfsparqlimplementatioptragmas" class="section">

<div class="titlepage">

<div>

<div>

### 16.2.12. Supported SPARQL-BI "define" pragmas

</div>

</div>

</div>

SPARQL-BI compiler and run-time support are not isolated from
environment and some used heuristics are not perfect and sometimes
different use cases require different behavior within same standard.
These reasons are seen frequently in the industry, and the solution is
well known: compiler pragmas. So we allow them at the beginning of any
SPARQL query in form:

``` programlisting
define QName value
```

<div id="rdfsparqlimplementatioptragmascinp" class="section">

<div class="titlepage">

<div>

<div>

#### Pragmas to control the input data set for the query

</div>

</div>

</div>

``` programlisting
input:default-graph-uri works like "FROM" clause;
input:named-graph-uri works like "FROM NAMED" clause;
input:default-graph-exclude works like "NOT FROM" clause;
input:named-graph-exclude works like "NOT FROM NAMED" clause.
```

The difference is that these pragmas have higher priority and they can
be used for security restrictions in combination with
`define input:freeze` that blocks further changes in the list of source
graphs. The web service endpoint (or similar non-web application) can
edit the incoming query by placing list of pragmas ended with
`input:freeze` in front of query text. Even if the intruder will try to
place some graph names, it will get compilation error, not an access to
the data. input:freeze disables all `input:grab-...` pragmas as well.

<div class="itemizedlist">

- `input:ifp` : adds IFP keyword in OPTION (QUIETCAST, ...) clause in
  the generated SQL. The value of this define is not used ATM, an empty
  string is safe for future extensions.

- `input:same-as` : works like input:ifp but adds SAME_AS keyword.

- `input:storage` : selects quad map storage to use. The value is an IRI
  of storage, the default value is, of course,
  virtrdf:DefaultQuadStorage. If the value is an empty string then only
  quads from RDF_VIEW are used. This is a good choice for low-level
  admin procedures, for two reasons: they will not interfere with any
  changes in virtrdf:DefaultQuadStorage and they will continue to work
  even if all compiler's metadata are corrupted, including the
  description of virtrdf:DefaultQuadStorage (define input:storage ""
  switches the SPARQL compiler to a small set of metadata that are built
  in server C code and thus are very hard to corrupt by users).

- `input:inference` : specifies the name of inference rule set to use.

- `input:param (and synonyms input:params, sql:param, sql:params)` :
  declares a variable name as a protocol parameter. The SPARQL query can
  refer to protocol parameter X via variable with special syntax of name
  ?::X . If a query text should be made by query builder that does not
  understand SPARQL-BI extensions then the text may contain variable ?X
  and define input:param "X" . This does not work for positional
  parameters, one can not replace a reference to ?::3 with ?3 and define
  input:param "3".

- `input:grab-var` : Network Resource Fetch values of variable;

- `input:grab-iri` : Network Resource Fetch the constant IRI;

- `input:grab-all` : Network Resource Fetch all constants and variables
  of the query;

- `input:grab-seealso (and synonym input:grab-follow-predicate)` : sets
  predicate that tells where to Fetch more Network Resource data about a
  subject;

- `input:grab-limit` : how many resources can be fetched;

- `input:grab-depth` : how many iterations can be done, sponging
  additional data on each iteration;

- `input:grab-base` : base to resolve relative IRIs before passing to
  Sponger;

- `input:grab-resolver` : IRI resolving procedure (i.e., one that turns
  base and relative IRI to an absolute IRI);

- `input:grab-destination` : single resource that should be filled in
  with results of all fetchings;

- `input:grab-loader` : a name of procedure that retrieve the resource
  via HTTP, parse it and store it.

</div>

All these pragmas are described in more details
<a href="rdfiridereferencing.html#rdfinputgrab" class="link"
title="16.13.1. IRI Dereferencing For FROM Clauses, &quot;define get:...&quot; Pragmas">here</a>
, but in addition there are some experimental:

<div class="itemizedlist">

- `input:grab-intermediate` : extends the set of IRIs to sponge, useful
  in combination with input:grab-seealso. If present then for a given
  subject, Network Resource Fetch will retrieve not only values of
  see-also predicates for that subject but the subject itself. The
  define value is not used in current implementation.

- `input:grab-group-destination` : resembles input:grab-destination but
  sponges will create individual graphs for Network Resource Fetch
  results, and in additional to this common routine, a copy of each
  Network Resource Fetch result is added to the resource specified by
  the value of input:grab-group-destination. input:grab-destination
  redirects loadings, input:grab-group-destination duplicates them.

- `get:soft` : "soft" or "replacing", depending on mode of loading
  source graph;

- `get:uri` : an URI of web resource where the graph should come from
  (e.g., a local mirror);

- `get:method` : "GET" or "MGET", depending on loading the resource
  itself or loading metadata about the resource;

- `get:refresh` : limits the lifetime of a local cached copy of the
  source, the value is in seconds. Should be used in combination with
  get:soft;

- `get:proxy` : the proxy server to use, as "host:port" string.

</div>

These defines are described also
<a href="rdfiridereferencing.html#rdfinputgrab" class="link"
title="16.13.1. IRI Dereferencing For FROM Clauses, &quot;define get:...&quot; Pragmas">here</a>
. Note that all of them can be used in option list of "FROM ... OPTION
(get:... )" extended SPARQL-BI syntax for FROM/FROM NAMED clause.

Note that all of them can be used in option list of "FROM ... OPTION
(get:... )" extended SPARQL-BI syntax for FROM/FROM NAMED clause.

</div>

<div id="rdfsparqlimplementatioptragmasccg" class="section">

<div class="titlepage">

<div>

<div>

#### Pragmas to control code generation

</div>

</div>

</div>

<div class="itemizedlist">

- `sql:assert-user` : defines the user who is supposed to be the single
  "proper" use for the query. If the compiler is launched by other user,
  an error is signaled. The typical use is define sql:assist-user "dba".
  This is too weak to be a security measure, but may help in debugging
  of security issues.

- `sql:gs-app-callback` : application-specific callback that returns
  permission bits of a given graph;

- `sql:gs-app-uid` : application-specific user id to use in callback.

  <div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

  |                            |                                                                          |
  |:--------------------------:|:-------------------------------------------------------------------------|
  | ![\[Tip\]](images/tip.png) | See Also:                                                                |
  |                            | <a href="rdfgraphsecurityappcallb.html" class="link"                     
                                title="16.4.7. Application Callbacks for Graph Level Security">RDF Graph  
                                Security</a>                                                              |

  </div>

- `sql:globals-mode` : tells how to print names of global variables,
  supported values are "XSLT" (print colon before name of global
  variable and "SQL" (print as usual).

- `sql:log-enable` : value that will be passed to SPARUL procedures and
  there it will be passed to log_enable() BIF. Thus define
  sql:log-enable N will result in log_enable(N, 1) at the beginning of
  the operation and other log_enable() call will restore previous mode
  of transaction log at exit from the procedure or at any error
  signalled from it.

- `sql:table-option` : value will be added as an option to each triple
  in the query and later it will be printed in TABLE OPTION (...) clause
  of source table clause. This works only for SQL code for plain triples
  from RDF_QUAD, fragments of queries related to RDF Views will remain
  unchanged.

- `sql:select-option` : value will be added as an global OPTION ()
  clause of the generated SQL SELECT. This clause is always printed, it
  is always at least OPTION (QUIETCAST, ...). The most popular use case
  is define sql:table-option "ORDER" to tell the SQL compiler execute
  joins in the order of their use in the query (this can make query
  compilation much faster but the compilation result can be terrible if
  you do not know precisely what you're doing and not inspected
  execution plan of the generated SQL query).

- `sql:describe-mode` : sets procedures that will produce the result of
  a DESCRIBE query. The pragma is ignored for other types of SPARQL
  queries. In the default mode, the result contains all X ?p ?o and all
  ?s ?p X triples for each given X. In "SPO" mode, the result contains X
  ?p ?o triples only. In "CBD" mode, the result contains concise bound
  descriptions of given subjects. Application developers may add more
  modes.

- `sql:signal-void-variables` : the most useful debugging variable if
  Linked Data Views are in use. It tells the SPARQL compiler to signal
  an error if it can prove that some variable can never be bound.
  Usually it means error in query, like typo in IRI or totally wrong
  triple pattern.

</div>

</div>

<div id="rdfsparqlimplementatioptragmasctr" class="section">

<div class="titlepage">

<div>

<div>

#### Pragmas to control the type of the result

</div>

</div>

</div>

<div class="itemizedlist">

- `output:valmode` : tells the compiler which SQL datatypes should be
  used for output values. ODBC clients and the like known nothing about
  RDF and expect plain SQL values, so the appropriate value for them is
  "SQLVAL" and that's the default. When a Virtuoso/PL procedure is
  RDF-aware and keeps results for further passing to other SPARQL
  queries or some low-level RDF routines, the value "LONG" tells the
  compiler to preserve RDF boxes as is and to return IRI IDs instead of
  IRI string value. Third possible value, "AUTO", is for dirty hackers
  that do not want any conversion of any sort at the output to read the
  SQL output of SPARQL front-end, find the format of each column and add
  the needed conversions later. You will probably never need it.

- `output:format` : tells the compiler that the query should produce a
  string output with the serialization of the result, not a result set.
  There are three of them because the caller, like SPARQL web service
  endpoint, may not know the actual type of the query that should be
  executed. The value of output:format is used for SELECT and data
  manipulation queries, if specified, it can also be used for CONSTRUCT,
  DESCRIBE or ASK, if it is specified but related output:dict-format or
  output:scalar-format is not.

- `output:scalar-format` : tells the compiler that the query should
  produce a string output with the serialization of the result, not a
  result set. There are three of them because the caller, like SPARQL
  web service endpoint, may not know the actual type of the query that
  should be executed. The value of output:scalar-format is used for ASK
  queries only, if specified.

- `output:dict-format` : tells the compiler that the query should
  produce a string output with the serialization of the result, not a
  result set. There are three of them because the caller, like SPARQL
  web service endpoint, may not know the actual type of the query that
  should be executed. The value of output:dict-format is used for
  CONSTRUCT and DESCRIBE queries only, if specified.

</div>

</div>

<div id="rdfsparqlimplementatioptragmassfs" class="section">

<div class="titlepage">

<div>

<div>

#### Supported formats that return a string session

</div>

</div>

</div>

<div class="itemizedlist">

- "RDF/XML",

- "TURTLE" (and "TTL" is a synonym),

- "JSON" (canonical JSON for result sets, Talis-style JSON for CONSTRUCT
  and DESCRIBE),

- "JSON;ODATA" (oData-style JSON for CONSTRUCT and DESCRIBE, error
  otherwise),

- "RDFA;XHTML" (only for CONSTRUCT and DESCRIBE, error otherwise),

- "ATOM;XML" (only for CONSTRUCT and DESCRIBE as well).

</div>

</div>

<div id="rdfsparqlimplementatioptragmassdfs" class="section">

<div class="titlepage">

<div>

<div>

#### Supported formats that do not return a string session to the caller

</div>

</div>

</div>

Supported formats that do not return a string session to the caller, but
form an HTTP response instead and send it directly to the client HTTP
connection with an appropriate HTTP header:

<div class="itemizedlist">

- "HTTP+XML mime/type",

- "HTTP+TTL mime/type",

- "HTTP+NT mime/type". A MIME type in value will be placed in the
  returned header, it should be separated from the starting keyword with
  one white space.

</div>

</div>

<div id="rdfsparqlimplementatioptragmassspfs" class="section">

<div class="titlepage">

<div>

<div>

#### Supported Special formats

</div>

</div>

</div>

A special format "\_JAVA\_" is for SPARQL queries sent via JDBC. It
changes only the output of ASK queries.

The "\_JAVA\_" and "\_UDBC\_" are aliases in Virtuoso Version 6.1.5.
Till Virtuoso 6.1.5 the default behaves as "TTL". For Virtuoso version
6.1.5 and higher it is ODBC/JDBC oriented e.g. "\_UDBC\_" is the default
format for ODBC/JDBC clients.

<span class="emphasis">*Note*</span> : If you want to revert to old TTL
behaviour, you should specify it explicitly via:

``` programlisting
define output:format "TTL"
```

Note: Pragmas output:valmode and output:format may conflict if used
together, and if they're not in conflict then output:valmode is
redundant: the compiler knows for sure which output:valmode-s are needed
by various output:format-s.

<div class="itemizedlist">

- `output:route` : works only for SPARUL operators and tells the SPARQL
  compiler to generate procedure names that differ from default. As a
  result, the effect of operator will depend on application. That is for
  tricks. E.g., consider an application that extracts metadata from DAV
  resources stored in the Virtuoso and put them to RDF storage to make
  visible from outside. When a web application has permissions and
  credentials to execute a SPARUL query, the changed metadata can be
  written to the DAV resource (and after that the trigger will update
  them in the RDF storage), transparently for all other parts of
  application.

- `output:maxrows` : limits the number of rows in the returned result
  set. The integer value is expected, the positive integer value is
  obviously recommended.

</div>

</div>

<div id="rdfsparqlimplementatioptragmasmnotes" class="section">

<div class="titlepage">

<div>

<div>

#### Minor notes

</div>

</div>

</div>

Values of most pragmas are strings. Exceptions are:

<div class="itemizedlist">

- input:grab-depth,

- input:grab-limit,

- output:maxrows,

- sql:log-enable,

- sql:signal-void-variables

</div>

that have integer values.

Values of some pragmas a passed through the compiler to the run-time so
they are seen in the generated SQL code as arguments of procedures:

<div class="itemizedlist">

- get:method,

- get:proxy,

- get:query,

- get:refresh,

- get:soft,

- get:uri

</div>

so sometimes you may meet them in SQL debuggers output and the like.

</div>

</div>
