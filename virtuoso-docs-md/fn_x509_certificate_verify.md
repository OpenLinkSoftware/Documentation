<div>

<div>

</div>

<div>

## Name

x509_certificate_verify — Verifies X.509 certificate

</div>

<div>

## Synopsis

<div>

|                                             |                          |
|---------------------------------------------|--------------------------|
| `varchar `**`x509_certificate_verify`**` (` | in `cert ` varchar ,     |
|                                             | in `cacerts ` any ,      |
|                                             | in `flags ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function takes a X.509 certificate and verifies it against list of
CA certificates. It checks for various certificate attributes such as
self signed, expiration date etc. If an error is detected it will be
signalled.

The certificates are passed as a strings containing X.509 certificate
binary data in DER (raw) format.

</div>

<div>

## Parameters

<div>

### cert

The X.509 certificate to be verified

</div>

<div>

### cacerts

array of strings containing CA certificates

</div>

<div>

### flags

A string containing comma separated list of verification options. See
table below for valid values.

<div>

**Table 24.116. Values for *`flags `***

<div>

| Option              | Description                                   |
|---------------------|-----------------------------------------------|
| expired             | Do not check for expiration                   |
| self-signed         | Do not treat self signed certificate as error |
| invalid-ca          | Ignore invalid CA                             |
| invalid-purpose     | Ignore invalid certificate purpose            |
| unhandled-extension | Ignore unhandled critical extension           |

</div>

</div>

  

</div>

</div>

<div>

## Return Types

None

</div>

<div>

## Errors

<div>

**Table 24.117. Errors signalled by `x509_certificate_verify `**

<div>

| SQLState                              | Error Code                            | Error Text                                                                   | Description                                                 |
|---------------------------------------|---------------------------------------|------------------------------------------------------------------------------|-------------------------------------------------------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">CR014 </span> | <span class="errortext">Invalid certificate </span>                          | The input can't be decoded as a X.509 certificate           |
| <span class="errorcode">22023 </span> | <span class="errorcode">CR016 </span> | <span class="errortext">Can not allocate a X509 store </span>                |                                                             |
| <span class="errorcode">22023 </span> | <span class="errorcode">CR019 </span> | <span class="errortext">Invalid CA certificate </span>                       | Some of CA certificates can not be loaded due to bad format |
| <span class="errorcode">22023 </span> | <span class="errorcode">CR017 </span> | <span class="errortext">Can not allocate X509 verification context </span>   |                                                             |
| <span class="errorcode">22023 </span> | <span class="errorcode">CR018 </span> | <span class="errortext">Can not initialize X509 verification context </span> |                                                             |
| <span class="errorcode">22023 </span> | <span class="errorcode">CR015 </span> | <span class="errortext">X509 error: \[the verification error text\] </span>  |                                                             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.454. Verification of a X.509 certificate**

<div>

``` programlisting
    SQL> x509_certificate_verify (file_to_string ('keys/srv/cert.cer'), vector (file_to_string ('keys/srv/ca.cer')), 'self-signed');

    Done. -- 29 msec.
    
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_get_certificate_info.html" class="link"
title="get_certificate_info">get_certificate_info()</a>

</div>

</div>
