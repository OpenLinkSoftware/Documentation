<div>

<div>

<div>

<div>

### 1.5.68. What is the ShortenLongURIs Virtuoso configuration parameter?

</div>

</div>

</div>

The ShortenLongURIs parameter is a Virtuoso configuration setting to
shorten extremely long URIs in datasets when loading with the RDF Bulk
Loader.

Some RDF datasets have long URIs that exceed the Virtuoso internal
maximum size of 1900 bytes and thus need to be shortened to avoid errors
like:

``` programlisting
"SR133: Can not set NULL to not nullable column 'DB.DBA.RDF_QUAD.S' (or .O, or .P)"
```

which has been seen loading some of the DBpedia 3.7 datasets, for
example.

The Virtuoso ShortenLongURIs parameter needs to be set in the
<a href="ch-server.html#ini_sparql" class="link"
title="[SPARQL]">[SPARQL]</a> section of the Virtuoso configuration file
(virtuoso.ini by default) and restart the Virtuoso Server.

``` programlisting
[SPARQL]
.
.
.
ShortenLongURIs = 1
.
.
.
```

<span class="emphasis">*Note*</span> : This parameter is only in the
Virtuoso 06.03.3131+ commercial builds, at the time of writing it is not
included in the open source 6.1.4 archives but will be in the next 6.1.5
release. A patch to enable this feature is however available from the <a
href="http://sourceforge.net/tracker/?func=detail&amp;aid=3496331&amp;group_id=161622&amp;tid=820576"
class="ulink" target="_top">Virtuso patches page on source forge</a> ,
which can be applied to a 6.1.4 archive from source forge and the
Virtuoso server binary rebuilt.

</div>
