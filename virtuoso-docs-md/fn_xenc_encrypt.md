<div>

<div>

</div>

<div>

## Name

xenc_encrypt — Encrypt and optionally sign a SOAP message

</div>

<div>

## Synopsis

<div>

|                                  |                          |
|----------------------------------|--------------------------|
| `varchar `**`xenc_encrypt`**` (` | in `message ` varchar ,  |
|                                  | in `soap_ver ` int ,     |
|                                  | in `template ` varchar , |
|                                  | in `ns ` any ,           |
|                                  | in `xp-n ` varchar ,     |
|                                  | in `ki-n ` any ,         |
|                                  | in `what-n ` varchar ,   |
|                                  | `... ` `)`;              |

<div>

 

</div>

</div>

</div>

<div>

## Description

Encrypt SOAP message and optionally attach an XML signature. The keys
are retrieved from the key store of the calling user account.

</div>

<div>

## Parameters

<div>

### message

A string containing SOAP message

</div>

<div>

### soap_ver

SOAP version (11 = 1.1, 10 = 1.0 etc.)

</div>

<div>

### template

a string containing Digital signature template.

</div>

<div>

### ns

an array of strings containing WS-Security extension and WS-Utility
version information.

</div>

<div>

### xp-n

XPath expression to locate n-th part of the message to be encrypted

</div>

<div>

### ki-n

Key instance to encrypt the part

</div>

<div>

### what-n

'Content' - the content under located element will be encrypted;
'Element' the located element and content will be encrypted.

</div>

</div>

<div>

## Return Types

On success the function will return a string containing encrypted and
optionally signed SOAP message.

</div>

<div>

## Examples

<div>

**Example 24.458. Encrypting and signing SOAP message**

<div>

``` screen
...
ns := vector ();
template := dsig_template_ext (...);
keyi := xenc_key_inst_create ('myAES', xenc_key_inst_create ('rsa-test'));
resp := xenc_encrypt (request, 11, template, ns, '/Envelope/Body', keyi, 'Content');
...
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_encrypt.html" class="link" title="encrypt"><code
class="function">encrypt() </code></a>

<a href="fn_decrypt.html" class="link" title="decrypt"><code
class="function">decrypt() </code></a>

<a href="fn_dsig_template_ext.html" class="link"
title="dsig_template_ext"><code
class="function">dsig_template_ext() </code></a>

<a href="fn_xenc_key_inst_create.html" class="link"
title="xenc_key_inst_create"><code
class="function">xenc_key_inst_create() </code></a>

</div>

</div>
