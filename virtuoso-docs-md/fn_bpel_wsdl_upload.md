<div id="fn_bpel_wsdl_upload" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

BPEL.BPEL.wsdl_upload — Uploads a WSDL description for a given BPEL
script

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_wsdl_upload_01" class="funcsynopsis">

|                                    |                                      |
|------------------------------------|--------------------------------------|
| ` `**`BPEL.BPEL.wsdl_upload`**` (` | in `scp_id ` int ,                   |
|                                    | in `url ` varchar ,                  |
|                                    | in `content ` any ,                  |
|                                    | in `pl ` varchar default 'wsdl' `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="params_wsdl_upload_01" class="refsect1">

## Parameters

<div id="id130220" class="refsect2">

### scp_id

<span class="type">int </span> the BPEL script identifier

</div>

<div id="id130224" class="refsect2">

### url

<span class="type">varchar </span> the URL to the WSDL description file.

</div>

<div id="id130228" class="refsect2">

### content

<span class="type">any default null </span> the source of the WSDL file,
this can be omitted then the function will try downloading the source
from the URL specified

</div>

<div id="id130232" class="refsect2">

### pl

<span class="type">varchar default 'wsdl' </span> the partner which is
described by given WSDL. When this is a file describing the process
itself the default value MUST be used.

</div>

</div>

<div id="ret_wsdl_upload_01" class="refsect1">

## Return Types

this function has no return value

</div>

<div id="desc_wsdl_upload_03" class="refsect1">

## Description

`BPEL.BPEL.wsdl_upload ` uploads a WSDL description for a given partner
link. The function if content is not specified this will download the
content via the URL specified and will associate it with the specified
partner link. Also after download the WSDL will be expanded to resolve
includes in WSDL and XMLSchema namespaces.

</div>

<div id="examples_wsdl_upload_01" class="refsect1">

## Examples

<div id="ex_wsdl_upload_03" class="example">

**Example 24.647. Simple example**

<div class="example-contents">

``` screen
      SQL> BPEL.BPEL.wsdl_upload (1, 'file:/LoanFlow.wsdl', null, 'wsdl');
          Done. -- 10 msec.
      
```

</div>

</div>

  

</div>

</div>
