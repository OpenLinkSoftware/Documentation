<div id="fn_xenc_decrypt_soap" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xenc_decrypt_soap — Decrypt and verify a SOAP message

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xenc_decrypt_soap" class="funcsynopsis">

|                                       |                           |
|---------------------------------------|---------------------------|
| `varchar `**`xenc_decrypt_soap`**` (` | in `xml_text ` varchar ,  |
|                                       | in `soap_version ` int ,  |
|                                       | in `validate_flag ` int , |
|                                       | in `encoding ` varchar ,  |
|                                       | in `lang ` varchar ,      |
|                                       | in `opts ` any ,          |
|                                       | out `keys ` any `)`;      |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xenc_decrypt_soap" class="refsect1">

## Description

The function is used to decrypt and optionally verify signature (depends
of a *`validate_flag`* parameter) of a SOAP message.

</div>

<div id="params_xenc_decrypt_soap" class="refsect1">

## Parameters

<div id="id119655" class="refsect2">

### xml_text

A string containing SOAP message

</div>

<div id="id119658" class="refsect2">

### soap_version

An integer indication SOAP version (11 for v1.1, 10 for 1.0 etc)

</div>

<div id="id119661" class="refsect2">

### validate_flag

Bit mask flag. See below for details.

|                                                                                                              |
|--------------------------------------------------------------------------------------------------------------|
| bit 0 and 1 : 00 - do not validate, 01 (decimal 1) - validate, 10 (decimal 2) - validate if signature exists |
| bit 2 : 100 (decimal 4) - try to decode, do not signal error if WS-Security is not supplied                  |

</div>

<div id="id119667" class="refsect2">

### encoding

The message ( *`xml_text `* ) character encoding

</div>

<div id="id119671" class="refsect2">

### lang

The message ( *`xml_text `* ) language

</div>

<div id="id119675" class="refsect2">

### opts

A vector containing options for User Name token profile. For example :
vector ('UsernameToken', vector ('label', 'lab1', 'keyAlgorithm' ,
'\[3des algo uri\]'))

</div>

<div id="id119678" class="refsect2">

### keys

if supplied the parameter will be set with keys names used for
decryption and signature verification. The structure is as follows :
vector (vector (\[enc-key1\],\[enc-key2\],...), vector ('\[signing token
name\]', '\[matching token\]')). Where enc-key is a key used to decrypt
the message fragment; '\[signing token name\]' is the temporary key used
to validate the signature and '\[matching token\]' is the token (key)
from user's space that matches the signing token.

</div>

</div>

<div id="ret_xenc_decrypt_soap" class="refsect1">

## Return Types

On success the function returns decrypted SOAP message.

</div>

<div id="examples_xenc_decrypt_soap" class="refsect1">

## Examples

<div id="ex_xenc_decrypt_soap" class="example">

**Example 24.456. Decrypting SOAP message**

<div class="example-contents">

``` screen
declare ekeys, opts, decoded any;
opts := vector ('UsernameToken',
                vector ('label',
                        'Application-Label',
                          'keyAlgorithm',
                          'http://www.w3.org/2001/04/xmlenc#tripledes-cbc'));
decoded := xenc_decrypt_soap (body_str, 11, 6, 'UTF-8', 'x-any', opts, ekeys);
```

</div>

</div>

  

</div>

<div id="seealso_xenc_decrypt_soap" class="refsect1">

## See Also

<a href="fn_xenc_encrypt.html" class="link" title="xenc_encrypt"><code
class="function">xenc_encrypt() </code></a>

</div>

</div>
