<div id="linkeddata3simplesteps" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.42. Virtuoso Linked Data Deployment In 3 Simple Steps?

</div>

</div>

</div>

Injecting Linked Data into the Web has been a major pain point for those
who seek personal, service, or organization-specific variants of
DBpedia. Basically, the sequence goes something like this:

<div class="orderedlist">

1.  You encounter DBpedia or the LOD Cloud Pictorial.

2.  You look around (typically following your nose from link to link).

3.  You attempt to publish your own stuff.

4.  You get stuck.

</div>

The problems typically take the following form:

<div class="orderedlist">

1.  Functionality confusion about the complementary Name and Address
    functionality of a single URI abstraction.

2.  Terminology confusion due to conflation and over-loading of terms
    such as Resource, URL, Representation, Document, etc.

3.  Inability to find robust tools with which to generate Linked Data
    from existing data sources such as relational databases, CSV files,
    XML, Web Services, etc.

</div>

To start addressing these problems, here is a simple guide for
generating and publishing Linked Data using Virtuoso.

<div id="linkeddata3simplesteps1" class="section">

<div class="titlepage">

<div>

<div>

#### Step 1 - RDF Data Generation

</div>

</div>

</div>

Existing RDF data can be added to the Virtuoso RDF Quad Store via a
variety of built-in data loader utilities.

Many options allow you to easily and quickly generate RDF data from
other data sources:

<div class="itemizedlist">

- Install the Sponger Bookmarklet for the URIBurner service. Bind this
  to your own SPARQL-compliant backend RDF database (in this scenario,
  your local Virtuoso instance), and then perform Network Resource Fetch
  of some HTTP-accessible resources.

- Convert relational DBMS data to RDF using the Virtuoso Linked Data
  Views Wizard.

- Starting with CSV files, you can:

  <div class="itemizedlist">

  - Place them at an HTTP-accessible location, and use the Virtuoso
    Sponger to convert them to RDF or;

  - Use the CVS import feature to import their content into Virtuoso's
    relational data engine; then use the built-in Linked Data Views
    Wizard as with other RDBMS data.

  </div>

- Starting from XML files, you can:

  <div class="itemizedlist">

  - Use Virtuoso's inbuilt XSLT-Processor for manual XML to RDF/XML
    transformation or;

  - Leverage the Sponger Cartridge for GRDDL, if there is a
    transformation service associated with your XML data source, or;

  - Let the Sponger analyze the XML data source and make a best-effort
    transformation to RDF.

  </div>

</div>

</div>

<div id="linkeddata3simplesteps2" class="section">

<div class="titlepage">

<div>

<div>

#### Step 2 - Linked Data Deployment

</div>

</div>

</div>

Install the Faceted Browser VAD package (fct_dav.vad) which delivers the
following:

<div class="orderedlist">

1.  Faceted Browser Engine UI

2.  Dynamic Hypermedia Resource Generator:

    <div class="itemizedlist">

    - delivers descriptor resources for every entity (data object) in
      the Native or Virtual Quad Stores

    - supports a broad array of output formats, including HTML+RDFa,
      RDF/XML, N3/Turtle, NTriples, RDF-JSON, OData+Atom, and
      OData+JSON.

    </div>

</div>

</div>

<div id="linkeddata3simplesteps3" class="section">

<div class="titlepage">

<div>

<div>

#### Step 3 - Linked Data Consumption & Exploitation

</div>

</div>

</div>

Three simple steps allow you, your enterprise, and your customers to
consume and exploit your newly deployed Linked Data --

<div class="orderedlist">

1.  Load a page like this in your browser:
    http://\<cname\>\[:\<port\>\]/describe/?uri=\<entity-uri\>

    <div class="itemizedlist">

    - \<cname\>\[:\<port\>\] gets replaced by the host and port of your
      Virtuoso instance

    - \<entity-uri\> gets replaced by the URI you want to see described
      -- for instance, the URI of one of the resources you let the
      Sponger handle.

    </div>

2.  Follow the links presented in the descriptor page.

3.  If you ever see a blank page with a hyperlink subject name in the
    About: section at the top of the page, simply add the parameter
    "&sp=1" to the URL in the browser's Address box, and hit \[ENTER\].
    This will result in an "on the fly" resource retrieval,
    transformation, and descriptor page generation.

4.  Use the navigator controls to page up and down the data associated
    with the "in scope" resource descriptor.

</div>

</div>

</div>
