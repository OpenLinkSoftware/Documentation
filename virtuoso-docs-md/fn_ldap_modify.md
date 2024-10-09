<div>

<div>

</div>

<div>

## Name

ldap_modify — Modifies an existing LDAP directory.

</div>

<div>

## Synopsis

<div>

|                             |                             |
|-----------------------------|-----------------------------|
| `int `**`ldap_modify`**` (` | in `server_url ` varchar ,  |
|                             | in `try_tls ` integer ,     |
|                             | in `data ` varchar ,        |
|                             | in `username ` varchar ,    |
|                             | in `password ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function modifies an existing LDAP directory entry.

</div>

<div>

## Parameters

<div>

### server_url

The server URL has three parts, \<protocol\>://\<host\>:\<port\>.
Missing parameters will be defaulted to:

``` programlisting
<ldap://localhost:389>
```

.

</div>

<div>

### try_tls

*`try_tls `* is a flag that tells the client to perform a handshake with
the LDAP server using a secure connection. This is only applicable to
the ldap:// protocol and not ldaps://.

</div>

<div>

### data

*`data `* is an array with name/value pairs representing the data of the
modified entry.

</div>

<div>

### username

username authorization credential

</div>

<div>

### password

password authorization credential

</div>

</div>

<div>

## Return Types

The error status code is returned.

This function will return zero on success or non-zero in case of a
failure. In case of a failure the signal will be raised according to SQL
error codes and Virtuoso internal error codes.

The reserved prefix for internal errors is 'LD'.

</div>

<div>

## Errors

<div>

**Table 24.49. Errors signalled by `ldap_modify `**

<div>

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

<div>

## Examples

<div>

**Example 24.204. Using ldap_modify**

<div>

``` programlisting
create procedure
sam_ldap_modify (in s1 varchar, in s2 varchar)
{
  declare res, vec any;
  declare _from_modify integer;

  vec := vector ('dn', concat ('cn=', s1, ' ', s2, ',o=opl,c=BG'), 'mail',
    vector('new_mail@techno-link.com'), 'telephoneNumber',
    vector('123-45-00', '032-633710', '048 850 760') );

  _from_modify := ldap_modify ('ldap://localhost:389', 0, vec, NULL);

  return (_from_modify);
};
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_ldap_add.html" class="link" title="ldap_add"><code
class="function">ldap_add() </code></a> ,
<a href="fn_ldap_delete.html" class="link" title="ldap_delete"><code
class="function">ldap_delete()</code></a> ,
<a href="fn_ldap_search.html" class="link" title="ldap_search"><code
class="function">ldap_search()</code></a>

</div>

</div>
