<div id="virtuosospongerworkpr" class="section">

<div class="titlepage">

<div>

<div>

### 16.10.3. How Does It Work?

</div>

</div>

</div>

When an RDF aware client requests data from a network accessible
resource via the Sponger the following events occur:

<div class="itemizedlist">

- A requests in made for data in RDF form, and if RDF is returned
  nothing further happens

- If RDF isn't returned, then the Sponger passes the data through a
  Metadata Extraction Pipeline process (using Metadata Extractors)

- The extracted data is transformed to RDF via a Mapping Pipeline
  process (RDF is extracted by way of Ontology matching and mapping)
  that results in RDF Entities (instance data) generation

- RDF Entities are returned to the client

</div>

The imported data forms a local cache and its invalidation rules conform
to those of traditional HTTP clients (Web Browsers). Thus, expiration
time is determined based on subsequent data fetches of the same resource
(note: the first data load will record the 'expires' header) with
current time compared to expiration time stored in the local cache. If
HTTP 'expires' header data isn't returned by the source data server,
then the "Sponger" will derive it's own invalidation time frame by
evaluating the 'date' header and 'last-modified' HTTP headers.
Irrespective of path taken, local cache invalidation is driven by an
assessment of current time relative to recorded expiration time.

To manage the cache expiration, set the
<span class="emphasis">*MinExpiration*</span> parameter in your
Virtuoso.ini file.

Read full description of the parameter in the
<a href="ch-server.html#ini_sparql" class="link"
title="[SPARQL]">[SPARQL] ini section</a> .

Designed with a pluggable architecture, the Sponger's core functionality
is provided by Cartridges. Each cartridge includes Data Extractors which
extract data from one or more data sources, and Ontology Mappers which
map the extracted data to one or more ontologies/schemas, and route to
producing RDF Linked Data.

The Schema Mappers are typically XSLT (e.g. GRDDL and other OpenLink
Mapping Schemas) or Virtuoso PL based. The Metadata Extractors may be
developed in Virtuoso PL, C/C++, Java, or any other language that can be
integrated into the Virtuoso via it's server extensions APIs.

The Sponger also includes a pluggable name resolution mechanism that
enables the development of Custom Resolvers for naming schemes (e.g.
URNs) associated with protocols beyond HTTP. Examples of custom
resolvers include:

<div class="itemizedlist">

- <a href="http://dbpedia.org/resource/LSID" class="ulink"
  target="_top">LSID</a>

- <a href="http://dbpedia.org/resource/DOI" class="ulink"
  target="_top">DOI</a>

</div>

</div>
