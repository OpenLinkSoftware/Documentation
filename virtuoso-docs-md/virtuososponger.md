<div id="virtuososponger" class="section">

<div class="titlepage">

<div>

<div>

## 16.10. RDFizer Middleware (Sponger)

</div>

</div>

</div>

<div id="virtuosospongerintro" class="section">

<div class="titlepage">

<div>

<div>

### 16.10.1. What Is The Sponger?

</div>

</div>

</div>

The Virtuoso Sponger is the Linked Data middleware component of Virtuoso
that generates Linked Data from a variety of data sources, supporting a
wide variety of data representation and serialization formats. The
sponger is transparently integrated into Virtuoso's SPARQL Query
Processor where it delivers URI de-referencing within SPARQL query
patterns, across disparate data spaces. It also delivers configurable
smart HTTP caching services. Optionally, it can be used by the
<a href="admui.webservices.html#contentcrawlerrdf" class="link"
title="Set Up the Content Crawler to Gather RDF">Virtuoso Content
Crawler</a> to periodically populate and replenish data within the
native RDF Quad Store.

The sponger is a fully fledged HTTP proxy service that is also directly
accessible via SOAP or REST interfaces.

As depicted below, OpenLink's broad portfolio of Linked-Data-aware
products supports a number of routes for creating or consuming Linked
Data. The Sponger provides a key platform for developers to generate
quality data meshes from unstructured or semi-structured data sources.

<div class="figure-float">

<div id="virtuosospongerdiagram" class="figure">

**Figure 16.96. OpenLink Linked Data generation options**

<div class="figure-contents">

<div class="mediaobject">

![OpenLink Linked Data generation
options](images/Sponger_LinkedDataGenOptions_2014_v3.png)

</div>

</div>

</div>

  

</div>

Architecturally, the Sponger is comprised of a number of Cartridges two
types of cartridges: Extractor and Meta Cartridges. Extractor Cartridges
focus on data extraction and transformation services while the Meta
Cartridges provide lookups and joins across other linked data spaces and
Web 2.0 APIs. Both cartridge types are themselves comprised of a data
extractors and RDF Schema/Ontology Mapper components.

Cartridges are is highly customizable. Custom cartridges can be
developed using any language supported by the Virtuoso Server Extensions
API enabling structured linked data generation from resource types not
available in the default Sponger Cartridge collection bundled -- as part
of the Virtuoso <a
href="http://s3.amazonaws.com/opldownload/uda/vad-packages/6.3/virtuoso/cartridges_dav.vad"
class="ulink" target="_top">Cartridges VAD package</a> .

<div class="figure-float">

<div id="virtuosospongerdiagram_01" class="figure">

**Figure 16.97. Virtuoso metadata extraction & RDF structured data
generation**

<div class="figure-contents">

<div class="mediaobject">

![Virtuoso metadata extraction & RDF structured data
generation](images/linked_data_gen_opts4.png)

</div>

<div class="mediaobject">

![Virtuoso metadata extraction & RDF structured data
generation](images/linked_data_gen_opts4.png)

</div>

</div>

</div>

  

</div>

</div>

</div>
