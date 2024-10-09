<div>

<div>

<div>

<div>

### 16.10.6. Consuming the Generated RDF Structured Data

</div>

</div>

</div>

The generated RDF-based structured data (RDF) can be consumed in a
number of ways, depending on whether or not the data is persisted in
Virtuoso's RDF Quad Store.

If the data is persisted, it can be queried through the Virtuoso SPARQL
endpoint associated with any Virtuoso instance: /sparql. The RDF is
exposed in a graph typically identified using a URL matching the source
resource URL from which the RDF data was generated. Naturally, any SQL
query can also access this, since SPARQL can be freely intermixed with
SQL via Virtuoso's SPASQL (SPARQL inside SQL) functionality. RDF data is
also accessible through Virtuoso's implementation of the URIQA protocol.

If not persisted, as is the case with the RDF Proxy Service, the data
can be consumed by an RDF aware Web client, e.g. an RDF browser such as
the OpenLink Data Explorer (ODE).

</div>
