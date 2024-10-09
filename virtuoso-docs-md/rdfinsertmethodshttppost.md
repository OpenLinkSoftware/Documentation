<div>

<div>

<div>

<div>

### 16.9.2. SPARQL endpoint REST API

</div>

</div>

</div>

With POST can be accomplished SPARQL Insert/Update etc.

The result is in the rdf_quad.

With GET Methods you can get the triples which are saved.

<span class="emphasis">*Examples:*</span>

<span class="emphasis">*Example 1:*</span>

Create a DAV collection xx for user demo with password demo.

Execute the following command:

``` programlisting
curl -i -d "INSERT {<http://demo.openlinksw.com/DAV/home/demo_about.rdf>
<http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://rdfs.org/sioc/ns#User>}" -u "demo:demo"
-H "Content-Type: application/sparql-query" http://example.com/DAV/xx/yy
```

The response should be:

``` programlisting
HTTP/1.1 201 Created
Server: Virtuoso/05.00.3023 (Win32) i686-generic-win-32  VDB
Connection: Keep-Alive
Content-Type: text/html; charset=ISO-8859-1
Date: Fri, 28 Dec 2007 12:50:12 GMT
Accept-Ranges: bytes
MS-Author-Via: SPARQL
Content-Length: 0
```

The result in the DAV/xx location will be a new WebDAV resource with
name "yy" containing the inserted RDF:

``` programlisting
<?xml version="1.0" encoding="utf-8" ?>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#">
<rdf:Description
rdf:about="http://demo.openlinksw.com/DAV/home/demo_about.rdf">
<ns0pred:type xmlns:ns0pred="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
rdf:resource="http://rdfs.org/sioc/ns#User"/>
</rdf:Description>
</rdf:RDF>
```

<span class="emphasis">*Example 2:*</span>

Create a DAV collection, for ex. with name "test" for user ( for ex.
demo).

Execute the following command:

``` programlisting
curl -i -d "INSERT IN GRAPH <http://mygraph.com>
{ <http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this>
  <http://www.w3.org/1999/02/22-rdf-syntax-ns#type>
  <http://rdfs.org/sioc/ns#User> .
  <http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this>
  <http://www.w3.org/2000/01/rdf-schema#label>
  <Kingsley Uyi Idehen> .
  <http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this>
  <http://rdfs.org/sioc/ns#creator_of>

<http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1300>
  } " -u "demo:demo" -H "Content-Type: application/sparql-query" http://example.com/DAV/home/demo/test/myrq
```

As result the response will be:

``` programlisting
HTTP/1.1 201 Created
Server: Virtuoso/05.00.3023 (Win32) i686-generic-win-32  VDB
Connection: Keep-Alive
Content-Type: text/html; charset=ISO-8859-1
Date: Thu, 20 Dec 2007 16:25:25 GMT
Accept-Ranges: bytes
MS-Author-Via: SPARQL
Content-Length: 0
```

Now let's check the inserted triples. Go to the sparql endpoint, i.e.
http://example.com/sparql and:

<div>

1.  Enter for Default Graph URI:

    ``` programlisting
    http://mygraph.com
    ```

2.  Enter in the Query area:

    ``` programlisting
    SELECT * WHERE {?s ?p ?o}
    ```

3.  Click the button "Run Query"

4.  As result will be shown the inserted triples:

    ``` programlisting
    s                                                             p                                                 o
    http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this   http://www.w3.org/1999/02/22-rdf-syntax-ns#type   http://rdfs.org/sioc/ns#User
    http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this   http://www.w3.org/2000/01/rdf-schema#label           Kingsley
    http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com#this   http://rdfs.org/sioc/ns#creator_of                http://www.openlinksw.com/dataspace/kidehen@openlinksw.com/weblog/kidehen@openlinksw.com%27s%20BLOG%20%5B127%5D/1300
    ```

</div>

</div>
