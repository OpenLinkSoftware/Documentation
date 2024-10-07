<div id="rdfrdfviewgnr" class="section">

<div class="titlepage">

<div>

<div>

## 16.6. Automated Generation of Linked Data Views over Relational Data Sources

</div>

</div>

</div>

<div id="rdfrdfviewgnrintro" class="section">

<div class="titlepage">

<div>

<div>

### 16.6.1. Introduction

</div>

</div>

</div>

Virtuoso offers from Conductor UI an HTML based Wizard interface for
dynamically generating & publishing RDF based Linked Data from ODBC or
JDBC accessible relational data sources. Basically, a mechanism for
building RDF based Linked Data views over relational data sources.

The proliferation of relational databases across enterprises and behind
Web sites, makes them a vital data source for the burgeoning Linked Data
Web. Thus, the process of publishing Linked Data from these sources
needs to be as unobtrusive as possible. Naturally, a balance has to be
struck between unobtrusive generation of Linked Data and traditional
relational database management system (RDBMS) virtues such as:

<div class="itemizedlist">

- Scalability

- Security

- Analytical Expressivity of SQL

- Separation of Data Access and Data Storage via ODBC, JDBC, ADO.NET
  CLIs.

</div>

The following steps must be taken to publish RDF-based Linked Data:

<div class="orderedlist">

1.  Identifying ODBC or JDBC data sources that host the data you seek to
    publish (assuming the data isn't Virtuoso RDBMS hosted -- in which
    case, skip ahead to step \#3).

2.  Attach/Link TABLEs or VIEWs from the external data sources into
    Virtuoso via their Data Source Names (DSNs).

3.  Identify the internal or external TABLEs or VIEWs that hold the data
    you wish to publish.

4.  Configure Endpoints and Re-write Rules to disambiguate data object
    (resource) identity and description through HTTP-based content
    negotiation.

5.  Expose the Data Source Ontology and associated Instance Data in
    Linked Data form through those Endpoints and Re-write Rules.

</div>

These steps may be largely automated (the "One-Click" Deployment below),
or performed manually ("Using the Conductor's HTML-based Wizard" further
down).

</div>

</div>
