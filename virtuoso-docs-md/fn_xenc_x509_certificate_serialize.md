<div>

<div>

</div>

<div>

## Name

xenc_X509_certificate_serialize — Exports a X.509 certificate from
user's repository

</div>

<div>

## Synopsis

<div>

|                                                     |                         |
|-----------------------------------------------------|-------------------------|
| `varchar `**`xenc_X509_certificate_serialize`**` (` | in `name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to export X.509 from user's space.

</div>

<div>

## Parameters

<div>

### name

The name of the key associated with X.509 certificate.

</div>

</div>

<div>

## Return Types

The function returns base64 encoded string containing X.509 certificate
in DER (raw) format. Also the certificate will contain the key
associated with it.

</div>

<div>

## Examples

<div>

**Example 24.455. Exporting a X.509 certificate**

<div>

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
