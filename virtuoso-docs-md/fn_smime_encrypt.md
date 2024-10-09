<div>

<div>

</div>

<div>

## Name

smime_encrypt — Performs encryption of a (signed) e-mail msg

</div>

<div>

## Synopsis

<div>

|                                   |                                             |
|-----------------------------------|---------------------------------------------|
| `varchar `**`smime_encrypt`**` (` | in `mail_message ` varchar ,                |
|                                   | in `array_of_recipient_certificates ` any , |
|                                   | in `cipher_name ` varchar `)`;              |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function performs encryption of a (signed) e-mail message.

</div>

<div>

## Parameters

<div>

### mail_message

The text of the e-mail msg.

</div>

<div>

### array_of_recipient_certificates

An array of strings containing certificates (per format) of the
recipient individuals. The certificates must contain RSA keys. See for
reference
<a href="http://www.openssl.org/docs/crypto/PKCS7_encrypt.html"
class="ulink" target="_top">here</a> .

</div>

<div>

### cipher_name

Encryption algorithm 'des', 'des3', 'aes256', 'aes128' etc.

</div>

</div>

<div>

## Return Types

varchar

</div>

<div>

## Examples

<div>

**Example 24.375. Encrypting (signed) e-mail msg**

<div>

``` programlisting
SQL> select smime_encrypt (file_to_string ('test.eml'), 
                           pem_certificates_to_array (file_to_string ('testcerts.pem')), 
                           'aes256');

_______________________________________________________________________________
MIME-Version: 1.0
Content-Disposition: attachment; filename="smime.p7m"
Content-Type: application/x-pkcs7-mime; smime-type=enveloped-data; name="smime.p7m"
Content-Transfer-Encoding: base64

MIIDwwYJKoZIhvcNAQcDoIIDtDCCA7ACAQAxggGXMIIBkwIBADB7MHYxCzAJBgNV
BAYTAkJHMRAwDgYDVQQIEwdQbG92ZGl2MRMwEQYDVQQKEwpQcm9nZW0gT09EMQ0w
CwYDVQQLEwRMYWJzMRAwDgYDVQQDEwdSb290IENBMR8wHQYJKoZIhvcNAQkBFhBp
bWl0a29AZ21haWwuY29tAgEAMA0GCSqGSIb3DQEBAQUABIIBADWF2bOMROmztQqO
ytW7JfG3vjpk4TKHKoSnjKP0bBOSypY6/0tOzIg9jQHvl/Kay0do6gzfNbWV9SQP
UWRa0lyD9rpG9WbxStOTPzDhDhbFJ0EXr1CR0uKMoUUuY3ovWkdZx0+whhCuwwVF
pSY0vvh9P+Bw0hMUsJPsDtudti220a7A0jJ5Rz2ubcnN5A3M5Odxwr59ix93RYD/
zfQ5ETqH8zx16F1cs7uS2uD7m2uVp8mQBab4onDYzpLUWvVi/dPX3h2ifAjn25At
SmWROYd+NbyNxs9uQp4pQZ6ZEJo6dPVrsM7SfR55O3ukq5V9zOUYEVN+VJpPlGBt
Gru9tlwwggIOBgkqhkiG9w0BBwEwHQYJYIZIAWUDBAEqBBCykjJ22Mk6baYYlP/w
PTb2gIIB4KyYoU7j4vREgvTO6zBauDnACAZO0oOdzGDuJKtLd8rTJO10ntp+CF6Y
5hAZnUefW0cCm6Pn9yMb1l5Btthek+CCscKsPTNCMSb/dBuPTbmKQcfYwlHV/Ejz
Ko5uJYMHLh8RkjHPt6nov6YZrMA82IA4KGCWxhhsQ7flHYtLG9PEWOaQr7Y+BYBs
a3sQdiGgGBwarTX+y65ERYcE32h+xnP4RW3QD8VEmhlyesG5xoALnGM4CQ9VObh1
VOTQhPRbu1PSsa4fEjbn3ey7+89mrjpYD/GwdwBEqOM0xGUZI4UBnhDwCIE/A4xX
jEdf59vpUt+mVzGYXCwSvkdwMCpPoPH9asYXSEWLoDOIagNUbuUQ5Y/A1iKWpM8p
21IND9tI+UiXMBgrDpeR/0b/E+Waswfb9qdXDSBDFGdB1aJo/f9KsikHNwxYczxh
YF0Ra3WqJC0n3+IEgoaCy/8Shon6VDsnZtB0aMXBIUEd+tpx0CBggLmHWL7jwcwy
CRD2bYzuM3yvux/u7U0B5GmfDEmyuNoEyMuUGC1+Sk7TFBtW0I9LpBDY5m5hPl1y
VeATJx0vPbmcy/smzkVKYTwhFWF/AYT4CrNbrTYkkb39JmWHTH6GU1KEfoonTbA7
oAUG6cFvFA==
_______________________________________________________________________________
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_smime_decrypt.html" class="link"
title="smime_decrypt">smime_decrypt</a>

<a href="fn_smime_sign.html" class="link"
title="smime_sign">smime_sign</a>

<a href="fn_smime_verify.html" class="link"
title="smime_verify">smime_verify</a>

<a href="fn_pem_certificates_to_array.html" class="link"
title="pem_certificates_to_array">pem_certificates_to_array</a>

</div>

</div>
