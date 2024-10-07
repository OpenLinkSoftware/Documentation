<div id="rdfinsertmethodshttpput" class="section">

<div class="titlepage">

<div>

<div>

### 16.9.3. HTTP PUT using Content-Type: application/rdf+xml

</div>

</div>

</div>

The URI in a PUT request identifies the entity enclosed with the
request. Therefore using HTTP PUT is a more useful and meaningful
command than using POST (which is more about submitting data to a
script).

<span class="emphasis">*Example:*</span>

Suppose there is myfoaf.rdf file with the following content:

``` programlisting
<rdf:RDF xmlns="http://www.example/jose/foaf.rdf#"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:log="http://www.w3.org/2000/10/swap/log#"
    xmlns:myfoaf="http://www.example/jose/foaf.rdf#"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">

    <foaf:Person rdf:about="http://www.example/jose/foaf.rdf#jose">
        <foaf:homepage rdf:resource="http://www.example/jose/"/>
        <foaf:knows rdf:resource="http://www.example/jose/foaf.rdf#juan"/>
        <foaf:name>Jose Jimen~ez</foaf:name>
        <foaf:nick>Jo</foaf:nick>
        <foaf:workplaceHomepage rdf:resource="http://www.corp.example/"/>
    </foaf:Person>

    <foaf:Person rdf:about="http://www.example/jose/foaf.rdf#juan">
        <foaf:mbox rdf:resource="mailto:juan@mail.example"/>
    </foaf:Person>

    <foaf:Person rdf:about="http://www.example/jose/foaf.rdf#julia">
        <foaf:mbox rdf:resource="mailto:julia@mail.example"/>
    </foaf:Person>

    <rdf:Description rdf:about="http://www.example/jose/foaf.rdf#kendall">
        <foaf:knows rdf:resource="http://www.example/jose/foaf.rdf#edd"/>
    </rdf:Description>
</rdf:RDF>
```

Now let's upload the myfoaf.rdf file to destination server
demo.openlinksw.com for user demo:

``` programlisting
curl -T myfoaf.rdf http://demo.openlinksw.com/DAV/home/demo/rdf_sink/myfoaf.rdf -u demo:demo
```

As result the response should be:

``` programlisting
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<HTML>
<HEAD>
  <TITLE>201 Created</TITLE>
</HEAD>
<BODY>
  <H1>Created</H1>
  Resource /DAV/home/demo/rdf_sink/ myfoaf.rdf has been created.
</BODY>
</HTML>
```

Then you can execute:

``` programlisting
curl -F "query=SELECT DISTINCT ?p FROM <http://demo.openlinksw.com/DAV/home/demo/rdf_sink/> WHERE {?s ?p ?o}" http://demo.openlinksw.com/sparql
```

The result should be:

``` programlisting
<?xml version="1.0" ?>
<sparql xmlns="http://www.w3.org/2005/sparql-results#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.w3.org/2001/sw/DataAccess/rf1/result2.xsd">
 <head>
  <variable name="p"/>
 </head>
 <results distinct="false" ordered="true">
  <result>
   <binding name="p"><uri>http://www.w3.org/1999/02/22-rdf-syntax-ns#type</uri></binding>
  </result>
  <result>
   <binding name="p"><uri>http://xmlns.com/foaf/0.1/nick</uri></binding>
  </result>
  <result>
   <binding name="p"><uri>http://xmlns.com/foaf/0.1/name</uri></binding>
  </result>
  <result>
   <binding name="p"><uri>http://xmlns.com/foaf/0.1/homepage</uri></binding>
  </result>
  <result>
   <binding name="p"><uri>http://xmlns.com/foaf/0.1/knows</uri></binding>
  </result>
  <result>
   <binding name="p"><uri>http://xmlns.com/foaf/0.1/workplaceHomepage</uri></binding>
  </result>
  <result>
   <binding name="p"><uri>http://xmlns.com/foaf/0.1/mbox</uri></binding>
  </result>
 </results>
</sparql>
```

Other examples with curl:

``` programlisting
curl -F "query=SELECT distinct ?Concept FROM <http://dbpedia.org> WHERE {?s a ?Concept} limit 10" http://dbpedia.org/sparql
```

``` programlisting
curl -F "query=SELECT distinct ?Concept FROM <http://example.com/dataspace/person/kidehen> WHERE {?s a ?Concept} limit 10" http://demo.openlinksw.com/sparql
```

``` programlisting
curl -F "query=SELECT distinct ?Concept FROM <http://data.openlinksw.com/oplweb/product_family/virtuoso> WHERE {?s a ?Concept} limit 10" http://demo.openlinksw.com/sparql
```

``` programlisting
curl -F "query=SELECT distinct ?Concept FROM <http://openlinksw.com/dataspace/organization/openlink> WHERE {?s a ?Concept} limit 10" http://demo.openlinksw.com/sparql
```

</div>
