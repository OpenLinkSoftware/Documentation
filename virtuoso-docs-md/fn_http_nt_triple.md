<div>

<div>

</div>

<div>

## Name

http_nt_triple — outputs next triple to ses in NT serialization.

</div>

<div>

## Synopsis

<div>

|                             |                    |
|-----------------------------|--------------------|
| ` `**`http_nt_triple`**` (` | in `env ` any ,    |
|                             | in `arg1 ` any ,   |
|                             | in `arg2 ` any ,   |
|                             | in `arg3 ` any ,   |
|                             | in `ses ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Outputs next triple to ses in NT serialization.

</div>

<div>

## Parameters

<div>

### env

An array of special format:

``` programlisting
vector (0, 0, 0);
```

It is used solely as storage for intermediate data that should be freed
by the interpreter in case of any error.

</div>

<div>

### arg1

Triple subject.

</div>

<div>

### arg2

Triple predicate.

</div>

<div>

### arg3

Triple object.

</div>

<div>

### ses

Session output.

</div>

</div>

<div>

## Return Types

Any

</div>

<div>

## Examples

<div>

**Example 24.290. Simple Use**

<div>

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

<div>

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
