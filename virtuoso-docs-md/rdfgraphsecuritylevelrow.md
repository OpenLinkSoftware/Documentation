<div id="rdfgraphsecuritylevelrow" class="section">

<div class="titlepage">

<div>

<div>

### 16.4.4. Graph-Level Security and SQL

</div>

</div>

</div>

SPARQL-level graph security is sufficient for SPARQL client operating
over HTTP. It is not sufficient for SQL clients due to the fact that
graph level security is baked into the SPARQL compiler, not by an SQL
compiler.

The Virtuoso SPARQL compiler analyzes the graph-level permissions of a
user (an identity principal named using an identifier e.g., WebID or
NetID). For each triple pattern or graph group pattern the compiler adds
an implicit FILTER () that ensures that appropriate privileges are
granted on target named graphs to a given user. Ultimately, these
FILTERs becomes part of the generated SQL code processed against the
RDF_QUAD and related RDF data management system tables.

SQL users accessing Virtuoso via ODBC, JDBC, ADO.NET, and OLE-DB
connections have the ability to execute arbitrary SQL code via stored
procedures, subject to SQL level privileges on target Tables and Views
which provides a point of vulnerability to the RDF system tables
(RDF_QUAD and others). To close this vulnerability, the SQL compiler
restricts SQL connection access, in regards to RDF system tables, to
members of `the SPARQL_SELECT_RAW` group.

<span class="emphasis">*Note:*</span>`SPARQL_SELECT_RAW` group is a
feature applicable to Virtuoso 7.5 or higher.

<div id="rdfgraphsecuritylevelrowex" class="section">

<div class="titlepage">

<div>

<div>

#### Graph-Level Security and SQL Usage Example

</div>

</div>

</div>

The following example demonstrates how to grant `SPARQL_SELECT_RAW` to a
Virtuoso SQL user:

``` programlisting
SQL> DB.DBA.USER_CREATE ('John', 'John');
Done. -- 0 msec.
SQL> GRANT SPARQL_SELECT to "John";
Done. -- 0 msec.
SQL> GRANT SPARQL_SELECT_RAW to "John";
Done. -- 0 msec.
```

</div>

</div>
