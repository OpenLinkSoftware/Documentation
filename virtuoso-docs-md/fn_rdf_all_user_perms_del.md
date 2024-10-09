<div>

<div>

</div>

<div>

## Name

DB.DBA.RDF_ALL_USER_PERMS_DEL — Removes all the setting of permissions
of an user, both default permissions and permissions on specific graphs.

</div>

<div>

## Synopsis

<div>

|                                            |                                |
|--------------------------------------------|--------------------------------|
| ` `**`DB.DBA.RDF_ALL_USER_PERMS_DEL`**` (` | in `uname ` varchar ,          |
|                                            | in `uid ` integer := null `)`; |

<div>

 

</div>

</div>

</div>

<div>

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

<div>

## Parameters

<div>

### uname

User name

</div>

<div>

### uid

The user U_ID in the system table DB.DBA.SYS_USERS.

</div>

</div>

<div>

## Examples

<div>

**Example 24.279. Example**

<div>

See <a href="rdfgraphsecurityintconfsec.html#rdfgraphsecurityintex"
class="link" title="Example: Blogs and Resource Sharing">Example for
Blogs and Resource Sharing</a>

</div>

</div>

  

</div>

<div>

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
