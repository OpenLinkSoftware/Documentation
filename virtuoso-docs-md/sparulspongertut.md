<div>

<div>

<div>

<div>

### 1.5.38. How can I use SPARUL to add missing triples to a Named Graph?

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### What?

</div>

</div>

</div>

Use of SPARUL to add missing triples to a Named Graph. For example, an
ontology/vocabulary extension.

</div>

<div>

<div>

<div>

<div>

#### Why?

</div>

</div>

</div>

A lot of ontologies and vocabularies started life prior to emergence of
the Linked Data meme. As a result, many do not include rdfs:isDefinedBy
relations (via triples) that associate Classes and Properties in an
ontology with the ontology itself, using de-referencable URIs. The
downside of this pattern is that Linked Data's follow-your-nose pattern
isn't exploitable when viewing these ontologies e.g., when using
contemporary Linked Data aware browsers.

</div>

<div>

<div>

<div>

<div>

#### How?

</div>

</div>

</div>

If SPARUL privileges are assigned to SPARQL or other accounts associated
with SPARQL Endpoint. Or via WebID? protected SPARQL endpoint with
SPARUL is granted to SPARQL or specific accounts or WebIDs in a group.

``` programlisting
INSERT INTO <LocalNamedGraphIRI>
  { ?s rdfs:DefinedBy <LocalOntologyEntityURI>.
    ?o rdfs:isDefinedBy <http://www.w3.org/ns/auth/acl>. }
FROM <ExtSourceNamedGraphIRI>
WHERE
  {
    ?s a ?o
  }
```

<div>

<div>

<div>

<div>

##### Example

</div>

</div>

</div>

<div>

1.  Load Quad Named Graph via Sponger based query:

    ``` programlisting
    DEFINE get:soft "replace"
    SELECT DISTINCT *
    FROM <http://www.w3.org/ns/auth/acl#>
    WHERE
      {
        ?s ?p ?o
      }
    ```

2.  Added Triples via SPARUL to Ontology Named Graph:

    ``` programlisting
    INSERT INTO <http://www.w3.org/ns/auth/acl#>
      {  ?s rdfs:DefinedBy <http://www.w3.org/ns/auth/acl>.
         ?o rdfs:DefinedBy <http://www.w3.org/ns/auth/acl>. }
    FROM <http://www.w3.org/ns/auth/acl#>
    WHERE
      {
        ?s a ?o
      }
    ```

3.  Via Conductor or Command-line iSQL courtesy of SPASQL execute the
    following statements:

    <div>

    1.  Remove an existing graph:

        ``` programlisting
        SPARQL
        CLEAR GRAPH <http://www.w3.org/ns/auth/acl/> ;

        SPARQL
        CLEAR GRAPH <http://www.w3.org/ns/auth/acl> ;

        SPARQL
        CLEAR GRAPH <http://www.w3.org/ns/auth/acl#> ;
        ```

    2.  Load a new graph:

        ``` programlisting
        SPARQL
        LOAD <http://www.w3.org/ns/auth/acl> ;
        ```

    3.  Add missing rdfs:isDefinedBy triples via SPARUL:

        ``` programlisting
        SPARQL
        INSERT INTO <http://www.w3.org/ns/auth/acl>
          {  ?s rdfs:DefinedBy <http://www.w3.org/ns/auth/acl>.
             ?o rdfs:DefinedBy <http://www.w3.org/ns/auth/acl>. }
        FROM <http://www.w3.org/ns/auth/acl>
        WHERE
          {
            ?s a ?o
          } ;
        ```

    </div>

4.  Verification: Access the following url:

    <span class="emphasis">*http://\<cname\>/describe/?uri=http://www.w3.org/ns/auth/acl\>*</span>

</div>

<div>

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p><a
href="rdfsparul.html" class="link"
title="16.3.2. SPARUL -- an Update Language For RDF Graphs">SPARUL -- an
Update Language For RDF Graphs</a></p>
<p><a
href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VirtSponger"
class="ulink" target="_top">Virtuoso Sponger</a> <a
href="rdfsparul.html" class="link"
title="16.3.2. SPARUL -- an Update Language For RDF Graphs">???</a></p></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>

</div>
