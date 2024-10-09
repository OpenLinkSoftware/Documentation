<div>

<div>

<div>

<div>

### 1.5.55. How Can I Delete a Specific Triple Across Graphs?

</div>

</div>

</div>

Suppose the following situation:

<div>

- There is a specific triple somewhere in a massive dataset in a
  Virtuoso DBMS.

- There are too many possible named graphs associated with the pattern
  so

  <span class="emphasis">*SPARQL DELETE*</span>

  (which requires

  <span class="emphasis">*FROM*</span>

  i.e., Named Graph scoping) isn't adequate

</div>

What is the solution?

Using SQL you can execute the following:

``` programlisting
SQL> SPARQL
DELETE FROM rdf_quad
WHERE s = iri_to_id ('http://linkeddata.uriburner.com/about/id/entity/http/twitter.com/kidehen')
  AND o = iri_to_id ('http://purl.org/ontology/bibo/Document')
  AND p = iri_to_id ('http://www.w3.org/1999/02/22-rdf-syntax-ns#type');
```

</div>
