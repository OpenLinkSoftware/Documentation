<div>

<div>

<div>

<div>

### 16.4.7. Application Callbacks for Graph Level Security

</div>

</div>

</div>

In some cases, different applications should provide different security
for different users. Two SPARQL pragmas are provided for this purpose:

<div>

- Pragma sql:gs-app-callback is to specify Virtuoso/PL callback function
  that return permission bits for given graph.

- Pragma sql:gs-app-uid is to specify application-specific user ID that
  is some string that is passed to the callback "as is".

</div>

The name of callback is always DB.DBA.SPARQL_GS_APP_CALLBACK_nnn, where
nnn is value of sql:gs-app-callback.

The callback is called only if the application has access to the graph
in question so it may restrict the caller's account but not grant more
permissions.

<div>

<div>

<div>

<div>

#### Example

</div>

</div>

</div>

Let user of application get full access to graphs whose IRIs contain
user's name in path. In addition, let all of them permission to use all
graph groups and let the "moderator" user read everything.

``` programlisting
reconnect "dba";

create function DB.DBA.SPARQL_GS_APP_CALLBACK_TEST (in g_iid IRI_ID, in app_uid varchar) returns integer
{
  declare g_uri varchar;
-- A fake IRI ID #i0 is used to mention account's default permissions for all graphs.
  if (#i0 = g_iid)
    {
      if ('moderator' = app_uid)
        return 9; -- Moderator can read and list everything.
      return 8; -- Other users can list everything.
    }
  g_uri := id_to_iri (g_iid);
  if (strstr (g_uri, '/' || app_uid || '/'))
    return 15; -- User has full access to "his" graph.
  return 8; -- User can list any given graph group.
}
;

SPARQL
define sql:gs-app-callback "TEST"
define sql:gs-app-uid "Anna"
SELECT ?g ?s WHERE { ?s <p> ?o }
;
```

</div>

</div>
