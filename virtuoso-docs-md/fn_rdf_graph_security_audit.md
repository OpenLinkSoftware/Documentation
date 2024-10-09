<div>

<div>

</div>

<div>

## Name

DB.DBA.RDF_GRAPH_SECURITY_AUDIT — Fix graph-level security errors.

</div>

<div>

## Synopsis

<div>

|                                              |                             |
|----------------------------------------------|-----------------------------|
| ` `**`DB.DBA.RDF_GRAPH_SECURITY_AUDIT`**` (` | in `recovery ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function can detect and automatically fix many sorts of errors in
the configuration of the graph-level security.

</div>

<div>

## Parameters

<div>

### recovery

(0\|1 default 0) - 0 = read-only diagnostics ; 1 = diagnostics
+recovery, and makes a result-set of messages (such as found errors).
The result set consists of 6 columns:

<div>

1.  <span class="emphasis">*SEVERITY*</span> -- empty string for
    information messages, 'WARNING', 'ERROR' or 'FATAL' for found
    problems.

2.  <span class="emphasis">*GRAPH_IID*</span> -- IRI_ID of a graph or
    graph group in question, NULL if not applicable.

3.  <span class="emphasis">*GRAPH_IRI*</span> -- IRI string of a graph
    or graph group in question, NULL if not applicable OR if GRAPH_IID
    does not correspond to any IRI. If GRAPH_IID is NULL or GRAPH_IID is
    \#i0 (the value reserved for 'world graphs') or GRAPH_IID is \#i8192
    (the value reserved for 'private graphs') then GRAPH_IRI is expected
    to be NULL, otherwise NULL value here indicates some inconsistency.

4.  <span class="emphasis">*USER_ID*</span> -- The numeric identifier of
    user in question, the value from U_ID column of DB.DBA.SYS_USERS.

5.  <span class="emphasis">*USER_NAME*</span> -- The string identifier
    of user in question, the value from U_NAME column of
    DB.DBA.SYS_USERS. If USER_ID is not a NULL but USER_NAME is NULL
    then the graph-level security data refer to a user that no longer
    exists so they are most probably "garbage" (or the actual problem is
    that the user is erroneously deleted).

6.  <span class="emphasis">*MESSAGE* </span> -- plain text of the
    message

</div>

</div>

</div>

<div>

## Examples

<div>

**Example 24.255. Simple example**

<div>

Automatically fix the corrupted metadata:

``` programlisting
SQL> DB.DBA.RDF_GRAPH_SECURITY_AUDIT(1);
SEVERITY  GRAPH_IID     GRAPH_IRI  USER_ID     USER_NAME  MESSAGE
VARCHAR  VARCHAR       VARCHAR  INTEGER     VARCHAR  VARCHAR
_______________________________________________________________________________

         NULL          NULL     NULL        NULL     Inspecting caches of IRI_IDs of IRIs mentioned in security data...
         NULL          NULL     NULL        NULL     Inspecting completeness of IRI cache for graph groups...
         NULL          NULL     NULL        NULL     Inspecting completeness of IRI cache for graph group members...
         NULL          NULL     NULL        NULL     Check for mismatches between graph group IRIs and graph group IRI_IDs...
         NULL          NULL     NULL        NULL     Inspecting caching of list of private graphs...
         NULL          NULL     NULL        NULL     Inspecting permissions of users...
         NULL          NULL     NULL        NULL     No errors found in RDF security

7 Rows. -- 16 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

`DB.DBA.RDF_AUDIT_METADATA `

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
