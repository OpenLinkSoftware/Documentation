<div>

<div>

<div>

<div>

# OpenLink Virtuoso Universal Server Documentation

</div>

<div>

<div>

<div>

### <span class="orgname">OpenLink Software Documentation Team </span> `<`<a
href="mailto:virtuoso.docs@openlinksw.com%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20"
class="email"><code
class="sourceCode email">virtuoso.docs@openlinksw.com</code></a>` >`

`<`<a
href="mailto:virtuoso.docs@openlinksw.com%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20"
class="email"><code
class="sourceCode email">virtuoso.docs@openlinksw.com</code></a>` >`

</div>

</div>

</div>

<div>

Copyright © 1999 - 2020 OpenLink Software

</div>

</div>

------------------------------------------------------------------------

</div>

<div>

**Table of Contents**

<span class="preface">[Preface](preface.html)</span>

<span class="section">1. [Conventions](preface.html#conventions)</span>

<span class="chapter">1. [Overview](ch-overview.html)</span>

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

<span class="chapter">2. [Installation
Guide](ch-installation.html)</span>

<span class="section">2.1. [Virtuoso on All platforms Commmon
Specifics](ch-installation.html#installallplatforms)</span>

<span class="section">2.1.1. [Installation
Requirements](ch-installation.html#srvadminstallreqt)</span>

<span class="section">2.1.2. [Operational
Requirements](ch-installation.html#srvadmopreq)</span>

<span class="section">2.1.3. [Operating System
Support](ch-installation.html#srvadmossupport)</span>

<span class="section">2.1.4.
[Limits](ch-installation.html#limitsandparameters)</span>

<span class="section">2.2. [Virtuoso for
Windows](installwin32.html)</span>

<span class="section">2.2.1. [Before You
Start](installwin32.html#b4ustart)</span>

<span class="section">2.2.2. [Getting To Know Your Virtuoso
Components](knowthywinvirt.html)</span>

<span class="section">2.2.3. [Installation
Steps](installstepswin.html)</span>

<span class="section">2.2.4. [Post
Installation](wininstpost.html)</span>

<span class="section">2.2.5. [Starting Your Virtuoso
Server](startvdbms.html)</span>

<span class="section">2.2.6. [Creating and Deleting Virtuoso
Services](creatingdeletingservices.html)</span>

<span class="section">2.2.7. [Configuring Virtuoso Client
Components](configuringvirtuosoclients.html)</span>

<span class="section">2.2.8. [Default
passwords](defpasschgwin.html)</span>

<span class="section">2.3. [Installing the Virtuoso Universal Server on
Unix-like OS (AIX, HP-UX, Linux, Solaris,
etc.)](virtuosoinstallunixpe.html)</span>

<span class="section">2.3.1.
[Installation](virtuosoinstallunixpe.html#virtuosoinstallunixpedescr)</span>

<span class="section">2.3.2.
[Configuration](virtuosoinstallunixpeconfg.html)</span>

<span class="section">2.3.3. [Demo
Database](installdemopersonaledition.html)</span>

<span class="section">2.4. [Virtuoso for Mac OS
X](installmacosx.html)</span>

<span class="section">2.4.1. [Before You
Install](installmacosx.html#macosxbeforeuinst)</span>

<span class="section">2.4.2. [Virtuoso Drag and Drop Installer for Mac
OS X](macosxinstdragdrop.html)</span>

<span class="section">2.4.3. [Installing Virtuoso 6 or
earlier](macosxinst.html)</span>

<span class="section">2.4.4. [Configuration](macosxconfigur.html)</span>

<span class="section">2.4.5. [Post
Installation](macosxinstpost.html)</span>

<span class="section">2.4.6. [Configuring an ODBC Data
Source](macosxodbcdsnconf.html)</span>

<span class="section">2.4.7. [Testing an ODBC Data
Source](macosxodbcdsntest.html)</span>

<span class="section">2.4.8. [Default
passwords](defpasschgmac.html)</span>

<span class="section">2.4.9. [Demo Database](installdemomac.html)</span>

<span class="section">2.5. [OpenLink License
Management](oplmgr.html)</span>

<span class="section">2.5.1. [License
Files](oplmgr.html#oplmngrlf)</span>

<span class="section">2.5.2. [License Manager](oplmngrlm.html)</span>

<span class="section">2.5.3. [Debugging License
Problems](oplmngrdlp.html)</span>

<span class="section">2.6. [Virtuoso ADO.Net Data Grid Form
Application](installvsgrid.html)</span>

<span class="section">2.7. [Using Visual Studio 2008 to Build an Entity
Frameworks based Windows Form Application](installvsent.html)</span>

<span class="section">2.7.1.
[Pre-requisites](installvsent.html#installvsentprereq)</span>

<span class="section">2.7.2. [Create the School database and
schema](installvsentcreatedb.html)</span>

<span class="section">2.7.3. [Generating the School Entity Data
Mode](installvsentgenmodel.html)</span>

<span class="section">2.7.4. [Querying Entities and
Associations](installvsentqueryentity.html)</span>

<span class="section">2.7.5. [Inserting and Updating
Data](installvsentinsertandupdate.html)</span>

<span class="section">2.8. [Using Visual Studio 2008 to Build an ADO.NET
Data Services based Application](installusado.html)</span>

<span class="section">2.8.1.
[Introduction](installusado.html#installusadointro)</span>

<span class="section">2.8.2. [Getting Started: Creating Data
Services](installusadogetstart.html)</span>

<span class="section">2.8.3. [Creating a Data Service using the ADO.NET
Entity Framework](installusadocreateservice.html)</span>

<span class="section">2.9. [Windows Form Application for accessing
Virtuoso RDF data via SPASQL using the Virtuoso ADO.Net
Provider](installwfas.html)</span>

<span class="section">2.9.1.
[Pre-requisites](installwfas.html#installwfasintro)</span>

<span class="section">2.9.2. [Creating the
Application](installwfasgetstart.html)</span>

<span class="section">2.9.3. [Extending RDFDemo to Allow Dereferencing
of External IRIs](installwfasxtendcomlab.html)</span>

<span class="section">2.9.4. [Extending RDFDemo to Display More Compact
Labels](installwfasxtendcomplab.html)</span>

<span class="section">2.9.5. [Modifying the Northwind Ontology to Add
Labels](installwfasmodify.html)</span>

<span class="section">2.9.6. [Extending RDFDemo to Display Images and
Longer Text Fields.](installwfasxtendlongtext.html)</span>

<span class="section">2.9.7. [Extending RDFDemo To Make The Property
Labels Clickable](installwfasxtendproplab.html)</span>

<span class="section">2.10. [Creating a Web Browser Application to
Access RDF Data Using The Virtuoso ADO.Net
Provider](installcrweb.html)</span>

<span class="section">2.10.1.
[Pre-requisites](installcrweb.html#installcrwebintro)</span>

<span class="section">2.10.2. [Creating the Web
Service](installcrwebcrserv.html)</span>

<span class="section">2.10.3. [Creating the Browser
Application](installcrbrappl.html)</span>

<span class="section">2.10.4. [Deploy With
IIS](installcrwebiis.html)</span>

<span class="section">2.11. [Creating a Silverlight Application to
consume the service](installsilver.html)</span>

<span class="section">2.11.1.
[Pre-requisites](installsilver.html#installsilverpreq)</span>

<span class="section">2.11.2. [Creating the Application for
Silverlight.](installsilvercrser.html)</span>

<span class="section">2.12. [Creating A Simple .NET RIA Services
Application To Display Data From Virtuoso](installnetriadd.html)</span>

<span class="section">2.12.1.
[Pre-requisites](installnetriadd.html#installnetriaddpreq)</span>

<span class="section">2.12.2. [Creating the
Application](installnetriaddcrser.html)</span>

<span class="section">2.12.3. [Displaying RDF
Data](installnetriaddcrdf.html)</span>

<span class="section">2.12.4. [Next
Steps](installnetriaddcnext.html)</span>

<span class="section">2.13. [Creating a .Net RIA Services Application
That Will Update Virtuoso Data](installnetriavd.html)</span>

<span class="section">2.13.1.
[Pre-requisites](installnetriavd.html#installnetriavdpreq)</span>

<span class="section">2.13.2. [Creating the
Application](installnetriavdcrser.html)</span>

<span class="section">2.13.3. [Propagate Updates to
Virtuoso](installnetriavdcrprup.html)</span>

<span class="section">2.14. [Cluster Installation and
Configuration](clusterstcnf.html)</span>

<span class="section">2.14.1. [Virtuoso Elastic Cluster Installation &
Configuration -- Version 7.x](clusterstcnf.html#clusterstcnf7)</span>

<span class="section">2.14.2. [Virtuoso default Cluster Installation and
Configuration](clusterstcnfsetup.html)</span>

<span class="section">2.14.3. [Backup and
Restore](clusterstcnfbackuprestore.html)</span>

<span class="section">2.14.4. [Cluster
Configuration](clusterstcnfconfig.html)</span>

<span class="section">2.14.5. [HTTP Service Configuration on Subordinate
Nodes of a Virtuoso Cluster](clusterstcnfconfnodesconfig.html)</span>

<span class="section">2.14.6. [Troubleshooting
Tips](clusterstcnftrsh.html)</span>

<span class="section">2.14.7. [See Also:](ch02s14s07.html)</span>

<span class="chapter">3. [Quick Start &
Tours](ch-quicktours.html)</span>

<span class="section">3.1. [Where to
Start](ch-quicktours.html#newadminui)</span>

<span class="section">3.1.1. [Default
Passwords](ch-quicktours.html#defpasschange)</span>

<span class="section">3.1.2. [Post-Installation Sanity
Check](ch-quicktours.html#postinstsanity)</span>

<span class="section">3.1.3. [Administering Your Virtuoso
Installation](ch-quicktours.html#administeringtheserver)</span>

<span class="section">3.2. [Client Connections](qsclientcon.html)</span>

<span class="section">3.2.1. [ODBC](qsclientcon.html#qsodbc)</span>

<span class="section">3.2.2. [JDBC](qajdbc.html)</span>

<span class="section">3.2.3. [OLEDB](qsoledb.html)</span>

<span class="section">3.3. [Virtual Database
Server](qsvdbsrv.html)</span>

<span class="section">3.3.1. [Configuring Your ODBC Data
Sources](qsvdbsrv.html#confodbcdsn)</span>

<span class="section">3.3.2. [Datasource Check](dsnchk.html)</span>

<span class="section">3.3.3. [Demo Datasource
Query](demoquery.html)</span>

<span class="section">3.3.4. [Linking Remote Tables Into
Virtuoso](lnktabvirt.html)</span>

<span class="section">3.3.5. [Listing or Unlinking
Tables](listunlnktabs.html)</span>

<span class="section">3.3.6. [Querying Linked
Tables](querybisql.html)</span>

<span class="section">3.4. [Web Server](qswebserver.html)</span>

<span class="section">3.4.1. [Virtual
Directories](qswebserver.html#qsvirtdir)</span>

<span class="section">3.4.2. [Multi Homing](qsmultihome.html)</span>

<span class="section">3.5. [WebDAV](qswebdav.html)</span>

<span class="section">3.5.1. [Web
Folders](qswebdav.html#qswebfolders)</span>

<span class="section">3.6. [Web Services](qswebservices.html)</span>

<span class="section">3.7. [Exposing Persistent Stored Modules as Web
Services](qstexpwsmodules.html)</span>

<span class="section">3.7.1. [Publishing Stored Procedures as Web
Services](qstexpwsmodules.html#qstexpwspls)</span>

<span class="section">3.7.2. [XML Query
Templates](qstxmlqtemplates.html)</span>

<span class="section">3.7.3. [Publishing VSE's as Web
Services](qstpublishbifs.html)</span>

<span class="section">3.8. [VSMX - Virtuoso Service Module for
XML](qsvsmx.html)</span>

<span class="section">3.9. [SQL to XML](qssqltoxml.html)</span>

<span class="section">3.9.1. [FOR XML Execution
Modes](qssqltoxml.html#qsforxmlmodes)</span>

<span class="section">3.9.2. [Tables With XML
Columns](qsxmlcolumn.html)</span>

<span class="section">3.10. [NNTP](qsnntp.html)</span>

<span class="section">3.10.1. [NNTP Server
Setup](qsnntp.html#qsnntpservsetup)</span>

<span class="section">3.10.2. [Local & Remote
Groups](qslocalvsremotegrps.html)</span>

<span class="section">3.10.3. [NNTP Client Setup](qscliconn.html)</span>

<span class="section">3.11. [Dynamic Web
Pages](vspquickstart.html)</span>

<span class="section">3.12. [VSP Examples](qsvspexamples.html)</span>

<span class="section">3.12.1. [Simple HTML FORM
usage](qsvspexamples.html#simpleforms)</span>

<span class="section">3.12.2. [Manipulating Database Data in
VSP](vspdbinout.html)</span>

<span class="section">3.12.3. [Simple Tutorial](vspequi.html)</span>

<span class="section">3.13. [Third-Party Runtime Typing, Hosting & User
Defined Types](qshostingplugs.html)</span>

<span class="section">3.14. [Troubleshooting Tips](troutips.html)</span>

<span class="section">3.14.1. [General
Tips](troutips.html#tipsgen)</span>

<span class="section">3.14.2. [DBMS Server will not
start](tipsdbnotstart.html)</span>

<span class="section">3.14.3. [Case Mode](tipscasemode.html)</span>

<span class="chapter">4. [Sample ODBC & JDBC
Applications](ch-sampleapps.html)</span>

<span class="section">4.1. [Binary & Source File
Locations](ch-sampleapps.html#binsrcloc)</span>

<span class="section">4.1.1. [ODBC Demonstration
Applications](ch-sampleapps.html#odbcdemos)</span>

<span class="section">4.1.2. [JDBC Demonstration
Applications](ch-sampleapps.html#sampjdbcdemos)</span>

<span class="section">4.2. [Sample ODBC
Applications](sampleodbcapps.html)</span>

<span class="section">4.2.1. [Mac OS
X](sampleodbcapps.html#macosxsamples)</span>

<span class="section">4.2.2. [Windows
95/98/NT/2000](winodbcsamples.html)</span>

<span class="section">4.2.3. [Linux & UNIX](unixodbcsamp.html)</span>

<span class="section">4.2.4. [MS DTC ODBC Sample
Application](msdtcsample.html)</span>

<span class="section">4.2.5. [MS DTC OLE DB Sample
Application](msdtcsample2.html)</span>

<span class="section">4.3. [Sample JDBC Applications &
Applets](jdbcdemos.html)</span>

<span class="section">4.3.1. [JDBCDemo Java
Application](jdbcdemos.html#jdbcdemo)</span>

<span class="section">4.3.2. [ScrollDemo2 Java
Application](scrolldemo2.html)</span>

<span class="section">4.3.3. [ScrollDemo2 Java
Applet](scrolldemo2applet.html)</span>

<span class="section">4.3.4. [JBench
Application](jbenchapplication.html)</span>

<span class="section">4.3.5. [JTA Demo Application](jtademo.html)</span>

<span class="chapter">5. [Conceptual Overview](ch-concepts.html)</span>

<span class="section">5.1. [Core Database
Engine](ch-concepts.html#coredbengine)</span>

<span class="section">5.1.1. [Logical Data
Model](ch-concepts.html#logicaldatamodel)</span>

<span class="section">5.1.2. [Data
Types](ch-concepts.html#datatypes)</span>

<span class="section">5.1.3. [Virtuoso Column
Store](ch-concepts.html#colstore)</span>

<span class="section">5.1.4. [Explicit Vectoring of Procedural
Code](ch-concepts.html#explvectprcode)</span>

<span class="section">5.1.5. [Locking](ch-concepts.html#locking)</span>

<span class="section">5.1.6. [Internationalization &
Unicode](ch-concepts.html#internationalization)</span>

<span class="section">5.1.7. [Creating A
Collation](ch-concepts.html#dbccollationsdef)</span>

<span class="section">5.2. [Virtual Database (VDB)
Engine](thevdbrel.html)</span>

<span class="section">5.3. [Web & Internet Protocol
Support](webinternetproto.html)</span>

<span class="section">5.4. [Web Services Protocol
Support](websrvcsproto.html)</span>

<span class="section">5.5.
[Architecture](conceptarchitecture.html)</span>

<span class="chapter">6. [Administration](ch-server.html)</span>

<span class="section">6.1. [Database Server
Administration](ch-server.html#databaseadmsrv)</span>

<span class="section">6.1.1. [Database](ch-server.html#dbadm)</span>

<span class="section">6.1.2. [Virtual
Database](ch-server.html#vdbconcepts)</span>

<span class="section">6.1.3. [Virtuoso User
Model](ch-server.html#usermodel)</span>

<span class="section">6.1.4. [VAD - Virtuoso Application
Distribution](ch-server.html#vaddistr)</span>

<span class="section">6.1.5. [Data Backup &
Recovery](ch-server.html#backup_recovery)</span>

<span class="section">6.1.6. [Performance
diagnostics](ch-server.html#perfdiag)</span>

<span class="section">6.1.7. [Performance
Tuning](ch-server.html#ptune)</span>

<span class="section">6.2. [HTML based Administration Console
(Conductor) Guide](htmlconductorbar.html)</span>

<span class="section">6.2.1. [Virtuoso Conductor
Administration](htmlconductorbar.html#conductorbar)</span>

<span class="section">6.2.2. [Runtime
Hosting](admui.runtimehosting.html)</span>

<span class="section">6.2.3. [Web
Services](admui.webservices.html)</span>

<span class="section">6.2.4. [WebDAV
Administration](webdavadmin.html)</span>

<span class="section">6.2.5. [Internet
Domains](admui.internetdomains.html)</span>

<span class="section">6.2.6. [XML
Services](admui.xmlservices.html)</span>

<span class="section">6.2.7. [Query Tools](querytools.html)</span>

<span class="section">6.2.8. [Replication &
Synchronization](replicationandsynchronization.html)</span>

<span class="section">6.2.9. [Database
Administration](dbadmin.html)</span>

<span class="section">6.2.10. [Conductor Linked Data
Administration](rdfadm.html)</span>

<span class="section">6.2.11. [Conductor News Server
Administration](newssrvadm.html)</span>

<span class="section">6.3. [Virtuoso Cluster
Operation](clusteroperation.html)</span>

<span class="section">6.3.1.
[General](clusteroperation.html#clusteroperationgeneral)</span>

<span class="section">6.3.2. [Setting up a
Cluster](clusteroperationsetcl.html)</span>

<span class="section">6.3.3. [Using Clustering with an Existing
Database](clusteroperationexdb.html)</span>

<span class="section">6.3.4.
[Partitioning](clusteroperationpart.html)</span>

<span class="section">6.3.5.
[Transactions](clusteroperationtransc.html)</span>

<span class="section">6.3.6.
[Administration](clusteroperationadmin.html)</span>

<span class="section">6.3.7. [Cluster Network Diagnostics and
Metrics](clusteroperationdiagnostics.html)</span>

<span class="section">6.3.8. [Elastic Cluster
Operations](elasticclusteroperation.html)</span>

<span class="section">6.3.9. [Setting CPU
Affinity](ch06s03s09.html)</span>

<span class="section">6.4. [Virtuoso Cluster Fault
Tolerance](fault.html)</span>

<span class="section">6.4.1.
[Introduction](fault.html#faultfaulttolerinto)</span>

<span class="section">6.4.2. [Sample
Configuration](faultfaulttolersampleconfig.html)</span>

<span class="section">6.4.3.
[Transactions](faultfaulttolertransactions.html)</span>

<span class="section">6.4.4. [Dividing Virtuoso Hosts Over Physical
Machines](faultfaulttolerdivid.html)</span>

<span class="section">6.4.5. [Managing
Availability](faultfaulttolermng.html)</span>

<span class="section">6.4.6. [Optimizing Schema for Fault
Tolerance](faultfaulttoleroptm.html)</span>

<span class="section">6.4.7. [Interpreting Status
Messages](faultfaulttolerinterprt.html)</span>

<span class="section">6.4.8. [Administration
API](faultfaulttoleradmapi.html)</span>

<span class="section">6.4.9. [RDF
Specifics](faultfaulttolerrdfspecf.html)</span>

<span class="section">6.4.10. [Fault Tolerance
Programming](faultfaulttolerpragram.html)</span>

<span class="chapter">7. [Data Access
Interfaces](ch-accessinterfaces.html)</span>

<span class="section">7.1. [ADO.Net Data
Provider](ch-accessinterfaces.html#virtclientref)</span>

<span class="section">7.1.1.
[Introduction](ch-accessinterfaces.html#virtclientrefintro)</span>

<span class="section">7.1.2. [Installation &
Configuration](ch-accessinterfaces.html#virtclientrefinstallandconfig)</span>

<span class="section">7.1.3. [Programmers
Guide](ch-accessinterfaces.html#virtclientrefprogrammersguide)</span>

<span class="section">7.2. [Interactive SQL
Utility](virtuoso_clients_isql.html)</span>

<span class="section">7.2.1. [Invoking
ISQL](virtuoso_clients_isql.html#invokingisql)</span>

<span class="section">7.2.2. [ISQL Commands](isqlcommands.html)</span>

<span class="section">7.2.3. [ISQL Macro
Substitution](isqlmacrodef.html)</span>

<span class="section">7.2.4. [ISQL Variables](isqlvariables.html)</span>

<span class="section">7.2.5. [Using isql as a General Purpose Test
Driver](isqlgentesttool.html)</span>

<span class="section">7.3. [Virtuoso Driver for
ODBC](odbcimplementation.html)</span>

<span class="section">7.3.1. [Windows ODBC Driver
Configuration](odbcimplementation.html#virtdsnsetup)</span>

<span class="section">7.3.2. [Using X509 Certificates With ODBC
Connection](secureodbcx509.html)</span>

<span class="section">7.3.3. [Manually configuring a Virtuoso ODBC DSN
on Unix](virtmanconfodbcdsnunix.html)</span>

<span class="section">7.3.4. [ODBC
Compliance](odbccompliance.html)</span>

<span class="section">7.3.5. [Virtuoso Scrollable Cursor
Engine](vscrlcursors.html)</span>

<span class="section">7.3.6. [Effect of Connection & Statement
Options](conn_stmt_options.html)</span>

<span class="section">7.3.7. [Efficient Use of
API](efficientapi.html)</span>

<span class="section">7.3.8. [Executing SQL from Python
script](execpythonscript.html)</span>

<span class="section">7.3.9.
[Extensions](odbcimplementationext.html)</span>

<span class="section">7.3.10.
[Examples](odbcimplementationexamples.html)</span>

<span class="section">7.4. [Virtuoso Driver for
JDBC](virtuosodriverjdbc.html)</span>

<span class="section">7.4.1. [Virtuoso Drivers for JDBC
Packaging](virtuosodriverjdbc.html#virtuosodriverpackaging)</span>

<span class="section">7.4.2. [Virtuoso Driver For JDBC URL
Format](jdbcurl4mat.html)</span>

<span class="section">7.4.3. [Virtuoso Driver JDBC 3.0
features](jdbc3features.html)</span>

<span class="section">7.4.4. [Virtuoso Driver JDBC 4.0
features](jdbc4features.html)</span>

<span class="section">7.4.5. [Installation & Configuration
Steps](jdbcdriverinstallconfig.html)</span>

<span class="section">7.4.6. [Virtuoso JDBC Driver Hibernate
Support](jdbcdriverhibernate.html)</span>

<span class="section">7.4.7.
[Examples](jdbcdriverhibernatesetupandtestingexmp.html)</span>

<span class="section">7.5. [OLE DB Provider for
Virtuoso](virtoledb.html)</span>

<span class="section">7.5.1. [Using the OLE DB Provider for
Virtuoso](virtoledb.html#oledbusing)</span>

<span class="section">7.5.2. [Known
Limitations](oledblimitations.html)</span>

<span class="section">7.5.3. [Data Types](oledbdatatypes.html)</span>

<span class="section">7.5.4. [Metadata](metadata.html)</span>

<span class="section">7.5.5. [Supported
Interfaces](interfaces.html)</span>

<span class="section">7.5.6. [Data Source
Objects](oledbdatasource.html)</span>

<span class="section">7.5.7. [Sessions](oledbsessions.html)</span>

<span class="section">7.5.8. [Rowsets](oledbrowsets.html)</span>

<span class="section">7.6. [Virtuoso In-Process
Client](inprocess.html)</span>

<span class="section">7.7. [Unix Domain Socket
Connections](accintudsockets.html)</span>

<span class="section">7.8. [Virtuoso Data Access Clients Connection Fail
over and Load Balancing
Support](dataccessclientsconfailandbalance.html)</span>

<span class="section">7.8.1.
[ODBC](dataccessclientsconfailandbalance.html#dataccessclientsconfailandbalanceodbc)</span>

<span class="section">7.8.2.
[ADO.Net](dataccessclientsconfailandbalanceado.html)</span>

<span class="section">7.8.3.
[JDBC](dataccessclientsconfailandbalancejdbc.html)</span>

<span class="section">7.8.4. [OLE
DB](dataccessclientsconfailandbalanceole.html)</span>

<span class="section">7.8.5.
[Sesame](dataccessclientsconfailandbalancesesm.html)</span>

<span class="chapter">8. [Virtual Database
Engine](ch-vdbengine.html)</span>

<span class="section">8.1. [Virtual Database (VDB)
Engine](ch-vdbengine.html#thevdb)</span>

<span class="section">8.1.1. [The Need for VDB
Engines](ch-vdbengine.html#consneed4vdb)</span>

<span class="section">8.1.2. [First Generation Virtual Database
Products](ch-vdbengine.html#consfirstvdbps)</span>

<span class="section">8.1.3. [VDB Implementation
Issues](ch-vdbengine.html#vdbimpliss)</span>

<span class="section">8.1.4. [VDB Engine
Components](ch-vdbengine.html#vdbcomponents)</span>

<span class="section">8.2. [Using Microsoft Entity Frameworks to Access
Oracle Schema Objects with Virtuoso](vdbenginemc.html)</span>

<span class="section">8.2.1. [Install and configure OpenLink ODBC Driver
for Oracle](vdbenginemc.html#vdbenginemcinst)</span>

<span class="section">8.2.2. [Install and configure OpenLink Virtuoso
Universal Server](vdbenginemcconfvsr.html)</span>

<span class="section">8.2.3. [Linking Oracle tables into OpenLink
Virtuoso](vdbenginemclink.html)</span>

<span class="section">8.2.4. [Creating EDM in Visual Studio
2008](vdbenginemccrvs.html)</span>

<span class="section">8.2.5. [Using EDM to create Entity Framework based
applications](vdbenginemcuedm.html)</span>

<span class="section">8.3. [Using Microsoft Entity Frameworks to Access
Progress Schema Objects with Virtuoso](vdbenginepr.html)</span>

<span class="section">8.3.1. [Install and configure OpenLink ODBC Driver
for Progress (SQL-92)](vdbenginepr.html#vdbengineprinst)</span>

<span class="section">8.3.2. [Install and configure OpenLink Virtuoso
Universal Server](vdbengineprconfvsr.html)</span>

<span class="section">8.3.3. [Linking Progress tables into
Virtuoso](vdbengineprlnk.html)</span>

<span class="section">8.3.4. [Creating EDM in Visual Studio
2008](vdbengineprcrem.html)</span>

<span class="section">8.3.5. [Manually creating EDM Associations (FKs)
for the Progress isports database](vdbengineprmedm.html)</span>

<span class="section">8.3.6. [Using EDM to create Entity Framework based
applications](vdbenginepredcr.html)</span>

<span class="section">8.4. [Using Microsoft Entity Frameworks to Access
Ingres Schema Objects with Virtuoso](vdbengineing.html)</span>

<span class="section">8.4.1. [Install and configure OpenLink ODBC Driver
for Ingres](vdbengineing.html#vdbengineinginst)</span>

<span class="section">8.4.2. [Install and configure OpenLink Virtuoso
Universal Server](vdbengineingconfvsr.html)</span>

<span class="section">8.4.3. [Linking Ingres tables into OpenLink
Virtuoso](vdbengineinglink.html)</span>

<span class="section">8.4.4. [Creating EDM in Visual Studio
2008](vdbengineingcre.html)</span>

<span class="section">8.4.5. [Manually creating EDM Associations (FKs)
for the Ingres Tutorial database](vdbengineingmc.html)</span>

<span class="section">8.4.6. [Using EDM to create Entity Framework based
applications](vdbengineingmfr.html)</span>

<span class="section">8.5. [Using Microsoft Entity Frameworks to Access
Informix Schema Objects with Virtuoso](vdbengineinf.html)</span>

<span class="section">8.5.1. [Install and configure OpenLink ODBC Driver
for Informix](vdbengineinf.html#vdbengineinfinst)</span>

<span class="section">8.5.2. [Install and configure OpenLink Virtuoso
Universal Server](vdbengineinfconfvsr.html)</span>

<span class="section">8.5.3. [Linking Informix tables into OpenLink
Virtuoso](vdbengineinflink.html)</span>

<span class="section">8.5.4. [Creating EDM in Visual Studio
2008](vdbengineinfcre.html)</span>

<span class="section">8.5.5. [Using EDM to create Entity Framework based
applications](vdbengineinfdm.html)</span>

<span class="section">8.6. [Using Microsoft Entity Frameworks to Access
DB2 Schema Objects with Virtuoso](vdbenginedb2.html)</span>

<span class="section">8.6.1. [Install and configure OpenLink ODBC Driver
for DB2](vdbenginedb2.html#vdbenginedb2inst)</span>

<span class="section">8.6.2. [Install and configure OpenLink Virtuoso
Universal Server](vdbenginedb2confvsr.html)</span>

<span class="section">8.6.3. [Linking DB2 tables into OpenLink
Virtuoso](vdbenginedb2link.html)</span>

<span class="section">8.6.4. [Creating EDM in Visual Studio
2008](vdbenginedb2crvs.html)</span>

<span class="section">8.6.5. [Using EDM to create Entity Framework based
applications](vdbenginedb2uedm.html)</span>

<span class="section">8.7. [Using Microsoft Entity Frameworks to Access
Sybase Schema Objects with Virtuoso](vdbenginesyb.html)</span>

<span class="section">8.7.1. [Install and configure OpenLink ODBC Driver
for Sybase](vdbenginesyb.html#vdbenginesybinst)</span>

<span class="section">8.7.2. [Install and configure OpenLink Virtuoso
Universal Server](vdbenginesybconfvsr.html)</span>

<span class="section">8.7.3. [Linking Sybase tables into OpenLink
Virtuoso](vdbenginesyblink.html)</span>

<span class="section">8.7.4. [Creating EDM in Visual Studio
2008](vdbenginesybcrvs.html)</span>

<span class="section">8.7.5. [Manually creating EDM Associations (FKs)
for the Sybase pubs2 database](vdbenginesybinstmedm.html)</span>

<span class="section">8.7.6. [Using EDM to create Entity Framework based
applications](vdbenginesybuedm.html)</span>

<span class="section">8.8. [Using Microsoft Entity Frameworks to Access
MySQL Schema Objects with Virtuoso](vdbenginemsql.html)</span>

<span class="section">8.8.1. [Install and configure OpenLink ODBC Driver
for MySQL](vdbenginemsql.html#vdbenginemsqlinst)</span>

<span class="section">8.8.2. [Install and configure OpenLink Virtuoso
Universal Server](vdbenginemsqlconfvsr.html)</span>

<span class="section">8.8.3. [Linking MySQL tables into OpenLink
Virtuoso](vdbenginemsqllink.html)</span>

<span class="section">8.8.4. [Creating EDM in Visual Studio
2008](vdbenginemsqlcrvs.html)</span>

<span class="section">8.8.5. [Using EDM to create Entity Framework based
applications](vdbenginemsqluedm.html)</span>

<span class="section">8.9. [Using Microsoft Entity Frameworks to Access
PostgreSQL Schema Objects with Virtuoso](vdbenginepsql.html)</span>

<span class="section">8.9.1. [Install and configure OpenLink ODBC Driver
for PostgreSQL](vdbenginepsql.html#vdbenginepsqlinst)</span>

<span class="section">8.9.2. [Install and configure OpenLink Virtuoso
Universal Server](vdbenginepsqlconfvsr.html)</span>

<span class="section">8.9.3. [Linking PostgreSQL tables into OpenLink
Virtuoso](vdbenginepsqllink.html)</span>

<span class="section">8.9.4. [Creating EDM in Visual Studio
2008](vdbenginepsqlcrvs.html)</span>

<span class="section">8.9.5. [Using EDM to create Entity Framework based
applications](vdbenginepsqluedm.html)</span>

<span class="section">8.10. [Using Microsoft Entity Frameworks to Access
ODBC to JDBC Bridge Schema Objects with
Virtuoso](vdbengineodtjd.html)</span>

<span class="section">8.10.1. [Install and configure OpenLink ODBC
Driver for ODBC to JDBC
Bridge](vdbengineodtjd.html#vdbengineodtjdinst)</span>

<span class="section">8.10.2. [Install and configure OpenLink Virtuoso
Universal Server](vdbengineodtjdconfvsr.html)</span>

<span class="section">8.10.3. [Linking ODBC to JDBC Bridge tables into
OpenLink Virtuoso](vdbengineodtjdlink.html)</span>

<span class="section">8.10.4. [Creating EDM in Visual Studio
2008](vdbengineodtjdcrvs.html)</span>

<span class="section">8.10.5. [Using EDM to create Entity Framework
based applications](vdbengineodtjduedm.html)</span>

<span class="section">8.11. [Using Microsoft Entity Frameworks to Access
ODBC to ODBC Bridge Schema Objects with
Virtuoso](vdbengineodbcod.html)</span>

<span class="section">8.11.1. [Install and configure OpenLink ODBC
Driver for ODBC to ODBC
Bridge](vdbengineodbcod.html#vdbengineodbcodinst)</span>

<span class="section">8.11.2. [Linking ODBC to ODBC Bridge tables into
OpenLink Virtuoso](vdbengineodbcodlink.html)</span>

<span class="section">8.11.3. [Creating EDM in Visual Studio
2008](vdbengineodbcodcrvs.html)</span>

<span class="section">8.11.4. [Using EDM to create Entity Framework
based applications](vdbengineodbcoduedm.html)</span>

<span class="section">8.12. [Using Microsoft Entity Frameworks to Access
Firebird Schema Objects with Virtuoso](vdbenginefirebd.html)</span>

<span class="section">8.12.1. [Install and configure the Firebird ODBC
Driver](vdbenginefirebd.html#vdbenginefirebdinst)</span>

<span class="section">8.12.2. [Install and configure OpenLink Virtuoso
Universal Server](vdbenginefirebdconfvsr.html)</span>

<span class="section">8.12.3. [Linking Firebird tables into OpenLink
Virtuoso](vdbenginefirebdlink.html)</span>

<span class="section">8.12.4. [Creating EDM in Visual Studio
2008](vdbenginefirebdcrvs.html)</span>

<span class="section">8.12.5. [Using EDM to create Entity Framework
based applications](vdbenginefirebduedm.html)</span>

<span class="section">8.13. [Using Microsoft Entity Frameworks to Access
Microsoft SQL Server Schema Objects with
Virtuoso](vdbenginemsqls.html)</span>

<span class="section">8.13.1. [Install and configure OpenLink ODBC
Driver for Microsoft SQL
Server](vdbenginemsqls.html#vdbenginemsqlsinst)</span>

<span class="section">8.13.2. [Install and configure OpenLink Virtuoso
Universal Server](vdbenginemsqlsconfvsr.html)</span>

<span class="section">8.13.3. [Linking Microsoft SQL Server tables into
OpenLink Virtuoso](vdbenginemsqlslink.html)</span>

<span class="section">8.13.4. [Creating EDM in Visual Studio
2008](vdbenginemsqlscrvs.html)</span>

<span class="section">8.13.5. [Using EDM to create Entity Framework
based applications](vdbenginemsqlsuedm.html)</span>

<span class="section">8.14. [Parallel Operations and Bulk Data Transfer
with Remote Tables](vdbparallelopandrtables.html)</span>

<span class="chapter">9. [SQL Reference](ch-sqlreference.html)</span>

<span class="section">9.1.
[Datatypes](ch-sqlreference.html#sqlrefdatatypes)</span>

<span class="section">9.1.1. [Date
Literals](ch-sqlreference.html#dt_dateliterals)</span>

<span class="section">9.1.2.
[Casting](ch-sqlreference.html#dtcasting)</span>

<span class="section">9.1.3. [Time & Date
Manipulation](ch-sqlreference.html#sqldatemanus)</span>

<span class="section">9.1.4. [Declaring Collations of
Expressions](ch-sqlreference.html#deccolexp)</span>

<span class="section">9.2. [User Defined
Types](udt_overview.html)</span>

<span class="section">9.2.1. [CREATE TYPE
Statement](udt_overview.html#udtcreatetypestmt)</span>

<span class="section">9.2.2. [ALTER TYPE
Statement](udtaltertypestmt.html)</span>

<span class="section">9.2.3. [DROP TYPE
Statement](udtdroptypestmt.html)</span>

<span class="section">9.2.4. [CREATE METHOD
Statement](udtcreatemethodstmt.html)</span>

<span class="section">9.2.5. [Type
Instances](udttypeinstances.html)</span>

<span class="section">9.2.6. [Instance
References](udtinstancerefs.html)</span>

<span class="section">9.2.7. [NEW Operator](udtnewop.html)</span>

<span class="section">9.2.8. [Finding Methods - Method Signatures
Generation & Comparison](udtfindingmethods.html)</span>

<span class="section">9.2.9. [Getting & Setting Member Values of Type
Instances (member observers &
mutators)](udtgetsetmembervals.html)</span>

<span class="section">9.2.10. [Calling Static
Methods](udtstaticmethods.html)</span>

<span class="section">9.2.11. [Calling Instance
Methods](udtcallinstmethod.html)</span>

<span class="section">9.2.12. [Serializing & Deserializing Type
Instances](udtserilizingtypeinst.html)</span>

<span class="section">9.2.13. [User Defined Types Utility
Functions](udtutilfuncs.html)</span>

<span class="section">9.2.14. [Hosted Foreign Objects in
Virtuoso](udthostedforiegnobjects.html)</span>

<span class="section">9.2.15. [Using User Defined Types to Represent
SOAP Structures](udtrepressentsoapstruct.html)</span>

<span class="section">9.2.16. [Consuming Third-Party SOAP Services via
User Defined Types](udtcnsmsoap.html)</span>

<span class="section">9.2.17. [UDT Security](udtsecurity.html)</span>

<span class="section">9.3. [XML Column
Type](sqlrefxmldatatype.html)</span>

<span class="section">9.4. [Identifier Case &
Quoting](catidentifiers.html)</span>

<span class="section">9.5. [Wide Character
Identifiers](wideidentifiers.html)</span>

<span class="section">9.5.1. [UTF-8 Implementation Notes For
ODBC](wideidentifiers.html#utf8notes4odbc)</span>

<span class="section">9.5.2. [UTF-8 Implementation Notes In
JDBC](utf8notes4jdbc.html)</span>

<span class="section">9.6. [Qualified Names](qualifiednames.html)</span>

<span class="section">9.6.1. [Qualifiers and
Owners](qualifiednames.html#qual_owners)</span>

<span class="section">9.6.2. [Default
Qualifiers](defaultqualifiers.html)</span>

<span class="section">9.6.3. [USE Statement, USE
identifier](userstmtid.html)</span>

<span class="section">9.7. [Literals, Brace
Escapes](litsbraceescs.html)</span>

<span class="section">9.7.1.
[Strings](litsbraceescs.html#strings)</span>

<span class="section">9.7.2. [Numbers](numbers.html)</span>

<span class="section">9.7.3. [ODBC Brace
Escapes](odbcbraceesc.html)</span>

<span class="section">9.7.4. [Hexadecimal
Literals](sqlrefhexliterals.html)</span>

<span class="section">9.7.5. [Binary
Literals](sqlrefbinliterals.html)</span>

<span class="section">9.8. [CREATE TABLE
Statement](createtable.html)</span>

<span class="section">9.8.1. [Syntax](createtable.html#syntax)</span>

<span class="section">9.8.2. [NOT NULL](consnotnull.html)</span>

<span class="section">9.8.3. [IDENTITY (Auto
Increment)](identity.html)</span>

<span class="section">9.8.4. [DEFAULT](default.html)</span>

<span class="section">9.8.5. [PRIMARY KEY
Constraint](pkeycons.html)</span>

<span class="section">9.8.6. [UNDER](under.html)</span>

<span class="section">9.8.7. [FOREIGN KEY Constraint](fkeys.html)</span>

<span class="section">9.8.8. [The CHECK
Constraint](sqlrefcreattablecheck.html)</span>

<span class="section">9.8.9. [The WITH SCHEMA
Constraint](sqlrefcreattablewithschema.html)</span>

<span class="section">9.9. [DROP TABLE Statement](droptable.html)</span>

<span class="section">9.10. [CREATE INDEX
Statement](createindex.html)</span>

<span class="section">9.11. [DROP INDEX
Statement](dropindex.html)</span>

<span class="section">9.12. [ALTER TABLE
Statement](altertable.html)</span>

<span class="section">9.12.1. [Adding a CHECK
Constraint](altertable.html#sqlrefalttabcheck)</span>

<span class="section">9.13. [CREATE VIEW
Statement](createview.html)</span>

<span class="section">9.14. [CREATE XML SCHEMA
Statement](createxmlschema.html)</span>

<span class="section">9.15. [DROP XML SCHEMA
Statement](dropxmlschema.html)</span>

<span class="section">9.16. [Sequence
Objects](sequenceobjects.html)</span>

<span class="section">9.17. [INSERT Statement](insertstmt.html)</span>

<span class="section">9.17.1. [INSERT
SOFT](insertstmt.html#insertsoft)</span>

<span class="section">9.17.2. [INSERT
REPLACING](insertreplacing.html)</span>

<span class="section">9.18. [UPDATE Statement](updatestmt.html)</span>

<span class="section">9.19. [SELECT Statement](selectstmt.html)</span>

<span class="section">9.19.1.
[Syntax](selectstmt.html#selectsyntax)</span>

<span class="section">9.19.2. [Description](descrip.html)</span>

<span class="section">9.19.3. [Column Aliasing - AS
Declaration](asdec.html)</span>

<span class="section">9.19.4. [Join examples](joinexamples.html)</span>

<span class="section">9.19.5. [Ordering and
Grouping](ordergrping.html)</span>

<span class="section">9.19.6. [Grouping Sets](gsets.html)</span>

<span class="section">9.19.7. [Derived
Tables](derivedtables.html)</span>

<span class="section">9.19.8. [Query
Expressions](qryexpressions.html)</span>

<span class="section">9.19.9. [LIKE Predicate & Search
Patterns](likepredicate.html)</span>

<span class="section">9.19.10. [The TOP SELECT
Option](topselectoption.html)</span>

<span class="section">9.19.11. [CASE, NULLIF, COALESCE, CAST Value
Expressions](caseandco.html)</span>

<span class="section">9.19.12. [SELECT BREAKUP](selbreackup.html)</span>

<span class="section">9.20. [COMMIT WORK, ROLLBACK WORK
Statement](commit_rollback.html)</span>

<span class="section">9.21. [CHECKPOINT, SHUTDOWN
Statement](checkpoint.html)</span>

<span class="section">9.21.1. [Checkpoint & Page
Remapping](checkpoint.html#checkpointparams)</span>

<span class="section">9.22. [Stored Procedures as Views & Derived
Tables](spasviewsandtables.html)</span>

<span class="section">9.22.1. [Procedure Table
Parameters](spasviewsandtables.html#proctabparams)</span>

<span class="section">9.22.2. [Procedure Table Result
Sets](proctabressets.html)</span>

<span class="section">9.22.3. [Procedure Tables &
Security](proctabsecurity.html)</span>

<span class="section">9.22.4. [Procedure Table Cost and Join
Order](proctabcost.html)</span>

<span class="section">9.22.5. [Limitations](proctablimits.html)</span>

<span class="section">9.22.6. [Procedure Table
Examples](procexamples.html)</span>

<span class="section">9.23. [GRANT, REVOKE Statement](grant.html)</span>

<span class="section">9.24. [SET Statement](setstmt.html)</span>

<span class="section">9.24.1. [ISOLATION](setstmt.html#isolation)</span>

<span class="section">9.24.2.
[LOCK_ESCALATION_PCT](lockescalation.html)</span>

<span class="section">9.24.3.
[transaction_timeout](transactiontimeout.html)</span>

<span class="section">9.24.4. [PARAM_BATCH](parambatch.html)</span>

<span class="section">9.25. [Anytime
Queries](anytimequeries.html)</span>

<span class="section">9.26. [Best Effort
Union](besteffortunion.html)</span>

<span class="section">9.27. [Standard and User-Defined Aggregate
Functions](aggregates.html)</span>

<span class="section">9.27.1. [Create Aggregate
Statement](aggregates.html#aggcreateaggrstmt1)</span>

<span class="section">9.27.2. [Drop Aggregate
Statement](aggdropaggrstmt.html)</span>

<span class="section">9.27.3. [Examples of User-Defined
Aggregates](createaggrsam.html)</span>

<span class="section">9.28. [Virtuoso SQL
Optimization](sqloptimizer.html)</span>

<span class="section">9.28.1. [Optimization
Techniques](sqloptimizer.html#opttechniques)</span>

<span class="section">9.28.2. [Query Options](queryoptions.html)</span>

<span class="section">9.28.3. [Query Optimization
Diagnostics](queryoptdiagn.html)</span>

<span class="section">9.28.4. [ANY ORDER](opttechanyorder.html)</span>

<span class="section">9.28.5. [VDB Statistics for the SQL Compiler
Collection](vdbcoststats.html)</span>

<span class="section">9.29. [SQL Inverse
Functions](sqlinverse.html)</span>

<span class="section">9.29.1. [Updating through
Inverses](sqlinverse.html#updthoughinverses)</span>

<span class="section">9.30. [SQL Grammar](grammar.html)</span>

<span class="section">9.31. [Bitmap Indices](bitmapindices.html)</span>

<span class="section">9.31.1. [Bitmap Indices and
Transactions](bitmapindices.html#bitmapindandtrans)</span>

<span class="section">9.31.2. [Performance
Implications](bitmapindandperfmimpl.html)</span>

<span class="section">9.31.3. [Physical Structure and
Overheads](physicalstroverheads.html)</span>

<span class="section">9.32. [Transitivity in
SQL](transitivityinsql.html)</span>

<span class="section">9.33. [Fast Phrase Match
Processor](sqlreffastphrasematch.html)</span>

<span class="section">9.33.1. [Phrases, Phrase Sets and Phrase
Classes](sqlreffastphrasematch.html#sqlreffastphrasematchscl)</span>

<span class="section">9.33.2. [Phrase Set Configuration
API](sqlreffastphrasematchapi.html)</span>

<span class="section">9.33.3. [Advertisers and Advertisement
Rules](sqlreffastphrasematchsadv.html)</span>

<span class="section">9.33.4.
[Example](sqlreffastphraseexample.html)</span>

<span class="section">9.34. [Geometry Data Types and Spatial Index
Support](sqlrefgeospatial.html)</span>

<span class="section">9.34.1. [Spatial
References](sqlrefgeospatial.html#sqlrefgeospatialspatref)</span>

<span class="section">9.34.2. [Geometric
Objects](sqlrefgeospatialgo.html)</span>

<span class="section">9.34.3. [Precision of
Geometries](sqlrefgeospatialpg.html)</span>

<span class="section">9.34.4.
[Predicates](sqlrefgeospatialpr.html)</span>

<span class="section">9.34.5. [Querying Geometric
Relations](sqlrefgeospatialqgr.html)</span>

<span class="section">9.34.6. [Defining a Geometry
Index](sqlrefgeospatialdgi.html)</span>

<span class="section">9.34.7. [Insert and
Delete](sqlrefgeospatialinsdel.html)</span>

<span class="section">9.34.8. [Using Geometries in Client Applications
and SQL Procedures](sqlrefgeospatialugcp.html)</span>

<span class="section">9.34.9. [Virtuoso 7.1+ Geo Spatial Data type and
function enhancements](sqlrefgeospatial7enchance.html)</span>

<span class="section">9.35. [SQL Bulk Load, ELT, File Tables and Zero
Load Operations](sqlbulkloadoperations.html)</span>

<span class="section">9.35.1. [File
Tables](sqlbulkloadoperations.html#sqlbulkloadoperationsftable)</span>

<span class="section">9.35.2. [Parallel Insert With File Tables and
Transactions](sqlbulkloadoperationsftableparallel.html)</span>

<span class="chapter">10. [Virtuoso Cluster
Programming](ch-clusterprogramming.html)</span>

<span class="section">10.1. [Cluster SQL Execution
Model](ch-clusterprogramming.html#clusterprogrammingsqlexmod)</span>

<span class="section">10.2. [Sequences, Identity and
Registry](clusterprogrammingseqidenreg.html)</span>

<span class="section">10.3. [SQL
Options](clusterprogrammingsqlopt.html)</span>

<span class="section">10.3.1. [Parallel INSERT
Options](clusterprogrammingsqlopt.html#clusterprogrammingsqloptparinsert)</span>

<span class="section">10.3.2. [INSERT KEY
Option](clusterprogrammingsqloptparinsertkey.html)</span>

<span class="section">10.4. [Calling Procedures in
Cluster](clusterprogrammingcallproc.html)</span>

<span class="section">10.5. [Partition
Functions](clusterprogrammingpartfunc.html)</span>

<span class="section">10.6. [Distributed
Pipe](clusterprogrammingdpipe.html)</span>

<span class="section">10.6.1. [SQL optimization and
Dpipe](clusterprogrammingdpipe.html#clusterprogrammingdpipesqloptimz)</span>

<span class="section">10.7. [Cluster and
RDF](clusterprogrammingclandrdf.html)</span>

<span class="section">10.8. [Cluster, Virtual Database and
Replication](clusterprogrammingvirtdbandrepl.html)</span>

<span class="section">10.9.
[Troubleshooting](clusterprogrammingtrbsht.html)</span>

<span class="chapter">11. [SQL Procedure Language
Guide](ch-sqlprocedures.html)</span>

<span class="section">11.1. [General
Principles](ch-sqlprocedures.html#generalprinciples)</span>

<span class="section">11.2. [Scope of
Declarations](scopeofdeclaration.html)</span>

<span class="section">11.3. [Data Types](sqlpldatatypes.html)</span>

<span class="section">11.4. [Handling Result
Sets](resultsets.html)</span>

<span class="section">11.5. [Result Sets and Array
Parameters](arrays.html)</span>

<span class="section">11.6. [Exception
Semantics](exceptions.html)</span>

<span class="section">11.7. [Virtuoso/PL Syntax](plref.html)</span>

<span class="section">11.7.1. [Create Procedure
Statement](plref.html#createprocstmt)</span>

<span class="section">11.7.2. [Grant Execute
Statement](grantprocstmt.html)</span>

<span class="section">11.7.3. [Stored Procedures as Views & Derived
Tables](spasviewsandtablespl.html)</span>

<span class="section">11.7.4. [Keyword and Optional Procedure
Arguments](kwds.html)</span>

<span class="section">11.7.5. [if, while, for, foreach
statements](whilestmt.html)</span>

<span class="section">11.7.6. [compound
statement](compoundstmts.html)</span>

<span class="section">11.7.7. [goto, return
statements](gotortnstmts.html)</span>

<span class="section">11.7.8. [whenever
statement](wheneverstmt.html)</span>

<span class="section">11.7.9. [call, assignment
statements](callassignstmt.html)</span>

<span class="section">11.7.10. [open, fetch, close, select ... into
statements](openfetchetcintostmts.html)</span>

<span class="section">11.7.11. [FOR Select
Statement](forstmt.html)</span>

<span class="section">11.7.12. [SET statement](setstmt_01.html)</span>

<span class="section">11.7.13. [SET Triggers](settriggers.html)</span>

<span class="section">11.7.14. [Vectored
Procedures](vectoredprocedure.html)</span>

<span class="section">11.7.15. [FOR VECTORED
Statement](forvectorestatement.html)</span>

<span class="section">11.7.16. [Limitations on Vectored
Code](limitonvectorecode.html)</span>

<span class="section">11.7.17. [Data Types and
Vectoring](datatypesandvectoring.html)</span>

<span class="section">11.8. [Execute Stored Procedures via SELECT
statement](execsqlprocselect.html)</span>

<span class="section">11.9. [Execute Stored Procedures In
Background](execsqlprocfork.html)</span>

<span class="section">11.10. [CREATE ASSEMBLY Syntax - External
Libraries](createassembly.html)</span>

<span class="section">11.11. [CREATE PROCEDURE Syntax - External hosted
procedures](createexthostproc.html)</span>

<span class="section">11.12. [Asynchronous Execution and Multithreading
in Virtuoso/PL](asyncexecmultithread.html)</span>

<span class="section">11.12.1.
[Synchronization](asyncexecmultithread.html#synchronization)</span>

<span class="section">11.13. [Performance Tips](perftips.html)</span>

<span class="section">11.13.1. [Remember the
following:](perftips.html#remember)</span>

<span class="section">11.14. [Procedures and
Transactions](procedures_transactions.html)</span>

<span class="section">11.15. [Distributed Transaction & Two Phase
Commit](twopcimplementation.html)</span>

<span class="section">11.15.1. [Initiating Distributed
Transactions](twopcimplementation.html#twopc_send)</span>

<span class="section">11.15.2. [Responding to Distributed
Transactions](twopc_resp.html)</span>

<span class="section">11.15.3. [2PC Log &
Recovery](twopc_recovery.html)</span>

<span class="section">11.15.4. [Error Codes](twopc_errors.html)</span>

<span class="section">11.16. [Triggers](triggers_01.html)</span>

<span class="section">11.16.1. [The CREATE TRIGGER
statement](triggers_01.html#createtrigger)</span>

<span class="section">11.16.2. [Triggers on
Views](triggers_on_views.html)</span>

<span class="section">11.16.3. [The DROP TRIGGER
statement](droptrigger.html)</span>

<span class="section">11.16.4. [Triggers and Virtual
Database](triggers_vdb.html)</span>

<span class="section">11.17. [Character
Escaping](charescaping.html)</span>

<span class="section">11.17.1. [Statement
Level](charescaping.html#backslashstmt)</span>

<span class="section">11.17.2. [Connection
Level](backslashconlevel.html)</span>

<span class="section">11.17.3. [Server
Default](backslashserver.html)</span>

<span class="section">11.18. [Virtuoso/PL Scrollable
Cursors](plscrollcrsrs.html)</span>

<span class="section">11.18.1. [Declaring a Scrollable
Cursor](plscrollcrsrs.html#plscrolldeclare)</span>

<span class="section">11.18.2. [Opening a Scrollable
Cursor](plscrollopen.html)</span>

<span class="section">11.18.3. [Fetching Data From a Scrollable
Cursor](plscrollfetch.html)</span>

<span class="section">11.18.4. [Virtuoso/PL Scrollable Cursor
Examples](plscrollexamples.html)</span>

<span class="section">11.18.5. [FORWARD-ONLY (traditional cursor
statement) Example](plforwardonlycr.html)</span>

<span class="section">11.18.6. [DYNAMIC (traditional cursor statement)
Example](pldynamiccr.html)</span>

<span class="section">11.18.7. [KEYSET (traditional cursor statement)
Example](plkeysetcr.html)</span>

<span class="section">11.19. [Virtuoso PL
Modules](plmodules.html)</span>

<span class="section">11.19.1.
[Syntax](plmodules.html#plmodsyntax)</span>

<span class="section">11.19.2. [Security](plmodsecurity.html)</span>

<span class="section">11.20. [Handling Conditions In Virtuoso/PL
Procedures](handlingplcondit.html)</span>

<span class="section">11.20.1. [Declaring Condition
Handlers](handlingplcondit.html#declarecondit)</span>

<span class="section">11.20.2. [Stack Trace Reporting On Sql Error
Generation](stacktracesql.html)</span>

<span class="section">11.21. [Procedure Language
Debugger](pldebugger.html)</span>

<span class="section">11.21.1. [Branch
Coverage](pldebugger.html#pldbgplcoverage)</span>

<span class="section">11.21.2. [Coverage
Functions](pldcovfunctions.html)</span>

<span class="section">11.22. [Row Level
Security](rowlevelsecurity.html)</span>

<span class="section">11.22.1. [Row Level Security
Functions](rowlevelsecurity.html#pldrlsfunctions)</span>

<span class="section">11.23. [Vectored Execution and Query
Parallelization](vexqrparl.html)</span>

<span class="section">11.23.1. [Automatic Query
Parallelization](vexqrparl.html#vexqrparlautoqp)</span>

<span class="section">11.23.2. [Configuration Parameters for Vectoring
and Parallelization](vexqrparlconfp.html)</span>

<span class="chapter">12. [Database Event Hooks](ch-hooks.html)</span>

<span class="section">12.1. [Database
Startup](ch-hooks.html#fn_dbev_startup)</span>

<span class="section">12.2. [Database
Connections](fn_dbev_connect.html)</span>

<span class="section">12.3. [Database Logins](fn_logins.html)</span>

<span class="section">12.4. [Database
Disconnections](fn_disconnect.html)</span>

<span class="section">12.5. [Database
Shutdown](fn_dbev_shutdown.html)</span>

<span class="section">12.6. [SQL Statement
Preparation](fn_dbev_prepare.html)</span>

<span class="section">12.7. [SQL Parse Tree](sqlparsetree.html)</span>

<span class="section">12.7.1. [Notes on Special Features of the Parse
Tree](sqlparsetree.html#notesonspecialparsetree)</span>

<span class="section">12.7.2. [SQL Security and Parse
Trees](sqlsecandparsetrees.html)</span>

<span class="section">12.7.3. [Debugging with Parse
Trees](debuggingparsetree.html)</span>

<span class="section">12.8. [WebDAV Logins](fn_davlogins.html)</span>

<span class="section">12.9. [Associating Auxiliary Data With A
Connection](assocauxdata.html)</span>

<span class="chapter">13. [Data Replication, Synchronization and
Transformation Services](ch-repl.html)</span>

<span class="section">13.1.
[Introduction](ch-repl.html#replintro)</span>

<span class="section">13.1.1. [Snapshot
replication](ch-repl.html#preface_snapshot)</span>

<span class="section">13.1.2. [Transactional
replication](ch-repl.html#preface_trx)</span>

<span class="section">13.2. [Snapshot Replication](snapshot.html)</span>

<span class="section">13.2.1. [Non incremental snapshot
replication](snapshot.html#noninc)</span>

<span class="section">13.2.2. [Incremental snapshot
replication](inc.html)</span>

<span class="section">13.2.3. [Command reference](commands.html)</span>

<span class="section">13.2.4. [Bi-Directional Snapshot
Replication](bidirrepl.html)</span>

<span class="section">13.2.5. [Registry variables](snpreg.html)</span>

<span class="section">13.2.6. [Heterogeneous snapshot
replication](snpheter.html)</span>

<span class="section">13.2.7. [Data type mappings](snpmap.html)</span>

<span class="section">13.2.8. [Objects created by incremental snapshot
replication](snpincobj.html)</span>

<span class="section">13.2.9. [Objects created by bi-directional
snapshot replication](snpbidirobj.html)</span>

<span class="section">13.2.10. [Replication system
tables](replsystables.html)</span>

<span class="section">13.2.11. [Table snapshot logs](snlog.html)</span>

<span class="section">13.3. [Transactional
Replication](proctransrepl.html)</span>

<span class="section">13.3.1. [Publishable
Items](proctransrepl.html#pubitems)</span>

<span class="section">13.3.2. [Errors in
Replication](errorsinreplication.html)</span>

<span class="section">13.3.3. [Publisher Transactional Replication
Functions](transreplpublishfunctions.html)</span>

<span class="section">13.3.4. [Subscriber
Functions](subscriberfunctions.html)</span>

<span class="section">13.3.5. [Common Status
Functions](replstatusfunctions.html)</span>

<span class="section">13.3.6. [Bi-Directional Transactional
Replication](bidirtransrepl.html)</span>

<span class="section">13.3.7. [Purging replication
logs](trxlogpurger.html)</span>

<span class="section">13.3.8. [Objects created by transactional
replication](trxobj.html)</span>

<span class="section">13.4. [Virtuoso scheduler](scheduler.html)</span>

<span class="section">13.4.1.
[SYS_SCHEDULED_EVENT](scheduler.html#replschsystables)</span>

<span class="section">13.5. [Transactional Replication
Example](replexamples.html)</span>

<span class="section">13.5.1. [Transactional Replication Objects
Example](replexamples.html#objectsexample)</span>

<span class="section">13.6. [Replication Logger
Sample](replsample.html)</span>

<span class="section">13.6.1. [Configuration of the
Sample](replsample.html#loggercfg)</span>

<span class="section">13.6.2. [Synchronization](loggersync.html)</span>

<span class="section">13.6.3. [Running the
Sample](runninglogger.html)</span>

<span class="section">13.6.4. [Notes on the Sample's
Dynamics](loggerdynamics.html)</span>

<span class="chapter">14. [Web Application
Development](ch-webappdevelopment.html)</span>

<span class="section">14.1. [The HTTP
Server](ch-webappdevelopment.html#webserver)</span>

<span class="section">14.1.1. [HTTP Server Base
Configuration](ch-webappdevelopment.html#vspconf)</span>

<span class="section">14.1.2. [Virtual
Directories](ch-webappdevelopment.html#virtdir)</span>

<span class="section">14.1.3.
[Authentication](ch-webappdevelopment.html#wsauth)</span>

<span class="section">14.1.4. [Session
Management](ch-webappdevelopment.html#wssessman)</span>

<span class="section">14.1.5. [Writing Your Own Authentication and
Session Handling](ch-webappdevelopment.html#customauthsess)</span>

<span class="section">14.1.6. [Cancellation of Web
Requests](ch-webappdevelopment.html#cancelwebreq)</span>

<span class="section">14.1.7. [Virtuoso WebRobot
API](ch-webappdevelopment.html#virtwebrobot)</span>

<span class="section">14.1.8. [HTTP Server
Extensions](ch-webappdevelopment.html#server_http_ext)</span>

<span class="section">14.1.9. [Chunked Transfer
Encoding](ch-webappdevelopment.html#webserverchunking)</span>

<span class="section">14.1.10. [Using Virtuoso Server capabilities via
Apache Web Server](ch-webappdevelopment.html#webserverviaapache)</span>

<span class="section">14.1.11. [Setting Up the Virtuoso HTTPS
Listener](ch-webappdevelopment.html#webserverhttpslistenerset)</span>

<span class="section">14.2. [Web Services ACL (Access Control
List)](wsacl.html)</span>

<span class="section">14.2.1. [General purpose
ACLs](wsacl.html#wsaclgenpurpacl)</span>

<span class="section">14.2.2. [ACL
Definition/Removal](wsacldefrem.html)</span>

<span class="section">14.2.3. [Using ACL's Within Application
Logic](wsaclusing.html)</span>

<span class="section">14.2.4. [Predefined
ACLs](wsaclpredefined.html)</span>

<span class="section">14.3. [Virtuoso Server Pages
(VSP)](vsp1.html)</span>

<span class="section">14.3.1. [VSP Markup & Basic
Functions](vsp1.html#vspmarkup)</span>

<span class="section">14.3.2. [Access Request
Information](accessrequestinfo.html)</span>

<span class="section">14.3.3. [Errors in Page
Procedures](errorsinpage.html)</span>

<span class="section">14.3.4. [/INLINEFILE HTTP Server
Pseudo-Directory](inlinefile.html)</span>

<span class="section">14.3.5. [Beyond Basics](furthervsp.html)</span>

<span class="section">14.3.6. [Long HTTP
Transactions](longhttptrans.html)</span>

<span class="section">14.3.7. [Using chunked encoding in HTTP
1.1](httpchunkedoutput.html)</span>

<span class="section">14.3.8. [Making Simple Dynamic Web
Pages](mksimpledynapages.html)</span>

<span class="section">14.3.9. [Generation of non-HTML
output](xmlthtmloutmd.html)</span>

<span class="section">14.3.10. [Post VSP XSLT Transformation
Mode](xmlthtmloutmd_01.html)</span>

<span class="section">14.3.11. [XML & XSLT Generated VSP
Pages](xmlforproducingvsp.html)</span>

<span class="section">14.4. [Virtuoso Server Pages for XML
(VSPX)](vspx.html)</span>

<span class="section">14.4.1. [Processing
Model](vspx.html#vspxprocmodel)</span>

<span class="section">14.4.2. [Object
Model](vspxobjectmodel.html)</span>

<span class="section">14.4.3. [Keeping Page and Session
State](vspxpageandsessionstate.html)</span>

<span class="section">14.4.4. [Application
Code](vspxappcode.html)</span>

<span class="section">14.4.5. [A Simple
Example](vspxexamples.html)</span>

<span class="section">14.4.6. [VSPX Event Handler
Parameters](vspxeventpars.html)</span>

<span class="section">14.4.7. [Registering a VSPX Event
Callbacks](vspxeventhandlers.html)</span>

<span class="section">14.4.8. [Commonly Used Types of Attributes of VSPX
Controls](vspx_attr_types.html)</span>

<span class="section">14.4.9. [VSPX Controls](vspx_controls.html)</span>

<span class="section">14.4.10. [XForms
rendering](vspxxforms.html)</span>

<span class="section">14.4.11. [XMLSchema for VSPX
page](vspxschema.html)</span>

<span class="section">14.5. [Deploying ASP.Net Web
Applications](rthwritaspxapps.html)</span>

<span class="section">14.5.1. [Programming
Concepts](rthwritaspxapps.html#rthprogramming)</span>

<span class="section">14.5.2. [ASP.Net Deployment &
Configuration](rthasp.netdeploymentconf.html)</span>

<span class="section">14.5.3. [The Mono
Project](rthaspvsmono.html)</span>

<span class="section">14.5.4. [Migrating ASP.Net Applications to
Virtuoso](rthaspxwalk.html)</span>

<span class="section">14.6. [ASMX Web Service
Hosting](asmxhosting.html)</span>

<span class="section">14.7. [Blogging & Weblogs](blogger.html)</span>

<span class="section">14.7.1. [The Virtuoso Blogging
Application](blogger.html#blogvirtblogapp)</span>

<span class="section">14.7.2. [Blogger Clients
Compatibility](bloggerclientcompatibility.html)</span>

<span class="section">14.7.3. [Blogs Management User
Interface](bloggermanagementui.html)</span>

<span class="section">14.7.4. [Community Blog
Site](blogcommunityblog.html)</span>

<span class="section">14.7.5. [Blogger API](bloggerapi.html)</span>

<span class="section">14.7.6. [MetaWeblog
API](bloggermetaweblog.html)</span>

<span class="section">14.7.7. [Movable Type
API](bloggermovabletype.html)</span>

<span class="section">14.7.8. [Atom API](blogatomapi.html)</span>

<span class="section">14.7.9. [XML-RPC Endpoint
Configuration](bloggerendpointconf.html)</span>

<span class="section">14.7.10. [Blog Hooks - Customizing the Blog
Server](bloggerhooks.html)</span>

<span class="section">14.7.11. [Blogger Client
API](bloggerclientapi.html)</span>

<span class="section">14.7.12. [xmlStorageSystem
API](xmlstoragesystem.html)</span>

<span class="section">14.7.13. [User's Blog
quota](xmlstoragesystem_01.html)</span>

<span class="section">14.7.14. [Posting a message in to the
Blog](xmlstoragesystem_02.html)</span>

<span class="section">14.7.15. [Multi-author
blogging](xmlstoragesystem_03.html)</span>

<span class="section">14.7.16. [Posting a
comments](xmlstoragesystem_04.html)</span>

<span class="section">14.7.17. [Blog Post Upstreaming
(bridging)](xmlstoragesystem_05.html)</span>

<span class="section">14.7.18. [Weblogs
API](xmlstoragesystem_06.html)</span>

<span class="section">14.7.19.
[Subscriptions](xmlstoragesystem_07.html)</span>

<span class="section">14.7.20. [Trackback
API](xmlstoragesystem_08.html)</span>

<span class="section">14.7.21. [Pingback
API](xmlstoragesystem_09.html)</span>

<span class="section">14.7.22. [E-mail
Notifications](xmlstoragesystem_10.html)</span>

<span class="section">14.7.23. [Comments tracking
options](blognotifcomments.html)</span>

<span class="section">14.7.24. [Subscription Harmonizer
API](xmlstoragesystem_11.html)</span>

<span class="section">14.7.25. [Mobile Blogging
(Moblog)](moblog.html)</span>

<span class="section">14.7.26. [Posting a dynamic
content](blogxmltemplate.html)</span>

<span class="section">14.7.27. [Notification
Services](blognotifservices.html)</span>

<span class="section">14.7.28. [Rendering the RSS feed in WML
format](blogwaprender.html)</span>

<span class="section">14.8. [Deploying PHP
Applications](servphpext.html)</span>

<span class="section">14.8.1. [Building the Virtuoso Server With PHP
Extension](servphpext.html#serverphpbuild)</span>

<span class="section">14.8.2. [PHP Extension
Functions](serverphpinc.html)</span>

<span class="section">14.8.3. [PHP
Examples](serverphpexamples.html)</span>

<span class="section">14.9. [Deploying JSP
Applications](rthjsp.html)</span>

<span class="section">14.9.1. [Environment Setup &
Verification](rthjsp.html#rthjspprelim)</span>

<span class="section">14.10. [Perl Hosting](perlhosting.html)</span>

<span class="section">14.11. [Python Hosting](pythonhosting.html)</span>

<span class="section">14.12. [Ruby Hosting](rubyhosting.html)</span>

<span class="chapter">15. [XML Support](ch-webandxml.html)</span>

<span class="section">15.1. [Rendering SQL Queries as XML (FOR XML
Clause)](ch-webandxml.html#forxmlforsql)</span>

<span class="section">15.1.1. [FOR XML EXPLICIT
Mode](ch-webandxml.html#forxmlexplicmode)</span>

<span class="section">15.1.2. [Examples of FOR
XML](ch-webandxml.html#examplesofforxml)</span>

<span class="section">15.1.3.
[Functions](ch-webandxml.html#forxmlfunc)</span>

<span class="section">15.1.4. [FOR XML
Syntax](ch-webandxml.html#forxmlsyntax)</span>

<span class="section">15.2. [XML Composing Functions in SQL Statements
(SQLX)](composingxmlinsql.html)</span>

<span class="section">15.3. [Virtuoso XML
Services](xmlservices.html)</span>

<span class="section">15.3.1. [XPATH Implementation and
SQL](xmlservices.html#xpath_sql)</span>

<span class="section">15.3.2. [XPATH Query
Options](xpathopts.html)</span>

<span class="section">15.3.3. [XML Views - Representing SQL Data as
Dynamic and Persistent XML](xmlviews1.html)</span>

<span class="section">15.3.4. [External Entity References in Stored
XML](xmlviewextentref.html)</span>

<span class="section">15.3.5. [Using XPATH in SQL Queries and
Procedures](xpproc.html)</span>

<span class="section">15.3.6. [XQUERY and XML
view](xquery_sql.html)</span>

<span class="section">15.3.7. [Mapping Schemas as XML
Views](mapping_schemas.html)</span>

<span class="section">15.3.8. [Differences Between SQLX, FOR XML and XML
Views](view4xmldifferences.html)</span>

<span class="section">15.4. [Querying Stored XML
Data](queryingxmldata.html)</span>

<span class="section">15.4.1. [XPATH_CONTAINS SQL
Predicate](queryingxmldata.html#xpathcontainssqlpred)</span>

<span class="section">15.4.2. [Using
xpath_eval()](qryusingxpath_eval.html)</span>

<span class="section">15.4.3. [External Entity References in Stored
XML](wxmlextentrefinxml.html)</span>

<span class="section">15.4.4. [XML Schema & DTD
Functions](wamlschmdtdfuncs.html)</span>

<span class="section">15.4.5. [Using XML and Free
Text](usingxmlfreetext.html)</span>

<span class="section">15.4.6. [XCONTAINS
predicate](xcontainspredicate.html)</span>

<span class="section">15.4.7. [text-contains XPath
Predicate](textcontainsxpath.html)</span>

<span class="section">15.4.8. [XML Free Text Indexing
Rules](xmlfreetextrules.html)</span>

<span class="section">15.4.9. [XML Processing & Free Text Encoding
Issues](xmlencoding.html)</span>

<span class="section">15.5. [Using UpdateGrams to Modify
Data](updategrams.html)</span>

<span class="section">15.5.1. [Updategrams
Basics](updategrams.html#updategrambasics)</span>

<span class="section">15.5.2. [Elements
Description](elementsdesc.html)</span>

<span class="section">15.5.3. [Determining
Actions](determiningactions.html)</span>

<span class="section">15.5.4. [Using Input
Parameters](usinginparams.html)</span>

<span class="section">15.5.5. [Examples](examples.html)</span>

<span class="section">15.6. [XML Templates](xmltemplates.html)</span>

<span class="section">15.6.1.
[Syntax](xmltemplates.html#xmltemplatesyntax)</span>

<span class="section">15.6.2. [Saving SQL Queries to XML
Template](saveqrytoxmltemplatessql.html)</span>

<span class="section">15.6.3. [Saving XQUERY Queries to XML
Template](saveqrytoxmltemplatessql_01.html)</span>

<span class="section">15.6.4. [Saving XPATH Queries to XML
Template](saveqrytoxmltemplatessql_02.html)</span>

<span class="section">15.6.5. [Programmatic
Examples](xmltemplatesexamples.html)</span>

<span class="section">15.7. [XML DTD and XML
Schemas](xmlschema.html)</span>

<span class="section">15.7.1. [XML Document Type Definition
(DTD)](xmlschema.html#dtd_intro)</span>

<span class="section">15.7.2. [Configuration Options of the DTD
Validator](dtd_config.html)</span>

<span class="section">15.7.3. [XML Schema Definition
Language](xsd_interface.html)</span>

<span class="section">15.7.4. [XML Schema
Functions](xsd_interface_01.html)</span>

<span class="section">15.7.5. [XML Schema &
SOAP](xmlschemaandsoap.html)</span>

<span class="section">15.8. [XQuery 1.0 Support](xq.html)</span>

<span class="section">15.8.1. [Types of XQuery
Expressions](xq.html#xq_supported_expns)</span>

<span class="section">15.8.2. [Details of XQuery
Syntax](xq_supported_syntax.html)</span>

<span class="section">15.8.3. [Pre-compilation of XPath and XQuery
Expressions](xq_precompilation.html)</span>

<span class="section">15.9. [XSLT Transformation](xslttrans.html)</span>

<span class="section">15.9.1.
[Namespaces](xslttrans.html#namespaces)</span>

<span class="section">15.9.2. [The *`<xsl:output>`*
Tag](xsloutputelt.html)</span>

<span class="section">15.9.3. [External Parameters in XSLT
Stylesheets](xsltextparams.html)</span>

<span class="section">15.9.4. [Functions](xsltfunctions.html)</span>

<span class="section">15.9.5. [XSLT Examples](xsltexamples.html)</span>

<span class="section">15.9.6. [XPath Function Extensions for
XSLT](userdefxpathfunc4xsl.html)</span>

<span class="section">15.9.7. [Status Of XSLT And XPath
Implementation](xsltsupport.html)</span>

<span class="section">15.10. [XMLType](xmltype.html)</span>

<span class="section">15.11. [Changing XML entities in DOM
style](xmldom.html)</span>

<span class="section">15.11.1. [Composing Document Fragments From DOM
Function Arguments](xmldom.html#xmldomtypecasting)</span>

<span class="chapter">16. [RDF Data Access and Data
Management](ch-rdfandsparql.html)</span>

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

<span class="chapter">17. [Web Services](ch-webservices.html)</span>

<span class="section">17.1.
[SOAP](ch-webservices.html#soap_overview)</span>

<span class="section">17.1.1. [Virtuoso SOAP Support
Overview](ch-webservices.html#soapovervw) </span>

<span class="section">17.1.2. [Handling of SOAP HTTP
Requests](ch-webservices.html#soapcallhandling)</span>

<span class="section">17.1.3. [Extending Datatypes for SOAP
Objects](ch-webservices.html#dtschsoaps)</span>

<span class="section">17.1.4. [Inheritance of Datatypes for SOAP
Objects](ch-webservices.html#dtsch_inherit) </span>

<span class="section">17.1.5. [Complex Types in PL Procedure and UDT
Method Definition](ch-webservices.html#dtsoapcplx) </span>

<span class="section">17.1.6. [Complex Types in Procedure Definition
using a pre-defined XML Schema
datatypes](ch-webservices.html#dtsch_procdef) </span>

<span class="section">17.1.7. [Default SOAP-SQL Datatype
Mappings](ch-webservices.html#defaultsoapsqltypes) </span>

<span class="section">17.1.8. [Exposing Stored Procedures as SOAP
Objects](ch-webservices.html#exposingprocsassoaps) </span>

<span class="section">17.1.9. [Creation of SOAP proxy based on User
Defined Types](ch-webservices.html#soapudtproxy) </span>

<span class="section">17.1.10. [Exposing User Defined Type Methods as
SOAP Objects](ch-webservices.html#exposingudtssoap) </span>

<span class="section">17.1.11. [Exposing Remote Third Party SQL Stored
Procedures as SOAP Services](ch-webservices.html#exposrmtprocsoap)
</span>

<span class="section">17.1.12. [Virtuoso/PL SOAP
Client](ch-webservices.html#soapclient) </span>

<span class="section">17.1.13. [Execution
Privileges](ch-webservices.html#execpriv) </span>

<span class="section">17.1.14. [Custom Soap Server
Support](ch-webservices.html#customsoapsrv)</span>

<span class="section">17.1.15. [PL Procedures and UDT Methods Syntax
Affecting WSDL & SOAP
Processing](ch-webservices.html#soapextendedsyntax) </span>

<span class="section">17.1.16. [Exposing & Processing SOAP Header
Messages](ch-webservices.html#soapheadermessages) </span>

<span class="section">17.1.17. [Exposing & Processing SOAP Fault
Messages](ch-webservices.html#soapfaultmessages) </span>

<span class="section">17.1.18. [Document Literal
Encoding](ch-webservices.html#soapdoclitenc1) </span>

<span class="section">17.1.19. [DIME encapsulation of SOAP
messages](ch-webservices.html#soapdimeenc) </span>

<span class="section">17.1.20. [SOAP Endpoint
Options](ch-webservices.html#soapoptions) </span>

<span class="section">17.2. [WSDL](wsdl.html)</span>

<span class="section">17.2.1. [Exposing Stored Procedures as WSDL
Services](wsdl.html#exposplaswsdl) </span>

<span class="section">17.2.2. [Exposing SQL Stored Procedures containing
complex datatype definitions](expcplx_types.html) </span>

<span class="section">17.2.3. [Exposing Third Party SQL Stored
Procedures as WSDL-Compliant Web Services](exp3rdprtyprocwsdl.html)
</span>

<span class="section">17.2.4. [WSDL Descriptions of SOAP Header
Messages](wsdlheadermessages.html) </span>

<span class="section">17.2.5. [Importing A WSDL File & SOAP/WSDL
Proxying](importwsdl.html) </span>

<span class="section">17.2.6. [SOAP/WSDL
Interoperability](soapwsdlinterop.html) </span>

<span class="section">17.3. [WebID Protocol
Support](vfoafssl.html)</span>

<span class="section">17.3.1. [x.509
certificate](vfoafssl.html#vfoafsslx509)</span>

<span class="section">17.3.2. [Setting up Virtuoso
HTTPS](vfoafsslsethttps.html) </span>

<span class="section">17.3.3. [Setting Up Firefox](vfoafsslff.html)
</span>

<span class="section">17.3.4. [Configuring ODS Account to use WebID
Protocol](vfoafsslconf.html) </span>

<span class="section">17.3.5. [Testing the setup](vfoafssltst.html)
</span>

<span class="section">17.3.6. [WebID Protocol ACLs](vfoafsslacl.html)
</span>

<span class="section">17.3.7. [SPARQL-WebID based
Endpoint](sparqloauthendpointfoafsslsparql_01.html) </span>

<span class="section">17.3.8. [CA Keys Import using
Conductor](vfoafsslcacondt.html) </span>

<span class="section">17.3.9. [Set Up X.509 certificate issuer, HTTPS
listener and generate ODS user's certificates](vfoafsslst509issuer.html)
</span>

<span class="section">17.3.10. [WebID Protocol ODBC
Login](vfoafsslsethttpsfoafsll.html) </span>

<span class="section">17.4. [OAuth Support](voauth.html)</span>

<span class="section">17.4.1. [OAuth Access
Tokens](voauth.html#voauthtokens) </span>

<span class="section">17.4.2. [Virtuoso OAuth server](voauthserver.html)
</span>

<span class="section">17.4.3. [OAuth Implementation in OpenLink Data
Spaces](voauthimplods.html) </span>

<span class="section">17.4.4. [OAuth Generate Keys for ODS Controllers
(Web Services)](voauthcontrollers.html) </span>

<span class="section">17.4.5. [ODS Ubiquity Commands](voauthubc.html)
</span>

<span class="section">17.4.6. [OAuth Test Tool for ODS
Controllers](voauthtool.html) </span>

<span class="section">17.4.7. [OAuth QA](voauthqa.html) </span>

<span class="section">17.5. [WS-Security (WSS) Support in Virtuoso SOAP
Server](vwsssupport.html) </span>

<span class="section">17.5.1. [Client and Server side Certificates &
Keys](vwsssupport.html#vwsssrvclisidecerts)</span>

<span class="section">17.5.2. [SOAP Server WS-Security
Endpoint](vwsssoapendpoint.html) </span>

<span class="section">17.5.3. [Virtual Directory SOAP WSS
Options](vwssvdsoapopt.html) </span>

<span class="section">17.5.4. [Accounting & Accounting
Hook](vwssaccounting.html) </span>

<span class="section">17.5.5. [Signature
Templates](vwsssectemplates.html)</span>

<span class="section">17.5.6. [SOAP Client](vwsssoapclient.html) </span>

<span class="section">17.6. [Web Services Routing Protocol
(WS-Routing)](ws-routing.html)</span>

<span class="section">17.6.1. [Configuration](ws-routing.html#wsrconfig)
</span>

<span class="section">17.6.2. [Traversing Message
Paths](wsrtraversingmsgpaths.html) </span>

<span class="section">17.7. [Web Services Reliable Messaging Protocol
(WS-ReliableMessaging)](warm.html)</span>

<span class="section">17.7.1. [SOAP CLIENT API
Extensions](warm.html#wsrmsoapcliapi) </span>

<span class="section">17.7.2. [WS-RM Sender API](wsrmsndrapi.html)
</span>

<span class="section">17.7.3. [WSRM Receiver API](wsrmrcvrapi.html)
</span>

<span class="section">17.7.4. [WS-RM Protocol Endpoint
Configuration](wsrmsetupendpoint.html) </span>

<span class="section">17.7.5. [Message Examples](wsrmmsgexamples.html)
</span>

<span class="section">17.7.6. [WS-RM Schema](wsrmschema.html)</span>

<span class="section">17.8. [Web Services Trust Protocol
(WS-Trust)](vwstrust.html)</span>

<span class="section">17.9. [XML for Analysis
Provider](xmlxmla.html)</span>

<span class="section">17.10. [XML-RPC support](xmlrpc.html)</span>

<span class="section">17.11. [SyncML](syncml.html)</span>

<span class="section">17.12. [UDDI](uddi_overview.html)</span>

<span class="section">17.12.1.
[Concepts](uddi_overview.html#uddiconcepts)</span>

<span class="section">17.12.2. [Dealing with SOAP](uddisoap.html)</span>

<span class="section">17.12.3. [Supported API
Calls](uddiapisupport.html) </span>

<span class="section">17.12.4. [Authorization
Mechanism](uddiauthmech.html) </span>

<span class="section">17.12.5. [UDDI API
Calls](uddiapicalls.html)</span>

<span class="section">17.12.6. [Examples](uddiexamples.html) </span>

<span class="section">17.13. [Exposing Persistent Stored Modules as Web
Services](expwsmodules.html)</span>

<span class="section">17.13.1. [Publishing Stored Procedures as Web
Services](expwsmodules.html#qstexpwspls_01) </span>

<span class="section">17.13.2. [XML Query
Templates](qstxmlqtemplates_01.html) </span>

<span class="section">17.13.3. [Publishing VSE's as Web
Services](qstpublishbifs_01.html) </span>

<span class="section">17.14. [Testing Web Published Web
Services](vsmx.html)</span>

<span class="section">17.15. [BPEL
Reference](bpel_reference.html)</span>

<span class="section">17.15.1. [Activities](bpel_reference.html#bpelact)
</span>

<span class="section">17.15.2. [Protocol Support](bpelprot.html)</span>

<span class="section">17.15.3. [Process lifecycle](bpellifecycle.html)
</span>

<span class="section">17.15.4. [Using virtual
directories](bpelvdit.html)</span>

<span class="section">17.15.5. [Process archiving](bpelarx.html) </span>

<span class="section">17.15.6. [Configuration parameters](bpelconf.html)
</span>

<span class="section">17.15.7. [Process
Statistics](bpelstats.html)</span>

<span class="section">17.15.8. [Deployment file suitcase
format](bpelsut.html) </span>

<span class="section">17.15.9. [SQL API](bpelapi.html)</span>

<span class="section">17.15.10. [BPEL XPath
Functions](xpathbpelfunctions.html) </span>

<span class="section">17.15.11. [Tables](bpeltables.html) </span>

<span class="section">17.15.12. [Errors](bpelerrors.html) </span>

<span class="section">17.15.13. [Samples](bpelsampl.html) </span>

<span class="section">17.15.14. [References](bpelrefs.html) </span>

<span class="section">17.15.15. [BPEL4WS VAD Package
installation](bpelvadinstall.html) </span>

<span class="section">17.16. [XSQL](xsql.html)</span>

<span class="section">17.16.1. [XSQL
Syntax](xsql.html#xsqlsyntax)</span>

<span class="section">17.16.2. [XSQL Directives](xsqldirectives.html)
</span>

<span class="chapter">18. [Runtime
Hosting](ch-runtimehosting.html)</span>

<span class="section">18.1. [Runtime
Environments](ch-runtimehosting.html#rthactivation)</span>

<span class="section">18.2. [CLR, .Net & ASPX Host](rthclr.html)</span>

<span class="section">18.2.1. [Environment
Setup](rthclr.html#rthclrenvsetdotnet)</span>

<span class="section">18.2.2. [Testing the Virtuoso .NET Runtime
Environment](rthclrdotnettest.html)</span>

<span class="section">18.3. [CLR & Mono](rthclrmono.html)</span>

<span class="section">18.3.1. [Environment
Setup](rthclrmono.html#rthclrenvsetmono)</span>

<span class="section">18.3.2. [Testing the Virtuoso Mono Runtime
Environment](rthclrmonotest.html)</span>

<span class="section">18.4. [Embedded Java VM
API](javaextvm.html)</span>

<span class="section">18.4.1. [Correspondence Between Virtuoso & Java VM
Threads](javaextvm.html#virtvsjvmthreads)</span>

<span class="section">18.4.2. [Virtuoso/PL \<-\> Java VM Type Mapping
Schema](virtpljvmtypemapp.html)</span>

<span class="section">18.4.3. [References to Java VM Class Instances in
Virtuoso/PL](referencestojvminvpl.html)</span>

<span class="section">18.4.4. [Specifying the Correct Java Type When
Passing Values from Virtuoso/PL](correctjavatype.html)</span>

<span class="section">18.4.5. [Virtuoso Java PL API
VSEs](virtjavabifs.html)</span>

<span class="section">18.4.6. [Java
Security](jvmapisecurity.html)</span>

<span class="section">18.5. [Virtuoso Server Extension Interface (VSEI)
(C Interface)](cinterface.html)</span>

<span class="section">18.5.1. [Virtuoso Server Extension Interface
(VSEI)](cinterface.html#writingsqlcallablecfuncs)</span>

<span class="section">18.5.2. [SQL Run Time
Objects](sqlruntimeobjects.html)</span>

<span class="section">18.5.3. [Memory Management
Rules](memmanrules.html)</span>

<span class="section">18.5.4. [Server Main
Function](servermainfunction.html)</span>

<span class="section">18.5.5. [Compiling &
Linking](compilingandlinking.html)</span>

<span class="section">18.5.6. [Functions by
Category](funcsbycat.html)</span>

<span class="section">18.5.7. [VSEI Definition](bifdefs.html)</span>

<span class="section">18.5.8. [SQL Exceptions](sqlexception.html)</span>

<span class="section">18.5.9. [Executing SQL](execingsql.html)</span>

<span class="section">18.5.10. [Adding New Languages And Encodings Into
Virtuoso](langfuncapi.html)</span>

<span class="section">18.6. [VSEI Plugins](vseplugins.html)</span>

<span class="chapter">19. [Internet
Services](ch-internetservices.html)</span>

<span class="section">19.1. [WebDAV
Server](ch-internetservices.html#webdavserver)</span>

<span class="section">19.1.1. [DAV User
Accounts](ch-internetservices.html#davaccountsforwebuser)</span>

<span class="section">19.1.2. [WebDAV
Authentication](ch-internetservices.html#davauth)</span>

<span class="section">19.1.3. [WebDAV Symbolic
Links](ch-internetservices.html#davsymboliclinks)</span>

<span class="section">19.1.4. [Access Right Permissions of Web
Resources](ch-internetservices.html#accesspermofwebres)</span>

<span class="section">19.1.5. [DAV and RDF
Metadata](ch-internetservices.html#davrdfmetadata)</span>

<span class="section">19.1.6. [Special Attributes of Web
Resources](ch-internetservices.html#customattofwebres)</span>

<span class="section">19.2. [URIQA Semantic Web
Enabler](uriqa.html)</span>

<span class="section">19.2.1. [URIQA HTTP
Methods](uriqa.html#uriqamethods)</span>

<span class="section">19.2.2. [URIQA Web Service](uriqaws.html)</span>

<span class="section">19.2.3. [URIQA Section in Virtuoso Configuration
File](uriqainifile.html)</span>

<span class="section">19.2.4. [URI Matching
Rules](uriqamatching.html)</span>

<span class="section">19.3. [Mail Delivery &
Storage](maildelivstore.html)</span>

<span class="section">19.3.1. [The SMTP
Client](maildelivstore.html#smtpclient)</span>

<span class="section">19.3.2. [POP3 Server](pop3server.html)</span>

<span class="section">19.3.3. [Storing Email in
Virtuoso](smtpreceipt.html)</span>

<span class="section">19.3.4. [The Virtuoso Mail
Sink](mailsink.html)</span>

<span class="section">19.4. [NNTP
Newsgroups](nntpnewsgroups.html)</span>

<span class="section">19.4.1. [NNTP
Client](nntpnewsgroups.html#nntpclient)</span>

<span class="section">19.4.2. [Commands and
Examples](commandsandexamples.html)</span>

<span class="section">19.5. [NNTP Server](newsserver.html)</span>

<span class="section">19.5.1. [Enabling the NNTP
Server](newsserver.html#newssrvenable)</span>

<span class="section">19.5.2. [NNTP Server
Commands](newssrvcmds.html)</span>

<span class="section">19.5.3. [Add Groups to NNTP
Server](newssrvadd_01.html)</span>

<span class="section">19.6. [MIME & Internet Messages](mime.html)</span>

<span class="section">19.6.1. [About Simple Internet (RFC 822)
Messages](mime.html#aboutinternetmsgs)</span>

<span class="section">19.6.2. [MIME Messages - Extension to Simple
Internet Messages](mimesupport.html)</span>

<span class="section">19.6.3. [S/MIME Support](smime.html)</span>

<span class="section">19.7. [FTP Services](ftpservices.html)</span>

<span class="section">19.7.1. [FTP
Client](ftpservices.html#ftpservicesclient)</span>

<span class="section">19.7.2. [FTP
Server](ftpservicesserver.html)</span>

<span class="section">19.8. [VSP Guide](vspguide.html)</span>

<span class="section">19.8.1.
[Introduction](vspguide.html#vspintro)</span>

<span class="section">19.8.2. [Simple HTML FORM
usage](htmlusage.html)</span>

<span class="section">19.8.3. [Interacting with the
Database](dbinteraction.html)</span>

<span class="section">19.8.4. [The Forums
Application](vspforumsapp.html)</span>

<span class="section">19.8.5. [Setting up server-side Cross-Origin
Resource Sharing (CORS) with Virtuoso](corsshare.html)</span>

<span class="section">19.9. [LDAP](ldap_overview_01.html)</span>

<span class="section">19.9.1. [LDAP
Client](ldap_overview_01.html#vldapclient)</span>

<span class="section">19.9.2. [LDAP Server](openldapinstall.html)</span>

<span class="chapter">20. [Free Text Search](ch-freetext.html)</span>

<span class="section">20.1. [Basic
Concepts](ch-freetext.html#txtidxquickstart)</span>

<span class="section">20.2. [Creating Free Text
Indexes](creatingtxtidxs.html)</span>

<span class="section">20.2.1. [The CREATE TEXT INDEX
statement](creatingtxtidxs.html#createtxtidxstmt)</span>

<span class="section">20.2.2. [Choosing An Application Specific Document
ID](appspecificdocid.html)</span>

<span class="section">20.2.3. [The composite Data
Type](compositedatatype.html)</span>

<span class="section">20.2.4. [Free Text Index
Examples](fttexamples.html)</span>

<span class="section">20.2.5. [Pre-processing and Extending the Content
Being Indexed](preprocessingandext.html)</span>

<span class="section">20.2.6. [Hit Scores](hitscores.html)</span>

<span class="section">20.2.7. [Word Ranges](wordranges.html)</span>

<span class="section">20.2.8. [Using Offband Data for Faster
Filtering](offbanddata.html)</span>

<span class="section">20.2.9. [Order of Hits](orderofhits.html)</span>

<span class="section">20.2.10. [Noise Words](noisewords.html)</span>

<span class="section">20.3. [Querying Free Text
Indexes](queryingftcols.html)</span>

<span class="section">20.3.1. [CONTAINS
predicate](queryingftcols.html#containspredicate)</span>

<span class="section">20.3.2. [Comments](fttcomments.html)</span>

<span class="section">20.3.3. [Text Expression
Syntax](textexprsyntax.html)</span>

<span class="section">20.4. [Text Triggers](txttrig.html)</span>

<span class="section">20.4.1. [Creating Text
Triggers](txttrig.html#createtxttrg)</span>

<span class="section">20.4.2. [Created Database
Objects](createddbobjs.html)</span>

<span class="section">20.5. [Generated Tables and
Internals](tablesandinternals.html)</span>

<span class="section">20.5.1. [Generated Tables and
Procedures](tablesandinternals.html#gentabsaprocs)</span>

<span class="section">20.5.2. [The procedures are:](procs.html)</span>

<span class="section">20.5.3. [Tables and Procedures Created By Text
Triggers](fttrigtblsandprocs.html)</span>

<span class="section">20.6. [Removing A Text
Index](droptxtindex.html)</span>

<span class="section">20.7. [Removing A Text
Trigger](droptxttrig.html)</span>

<span class="section">20.7.1.
[vt_drop_ftt_dedup](droptxttrig.html#fn_vt_drop_ftt_dedup)</span>

<span class="section">20.8. [Internationalization &
Unicode](ftinternationalization.html)</span>

<span class="section">20.9. [Performance](ftperformance.html)</span>

<span class="section">20.9.1.
[Restrictions](ftperformance.html#restrictions)</span>

<span class="section">20.10. [Free Text Functions](fttfuncs.html)</span>

<span class="section">20.10.1.
[vt_batch_dedup](fttfuncs.html#fn_vt_batch_dedup)</span>

<span class="section">20.10.2.
[vt_batch_d_id_dedup](fn_vt_batch_d_id_dedup.html)</span>

<span class="section">20.10.3.
[vt_batch_feed_dedup](fn_vt_batch_feed_dedup.html)</span>

<span class="section">20.10.4.
[vt_batch_feed_offband_dedup](fn_vt_batch_feed_offband_dedup.html)</span>

<span class="section">20.10.5.
[vt_batch_update_dedup](fn_vt_batch_update_dedup.html)</span>

<span class="section">20.10.6.
[vt_is_noise_dedup](fn_vt_is_noise_dedup.html)</span>

<span class="section">20.11. [](ch20s11.html)</span>

<span class="chapter">21. [TPC C Benchmark Kit](ch-tpcc.html)</span>

<span class="section">21.1. [Building the Test
Database](ch-tpcc.html#tpcctestdb)</span>

<span class="section">21.2. [Using the Test
Program](tpccusingtestprg.html)</span>

<span class="section">21.3. [Tuning Parameters and Number of
Users](tpcctuningparams4users.html)</span>

<span class="section">21.4. [Omissions, Exceptions from the
Definition](omissionsexcp.html)</span>

<span class="section">21.5. [Sample
Configuration](sampleconf.html)</span>

<span class="section">21.6. [Other Factors](otherfactors.html)</span>

<span class="section">21.7. [TPC C Procedures](tpccprocs.html)</span>

<span class="section">21.7.1.
[Introduction](tpccprocs.html#intro)</span>

<span class="section">21.7.2. [New Order](neworder.html)</span>

<span class="section">21.7.3. [Payment](payment.html)</span>

<span class="section">21.7.4. [Delivery](delivery.html)</span>

<span class="section">21.7.5. [Order Status](status.html)</span>

<span class="section">21.7.6. [Stock Level](stocklevel.html)</span>

<span class="section">21.8. [DDL Statements](ddlstmt.html)</span>

<span class="section">21.9. [Stored Procedures](storedprocs.html)</span>

<span class="chapter">22. [Using Virtuoso with
Tuxedo](ch-xa.html)</span>

<span class="section">22.1. [Building the Transaction Manager
Server](ch-xa.html#xabuildtms)</span>

<span class="section">22.2. [Configuration](xaubbconf.html)</span>

<span class="section">22.3. [Services](xaservices.html)</span>

<span class="section">22.3.1.
[Introduction](xaservices.html#xaservicesabstract)</span>

<span class="section">22.3.2. [VQL functions](xaservicesvql.html)</span>

<span class="section">22.3.3. [Services concept](xaservcon.html)</span>

<span class="section">22.3.4. [OPENINFO](xaservopeninfo.html)</span>

<span class="section">22.4. [Clients](xaclients.html)</span>

<span class="section">22.5. [Service example](xaservexample.html)</span>

<span class="chapter">23. [Appendix A](ch-appendixa.html)</span>

<span class="section">23.1. [YACC SQL Grammar
Reference](ch-appendixa.html#yacc)</span>

<span class="section">23.2. [Error Codes Reference](errors.html)</span>

<span class="section">23.2.1. [Virtuoso Error
Codes](errors.html#errorcodes)</span>

<span class="section">23.2.2. [Data Type
Errors](datatypeerror.html)</span>

<span class="section">23.3. [Signals and Exit
codes](signalsandexitcodes.html)</span>

<span class="section">23.3.1. [Exit
codes](signalsandexitcodes.html#signalsandexitcodesc)</span>

<span class="section">23.3.2.
[Signals](signalsandexitcodess.html)</span>

<span class="section">23.4. [Release Notes](apparelnotes.html)</span>

<span class="section">23.4.1. [New
Features](apparelnotes.html#feat30)</span>

<span class="section">23.4.2. [Bugs Fixed](ptrs30.html)</span>

<span class="section">23.5. [Product Support](support.html)</span>

<span class="section">23.5.1. [OpenLink Discussion
Forums](support.html#discussionforums)</span>

<span class="section">23.6. [Virtuoso System
Tables](systemtables.html)</span>

<span class="section">23.6.1. [Core System
Tables](systemtables.html#systables)</span>

<span class="section">23.6.2. [System Tables](usersystables.html)</span>

<span class="section">23.6.3. [Row Level Security
Table](rowlevelsectab.html)</span>

<span class="section">23.6.4. [SYS_CHARSETS](charsetsystab.html)</span>

<span class="section">23.6.5. [Collations System
Table](sys_collations.html)</span>

<span class="section">23.6.6. [UDDI Schema](uddischema.html)</span>

<span class="section">23.6.7. [Web Robot System
Tables](robotsystables.html)</span>

<span class="section">23.6.8. [Web Server & DAV System
Tables](davsystables.html)</span>

<span class="section">23.6.9. [Mail Table
Description](smtptabledesc.html)</span>

<span class="section">23.6.10. [NNTP Server
Tables](newssrvtables.html)</span>

<span class="section">23.6.11. [WS Reliable
Messaging](systabswsrm.html)</span>

<span class="section">23.6.12. [WS Trust](wstschema.html)</span>

<span class="section">23.6.13. [SyncML Schema
Objects](syncmlschema.html)</span>

<span class="section">23.6.14. [INFORMATION_SCHEMA
views](views_information_schema.html)</span>

<span class="section">23.7. [Basic Syntax of Regular
Expressions](apndxregexp.html)</span>

<span class="section">23.8. [Server & client versions
compatibility](apndxclientcompilance.html)</span>

<span class="section">24. [Functions
Reference](ch-functions.html)</span>

</div>

</div>
