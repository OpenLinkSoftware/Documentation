<div>

<div>

<div>

<div>

### 6.2.10. Conductor Linked Data Administration

</div>

</div>

</div>

From Conductor the "Linked Data" tab allows you to execute/save/load
SPARQL queries, to add/edit RDF Mapping, to perform statistics and
manage graphs, to import schemas and define namespaces, to generated
Linked Data Views and to upload to the Quad Store.

<div>

<div>

<div>

<div>

#### SPARQL

</div>

</div>

</div>

<div>

<div>

<div>

<div>

##### Query

</div>

</div>

</div>

"SPARQL -\> Query" offers form form SPARQL query execution:

<div>

<div>

**Figure 6.155. RDF**

<div>

<div>

![RDF](images/rdf.png)

</div>

</div>

</div>

  

</div>

Also you can save the results in a query or load such:

<div>

<div>

**Figure 6.156. RDF**

<div>

<div>

![RDF](images/rdf1.png)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

##### Saved Queries

</div>

</div>

</div>

"SPARQL -\> Saved Queries" offers list of saved queries, which can be
opened in the "Query" tab in order to be executed:

<div>

<div>

**Figure 6.157. RDF**

<div>

<div>

![RDF](images/rdf2.png)

</div>

</div>

</div>

  

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Sponger

</div>

</div>

</div>

<div>

<div>

<div>

<div>

##### Extractor Cartridges

</div>

</div>

</div>

Shows list of available extractor cartridges. They can be re-ordered by
place of appearance, edit or deleted:

<div>

<div>

**Figure 6.158. RDF**

<div>

<div>

![RDF](images/rdf3.png)

</div>

</div>

</div>

  

</div>

You can also add a new extractor cartridge:

<div>

<div>

**Figure 6.159. RDF**

<div>

<div>

![RDF](images/rdf4.png)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

##### Meta Cartridges

</div>

</div>

</div>

Shows list of available meta cartridges. They can be re-ordered by place
of appearance, edit or deleted:

<div>

<div>

**Figure 6.160. RDF**

<div>

<div>

![RDF](images/rdf5.png)

</div>

</div>

</div>

  

</div>

You can also add a new meta cartridge:

<div>

<div>

**Figure 6.161. RDF**

<div>

<div>

![RDF](images/rdf6.png)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

##### Stylesheets

</div>

</div>

</div>

Shows list of available stylesheets for processing cartridges. From here
you can manage these stylesheets by adding new, editing existing ones or
deleting them:

<div>

<div>

**Figure 6.162. RDF**

<div>

<div>

![RDF](images/rdf7.png)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

##### Console

</div>

</div>

</div>

Offers tracking cartridges exection. By default is off. When enabled,
shows list of sessions per cartridge:

<div>

<div>

**Figure 6.163. RDF**

<div>

<div>

![RDF](images/rdf8.png)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

##### Configuration

</div>

</div>

</div>

Offers creation of secure endpoints for pre-defiend vitual host:

<div>

<div>

**Figure 6.164. RDF**

<div>

<div>

![RDF](images/rdf9.png)

</div>

</div>

</div>

  

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Statistics

</div>

</div>

</div>

Offers interface for <a href="fn_rdf_void_store.html" class="link"
title="DB.DBA.RDF_VOID_STORE"><code
class="function">DB.DBA.RDF_VOID_STORE(graph, to_graph)</code></a> . In
the new graph ( field "Publish to") will be saved the VoID statistics
data when generated:

<div>

<div>

**Figure 6.165. RDF**

<div>

<div>

![RDF](images/rdf14.png)

</div>

</div>

</div>

  

</div>

<div>

<div>

**Figure 6.166. RDF**

<div>

<div>

![RDF](images/rdf15.png)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

#### Graphs

</div>

</div>

</div>

"Graphs" tab shows list of current graphs in the RDF Quad Store. From
here day can be renamed or deleted:

<div>

<div>

**Figure 6.167. RDF**

<div>

<div>

![RDF](images/rdf10.png)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

#### Schemas

</div>

</div>

</div>

Shows list of available schemas IRI-s and offers a new schema IRI to be
imported:

<div>

<div>

**Figure 6.168. RDF**

<div>

<div>

![RDF](images/rdf11.png)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

#### Namespaces

</div>

</div>

</div>

Shows list of namespace prefixes and offers a new namespace prefix to be
imported:

<div>

<div>

**Figure 6.169. RDF**

<div>

<div>

![RDF](images/rdf12.png)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

#### Access Control

</div>

</div>

</div>

<div>

<div>

<div>

<div>

##### Sponger

</div>

</div>

</div>

Manage Sponger rules by adding new ones, deleting, re-ordering, etc.

This tab is available only when the <a
href="http://s3.amazonaws.com/opldownload/uda/vad-packages/6.3/virtuoso/cartridges_dav.vad"
class="ulink" target="_top">cartridges_dav.vad</a> is installed.

<div>

<div>

**Figure 6.170. RDF**

<div>

<div>

![RDF](images/rdf19.png)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

##### SPARQL-WebID

</div>

</div>

</div>

Here you can manage different WebID Protocol ACLs WebID ACL by granting
SPARQL Roles such as "SELECT", "UPDATE", "SPONGE":

This tab is available only when the <a
href="http://s3.amazonaws.com/opldownload/uda/vad-packages/6.3/virtuoso/policy_manager_dav.vad"
class="ulink" target="_top">policy__manager_dav.vad</a> is installed.

<div>

<div>

**Figure 6.171. RDF**

<div>

<div>

![RDF](images/rdf18.png)

</div>

</div>

</div>

  

</div>

<div>

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
<td style="text-align: left;" data-valign="top"><p><a
href="rdfsparqlprotocolendpoint.html#sparqwebservicetbl" class="link"
title="Managing a SPARQL Web Service Endpoint">Managing a SPARQL Web
Service Endpoint</a></p>
<p><a href="rdfsparqlprotocolendpoint.html#sparqloauthendpointfoafssl"
class="link" title="WebID Protocol ACLs">WebID Protocol ACLs</a></p>
<p><a
href="rdfsparqlprotocolendpoint.html#sparqloauthendpointfoafsslsparql"
class="link"
title="Creating and Using a SPARQL-WebID based Endpoint">Creating and
Using a SPARQL-WebID based Endpoint</a></p>
<p><a href="rdfsparqlprotocolendpoint.html#rdfsparqlendpointexamples3"
class="link" title="Example with curl and SPARQL-WebID endpoint">Example
with curl and SPARQL-WebID endpoint</a></p></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Views

</div>

</div>

</div>

Virtuoso uses a SPARQL-based Meta Schema Language to provide
RDBMS-to-RDF mapping functionality (also described as, Linked Data Views
of SQL data). The language is an extension of the SPARQL query language
meshed with Virtuoso's SPASQL (SPARQL-inside-SQL) functionality. The
language enables you to declaratively map relational database schema
tables, columns, rows, and foreign key relationships to Classes,
Attributes, Relationships, and Instances (Objects/Entities/Individuals)
defined by RDF Schemas or OWL Ontologies. The mapping process uses a
special built-in Virtuoso function to generate IRIs / URIs in "Subject"
or "Object" position of a SPARQL graph pattern, en route to building a
set of SQL compiler rules and optimizations for translating SPARQL
queries into SQL on the fly.

<div>

<div>

**Figure 6.172. RDF**

<div>

<div>

![RDF](images/rdf13.png)

</div>

</div>

</div>

  

</div>

<div>

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
<td style="text-align: left;" data-valign="top"><p><a
href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VOSSQL2RDF#Mapping%20Process"
class="ulink" target="_top">Mapping Process steps.</a></p>
<p><a
href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VOSSQL2RDF#Mapping%20Example"
class="ulink" target="_top">Mapping Example.</a></p>
<p><a
href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VOSSQL2RDF"
class="ulink" target="_top">Mapping SQL Data to RDF.</a></p>
<p><a
href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VirtRdb2RDFViewsGeneration"
class="ulink" target="_top">Automated Generation of Linked Data Views
over Relational Data Sources with Virtuoso.</a></p></td>
</tr>
</tbody>
</table>

</div>

</div>

<div>

<div>

<div>

<div>

#### Quad Store Upoload

</div>

</div>

</div>

Offers upload to Quad Store from file or Resource URL:

<div>

<div>

**Figure 6.173. RDF**

<div>

<div>

![RDF](images/rdf16.png)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

#### Subscriptions (PHSB)

</div>

</div>

</div>

This tab is available only when the <a
href="http://s3.amazonaws.com/opldownload/uda/vad-packages/6.1/virtuoso/pubsubhub_dav.vad"
class="ulink" target="_top">pubsubhub_dav.vad</a> is installed.

Offers Virtuoso's implementation of the <a
href="http://pubsubhubbub.googlecode.com/svn/trunk/pubsubhubbub-core-0.3.html"
class="ulink" target="_top">PubSubHubBub Protocol</a> to handle Linked
Data by subscribing to Linked Data resource URIs.

<div>

<div>

**Figure 6.174. Subscriptions (PHSB)**

<div>

<div>

![Subscriptions (PHSB)](images/rdf17.png)

</div>

</div>

</div>

  

</div>

Note: the Hub endpoint should be defined ACL in System Admin -\>
Security -\> Access Control -\> PSH-SLL

<div>

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
<td style="text-align: left;" data-valign="top"><p><a
href="http://ods.openlinksw.com/wiki/ODS/VirtPubSubHub" class="ulink"
target="_top">Example of Linked Data Usage of PubSubHubbub
Implementation.</a></p>
<p><a href="http://ods.openlinksw.com/wiki/ODS/VirtFeedPubSubHub"
class="ulink" target="_top">Feed subscription via PubSubHub
Protocol.</a></p>
<p><a href="http://ods.openlinksw.com/wiki/ODS/VirtODSPubSubHub"
class="ulink" target="_top">Setting up PubSubHub in ODS.</a></p>
<p><a href="http://ods.openlinksw.com/wiki/ODS/VirtSPARQLSecurityWebID"
class="ulink" target="_top">Securing your SPARQL Endpoint via
WebID.</a></p></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>
