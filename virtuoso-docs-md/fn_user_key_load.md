<div>

<div>

</div>

<div>

## Name

USER_KEY_LOAD — Register and existing key.

</div>

<div>

## Synopsis

<div>

|                            |                            |
|----------------------------|----------------------------|
| ` `**`USER_KEY_LOAD`**` (` | in `key_name ` varchar ,   |
|                            | in `key_value ` any ,      |
|                            | in `key_type ` varchar ,   |
|                            | in `key_format ` varchar , |
|                            | in `key_passwd ` varchar , |
|                            | in `key_pkey ` any `)`;    |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to register and persist an existing key in the
Virtuoso server. This is needs to be made once per key/certificate, and
does not need to be repeated after server restart, unless the key is
erased and has to be redefined.

</div>

<div>

## Parameters

<div>

### key_name

The key reference, as a 'Sample Key' or 'file:keys/srv.pem'

</div>

<div>

### key_value

When the key is an internal reference i.e. non 'file:', the content of a
key. The default value is NULL.

</div>

<div>

### key_type

The key algorithm, possible values are "3DES", "RSA", "DSA", "X.509",
"AES".

</div>

<div>

### key_format

The format of the key content storage, possible values are "DER", "PEM",
"PKCS12".

</div>

<div>

### key_passwd

The password for opening the key if required, this can be NULL to
indicate no password required.

</div>

<div>

### key_pkey

When an X.509 certificate is imported, this can be supplied to load the
corresponding private key also. This is optional. Note that when the
PKCS#12 format is used to import an X.509 certificate, the private key
is in the 'key_value', hence this parameter in such case must be
omitted.

</div>

</div>

<div>

## Return Types

None.

</div>

<div>

## Example

<div>

**Example 24.452. Simple Use**

<div>

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
