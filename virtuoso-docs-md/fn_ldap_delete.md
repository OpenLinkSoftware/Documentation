<div id="fn_ldap_delete" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

ldap_delete — Remove a leaf entry in the LDAP Directory Information
Tree.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_ldap_delete" class="funcsynopsis">

|                             |                             |
|-----------------------------|-----------------------------|
| `int `**`ldap_delete`**` (` | in `server_url ` varchar ,  |
|                             | in `try_tls ` integer ,     |
|                             | in `entrydn ` varchar ,     |
|                             | in `username ` varchar ,    |
|                             | in `password ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_ldap_delete" class="refsect1">

## Description

This function removes a leaf entry in the LDAP Directory Information
Tree.

</div>

<div id="params_ldap_delete" class="refsect1">

## Parameters

<div id="id95212" class="refsect2">

### server_url

The server URL has three parts, \<protocol\>://\<host\>:\<port\>.
Missing parameters will be defaulted to

``` programlisting
<ldap://localhost:389>
```

.

</div>

<div id="id95216" class="refsect2">

### try_tls

*`try_tls `* is a flag that tells the client to perform a handshake with
the LDAP server using a secure connection. This is only applicable to
the ldap:// protocol and not ldaps://. If a secure connection cannot be
made, the client will fall back to using an insecure connection.

</div>

<div id="id95220" class="refsect2">

### entrydn

*`entrydn `* is a qualified string which represents the LDAP DN entry to
be deleted.

</div>

<div id="id95224" class="refsect2">

### username

username authorization credential

</div>

<div id="id95227" class="refsect2">

### password

password authorization credential

</div>

</div>

<div id="ret_ldap_delete" class="refsect1">

## Return Types

Zero for success or error code.

</div>

<div id="errors_ldap_delete" class="refsect1">

## Errors

<div id="id95235" class="table">

**Table 24.48. Errors signalled by `ldap_delete `**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                               | Description |
|---------------------------------------|---------------------------------------|----------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">2E000 </span> | <span class="errorcode">LD005 </span> | <span class="errortext">Failed to initialize LDAP connection: \<reason\> (\<reason code\>) </span>       |             |
| <span class="errorcode">2E000 </span> | <span class="errorcode">LD006 </span> | <span class="errortext">Failed to set LDAP version option: \<reason\> (\<reason code\>) </span>          |             |
| <span class="errorcode">2E000 </span> | <span class="errorcode">LD016 </span> | <span class="errortext">Failed to start TLS: \<reason\> (\<reason code\>) </span>                        |             |
| <span class="errorcode">28000 </span> | <span class="errorcode">LD007 </span> | <span class="errortext">Failed to bind synchronous LDAP connection: \<reason\> (\<reason code\>) </span> |             |
| <span class="errorcode">39000 </span> | <span class="errorcode">LD012 </span> | <span class="errortext">Failed to delete the DN entry: \<reason\> (\<reason code\>) </span>              |             |
| <span class="errorcode"></span>       | <span class="errorcode"></span>       | <span class="errortext"></span>                                                                          |             |

</div>

</div>

  

</div>

<div id="examples_ldap_delete" class="refsect1">

## Examples

<div id="ex_ldap_delete" class="example">

**Example 24.202. Using ldap_delete**

<div class="example-contents">

``` programlisting
  if (not ldap_delete ('ldap://localhost', 0,
    'cn=John Atanasov,mail=hellraisor@hotmail.com,c=US,o=hotmail.com', NULL))
    {
      -- the entry removed successfully, we can perform some other action
    }
```

</div>

</div>

  

</div>

<div id="seealso_ldap_delete" class="refsect1">

## See Also

<a href="fn_ldap_add.html" class="link" title="ldap_add"><code
class="function">ldap_add() </code></a> ,
<a href="fn_ldap_modify.html" class="link" title="ldap_modify"><code
class="function">ldap_modify() </code></a> ,
<a href="fn_ldap_search.html" class="link" title="ldap_search"><code
class="function">ldap_search() </code></a>

</div>

</div>
