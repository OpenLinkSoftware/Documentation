<div id="fn_xenc_x509_certificate_serialize" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xenc_X509_certificate_serialize — Exports a X.509 certificate from
user's repository

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xenc_x509_certificate_serialize" class="funcsynopsis">

|                                                     |                         |
|-----------------------------------------------------|-------------------------|
| `varchar `**`xenc_X509_certificate_serialize`**` (` | in `name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xenc_x509_certificate_serialize" class="refsect1">

## Description

This function is used to export X.509 from user's space.

</div>

<div id="params_xenc_x509_certificate_serialize" class="refsect1">

## Parameters

<div id="id119611" class="refsect2">

### name

The name of the key associated with X.509 certificate.

</div>

</div>

<div id="ret_xenc_x509_certificate_serialize" class="refsect1">

## Return Types

The function returns base64 encoded string containing X.509 certificate
in DER (raw) format. Also the certificate will contain the key
associated with it.

</div>

<div id="examples_xenc_x509_certificate_serialize" class="refsect1">

## Examples

<div id="ex_xenc_x509_certificate_serialize" class="example">

**Example 24.455. Exporting a X.509 certificate**

<div class="example-contents">

The example exports a X.509 certificate associated with 'dsa-test' key
from user's space.

``` screen
      ...
      declare x509 varchar;
      x509 := xenc_X509_certificate_serialize ('dsa-test');
      ...
```

</div>

</div>

  

</div>

</div>
