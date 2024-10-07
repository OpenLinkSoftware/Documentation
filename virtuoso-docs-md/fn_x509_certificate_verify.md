<div id="fn_x509_certificate_verify" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

x509_certificate_verify — Verifies X.509 certificate

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_x509_certificate_verify" class="funcsynopsis">

|                                             |                          |
|---------------------------------------------|--------------------------|
| `varchar `**`x509_certificate_verify`**` (` | in `cert ` varchar ,     |
|                                             | in `cacerts ` any ,      |
|                                             | in `flags ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_x509_certificate_verify" class="refsect1">

## Description

This function takes a X.509 certificate and verifies it against list of
CA certificates. It checks for various certificate attributes such as
self signed, expiration date etc. If an error is detected it will be
signalled.

The certificates are passed as a strings containing X.509 certificate
binary data in DER (raw) format.

</div>

<div id="params_x509_certificate_verify" class="refsect1">

## Parameters

<div id="id119486" class="refsect2">

### cert

The X.509 certificate to be verified

</div>

<div id="id119489" class="refsect2">

### cacerts

array of strings containing CA certificates

</div>

<div id="id119492" class="refsect2">

### flags

A string containing comma separated list of verification options. See
table below for valid values.

<div id="id119495" class="table">

**Table 24.117. Values for *`flags `***

<div class="table-contents">

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

<div id="ret_x509_certificate_verify" class="refsect1">

## Return Types

None

</div>

<div id="errors_x509_certificate_verify" class="refsect1">

## Errors

<div id="id119524" class="table">

**Table 24.118. Errors signalled by `x509_certificate_verify `**

<div class="table-contents">

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

<div id="examples_x509_certificate_verify" class="refsect1">

## Examples

<div id="ex_x509_certificate_verify" class="example">

**Example 24.454. Verification of a X.509 certificate**

<div class="example-contents">

``` programlisting
    SQL> x509_certificate_verify (file_to_string ('keys/srv/cert.cer'), vector (file_to_string ('keys/srv/ca.cer')), 'self-signed');

    Done. -- 29 msec.
    
```

</div>

</div>

  

</div>

<div id="seealso_x509_certificate_verify" class="refsect1">

## See Also

<a href="fn_get_certificate_info.html" class="link"
title="get_certificate_info">get_certificate_info()</a>

</div>

</div>
