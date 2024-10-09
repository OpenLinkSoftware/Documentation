<div>

<div>

<div>

<div>

### 1.5.78. How to Manage SSL Protocols and Ciphers used with Virtuoso?

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### What?

</div>

</div>

</div>

As of Virtuoso 7.2, SSL protocol and cipher support is now configurable
for connections from all HTTP, ODBC, JDBC, ADO.NET, and OLE-DB clients.

</div>

<div>

<div>

<div>

<div>

#### Why?

</div>

</div>

</div>

Default binding to OpenSSL can expose Virtuoso instances to version- and
cipher-specific SSL vulnerabilities (e.g., recent <a
href="http://security.stackexchange.com/questions/70719/ssl3-poodle-vulnerability"
class="ulink" target="_top">Poodle exploit</a> ). Being able to scope
Virtuoso's use of SSL to one or more specific versions provides instance
administrators better protection against a moving target.

</div>

<div>

<div>

<div>

<div>

#### How?

</div>

</div>

</div>

<div>

<div>

<div>

<div>

##### Basic SSL Protocol Configuration

</div>

</div>

</div>

Basic configuration is through the `SSL_Protocols` values in the
`[Parameters]` and `[HTTP]` sections of the Virtuoso INI file. These are
comma+space-separated (", ") value lists. Including a protocol name
explicitly enables it; preceding the protocol name with an exclamation
point ("`!` ") explicitly disables it.

<div>

<div>

<div>

<div>

###### Basic SSL Protocol Configuration

</div>

</div>

</div>

<div>

**Table 1.1. Supported SSL Protocols and INI keyword values List**

<div>

| SSL/TLS Version | Value for INI file | Notes                                                                           |
|:----------------|--------------------|---------------------------------------------------------------------------------|
| SSLv2           | \-                 | Permanently disabled.                                                           |
| SSLv3           | `SSLv3`            | Disabled by default. To our knowledge, only required by IE6/Windows XP clients. |
| TLSv1           | `TLSv1`            | Enabled by default.                                                             |
| TLSv1.1         | `TLSv1.1`          | Enabled by default, supported if available in local `openssl` library.          |
| TLSv1.2         | `TLSv1.2`          | Enabled by default, supported if available in local `openssl` library.          |

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

##### Advanced SSL Cipher List Configuration

</div>

</div>

</div>

The `SSL_Cipher_List` values in the `[Parameters]` and `[HTTP]` stanzas
of the Virtuoso INI file may also be adjusted, to disable particular
ciphers when there are security reports about some new attack that
breaks them. These are colon-separated ("`:` ") value lists.

Including a protocol name or groupname explicitly enables it; preceding
the protocol name with an exclamation point ("`!` ") explicitly disables
it. You can review the ciphers supported by your local `OpenSSL` library
with the command:

``` programlisting
openssl ciphers -v ALL
```

For instance, we recommend explicitly forbidding anonymous cipher suites
(i.e., ones that do not use certificates, and are therefore susceptible
to man-in-the-middle attacks) using `!aNULL` .

We also recommend including `@STRENGTH` at the end of the list, so that
`OpenSSL` will prioritize the enabled ciphers by key length, regardless
of the list order.

</div>

<div>

<div>

<div>

<div>

##### Recommended Settings

</div>

</div>

</div>

The sample settings below provide a reasonable tradeoff of security
versus flexibility. As shown, we have enabled `SSLv3` on the HTTPS ports
for IE6 users, but left this disabled on the SQL data port.

``` programlisting
[Parameters]
SSL_Protocols   = TLSv1, TLSv1.1, TLSv1.2
SSL_Cipher_List = HIGH:!aNULL:!eNULL:!RC4:!DES:!MD5:!PSK:!SRP:!KRB5:!SSLv2:!EXP:!MEDIUM:!LOW:!DES-CBC-SHA:@STRENGTH

[HTTP]
SSL_Protocols   = SSLv3, TLSv1, TLSv1.1, TLSv1.2
SSL_Cipher_List = HIGH:!aNULL:!eNULL:!RC4:!DES:!MD5:!PSK:!SRP:!KRB5:!SSLv2:!EXP:!MEDIUM:!LOW:!DES-CBC-SHA:@STRENGTH
```

</div>

</div>

</div>
