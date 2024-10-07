<div id="virtuosotipsandtricksquadstorageinternally" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.7. How can I see which quad storages exist and in which quad storage a graph resides?

</div>

</div>

</div>

Let's take for example a <a
href="http://virtuoso.openlinksw.com/whitepapers/relational%20rdf%20views%20mapping.html"
class="ulink" target="_top">created Linked Data View from relational
data in Virtuoso</a> . The RDF output therefor should have two graphs
which reside in a quad storage named for ex.:

``` programlisting
http://example.com/rdfv_demo/quad_storage/default
```

Also the RDF is accessible over the SPARQL endpoint with the following
query:

``` programlisting
define input:storage <http://example.com/rdfv_demo/quad_storage/default>
SELECT *
WHERE
  {
    ?s ?p ?o
  }
```

Now one could ask is there a way to define internally (once) that the
quad storage should be included in queries to the SPARQL endpoint? So
that the user does not have to define the
<span class="emphasis">*input:storage*</span> explicitly in each query,
like this:

``` programlisting
http://example.com/sparql?query=select * where { ?s ?p ?o }&default-graph-uri=NULL&named-graph-uri=NULL
```

All metadata about all RDF storages are kept in "system" graph
\<http://www.openlinksw.com/schemas/virtrdf#\> ( namespace prefix
<span class="emphasis">*virtrdf:*</span> ). Subjects of type
<span class="emphasis">*virtrdf:QuadStorage*</span> are RDF storages.
There are three of them by default:

``` programlisting
SQL> SPARQL SELECT * FROM virtrdf: WHERE { ?s a virtrdf:QuadStorage };
s
VARCHAR
_______________________________________________________________________________

http://www.openlinksw.com/schemas/virtrdf#DefaultQuadStorage
http://www.openlinksw.com/schemas/virtrdf#DefaultServiceStorage
http://www.openlinksw.com/schemas/virtrdf#SyncToQuads

3 Rows. -- 3 msec.
```

<div class="itemizedlist">

- <span class="emphasis">*virtrdf:DefaultQuadStorage*</span>

  is what's in use if no input:storage specified.

- <span class="emphasis">*virtrdf:DefaultServiceStorage*</span>

  will be used for SPARQL federation.

- <span class="emphasis">*virtrdf:SyncToQuads*</span>

  is to keep the list of Linked Data Views that are translated into
  RDB2RDF triggers.

</div>

There are two ways of using the Linked Data View from above in SPARQL
endpoint without <span class="emphasis">*define input:storage*</span> :

<div class="orderedlist">

1.  Create Linked Data View right in

    <span class="emphasis">*virtrdf:DefaultQuadStorage*</span>

    or add the view in other storage and then copy it from there to

    <span class="emphasis">*virtrdf:DefaultQuadStorage*</span>

    .

    <div class="itemizedlist">

    - In any of these two variants, use:

      ``` programlisting
      SPARQL ALTER QUAD STORAGE virtrdf:DefaultQuadStorage . . .
      ```

    </div>

2.  Use

    <span class="emphasis">*SYS_SPARQL_HOST*</span>

    table as described <a href="rdfdefaultgraph.html" class="link"
    title="16.2.8. Default and Named Graphs">here</a> and set

    <span class="emphasis">*SH_DEFINES*</span>

    so it contains your favorite

    <span class="emphasis">*define input:storage*</span>

    .

</div>

</div>
