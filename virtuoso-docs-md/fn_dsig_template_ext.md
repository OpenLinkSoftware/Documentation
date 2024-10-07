<div id="fn_dsig_template_ext" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

dsig_template_ext — Generates a Digital signature template based on a
XML document.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_dsig_template_ext" class="funcsynopsis">

|                                       |                        |
|---------------------------------------|------------------------|
| `varchar `**`dsig_template_ext`**` (` | in `xdoc ` any ,       |
|                                       | in `tmpl ` varchar ,   |
|                                       | in `wss_ver ` any ,    |
|                                       | in `ns-n ` varchar ,   |
|                                       | in `elm-n ` varchar ,  |
|                                       | in `... ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_dsig_template_ext" class="refsect1">

## Description

The function is used to generate dynamically a digital signature
template containing references to be signed.

</div>

<div id="params_dsig_template_ext" class="refsect1">

## Parameters

<div id="id119436" class="refsect2">

### xdoc

input XML document

</div>

<div id="id119439" class="refsect2">

### tmpl

a string containing base XML template

</div>

<div id="id119442" class="refsect2">

### wss_ver

vector containing WS-Security and WS-Utility version URIs

</div>

<div id="id119445" class="refsect2">

### ns-n

namespace to match

</div>

<div id="id119448" class="refsect2">

### elm-n

element name to match

</div>

</div>

<div id="ret_dsig_template_ext" class="refsect1">

## Return Types

On success the function will return a string containing a XML template
suitable to pass to the `xenc_encrypt` . The elements matching listed in
*`elm-n`* from namespace URIs in *`ns-n`* and having Id attribute will
be included in the XML signature reference list.

</div>

<div id="examples_dsig_template_ext" class="refsect1">

## Examples

<div id="ex_dsig_template_ext" class="example">

**Example 24.453. Making a XML signature template**

<div class="example-contents">

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
