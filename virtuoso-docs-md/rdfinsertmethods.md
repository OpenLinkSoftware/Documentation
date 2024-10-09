<div>

<div>

<div>

<div>

## 16.9. RDF Insert Methods in Virtuoso

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 16.9.1. Using API functions

</div>

</div>

</div>

<div>

- <a href="rdfapi.html#rdfapidataimportttlp" class="link"
  title="Using TTLP">Using the DB.DBA.TTLP() function</a>

  <div>

  - Note: use this function for loading Turtle

  </div>

- <a href="rdfapi.html#rdfapidataimportttlpmt" class="link"
  title="Using TTLP_MT">Using the DB.DBA.TTLP_MT() function</a>

  <div>

  - Note: use this function for loading triples from file on multiple
    threads

  </div>

- <a href="rdfapi.html#rdfapidataimportxmlttlpmt" class="link"
  title="Using RDF_LOAD_RDFXML_MT">Using the DB.DBA.RDF_LOAD_RDFXML_MT()
  function</a>

  <div>

  - Note: Use this function for loading large resources when
    transactional integrity is not important (loading of a single
    resource may take more than one transaction)

  </div>

- <a href="rdfapi.html#rdfapidataimportttlphash" class="link"
  title="Using RDF_TTL2HASH">Using the DB.DBA.RDF_TTL2HASH() function</a>

  <div>

  - Note: use this function to get dictionary of triples in 'long
    valmode'.

  </div>

- <a href="rdfapi.html#rdfapidataimportloadrdfxml" class="link"
  title="Using RDF_LOAD_RDFXML">Using the DB.DBA.RDF_LOAD_RDFXML()
  function</a>

  <div>

  - For loading RDF/XML, the best way is to split the data to be loaded
    into multiple streams and load these in parallel using this
    function.

  </div>

</div>

See <a href="rdfperfloading.html" class="link"
title="16.17.12. Loading RDF">more details</a> for loading Performance
Tuning specifics.

</div>

</div>
