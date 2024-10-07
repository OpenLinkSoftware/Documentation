<div id="fn_user_key_load" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

USER_KEY_LOAD — Register and existing key.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_user_key_load" class="funcsynopsis">

|                            |                            |
|----------------------------|----------------------------|
| ` `**`USER_KEY_LOAD`**` (` | in `key_name ` varchar ,   |
|                            | in `key_value ` any ,      |
|                            | in `key_type ` varchar ,   |
|                            | in `key_format ` varchar , |
|                            | in `key_passwd ` varchar , |
|                            | in `key_pkey ` any `)`;    |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_user_key_load" class="refsect1">

## Description

This function is used to register and persist an existing key in the
Virtuoso server. This is needs to be made once per key/certificate, and
does not need to be repeated after server restart, unless the key is
erased and has to be redefined.

</div>

<div id="params_user_key_load" class="refsect1">

## Parameters

<div id="id119376" class="refsect2">

### key_name

The key reference, as a 'Sample Key' or 'file:keys/srv.pem'

</div>

<div id="id119379" class="refsect2">

### key_value

When the key is an internal reference i.e. non 'file:', the content of a
key. The default value is NULL.

</div>

<div id="id119382" class="refsect2">

### key_type

The key algorithm, possible values are "3DES", "RSA", "DSA", "X.509",
"AES".

</div>

<div id="id119385" class="refsect2">

### key_format

The format of the key content storage, possible values are "DER", "PEM",
"PKCS12".

</div>

<div id="id119388" class="refsect2">

### key_passwd

The password for opening the key if required, this can be NULL to
indicate no password required.

</div>

<div id="id119391" class="refsect2">

### key_pkey

When an X.509 certificate is imported, this can be supplied to load the
corresponding private key also. This is optional. Note that when the
PKCS#12 format is used to import an X.509 certificate, the private key
is in the 'key_value', hence this parameter in such case must be
omitted.

</div>

</div>

<div id="ret_user_key_load" class="refsect1">

## Return Types

None.

</div>

<div id="examples_user_key_load" class="refsect1">

## Example

<div id="ex_user_key_load" class="example">

**Example 24.452. Simple Use**

<div class="example-contents">

To load and persist an X.509 certificate contained in the file wss.pfx
in the server working directory one can use:

``` screen
USER_KEY_LOAD ('file:wss.pfx', NULL, 'X.509', 'PKCS12', 'virt');
```

To load and persist a shared secret:

``` screen
USER_KEY_LOAD ('WSDK Sample Symmetric Key', 'EE/uaFF5N3ZNJWUTR8DYe+OEbwaKQnso', '3DES', 'DER', null);
```

To load a DSA key contained in a file dsa.der:

``` screen
USER_KEY_LOAD ('file:dsa.der', NULL, 'DSA', 'DER', null);
```

</div>

</div>

  

</div>

</div>
