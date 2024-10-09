<div>

<div>

</div>

<div>

## Name

DB.DBA.RDF_GRAPH_USER_PERMS_DEL — Removes the setting of permissions of
an user named uname on a given graph.

</div>

<div>

## Synopsis

<div>

|                                              |                           |
|----------------------------------------------|---------------------------|
| ` `**`DB.DBA.RDF_GRAPH_USER_PERMS_DEL`**` (` | in `graph_iri ` varchar , |
|                                              | in `uname ` varchar `)`;  |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function removes the setting of permissions of user named uname on
graph specified by graph_iri. As the result, the permission of
"nobody",is used for the specified user, the future changes in
permissions of "nobody" will change the access control for the user on
the graph in question.

The function works for disabled or DAV users as well as for active SQL
users, so a user can be banned first and then restricted in RDF access
right or visa versa.

Unlike <a href="fn_rdf_default_user_perms_del.html" class="link"
title="DB.DBA.RDF_DEFAULT_USER_PERMS_DEL"><code
class="function">DB.DBA.RDF_DEFAULT_USER_PERMS_DEL</code></a> , the
procedure will not signal an error if called for "nobody" or "dba"
users.

</div>

<div>

## Parameters

<div>

### graph_iri

Graph IRI.

</div>

<div>

### uname

User name.

</div>

</div>

<div>

## Examples

<div>

**Example 24.278. Example**

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
