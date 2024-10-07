<div id="rdfrenamegraph" class="section">

<div class="titlepage">

<div>

<div>

### 16.17.8. Rename RDF Graph and RDF Graph Groups

</div>

</div>

</div>

A RDF Graph in the Virtuoso Quad Store can be renamed without copying
each assertion from the old graph to the new graph using a SQL
statement, this being what the Conductor "rename" option does, which is:

``` programlisting
UPDATE DB.DBA.RDF_QUAD TABLE OPTION (index RDF_QUAD_GS)
   SET g = iri_to_id ('new')
 WHERE g = iri_to_id ('old', 0);
```

<span class="emphasis">*Note:*</span> this operation must be run in
row-autocommit mode i.e. log_enable (3), and then restore back to the
default logging mode of 1.

For Virtuoso Graph Groups two tables need to be updated:

``` programlisting
UPDATE DB.DBA.RDF_GRAPH_GROUP_MEMBER
   SET RGGM_GROUP_IID = iri_to_id ('new')
 WHERE RGGM_GROUP_IID = iri_to_id (old)
```

and

``` programlisting
UPDATE DB.DBA.RDF_GRAPH_GROUP
   SET RGG_IID = iri_to_id ('new') , RGG_IRI = 'new'
 WHERE RGG_IRI = 'old'
```

</div>
