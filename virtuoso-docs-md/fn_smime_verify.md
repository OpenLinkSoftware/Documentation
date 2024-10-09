<div>

<div>

</div>

<div>

## Name

smime_verify — Verifies signature of signed MIME message

</div>

<div>

## Synopsis

<div>

|                                  |                           |
|----------------------------------|---------------------------|
| `varchar `**`smime_verify`**` (` | in `msg_text ` varchar ,  |
|                                  | in `certs ` any ,         |
|                                  | out `signer_certs ` any , |
|                                  | in `flags ` integer `)`;  |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function takes the RFC822 text of an e-mail containing an S/MIME
signed message and verifies it's signature using the CA certificates in
certs, which is an array of strings containing single or multiple
PEM-encoded certificates.

</div>

<div>

## Parameters

<div>

### msg_text

The text of the message

</div>

<div>

### certs

array of strings containing CA certificates

</div>

<div>

### signer_certs

for receipt of PEM encoded certificates

</div>

<div>

### flags

A bitmask. See table below for valid mask values. Default is 0.

<div>

**Table 24.79. Bit values for *`flags `***

<div>

| Mask | Name           | Description                                                                                 |
|------|----------------|---------------------------------------------------------------------------------------------|
| 0x1  | PKCS7_TEXT     | strip the text/plain content type header (if present). If no such header generate an error. |
| 0x4  | PKCS7_NOSIGS   | don't verify the signatures                                                                 |
| 0x8  | PKCS7_NOCHAIN  | don't descend into the signer's certificate chain when verifying                            |
| 0x10 | PKCS7_NOINTERN | return only non-internal certificates in signer_certs                                       |
| 0x20 | PKCS7_NOVERIFY | don't verify the signer's certificates                                                      |

</div>

</div>

  

</div>

</div>

<div>

## Return Types

If the signer_certs is supplied, an array of PEM encoded certificates of
the signers is returned.

</div>

<div>

## Examples

<div>

**Example 24.374. Verifying a Signed MIME Message**

<div>

Example (where signed.eml contains the output from smime_sign.

``` programlisting
select smime_verify (file_to_string ('signed.eml'),
  vector (file_to_string ('thwate_ca.pem')), NULL, 1)

_______________________________________________________________________________
just a test
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

<a href="fn_smime_decrypt.html" class="link"
title="smime_decrypt">smime_decrypt</a>

<a href="fn_pem_certificates_to_array.html" class="link"
title="pem_certificates_to_array">pem_certificates_to_array</a>

</div>

</div>
