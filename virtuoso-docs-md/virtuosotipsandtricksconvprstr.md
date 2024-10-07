<div id="virtuosotipsandtricksconvprstr" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.14. How do I use SPARUL to change a selection of property values from URI References to Literals?

</div>

</div>

</div>

Assume a given graph where triples are comprised of property values that
are mixed across URI References and Typed Literals as exemplified by the
results of the query below:

``` programlisting
SELECT DISTINCT ?sa ?oa
FROM <http://ucb.com/nbeabase>
WHERE
  {
    ?sa a <http://ucb.com/nbeabase/resource/Batch> .
    ?sa <http://ucb.com/nbeabase/resource/chemAbsNo> ?oa . FILTER regex(?oa, '-','i')
  }
```

You can use the following SPARUL pattern to harmonize the property
values across relevant triples in a specific graph, as shown below:

``` programlisting
SQL> SPARQL
INSERT INTO GRAPH <http://ucb.com/nbeabase>
  {
    ?sa <http://ucb.com/nbeabase/resource/sampleId> `str (?oa)`
  }
WHERE
  {
    ?sa <http://ucb.com/nbeabase/resource/chemAbsNo> ?oa . FILTER regex(?oa, '-','i')
  }
```

</div>
