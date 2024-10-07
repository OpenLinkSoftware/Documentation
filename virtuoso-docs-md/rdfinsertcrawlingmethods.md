<div id="rdfinsertcrawlingmethods" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.67. Quad Store Data Loading via Virtuoso's In-built Content Crawler?

</div>

</div>

</div>

This section covers the use of Virtuoso's in-built content crawler as a
mechanism for scheduled of one-off data loading operations for its
native quad store.

<span class="emphasis">*Why is this important?*</span>

Transforming external data sources into Linked Data "on the fly" (e.g.,
via the 'Sponger') is sufficient for many use cases, but there are times
when the volume or sheer nature of a data source makes batch-loading
necessary. For example, Freebase offers RDF representations of its data,
but it doesn't publish RDF dumps; even if it did, such dumps would
usually be outdated by the time they were loaded. Thus, a scheduled
crawl of that resource collection offers a viable alternative.

<span class="emphasis">*How to Set Up the Content Crawler for Linked
Data generation and import*</span>

The Virtuoso Conductor can be used to set up various Content Crawler
Jobs:

<div class="itemizedlist">

- <a href="rdfinsertmethodvirtuosocrawler.html" class="link"
  title="16.9.8. Using Virtuoso Crawler">Setting up a Content Crawler Job
  to Import Linked Data into the Virtuoso Quad Store</a>

- <a href="admui.webservices.html#contentcrawlerrdfsm" class="link"
  title="Setting up a Content Crawler Job to Retrieve Sitemaps (when the source includes RDFa)">Setting
  up a Content Crawler Job to Retrieve Sitemaps</a> (when the source
  includes RDFa)

- <a href="admui.webservices.html#contentcrawlerrdfssm" class="link"
  title="Setting up a Content Crawler Job to Retrieve Semantic Sitemaps (a variation of the standard sitemap)">Setting
  up a Content Crawler Job to Retrieve Semantic Sitemaps</a> (a
  variation of the standard sitemap)

- <a href="admui.webservices.html#contentcrawlerrdfsd" class="link"
  title="Setting up a Content Crawler Job to Retrieve Content from Specific Directories">Setting
  up a Content Crawler Job to Retrieve Content from Specific
  Directories</a>

- <a href="admui.webservices.html#contentcrawleratom" class="link"
  title="Setting up a Content Crawler Job to Retrieve Content from ATOM feed">Setting
  up a Content Crawler Job to Retrieve Content from ATOM feed</a>

- <a href="admui.webservices.html#contentcrawlersparqlendp" class="link"
  title="Setting up a Content Crawler Job to Retrieve Content from SPARQL endpoint">Setting
  up a Content Crawler Job to Retrieve Content from SPARQL endpoint</a>

</div>

</div>
