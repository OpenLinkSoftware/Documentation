<div>

<div>

<div>

<div>

### 16.9.6. SPARQL Insert via SPARQL endpoint REST API and ODS wiki

</div>

</div>

</div>

With HTTP Post and ODS wiki can be written an rdf document and
respectively to be performed over it INSERT/UPDATE action.

You can write to a file using SIOC terms for ODS-Wiki

You can check with sparql the inserted / updated triples in the Quad
Store.

<span class="emphasis">*Example:*</span>

Suppose there is ODS user test3 with ODS password 1, which has testWiki
wiki instance.

Execute the following:

``` programlisting
curl -i -d "INSERT {<http://example.com/dataspace/test3/wiki/testWiki> <http://atomowl.org/ontologies/atomrdf#contains> <http://example.com/dataspace/test3/wiki/testWiki/MyTest> . <http://example.com/dataspace/test3/wiki/testWiki/MyTest> <http://rdfs.org/sioc/ns#has_container> <http://example.com/dataspace/test3/wiki/testWiki> . <http://example.com/dataspace/test3/wiki/testWiki> <http://atomowl.org/ontologies/atomrdf#entry> <http://example.com/dataspace/test3/wiki/testWiki/MyTest> . <http://example.com/dataspace/test3/wiki/testWiki> <http://rdfs.org/sioc/ns#container_of> <http://example.com/dataspace/test3/wiki/testWiki/MyTest> . <http://example.com/dataspace/test3/wiki/testWiki/MyTest> <http://rdfs.org/sioc/ns#topic>  <http://example.com/dataspace/test3/wiki/testWiki> . <http://example.com/dataspace/test3/wiki/testWiki/MyTest> <http://atomowl.org/ontologies/atomrdf#source> <http://example.com/dataspace/test3/wiki/testWiki> . <http://example.com/dataspace/test3/wiki/testWiki/MyTest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://rdfs.org/sioc/types#Comment> . <http://example.com/dataspace/test3/wiki/testWiki/MyTest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://atomowl.org/ontologies/atomrdf#Entry> . <http://example.com/dataspace/test3/wiki/testWiki/MyTest> <http://www.w3.org/2000/01/rdf-schema#label> 'MyTest' . <http://example.com/dataspace/test3/wiki/testWiki/MyTest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://atomowl.org/ontologies/atomrdf#Link> . <http://example.com/dataspace/test3/wiki/testWiki/MyTest> <http://rdfs.org/sioc/ns#content> <test>}" -u "test3:1" -H "Content-Type: application/sparql-query" http://example.com/DAV/home/test3/wiki/testWiki/MyTest
```

As result we should have 2 files created:

<div>

- In the user DAV folder "DAV/home/test3/wiki/testWiki/" will be created
  a file "MyTest" with type "application/sparql-query". You can view the
  content of this file from the Conductor UI or from the user's
  Briefcase UI, path "DAV/home/test3/wiki/testWiki". Its content will
  be:

  ``` programlisting
  <?xml version="1.0" encoding="utf-8" ?>
  <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#">
  <rdf:Description rdf:about="http://example.com/dataspace/test3/wiki/testWiki"><ns0pred:entry xmlns:ns0pred="http://atomowl.org/ontologies/atomrdf#" rdf:resource="http://example.com/dataspace/test3/wiki/testWiki/MyTest"/></rdf:Description>
  <rdf:Description rdf:about="http://example.com/dataspace/test3/wiki/testWiki/MyTest"><ns0pred:label xmlns:ns0pred="http://www.w3.org/2000/01/rdf-schema#">MyTest</ns0pred:label></rdf:Description>
  <rdf:Description rdf:about="http://example.com/dataspace/test3/wiki/testWiki/MyTest"><ns0pred:type xmlns:ns0pred="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="http://atomowl.org/ontologies/atomrdf#Link"/></rdf:Description>
  <rdf:Description rdf:about="http://example.com/dataspace/test3/wiki/testWiki/MyTest"><ns0pred:type xmlns:ns0pred="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="http://rdfs.org/sioc/types#Comment"/></rdf:Description>
  <rdf:Description rdf:about="http://example.com/dataspace/test3/wiki/testWiki/MyTest"><ns0pred:type xmlns:ns0pred="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="http://atomowl.org/ontologies/atomrdf#Entry"/></rdf:Description>
  <rdf:Description rdf:about="http://example.com/dataspace/test3/wiki/testWiki/MyTest"><ns0pred:has_container xmlns:ns0pred="http://rdfs.org/sioc/ns#" rdf:resource="http://example.com/dataspace/test3/wiki/testWiki"/></rdf:Description>
  <rdf:Description rdf:about="http://example.com/dataspace/test3/wiki/testWiki"><ns0pred:container_of xmlns:ns0pred="http://rdfs.org/sioc/ns#" rdf:resource="http://example.com/dataspace/test3/wiki/testWiki/MyTest"/></rdf:Description>
  <rdf:Description rdf:about="http://example.com/dataspace/test3/wiki/testWiki"><ns0pred:contains xmlns:ns0pred="http://atomowl.org/ontologies/atomrdf#" rdf:resource="http://example.com/dataspace/test3/wiki/testWiki/MyTest"/></rdf:Description>
  <rdf:Description rdf:about="http://example.com/dataspace/test3/wiki/testWiki/MyTest"><ns0pred:content xmlns:ns0pred="http://rdfs.org/sioc/ns#">test</ns0pred:content></rdf:Description>
  <rdf:Description rdf:about="http://example.com/dataspace/test3/wiki/testWiki/MyTest"><ns0pred:topic xmlns:ns0pred="http://rdfs.org/sioc/ns#" rdf:resource="http://example.com/dataspace/test3/wiki/testWiki"/></rdf:Description>
  <rdf:Description rdf:about="http://example.com/dataspace/test3/wiki/testWiki/MyTest"><ns0pred:source xmlns:ns0pred="http://atomowl.org/ontologies/atomrdf#" rdf:resource="http://example.com/dataspace/test3/wiki/testWiki"/></rdf:Description>
  </rdf:RDF>
  ```

- To the user's wiki instance will be added a new WikiWord "MyTest" with
  content the value of the SIOC term attribute "content":

  ``` programlisting
  <http://example.com/dataspace/test3/wiki/testWiki/MyTest> <http://rdfs.org/sioc/ns#content> <test>
  i.e. the content will be "test".
  ```

</div>

Now let's check what data was inserted in the Quad Store:

<div>

1.  Go to the sparql endpoint, i.e. for ex. to http://example.com/sparql

2.  Enter for Default Graph URI:

    ``` programlisting
    http://example.com/DAV/home/test3/wiki/testWiki/MyTest
    ```

3.  Enter for Query text:

    ``` programlisting
    SELECT * WHERE {?s ?p ?o}
    ```

4.  Click the "Run Query" button.

5.  As result will be shown the inserted triples:

    ``` programlisting
    s                                                       p                                                o
    http://example.com/dataspace/test3/wiki/testWiki        http://rdfs.org/sioc/ns#container_of         http://example.com/dataspace/test3/wiki/testWiki/MyTest
    http://example.com/dataspace/test3/wiki/testWiki        http://atomowl.org/ontologies/atomrdf#entry      http://example.com/dataspace/test3/wiki/testWiki/MyTest
    http://example.com/dataspace/test3/wiki/testWiki        http://atomowl.org/ontologies/atomrdf#contains   http://example.com/dataspace/test3/wiki/testWiki/MyTest
    http://example.com/dataspace/test3/wiki/testWiki/MyTest  http://www.w3.org/1999/02/22-rdf-syntax-ns#type  http://rdfs.org/sioc/types#Comment
    http://example.com/dataspace/test3/wiki/testWiki/MyTest  http://www.w3.org/1999/02/22-rdf-syntax-ns#type  http://atomowl.org/ontologies/atomrdf#Entry
    http://example.com/dataspace/test3/wiki/testWiki/MyTest  http://www.w3.org/1999/02/22-rdf-syntax-ns#type  http://atomowl.org/ontologies/atomrdf#Link
    http://example.com/dataspace/test3/wiki/testWiki/MyTest  http://www.w3.org/2000/01/rdf-schema#label          MyTest
    http://example.com/dataspace/test3/wiki/testWiki/MyTest  http://rdfs.org/sioc/ns#has_container       http://example.com/dataspace/test3/wiki/testWiki
    http://example.com/dataspace/test3/wiki/testWiki/MyTest  http://rdfs.org/sioc/ns#content                 test
    http://example.com/dataspace/test3/wiki/testWiki/MyTest  http://rdfs.org/sioc/ns#topic               http://example.com/dataspace/test3/wiki/testWiki
    http://example.com/dataspace/test3/wiki/testWiki/MyTest  http://atomowl.org/ontologies/atomrdf#source     http://example.com/dataspace/test3/wiki/testWiki
    ```

</div>

</div>
