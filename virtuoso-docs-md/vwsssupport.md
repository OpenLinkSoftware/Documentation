<div id="vwsssupport" class="section">

<div class="titlepage">

<div>

<div>

## 17.5. WS-Security (WSS) Support in Virtuoso SOAP Server

</div>

</div>

</div>

The following terms are used in this section in the following meanings:

<div class="itemizedlist">

- **encryption . ** The process of making data unreadable using some
  secret (see 'key')

- **decryption . ** The opposite of encryption

- **signature . ** A sequence of binary codes that is calculated based
  on the original data and a key to secure the content from undetected
  change.

- **key . ** A secret, depending on the type can be symmetric or
  asymmetric.

  Typical symmetric keys are passwords. Symmetric keys are by their
  nature more at risk of being compromised if the secret key is stolen.
  Symmetric keys are usually used to encrypt large amounts of data as
  they are very fast.

  Asymmetric keys are more secure and their structure is more
  complicated. Asymmetric keys generally consist of a private and public
  key pair. The owner of the key can sign data to be verified by
  recipient with public key. A correspondent can encrypt the data using
  public key to be decrypted by private key owner. Asymmetric keys are
  used to sign data, or encrypt small amounts of data as they are slower
  to process than symmetric ones.

- **certificate . ** This is a structure of secure data, which
  identifies a certificate owner. This is similar to having a user-name
  and password but more secure. A 'certificate' can be associated with a
  document as an alias of the X.509 certificate. Certificates are issued
  by a third-party, not the owner or recipient in the verification path,
  namely the Certificate Authority (CA). The CA's function is to
  guarantee that a receiver can trust data accompanied by a particular
  certificate. Certificates will contain a public key, but never the
  private key. These must be distinguished from certificates that are
  exported together with their private key in PKCS#12 format, these are
  different things.

- **user account space . ** This is a data area where a user can store
  private data. Only ODBC sessions and web page processing code which
  runs on behalf of a certain SQL user account has access to this area.
  This is useful for caching private security related information such
  as keys or certificates.

- **key reference . ** A short hand for a key, sometime called a 'key
  name'. This is a string to uniquely identify a key in a user account
  space.

- **key instance . ** An entity representing a key in PL, this is a not
  the key per se. The key instance is used in encryption or decryption
  routines.

</div>

The following algorithms are supported:

|                                                             |
|-------------------------------------------------------------|
| RSA (http://www.w3.org/2001/04/xmlenc#rsa-1_5)              |
| DSA (http://www.w3.org/2001/04/xmlenc#dsa)                  |
| triple DES (http://www.w3.org/2001/04/xmlenc#tripledes-cbc) |
| AES128 (http://www.w3.org/2001/04/xmlenc#aes128-cbc)        |
| AES192 (http://www.w3.org/2001/04/xmlenc#aes192-cbc)        |
| AES256 (http://www.w3.org/2001/04/xmlenc#aes256-cbc)        |

Digest algorithms:

|                                               |
|-----------------------------------------------|
| SHA1 (http://www.w3.org/2000/09/xmldsig#sha1) |

Signing algorithms:

|                                                       |
|-------------------------------------------------------|
| RSA-SHA1 (http://www.w3.org/2000/09/xmldsig#rsa-sha1) |
| DSA-SHA1 (http://www.w3.org/2000/09/xmldsig#dsa-sha1) |

Canonicalization algorithms with comments:

|                                                   |
|---------------------------------------------------|
| (http://www.w3.org/TR/2001/REC-xml-c14n-20010315) |
| (http://www.w3.org/TR/2001/REC-xml-c14n)          |

The keys can be temporary or persistent keys. Temporary keys are loaded
only in memory an will be lost when the server is restarted. These are
usually used for making symmetric session keys. Persistent keys are kept
on the file-system or in the database and will be loaded upon server
startup. These are asymmetric keys, certificates that belong to the
user.

The location where persistent keys are stored depends on the key
reference. If the key reference is a 'file:' URI, then the API's assume
file-system storage, otherwise they will be kept in the U_OPT column of
the SYS_USERS table as a serialized string. The API functions are
described below. Whether keys are stored on the file-system or within
the database they will have an in-memory representation which is used in
crypto functions. The memory cache of keys is contained in the user
account space, hence no user can access or reference another user's
keys. Furthermore if a user account is removed all associated keys will
also be removed if they were stored in the database. If the keys were on
the file-system only the in-memory cache will be deleted.

<div id="vwsssrvclisidecerts" class="section">

<div class="titlepage">

<div>

<div>

### 17.5.1. Client and Server side Certificates & Keys

</div>

</div>

</div>

Since XML encoding routines are executed on server-side, we cannot
strictly say that we have client and server certificates (as browser and
HTTPS server). To perform the encoding on behalf of a client or user
account, the XML encoding functions need to have the keys and
certificates loaded in the memory cache of the user. The same applies to
server keys and certificates. Therefore we will refer to these as client
or server security tokens that are kept on server-side.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                         |
|:----------------------------:|:------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                   |
|                              | Uploading of keys and certificate must be done under a secure SSL/TLS connection to minimize the risk of vulnerability. |

</div>

<div id="vwsskeydefpersist" class="section">

<div class="titlepage">

<div>

<div>

#### Key Definition & Persistence

</div>

</div>

</div>

<a href="fn_xenc_key_3des_rand_create.html" class="link"
title="xenc_key_3DES_rand_create"><code
class="function">xenc_key_3DES_rand_create() </code></a>

<a href="fn_user_key_load.html" class="link" title="USER_KEY_LOAD"><code
class="function">USER_KEY_LOAD() </code></a>

</div>

<div id="vwsskeyenc" class="section">

<div class="titlepage">

<div>

<div>

#### Key Encryption

</div>

</div>

</div>

To minimize the risk of non-authorized private key usage, keys are
usually kept encrypted with password. If a key or certificate containing
a key is loaded using a password, the API will assume it is an encrypted
private key and will be kept in that form. In other words encrypted keys
are kept in their encrypted form in memory, there will be no raw
certificate or key data if the encrypted form is used to import.
Virtuoso will ask for passwords to unlock persisted encrypted keys upon
server restart. This is only possible when the server is running in
foreground mode. If the server is started as background process and the
key needs a password to decrypt and load, an error will be logged in the
virtuoso log file and that particular key will not be loaded.

<div id="vwsspasslog" class="example">

**Example 17.25. An example of a password prompt and log on success**

<div class="example-contents">

``` screen
Enter a password for key "wss.pfx":
13:14:04 PL LOG: XENC:   Loaded : wss.pfx
```

</div>

</div>

  

</div>

<div id="vwssreferencingkeys" class="section">

<div class="titlepage">

<div>

<div>

#### Referencing Keys

</div>

</div>

</div>

To make a run-time key instance, used for XML encryption functions, and
to perform server or client side the
<a href="fn_xenc_key_inst_create.html" class="link"
title="xenc_key_inst_create"><code
class="function">xenc_key_inst_create (in key_name varchar[, super key inst])</code></a>
function can be used.

<div id="vwssrefkeyex" class="example">

**Example 17.26. Example**

<div class="example-contents">

``` programlisting
create procedure
DB.DBA.WSDK_GET_KEY ()
{
  -- this returns a instance of shared secret suitable for content encryption
  return xenc_key_inst_create ('WSDK Sample Symmetric Key');
}
;

create procedure
DB.DBA.WS_SOAP_GET_KEY ()
{
  declare superkey, keyinst any;
  superkey := xenc_key_inst_create ('file:dsa.der'); -- already loaded asymmetric key (see above example)
  -- this returns a session key , to be encrypted with a asymmetric one
  keyinst := xenc_key_inst_create (xenc_key_3DES_rand_create (NULL), superkey);
  return keyinst;
}
;
```

</div>

</div>

  

</div>

<div id="vwsskeyremoval" class="section">

<div class="titlepage">

<div>

<div>

#### Key Removal

</div>

</div>

</div>

To delete a key, persistent or otherwise, the following function is
used:

<a href="fn_xenc_key_remove.html" class="link"
title="xenc_key_remove"><code
class="function">xenc_key_remove() </code></a>

</div>

</div>

</div>
