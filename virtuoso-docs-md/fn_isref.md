<div>

<div>

</div>

<div>

## Name

IsRef — Returns true if non-blank IRI

</div>

<div>

## Synopsis

<div>

|                    |                    |
|--------------------|--------------------|
| ` `**`IsRef`**` (` | in `iri ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns true if non-blank IRI

</div>

<div>

## Parameters

<div>

### iri

IRI resource

</div>

</div>

<div>

## Return Types

Returns 1 if the IRI is non-blank IRI. Otherwise returns 0.

</div>

<div>

## Examples

<div>

**Example 24.285. Simple example**

<div>

``` programlisting
SQL>SPARQL
SELECT COUNT(DISTINCT (?o))
WHERE
  {
    ?s ?p ?o .
    FILTER ( IsRef(?o))
  }
LIMIT 10

callret-0
76027
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_rdf_audit_metadata.html" class="link"
title="DB.DBA.RDF_AUDIT_METADATA"><code
class="function">DB.DBA.RDF_AUDIT_METADATA </code></a>

<a href="fn_rdf_backup_metadata.html" class="link"
title="DB.DBA.RDF_BACKUP_METADATA"><code
class="function">DB.DBA.RDF_BACKUP_METADATA </code></a>

<a href="fn_rdf_load_rdfxml.html" class="link"
title="DB.DBA.RDF_LOAD_RDFXML"><code
class="function">DB.DBA.RDF_LOAD_RDFXML </code></a>

<a href="fn_rdf_load_rdfxml_mt.html" class="link"
title="DB.DBA.RDF_LOAD_RDFXML_MT"><code
class="function">DB.DBA.RDF_LOAD_RDFXML_MT </code></a>

</div>

</div>
