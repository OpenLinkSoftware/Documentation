<div>

<div>

</div>

<div>

## Name

smime_sign — Converts a MIME message to a signed S/MIME message

</div>

<div>

## Synopsis

<div>

|                                |                                  |
|--------------------------------|----------------------------------|
| `varchar `**`smime_sign`**` (` | in `msg_text ` varchar ,         |
|                                | in `signer_cert ` varchar ,      |
|                                | in `private_key ` varchar ,      |
|                                | in `private_key_pass ` varchar , |
|                                | in `signer_CA_certs ` any ,      |
|                                | in `flags ` integer `)`;         |

<div>

 

</div>

</div>

</div>

<div>

## Description

Converts a MIME message to a signed S/MIME message.

</div>

<div>

## Parameters

<div>

### msg_text

The text of the message

</div>

<div>

### signer_cert

Signer certificate.

</div>

<div>

### private_key

Private Key

</div>

<div>

### private_key_pass

Private Key Pass

</div>

<div>

### signer_CA_certs

Array of strings of CA Certificates

</div>

<div>

### flags

<div>

**Table 24.78. Bits defined in *`flags `***

<div>

| Mask  | Name             | Description                                                                    |
|-------|------------------|--------------------------------------------------------------------------------|
| 0x1   | PKCS7_TEXT       | add a text/plain content type MIME header                                      |
| 0x2   | PKCS7_NOCERTS    | do not put the signer_CA_certs into the generated PKCS7 signature              |
| 0x40  | PKCS7_DETACHED   | do multipart/signed message                                                    |
| 0x80  | PKCS7_BINARY     | do not canonize the line endings to CR/LF                                      |
| 0x100 | PKCS7_NOATTR     | Do not include attributes (signing time, supported symmetric algorithms, etc.) |
| 0x200 | PKCS7_NOSMIMECAP | no SMIME capabilities attributes                                               |

</div>

</div>

  

</div>

</div>

<div>

## Return Types

This function takes a message and converts it to an S/MIME signed
message based on the flags value (if supplied - default PKCS7_DETACHED).

</div>

<div>

## Examples

<div>

**Example 24.373. Signing a MIME Message**

<div>

Example (where signed.eml contains the output from smime_sign.

``` programlisting
select smime_sign ('just a test', file_to_string ('thwate_pub.pem'),
  file_to_string ('thwate_pri.pem'), 'very_secret_password',
    vector (file_to_string ('thwate_ca.pem')), 4*16 + 1);

_______________________________________________________________________________

MIME-Version: 1.0
Content-Type: multipart/signed ; protocol="application/x-pkcs7-signature" ;
  micalg=sha1 ; boundary="----23F1D9057532E126962121287FDB4793"

This is an S/MIME signed message

------23F1D9057532E126962121287FDB4793
Content-Type: text/plain

just a test
------23F1D9057532E126962121287FDB4793
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIILaAYJKoZIhvcNAQcCoIILWTCCC1UCAQExCzAJBgUrDgMCGgUAMAsGCSqGSIb3
DQEHAaCCCTswggLZMIICQqADAgECAgMD2DgwDQYJKoZIhvcNAQEEBQAwgZIxCzAJ
BgNVBAYTAlpBMRUwEwYDVQQIEwxXZXN0ZXJuIENhcGUxEjAQBgNVBAcTCUNhcGUg
VG93bjEPMA0GA1UEChMGVGhhd3RlMR0wGwYDVQQLExRDZXJ0aWZpY2F0ZSBTZXJ2
aWNlczEoMCYGA1UEAxMfUGVyc29uYWwgRnJlZW1haWwgUlNBIDIwMDAuOC4zMDAe
Fw0wMDEyMjIwODM1MjFaFw0wMTEyMjIwODM1MjFaMHkxHzAdBgNVBAMTFlRoYXd0
ZSBGcmVlbWFpbCBNZW1iZXIxLjAsBgkqhkiG9w0BCQEWH2tnZW9yZ2VAcGxvdmRp
di50ZWNobm8tbGluay5jb20xJjAkBgkqhkiG9w0BCQEWF2drb2Rpbm92QG9wZW5s
aW5rLmNvLnVrMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDTOklS3QEDt2Pm
vtNOK5Zi7PPn9U2EDmdjoCjKEHq8Zkyod+rATNBrqH24ewaoqCPWtRTb9GkwW9EM
z+2pu+liAqiA4Es+sNpfgKvO4T4/bliyp3FAJ/03s9XfU0hyJT5JVFDt0hfBou0c
wgG1spwuz/3Gtl/DQDS1AMZ1R8jacQIDAQABo1UwUzBDBgNVHREEPDA6gR9rZ2Vv
cmdlQHBsb3ZkaXYudGVjaG5vLWxpbmsuY29tgRdna29kaW5vdkBvcGVubGluay5j
by51azAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBAUAA4GBAAArP5xEnmt5goAO
2+8UE/8dd4CwfG0w/IO53psFgpjPlM/D9ePt/LPF/vhTtPHXubm54xJlNVi0MMPU
g91BU3bPkX2rrEhv1plInRc0eaKIooy+qz8KPhz5DwZ0PfidOMn3G2/HkdODVqjK
ZReIhcaU5pDamp0NCMjzi5isB2qfMIIDKTCCApKgAwIBAgIBDDANBgkqhkiG9w0B
AQQFADCB0TELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAG
A1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEoMCYG
A1UECxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMb
VGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJz
b25hbC1mcmVlbWFpbEB0aGF3dGUuY29tMB4XDTAwMDgzMDAwMDAwMFoXDTAyMDgy
OTIzNTk1OVowgZIxCzAJBgNVBAYTAlpBMRUwEwYDVQQIEwxXZXN0ZXJuIENhcGUx
EjAQBgNVBAcTCUNhcGUgVG93bjEPMA0GA1UEChMGVGhhd3Rl
_______________________________________________________________________________
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_smime_verify.html" class="link"
title="smime_verify">smime_verify</a>

<a href="fn_smime_encrypt.html" class="link"
title="smime_encrypt">smime_encrypt</a>

<a href="fn_smime_decrypt.html" class="link"
title="smime_decrypt">smime_decrypt</a>

<a href="fn_pem_certificates_to_array.html" class="link"
title="pem_certificates_to_array">pem_certificates_to_array</a>

</div>

</div>
