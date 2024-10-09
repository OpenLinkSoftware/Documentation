<div>

<div>

</div>

<div>

## Name

smime_decrypt — Decryption of a PKCS7 encrypted smime msg

</div>

<div>

## Synopsis

<div>

|                                   |                                         |
|-----------------------------------|-----------------------------------------|
| `varchar `**`smime_decrypt`**` (` | in `encrypted_mail_message ` varchar ,  |
|                                   | in `recipient_certificate ` varchar ,   |
|                                   | in `recipient_key ` varchar ,           |
|                                   | in `password_for_the_key ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function performs decryption of a PKCS7 encrypted smime msg

</div>

<div>

## Parameters

<div>

### encrypted_mail_message

The text of the encrypted smime message

</div>

<div>

### recipient_certificate

The certificate of the recipient (pem format)

</div>

<div>

### recipient_key

The private key of recipient matching the recipient_certificate (pem
format)

</div>

<div>

### password_for_the_key

The secret to open the recipient_key (if key is encrypted)

</div>

</div>

<div>

## Return Types

varchar

</div>

<div>

## Examples

<div>

**Example 24.376. Decryption a PKCS7 encrypted smime msg**

<div>

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

<div>

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
