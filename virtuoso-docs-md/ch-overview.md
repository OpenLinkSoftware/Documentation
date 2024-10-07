<div id="ch-overview" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 1. Overview

</div>

<div>

<div class="abstract">

**Abstract**

A quick overview on Virtuoso providing answers to simple questions that
may already be in mind.

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

<span class="section">1.1. [What is
Virtuoso?](ch-overview.html#whatisvirtuoso)</span>

<span class="section">1.2. [Why Do I Need
Virtuoso?](virtwhydoi.html)</span>

<span class="section">1.3. [Key Features of
Virtuoso](whatisnewto2x.html)</span>

<span class="section">1.3.1. [XML Document Storage &
Creation](whatisnewto2x.html#oxmldocstore)</span>

<span class="section">1.3.2. [Web Page
Hosting](ointernetsrv.html)</span>

<span class="section">1.3.3. [Web Services Creation &
Hosting](owebsrvhost.html)</span>

<span class="section">1.3.4. [WebDAV Compliant Web
Store](owebdavstore.html)</span>

<span class="section">1.3.5. [Content Replication &
Synchronization](oreplandsync.html)</span>

<span class="section">1.3.6. [Transparent Access To Heterogeneous
Data](ophetdata.html)</span>

<span class="section">1.3.7. [Mail Delivery & Retrieval
Services](omaildelresrv.html)</span>

<span class="section">1.3.8. [NNTP Aggregation &
Serving](onntp.html)</span>

<span class="section">1.4. [Virtuoso FAQ](virtuosofaq.html)</span>

<span class="section">1.4.1. [What is the storage cost per
triple?](virtuosofaq.html#virtuosofaq1)</span>

<span class="section">1.4.2. [What is the cost to insert a triple (for
the insertion itself, as well as for updating any
indices)?](virtuosofaq2.html)</span>

<span class="section">1.4.3. [What is the cost to delete a triple (for
the deletion itself, as well as for updating any
indices)?](virtuosofaq3.html)</span>

<span class="section">1.4.4. [What is the cost to search on a given
property?](virtuosofaq4.html)</span>

<span class="section">1.4.5. [What data types are
supported?](virtuosofaq5.html)</span>

<span class="section">1.4.6. [What inferencing is
supported?](virtuosofaq6.html)</span>

<span class="section">1.4.7. [Is the inferencing dynamic, or is an extra
step required before inferencing can be used?](virtuosofaq7.html)</span>

<span class="section">1.4.8. [Do you support full-text
search?](virtuosofaq8.html)</span>

<span class="section">1.4.9. [What programming interfaces are supported?
Do you support standard SPARQL protocol?](virtuosofaq9.html)</span>

<span class="section">1.4.10. [How can data be partitioned across
multiple servers?](virtuosofaq10.html)</span>

<span class="section">1.4.11. [How many triples can a single server
handle?](virtuosofaq11.html)</span>

<span class="section">1.4.12. [What is the performance impact of going
from the billion to the trillion triples?](virtuosofaq12.html)</span>

<span class="section">1.4.13. [Do you support additional metadata for
triples, such as time-stamps, security tags
etc?](virtuosofaq13.html)</span>

<span class="section">1.4.14. [Should we use RDF for our large metadata
store? What are the alternatives?](virtuosofaq14.html)</span>

<span class="section">1.4.15. [How multithreaded is
Virtuoso?](virtuosofaq15.html)</span>

<span class="section">1.4.16. [Can multiple servers run off a single
shared disk database?](virtuosofaq16.html)</span>

<span class="section">1.4.17. [Can Virtuoso run on a
SAN?](virtuosofaq17.html)</span>

<span class="section">1.4.18. [How does Virtuoso join across
partitions?](virtuosofaq18.html)</span>

<span class="section">1.4.19. [Does Virtuoso support federated triple
stores? If there are multiple SPARQL end points, can Virtuoso be used to
do queries joining between these?](virtuosofaq19.html)</span>

<span class="section">1.4.20. [How many servers can a cluster
contain?](virtuosofaq20.html)</span>

<span class="section">1.4.21. [How do I reconfigure a cluster, adding
and removing machines, etc?](virtuosofaq21.html)</span>

<span class="section">1.4.22. [How will Virtuoso handle regional
clusters?](virtuosofaq22.html)</span>

<span class="section">1.4.23. [Is there a mechanism for terminating long
running queries?](virtuosofaq23.html)</span>

<span class="section">1.4.24. [Can the user be asynchronously notified
when a long running query terminates?](virtuosofaq24.html)</span>

<span class="section">1.4.25. [How many concurrent queries can Virtuoso
handle?](virtuosofaq25.html)</span>

<span class="section">1.4.26. [What is the relative performance of
SPARQL queries vs native relational queries?](virtuosofaq26.html)</span>

<span class="section">1.4.27. [Does Virtuoso Support Property
Tables?](virtuosofaq27.html)</span>

<span class="section">1.4.28. [What performance metrics does Virtuoso
offer?](virtuosofaq28.html)</span>

<span class="section">1.4.29. [What support do you provide for
concurrent/multithreaded operation? Is your interface
thread-safe?](virtuosofaq29.html)</span>

<span class="section">1.4.30. [What level of ACID properties is
supported?](virtuosofaq30.html)</span>

<span class="section">1.4.31. [Do you provide the ability to atomically
add a set of triples, where either all are added or none are
added?](virtuosofaq31.html)</span>

<span class="section">1.4.32. [Do you provide the ability to add a set
of triples, respecting the isolation property (so concurrent accessors
either see none of the triple values, or all of
them)?](virtuosofaq32.html)</span>

<span class="section">1.4.33. [What is the time to start a database,
create/open a graph?](virtuosofaq33.html)</span>

<span class="section">1.4.34. [What sort of security features are built
into Virtuoso?](virtuosofaq33_01.html)</span>

<span class="section">1.5. [Tips and
Tricks](virtuosotipsandtricks.html)</span>

<span class="section">1.5.1. [How Can I convert triples with geo
properties to geometries to use spartial
query?](virtuosotipsandtricks.html#virtuosotipsandtricksgeotr) </span>

<span class="section">1.5.2. [How Can I execute SPARQL queries
containing '\$' character using
ISQL?](virtuosotipsandtricksspchar.html)</span>

<span class="section">1.5.3. [How can I find on which table deadlocks
occur?](virtuosotipsandtricksfinddeadlockstables.html)</span>

<span class="section">1.5.4. [How Can I configure parameters to avoid
out of memory error?](virtuosotipsandtricksoutotmemoryerror.html)</span>

<span class="section">1.5.5. [What are "Generate RDB2RDF triggers" and
"Enable Data Syncs with Physical Quad Store" Linked Data Views
options?](virtuosotipsandtricksrdftriggersoptions.html)</span>

<span class="section">1.5.6. [How to Manage Date Range SPARQL
queries?](virtuosotipsandtricksmanagedaterangequery.html)</span>

<span class="section">1.5.7. [How can I see which quad storages exist
and in which quad storage a graph
resides?](virtuosotipsandtricksquadstorageinternally.html)</span>

<span class="section">1.5.8. [Can I drop and re-create the
DefaultQuadStorage?](virtuosotipsandtricksdroprecrdefstrg.html)</span>

<span class="section">1.5.9. [How to display only some information from
RDF graph?](virtuosotipsandtricksgraphsecurity.html)</span>

<span class="section">1.5.10. [Is it possible to have the SPARQL
endpoint on a different port than the
Conductor?](virtuosotipsandtrickssparqlcondport.html)</span>

<span class="section">1.5.11. [How to enable the Virtuoso Entity
Framework 3.5 ADO.Net Provider in Visual Studio
2010?](virtuosotipsandtricksenableadonetvs2010.html)</span>

<span class="section">1.5.12. [How Can I Control the normalization of
UNICODE3 accented chars in free-text
index?](virtuosotipsandtrickscontrolunicode3.html)</span>

<span class="section">1.5.13. [How Can I define graph with
virt:rdf_sponger option set to
"on"?](virtuosotipsandtricksdefinegraphwithspongeroption.html)</span>

<span class="section">1.5.14. [How do I use SPARUL to change a selection
of property values from URI References to
Literals?](virtuosotipsandtricksconvprstr.html)</span>

<span class="section">1.5.15. [How is a Checkpoint performed against a
Virtuoso Clustered Server?](virtuosotipsandtricksbulkloadcl.html)</span>

<span class="section">1.5.16. [How can I use CONSTRUCT with
PreparedStatements?](virtuosotipsandtrickconstrprst.html)</span>

<span class="section">1.5.17. [How can perform SPARQL Updates without
transactional log size getting
exceed?](virtuosotipsandtrickssparulupdatestrl.html)</span>

<span class="section">1.5.18. [How can I write custom crawler using
PL?](virtuosotipsandtrickscrawlercustompl.html)</span>

<span class="section">1.5.19. [How Can I Get an exact mapping for a
date?](virtuosotipsandtrickscrawlercustomde.html)</span>

<span class="section">1.5.20. [How Can I Get certificate attributes
using SPARQL?](virtuosotipsandtricksgetcertattr.html)</span>

<span class="section">1.5.21. [How can I make Multi Thread Virtuoso
connection using
JDBC?](virtuosotipsandtricksmultithreadjdbc.html)</span>

<span class="section">1.5.22. [How Do I Perform Bulk Loading of RDF
Source Files into one or more Graph
IRIs?](virtuosotipsandtricksgetcertattr_01.html)</span>

<span class="section">1.5.23. [How to exploit RDF Schema and OWL
Inference Rules with minimal
effort?](virtuosotipsandtricksrdfschowlinfrl.html)</span>

<span class="section">1.5.24. [How can I dump arbitrary query result as
N-Triples?](virtuosotipsandtricksdumparbqntr.html)</span>

<span class="section">1.5.25. [How do I bind named graph parameter in
prepared statement?](virtuosotipsandtrickbindnmgrprst.html)</span>

<span class="section">1.5.26. [How can I insert binary data to Virtuoso
RDF storage in plain queries and with parameter binding via ADO.NET
calls?](virtuosotipsandtricksadonetinsb.html)</span>

<span class="section">1.5.27. [How can I insert RDF data from Visual
Studio to Virtuoso?](instrdfvs.html)</span>

<span class="section">1.5.28. [How does default describe mode
work?](descrmd.html)</span>

<span class="section">1.5.29. [What should I do if the Virtuoso Server
is not responding to HTTP requests?](notresphttp.html)</span>

<span class="section">1.5.30. [What CXML params are supported for the
SPARQL URL pattern?](cxmlurlptrn.html)</span>

<span class="section">1.5.31. [How can I replicate all
graphs?](replallgr.html)</span>

<span class="section">1.5.32. [What is best method to get a random
sample of all triples for a subset of all the resources of a SPARQL
endpoint?](rndsalltr.html)</span>

<span class="section">1.5.33. [How can I replicate all
graphs?](replallgr_01.html)</span>

<span class="section">1.5.34. [How can I use SPARQL to make
Meshups?](sparqlmkmeshup.html)</span>

<span class="section">1.5.35. [How can I use the net_meter utility
before starting the ingestion to a
cluster?](clusternetmeter.html)</span>

<span class="section">1.5.36. [How can I use the LOAD command to import
RDF data?](loadcmrdf.html)</span>

<span class="section">1.5.37. [How can I delete graphs using stored
procedure?](degrprc.html)</span>

<span class="section">1.5.38. [How can I use SPARUL to add missing
triples to a Named Graph?](sparulspongertut.html)</span>

<span class="section">1.5.39. [How can I use the SPARQL IF operator for
SPARQL-BI endpoint?](ifsparqlbi.html)</span>

<span class="section">1.5.40. [How can I handle checkpoint
condition?](chpntset.html)</span>

<span class="section">1.5.41. [How can I incorporate Content Negotiation
into RDF bulk loaders?](inccntnegt.html)</span>

<span class="section">1.5.42. [Virtuoso Linked Data Deployment In 3
Simple Steps?](linkeddata3simplesteps.html)</span>

<span class="section">1.5.43. [What are the differences between create,
drop, clear and delete Graph?](difcrdrdelgr.html)</span>

<span class="section">1.5.44. [How can I perform search for predicate
values?](srchprd.html)</span>

<span class="section">1.5.45. [How can I use INSERT via CONSTRUCT
Statements?](constrinserst.html)</span>

<span class="section">1.5.46. [How to clear graphs which are related to
empty graphs?](cleargraphrelemtgr.html)</span>

<span class="section">1.5.47. [How can I use sub-queries to enable
literal values based joins?](subqrbl.html)</span>

<span class="section">1.5.48. [How can I execute query with labels
preference order?](sparqlpreforder.html)</span>

<span class="section">1.5.49. [How can I get object
datatype?](getobjdtype.html)</span>

<span class="section">1.5.50. [How Can I Backup and Restore individual
table(s) and individual index(s)?](howbackuprestoreind.html)</span>

<span class="section">1.5.51. [What bif:contains free-text options can I
use?](bifcontainsoptions.html)</span>

<span class="section">1.5.52. [What SPARQL Endpoint Protection Methods
can I use?](sparqlendpointprotection.html)</span>

<span class="section">1.5.53. [How do I assign SPARQL role to SQL
user?](sparqlassignrole.html)</span>

<span class="section">1.5.54. [How Do I Gecode
Data?](gecodedata.html)</span>

<span class="section">1.5.55. [How Can I Delete a Specific Triple Across
Graphs?](delsptriple.html)</span>

<span class="section">1.5.56. [How Do I Use NOT EXISTS in SPARQL
Query?](sparqlnotexists.html)</span>

<span class="section">1.5.57. [How Do I Use MINUS in SPARQL
Query?](sparqlminus.html)</span>

<span class="section">1.5.58. [How Do I Use Transitive SPARQL Query
Options and Exploit Inference
Rules?](subclassofinferenceoptions.html)</span>

<span class="section">1.5.59. [What is the difference between the
functions SAMPLE, GROUP_CONCAT and
GROUP_DIGEST?](samplegroupconcatdigest.html)</span>

<span class="section">1.5.60. [How Do I use CONSTRUCT with objects which
are value of aggregate function?](constructaggfunc.html)</span>

<span class="section">1.5.61. [How Do I Clean Up Errant Data using
SPARQL Update Language?](sparqlcleanerrantdata.html)</span>

<span class="section">1.5.62. [How to Use SPARQL to add missing
isDefinedBy relations to an
Ontology?](sparqladdmissingtriples.html)</span>

<span class="section">1.5.63. [How Can I execute load of sql dump from
jdbc?](loadsqldjdbc.html)</span>

<span class="section">1.5.64. [How Can I Use MODIFY to update
triples?](usemodifyasinsert.html)</span>

<span class="section">1.5.65. [How Can I execute INSERT/DELETE (SPARUL)
statements against a WebID? protected SPARQL
endpoint?](exectinsdelsparqilwebid.html)</span>

<span class="section">1.5.66. [How can I make HTTP Logging and Recording
in Virtuoso?](loggingandrecording.html)</span>

<span class="section">1.5.67. [Quad Store Data Loading via Virtuoso's
In-built Content Crawler?](rdfinsertcrawlingmethods.html)</span>

<span class="section">1.5.68. [What is the ShortenLongURIs Virtuoso
configuration parameter?](setshortenlongurisparam.html)</span>

<span class="section">1.5.69. [How Can I send SOAP requests to Virtuoso
SPARQL Endpoint?](soaprequestoversparqlendpoint.html)</span>

<span class="section">1.5.70. [How Can I Delete Triples containing blank
nodes?](howtodeleteblanknodes.html)</span>

<span class="section">1.5.71. [How Can I Get a full explain plan for a
simple SPARQL query?](howtogetfullexplainplanforsparqlquery.html)</span>

<span class="section">1.5.72. [How Can I Use Expressions inside
CONSTRUCT, INSERT and DELETE {...}
Templates?](expressionsusage.html)</span>

<span class="section">1.5.73. [How to optimize bif:dateadd in SPARQL
query using selective index-friendly
filter?](sparqldatediffindexfriendly.html)</span>

<span class="section">1.5.74. [How can I Determine the data usage across
a Virtuoso instance?](determinedatausagetip.html)</span>

<span class="section">1.5.75. [How to discover the capabilities of a
SPARQL endpoint to enhancing SPARQL-FED usage from Virtuoso
instances?](discoversparqlfedcapabtip.html)</span>

<span class="section">1.5.76. [How to split a urlencoded ";-" separated
list of urls in a SPARQL query?](howtospliturlencodedlist.html)</span>

<span class="section">1.5.77. [How to Update Large SPARQL Data avoiding
due to database checkpoint
abortion?](howtoloadlargedatanocheckpointabort.html)</span>

<span class="section">1.5.78. [How to Manage SSL Protocols and Ciphers
used with Virtuoso?](howtomanagesslprotocolsandciphers.html)</span>

</div>

<div id="whatisvirtuoso" class="section">

<div class="titlepage">

<div>

<div>

## 1.1. What is Virtuoso?

</div>

</div>

</div>

OpenLink Virtuoso is the first CROSS PLATFORM Universal Server to
implement Web, File, and Database server functionality alongside Native
XML Storage, and Universal Data Access Middleware, as a single server
solution. It includes support for key Internet, Web, and Data Access
standards such as: XML, XPATH, XSLT, SOAP, WSDL, UDDI, WebDAV, SMTP,
SQL-92, ODBC, JDBC, and OLE-DB. Virtuoso currently supports the
following Operating systems - Windows 95/98/NT/2000, Linux (Intel,
Alpha, Mips, PPC), Solaris, AIX, HP-UX, Unixware, IRIX, Digital UNIX,
DYNIX/PTX, FreeBSD, SCO, MacOS X.

Virtuoso is a revolutionary, next generation, high-performance virtual
database engine for the Distributed Computing Age. It is a core
universal data access technology set to accelerate our advances into the
emerging Information Age.

Virtuoso provides transparent access to your existing data sources,
which are typically databases from different database vendors.

Through a single connection, Virtuoso will simultaneously connect your
ODBC, JDBC, UDBC, OLE-DB client applications and services to data within
Oracle, Microsoft SQL Server, DB/2, Informix, Progress, CA-Ingres and
other ODBC compliant database engines. All your databases are treated as
single logical unit.

The diagram below depicts how applications that are built in conformance
with industry standards (such as ODBC, JDBC, UDBC, and OLE-DB) only need
to make a single connection via Virtuoso's Virtual Database Engine and
end up with concurrent and real-time access to data within different
database types.

Further still, Virtuoso exposes all of its functionality to Web
Services. This means that your existing infrastructure can be used
support Web Services directly without any hint of replacement.

</div>

</div>
