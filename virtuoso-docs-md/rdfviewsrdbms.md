<div>

<div>

<div>

<div>

## 16.5. Linked Data Views over RDBMS Data Source

</div>

</div>

</div>

Linked Data Views map relational data into RDF and allow customizing RDF
representation of locally stored RDF data. To let SPARQL clients access
relational data as well as physical RDF graphs in a single query, we
introduce a declarative Meta Schema Language for mapping SQL Data to RDF
Ontologies. As a result, all types of clients can efficiently access all
data stored on the server. The mapping functionality dynamically
generates RDF Data Sets for popular ontologies such as SIOC, SKOS, FOAF,
and ATOM/OWL without disruption to the existing database infrastructure
of Web 1.0 or Web 2.0 solutions. Linked Data Views are also suitable for
declaring custom representation for RDF triples, e.g. property tables,
where one row holds many single-valued properties.

<div>

<div>

<div>

<div>

### 16.5.1. Introduction

</div>

</div>

</div>

The Virtuoso Linked Data Views meta schema is a built-in feature of
Virtuoso's SPARQL to SQL translator. It recognizes triple patterns that
refer to graphs for which an alternate representation is declared and
translates these into SQL accordingly. The main purpose of this is
evaluating SPARQL queries against existing relational databases. There
exists previous work from many parties for rendering relational data as
RDF and opening it to SPARQL access. We can mention D2RQ, SPASQL,
Squirrel RDF, DBLP and others. The Virtuoso effort differs from these
mainly in the following:

<div>

- Integration with a triple store. Virtuoso can process a query for
  which some triple patterns will go to local or remote relational data
  and some to local physical RDF triples.

- SPARQL query can be used in any place where SQL can. Database
  connectivity protocols are neutral to the syntax of queries they
  transmit, thus any SQL client, e.g. JDBC, ODBC or XMLA application,
  can send SPARQL queries and fetch result sets. Moreover, a SQL query
  may contain SPARQL subqueries and SPARQL expressions may use SQL
  built-in functions and stored procedures.

- Integration with SQL. Since SPARQL and SQL share the same run time and
  query optimizer, the query compilation decisions are always made with
  the best knowledge of the data and its location. This is especially
  important when mixing triples and relational data or when dealing with
  relational data distributed across many outside databases.

- No limits on SPARQL. It remains possible to make queries with
  unspecified graph or predicate against mapped relational data, even
  though these may sometimes be inefficient.

- Coverage of the whole relational model. Multi-part keys etc. are
  supported in all places.

</div>

</div>

</div>
