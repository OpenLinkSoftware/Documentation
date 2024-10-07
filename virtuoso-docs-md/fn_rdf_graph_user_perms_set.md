<div id="fn_rdf_graph_user_perms_set" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.RDF_GRAPH_USER_PERMS_SET — Sets permissions of an the user on a
graph.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_graph_user_perms_set" class="funcsynopsis">

|                                              |                           |
|----------------------------------------------|---------------------------|
| ` `**`DB.DBA.RDF_GRAPH_USER_PERMS_SET`**` (` | in `graph_iri ` varchar , |
|                                              | in `uname ` varchar ,     |
|                                              | in `perms ` integer `)`;  |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_graph_user_perms_set" class="refsect1">

## Description

sets permissions of the user named uname on graph specified by graph_iri
to the value specified by perms.

</div>

<div id="params_rdf_graph_user_perms_set" class="refsect1">

## Parameters

<div id="id101620" class="refsect2">

### graph_iri

Graph IRI.

</div>

<div id="id101623" class="refsect2">

### uname

User name.

</div>

<div id="id101626" class="refsect2">

### perms

If perms is null then the function acts as
<a href="fn_rdf_graph_user_perms_del.html" class="link"
title="DB.DBA.RDF_GRAPH_USER_PERMS_DEL"><code
class="function">DB.DBA.RDF_GRAPH_USER_PERMS_DEL (graph_iri, uname); </code></a>

If perms is not null (hence an integer) then the specified user should
be an active SQL user or "nobody".

Four sorts of access are specified by four bits of an integer
"permission bit-mask", plain old UNIX style:

<div class="itemizedlist">

- Bit 1 permits read access.

- Bit 2 permits write access via SPARUL and it's basically useless
  without bit 1 set.

- Bit 4 permits write access via "RDF sponge" methods and it's basically
  useless without bits 1 and 2 set.

- Bit 8 allows to obtain list of members of graph group; an IRI can be
  used as graph IRI and as graph group IRI at the same time so bit 8 can
  be freely combined with any of bits 1, 2 or 4.

</div>

For more details see our documentation section
<a href="rdfgraphsecurityunddefperm.html" class="link"
title="16.4.5. Understanding Default Permissions">"Understanding Default
Permissions"</a>

</div>

</div>

<div id="examples_rdf_graph_user_perms_set" class="refsect1">

## Examples

<div id="ex_rdf_graph_user_perms_set" class="example">

**Example 24.276. Example**

<div class="example-contents">

See <a href="rdfgraphsecurityintconfsec.html#rdfgraphsecurityintex"
class="link" title="Example: Blogs and Resource Sharing">Example for
Blogs and Resource Sharing</a>

</div>

</div>

  

</div>

<div id="seealso_rdf_graph_user_perms_set" class="refsect1">

## See Also

`DB.DBA.RDF_AUDIT_METADATA `

<a href="fn_rdf_graph_user_perms_get.html" class="link"
title="DB.DBA.RDF_GRAPH_USER_PERMS_GET"><code
class="function">DB.DBA.RDF_GRAPH_USER_PERMS_GET </code></a>

<a href="fn_rdf_graph_security_audit.html" class="link"
title="DB.DBA.RDF_GRAPH_SECURITY_AUDIT"><code
class="function">DB.DBA.RDF_GRAPH_SECURITY_AUDIT </code></a>

<a href="fn_rdf_default_user_perms_set.html" class="link"
title="DB.DBA.RDF_DEFAULT_USER_PERMS_SET"><code
class="function">DB.DBA.RDF_DEFAULT_USER_PERMS_SET </code></a>

<a href="fn_rdf_default_user_perms_del.html" class="link"
title="DB.DBA.RDF_DEFAULT_USER_PERMS_DEL"><code
class="function">DB.DBA.RDF_DEFAULT_USER_PERMS_DEL </code></a>

<a href="fn_rdf_graph_user_perms_del.html" class="link"
title="DB.DBA.RDF_GRAPH_USER_PERMS_DEL"><code
class="function">DB.DBA.RDF_GRAPH_USER_PERMS_DEL </code></a>

<a href="fn_rdf_all_user_perms_del.html" class="link"
title="DB.DBA.RDF_ALL_USER_PERMS_DEL"><code
class="function">DB.DBA.RDF_ALL_USER_PERMS_DEL </code></a>

<a href="fn_rdf_graph_group_create.html" class="link"
title="DB.DBA.RDF_GRAPH_GROUP_CREATE"><code
class="function">DB.DBA.RDF_GRAPH_GROUP_CREATE </code></a>

<a href="fn_rdf_graph_group_ins.html" class="link"
title="DB.DBA.RDF_GRAPH_GROUP_INS"><code
class="function">DB.DBA.RDF_GRAPH_GROUP_INS </code></a>

</div>

</div>
