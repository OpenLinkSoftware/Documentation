<div id="fn_xenc_encrypt" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xenc_encrypt — Encrypt and optionally sign a SOAP message

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xenc_encrypt" class="funcsynopsis">

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

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xenc_encrypt" class="refsect1">

## Description

Encrypt SOAP message and optionally attach an XML signature. The keys
are retrieved from the key store of the calling user account.

</div>

<div id="params_xenc_encrypt" class="refsect1">

## Parameters

<div id="id119762" class="refsect2">

### message

A string containing SOAP message

</div>

<div id="id119765" class="refsect2">

### soap_ver

SOAP version (11 = 1.1, 10 = 1.0 etc.)

</div>

<div id="id119768" class="refsect2">

### template

a string containing Digital signature template.

</div>

<div id="id119771" class="refsect2">

### ns

an array of strings containing WS-Security extension and WS-Utility
version information.

</div>

<div id="id119774" class="refsect2">

### xp-n

XPath expression to locate n-th part of the message to be encrypted

</div>

<div id="id119777" class="refsect2">

### ki-n

Key instance to encrypt the part

</div>

<div id="id119780" class="refsect2">

### what-n

'Content' - the content under located element will be encrypted;
'Element' the located element and content will be encrypted.

</div>

</div>

<div id="ret_xenc_encrypt" class="refsect1">

## Return Types

On success the function will return a string containing encrypted and
optionally signed SOAP message.

</div>

<div id="examples_xenc_encrypt" class="refsect1">

## Examples

<div id="ex_xenc_encrypt" class="example">

**Example 24.458. Encrypting and signing SOAP message**

<div class="example-contents">

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

<div id="seealso_xenc_encrypt" class="refsect1">

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
