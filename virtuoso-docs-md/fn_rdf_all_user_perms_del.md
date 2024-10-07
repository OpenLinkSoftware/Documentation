<div id="fn_rdf_all_user_perms_del" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.RDF_ALL_USER_PERMS_DEL — Removes all the setting of permissions
of an user, both default permissions and permissions on specific graphs.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_all_user_perms_del" class="funcsynopsis">

|                                            |                                |
|--------------------------------------------|--------------------------------|
| ` `**`DB.DBA.RDF_ALL_USER_PERMS_DEL`**` (` | in `uname ` varchar ,          |
|                                            | in `uid ` integer := null `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_all_user_perms_del" class="refsect1">

## Description

This function removes all the setting of permissions of user named
uname, both default permissions and permissions on specific graphs. The
only exception is that it does not remove default permissions if the
specified user is "nobody" or "dba", but all graph-specific permissions
are always removed.

The procedure can deal with disabled users. Moreover it can be used with
entirely deleted users as soon as user id is known. It is possible to
pass NULL instead of user name and an integer user ID as a second
argument.

</div>

<div id="params_rdf_all_user_perms_del" class="refsect1">

## Parameters

<div id="id101841" class="refsect2">

### uname

User name

</div>

<div id="id101844" class="refsect2">

### uid

The user U_ID in the system table DB.DBA.SYS_USERS.

</div>

</div>

<div id="examples_rdf_all_user_perms_del" class="refsect1">

## Examples

<div id="ex_rdf_all_user_perms_del" class="example">

**Example 24.279. Example**

<div class="example-contents">

See <a href="rdfgraphsecurityintconfsec.html#rdfgraphsecurityintex"
class="link" title="Example: Blogs and Resource Sharing">Example for
Blogs and Resource Sharing</a>

</div>

</div>

  

</div>

<div id="seealso_rdf_all_user_perms_del" class="refsect1">

## See Also

`DB.DBA.RDF_AUDIT_METADATA `

<a href="fn_rdf_graph_security_audit.html" class="link"
title="DB.DBA.RDF_GRAPH_SECURITY_AUDIT"><code
class="function">DB.DBA.RDF_GRAPH_SECURITY_AUDIT </code></a>

<a href="fn_rdf_default_user_perms_set.html" class="link"
title="DB.DBA.RDF_DEFAULT_USER_PERMS_SET"><code
class="function">DB.DBA.RDF_DEFAULT_USER_PERMS_SET </code></a>

<a href="fn_rdf_default_user_perms_del.html" class="link"
title="DB.DBA.RDF_DEFAULT_USER_PERMS_DEL"><code
class="function">DB.DBA.RDF_DEFAULT_USER_PERMS_DEL </code></a>

<a href="fn_rdf_graph_user_perms_set.html" class="link"
title="DB.DBA.RDF_GRAPH_USER_PERMS_SET"><code
class="function">DB.DBA.RDF_GRAPH_USER_PERMS_SET </code></a>

<a href="fn_rdf_graph_user_perms_del.html" class="link"
title="DB.DBA.RDF_GRAPH_USER_PERMS_DEL"><code
class="function">DB.DBA.RDF_GRAPH_USER_PERMS_DEL </code></a>

<a href="fn_rdf_graph_group_create.html" class="link"
title="DB.DBA.RDF_GRAPH_GROUP_CREATE"><code
class="function">DB.DBA.RDF_GRAPH_GROUP_CREATE </code></a>

<a href="fn_rdf_graph_group_ins.html" class="link"
title="DB.DBA.RDF_GRAPH_GROUP_INS"><code
class="function">DB.DBA.RDF_GRAPH_GROUP_INS </code></a>

</div>

</div>
