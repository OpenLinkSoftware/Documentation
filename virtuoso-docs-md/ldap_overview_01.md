<div>

<div>

<div>

<div>

## 19.9. LDAP

</div>

</div>

</div>

The Lightweight Directory Access Protocol (LDAP) is a protocol for
accessing online directory services. It runs directly over TCP and can
be used to access a standalone LDAP directory service or a directory
service maintained by X.500. A directory is type of database that stores
information that is read more often that written to and so services are
typically geared for high volume read access and offer simpler
transaction support than general purpose databases. The LDAP directory
service model is based on entries. An entry is a collection of
attributes that has a "distinguished name" (DN). The DN is used to refer
to the entry unambiguously. Each of the entry's attributes has a type
and one or more values. The types are typically mnemonic strings, like
"cn" for common name, or "mail" for email address. The values depend on
what type of attribute it is: an email attribute might contain the
string value "foo@bar.org". A jpegPhoto attribute would contain a
photograph in binary JPEG format.

LDAP directory entries are arranged in a hierarchical tree-like
structure that may reflect political, geographic and/or organizational
boundaries. Hence, entries representing countries appear at the top of
the tree, below them are entries representing states or national
organizations, then, entries representing people, printers, documents,
anything else...

LDAP provides methods for authentication. Directories can be made
accessible to the general public or protected however the case may be.

LDAP is made for finding people and resources on a network. It provides
a completely different functionality from web searches such as yahoo or
webcrawler, which work simply by text matching and often return many
thousand's of entries. Using an LDAP directory to locate something
however, if you know the approximate location of where it is, such as
what organization and country it is in, then you can do a search and
return much fewer entries. LDAP is a vendor independent open protocol.
The fact that organizations can alter it to their own needs is key.
Also, large companies can use it as the basis for their own more complex
directory servers.

There are common misconceptions about the role of LDAP. LDAP is not
intended as a replacement for local databases. They are not built to be
added and modified too easily and thus would not work in a situation
such as an airline reservation system. Also, LDAP is not meant to be a
replacement for DNS. DNS is a specialized well used service on the
Internet for matching IP addresses to real names. However databases and
DNS and LDAP like most Internet services work very well in
collaboration.

Virtuoso has the ability to act as an LDAP client, using built-in
functions, and has been tested as a back end for the OpenLDAP server.

<div>

<div>

<div>

<div>

### 19.9.1. LDAP Client

</div>

</div>

</div>

Virtuoso provides four functions for accessing an LDAP Directory
Service:

|                                                                      |
|----------------------------------------------------------------------|
| <a href="fn_ldap_search.html" class="link" title="ldap_search"><code 
 class="function">ldap_search()</code></a>                             |
| <a href="fn_ldap_delete.html" class="link" title="ldap_delete"><code 
 class="function">ldap_delete()</code></a>                             |
| <a href="fn_ldap_add.html" class="link" title="ldap_add"><code       
 class="function">ldap_add()</code></a>                                |
| <a href="fn_ldap_modify.html" class="link" title="ldap_modify"><code 
 class="function">ldap_modify()</code></a>                             |

You can call each function independently. Each invocation of a function
creates a separate LDAP session which is closed at the end of the
operation.

URLs beginning with

``` programlisting
ldaps://
```

invoke a non-conditional SSL operation. Such URLs cannot be used with
the *`try_tls`* flag set. If the URL does not contain a port number then
Virtuoso will use the default port number 389 for \<ldap://\> and port
number 636 for \<ldaps://\>.

The *`username`* and *`password`* optional parameters are used to bind
LDAP connections using basic authentication. If the operation is
permitted to all users then you can leave these parameters out.

</div>

</div>
