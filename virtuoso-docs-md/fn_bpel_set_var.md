<div id="fn_bpel_set_var" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

BPEL.BPEL.setVariableData — sets BPEL variable data within code invoked
from \<bpelv:exec binding="SQL"\> activity

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_setvariabledata_01" class="funcsynopsis">

|                                        |                          |
|----------------------------------------|--------------------------|
| ` `**`BPEL.BPEL.setVariableData`**` (` | in `var_name ` varchar , |
|                                        | in `value ` any ,        |
|                                        | in `part ` varchar ,     |
|                                        | in `query ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="params_set_var_01" class="refsect1">

## Parameters

<div id="id130315" class="refsect2">

### var_name

<span class="type">varchar </span> the name of BPEL variable

</div>

<div id="id130319" class="refsect2">

### value

<span class="type">any </span> the value to be set. Can be XML tree or
varchar

</div>

<div id="id130323" class="refsect2">

### part

<span class="type">varchar default null </span> the part of BPEL
variable in question.

</div>

<div id="id130327" class="refsect2">

### query

<span class="type">varchar default null</span> XPATH query for selecting
data in the BPEL variable

</div>

</div>

<div id="ret_set_var_01" class="refsect1">

## Return Types

this function has no return value.

</div>

<div id="desc_wsdl_upload_04" class="refsect1">

## Description

`BPEL.BPEL.setVariableData ` Sets the data selected by "query" in the
part (named by "part" argument) of the BPEL variable. If there is no
variable with such name or the query contains syntax errors or if its
evaluation signals a run time error, the appropriate error is signalled.
This procedure may only be used in Virtuoso/PL code invoked from a BPEL
process.

</div>

<div id="examples_setvariabledata_01" class="refsect1">

## Examples

<div id="ex_wsdl_upload_05" class="example">

**Example 24.649. Simple example**

<div class="example-contents">

``` screen
declare country any;

...

if (country is null)
  BPEL.BPEL.setVariableData ('res',
    xtree_doc (']]&gt;<destResponse><country>Unknown</country></destResponse><![CDATA['),
    'repl_payload');
 else
  BPEL.BPEL.setVariableData ('res',
    country,
    'repl_payload',
    '/destResponse/country');
      
```

</div>

</div>

  

</div>

</div>
