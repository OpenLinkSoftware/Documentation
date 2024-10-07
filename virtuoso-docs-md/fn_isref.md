<div id="fn_isref" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

IsRef — Returns true if non-blank IRI

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_isref" class="funcsynopsis">

|                    |                    |
|--------------------|--------------------|
| ` `**`IsRef`**` (` | in `iri ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_isref" class="refsect1">

## Description

Returns true if non-blank IRI

</div>

<div id="params_isref" class="refsect1">

## Parameters

<div id="id102608" class="refsect2">

### iri

IRI resource

</div>

</div>

<div id="ret_isref" class="refsect1">

## Return Types

Returns 1 if the IRI is non-blank IRI. Otherwise returns 0.

</div>

<div id="examples_isref" class="refsect1">

## Examples

<div id="ex_isref" class="example">

**Example 24.285. Simple example**

<div class="example-contents">

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

<div id="seealso_isref" class="refsect1">

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
