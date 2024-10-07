<div id="fn_http_nt_triple" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_nt_triple — outputs next triple to ses in NT serialization.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_nt_triple" class="funcsynopsis">

|                             |                    |
|-----------------------------|--------------------|
| ` `**`http_nt_triple`**` (` | in `env ` any ,    |
|                             | in `arg1 ` any ,   |
|                             | in `arg2 ` any ,   |
|                             | in `arg3 ` any ,   |
|                             | in `ses ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_nt_triple" class="refsect1">

## Description

Outputs next triple to ses in NT serialization.

</div>

<div id="params_http_nt_triple" class="refsect1">

## Parameters

<div id="id102861" class="refsect2">

### env

An array of special format:

``` programlisting
vector (0, 0, 0);
```

It is used solely as storage for intermediate data that should be freed
by the interpreter in case of any error.

</div>

<div id="id102866" class="refsect2">

### arg1

Triple subject.

</div>

<div id="id102869" class="refsect2">

### arg2

Triple predicate.

</div>

<div id="id102872" class="refsect2">

### arg3

Triple object.

</div>

<div id="id102875" class="refsect2">

### ses

Session output.

</div>

</div>

<div id="ret_http_nt_triple" class="refsect1">

## Return Types

Any

</div>

<div id="examples_http_nt_triple" class="refsect1">

## Examples

<div id="ex_http_nt_triple" class="example">

**Example 24.290. Simple Use**

<div class="example-contents">

``` programlisting
create procedure dump_rdftriples_to_nt(inout triples any, inout ses any)
{
  declare env any;
  declare tcount, tctr integer;
  tcount := length (triples);
  if (0 = tcount)
    {
      http ('# Empty NT\n', ses);
      return;
    }
  env := vector (0, 0, 0);
  for (tctr := 0; tctr < tcount; tctr := tctr + 1)
    {
      http_nt_triple (env, triples[tctr][0], triples[tctr][1], triples[tctr][2], ses);
    }
}
;
```

</div>

</div>

  

</div>

<div id="seealso_http_nt_triple" class="refsect1">

## See Also

<a href="fn_http_ttl_triple.html" class="link"
title="http_ttl_triple"><code
class="function">http_ttl_triple() </code></a>

<a href="fn_rdf_audit_metadata.html" class="link"
title="DB.DBA.RDF_AUDIT_METADATA"><code
class="function">DB.DBA.RDF_AUDIT_METADATA() </code></a>

<a href="fn_rdf_backup_metadata.html" class="link"
title="DB.DBA.RDF_BACKUP_METADATA"><code
class="function">DB.DBA.RDF_BACKUP_METADATA() </code></a>

<a href="fn_rdf_load_rdfxml.html" class="link"
title="DB.DBA.RDF_LOAD_RDFXML"><code
class="function">DB.DBA.RDF_LOAD_RDFXML() </code></a>

<a href="fn_rdf_load_rdfxml_mt.html" class="link"
title="DB.DBA.RDF_LOAD_RDFXML_MT"><code
class="function">DB.DBA.RDF_LOAD_RDFXML_MT() </code></a>

<a href="fn_ttlp_mt.html" class="link" title="DB.DBA.TTLP_MT"><code
class="function">TTLP_MT() </code></a>

<a href="fn_ttlp_mt_local_file.html" class="link"
title="DB.DBA.TTLP_MT_LOCAL_FILE"><code
class="function">TTLP_MT_LOCAL_FILE() </code></a>

</div>

</div>
