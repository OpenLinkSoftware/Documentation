<div id="fn_ldap_add" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

ldap_add — Adds a new entry to an LDAP directory.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_ldap_add" class="funcsynopsis">

|                          |                             |
|--------------------------|-----------------------------|
| `int `**`ldap_add`**` (` | in `server_url ` varchar ,  |
|                          | in `try_tls ` integer ,     |
|                          | in `data ` varchar ,        |
|                          | in `username ` varchar ,    |
|                          | in `password ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_ldap_add" class="refsect1">

## Description

This function adds a new entry to the LDAP directory.

</div>

<div id="params_ldap_add" class="refsect1">

## Parameters

<div id="id95335" class="refsect2">

### server_url

The server URL has three parts, \<protocol\>://\<host\>:\<port\>.
Missing parameters will be defaulted to:

``` programlisting
<ldap://localhost:389>
```

.

</div>

<div id="id95339" class="refsect2">

### try_tls

*`try_tls `* is a flag that tells the client to perform a handshake with
the LDAP server using a secure connection. This is only applicable to
the ldap:// protocol and not ldaps://. If the secure connection attempt
fails, the client will fall back to insecure connect.

</div>

<div id="id95343" class="refsect2">

### data

*`data `* is an array with name/value pairs representing the data to be
added.

</div>

<div id="id95347" class="refsect2">

### username

username authorization credential

</div>

<div id="id95350" class="refsect2">

### password

password authorization credential

</div>

</div>

<div id="ret_ldap_add" class="refsect1">

## Return Types

The error status code is returned. Zero for success.

</div>

<div id="errors_ldap_add" class="refsect1">

## Errors

<div id="id95358" class="table">

**Table 24.49. Errors signalled by `ldap_add `**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                               | Description |
|---------------------------------------|---------------------------------------|----------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">2E000 </span> | <span class="errorcode">LD005 </span> | <span class="errortext">Failed to initialize LDAP connection: \<reason\> (\<reason code\>) </span>       |             |
| <span class="errorcode">2E000 </span> | <span class="errorcode">LD006 </span> | <span class="errortext">Failed to set LDAP version option: \<reason\> (\<reason code\>) </span>          |             |
| <span class="errorcode">2E000 </span> | <span class="errorcode">LD016 </span> | <span class="errortext">Failed to start TLS: \<reason\> (\<reason code\>) </span>                        |             |
| <span class="errorcode">28000 </span> | <span class="errorcode">LD007 </span> | <span class="errortext">Failed to bind synchronous LDAP connection: \<reason\> (\<reason code\>) </span> |             |
| <span class="errorcode">2E000 </span> | <span class="errorcode">LD004 </span> | <span class="errortext">The DN must be supplied </span>                                                  |             |
| <span class="errorcode">2E000 </span> | <span class="errorcode">LD004 </span> | <span class="errortext">Failed to modify err=\<reason code (\<reason\>) </span>                          |             |

</div>

</div>

  

</div>

<div id="examples_ldap_add" class="refsect1">

## Examples

<div id="ex_ldap_add" class="example">

**Example 24.203. Using ldap_add**

<div class="example-contents">

``` programlisting
create procedure
sam_ldap_add (in s1 varchar, in s2 varchar)
{
  declare res, vec any;
  declare _from_add integer;

  vec := vector ('dn', concat ('cn=', s1, ' ', s2, ',o=opl,c=BG'),
         'cn', vector (concat (s1, ' ', s2)),
         'mail', vector('mail@techno-link.com'),
         'sn', vector(s2), 'telephoneNumber', vector('032-947020', '032-633710', '048 850 760'),
         'objectClass', vector('inetorgperson' ));

  _from_add := ldap_add ('ldap://buba:389', 0, vec, NULL);

  return (_from_add);
};
```

</div>

</div>

  

</div>

<div id="seealso_ldap_add" class="refsect1">

## See Also

<a href="fn_ldap_delete.html" class="link" title="ldap_delete"><code
class="function">ldap_delete() </code></a> ,
<a href="fn_ldap_modify.html" class="link" title="ldap_modify"><code
class="function">ldap_modify()</code></a> ,
<a href="fn_ldap_search.html" class="link" title="ldap_search"><code
class="function">ldap_search()</code></a>

</div>

</div>
