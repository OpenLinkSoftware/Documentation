<div>

<div>

<div>

<div>

### 16.2.8. Default and Named Graphs

</div>

</div>

</div>

Sometimes the default graph IRI is not known when the SPARQL query is
composed. It can be added at the very last moment by providing the IRI
in a 'define' clause as follows:

``` programlisting
define input:default-graph-uri &lt;http://example.com&gt
```

Such a definition overrides the default graph URI set in query by the
'FROM ...' clause (if any).

The query may contain more than one <span class="emphasis">*define
input:default-graph-uri*</span> . The set of values of
<span class="emphasis">*input:default-graph-uri*</span> has the highest
possible priority and cannot be redefined in the rest of the text of the
query by FROM clauses.

FROM NAMED clauses can be used multiple times in one query:

``` programlisting
SPARQL
  SELECT ?id
  FROM NAMED <http://example.com/user1.ttl>
  OPTION (get:soft "soft", get:method "GET")
  FROM NAMED <http://example.com/user2.ttl>
  OPTION (get:soft "soft", get:method "GET")
  WHERE { GRAPH ?g { ?id a ?o } }
```

Similarly, <span class="emphasis">*define input:named-graph-uri
\<http://example.com\>*</span> is a replacement for a FROM NAMED clause

When Virtuoso receives a SPARQL request via HTTP, the value of the
default graph can be set in the protocol using a
<span class="emphasis">*default-graph-uri*</span> HTTP parameter.
Multiple occurrences of this parameter are allowed. This HTTP parameter
is converted into <span class="emphasis">*define
input:default-graph-uri*</span> . There's similar support for
<span class="emphasis">*named-graph-uri*</span> HTTP parameter. For
debugging purposes, graph names set in the protocol are sent back in the
reply header as <span class="emphasis">*X-SPARQL-default-graph:
...*</span> and <span class="emphasis">*X-SPARQL-named-graph:
...*</span> header lines, one line per graph.

A web service endpoint may provide different default configurations for
different host names mentioned in HTTP requests. This facility is
configured via table
<span class="emphasis">*DB.DBA.SYS_SPARQL_HOST*</span> .

``` programlisting
create table DB.DBA.SYS_SPARQL_HOST (
  SH_HOST   varchar not null primary key, -- host mask
  SH_GRAPH_URI varchar,                 -- default graph uri
  SH_USER_URI   varchar,                  -- reserved for any use in applications
  SH_BASE_URI varchar,                  -- for future use (not used currently) to set BASE in sparql queries. Should be NULL for now.
  SH_DEFINES long varchar,              -- additional defines for requests
  PRIMARY KEY (SH_HOST)
)
```

When the SPARQL web service endpoint receives a request it checks the
<span class="emphasis">*Host*</span> HTTP header line. This line
contains zero or more target host names, delimited by commas. For every
host name in the line, the service scans the
<span class="emphasis">*DB.DBA.SYS_SPARQL_HOST*</span> table in search
of a row containing a matching host name in
<span class="emphasis">*SH_HOST*</span> . The
<span class="emphasis">*SH_HOST*</span> field acts as 'pattern' argument
for the SQL string operator LIKE. If a matching row is found, the text
of SPARQL request is extended.

If a default graph is not explicitly set by the HTTP parameters and
<span class="emphasis">*SH_GRAPH_URI*</span> is not null then the
default graph is set to <span class="emphasis">*SH_GRAPH_URI*</span> .

If <span class="emphasis">*SH_DEFINES*</span> is not null then it is
added in front of the query; so this field is a good place for the text
for any
<a href="rdfsparql.html#rdfsparqlimplementationextent" class="link"
title="16.2.1. SPARQL Implementation Details">DEFINE</a> options. See
<a href="rdfsparqlinline.html#rdfcontrollingsparqloutputtypes"
class="link" title="Controlling SPARQL Output Data Types">various</a>
DEFINE examples usage.

SH_USER_URI is for arbitrary user data and can be used in any way by the
application that is "responsible" for the declared host.

The search of <span class="emphasis">*DB.DBA.SYS_SPARQL_HOST*</span>
stops at the first found row, other possible matches are silently
ignored.

Example Usage:

``` programlisting
INSERT INTO DB.DBA.SYS_SPARQL_HOST (SH_HOST, SH_GRAPH_URI, SH_USER_URI, SH_BASE_URI, SH_DEFINES) VALUES
('example.com', 'urn:example:com', 'urn:example:user', NULL, 'define input:inference "http://mygraph.com"');
```

</div>
