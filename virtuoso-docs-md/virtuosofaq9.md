<div>

<div>

<div>

<div>

### 1.4.9. What programming interfaces are supported? Do you support standard SPARQL protocol?

</div>

</div>

</div>

Virtuoso supports the standard SPARQL protocol.

Virtuoso offers drivers for the Jena, Sesame, and Redland frameworks.
These allow using Virtuoso's store and SPARQL implementation as the back
end of Jena, Sesame, or Redland applications. Virtuoso will then do the
query optimization and execution. Jena and Sesame drivers come standard;
contact us about Redland.

Virtuoso SPARQL can be used through any SQL call level interface (CLI)
supported by Virtuoso (i.e., ODBC, JDBC, OLE-DB, ADO.NET, XMLA). All
have suitable extensions for RDF specific data types such as IRIs and
typed literals. In this way, one can write, for example, PHP web pages
with SPARQL queries embedded, just using the SQL tools. Prefixing a SQL
query with the keyword "sparql" will invoke SPARQL instead of SQL,
through any SQL client API.

</div>
