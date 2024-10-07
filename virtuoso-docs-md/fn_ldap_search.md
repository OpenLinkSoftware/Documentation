<div id="fn_ldap_search" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

ldap_search — Search in an LDAP server.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_ldap_search" class="funcsynopsis">

|                             |                             |
|-----------------------------|-----------------------------|
| `any `**`ldap_search`**` (` | in `server_url ` varchar ,  |
|                             | in `try_tls ` integer ,     |
|                             | in `base ` varchar ,        |
|                             | in `filter ` varchar ,      |
|                             | in `username ` varchar ,    |
|                             | in `password ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_ldap_search" class="refsect1">

## Description

This function performs a search in the LDAP server. It returns control
to the Virtuoso/PL environment only after all of the search results have
been sent by the server or if the search request is timed out by the
server. The result of the search (attributes, names of the attributes,
etc.) will be returned as an array result. Options to the LDAP search
can be passed as an array.

</div>

<div id="params_ldap_search" class="refsect1">

## Parameters

<div id="id95057" class="refsect2">

### server_url

The server URL has three parts, \<protocol\>://\<host\>:\<port\>.
Missing parameters will be defaulted to

``` programlisting
<ldap://localhost:389>
```

.

</div>

<div id="id95061" class="refsect2">

### try_tls

*`try_tls `* is a flag that tells the client to perform a handshake with
the LDAP server using a secure connection. This is only applicable to
the ldap:// protocol and not ldaps://. If a secure connection cannot be
made, the connection will be insecure.

</div>

<div id="id95065" class="refsect2">

### base

*`base `* is a string representing the DN base of the search.

</div>

<div id="id95069" class="refsect2">

### filter

Filter is a string representation of the filter to apply in the search.
Simple filters can be specified as `attributetype=attributevalue` . More
complex filters are specified using a prefix notation according to the
following BNF:

``` programlisting
<filter> ::= '(' <filtercomp> ')'
  <filtercomp> ::= <and> | <or> | <not> | <simple>
  <and> ::= '&' <filterlist>
  <or> ::= '|' <filterlist>
  <not> ::= '!' <filter>
  <filterlist> ::= <filter> | <filter> <filterlist>
  <simple> ::= <attributetype> <filtertype> <attributevalue>
  <filtertype> ::= '=' | '~=' | '<=' | '>='
```

</div>

<div id="id95074" class="refsect2">

### username

username authorization credential

</div>

<div id="id95077" class="refsect2">

### password

password authorization credential

</div>

</div>

<div id="ret_ldap_search" class="refsect1">

## Return Types

This function returns an array consisting of the following elements:

``` screen
<entry type>, (<attribute name>, (<value 1>, <value 2> ...))
```

The *`entry type`* can be the keyword 'entry' for search entry,
'reference' for search reference, 'extended' for extended result, or
'result' for result from search. When you specify 'result', the returned
array consists of 'error' and 'error message' keywords corresponding to
error codes and error descriptions.

</div>

<div id="errors_ldap_search" class="refsect1">

## Errors

<div id="id95088" class="table">

**Table 24.47. Errors signalled by `ldap_search `**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                               | Description |
|---------------------------------------|---------------------------------------|----------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">2E000 </span> | <span class="errorcode">LD020 </span> | <span class="errortext">Failed to load the wldap32.dll </span>                                           |             |
| <span class="errorcode">2E000 </span> | <span class="errorcode">LD005 </span> | <span class="errortext">Failed to initialize LDAP connection: \<reason\> (\<reason code\>) </span>       |             |
| <span class="errorcode">2E000 </span> | <span class="errorcode">LD006 </span> | <span class="errortext">Failed to set LDAP version option: \<reason\> (\<reason code\>) </span>          |             |
| <span class="errorcode">2E000 </span> | <span class="errorcode">LD016 </span> | <span class="errortext">Failed to start TLS: \<reason\> (\<reason code\>) </span>                        |             |
| <span class="errorcode">28000 </span> | <span class="errorcode">LD007 </span> | <span class="errortext">Failed to bind synchronous LDAP connection: \<reason\> (\<reason code\>) </span> |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">LD008 </span> | <span class="errortext">Failed to search </span>                                                         |             |
| <span class="errorcode">39000 </span> | <span class="errorcode">LD002 </span> | <span class="errortext">Failed to parse LDAP reference response </span>                                  |             |
| <span class="errorcode">39000 </span> | <span class="errorcode">LD003 </span> | <span class="errortext">Failed to parse LDAP extended result </span>                                     |             |
| <span class="errorcode">39000 </span> | <span class="errorcode">LD004 </span> | <span class="errortext">Failed to parse LDAP extended partial result </span>                             |             |

</div>

</div>

  

</div>

<div id="examples_ldap_search" class="refsect1">

## Examples

<div id="ex_ldap_search" class="example">

**Example 24.201. Using ldap_search**

<div class="example-contents">

``` programlisting
....
declare result any;

-- without authentication
result := ldap_search ('ldap://localhost', 0, 'c=US', '(cn=SomeBody*)', NULL);

or

-- with authentication
result := ldap_search ('ldap://localhost', 0, 'c=US', '(cn=SomeBody*)',
  'cn=root,o=opl,c=US', 'secret');

-- the result may be following array:
-- ("entry"
     ("dn" "cn="John Atanasov",mail=hellraisor@hotmail.com,c=US,o=hotmail.com"
      "mail" ("hellraisor@hotmail.com" )
      "cn" ("John Atanasov" )
      "o" ("hotmail.com" )
      "l" ("SOFIA" )
      "givenName" ("John" )
      "surname" ("Atanasov" ))
     "result"
       ("error" "0" "error message" "Success" ))

...
```

</div>

</div>

  

</div>

<div id="seealso_ldap_search" class="refsect1">

## See Also

<a href="fn_ldap_add.html" class="link" title="ldap_add"><code
class="function">ldap_add() </code></a> ,
<a href="fn_ldap_delete.html" class="link" title="ldap_delete"><code
class="function">ldap_delete() </code></a> ,
<a href="fn_ldap_modify.html" class="link" title="ldap_modify"><code
class="function">ldap_modify() </code></a>

</div>

</div>
