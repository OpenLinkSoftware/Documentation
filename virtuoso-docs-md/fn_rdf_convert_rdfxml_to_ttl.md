<div>

<div>

</div>

<div>

## Name

DB.DBA.RDF_CONVERT_RDFXML_TO_TTL — Converts rdf xml to ttl.

</div>

<div>

## Synopsis

<div>

|                                               |                           |
|-----------------------------------------------|---------------------------|
| ` `**`DB.DBA.RDF_CONVERT_RDFXML_TO_TTL`**` (` | in `strg ` varchar ,      |
|                                               | in `base ` varchar ,      |
|                                               | inout `ttl_ses ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Converts rdf xml to ttl.

</div>

<div>

## Parameters

<div>

### strg

text of the rdf resource

</div>

<div>

### base

base IRI to resolve relative IRIs to absolute

</div>

<div>

### ttl_ses

ttl resource

</div>

</div>

<div>

## Return Types

The return value is not specified and may be changed in future versions.

</div>

<div>

## Examples

<div>

**Example 24.273. Simple example**

<div>

``` screen
create procedure DB.DBA.RDF_XML_IRI_TO_TTL (inout obj any, inout ses any)
{
  declare res varchar;
  if (isiri_id (obj))
    {
      if (obj >= min_bnode_iri_id ())
        {
          if (obj >= #ib0)
            http (sprintf ('_:bb%d ', iri_id_num (obj) - iri_id_num (#ib0)), ses);
          else
            http (sprintf ('_:b%d ', iri_id_num (obj)), ses);
        }
      else
        {
          res := coalesce (id_to_iri (obj), sprintf ('_:bad_iid_%d', iri_id_num (obj)));
          http ('<', ses);
          http_escape (res, 12, ses, 1, 1);
          http ('> ', ses);
        }
    }
  else if (__tag of varchar = __tag (obj))
    {
      if ("LEFT" (obj, 9) = 'nodeID://')
        {
          http ('_:', ses);
          http (subseq (obj, 9), ses);
          http (' ', ses);
        }
      else
        {
          http ('<', ses);
          http_escape (obj, 12, ses, 1, 1);
          http ('> ', ses);
        }
    }
  else
    {
      http ('<', ses);
      http_escape (cast (obj as varchar), 12, ses, 1, 1);
      http ('> ', ses);
    }
}
;

create procedure DB.DBA.RDF_XML_OBJ_TO_TTL (
  inout o_val any, inout o_type varchar, inout o_lang varchar,
  inout ses any)
{
  declare res varchar;
  if (isiri_id (o_val))
    {
      if (o_val >= min_bnode_iri_id ())
        {
          if (o_val >= #ib0)
            http (sprintf ('_:bb%d ', iri_id_num (o_val) - iri_id_num (#ib0)), ses);
          else
            http (sprintf ('_:b%d ', iri_id_num (o_val)), ses);
        }
      else
        {
          res := coalesce (id_to_iri (o_val), sprintf ('_:bad_iid_%d', iri_id_num (o_val)));
          http ('<', ses);
          http_escape (res, 12, ses, 1, 1);
          http ('> ', ses);
        }
      return;
    }
  http ('"', ses);
  if (__tag of XML = o_val)
    http_escape (serialize_to_UTF8_xml (o_val), 11, ses, 1, 1);
  else
    http_escape (o_val, 11, ses, 1, 1);
  if (isstring (o_type))
    {
      http ('"^^<', ses);
      http_escape (o_type, 12, ses, 1, 1);
      http ('> ', ses);
    }
  else if (isstring (o_lang))
    {
      http ('"@', ses);
      http (o_lang, ses);
      http (' ', ses);
    }
  else
    http ('" ', ses);
}
;

create procedure DB.DBA.RDF_CONVERT_RDFXML_TO_TTL_EV_NEW_BLANK (inout g varchar, inout app_env any, inout res IRI_ID)
{
;
}
;

create procedure DB.DBA.RDF_CONVERT_RDFXML_TO_TTL_EV_TRIPLE (
  inout g_iid IRI_ID, inout s_uri varchar, inout p_uri varchar,
  inout o_uri varchar,
  inout app_env any )
{
  DB.DBA.RDF_XML_IRI_TO_TTL (s_uri, app_env);
  DB.DBA.RDF_XML_IRI_TO_TTL (p_uri, app_env);
  DB.DBA.RDF_XML_IRI_TO_TTL (o_uri, app_env);
  http ('.\n', app_env);
}
;

create procedure DB.DBA.RDF_CONVERT_RDFXML_TO_TTL_EV_TRIPLE_L (
  inout g_iid IRI_ID, inout s_uri varchar, inout p_uri varchar,
  inout o_val any, inout o_type varchar, inout o_lang varchar,
  inout app_env any )
{
  DB.DBA.RDF_XML_IRI_TO_TTL (s_uri, app_env);
  DB.DBA.RDF_XML_IRI_TO_TTL (p_uri, app_env);
  DB.DBA.RDF_XML_OBJ_TO_TTL (o_val, o_type, o_lang, app_env);
  http ('.\n', app_env);
}
;

create procedure DB.DBA.RDF_CONVERT_RDFXML_TO_TTL (in strg varchar, in base varchar, inout ttl_ses any)
{
  rdf_load_rdfxml (strg, 0,
    'http://example.com',
    vector (
      'DB.DBA.TTLP_EV_NEW_GRAPH',
      'DB.DBA.RDF_CONVERT_RDFXML_TO_TTL_EV_NEW_BLANK',
      'DB.DBA.TTLP_EV_GET_IID',
      'DB.DBA.RDF_CONVERT_RDFXML_TO_TTL_EV_TRIPLE',
      'DB.DBA.RDF_CONVERT_RDFXML_TO_TTL_EV_TRIPLE_L',
      '' ),
    ttl_ses,
    base );
}
;

create procedure DB.DBA.RDF_CONVERT_RDFXML_FILE_TO_TTL_FILE (in rdfxml_source_filename varchar, in base varchar, in ttl_target_filename varchar)
{
  declare in_ses, out_ses any;
  in_ses := file_to_string_output (rdfxml_source_filename);
  out_ses := string_output ();
  DB.DBA.RDF_CONVERT_RDFXML_TO_TTL (in_ses, base, out_ses);
  string_to_file (ttl_target_filename, out_ses, -2);
}
;

-- Sample call:
DB.DBA.RDF_CONVERT_RDFXML_FILE_TO_TTL_FILE ('open_source_projects.rdf', 'http://example.com', 'open_source_projects.ttl');
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

<a href="fn_ttlp.html" class="link" title="DB.DBA.TTLP"><code
class="function">DB.DBA.TTLP </code></a>

</div>

</div>
