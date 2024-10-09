<div>

<div>

</div>

<div>

## Name

BPEL.BPEL.wsdl_upload — Uploads a WSDL description for a given BPEL
script

</div>

<div>

## Synopsis

<div>

|                                    |                                      |
|------------------------------------|--------------------------------------|
| ` `**`BPEL.BPEL.wsdl_upload`**` (` | in `scp_id ` int ,                   |
|                                    | in `url ` varchar ,                  |
|                                    | in `content ` any ,                  |
|                                    | in `pl ` varchar default 'wsdl' `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Parameters

<div>

### scp_id

<span class="type">int </span> the BPEL script identifier

</div>

<div>

### url

<span class="type">varchar </span> the URL to the WSDL description file.

</div>

<div>

### content

<span class="type">any default null </span> the source of the WSDL file,
this can be omitted then the function will try downloading the source
from the URL specified

</div>

<div>

### pl

<span class="type">varchar default 'wsdl' </span> the partner which is
described by given WSDL. When this is a file describing the process
itself the default value MUST be used.

</div>

</div>

<div>

## Return Types

this function has no return value

</div>

<div>

## Description

`BPEL.BPEL.wsdl_upload ` uploads a WSDL description for a given partner
link. The function if content is not specified this will download the
content via the URL specified and will associate it with the specified
partner link. Also after download the WSDL will be expanded to resolve
includes in WSDL and XMLSchema namespaces.

</div>

<div>

## Examples

<div>

**Example 24.647. Simple example**

<div>

``` screen
      SQL> BPEL.BPEL.wsdl_upload (1, 'file:/LoanFlow.wsdl', null, 'wsdl');
          Done. -- 10 msec.
      
```

</div>

</div>

  

</div>

</div>
