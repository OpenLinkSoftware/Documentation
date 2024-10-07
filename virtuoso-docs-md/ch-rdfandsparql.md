<div id="ch-rdfandsparql" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 16. RDF Data Access and Data Management

</div>

<div>

<div class="abstract">

**Abstract**

Starting with version 4.5, Virtuoso provides built-in support for
SPARQL, the standard query language for RDF and the semantic web.
Adoption of SPARQL with Virtuoso is effortless, as any existing SQL
client applications and stored procedures can take advantage of SPARQL
simply by using it in the place of or inside SQL queries. Additionally,
Virtuoso offers the standard SPARQL protocol to HTTP clients. From
version 5.0.7, Virtuoso can be used as the RDF store/query processor of
the Jena and Sesame RDF frameworks.

This chapter discusses Virtuoso's RDF triple storage and query
capabilities. This discusses storing RDF data as well as mapping
existing relational data into RDF for SPARQL access. Numerous SPARQL
language extensions and standard compliance are covered.

In this chapter SPARQL and SPASQL are used as siblings.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><div
class="itemizedlist">
<ul>
<li><p><a href="odbcimplementationext.html#virtodbcsparql" class="link"
title="Virtuoso ODBC RDF Extensions for SPASQL">Virtuoso ODBC RDF
extensions for SPASQL</a></p></li>
<li><p><a href="sqlrefgeospatial.html" class="link"
title="9.34. Geometry Data Types and Spatial Index Support">Geometry
Data Types and Spatial Index Support</a></p></li>
</ul>
</div></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

<span class="section">16.1. [Data
Representation](ch-rdfandsparql.html#rdfdatarepresentation)</span>

<span class="section">16.1.1. [IRI_ID
Type](ch-rdfandsparql.html#rdfiriidtype)</span>

<span class="section">16.1.2. [RDF_BOX
Type](ch-rdfandsparql.html#rdfboxtype)</span>

<span class="section">16.1.3. [RDF_QUAD and other
tables](ch-rdfandsparql.html#rdfquadtables)</span>

<span class="section">16.1.4. [Short, Long and SQL
Values](ch-rdfandsparql.html#rdfsqlmodes)</span>

<span class="section">16.1.5. [Programatically resolving
DB.DBA.RDF_QUAD.O to
SQL](ch-rdfandsparql.html#rdfsqlsparqlresolve)</span>

<span class="section">16.1.6. [Special Cases and XML Schema
Compatibility](ch-rdfandsparql.html#rdfxmlschemacompat)</span>

<span class="section">16.1.7. [SQL Compiler Support - QUIETCAST
option](ch-rdfandsparql.html#rdfquietcast)</span>

<span class="section">16.1.8. [Dynamic Renaming of Local
IRI's](ch-rdfandsparql.html#rdfdynamiclocal)</span>

<span class="section">16.2. [SPARQL](rdfsparql.html)</span>

<span class="section">16.2.1. [SPARQL Implementation
Details](rdfsparql.html#rdfsparqlimplementationextent)</span>

<span class="section">16.2.2. [Query
Constructs](rdfpredicatessparql.html)</span>

<span class="section">16.2.3. [SPARQL Web Services &
APIs](rdfsparqlprotocolendpoint.html)</span>

<span class="section">16.2.4. [Troubleshooting SPARQL
Queries](sparqldebug.html)</span>

<span class="section">16.2.5. [SPARQL Inline in
SQL](rdfsparqlinline.html)</span>

<span class="section">16.2.6. [API Functions](rdfapi.html)</span>

<span class="section">16.2.7. [Useful Internal
Functions](rdfinternalfunctions.html)</span>

<span class="section">16.2.8. [Default and Named
Graphs](rdfdefaultgraph.html)</span>

<span class="section">16.2.9. [Calling SQL from
SPARQL](rdfsqlfromsparql.html)</span>

<span class="section">16.2.10. [SPARQL
DESCRIBE](rdfsqlfromsparqldescribe.html)</span>

<span class="section">16.2.11. [Transitivity in
SPARQL](rdfsparqlimplementatiotrans.html)</span>

<span class="section">16.2.12. [Supported SPARQL-BI "define"
pragmas](rdfsparqlimplementatioptragmas.html)</span>

<span class="section">16.2.13. [Built-in bif
functions](rdfsparqlbif.html)</span>

<span class="section">16.2.14. [Sending SOAP Requests to Virtuoso SPARQL
Endpoint](rdfsparqlsoap.html)</span>

<span class="section">16.2.15. [Use of Hash Join With
RDF](rdfsparqlhashjoin.html)</span>

<span class="section">16.3. [Extensions](sparqlextensions.html)</span>

<span class="section">16.3.1. [Using Full Text Search in
SPARQL](sparqlextensions.html#rdfsparqlrulefulltext)</span>

<span class="section">16.3.2. [SPARUL -- an Update Language For RDF
Graphs](rdfsparul.html)</span>

<span class="section">16.3.3. [Business Intelligence Extensions for
SPARQL](sparqlbi.html)</span>

<span class="section">16.4. [RDF Graphs
Security](rdfgraphsecurity.html)</span>

<span class="section">16.4.1. [RDF Graph
Groups](rdfgraphsecurity.html#rdfgraphsecuritygroups)</span>

<span class="section">16.4.2. [NOT FROM and NOT FROM NAMED
Clauses](rdfgraphsecuritynotfrom.html)</span>

<span class="section">16.4.3. [Graph-Level
Security](rdfgraphsecuritylevel.html)</span>

<span class="section">16.4.4. [Graph-Level Security and
SQL](rdfgraphsecuritylevelrow.html)</span>

<span class="section">16.4.5. [Understanding Default
Permissions](rdfgraphsecurityunddefperm.html)</span>

<span class="section">16.4.6. [Initial Configuration of SPARQL
Security](rdfgraphsecurityintconfsec.html)</span>

<span class="section">16.4.7. [Application Callbacks for Graph Level
Security](rdfgraphsecurityappcallb.html)</span>

<span class="section">16.4.8. [Graph-level security and
sponging](rdfgraphsecurityspongeprivate.html)</span>

<span class="section">16.5. [Linked Data Views over RDBMS Data
Source](rdfviewsrdbms.html)</span>

<span class="section">16.5.1.
[Introduction](rdfviewsrdbms.html#rdfviewsintro)</span>

<span class="section">16.5.2. [Rationale](rdfviewrationale.html)</span>

<span class="section">16.5.3. [Quad Map Patterns, Values and IRI
Classes](rdfviewquadmapatternsvalueandiriclasses.html)</span>

<span class="section">16.5.4. [Configuring RDF
Storages](rdfviewconfiguringrdfstorages.html)</span>

<span class="section">16.5.5. [Translation Of SPARQL Triple Patterns To
Quad Map Patterns](rdfviewtranslationofpatterns.html)</span>

<span class="section">16.5.6. [Describing Source Relational
Tables](rdfviewdescribingsourcerelationaltables.html)</span>

<span class="section">16.5.7. [Function-Based IRI
Classes](rdfviewiriusingfunction.html)</span>

<span class="section">16.5.8. [Connection Variables in IRI
Classes](rdfconnvarsiniriclasses.html)</span>

<span class="section">16.5.9. [Lookup Optimization -- BIJECTION and
RETURNS Options](rdfviewbijandreturns.html)</span>

<span class="section">16.5.10. [Join Optimization -- Declaring IRI
Subclasses](rdfviewsubclasses.html)</span>

<span class="section">16.5.11. [RDF Metadata Maintenance and
Recovery](rdfmetadatarecovery.html)</span>

<span class="section">16.5.12. [Split Linked Data
View](splitrdfview.html)</span>

<span class="section">16.5.13. [Linked Data Views and recursive FK
relationships](rdfviewsrcur.html)</span>

<span class="section">16.6. [Automated Generation of Linked Data Views
over Relational Data Sources](rdfrdfviewgnr.html)</span>

<span class="section">16.6.1.
[Introduction](rdfrdfviewgnr.html#rdfrdfviewgnrintro)</span>

<span class="section">16.6.2. [One Click Linked Data Generation &
Deployment](rdfrdfviewgnroneclick.html)</span>

<span class="section">16.6.3. [Manual Linked Data Generation &
Deployment using the Conductor's HTML-based
wizard](rdfrdfviewgnrwizzard.html)</span>

<span class="section">16.6.4. [Manual Linked Data Generation &
Deployment using iSQL command-line](rdfrdfviewgnrisql.html)</span>

<span class="section">16.7. [Virtuoso R2RML Support](r2rml.html)</span>

<span class="section">16.7.1. [What is
R2RML?](r2rml.html#r2rmlwhat)</span>

<span class="section">16.7.2. [Why use it?](r2rmlwhy.html)</span>

<span class="section">16.7.3. [How do I use it with
Virtuoso?](r2rmlhow.html)</span>

<span class="section">16.7.4. [Known
Limitations](r2rmlknlim.html)</span>

<span class="section">16.7.5. [Generating an R2RML based Linked Data
View from iSQL command-line](r2rmlgenlviewisql.html)</span>

<span class="section">16.7.6. [Virtuoso Conductor R2RML Import
Wizard](r2rmlcondwiz.html)</span>

<span class="section">16.7.7. [Generate Transient and/or Persistent
Linked Data Views atop Remote Relational Data Sources Using
Conductor](r2rmlgentransperslviewrs.html)</span>

<span class="section">16.8. [Examples of Linked Data
Views](rdfviewsenterpr.html)</span>

<span class="section">16.8.1. [Simple Mapping Example -- Northwind
Linked Data View](rdfviewsenterpr.html#rdfviewnorthwindexample1)</span>

<span class="section">16.8.2. [BSBM to
RDF](rdfviewsenterprbsm.html)</span>

<span class="section">16.8.3. [TPCH to RDF](rdfviewsbusint.html)</span>

<span class="section">16.8.4. [TPCD to
RDF](rdfviewsbusinttpcd.html)</span>

<span class="section">16.8.5. [Thalia to
RDF](rdfviewsbusintthalia.html)</span>

<span class="section">16.8.6. [Musicbrainz to
RDF](rdfviewsbusintmbr.html)</span>

<span class="section">16.8.7. [Virtuoso ODS to
RDF](rdfviewsbusintods.html)</span>

<span class="section">16.8.8. [Sybase using demonstration 'pubs2'
database](rdfviewsenterprsyb.html)</span>

<span class="section">16.8.9. [Virtuoso's Northwind based Demo Database
(Tutorials variant) to RDF](rdfviewsenterprtn.html)</span>

<span class="section">16.8.10. [SQL Server's Northwind Demo
Database](rdfviewsenterprsn.html)</span>

<span class="section">16.8.11. [Oracle Demonstration 'HR'
Database](rdfviewsenterohr.html)</span>

<span class="section">16.8.12. [Oracle using the demonstration 'Human
Resources' database](rdfviewsenterprohd.html)</span>

<span class="section">16.8.13. [DB2 using the demonstration 'Sample'
database](rdfviewsenterprdb.html)</span>

<span class="section">16.8.14. [Informix using demonstration 'Stores'
database](rdfviewsenterprinf.html)</span>

<span class="section">16.8.15. [Ingres using demonstration 'Tutorial'
database](rdfviewsenterpringr.html)</span>

<span class="section">16.8.16. [Progress (SQL-89) using demonstration
'iSports' database](rdfviewsenterprs89.html)</span>

<span class="section">16.8.17. [Progress (SQL-92) using demonstration
'iSports' database](rdfviewsenterprs92.html)</span>

<span class="section">16.9. [RDF Insert Methods in
Virtuoso](rdfinsertmethods.html)</span>

<span class="section">16.9.1. [Using API
functions](rdfinsertmethods.html#rdfinsertmethodsapifunct)</span>

<span class="section">16.9.2. [SPARQL endpoint REST
API](rdfinsertmethodshttppost.html)</span>

<span class="section">16.9.3. [HTTP PUT using Content-Type:
application/rdf+xml](rdfinsertmethodshttpput.html)</span>

<span class="section">16.9.4. [SPARQL Insert using
LOAD](rdfinsertmethodsload.html)</span>

<span class="section">16.9.5. [SPARQL Insert via /sparql
endpoint](rdfindertmethodsparqlendpoint.html)</span>

<span class="section">16.9.6. [SPARQL Insert via SPARQL endpoint REST
API and ODS wiki](rdfinsertmethodsparqlqueryandodswiki.html)</span>

<span class="section">16.9.7. [Using
WebDAV](rdfinsertmethodwebdav.html)</span>

<span class="section">16.9.8. [Using Virtuoso
Crawler](rdfinsertmethodvirtuosocrawler.html)</span>

<span class="section">16.9.9. [Using SPARQL Query and Sponger (i.e. we
Fetch the Network Resources in the FROM Clause or values for the
graph-uri parameter in SPARQL protocol
URLs)](rdfinsertmethodsparqlqueryandsponger.html)</span>

<span class="section">16.9.10. [Using Virtuoso PL
APIs](rdfinsertmethodplapis.html)</span>

<span class="section">16.9.11. [Using SIMILE RDF Bank
API](rdfinsertmethodsimilerdfbankapi.html)</span>

<span class="section">16.9.12. [Using RDF
NET](rdfinsertmethodrdfnet.html)</span>

<span class="section">16.9.13. [Using the RDF Proxy (Sponger)
Service](rdfinsertmethodproxy.html)</span>

<span class="section">16.10. [RDFizer Middleware
(Sponger)](virtuososponger.html)</span>

<span class="section">16.10.1. [What Is The
Sponger?](virtuososponger.html#virtuosospongerintro)</span>

<span class="section">16.10.2. [Why is it
Important?](virtuosospongerimp.html)</span>

<span class="section">16.10.3. [How Does It
Work?](virtuosospongerworkpr.html)</span>

<span class="section">16.10.4. [Installation
Steps](virtuosospongerinstall.html)</span>

<span class="section">16.10.5. [Using The
Sponger](virtuosospongerusage.html)</span>

<span class="section">16.10.6. [Consuming the Generated RDF Structured
Data](virtuosospongerconsm.html)</span>

<span class="section">16.10.7. [RDF Cartridges Use
Cases](virtuosospongercartridgesextractorusecases.html)</span>

<span class="section">16.10.8. [Cartridge
Architecture](virtuosospongerarch.html)</span>

<span class="section">16.10.9. [Sponger Programmers
Guide](rdfspongerprogrammerguide.html)</span>

<span class="section">16.10.10. [Sponger and
Nanotations](virtuosospongernnt.html)</span>

<span class="section">16.10.11. [Sponger Usage
Examples](virtuosospongersampleuses.html)</span>

<span class="section">16.11. [Virtuoso Faceted Browser Installation and
configuration](virtuosospongerfacetinstall.html)</span>

<span class="section">16.11.1.
[Prerequisites](virtuosospongerfacetinstall.html#virtuosospongerfacetinstallprereq)</span>

<span class="section">16.11.2. [Pre
Installation](virtuosospongerfacetinstallpreinst.html)</span>

<span class="section">16.11.3. [VAD Package
Installation](virtuosospongerfacetinstallvadinst.html)</span>

<span class="section">16.11.4. [Post
Installation](virtuosospongerfacetinstallposinst.html)</span>

<span class="section">16.11.5. [URI
Labels](virtuosospongerfaceurilabels.html)</span>

<span class="section">16.11.6. [Usage
Statistics](virtuosospongerfaceusagest.html)</span>

<span class="section">16.11.7.
[Examples](virtuosospongerfacetexample.html)</span>

<span class="section">16.12. [Virtuoso Faceted Web
Service](virtuosospongerfacent.html)</span>

<span class="section">16.12.1.
[Customizing](virtuosospongerfacent.html#virtuosospongerfacentcust)</span>

<span class="section">16.12.2.
[Examples](virtuosospongerfacentexamples.html)</span>

<span class="section">16.12.3. [WebService
Interface](virtuosospongerfacentui.html)</span>

<span class="section">16.13. [Linked
Data](rdfiridereferencing.html)</span>

<span class="section">16.13.1. [IRI Dereferencing For FROM Clauses,
"define get:..." Pragmas](rdfiridereferencing.html#rdfinputgrab)</span>

<span class="section">16.13.2. [IRI Dereferencing For Variables, "define
input:grab-..." Pragmas](rdfinputgrab_01.html)</span>

<span class="section">16.13.3. [URL rewriting](urlrewriting.html)</span>

<span class="section">16.13.4. [Examples of other Protocol
Resolvers](rdfiridereferencingexamples.html)</span>

<span class="section">16.13.5. [Faceted Views over Large-Scale Linked
Data](rdfiridereferencingfacet.html)</span>

<span class="section">16.14. [Inference Rules &
Reasoning](rdfsparqlrule.html)</span>

<span class="section">16.14.1.
[Introduction](rdfsparqlrule.html#rdfsparqlruleintro)</span>

<span class="section">16.14.2. [Making Rule
Sets](rdfsparqlrulemake.html)</span>

<span class="section">16.14.3. [Changing Rule
Sets](rdfsparqlrulechange.html)</span>

<span class="section">16.14.4. [Subclasses and
Subproperties](rdfsparqlrulesubclassandsubprop.html)</span>

<span class="section">16.14.5. [OWL sameAs
Support](rdfsameas.html)</span>

<span class="section">16.14.6.
[Implementation](rdfsparqlruleimpl.html)</span>

<span class="section">16.14.7. [Enabling
Inferencing](rdfsparqlruleenableinfr.html)</span>

<span class="section">16.14.8.
[Examples](rdfsparqlruleexamples.html)</span>

<span class="section">16.14.9. [Identity With Inverse Functional
Properties](rdfsparqlruleinversefunc.html)</span>

<span class="section">16.14.10. [Inference Rules and SPARQL with
Transitivity Option](rdfsparqlruletransoption.html)</span>

<span class="section">16.14.11. [Inference Rules, OWL Support and
Relationship Ontology](rdfsparqlruleowlrelation.html)</span>

<span class="section">16.15. [RDF and
Geometry](rdfsparqlgeospat.html)</span>

<span class="section">16.15.1. [Programmatic Manipulation of Geometries
in RDF](rdfsparqlgeospat.html#rdfsparqlgeospatprog)</span>

<span class="section">16.15.2. [Creating Geometries From RDF
Data](rdfsparqlgeospatcrg.html)</span>

<span class="section">16.15.3. [Using Geometries With Existing
Databases](rdfsparqlgeospatusg.html)</span>

<span class="section">16.15.4. [GEO Spatial
Examples](rdfsparqlgeospatexmp.html)</span>

<span class="section">16.16. [RDF
Replication](rdfreplication.html)</span>

<span class="section">16.17. [RDF Performance
Tuning](rdfperformancetuning.html)</span>

<span class="section">16.17.1.
[General](rdfperformancetuning.html#rdfperfgeneral)</span>

<span class="section">16.17.2. [RDF Index
Scheme](rdfperfrdfscheme.html)</span>

<span class="section">16.17.3. [Index Scheme
Selection](rdfindexschemesel.html)</span>

<span class="section">16.17.4. [Manage Public Web Service
Endpoints](rdfperfindexes.html)</span>

<span class="section">16.17.5. [Erroneous Cost Estimates and Explicit
Join Order](rdfperfcost.html)</span>

<span class="section">16.17.6. [Using "swappiness" parameter ( Linux
only )](ch16s17s06.html)</span>

<span class="section">16.17.7. [Get All
Graphs](rdfperfgetallgraphs.html)</span>

<span class="section">16.17.8. [Rename RDF Graph and RDF Graph
Groups](rdfrenamegraph.html)</span>

<span class="section">16.17.9. [Dump and Reload
Graphs](rdfperfdumpandreloadgraphs.html)</span>

<span class="section">16.17.10. [RDF dumps from Virtuoso Quad store
hosted data into NQuad dumps](rdfperfdumpintonquads.html)</span>

<span class="section">16.17.11. [Dump Linked Data View Graph to
n3](rdfperfdumpandreloadgraphsn3.html)</span>

<span class="section">16.17.12. [Loading
RDF](rdfperfloading.html)</span>

<span class="section">16.17.13. [Using
SPARUL](rdfperfsparul.html)</span>

<span class="section">16.17.14. [DBpedia
Benchmark](rdfperfgeneraldbpedia.html)</span>

<span class="section">16.17.15. [RDF Store
Benchmarks](rdfstorebenchmarks.html)</span>

<span class="section">16.17.16. [Fast Approximate RDF Graph Diff and
Patch](fastapproxdiffandpatch.html)</span>

<span class="section">16.17.17. [RDB2RDF
Triggers](rdb2rdftriggers.html)</span>

<span class="section">16.18. [RDF Data Access Providers
(Drivers)](rdfnativestorageproviders.html)</span>

<span class="section">16.18.1. [Virtuoso Jena
Provider](rdfnativestorageproviders.html#rdfnativestorageprovidersjena)</span>

<span class="section">16.18.2. [Virtuoso Sesame
Provider](rdfnativestorageproviderssesame.html)</span>

<span class="section">16.18.3. [Virtuoso Redland
Provider](rdfnativestorageproviderredland.html)</span>

<span class="section">16.19. [RDF Graph
Replication](rdfgraphreplication.html)</span>

<span class="section">16.19.1. [Replication
Scenarios](rdfgraphreplication.html#rdfgraphreplicationscenr)</span>

<span class="section">16.19.2. [Replication
Topologies](rdfgraphreplicationtopl.html)</span>

<span class="section">16.19.3. [Set up RDF Replication via procedure
calls](rdfgraphreplicationsql.html)</span>

</div>

<div id="rdfdatarepresentation" class="section">

<div class="titlepage">

<div>

<div>

## 16.1. Data Representation

</div>

</div>

</div>

This section covers how Virtuoso stores RDF triples. The IRI_ID built-in
data type is introduced, along with the default table structures used
for triple persistency. These details are mostly hidden from users of
RDF, thus this section is not necessary reading for typical use of
Virtuoso with RDF.

<div id="rdfiriidtype" class="section">

<div class="titlepage">

<div>

<div>

### 16.1.1. IRI_ID Type

</div>

</div>

</div>

The central notion of RDF is the IRI, or URI, which serves as the
globally unique label of named nodes. The subject and predicate of a
triple are always IRI's and the object may be an IRI or any other XML
Schema scalar data type. In any case, an IRI is always distinct from any
instance of any other data type.

Virtuoso supports a native IRI_ID data type, internally an unsigned 32
bit or unsigned 64 bit integer value. Small databases can use 32 bit
values but if database becomes big then the administrator should execute
`DB.DBA.RDF_64BIT_UPGRADE` () procedure that will switch to 64-bit
values. This procedure takes time so if it is known in advance that the
database will grow to billions of nodes then it could be convenient to
upgrade it while it is empty. An IRI_ID is never equal to any instance
of any other type.

Thus, the object column of a table storing triples can be declared as
ANY and IRI values will be distinguishable without recourse to any extra
flag and IRI's will naturally occupy their own contiguous segment in the
ANY type collation sequence. Indices can be defined over such columns.
An IRI_ID is never automatically cast into any other type nor any other
type into IRI_ID.

The functions iri_id_num (in i IRI_ID) and iri_id_from_num (in n INT)
convert between signed integers and IRI_ID's. The function isiri_id (in
i any) returns nonzero if the argument is of type IRI_ID, zero
otherwise.

The syntax for an IRI_ID literal is
<span class="emphasis">*\#i\<NNN\>*</span> or
<span class="emphasis">*\#ib\<NNN\>*</span> , where
<span class="emphasis">*\<NNN\>*</span> is up to 20 decimal digits.
<span class="emphasis">*\#i12345*</span> is equal to
<span class="emphasis">*iri_id_from_num (12345)*</span> and
<span class="emphasis">*\#ib12345*</span> is equal to
<span class="emphasis">*iri_id_from_num (12345) + min_64bit_bnode_iri_id
()*</span> .

When received by a SQL client application, the ODBC driver or
interactive SQL will bind an IRI_ID to a character buffer, producing the
<span class="emphasis">*\#i\<NNN\>*</span> syntax. When passing IRI_ID's
from a client, one can pass an integer and use the iri_id_from_num ()
function in the statement to convert server side. A SQL client will
normally not be exposed to IRI_ID's since the SPARQL implementation
returns IRI's in their text form, not as internal id's. These will
however be seen if reading the internal tables directly.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                           |
|:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                                                                                                                                                                      |
|                              | Nobody, even DBA, should write directly to internal RDF tables, because some data from that tables are cached in a special way and cache is not automatically updated when content of tables has changed. |

</div>

<span class="emphasis">*Example*</span>

The following example demonstrates IRI type usage as Virtuoso PL
function parameter:

``` programlisting
SQL>create procedure vs_property_label (in _uri varchar)
  {
    declare res varchar;
    result_names (res);
    for (sparql define input:storage "" select distinct ?graph_rvr_fixed where { graph `iri(?:_uri)` { ?qmv virtrdf:qmGraphRange-rvrFixedValue ?graph_rvr_fixed}})
    do {
      result ("graph_rvr_fixed");
    }
  }
;
Done. -- 0 msec.

SQL>select vs_property_label('http://www.openlinksw.com/schemas/virtrdf#');
res
VARCHAR
_______________________________________________________________________________

http://demo.openlinksw.com/Northwind
http://demo.openlinksw.com/tpch
http://demo.openlinksw.com/tpcd
http://demo.openlinksw.com/bsbm
http://demo.openlinksw.com/tutorial/Northwind
http://demo.openlinksw.com/thalia
http://demo.openlinksw.com/tutorial_view
http://demo.openlinksw.com/ecrm
http://demo.openlinksw.com/sys
http://demo.openlinksw.com/Doc
http://demo.openlinksw.com/informix/stores_demo
http://demo.openlinksw.com/oraclehr
http://demo.openlinksw.com/db2sample
http://demo.openlinksw.com/ingrestut
http://demo.openlinksw.com/sybasepubs2
http://demo.openlinksw.com/MSPetShop#
http://demo.openlinksw.com/oracle#
http://demo.openlinksw.com/progress/isports
http://demo.openlinksw.com/wpl_v
http://demo.openlinksw.com/mw_v
http://demo.openlinksw.com/drupal_v
0

22 Rows. -- 241 msec.
```

</div>

<div id="rdfboxtype" class="section">

<div class="titlepage">

<div>

<div>

### 16.1.2. RDF_BOX Type

</div>

</div>

</div>

While strings, numbers, dates and XML entities are "native" SQL
datatypes, RDF literal with non-default type or language have no exact
matches among standard SQL types. Virtuoso introduces a special data
type called "RDF_BOX" in order to handle that cases. Instance of RDF_BOX
consists of data type, language, the content (or beginning characters of
a long content) and a possible reference to DB.DBA.RDF_OBJ table if the
object is too long to be held in-line in some table or should be
outlined for free-text indexing.

Usually applications do not need to access internals of an RDF boxes.
This datatype is used in system tables but almost all SPARQL and RDF
operations use standard SQL datatypes for arguments and return values.

</div>

<div id="rdfquadtables" class="section">

<div class="titlepage">

<div>

<div>

### 16.1.3. RDF_QUAD and other tables

</div>

</div>

</div>

The main tables of the default RDF storage system are:

``` programlisting
create table DB.DBA.RDF_QUAD (
  G IRI_ID,
  S IRI_ID,
  P IRI_ID,
  O any,
  primary key (G,S,P,O) );
create bitmap index RDF_QUAD_OGPS on DB.DBA.RDF_QUAD (O, G, P, S);
```

Each triple (more correctly, each quad) is represented by one row in
RDF_QUAD. The columns represent the graph, subject, predicate and
object. The IRI_ID type columns reference RDF_IRI, which translates the
internal id to the external name of the IRI. The O column is of type
ANY. If the O value is a non-string SQL scalar, such as a number or date
or IRI, it is stored in its native binary representation. If it is a
"very short" string (20 characters or less), it is also stored "as is".
Long strings and RDF literal with non-default type or language are
stored as RDF_BOX values. Instance of rdf_box consists of data type,
language, the content (or beginning characters of a long content) and a
possible reference to RDF_OBJ if the object is too long to be held
in-line in this table or should be outlined for free-text indexing.

``` programlisting
create table DB.DBA.RDF_PREFIX (
  RP_NAME varchar primary key,
  RP_ID int not null unique );
create table DB.DBA.RDF_IRI (
  RI_NAME varchar primary key,
  RI_ID IRI_ID not null unique );
```

These two tables store a mapping between internal IRI id's and their
external string form. A memory-resident cache contains recently used
IRIs to reduce access to this table. Function id_to_iri (in id IRI_ID)
returns the IRI by its ID. Function iri_to_id (in iri varchar, in
may_create_new_id) returns an IRI_ID for given string; if the string is
not used before as an IRI then either NULL is returned or a new ID is
allocated, depending on the second argument.

``` programlisting
create table DB.DBA.RDF_OBJ (
  RO_ID integer primary key,
  RO_VAL varchar,
  RO_LONG long varchar,
  RO_DIGEST any
)
create index RO_VAL on DB.DBA.RDF_OBJ (RO_VAL)
create index RO_DIGEST on DB.DBA.RDF_OBJ (RO_DIGEST)
;
```

When an O value of RDF_QUAD is longer than a certain limit or should be
free-text indexed, the value is stored in this table. Depending on the
length of the value, it goes into the varchar or the long varchar
column. The RO_ID is contained in rdf_box object that is stored in the O
column. Still, the truncated value of O can be used for determining
equality and range matching, even if \< and \> of closely matching
values need to look at the real string in RDF_OBJ. When RO_LONG is used
to store very long value, RO_VAL contains a simple checksum of the
value, to accelerate search for identical values when the table is
populated by new values.

``` programlisting
create table DB.DBA.RDF_DATATYPE (
    RDT_IID IRI_ID not null primary key,
    RDT_TWOBYTE integer not null unique,
    RDT_QNAME varchar );
```

The XML Schema data type of a typed string O represented as 2 bytes in
the O varchar value. This table maps this into the broader IRI space
where the type URI is given an IRI number.

``` programlisting
create table DB.DBA.RDF_LANGUAGE (
    RL_ID varchar not null primary key,
    RL_TWOBYTE integer not null unique );
```

The varchar representation of a O which is a string with language has a
two byte field for language. This table maps the short integer language
id to the real language name such as 'en', 'en-US' or 'x-any'.

<span class="emphasis">*Note that unlike datatype names, language names
are not URIs.*</span>

A short integer value can be used in both RDF_DATATYPE and RDF_LANGUAGE
tables for two different purposes. E.g. an integer 257 is for
'unspecified datatype' as well as for 'unspecified language'.

</div>

<div id="rdfsqlmodes" class="section">

<div class="titlepage">

<div>

<div>

### 16.1.4. Short, Long and SQL Values

</div>

</div>

</div>

When processing an O, the SPARQL implementation may have it in one of
three internal formats, called "valmodes". The below cases apply for
strings:

The short format is the format where an O is stored in RDF_QUAD.

The long value is similar to short one but an rdf_box object, that
consists of six fields:

<div class="itemizedlist">

- short integer id of type referencing RDT_TWOBYTE, 257 if the type is
  not specified,

- the string as inlined in O or as stored in RO_VAL or RO_LONG,

- the RO_ID if the string is from RDF_OBJ (otherwise zero),

- the short integer id of language referencing RL_TWOBYTE, 257 if the
  language is not specified,

- flag whether the stored string value is complete or it is only the
  beginning that is inlined in O.

</div>

The SQL value is the string as a narrow string representing the UTF8
encoding of the value, stripped of data type and language tag.

The SQL form of an IRI is the string. The long and short forms are the
IRI_ID referencing RU_IRI_ID of RDF_URL.

For all non-string, non-IRI types, the short, long and SQL values are
the same SQL scalar of the appropriate native SQL type. A SQL host
variable meant to receive an O should be of the ANY type.

The SPARQL implementation will usually translate results to the SQL
format before returning them. Internally, it uses the shortest possible
form suited to the operation. For equalities and joining, the short form
is always good. For range comparisons, the long form is needed etc. For
arithmetic, all three forms will do since the arguments are expected to
be numbers which are stored as their binary selves in O, thus the O
column unaltered and uncast will do as an argument of arithmetic or
numeric comparison with, say, SQL literal constants.

</div>

<div id="rdfsqlsparqlresolve" class="section">

<div class="titlepage">

<div>

<div>

### 16.1.5. Programatically resolving DB.DBA.RDF_QUAD.O to SQL

</div>

</div>

</div>

This section describes how to resolve programatically the internal
representation of DB.DBA.RDF_QUAD.O to its SQL value.

When operating over RDF_QUAD table directly, in order to transform all
values obtained from column O to the explicit SQL type in a programmatic
way, should be used the following hints depending on the case:

<div class="itemizedlist">

- The SQL value can be extracted as

  <span class="emphasis">*\_\_ro2sq(O)*</span>

  .

- The datatype can be extracted as

  <span class="emphasis">*DB.DBA.RDF_DATATYPE_OF_OBJ (O)*</span>

  if IRI_ID of the type is enough or

  <span class="emphasis">*\_\_ro2sq (
  DB.DBA.RDF_DATATYPE_OF_OBJ(O))*</span>

- The language can be extracted as

  <span class="emphasis">*DB.DBA.RDF_LANGUAGE_OF_OBJ (O)*</span>

  .

</div>

It could be helpful to be created an Linked Data View for a custom table
with formats rdfdf:default or rdfdf:default-nullable for columns similar
to O, and let SPARQL perform the rest.

To track SPARQL, use the following functions:

``` programlisting
select sparql_to_sql_text ('query text here without a leading SPARQL keyword and trailing semicolon')
```

or

``` programlisting
string_to_file ('filename.sql', sparql_to_sql_text ('query text'), -2);
```

So for example to track the following SPARQL query:

``` programlisting
SPARQL define input:storage ""
select distinct ?graph_rvr_fixed
from <http://www.openlinksw.com/schemas/virtrdf#>
where { ?qmv virtrdf:qmGraphRange-rvrFixedValue ?graph_rvr_fixed }
```

execute

``` programlisting
SQL>select sparql_to_sql_text('define input:storage "" select distinct ?graph_rvr_fixed from <http://www.openlinksw.com/schemas/virtrdf#> where { ?qmv virtrdf:qmGraphRange-rvrFixedValue ?graph_rvr_fixed }');
callret
VARCHAR
_______________________________________________________________________________

 SELECT  __ro2sq ("s-1-0_rbc"."graph_rvr_fixed") AS "graph_rvr_fixed" FROM (SELECT DISTINCT __rdf_sqlval_of_obj ( /*retval[*/ "s-1-1-t0"."O" /* graph_
rvr_fixed */ /*]retval*/ ) AS /*tmpl*/ "graph_rvr_fixed"
    FROM DB.DBA.RDF_QUAD AS "s-1-1-t0"
    WHERE /* field equal to URI ref */
        "s-1-1-t0"."G" = __i2idn ( /* UNAME as sqlval */ __box_flags_tweak ( 'http://www.openlinksw.com/schemas/virtrdf#' , 1))
        AND  /* field equal to URI ref */
        "s-1-1-t0"."P" = __i2idn ( /* UNAME as sqlval */ __box_flags_tweak ( 'http://www.openlinksw.com/schemas/virtrdf#qmGraphRange-rvrFixedValue' ,
1))
OPTION (QUIETCAST)) AS "s-1-0_rbc"

1 Rows. -- 321 msec.
```

or

``` programlisting
SQL>string_to_file ('mytest.sql', sparql_to_sql_text ('define input:storage "" select distinct ?graph_rvr_fixed from <http://www.openlinksw.com/schemas/virtrdf#> where { ?qmv virtrdf:qmGraphRange-rvrFixedValue ?graph_rvr_fixed }'), -2);
```

As result will be created file with the given name, i.e. mytest.sql and
its content should be:

``` programlisting
 SELECT  __ro2sq ("s-1-0_rbc"."graph_rvr_fixed") AS "graph_rvr_fixed" FROM (SELECT DISTINCT __rdf_sqlval_of_obj ( /*retval[*/ "s-1-1-t0"."O" /* graph_rvr_fixed */ /*]retval*/ ) AS /*tmpl*/ "graph_rvr_fixed"
    FROM DB.DBA.RDF_QUAD AS "s-1-1-t0"
    WHERE /* field equal to URI ref */
        "s-1-1-t0"."G" = __i2idn ( /* UNAME as sqlval */ __box_flags_tweak ( 'http://www.openlinksw.com/schemas/virtrdf#' , 1))
        AND  /* field equal to URI ref */
        "s-1-1-t0"."P" = __i2idn ( /* UNAME as sqlval */ __box_flags_tweak ( 'http://www.openlinksw.com/schemas/virtrdf#qmGraphRange-rvrFixedValue' , 1))
OPTION (QUIETCAST)) AS "s-1-0_rbc"
```

</div>

<div id="rdfxmlschemacompat" class="section">

<div class="titlepage">

<div>

<div>

### 16.1.6. Special Cases and XML Schema Compatibility

</div>

</div>

</div>

We note that since we store numbers as the equivalent SQL binary type,
we do not preserve the distinction of byte, boolean etc. These all
become integer. If preserving such detail is for some reason important,
then storage as a typed string is possible but is not done at present
for reasons of compactness and performance.

</div>

<div id="rdfquietcast" class="section">

<div class="titlepage">

<div>

<div>

### 16.1.7. SQL Compiler Support - QUIETCAST option

</div>

</div>

</div>

The type cast behaviors of SQL and SPARQL are different. SQL will
generally signal an error when an automatic cast fails. For example, a
string can be compared to a date column if the string can be parsed as a
date but otherwise the comparison should signal an error. In SPARQL,
such situations are supposed to silently fail. Generally, SPARQL is much
more relaxed with respect to data types.

These differences will be specially noticed if actual SQL data is
processed with SPARQL via some sort of schema mapping translating
references to triples into native tables and columns.

Also, even when dealing with the triple-oriented RDF_QUAD table, there
are cases of joining between S and O such that the O can be a
heterogeneous set of IRI's and other data whereas the S is always an
IRI. The non-IRI to IRI comparison should not give cast errors but
should silently fail. Also, in order to keep queries simple and easily
optimizable, it should not be necessary to introduce extra predicates
for testing if the O is n IRI before comparing with the S.

Due to these considerations, Virtuoso introduces a SQL statement option
called QUIETCAST. When given in the OPTION clause of a SELECT, it
switches to silent fail mode for automatic type casting.

The syntax is as follows:

``` programlisting
SELECT ...
FROM .... OPTION (QUIETCAST)
```

This option is automatically added by the SPARQL to SQL translator. The
scope is the enclosing procedure body.

</div>

<div id="rdfdynamiclocal" class="section">

<div class="titlepage">

<div>

<div>

### 16.1.8. Dynamic Renaming of Local IRI's

</div>

</div>

</div>

There are cases where it is desirable to have IRI's in RDF storage that
will change to reflect a change of the host name of the containing
store. This is specifically true of DAV resource metadata for local DAV
resources. Such IRI's must be stored prefixed with `local:` .

If a user application makes statements with such a URI, then these
statements will be returned with local: substituted with a prefix taken
from the context as described below.

When returning IRI's from id's, this prefix is replaced by the Host
header of the HTTP request and if not running with HTTP, with the
DefaultHost from URIQA. This behavior is always in effect.

When converting strings to IRI id's, the `local:` prefix may or may not
be introduced depending on ini file and other context factors. If
<a href="ch-server.html#virtini" class="link"
title="Virtuoso Configuration File">DynamicLocal</a> defined in the
\[URIQA\] section of the Virtuoso INI file is on and the host part of
the IRI matches the Host header of the HTTP request in context or the
DefaultHost if outside of HTTP context, then this is replaced with
local: before looking up the IRI ID. Even if DynamicLocal is not on and
the `local:` prefix occurs in the IRI string being translated to id, the
translating the IRI_ID back to the IRI name will depend on the context
as described above.

The effects of DynamicLocal = 1 can be very confusing since many names
can refer to the exact same thing. For example, if the DefaultHost is
dbpedia.org,
`iri_to_id ('http://dbpedia.org/resource/Paris') = iri_to_id ('local:///resource/Paris) `
is true and so is
`'http://dbpedia.org/resource/Paris' = id_to_iri (iri_to_id ('local://resource/Paris'))`
These hold in a SQL client context, i.e. also when connected through RDF
frameworks like Jena or Sesame. When running a SPARQL protocol request,
the Host: header influences the behavior, likewise when using web
interactive SQL in Conductor. Also be careful when loading RDF files
that may have URI's corresponding to the local host name.

</div>

</div>

</div>
