<div>

<div>

</div>

<div>

## Name

dsig_template_ext — Generates a Digital signature template based on a
XML document.

</div>

<div>

## Synopsis

<div>

|                                       |                        |
|---------------------------------------|------------------------|
| `varchar `**`dsig_template_ext`**` (` | in `xdoc ` any ,       |
|                                       | in `tmpl ` varchar ,   |
|                                       | in `wss_ver ` any ,    |
|                                       | in `ns-n ` varchar ,   |
|                                       | in `elm-n ` varchar ,  |
|                                       | in `... ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function is used to generate dynamically a digital signature
template containing references to be signed.

</div>

<div>

## Parameters

<div>

### xdoc

input XML document

</div>

<div>

### tmpl

a string containing base XML template

</div>

<div>

### wss_ver

vector containing WS-Security and WS-Utility version URIs

</div>

<div>

### ns-n

namespace to match

</div>

<div>

### elm-n

element name to match

</div>

</div>

<div>

## Return Types

On success the function will return a string containing a XML template
suitable to pass to the `xenc_encrypt` . The elements matching listed in
*`elm-n`* from namespace URIs in *`ns-n`* and having Id attribute will
be included in the XML signature reference list.

</div>

<div>

## Examples

<div>

**Example 24.453. Making a XML signature template**

<div>

``` screen
create procedure XENC_TEMPLATE (in body varchar, in key_name varchar)
{
  declare tmpl, algo varchar;
  declare ns any;

  -- OASIS WS-Security extensions
  ns := vector (
    'wsse', 'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd',
    'wsu', 'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'
    );

  algo := xenc_get_key_algo (key_name);
  if (algo is null)
    return NULL;

  -- base XML template
  tmpl := sprintf ('<?xml version="1.0" encoding="UTF-8"?>
<Signature xmlns="http://www.w3.org/2000/09/xmldsig#" >
  <SignedInfo>
    <CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#" />
    <SignatureMethod Algorithm="%s" />
  </SignedInfo>
  <SignatureValue></SignatureValue>
  <KeyInfo>
    <KeyName>%s</KeyName>
  </KeyInfo>
</Signature>', algo, key_name);

  return dsig_template_ext (xtree_doc (body), tmpl, ns,
      'http://schemas.xmlsoap.org/soap/envelope/', 'Body',
       -- WS-Addressing
      'http://schemas.xmlsoap.org/ws/2004/03/addressing', 'Action',
      'http://schemas.xmlsoap.org/ws/2004/03/addressing', 'From',
      'http://schemas.xmlsoap.org/ws/2004/03/addressing', 'To',
      'http://schemas.xmlsoap.org/ws/2004/03/addressing', 'MessageID',
      'http://schemas.xmlsoap.org/ws/2004/03/addressing', 'ReplyTo',
      'http://schemas.xmlsoap.org/ws/2004/03/addressing', 'FaultTo',
      'http://schemas.xmlsoap.org/ws/2004/03/addressing', 'RelatesTo'
      );

}
;
```

</div>

</div>

  

</div>

</div>
