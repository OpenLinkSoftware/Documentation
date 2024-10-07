<div id="fn_smime_decrypt" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

smime_decrypt — Decryption of a PKCS7 encrypted smime msg

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_smime_decrypt" class="funcsynopsis">

|                                   |                                         |
|-----------------------------------|-----------------------------------------|
| `varchar `**`smime_decrypt`**` (` | in `encrypted_mail_message ` varchar ,  |
|                                   | in `recipient_certificate ` varchar ,   |
|                                   | in `recipient_key ` varchar ,           |
|                                   | in `password_for_the_key ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_smime_decrypt" class="refsect1">

## Description

This function performs decryption of a PKCS7 encrypted smime msg

</div>

<div id="params_smime_decrypt" class="refsect1">

## Parameters

<div id="id110261" class="refsect2">

### encrypted_mail_message

The text of the encrypted smime message

</div>

<div id="id110264" class="refsect2">

### recipient_certificate

The certificate of the recipient (pem format)

</div>

<div id="id110267" class="refsect2">

### recipient_key

The private key of recipient matching the recipient_certificate (pem
format)

</div>

<div id="id110270" class="refsect2">

### password_for_the_key

The secret to open the recipient_key (if key is encrypted)

</div>

</div>

<div id="ret_smime_decrypt" class="refsect1">

## Return Types

varchar

</div>

<div id="examples_smime_decrypt" class="refsect1">

## Examples

<div id="ex_smime_decrypt" class="example">

**Example 24.376. Decryption a PKCS7 encrypted smime msg**

<div class="example-contents">

``` programlisting
select smime_decrypt (file_to_string ('test.p7m'), 
                      file_to_string ('test.pem'), 
                      file_to_string ('test.key.pem'), 
                      'secret');
_______________________________________________________________________________
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
 charset=us-ascii

this is a test
_______________________________________________________________________________
```

</div>

</div>

  

</div>

<div id="seealso_smime_decrypt" class="refsect1">

## See Also

<a href="fn_smime_sign.html" class="link"
title="smime_sign">smime_sign</a>

<a href="fn_smime_encrypt.html" class="link"
title="smime_encrypt">smime_encrypt</a>

<a href="fn_smime_verify.html" class="link"
title="smime_verify">smime_verify</a>

<a href="fn_pem_certificates_to_array.html" class="link"
title="pem_certificates_to_array">pem_certificates_to_array</a>

</div>

</div>
