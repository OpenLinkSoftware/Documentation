<div id="fn_bpel_get_var" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

BPEL.BPEL.getVariableData — gets BPEL variable data within \<bpelv:exec
binding="SQL"\> activity

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_getvariabledata_01" class="funcsynopsis">

|                                        |                          |
|----------------------------------------|--------------------------|
| ` `**`BPEL.BPEL.getVariableData`**` (` | in `var_name ` varchar , |
|                                        | in `part ` varchar ,     |
|                                        | in `query ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="params_get_var_03" class="refsect1">

## Parameters

<div id="id130269" class="refsect2">

### var_name

<span class="type">varchar </span> the name of BPEL variable

</div>

<div id="id130273" class="refsect2">

### part

<span class="type">varchar default null </span> the part of BPEL
variable in question.

</div>

<div id="id130277" class="refsect2">

### query

<span class="type">varchar default null</span> XPATH query for selecting
data in the BPEL variable

</div>

</div>

<div id="ret_get_var_01" class="refsect1">

## Return Types

this function returns the selected data from the BPEL variable. This can
be either an XML tree or a varchar or an integer.

</div>

<div id="desc_wsdl_upload_01_01" class="refsect1">

## Description

`BPEL.BPEL.getVariableData ` Returns select by query expression data
from part (if applicable) of the BPEL variable. If the variable is
unknown, or if the XPATH expression signals an error, the appropriate
error is signalled. This procedure may only be used in Virtuoso/PL code
invoked from a BPEL process.

</div>

<div id="examples_getvariabledata_01" class="refsect1">

## Examples

<div id="ex_wsdl_upload_04" class="example">

**Example 24.648. Simple example**

<div class="example-contents">

``` screen
declare city, country varchar;
city := cast (BPEL.BPEL.getVariableData ('request',
        'req_payload',
        '/destRequest/city/text()');
      
```

</div>

</div>

  

</div>

</div>
