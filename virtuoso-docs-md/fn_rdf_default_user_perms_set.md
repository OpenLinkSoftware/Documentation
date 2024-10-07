<div id="fn_rdf_default_user_perms_set" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.RDF_DEFAULT_USER_PERMS_SET — Sets default permissions of user.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_default_user_perms_set" class="funcsynopsis">

|                                                |                                            |
|------------------------------------------------|--------------------------------------------|
| ` `**`DB.DBA.RDF_DEFAULT_USER_PERMS_SET`**` (` | in `uname ` varchar ,                      |
|                                                | in `perms ` integer ,                      |
|                                                | in `set_private ` integer (default 0) `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_default_user_perms_set" class="refsect1">

## Description

This function sets default permissions of user named uname to the value
specified by perms.

</div>

<div id="params_rdf_default_user_perms_set" class="refsect1">

## Parameters

<div id="id100259" class="refsect2">

### uname

User name.

</div>

<div id="id100262" class="refsect2">

### perms

If perms is null, then the procedure acts as
<a href="fn_rdf_default_user_perms_del.html" class="link"
title="DB.DBA.RDF_DEFAULT_USER_PERMS_DEL"><code
class="function">DB.DBA.RDF_DEFAULT_USER_PERMS_DEL (uname, set_private)</code></a>
;

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

<div id="id100280" class="refsect2">

### set_private

(0\|1 default 0). If set_private is true then the permission is set as
default for "private" graphs otherwise it is set for "world" graphs.

</div>

</div>

<div id="examples_rdf_default_user_perms_set" class="refsect1">

## Examples

<div id="ex_rdf_default_user_perms_set" class="example">

**Example 24.256. Example**

<div class="example-contents">

``` programlisting
-- Set 'demo' user/role to have no access to private graphs:
DB.DBA.RDF_DEFAULT_USER_PERMS_SET ('demo', 0, 1); 
-- Set 'demo' user/role ability to read, update, sponge other graphs, assuming bit_or (1,2,4) = 7 : 
DB.DBA.RDF_DEFAULT_USER_PERMS_SET ('demo', 7, 0);   
```

See also <a href="rdfgraphsecurityintconfsec.html#rdfgraphsecurityintex"
class="link" title="Example: Blogs and Resource Sharing">Example for
Blogs and Resource Sharing</a>

</div>

</div>

  

</div>

<div id="seealso_rdf_default_user_perms_set" class="refsect1">

## See Also

`DB.DBA.RDF_AUDIT_METADATA `

<a href="fn_rdf_graph_security_audit.html" class="link"
title="DB.DBA.RDF_GRAPH_SECURITY_AUDIT"><code
class="function">DB.DBA.RDF_GRAPH_SECURITY_AUDIT </code></a>

<a href="fn_rdf_default_user_perms_del.html" class="link"
title="DB.DBA.RDF_DEFAULT_USER_PERMS_DEL"><code
class="function">DB.DBA.RDF_DEFAULT_USER_PERMS_DEL </code></a>

<a href="fn_rdf_graph_user_perms_set.html" class="link"
title="DB.DBA.RDF_GRAPH_USER_PERMS_SET"><code
class="function">DB.DBA.RDF_GRAPH_USER_PERMS_SET </code></a>

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
