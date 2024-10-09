<div>

<div>

</div>

<div>

## Name

DB.DBA.RDF_DEFAULT_USER_PERMS_DEL — Removes the setting of default
permissions of user.

</div>

<div>

## Synopsis

<div>

|                                                |                                            |
|------------------------------------------------|--------------------------------------------|
| ` `**`DB.DBA.RDF_DEFAULT_USER_PERMS_DEL`**` (` | in `uname ` varchar ,                      |
|                                                | in `set_private ` integer (default 0) `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function removes the setting of default permissions of user named
uname. As the result, the default permission of "nobody" is used for the
specified user, the future changes in permissions of "nobody" will
change the access control for the user.

If set_private is true then the permission in question is the default
permission for "private" graphs otherwise it is for "world" graphs.

The function works for disabled or DAV users as well as for active SQL
users, so a user can be banned first and then restricted in RDF access
rights or visa versa. However the function will signal an error if it is
called for "nobody" or "dba" users. Default permissions for these two
users can be changed but can not deleted.

</div>

<div>

## Parameters

<div>

### uname

User name.

</div>

<div>

### set_private

(0\|1 default 0). If set_private is true then the permission in question
is the default permission for "private" graphs otherwise it is for
"world" graphs.

</div>

</div>

<div>

## Examples

<div>

**Example 24.257. Example**

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
