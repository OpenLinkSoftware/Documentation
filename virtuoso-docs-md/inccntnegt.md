<div>

<div>

<div>

<div>

### 1.5.41. How can I incorporate Content Negotiation into RDF bulk loaders?

</div>

</div>

</div>

The examples from below demonstrate how to incorporate Content
Negotiation into RDF bulk loaders:

<div>

- Using the <a href="fn_rdf_load_rdfxml.html" class="link"
  title="DB.DBA.RDF_LOAD_RDFXML"><code
  class="function">DB.DBA.RDF_LOAD_RDFXML</code></a> function:

  ``` programlisting
  DB.DBA.RDF_LOAD_RDFXML (http_get ('http://purl.org/ontology/mo/', null, 'GET', 'Accept: application/rdf+xml', null, null, 3), 'http://purl.org/ontology/mo/', 'http://purl.org/ontology/mo/') .
  ```

- Using the
  <a href="fn_ttlp.html" class="link" title="DB.DBA.TTLP"><code
  class="function">DB.DBA.TTLP</code></a> function: The call to http
  client should be modified to ask for appropriate content type as for
  ex:

  ``` programlisting
  DB.DBA.TTLP (http_get ('http://purl.org/ontology/mo/', null, 'GET', 'Accept: text/n3', null, null, 3), 'http://purl.org/ontology/mo/', 'http://purl.org/ontology/mo/'), '...', '...');
  ```

</div>

</div>
