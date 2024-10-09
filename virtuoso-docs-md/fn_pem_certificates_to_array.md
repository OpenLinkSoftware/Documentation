<div>

<div>

</div>

<div>

## Name

pem_certificates_to_array — converts a PEM file to an array of PEM
strings

</div>

<div>

## Synopsis

<div>

|                                        |                               |
|----------------------------------------|-------------------------------|
| ` `**`pem_certificates_to_array`**` (` | in `pem_string ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This gets a PEM file with (possibly) many X509 certificates among others
and constructs an array containing each X509 certificate as a separate
PEM string. This can serve for splitting a PEM file containing multiple
certificates (for example CA file) to single certificate entries so it
can be examined with get_certificate_info function. Note that the array
can contain NULL elements in places where in the PEM file there are
blocks other than X509 PEM certificates.

</div>

<div>

## Parameters

<div>

### pem_string

text of the PEM file

</div>

</div>

<div>

## Return Types

Array of PEM strings

</div>

<div>

## Errors

<div>

**Table 24.60. Errors signalled by `pem_certificates_to_array `**

<div>

| SQLState                              | Error Code                            | Error Text                                                                            | Description |
|---------------------------------------|---------------------------------------|---------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">42000 </span> | <span class="errorcode">CR011 </span> | <span class="errortext">Can't allocate temp space. SSL error : \<error text\> </span> |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">CR012 </span> | <span class="errortext">Can't read certificates. SSL error : \<error text\> </span>   |             |

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_smime_sign.html" class="link"
title="smime_sign">smime_sign</a>

<a href="fn_smime_verify.html" class="link"
title="smime_verify">smime_verify</a>

</div>

</div>
