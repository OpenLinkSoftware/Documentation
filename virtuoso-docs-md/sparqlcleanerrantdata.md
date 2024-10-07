<div id="sparqlcleanerrantdata" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.61. How Do I Clean Up Errant Data using SPARQL Update Language?

</div>

</div>

</div>

<div id="sparqlcleanerrantdatawhat" class="section">

<div class="titlepage">

<div>

<div>

#### What?

</div>

</div>

</div>

Cleaning up errant data using SPARQL Update Language.

</div>

<div id="sparqlcleanerrantdatawhy" class="section">

<div class="titlepage">

<div>

<div>

#### Why?

</div>

</div>

</div>

All data endeavors involve varying degrees of prospective and
retrospective error correction.

</div>

<div id="sparqlcleanerrantdatahow" class="section">

<div class="titlepage">

<div>

<div>

#### How?

</div>

</div>

</div>

Given a triple in a Virtuoso Quad store that contains an errant URI e.g.
one that accidentally contains spaces, here is a SPARQL example that
showcases how to delete said triple using a built-in function:

``` programlisting
DELETE FROM <your_graph>
  {
    `iri("http://isbsg.clearbluewater.com.au/wsf/datasets/378/Capers Jones_107_12122011081257")`
     a <http://isbsg.org/ontology/data/Dataset>
  };
```

</div>

</div>
