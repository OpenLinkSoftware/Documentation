<div>

<div>

<div>

<div>

### 16.17.4. Manage Public Web Service Endpoints

</div>

</div>

</div>

Public web service endpoints have proven to be sources of especially bad
queries. While local application developers can obtain instructions from
database administrators and use ISQL access to the database to tune
execution plans, "external" clients do not know details of configuration
and/or lack appropriate skills. The most common problem is that public
endpoints usually get requests that do not mention the required graph,
because the queries were initially written for use with triple stores.
If the web service provides access to a single graph (or to a short list
of graphs), then it is strongly recommended to configure it by adding a
row into `DB.DBA.SYS_SPARQL_HOST` .

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

You can find detailed descriptions of the table columns
<a href="rdfdefaultgraph.html" class="link"
title="16.2.8. Default and Named Graphs">here</a> .

The idea is that if the client specifies the default graph in the
request, or uses named graphs and group graph patterns, then he is
probably smarter than average and will provide meaningful queries. If no
graph names are specified, then the query will benefit from preset graph
because this will give the compiler some more indexes to choose from --
indexes that begin with `G` .

Sometimes web service endpoints are used to access data of only one
application, not all data in the system. In that case, one may wish to
declare a separate storage that consists of only RDF Views made by that
application and `define input:storage` in the appropriate row of
`DB.DBA.SYS_SPARQL_HOST` .

</div>
