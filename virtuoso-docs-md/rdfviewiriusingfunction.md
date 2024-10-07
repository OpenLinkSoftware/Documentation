<div id="rdfviewiriusingfunction" class="section">

<div class="titlepage">

<div>

<div>

### 16.5.7. Function-Based IRI Classes

</div>

</div>

</div>

Most of IRI classes can be declared by a sprintf format string, but
sophisticated cases may require calculations, not only printing the
string. <span class="emphasis">*create IRI class using function*</span>
allows the application transform relational values to IRIs by any custom
routines.

Let us extend the previous example about users and groups by a new class
for grantees. Both users and groups are grantees and we have defined two
IRI classes for them. Classes
<span class="emphasis">*oplsioc:user_iri*</span> and
<span class="emphasis">*oplsioc:group_iri*</span> work fine for quad
maps of <span class="emphasis">*U_ID*</span> if and only if the value of
<span class="emphasis">*U_IS_ROLE*</span> is accordingly restricted to
FALSE or TRUE, otherwise one may occasionally generate, say, user IRI
for a group. To create and parse IRIs that correspond to any U_IDs, two
functions should be created:

``` programlisting
create function DB.DBA.GRANTEE_URI (in id integer)
returns varchar
{
  declare isrole integer;
  isrole := coalesce ((SELECT top 1 U_IS_ROLE
      FROM DB.DBA.SYS_USERS WHERE U_ID = id ) );
  if (isrole is null)
    return NULL;
  else if (isrole)
    return sprintf ('http://%s/sys/group?id=%d', id);
  else
    return sprintf ('http://%s/sys/user?id=%d', id);
};
```

``` programlisting
create function DB.DBA.GRANTEE_URI_INVERSE (in id_iri varchar)
returns integer
{
  declare parts any;
  parts := sprintf_inverse (id_iri,
      'http://myhost/sys/user?id=%d', 1 );
  if (parts is not null)
    {
      if (exists (SELECT top 1 1 FROM DB.DBA.SYS_USERS
          WHERE U_ID = parts[0] and not U_IS_ROLE ) )
        return parts[0];
    }
  parts := sprintf_inverse (id_iri,
      'http://myhost/sys/group?id=%d', 1 );
  if (parts is not null)
    {
      if (exists (SELECT top 1 1 FROM DB.DBA.SYS_USERS
          WHERE U_ID = parts[0] and U_IS_ROLE ) )
        return parts[0];
    }
  return NULL;
};
```

These functions may be more useful if the SPARQL web service endpoint is
allowed to use them:

``` programlisting
grant execute on DB.DBA.GRANTEE_URI to "SPARQL";
grant execute on DB.DBA.GRANTEE_URI_INVERSE to "SPARQL";
```

The next declaration creates an IRI class based on these two functions:

``` programlisting
create iri class oplsioc:grantee_iri using
  function DB.DBA.GRANTEE_URI (in id integer)
    returns varchar,
  function DB.DBA.GRANTEE_URI_INVERSE (in id_iri varchar)
    returns integer .
```

In common case, IRI class declaration contains an N-array function that
composes IRIs and N inverse functions that gets an IRI as an argument
and extracts the Nth SQL value. IRI composing function should silently
return NULL on incorrect arguments instead of error signal. Inverse
functions should return NULL if the argument has an incorrect type or
value.

It is possible to specify only composing function without any of inverse
functions. However <span class="emphasis">*option (bijection)*</span>
can not be used in that case, obviously.

</div>
