<div id="fn_get_certificate_info" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

get_certificate_info — Returns information about the current client X509
certificate

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_get_certificate_info" class="funcsynopsis">

|                                                    |                                  |
|----------------------------------------------------|----------------------------------|
| `integer or string `**`get_certificate_info`**` (` | in `type ` integer ,             |
|                                                    | in `cert_or_key_name ` varchar , |
|                                                    | in `in_format ` int ,            |
|                                                    | in `passwd ` varchar ,           |
|                                                    | in `ext_oid ` varchar `)`;       |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_get_certificate_info" class="refsect1">

## Description

This function will return information about the current client X509
certificate (if successfully verified). If there is no valid X509
certificate or the requested information is not available it will return
NULL.

If the optional *`cert_or_key_name`* is supplied it should contain a
encoded certificate (by default format is PEM). The certificate info is
read from the first certificate in that string.

If the optional *`cert_or_key_name`* is supplied and *`in_format`* is
equal to 3 (integer) the function will try to retrieve the certificate
registered in the current user's key store by name contained in
*`cert_or_key_name`* .

</div>

<div id="params_get_certificate_info" class="refsect1">

## Parameters

<div id="id89997" class="refsect2">

### type

type must be an integer. It can be one of the following values:

|                                                                                                |
|------------------------------------------------------------------------------------------------|
| 1 - return the certificate serial number as an integer                                         |
| 2 - return the certificate subject name as a string                                            |
| 3 - return the certificate issuer name as a string                                             |
| 4 - return the certificate validity period start date as a string                              |
| 5 - return the certificate validity period end date as a string                                |
| 6 - return the certificate fingerprint                                                         |
| 7 - return the certificate extension value by OID                                              |
| 8 - return the certificate name of the key from current user store                             |
| 9 - return a vector of three elements: the certificate's public key type, exponent and modulus |
| 10 - return attribute value for given attribute name                                           |
| 12 - return certificate's signature                                                            |

</div>

<div id="id90012" class="refsect2">

### cert_or_key_name

A string containing an encoded X.509 certificate or name of a key from
current user store.

</div>

<div id="id90015" class="refsect2">

### in_format

This is to designate encoding type of the value 'cert_or_key_name'

|                                                                     |
|---------------------------------------------------------------------|
| 0 (default) - PEM                                                   |
| 1 - DER (raw)                                                       |
| 2 - PKCS#12                                                         |
| 3 - the 'cert_or_key_name' is a name of a key from user's key store |

</div>

<div id="id90023" class="refsect2">

### passwd

Password to unlock PKCS#12 encoded certificate

</div>

<div id="id90026" class="refsect2">

### ext_oid

X.509 extension object identifier

</div>

</div>

<div id="ret_get_certificate_info" class="refsect1">

## Return Types

The requested information or NULL if the certificate is found to be
invalid.

</div>

<div id="examples_get_certificate_info" class="refsect1">

## Examples

<div id="ex_get_certificate_info" class="example">

**Example 24.132. Simple examples**

<div class="example-contents">

``` programlisting
CREATE PROCEDURE get_mail_example (in cert any := null, in cert_type int := 0)
{
  declare alts, mail any;
  mail := get_certificate_info (10, cert, cert_type, '', 'emailAddress');
  if (mail is null)
    {
      alts := get_certificate_info (7, cert, cert_type, '', '1.10.16.25');
      if (alts is not null)
    {
      alts := regexp_replace (alts, ',[ ]*', ',', 1, null);
      alts := split_and_decode (alts, 0, '\0\0,:');
      mail := get_keyword ('email', alts);
    }
    }
  return mail;
}
;
```

</div>

</div>

  

</div>

</div>
